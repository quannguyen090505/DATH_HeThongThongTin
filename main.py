# file: main.py
from fastapi import FastAPI, HTTPException
import mysql.connector  # Phải import thư viện này ở đầu file
from database import get_db_connection
from schemas import *

app = FastAPI(title="Hệ Thống F&B API")

# uvicorn main:app --reload


def error_complier(error: mysql.connector):
    error_code = error.errno
    if error_code == 1644:
        message = error.msg
    elif error_code == 3819:
        # Lỗi CHECK Constraint
        if "banan_chk_1" in error.msg:
            message = "Lỗi: Số lượng chỗ ngồi phải lớn hon 0!"
        elif "monduocgoi_chk_2" in error.msg:
            message = "Lỗi: Số lượng món được gọi phải lớn hơn 0."
        elif "nhanvien_chk_1" in error.msg:
            message = "Lỗi: Mức lương phải lớn hơn 0!"
        elif "phieudatban_chk_1" in error.msg:
            message = "Lỗi: Ngày giờ nhận bàn phải sau ngày giờ hiện tại."
        elif "phieunhapkho_chk_1" in error.msg:
            message = "Lỗi: Giá trị phiếu nhập kho phải lớn hơn 0."
    elif error_code == 1062:
        # Lỗi UNIQUE (Trùng lặp)
        message = "Lỗi: Dữ liệu này (SĐT hoặc Email) đã tồn tại trong hệ thống."
    elif error_code == 1452:
        # Lỗi Khóa ngoại (Tham chiếu sai)
        if "banan_ibfk_1" in error.msg:
            message = " Lỗi: Mã chi nhánh không hợp lệ."
        elif "cungcapthucdon_ibfk_1" in error.msg:
            message = "Lỗi: Mã chi nhánh không hợp lệ."
        elif "cungcapthucdon_ibfk_2" in error.msg:
            message = "Lỗi: Mã món ăn không hợp lệ."
        elif "dattruocmon_ibfk_1" in error.msg:
            message = "Lỗi: Mã phiếu đặt bàn không hợp lệ."
        elif "dattruocmon_ibfk_2" in error.msg:
            message = "Lỗi: Mã phiếu gọi món không hợp lệ."
        elif "hoadon_ibfk_1" in error.msg:
            message = "Lỗi: Mã phiếu gọi món không hợp lệ."
        elif "hoadon_ibfk_2" in error.msg:
            message = "Lỗi: Mã nhân viên không hợp lệ."
        elif "monan_ibfk_1" in error.msg:
            message = "Lỗi: Mã thể loại món không hợp lệ."
        elif "goimon_ibfk_1" in error.msg:
            message = "Lỗi: Mã bàn ăn không hợp lệ."
        elif "goimon_ibfk_2" in error.msg:
            message = "Lỗi: Mã phiếu gọi món không hợp lệ."
        elif "nguoiquanly_ibfk_1" in error.msg:
            message = "Lỗi: Mã người quản lý không hợp lệ."
        elif "nhanvien_ibfk_1" in error.msg:
            message = "Lỗi: Mã chi nhánh không hợp lệ."
        elif "phieudatban_ibfk_1" in error.msg:
            message = "Lỗi: Mã bàn ăn không hợp lệ."
        elif "phieudatban_ibfk_2" in error.msg:
            message = "Lỗi: Sđt khách không hợp lệ."
        elif "phieudatban_ibfk_3" in error.msg:
            message = "Lỗi: Mã nhân viên không hợp lệ."
        elif "phieugoimon_ibfk_1" in error.msg:
            message = "Lỗi: Mã bàn ăn không hợp lệ."
        elif "phieugoimon_ibfk_2" in error.msg:
            message = "Lỗi: Mã nhân viên không hợp lệ."
        elif "phieugoimon_ibfk_3" in error.msg:
            message = "Lỗi: Sđt khách không hợp lệ."
        elif "phieunhapkho_ibfk_1" in error.msg:
            message = "Lỗi: Mã nhân viên không hợp lệ."
    else:
        # Bắt các lỗi hệ thống khác
        message = f"Lỗi cơ sở dữ liệu ({error_code}): {error.msg}"
    raise HTTPException(status_code=400, detail=message)


