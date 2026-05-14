from pydantic import BaseModel
from typing import Optional


class GoiMonBase(BaseModel):
    ma_mon_an: int
    so_luong: int


class KhachGoiMonTaiQuanRequest(GoiMonBase):
    ma_ban_an: int
    sdt_khach: Optional[str] = None


class KhachDatMonMangVeRequest(GoiMonBase):
    sdt_khach: str


class NhanVienGoiMonRequest(GoiMonBase):
    ma_ban_an: Optional[int] = None
    sdt_khach: Optional[str] = None
    ma_nhan_vien: int


class NhanVienDatMonRequest(GoiMonBase):
    ma_phieu_dat_ban: int
    sdt_khach: str
    ma_nhan_vien: int


class DatBanRequest(BaseModel):
    ma_ban_an: int
    ngay_gio_nhan: str  # Dạng chuỗi 'YYYY-MM-DD HH:MM:SS'
    sdt_khach: str
    ma_nhan_vien: int


class ThemMonMoi(BaseModel):
    ten_mon: str
    don_gia: int
    thong_tin_mo_ta: str
    ma_the_loai: Optional[int] = None
    ma_chi_nhanh: Optional[int] = None


class ThemTheLoaiMon(BaseModel):
    ten_the_loai: str
    thong_tin_mo_ta: str


class ThemBanAn(BaseModel):
    ma_chi_nhanh: int
    so_luong_cho_ngoi: int
    vi_tri: str


class ThemChiNhanh(BaseModel):
    dia_chi: str
    sdt_quan: str
    email_quan: str
    gio_mo_cua: str


class ThanhToanPhieuGoiMon(BaseModel):
    ma_phieu_goi_mon: int
    phuong_thuoc_thanh_toan: str
    ma_nhan_vien: int
