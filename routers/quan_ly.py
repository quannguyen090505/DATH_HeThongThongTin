from fastapi import APIRouter, HTTPException, Depends

import mysql.connector  # Phải import thư viện này ở đầu file
from database import get_db_connection

from schemas import *
from security import kiem_tra_quyen_quan_ly, get_password_hash
from utils import error_complier

router = APIRouter(
    prefix="/api/quan-ly",
    tags=["Quản Lý"],
    dependencies=[Depends(kiem_tra_quyen_quan_ly)],
)


@router.post("/tao-tai-khoan-nhan-vien")
def tao_tai_khoan_nv(
    ho_ten: str,
    dia_chi: str,
    vai_tro: str,
    ca_lam: str,
    luong: int,
    request: TaoTaiKhoanRequest,
):
    conn = get_db_connection
    try:
        cursor = conn.cursor()
        hashed_pw = get_password_hash(request.mat_khau)
        sql = """
            insert into NhanVien(HoTen,DiaChi,VaiTro,CaLam,Luong,SDT,MatKhau)
            values(%s,%s,%s,%s,%s,%s,%s)
        """
        val = (ho_ten, dia_chi, vai_tro, ca_lam, luong, request.sdt, request.mat_khau)
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


@router.post("/them-mon-moi")
def them_mon_moi(
    request: MonAnRequest,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        sql = """
                INSERT INTO MonAn (TenMon,DonGia,ThongTinMoTa)
                VALUES(%s,%s,%s);
        """
        val = (
            request.ten_mon,
            request.don_gia,
            request.thong_tin_mo_ta,
        )
        cursor.execute(sql, val)
        conn.commit()
        ma_mon_an = cursor.lastrowid
        if not request.ma_chi_nhanh:
            sql = """
                INSERT INTO CungCapThucDon(MaMonAn,MaChiNhanh)
                VALUES(%s,%s);
            """
            val = (ma_mon_an, request.ma_chi_nhanh)
            cursor.execute(sql, val)
            conn.commit()
        if not request.ma_the_loai:
            sql = """
                INSERT INTO ThuocTheLoai(MaMonAn,MaTheLoai)
                VALUES(%s,%s)
            """
            val = (ma_mon_an, request.ma_the_loai)
            cursor.execute(sql, val)
            conn.commit()

        return {
            "status": "success",
            "message": "thêm món mới thành công!",
            "ma_mon": ma_mon_an,
        }
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()


@router.put("/chinh-sua-mon/{ma_chi_nhanh}/{ma_mon}")
def chinh_sua_mon(
    ma_chi_nhanh: int,
    ma_mon: int,
    request: MonAnRequest,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = """
            update MonAn
            set TenMon=%s,DonGia=%s,ThongTinMoTa=%s, MaTheLoai=%s
            where MaMon=%s ;
        """
        val = (
            request.ten_mon,
            request.don_gia,
            request.thong_tin_mo_ta,
            request.ma_the_loai,
            ma_mon,
        )
        cursor.execute(sql, val)
        if not request.ma_chi_nhanh and request.ma_chi_nhanh != ma_chi_nhanh:
            cursor.execute(
                "update CungCapThucDon set MaChiNhanh=%s where MaChiNhanh=%s and MaMonAn=%s;",
                (request.ma_chi_nhanh, ma_chi_nhanh, ma_mon),
            )
        conn.commit()
        return {
            "status": "success",
            "message": "Thay đổi thông tin món ăn thành công",
            "ma_mon_an": ma_mon,
        }
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()


# thể loại món
@router.post("/them-the-loai-mon")
def them_them_loai_mon_moi(
    request: TheLoaiMonRequest,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(
            "insert into TheLoaiMon(TenTheLoai,ThongTinMota) values(%s,%s);",
            (request.ten_the_loai, request.thong_tin_mo_ta),
        )
        conn.commit()
        return {"status": "success", "message": "thêm thể loại món mới thành công"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()


@router.put("/chinh-sua-the-loai/{ma_the_loai}")
def chinh_sua_the_loai(
    ma_the_loai: int,
    request: TheLoaiMonRequest,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(
            "Update TheLoaiMon set TenTheLoai=%s,ThongTinMoTa=%s where MaTheLoai=%s",
            (request.ten_the_loai, request.thong_tin_mo_ta, ma_the_loai),
        )
        conn.commit()
        if cursor.rowcount == 0:
            raise HTTPException(status_code=404, detail="Mã thể loại không hợp lệ")
        return {
            "status": "success",
            "message": "Chỉnh sửa thông tin thể loại thành công",
            "ma_the_loai": ma_the_loai,
        }
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()


# bàn ăn
@router.post("/them-ban-an/")
def them_ban_an(
    request: BanAnRequest,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(
            "insert into banan(MachiNhanh,SoLuongCHoNgoi,ViTri) values(%s,%s,%s);",
            (request.ma_chi_nhanh, request.so_luong_cho_ngoi, request.vi_tri),
        )
        cursor.commit()
        return {"status": "success", "message": "thêm bàn ăn mới thành công"}
    except Exception as e:
        conn.rollback()
        error_complier(e)
    finally:
        cursor.close()
        conn.close()


@router.put("/chinh-sua-ban-an/{ma_chi_nhanh}/{ma_ban_an}")
def chinh_sua_ban_an(
    ma_chi_nhanh: int,
    ma_ban_an: int,
    request: BanAnRequest,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(
            "update BanAn set MaChiNhanh=%s,ViTri=%s,SoLuongChoNgoi=%s where MaBan=%s and MaChiNhanh=%s",
            (
                request.ma_chi_nhanh,
                request.vi_tri,
                request.so_luong_cho_ngoi,
                ma_ban_an,
                ma_chi_nhanh,
            ),
        )
        conn.commit()
        if cursor.rowcount == 0:
            raise HTTPException(
                status_code=404, detail="Mã bàn ăn hoặc mã chi nhánh không hợp lệ"
            )
        return {"status": "success", "ma_ban_an": ma_ban_an}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()


@router.post("/them-chi-nhanh")
def them_chi_nhanh(
    request: ThemChiNhanhRequest,
):
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


@router.get("/truy-xuat-danh-sach-nv/")
@router.get("/truy-xuat-ds-nhan-vien/")
@router.get("/danh-sach-nhan-vien/")
def truy_xuat_danh_sach_nv(
    ma_chi_nhanh: Optional[int] = None,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.callproc(
            "truy_xuat_ds_nhan_vien",
            (ma_chi_nhanh,),
        )
        result = []
        for res in cursor.stored_results():
            result = res.fetchall()
        if not result:
            return {
                "status": "success",
                "message": "danh sách nhân viên trống",
                "data": [],
            }
        return {
            "status": "success",
            "data": result,
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()


@router.get("/thong-ke-doanh-so/")
def thong_ke_doanh_so(
    ma_chi_nhanh: Optional[int] = None,
    thoi_gian_bat_dau: Optional[str] = None,
    thoi_gian_ket_thuc: Optional[str] = None,
    doanh_so_toi_thieu: Optional[int] = None,
    doanh_so_toi_da: Optional[int] = None,
    pham_vi: Optional[str] = None,
    uu_tien: Optional[str] = None,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.callproc(
            "thong_ke_doanh_so",
            (
                ma_chi_nhanh,
                thoi_gian_bat_dau,
                thoi_gian_ket_thuc,
                doanh_so_toi_thieu,
                doanh_so_toi_da,
                pham_vi,
                uu_tien,
            ),
        )
        result = []
        for res in cursor.stored_results():
            result = res.fetchall()
        if not result:
            return {
                "status": "success",
                "message": "danh sách hóa đơn trống",
                "data": [],
            }
        return {
            "status": "success",
            "data": result,
        }
    except Exception as e:
        return HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()


@router.get("/thong-ke-mon-an")
def thong_ke_mon_an(
    ma_chi_nhanh: Optional[int] = None,
    thoi_gian_bat_dau: Optional[str] = None,
    thoi_gian_ket_thuc: Optional[str] = None,
    pham_vi: Optional[str] = None,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.callproc(
            "thong_ke_mon_an",
            (
                ma_chi_nhanh,
                thoi_gian_bat_dau,
                thoi_gian_ket_thuc,
                pham_vi,
            ),
        )
        result = []
        for res in cursor.stored_results():
            result = res.fetchall()
        if not result:
            return {
                "status": "success",
                "message": "danh sách món bán ra trống",
                "data": [],
            }
        return {
            "status": "success",
            "data": result,
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()


@router.get("/thong-ke-kinh-phi")
def thong_ke_kinh_phi(
    ma_chi_nhanh: Optional[int] = None,
    thoi_diem_bat_dau: Optional[int] = None,
    thoi_diem_ket_thuc: Optional[int] = None,
    pham_vi: Optional[str] = None,
    uu_tien: Optional[str] = None,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.callproc(
            "thong_ke_kinh_phi",
            (
                ma_chi_nhanh,
                thoi_diem_bat_dau,
                thoi_diem_ket_thuc,
                pham_vi,
                uu_tien,
            ),
        )
        result = []
        for res in cursor.stored_results():
            result = res.fetchall()
        if not result:
            return {
                "status": "success",
                "message": "Danh sách kinh phí trống",
                "data": [],
            }
        return {
            "status": "success",
            "data": result,
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()