# cac API goi mon
@app.post("/api/khach/goi-mon")
def khach_goi_mon_tai_quan(request: KhachGoiMonTaiQuanRequest):
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
def khach_dat_mon_mang_ve(request: KhachDatMonMangVeRequest):
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


@app.post("/api/nhan-vien/goi-mon")
def nhan_vien_goi_mon(request: NhanVienGoiMonRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "nhan_vien_goi_mon_tai_quan",
            (
                request.ma_ban_an,
                request.ma_mon_an,
                request.so_luong,
                request.ma_nhan_vien,
            ),
        )
        conn.commit()
        return {"status": "success", "message": "Nhân viên đã chốt món thành công!"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()


@app.post("/api/nhan-vien/dat-mon")
def nhan_vien_dat_mon_truoc(request: NhanVienGoiMonRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "nhan_vien_dat_mon_truoc",
            (
                request.ma_phieu_dat_ban,
                request.ma_mon_an,
                request.so_luong,
                request.sdt_khach,
                request.ma_nhan_vien,
            ),
        )
        conn.commit()
        return {"status": "success", "message": "Nhân viên đã chốt món thành công!"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()


# API dat ban
@app.post("/api/nhan-vien/dat-ban")
def tao_phieu_dat_ban(request: DatBanRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "tao_phieu_dat_ban",
            (
                request.ma_ban_an,
                request.ngay_gio_nhan,
                request.sdt_khach,
                request.ma_nhan_vien,
            ),
        )
        conn.commit()
        return {"status": "success", "message": "Đặt bàn thành công!"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()


# API thanh toan
@app.post("/api/nhan-vien/thanh-toan")
def thanh_toan_phieu_goi_mon(request: ThanhToanPhieuGoiMon):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "thanh_toan_phieu_goi_mon",
            (
                request.ma_phieu_goi_mon,
                request.phuong_thuoc_thanh_toan,
                request.ma_nhan_vien,
            ),
        )
        conn.commit()
        return {"status": "success", "message": "thanh toán  thành công!"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()


# cac APi bo sung doi tuong moi
@app.post("/api/quan-ly/them-mon-moi")
def them_mon_moi(request: ThemMonMoi):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "them_mon_moi",
            (
                request.ten_mon,
                request.don_gia,
                request.thong_tin_mo_ta,
                request.ma_the_loai,
                request.ma_chi_nhanh,
            ),
        )
        conn.commit()
        return {"status": "success", "message": "thêm món mới thành công!"}

    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()


@app.post("/api/quan-ly/them-the-loai-mon")
def them_them_loai_mon_moi(request: ThemTheLoaiMon):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "them_the_loai_mon",
            (
                request.ten_the_loai,
                request.thong_tin_mo_ta,
            ),
        )
        conn.commit()
        return {"status": "success", "message": "thêm thể loại món mới thành công"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()


@app.post("/api/quan-ly/them-ban-an")
def them_ban_an(request: ThemBanAn):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "them_ban_an",
            (
                request.ma_chi_nhanh,
                request.so_luong_cho_ngoi,
                request.vi_tri,
            ),
        )
        cursor.commit()
        return {"status": "success", "message": "thêm bàn ăn mới thành công"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()


@app.post("/api/quan-ly/them-chi-nhanh")
def them_chi_nhanh(request: ThemChiNhanh):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "them_chi_nhanh",
            (
                request.dia_chi,
                request.sdt_quan,
                request.email_quan,
                request.gio_mo_cua,
            ),
        )
        cursor.commit()
        return {"status": "success", "message": "thêm chi nhánh mới thành công"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=400, detail=str(e))
    finally:
        cursor.close()
        conn.close()


# cac API truy xuat du lieu
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


@app.get("/api/nhanvien/truy-xuat-phieu-goi-mon/")
def nhan_vien_truy_xuat_phieu_goi_mon(
    ma_ban_an: int, tinh_trang: Optional[str] = None, thanh_toan: Optional[bool] = None
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.callproc(
            "truy_xuat_phieu_goi_mon",
            (
                ma_ban_an,
                tinh_trang,
                thanh_toan,
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
