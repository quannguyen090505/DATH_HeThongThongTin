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


@router.post("/goi-mon")
def nhan_vien_goi_mon(
    request: GoiMonRequest,
    ma_nhan_vien: int = Depends(kiem_tra_quyen_nhan_vien),
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "nhan_vien_goi_mon",
            (
                request.ma_ban_an,
                request.ma_chi_nhanh,
                request.sdt_khach,
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

@router.post("/dat-mon-truoc")
def nhan_vien_dat_mon_truoc(
    request: GoiMonRequest,
    ma_nhan_vien: int = Depends(kiem_tra_quyen_nhan_vien),
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc(
            "nhan_vien_dat_truoc_mon",
            (
                request.ma_phieu_dat_ban,
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

@router.put("/chinh-sua-phieu-goi-mon")
def chinh_sua_phieu_goi_mon(
    request: ChinhSuaPhieuGoiMonRequest,
    _= Depends(kiem_tra_quyen_nhan_vien)
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(
            "UPDATE phieugoimon SET SDTKhach = %s WHERE MaPhieuGoiMon = %s",
            (request.sdt_khach, request.ma_phieu_goi_mon)
        )
        conn.commit()
        return {"status": "success", "message": "Cập nhật SĐT khách thành công!"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.get("/truy-xuat-phieu-goi-mon")
def nhan_vien_truy_xuat_phieu_goi_mon(
    ma_ban_an: Optional[int] = None,
    sdt_khach:Optional[str]=None,
    tinh_trang_phieu: Optional[str] = None,
    thanh_toan: Optional[bool] = None,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.callproc(
            "nv_truy_xuat_phieu_goi_mon",
            (
                ma_ban_an,
                sdt_khach,
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

@router.post("/xac-nhan-goi-mon")
def xac_nhan_yeu_cau_goi_mon(request:XacNhanPhieuGoiMonRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.callproc("nhan_vien_xac_nhan_yeu_cau_goi_mon", (request.ma_phieu_goi_mon,))
        conn.commit()
        return {"status": "success", "message": "Đã chuyển yêu cầu xuống bếp!"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.patch("/cap-nhat-trang-thai-goi-mon")
def cap_nhat_trang_thai_goi_mon(request:MonDuocGoiRequest):
    conn=get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute("update monduocgoi set tinhtrang=%s where MaPhieuGoiMon=%s and MaGoiMon=%s order by MaGoiMon desc limit 1;",
                        (request.tinh_trang,request.ma_phieu_goi_mon,request.ma_goi_mon,))
        conn.commit()
        return {"status": "success", "message": "Đã phục vụ món"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.post("/dat-ban-an")
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
        ma_phieu_dat_ban = None
        for res in cursor.stored_results():
            row = res.fetchone()
            if row:
                ma_phieu_dat_ban = row[0]
        conn.commit()
        if not ma_phieu_dat_ban:
            raise Exception("Không thể lấy được Mã Phiếu Đặt Bàn từ Database!")
        return {"status": "success", "message": "Đặt bàn thành công!", "ma_phieu_dat_ban":ma_phieu_dat_ban,}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.put("/chinh-sua-phieu-dat-ban")
def chinh_sua_phieu_dat_ban(
    request: ChinhSuaPhieuDatBanRequest,
    _= Depends(kiem_tra_quyen_nhan_vien)
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(
            "UPDATE phieudatban SET SDTKhach = %s, NgayGioNhanBan = %s ,MaBanAn=%s WHERE MaPhieuDatBan = %s",
            (request.sdt_khach, request.ngay_gio_nhan, request.ma_ban_an, request.ma_phieu_dat_ban,)
        )
        conn.commit()
        return {"status": "success", "message": "Cập nhật thông tin Phiếu đặt bàn thành công!"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.get("/truy-xuat-phieu-dat-ban")
def nhan_vien_truy_xuat_phieu_dat_ban(ma_ban_an:Optional[int]=None):
    conn=get_db_connection()
    try:
        cursor=conn.cursor(dictionary=True)
        sql = (
            "SELECT * "
            "FROM chitietphieudatban "
            "WHERE (%s is null or MaBanAn=%s) AND date(NgayGioNhanBan)=date(now());"
        )
        cursor.execute(sql, (ma_ban_an,ma_ban_an,))
        danh_sach_phieu = cursor.fetchall()
        if not danh_sach_phieu:
            return {
                "status": "success",
                "message": "Chưa có phiếu đặt bàn",
                "data": []
            }
        return {
            "status": "success",
            "data": danh_sach_phieu,
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.patch("/cap-nhat-trang-thai-phieu-dat-ban/{ma_phieu_dat_ban}")
def cap_nhat_trang_thai_phieu_dat_ban(
    ma_phieu_dat_ban: int, 
    tinh_trang: str, 
    _: int = Depends(kiem_tra_quyen_nhan_vien)
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(
            "UPDATE phieudatban SET TinhTrang = %s WHERE MaPhieuDatBan = %s",
            (tinh_trang, ma_phieu_dat_ban)
        )
        if tinh_trang == "DaNhanBan":
            cursor.execute(
                "UPDATE banan SET TinhTrangSuDung = 'DangSuDung' WHERE MaBan = (SELECT MaBanAn FROM phieudatban WHERE MaPhieuDatBan = %s)",
                (ma_phieu_dat_ban,)
            )
        conn.commit()
        return {"status": "success", "message": f"Cập nhật trạng thái phiếu thành {tinh_trang} thành công!"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.patch("/thay-doi-trang-thai-ban-an/{ma_ban_an}")
def thay_doi_trang_thai_ban_an(
    ma_ban_an: int,
    trang_thai:str,
    _: int = Depends(kiem_tra_quyen_nhan_vien)
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(
            "UPDATE banan SET TinhTrangSuDung = %s WHERE MaBan = %s",
            (trang_thai,ma_ban_an,)
        )
        conn.commit()
        return {"status": "success", "message": "Xác nhận dọn bàn thành công!"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.post("/thuc-hien-thanh-toan")
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
                request.phuong_thuc_thanh_toan,
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

@router.get("/truy-xuat-hoa-don")
def truy_xuat_hoa_don(
    ma_phieu_goi_mon:int,
    _= Depends(kiem_tra_quyen_nhan_vien),
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True,buffered=True)
        cursor.execute(
            "select * from hoadon where MaPhieuGoiMon=%s;",(ma_phieu_goi_mon,),
        )
        hoa_don=cursor.fetchone()
        return {"status": "success", "data":hoa_don}
    except Exception as e:
        error_complier(e)
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.post("/xac-nhan-thanh-toan")
def xac_nhan_thanh_toan(
    ma_phieu_goi_mon:int,
    _= Depends(kiem_tra_quyen_nhan_vien),
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute("update hoadon set XacNhanThanhToan=1 where MaPhieuGoiMon=%s",(ma_phieu_goi_mon,),)
        conn.commit()
        return {"status": "success", "message": "Đã xác nhận thanh toán"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()
