from fastapi import APIRouter, HTTPException, Depends
from typing import Optional
from database import get_db_connection
from schemas import *
from utils import error_complier

router = APIRouter(
    prefix="/api/crud-co-ban",
    tags=["CRUD Bổ Sung (Raw SQL)"]
)

# =====================================================================
# 1. CHI NHÁNH (Bảng: chinhanh)
# =====================================================================

@router.post("/chi-nhanh")
def create_chi_nhanh(request: ChiNhanhRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = "INSERT INTO chinhanh (DiaChi, GioMoCua, CoSan) VALUES (%s, %s, 1)"
        cursor.execute(sql, (request.dia_chi, request.gio_mo_cua))
        conn.commit()
        return {"status": "success", "message": "Thêm chi nhánh thành công", "ma_chi_nhanh": cursor.lastrowid}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.get("/chi-nhanh")
def read_chi_nhanh(ma_chi_nhanh: Optional[int] = None):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        if ma_chi_nhanh:
            cursor.execute("SELECT * FROM chinhanh WHERE MaChiNhanh = %s AND CoSan = 1", (ma_chi_nhanh,))
            result = cursor.fetchone()
        else:
            cursor.execute("SELECT * FROM chinhanh WHERE CoSan = 1")
            result = cursor.fetchall()
        return {"status": "success", "data": result}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.put("/chi-nhanh/{id}")
def update_chi_nhanh(id: int, request: ChiNhanhRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = "UPDATE chinhanh SET DiaChi = %s, GioMoCua = %s WHERE MaChiNhanh = %s"
        cursor.execute(sql, (request.dia_chi, request.gio_mo_cua, id))
        conn.commit()
        return {"status": "success", "message": "Cập nhật chi nhánh thành công"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.delete("/chi-nhanh/{id}")
def delete_chi_nhanh(id: int):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = "UPDATE chinhanh SET CoSan = 0 WHERE MaChiNhanh = %s"
        cursor.execute(sql, (id,))
        conn.commit()
        return {"status": "success", "message": "Xóa mềm (ẩn) chi nhánh thành công"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()


# =====================================================================
# 2. PHIẾU GỌI MÓN/GÓI (Bảng: phieugoimon)
# =====================================================================

@router.post("/phieu-goi-mon")
def create_phieu_goi_mon(request: PhieuGoiMonCRUDRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = """INSERT INTO phieugoimon 
                 (NgayGioTaoPhieu, MaBanAn, PhuongThucDungMon, TinhTrang, SDTKhach, MaNhanVienPhucVu, CoSan) 
                 VALUES (NOW(), %s, %s, %s, %s, %s, 1)"""
        cursor.execute(sql, (request.ma_ban_an, request.phuong_thuc_dung_mon, request.tinh_trang, request.sdt_khach, request.ma_nhan_vien_phuc_vu))
        conn.commit()
        return {"status": "success", "message": "Tạo phiếu gọi món thành công", "ma_phieu_goi_mon": cursor.lastrowid}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.get("/phieu-goi-mon")
def read_phieu_goi_mon(ma_phieu: Optional[int] = None):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        if ma_phieu:
            cursor.execute("SELECT * FROM phieugoimon WHERE MaPhieuGoiMon = %s AND CoSan = 1", (ma_phieu,))
            result = cursor.fetchone()
        else:
            cursor.execute("SELECT * FROM phieugoimon WHERE CoSan = 1 ORDER BY NgayGioTaoPhieu DESC")
            result = cursor.fetchall()
        return {"status": "success", "data": result}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.put("/phieu-goi-mon/{id}")
def update_phieu_goi_mon(id: int, request: PhieuGoiMonCRUDRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = """UPDATE phieugoimon 
                 SET MaBanAn = %s, PhuongThucDungMon = %s, TinhTrang = %s, SDTKhach = %s, MaNhanVienPhucVu = %s 
                 WHERE MaPhieuGoiMon = %s"""
        cursor.execute(sql, (request.ma_ban_an, request.phuong_thuc_dung_mon, request.tinh_trang, request.sdt_khach, request.ma_nhan_vien_phuc_vu, id))
        conn.commit()
        return {"status": "success", "message": "Cập nhật phiếu gọi món thành công"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.delete("/phieu-goi-mon/{id}")
def delete_phieu_goi_mon(id: int):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = "UPDATE phieugoimon SET CoSan = 0 WHERE MaPhieuGoiMon = %s"
        cursor.execute(sql, (id,))
        conn.commit()
        return {"status": "success", "message": "Xóa mềm phiếu gọi món thành công"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()


# =====================================================================
# 3. PHIẾU ĐẶT BÀN (Bảng: phieudatban)
# =====================================================================

@router.post("/phieu-dat-ban")
def create_phieu_dat_ban(request: PhieuDatBanCRUDRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = """INSERT INTO phieudatban 
                 (NgayGioTaoPhieu, MaBanAn, NgayGioNhanBan, TinhTrang, TienCoc, SDTKhach, MaNhanVienPhucVu, CoSan) 
                 VALUES (NOW(), %s, %s, %s, %s, %s, %s, 1)"""
        cursor.execute(sql, (request.ma_ban_an, request.ngay_gio_nhan_ban, request.tinh_trang, request.tien_coc, request.sdt_khach, request.ma_nhan_vien_phuc_vu))
        conn.commit()
        return {"status": "success", "message": "Tạo phiếu đặt bàn thành công", "ma_phieu_dat_ban": cursor.lastrowid}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.get("/phieu-dat-ban")
def read_phieu_dat_ban(ma_phieu: Optional[int] = None):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        if ma_phieu:
            cursor.execute("SELECT * FROM phieudatban WHERE MaPhieuDatBan = %s AND CoSan = 1", (ma_phieu,))
            result = cursor.fetchone()
        else:
            cursor.execute("SELECT * FROM phieudatban WHERE CoSan = 1 ORDER BY NgayGioNhanBan ASC")
            result = cursor.fetchall()
        return {"status": "success", "data": result}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.put("/phieu-dat-ban/{id}")
def update_phieu_dat_ban(id: int, request: PhieuDatBanCRUDRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = """UPDATE phieudatban 
                 SET MaBanAn = %s, NgayGioNhanBan = %s, TinhTrang = %s, TienCoc = %s, SDTKhach = %s, MaNhanVienPhucVu = %s 
                 WHERE MaPhieuDatBan = %s"""
        cursor.execute(sql, (request.ma_ban_an, request.ngay_gio_nhan_ban, request.tinh_trang, request.tien_coc, request.sdt_khach, request.ma_nhan_vien_phuc_vu, id))
        conn.commit()
        return {"status": "success", "message": "Cập nhật phiếu đặt bàn thành công"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.delete("/phieu-dat-ban/{id}")
def delete_phieu_dat_ban(id: int):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        # Nghiệp vụ yêu cầu chuyển TinhTrang thành 'HuyDatBan' kết hợp ẩn đi
        sql = "UPDATE phieudatban SET TinhTrang = 'HuyDatBan', CoSan = 0 WHERE MaPhieuDatBan = %s"
        cursor.execute(sql, (id,))
        conn.commit()
        return {"status": "success", "message": "Hủy đặt bàn và xóa mềm thành công"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()


# =====================================================================
# 4. PHIẾU NHẬP KHO (Bảng: phieunhapkho)
# =====================================================================

@router.post("/phieu-nhap-kho")
def create_phieu_nhap_kho(request: PhieuNhapKhoRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = """INSERT INTO phieunhapkho (NgayGioTaoPhieu, MaNhanVienKiemToan, GiaTri, ThongTinGhiChu, CoSan) 
                 VALUES (NOW(), %s, %s, %s, 1)"""
        cursor.execute(sql, (request.ma_nhan_vien_kiem_toan, request.gia_tri, request.thong_tin_ghi_chu))
        conn.commit()
        return {"status": "success", "message": "Tạo phiếu nhập kho thành công", "ma_nhap_kho": cursor.lastrowid}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.get("/phieu-nhap-kho")
def read_phieu_nhap_kho(ma_nhap_kho: Optional[int] = None):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        if ma_nhap_kho:
            cursor.execute("SELECT * FROM phieunhapkho WHERE MaNhapKho = %s AND CoSan = 1", (ma_nhap_kho,))
            result = cursor.fetchone()
        else:
            cursor.execute("SELECT * FROM phieunhapkho WHERE CoSan = 1 ORDER BY NgayGioTaoPhieu DESC")
            result = cursor.fetchall()
        return {"status": "success", "data": result}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.put("/phieu-nhap-kho/{id}")
def update_phieu_nhap_kho(id: int, request: PhieuNhapKhoRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = "UPDATE phieunhapkho SET MaNhanVienKiemToan = %s, GiaTri = %s, ThongTinGhiChu = %s WHERE MaNhapKho = %s"
        cursor.execute(sql, (request.ma_nhan_vien_kiem_toan, request.gia_tri, request.thong_tin_ghi_chu, id))
        conn.commit()
        return {"status": "success", "message": "Cập nhật phiếu nhập kho thành công"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.delete("/phieu-nhap-kho/{id}")
def delete_phieu_nhap_kho(id: int):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = "UPDATE phieunhapkho SET CoSan = 0 WHERE MaNhapKho = %s"
        cursor.execute(sql, (id,))
        conn.commit()
        return {"status": "success", "message": "Xóa mềm phiếu nhập kho thành công"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()


# =====================================================================
# 5. DANH MỤC MÓN ĐƯỢC GỌI (Bảng: monduocgoi)
# =====================================================================

@router.post("/mon-duoc-goi")
def create_mon_duoc_goi(request: MonDuocGoiRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        # Sử dụng khóa chính mới MaGoiMon tự tăng
        sql = """INSERT INTO monduocgoi (MaPhieuGoiMon, MaMonAn, SoLuong, DonGiaMon, TinhTrang, CoSan) 
                 VALUES (%s, %s, %s, %s, %s, 1)"""
        cursor.execute(sql, (request.ma_phieu_goi_mon, request.ma_mon_an, request.so_luong, request.don_gia_mon, request.tinh_trang))
        conn.commit()
        return {"status": "success", "message": "Thêm món vào danh mục thành công", "ma_goi_mon": cursor.lastrowid}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.get("/mon-duoc-goi")
def read_mon_duoc_goi(ma_goi_mon: Optional[int] = None, ma_phieu_goi_mon: Optional[int] = None):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        if ma_goi_mon:
            cursor.execute("SELECT * FROM monduocgoi WHERE MaGoiMon = %s AND CoSan = 1", (ma_goi_mon,))
            result = cursor.fetchone()
        elif ma_phieu_goi_mon:
            cursor.execute("SELECT * FROM monduocgoi WHERE MaPhieuGoiMon = %s AND CoSan = 1", (ma_phieu_goi_mon,))
            result = cursor.fetchall()
        else:
            cursor.execute("SELECT * FROM monduocgoi WHERE CoSan = 1")
            result = cursor.fetchall()
        return {"status": "success", "data": result}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.put("/mon-duoc-goi/{id}")
def update_mon_duoc_goi(id: int, request: MonDuocGoiRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = """UPDATE monduocgoi 
                 SET MaPhieuGoiMon = %s, MaMonAn = %s, SoLuong = %s, DonGiaMon = %s, TinhTrang = %s 
                 WHERE MaGoiMon = %s"""
        cursor.execute(sql, (request.ma_phieu_goi_mon, request.ma_mon_an, request.so_luong, request.don_gia_mon, request.tinh_trang, id))
        conn.commit()
        return {"status": "success", "message": "Cập nhật danh mục món gọi thành công"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()

@router.delete("/mon-duoc-goi/{id}")
def delete_mon_duoc_goi(id: int):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = "UPDATE monduocgoi SET CoSan = 0 WHERE MaGoiMon = %s"
        cursor.execute(sql, (id,))
        conn.commit()
        return {"status": "success", "message": "Xóa mềm món ăn khỏi danh mục thành công"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()