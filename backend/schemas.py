from pydantic import BaseModel
from typing import Optional


class DangNhapRequest(BaseModel):
    sdt: str
    mat_khau: str


class TaoTaiKhoanRequest(BaseModel):
    sdt: str
    ho_ten: Optional[str]=None
    mat_khau: Optional[str]=None


class GoiMonRequest(BaseModel):
    ma_mon_an: int
    so_luong: int
    sdt_khach: Optional[str] = None
    ma_ban_an: Optional[int] = None


class NhanVienDatMonRequest(GoiMonRequest):
    ma_phieu_dat_ban: int


class DatBanRequest(BaseModel):
    ma_ban_an: int
    ngay_gio_nhan: str  # Dạng chuỗi 'YYYY-MM-DD HH:MM:SS'
    sdt_khach: str


class MonAnRequest(BaseModel):
    ten_mon: Optional[str]=None
    don_gia: int
    hinh_anh: str
    thong_tin_mo_ta: Optional[str] = None
    ma_the_loai:Optional[int]=None

class ThanhToanRequest(BaseModel):
    sdt_khach:int
    phuong_thuc_thanh_toan:str

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

class NhanVienRequest(BaseModel):
    ho_ten:str
    sdt:str
    dia_chi:Optional[str]=None
    vai_tro:str
    ca_lam:Optional[str]=None
    luong:Optional[int]=None
    anh_the:Optional[str]=None