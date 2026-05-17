from pydantic import BaseModel
from typing import Optional


class DangNhapRequest(BaseModel):
    sdt: str
    mat_khau: str


class TaoTaiKhoanRequest(BaseModel):
    sdt: str
    mat_khau: str


class GoiMonRequest(BaseModel):
    ma_mon_an: int
    so_luong: int
    ma_ban_an: Optional[int] = None
    sdt_khach: Optional[str] = None


class NhanVienDatMonRequest(GoiMonRequest):
    ma_phieu_dat_ban: int


class DatBanRequest(BaseModel):
    ma_ban_an: int
    ngay_gio_nhan: str  # Dạng chuỗi 'YYYY-MM-DD HH:MM:SS'
    sdt_khach: str


class MonAnRequest(BaseModel):
    ten_mon: str
    don_gia: int
    thong_tin_mo_ta: str
    ma_the_loai: Optional[int] = None
    ma_chi_nhanh: Optional[int] = None


class TheLoaiMonRequest(BaseModel):
    ten_the_loai: str
    thong_tin_mo_ta: str


class BanAnRequest(BaseModel):
    ma_chi_nhanh: int
    so_luong_cho_ngoi: int
    vi_tri: str


class ThemChiNhanhRequest(BaseModel):
    dia_chi: str
    sdt_quan: str
    email_quan: str
    gio_mo_cua: str


class ThanhToanPhieuGoiMonRequest(BaseModel):
    ma_phieu_goi_mon: int
    phuong_thuoc_thanh_toan: str
