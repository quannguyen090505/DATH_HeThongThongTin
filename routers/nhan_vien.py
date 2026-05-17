from fastapi import APIRouter, Depends, HTTPException

import mysql.connector
from database import get_db_connection

from schemas import *
from security import kiem_tra_quyen_nhan_vien, verify_password, create_access_token
from utils import error_complier

router = APIRouter(
    prefix="/api/nhan-vien",
    tags=["Nhân viên"],
    dependencies=[Depends(kiem_tra_quyen_nhan_vien)],
)


@router.post("/dang-nhap")
def nhan_vien_dang_nhap(request: DangNhapRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "SELECT MaNhanVien, TenDangNhap, MatKhau FROM NhanVien WHERE sdt = %s",
            (request.sdt,),
        )
        user = cursor.fetchone()
        if not user or not verify_password(request.mat_khau, user["MatKhau"]):
            raise HTTPException(status_code=401, detail="Sai sđt hoặc mật khẩu")
        token = (
            create_access_token(user_id=user["MaNhanVien"], role="NhanVien")
            if user["VaiTro"] != "QuanLy"
            else create_access_token(user_id=user["MaNhanVien"], role="QuanLy")
        )
        return {
            "status": "success",
            "message": "Đăng nhập thành công",
            "access_token": token,
            "token_type": "bearer",
        }
    finally:
        cursor.close()
        conn.close()


@router.post("/goi-mon")
def nhan_vien_goi_mon(
    request: GoiMonRequest,
    ma_nhan_vien: int = Depends(kiem_tra_quyen_nhan_vien),
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "nhan_vien_goi_mon_tai_quan",
            (
                request.ma_ban_an,
                request.ma_mon_an,
                request.so_luong,
                ma_nhan_vien,
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


@router.post("/dat-mon")
def nhan_vien_dat_mon_truoc(
    request: GoiMonRequest,
    ma_nhan_vien: int = Depends(kiem_tra_quyen_nhan_vien),
):
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
                ma_nhan_vien,
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
@router.post("/dat-ban")
def tao_phieu_dat_ban(
    request: DatBanRequest, ma_nhan_vien: int = Depends(kiem_tra_quyen_nhan_vien)
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "tao_phieu_dat_ban",
            (
                request.ma_ban_an,
                request.ngay_gio_nhan,
                request.sdt_khach,
                ma_nhan_vien,
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
@router.post("/thanh-toan")
def thanh_toan_phieu_goi_mon(
    request: ThanhToanPhieuGoiMonRequest,
    ma_nhan_vien: int = Depends(kiem_tra_quyen_nhan_vien),
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "thanh_toan_phieu_goi_mon",
            (
                request.ma_phieu_goi_mon,
                request.phuong_thuoc_thanh_toan,
                ma_nhan_vien,
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


@router.get("/truy-xuat-phieu-goi-mon/")
def nhan_vien_truy_xuat_phieu_goi_mon(
    ma_ban_an: Optional[int] = None,
    tinh_trang_phieu: Optional[str] = None,
    thanh_toan: Optional[bool] = None,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.callproc(
            "truy_xuat_phieu_goi_mon",
            (
                ma_ban_an,
                tinh_trang_phieu,
                thanh_toan,
            ),
        )
        danh_sach_mon = []
        for result in cursor.stored_results():
            danh_sach_mon = result.fetchall()
        if not danh_sach_mon:
            return {
                "status": "success",
                "message": "Danh sách phiếu gọi món trống ",
                "data": [],
            }

        return {
            "status": "success",
            "ma_ban_an": ma_ban_an,
            "tong_tien": sum(mon["ThanhTien"] for mon in danh_sach_mon),
            "data": danh_sach_mon,
        }

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()
