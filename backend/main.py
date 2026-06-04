from fastapi import FastAPI, HTTPException, Depends
from fastapi.security import HTTPBearer
import mysql.connector  # Phải import thư viện này ở đầu file
from database import get_db_connection
from schemas import *
from security import verify_password, create_access_token, get_password_hash
from fastapi.middleware.cors import CORSMiddleware
from utils import error_complier
from routers import quan_ly, nhan_vien

app = FastAPI(title="Hệ Thống F&B API")
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],  # Chỉ cho phép cổng 5173 của React gọi vào
    allow_credentials=True,
    allow_methods=["*"],  # Cho phép tất cả các lệnh GET, POST, PUT, DELETE
    allow_headers=["*"],  # Cho phép mọi loại Header (bao gồm cả Header chứa Token)
)


app.include_router(quan_ly.router)
app.include_router(nhan_vien.router)

# uvicorn main:app --reload
# API bao mat


@app.post("/api/khach-dang-nhap") 
def khach_dang_nhap(request: DangNhapRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("Select SDT from khach where SDT=%s", (request.sdt,))
        result = cursor.fetchone()
        if not result:
            raise HTTPException(status_code=401, detail="Số điện thoại chưa đăng ký")
        token = create_access_token(user_id=result["SDT"], role="Khach")
        return {
            "status": "success",
            "message": "Đăng nhập thành công",
            "access_token": token,
            "sdt_khach": request.sdt,
            "token_type": "bearer",
        }
    finally:
        cursor.close()
        conn.close()


@app.post("/api/nhan-vien-dang-nhap")  # nhan vien dang nhap su dung pass nhanvien123
def nhan_vien_dang_nhap(request: DangNhapRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "SELECT MaNhanVien, VaiTro, MatKhau, MaChiNhanh FROM nhanvien WHERE sdt = %s",
            (request.sdt,),
        )
        user = cursor.fetchone()
        if not user:
            raise HTTPException(status_code=401, detail="Sai sđt")
        if not verify_password(request.mat_khau, user["MatKhau"]):
            raise HTTPException(status_code=401, detail="Sai mật khẩu")
        token = (
            create_access_token(user_id=user["MaNhanVien"], role="NhanVien")
            if user["VaiTro"] == "NhanVien"
            else create_access_token(user_id=user["MaNhanVien"], role="QuanLy")
        )
        return {
            "status": "success",
            "message": "Đăng nhập thành công",
            "access_token": token,
            "ma_nv": user["MaNhanVien"],
            "ma_chi_nhanh":user["MaChiNhanh"],
            "token_type": "bearer",
        }
    finally:
        cursor.close()
        conn.close()


@app.post("/api/tao-tai-khoan-khach")
def tao_tai_khoan_khach(request:TaoTaiKhoanRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = """
            insert into khach(SDT,HoTen)
            values(%s,%s)
        """
        val = (request.sdt, request.ho_ten)
        cursor.execute(sql, val)
        conn.commit()
        return {"status": "success", "message": "Tạo tài khoản thành công"}
    except Exception as e:
        conn.rollback()
        error_complier(e)   
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


@app.get("/api/kiem-tra-sdt-khach/{sdt_khach}")
def kiem_tra_sdt(sdt_khach: str):
    conn = get_db_connection()
    if not conn:
        raise HTTPException(status_code=500, detail="Lỗi kết nối Database")
    try:
        cursor = conn.cursor()
        cursor.execute("select 1 from khach where SDT=%s;", (sdt_khach,))
        result = cursor.fetchone()
        if not result:
            return {"status": "success", "data": 0}
        return {"status": "success", "data": 1}
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


@app.post("/api/khach/dat-mang-ve")
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

@app.post("/api/khach/yeu-cau-thanh-toan")
def khach_yeu_cau_thanh_toan(request:ThanhToanRequest):
    conn = get_db_connection()
    if not conn:
        raise HTTPException(status_code=500, detail="Lỗi kết nối Database")
    try:
        cursor = conn.cursor(dictionary=True)
        sql="""
            SELECT P.MaPhieuGoiMon 
            FROM PhieuGoiMon P LEFT JOIN HoaDon HD on P.MaPhieuGoiMon = HD.MaPhieuGoiMon
            WHERE P.SDTKhach = %s AND HD.MaHoaDon IS NULL
            LIMIT 1;
        """
        cursor.execute(sql, (request.sdt_khach,),)
        result=cursor.fetchone()
        if not result:
            raise HTTPException(status_code=404, detail="Không tìm thấy phiếu gọi món")
        ma_phieu_goi_mon = result["MaPhieuGoiMon"]
        cursor.execute("update PhieuGoiMon set TinhTrang='YeuCauThanhToan' where MaPhieuGoiMon=%s", (ma_phieu_goi_mon,))
        conn.commit()
        return {
            "status": "success",
            "message": "Đã gửi yêu cầu thanh toán",
        }

    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

# cac APi CRUD với các đối tượng
# món ăn
@app.get("/api/thong-tin-thuc-don")
def thuc_don(ma_chi_nhanh: Optional[int]=None,ma_mon_an:Optional[int]=None):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "select MaMon AS MaMonAn, TenMon, NULL AS HinhAnh, ThongTinMon, MaTheLoai, TenTheLoai, DonGia, 1 AS CoSan from dsmonan where (%s is null or MaChiNhanh=%s) and (%s is null or MaMon=%s)",
            (ma_chi_nhanh,ma_chi_nhanh,ma_mon_an,ma_mon_an),
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

@app.get("/api/thong-tin-the-loai-mon")
def thong_tin_the_loai_mon(ma_chi_nhanh:Optional[int]=None,ma_the_loai: Optional[int]=None):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "SELECT distinct MaTheLoai,TenTheLoai,ThongTinTheLoai FROM dsmonan WHERE (%s is null or MaChiNhanh = %s)and(%s is null or MaTheLoai=%s);",
            (ma_chi_nhanh,ma_chi_nhanh,ma_the_loai,ma_the_loai,),
        )
        result = cursor.fetchall()
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
            "select MaBan,SoLuongChoNgoi, Vitri,TinhTrangSuDung from banan where MabanAn=%s and MaChiNhanh=%s",
            (ma_ban_an, ma_chi_nhanh),
        )
        result = cursor.fetchone()
        if not result:
            raise HTTPException(
                status_code=404, detail="Mã bàn ăn hoặc mã chi nhánh không hợp lệ"
            )
        return {"status": "success", "data": result}
    finally:
        cursor.close()
        conn.close()

# cac API truy xuat du lieu
@app.get("/api/ds-ban-an/{ma_chi_nhanh}")
def danh_sach_ban_an(ma_chi_nhanh: int): #ma_chi_nhanh: Optional[int]=None
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "select MaBan, SoLuongChoNgoi,ViTri,TinhTrangSuDung, CoSan from dsbanan where MaChiNhanh=%s;", #(%s is null or %s=MaChiNhanh)
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

@app.get("/api/thong-tin-chi-nhanh/")
def thong_tin_chi_nhanh(ma_chi_nhanh:Optional[int]=None):
    conn=get_db_connection()
    try:
        cursor=conn.cursor(dictionary=True)
        cursor.execute("select * from chinhanh where (%s is null or MaChiNhanh=%s);",(ma_chi_nhanh,ma_chi_nhanh))
        result=cursor.fetchall()
        if not result:
            return {"status":"success","message":"danh sách chi nhanh trống"}
        return {"status": "success", "data":result}
    except HTTPException as e:
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
