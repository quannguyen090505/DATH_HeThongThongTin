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

@router.post("/them-mon-moi/{ma_chi_nhanh}")
def them_mon_moi(# cho phep 1 chi nhanh chu dong them mon moi vao kho mon an chung ?,
    ma_chi_nhanh:int,# set CoSan =1 doi voi chi nhanh do, con cac chi nhanh khac thi CoSan=0
    request: MonAnRequest,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.callproc("them_mon_moi", (
            request.ten_mon,
            request.don_gia,
            request.thong_tin_mo_ta,
            request.hinh_anh,
            request.ma_the_loai,
            ma_chi_nhanh,
        ))
        conn.commit()
        ma_mon_an = cursor.lastrowid
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

@router.put("/chinh-sua-thong-tin-mon-an/{ma_chi_nhanh}/{ma_mon_an}")
def chinh_sua_thong_tin_mon_an(
    ma_chi_nhanh: int,
    ma_mon_an: int,
    request: MonAnRequest,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(
            "update cungcapthucdon set DonGia=%s where MaChiNhanh=%s and MaMonAn=%s;",
            (request.don_gia, ma_chi_nhanh, ma_mon_an),
        )
        conn.commit()
        return {
            "status": "success",
            "message": "Thay đổi thông tin món ăn thành công",
            "ma_mon_an": ma_mon_an,
        }
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.put("/chinh-trang-thai-mon-an/{ma_chi_nhanh}/{ma_mon_an}/{trang_thai}")
def chinh_trang_thai_mon(ma_chi_nhanh:int, ma_mon_an:int, trang_thai:int):
    conn=get_db_connection()
    try:
        cursor=conn.cursor()
        cursor.execute("update cungcapthucdon set CoSan= %s where MaChiNhanh=%s and MaMonAn=%s",(trang_thai,ma_chi_nhanh,ma_mon_an,))
        conn.commit()
        return{
            "status":"success",
            "message": "Đã cập nhật trạng thái món ăn thành công",
            "ma_mon_an":ma_mon_an,
        }
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.post("/them-the-loai-mon")
def them_them_loai_mon_moi(
    request: TheLoaiMonRequest,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(
            "insert into theloaimon(TenTheLoai,ThongTinMota) values(%s,%s);",
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
            "Update theloaimon set TenTheLoai=%s,ThongTinMoTa=%s where MaTheLoai=%s",
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

@router.post("/them-ban-an")
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
        conn.commit()
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
            "update banan set MaChiNhanh=%s,ViTri=%s,SoLuongChoNgoi=%s where MaBan=%s and MaChiNhanh=%s",
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

@router.put("/chinh-trang-thai-ban-an/{ma_chi_nhanh}/{ma_ban}/{trang_thai}")
def chinh_trang_thai_ban_an(ma_chi_nhanh: int, ma_ban: int, trang_thai: int):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(
            "UPDATE banan SET CoSan = %s WHERE MaChiNhanh = %s AND MaBan = %s",
            (trang_thai, ma_chi_nhanh, ma_ban,)
        )
        conn.commit()
        return {"status": "success", "message": "Cập nhật trạng thái bàn thành công!"}
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

@router.post("/tao-tai-khoan-nhan-vien")
def tao_tai_khoan_nv(
    ThongTinReqest:NhanVienRequest,
    TaiKhoanRequest: TaoTaiKhoanRequest,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        hashed_pw = get_password_hash(TaiKhoanRequest.mat_khau)
        sql = """
            insert into nhanvien(HoTen,DiaChi,VaiTro,CaLam,Luong,SDT,MatKhau)
            values(%s,%s,%s,%s,%s,%s,%s)
        """
        val = (ThongTinReqest.ho_ten, ThongTinReqest.dia_chi, ThongTinReqest.vai_tro, ThongTinReqest.ca_lam, ThongTinReqest.luong, TaiKhoanRequest.sdt, TaiKhoanRequest.mat_khau)
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

@router.get("/truy-xuat-danh-sach-nv/")
def truy_xuat_danh_sach_nv(
    ma_chi_nhanh: Optional[int] = None,
    ma_nhan_vien:Optional[int]=None,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.callproc(
            "truy_xuat_ds_nv",
            (ma_chi_nhanh,ma_nhan_vien,),
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

@router.put("/chinh-sua-nv/{ma_chi_nhanh}/{ma_nhan_vien}")
def chinh_sua_thong_tin_nv(ma_chi_nhanh:int,ma_nhan_vien:int,request:NhanVienRequest):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = """
            UPDATE nhanvien 
            SET HoTen = %s, SDT = %s, DiaChi = %s, VaiTro=%s,CaLam = %s ,Luong=%s,AnhThe=%s
            WHERE MaNhanVien = %s AND MaChiNhanh = %s
        """
        cursor.execute(sql, (request.ho_ten, request.sdt, request.dia_chi, request.vai_tro,request.ca_lam,request.luong,request.anh_the, ma_nhan_vien, ma_chi_nhanh))
        conn.commit()
        return {"status": "success", "message": "Cập nhật thông tin nhân viên thành công!"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.put("/chinh-trang-thai-nv/{ma_chi_nhanh}/{ma_nhan_vien}/{tinh_trang_lam_viec}")
def chinh_trang_thai_nv(ma_chi_nhanh:int,ma_nhan_vien:int,tinh_trang_lam_viec:int):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        sql = """
            UPDATE nhanvien 
            SET TinhTrangLamViec=%s
            WHERE MaNhanVien = %s AND MaChiNhanh = %s
        """
        cursor.execute(sql, (tinh_trang_lam_viec, ma_nhan_vien, ma_chi_nhanh))
        conn.commit()
        return {"status": "success", "message": "Cập nhật thông tin nhân viên thành công!"}
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.post("/them-nhan-vien-moi/{ma_chi_nhanh}")
def them_nhan_vien_moi(
    request: NhanVienRequest,
    ma_chi_nhanh:int,
    _ = Depends(kiem_tra_quyen_quan_ly)
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        sql = """
            INSERT INTO nhanvien (HoTen, SDT, DiaChi, CaLam, VaiTro, Luong, AnhThe,MaChiNhanh )
            VALUES (%s, %s, %s, %s, %s, %s, %s,%s)
        """
        values = (
            request.ho_ten,
            request.sdt,
            request.dia_chi,
            request.ca_lam,
            request.vai_tro,
            request.luong,
            request.anh_the,
            ma_chi_nhanh,
        )
        
        cursor.execute(sql, values)
        conn.commit()
        
        return {"status": "success", "message": "Thêm nhân viên mới thành công!"}
        
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=f"Lỗi cơ sở dữ liệu: {str(e)}")
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
    gioi_han:Optional[int]=None,
    uu_tien:Optional[str]=None,
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
                gioi_han,
                uu_tien,
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
    thoi_gian_bat_dau: Optional[str] = None,
    thoi_gian_ket_thuc: Optional[str] = None,
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
                thoi_gian_bat_dau,
                thoi_gian_ket_thuc,
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

@router.get("/truy-xuat-hoa-don/{ma_chi_nhanh}")
def truy_xuat_hoa_don(
    ma_chi_nhanh: int,
    thoi_gian_bat_dau: Optional[str] = None,
    thoi_gian_ket_thuc: Optional[str] = None,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        sql_query = """
            SELECT MaChiNhanh, NgayGioTaoHoaDon, GiaTri, HoTenNhanVien 
            FROM tongkethoadon 
            WHERE MaChiNhanh = %s 
              AND (%s IS NULL OR NgayGioTaoHoaDon >= %s) 
              AND (%s IS NULL OR NgayGioTaoHoaDon <= %s);
        """
        cursor.execute(sql_query, (
            ma_chi_nhanh, 
            thoi_gian_bat_dau, thoi_gian_bat_dau, 
            thoi_gian_ket_thuc, thoi_gian_ket_thuc
        ))
        result = cursor.fetchall()
        
        if not result:
            return {
                "status": "success",
                "message": "dữ liệu hóa đơn trống",
                "data": []
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

@router.get("/truy-xuat-kinh-phi/{ma_chi_nhanh}")
def truy_xuat_kinh_phi(
    ma_chi_nhanh: int,
    thoi_gian_bat_dau: Optional[str] = None,
    thoi_gian_ket_thuc: Optional[str] = None,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        sql_query = """
            SELECT MaChiNhanh, NgayGioTaoPhieu, GiaTri, HoTenNhanVien 
            FROM tongketkinhphi 
            WHERE MaChiNhanh = %s 
              AND (%s IS NULL OR NgayGioTaoPhieu >= %s) 
              AND (%s IS NULL OR NgayGioTaoPhieu <= %s);
        """
        cursor.execute(sql_query, (
            ma_chi_nhanh, 
            thoi_gian_bat_dau, thoi_gian_bat_dau, 
            thoi_gian_ket_thuc, thoi_gian_ket_thuc
        ))
        result = cursor.fetchall()
        
        if not result:
            return {
                "status": "success",
                "message": "Dữ liệu phiếu nhập kho trống",
                "data": []
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

@router.post("/tao-phieu-nhap-kho")
def tao_phieu_nhap_kho(
    request: TaoPhieuNhapKhoRequest, 
    _= Depends(kiem_tra_quyen_quan_ly)
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(
            """
            INSERT INTO phieunhapkho (MaQuanLy, GiaTri, ThongTinGhiChu) 
            VALUES (%s, %s, %s)
            """,
            (request.ma_quan_ly, request.gia_tri, request.thong_tin_ghi_chu)
        )

        conn.commit()
        return {"status": "success", "message": "Tạo phiếu nhập kho thành công!"}
        
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

@router.get("/truy-xuat-phieu-nhap-kho/{ma_chi_nhanh}")
def truy_xuat_phieu_nhap_kho(
    ma_chi_nhanh:int,
    _= Depends(kiem_tra_quyen_quan_ly)
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            """
            select NgayGiotaoPhieu, GiaTri,ThongTinGhiChu from phieunhapkho where MaChiNhanh=%s;
            """,
            (ma_chi_nhanh,)
        )
        danh_sach_phieu=[]
        danh_sach_phieu=cursor.fetchall()
        if not danh_sach_phieu:
            return {"status":"success","message": "danh sách phiếu nhập kho rỗng", "data":[]}
        conn.commit()
        return {"status": "success", "data": danh_sach_phieu, }
        
    except Exception as e:
        conn.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()

