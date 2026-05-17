from fastapi import FastAPI, HTTPException, Depends
from fastapi.security import HTTPBearer
import mysql.connector  # Phải import thư viện này ở đầu file
from database import get_db_connection
from schemas import *
from security import verify_password, create_access_token, get_password_hash

from routers import quan_ly, nhan_vien

app = FastAPI(title="Hệ Thống F&B API")
app.include_router(quan_ly.router)
app.include_router(nhan_vien.router)

# uvicorn routers/main:app --reload

# API bao mat


@app.post("/api/khach/dang-nhap")
def khach_dang_nhap(request: DangNhapRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute("Select SDT, MatKhau from Khach where SDT=%s", (request.sdt,))
        user = cursor.fetchone()
        if not user or not verify_password(request.mat_khau, user["MatKhau"]):
            raise HTTPException(status_code=401, detail="Sai sđt hoặc mật khẩu")
        token = create_access_token(user_id=user["SDT"], role="Khach")
        return {
            "status": "success",
            "message": "Đăng nhập thành công",
            "access_token": token,
            "token_type": "bearer",
        }
    finally:
        cursor.close()
        conn.close()


security = HTTPBearer()
SECRET_KEY = "dath_hethongthongtin"
ALGORITHM = "HK252"


@app.post("/api/tao-tai-khoan-khach")
def tao_tai_khoan_khach(
    request: TaoTaiKhoanRequest,
    ho_ten: Optional[str] = None,
):
    conn = get_db_connection
    try:
        cursor = conn.cursor()
        hashed_pw = get_password_hash(request.mat_khau)
        sql = """
            insert into Khach(SDT,MatKhau)
            values(%s,%s,%s,%s,%s,%s,%s)
        """
        val = (ho_ten, request.sdt, request.mat_khau)
        cursor.execute(sql, val)
        conn.commit()
        return {"status": "success", "message": "Tạo tài khoản thành công"}
    except mysql.connector.Error as e:
        conn.rollback()
        if e.errno == 1062:
            raise HTTPException(
                status_code=400, detail="Số điện thoại này đã được đăng ký!"
            )
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()


# cac API goi mon
@app.post("/api/khach/goi-mon")
def khach_goi_mon_tai_quan(request: GoiMonRequest):
    conn = get_db_connection()
    if not conn:
        raise HTTPException(status_code=500, detail="Lỗi kết nối Database")

    try:
        cursor = conn.cursor()
        cursor.callproc(
            "khach_goi_mon_tai_quan",
            (request.ma_ban_an, request.ma_mon_an, request.so_luong, request.sdt_khach),
        )
        conn.commit()
        return {
            "status": "success",
            "message": "Gọi món thành công, Bếp đang chuẩn bị!",
        }

    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()


@app.post("/app/khach/dat-mang-ve")
def khach_dat_mon_mang_ve(request: GoiMonRequest):
    conn = get_db_connection()
    if not conn:
        raise HTTPException(status_code=500, detail="Lỗi kết nối Database")
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "khach_dat_mon_mang_ve",
            (request.sdt_khach, request.ma_mon_an, request.so_luong),
        )
        conn.commit()
        return {
            "status": "success",
            "message": "Gọi món thành công, Bếp đang chuẩn bị!",
        }

    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()


# cac APi CRUD với các đối tượng
# món ăn
@app.get("/api/thong-tin-mon/{ma_chi_nhanh}/{ma_mon}")
def thong_tin_mon(ma_chi_nhanh: int, ma_mon: int):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "SELECT TenMon,DonGia,ThongTinMon,TenTheLoai FROM ds_mon_an WHERE MaMon=%s and MaChiNhanh=%s;",
            (ma_mon, ma_chi_nhanh),
        )
        result = cursor.fetchone()
        if not result:
            conn.rollback()
            raise HTTPException(status_code=404, detail="Mã món không hợp lệ")
        return {"status": "success", "data": result}
    finally:
        cursor.close()
        conn.close()


@app.get("/api/thong-tin-the-loai-mon/{ma_the_loai}")
def thong_tin_the_loai_mon(ma_the_loai: int):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "SELECT TentheLoai,ThongTinMoTa FROM TheLoaiMon WHERE MaTheLoai=%s;",
            (ma_the_loai,),
        )
        result = cursor.fetchone()
        if not result:
            conn.rollback()
            raise HTTPException(status_code=404, detail="Mã thể loại không hợp lệ")
        return {"status": "success", "data": result}
    finally:
        cursor.close()
        conn.close()


@app.get("/api/thong_tin_ban_an/{ma_chi_nhanh}/{ma_ban_an}")
def thong_tin_ban_an(ma_chi_nhanh: int, ma_ban_an: int):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "select MaBan,SoLuongChoNgoi, Vitri,TinhTrangSuDung from BanAn where MabanAn=%s and MaChiNhanh=%s",
            (ma_ban_an, ma_chi_nhanh),
        )
        result = cursor.fetchone()
        if not result:
            conn.rollback()
            raise HTTPException(
                status_code=404, detail="Mã bàn ăn hoặc mã chi nhánh không hợp lệ"
            )
        return {"status": "success", "data": result}
    finally:
        cursor.close()
        conn.close()


# cac API truy xuat du lieu
@app.get("/api/ds-ban-an/{ma_chi_nhanh}")
def danh_sach_ban_an(ma_chi_nhanh: int):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "select MaBan, SoLuongChoNgoi,ViTri,TinhTrangSuDung from DsBanAn where MaChiNhanh=%s;",
            (ma_chi_nhanh,),
        )
        result = cursor.fetchall()
        if not result:
            return {"status": "success", "message": "Danh sách bàn trống", "data": []}
        return {
            "status": "success",
            "ma_chi_nhanh": ma_chi_nhanh,
            "data": result,
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()


@app.get("/api/thuc-don/{ma_chi_nhanh}")
def thuc_don(ma_chi_nhanh: int):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "select TenMon,DonGia from DsMonAn where MaChiNhanh=%s", (ma_chi_nhanh,)
        )
        result = cursor.fetchall()
        if not result:
            return {"status": "success", "message": "Thực đơn trống"}
        return {"status": "success", "ma_chi_nhanh": ma_chi_nhanh, "data": result}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()


@app.get("/api/khach/ban/{ma_ban_an}/truy-xuat-phieu-goi-mon")
def khach_truy_xuat_phieu_goi_mon(ma_ban_an: int):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.callproc(
            "truy_xuat_phieu_goi_mon",
            (
                ma_ban_an,
                None,
                False,
            ),
        )
        danh_sach_mon = []
        for result in cursor.stored_results():
            danh_sach_mon = result.fetchall()
        if not danh_sach_mon:
            return {
                "status": "success",
                "message": "Phiếu này trống hoặc không tồn tại",
                "data": [],
            }

        return {
            "status": "success",
            "ma_phieu": ma_ban_an,
            "tong_tien": sum(mon["ThanhTien"] for mon in danh_sach_mon),
            "data": danh_sach_mon,
        }

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()
