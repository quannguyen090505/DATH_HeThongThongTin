import React, { useState, useEffect } from "react";
import {
  Button,
  Typography,
  Layout,
  Row,
  Col,
  Card,
  Drawer,
  Tag,
  message,
  Table,
  Tabs,
  Badge,
  Menu,
  Modal,
  Form,
  Input,
  DatePicker,
  Checkbox,
  Select,
  Space,
} from "antd";
import { useNavigate } from "react-router-dom";
import { jwtDecode } from "jwt-decode";
import {
  CoffeeOutlined,
  ShoppingOutlined,
  CheckCircleOutlined,
  DollarOutlined,
  ReloadOutlined,
  BellOutlined,
  AppstoreOutlined,
  AppstoreAddOutlined,
  UnorderedListOutlined,
  CalendarOutlined,
  EditOutlined,
  ClockCircleOutlined,
} from "@ant-design/icons";
import dayjs from "dayjs";
import api from "./api";

import PhieuGoiMonTab from "./PhieuGoiMonTab";

const { Header, Content } = Layout;
const { Title, Text } = Typography;

const HoatDongNhanVien = () => {
  const navigate = useNavigate();

  const [role, setRole] = useState(null);
  const [maChiNhanh, setMaChiNhanh] = useState(null);
  const [maNhanVien, setMaNhanVien] = useState(null);
  const [tenNhanVien, setTenNhanVien] = useState("");

  const [activeView, setActiveView] = useState("so_do_ban");

  const [danhSachBan, setDanhSachBan] = useState([]);
  const [thucDon, setThucDon] = useState([]);
  const [banDuocChon, setBanDuocChon] = useState(null);

  const [isDrawerVisible, setIsDrawerVisible] = useState(false);
  const [activeTabDrawer, setActiveTabDrawer] = useState("phieu_goi_mon");
  const [phieuHienTai, setPhieuHienTai] = useState(null);
  const [gioHang, setGioHang] = useState([]);
  const [loadingPhieu, setLoadingPhieu] = useState(false);
  const [loadingSubmit, setLoadingSubmit] = useState(false);
  const [loadingThanhToan, setLoadingThanhToan] = useState(false);
  const [loadingXacNhan, setLoadingXacNhan] = useState(false);

  const [loadingDonBan, setLoadingDonBan] = useState(false);

  const [danhSachPhieuToanBo, setDanhSachPhieuToanBo] = useState([]);
  const [loadingToanBoPhieu, setLoadingToanBoPhieu] = useState(false);
  const [filterTabPhieu, setFilterTabPhieu] = useState("can_xac_nhan");

  const [isModalDatBanVisible, setIsModalDatBanVisible] = useState(false);
  const [formDatBan] = Form.useForm();
  const [maPhieuDatBanActive, setMaPhieuDatBanActive] = useState(null);

  const [trangThaiSdtDatBan, setTrangThaiSdtDatBan] = useState(null);
  const [hoTenKhachMoi, setHoTenKhachMoi] = useState("");
  const [taoTaiKhoanMoi, setTaoTaiKhoanMoi] = useState(false);

  const [danhSachPhieuDatBan, setDanhSachPhieuDatBan] = useState([]);
  const [loadingPhieuDatBan, setLoadingPhieuDatBan] = useState(false);

  const [phuongThucThanhToan, setPhuongThucThanhToan] = useState("TienMat");

  const [isModalSuaPDBVisible, setIsModalSuaPDBVisible] = useState(false);
  const [phieuDatBanDangSua, setPhieuDatBanDangSua] = useState(null);
  const [formSuaPDB] = Form.useForm();

  const [isEditingSDT, setIsEditingSDT] = useState(false);
  const [newSDT, setNewSDT] = useState("");
  const [trangThaiSdtPGM, setTrangThaiSdtPGM] = useState(null);
  const [hoTenPGM, setHoTenPGM] = useState("");
  const [taoTaiKhoanPGM, setTaoTaiKhoanPGM] = useState(false);

  useEffect(() => {
    const token = localStorage.getItem("token_nhan_vien");
    const localMaChiNhanh = localStorage.getItem("ma_chi_nhanh");
    if (token) {
      try {
        const decoded = jwtDecode(token);
        setRole(decoded.role);
        setMaNhanVien(decoded.sub);
        setTenNhanVien(decoded.name || decoded.user_name || "");
      } catch (error) {
        console.error("Token không hợp lệ");
      }
    }
    if (localMaChiNhanh) {
      setMaChiNhanh(localMaChiNhanh);
    }
  }, []);

  const fetchToanBoPhieu = async (isBackground = false) => {
    if (!isBackground) setLoadingToanBoPhieu(true);
    try {
      const res = await api.get(`/api/nhan-vien/truy-xuat-phieu-goi-mon`);
      if (res.data.status === "success" && res.data.data) {
        const grouped = res.data.data.reduce((acc, curr) => {
          const id = curr.MaPhieuGoiMon || curr.MaPhieu;
          if (!id) return acc;
          if (!acc[id]) {
            acc[id] = {
              MaPhieuGoiMon: id,
              MaBanAn: curr.MaBanAn,
              SDTKhach: curr.SDTKhach,
              TinhTrangPhieu: curr.TinhTrangPhieuGoiMon || curr.TinhTrang,
              ThanhToan: curr.ThanhToan,
              TongTien: 0,
            };
          }
          acc[id].TongTien += curr.ThanhTien || 0;
          return acc;
        }, {});
        setDanhSachPhieuToanBo(
          Object.values(grouped).sort(
            (a, b) => b.MaPhieuGoiMon - a.MaPhieuGoiMon,
          ),
        );
      } else {
        setDanhSachPhieuToanBo([]);
      }
    } catch (error) {
      console.error(error);
      if (!isBackground) message.error("Lỗi tải danh sách phiếu gọi món!");
    } finally {
      if (!isBackground) setLoadingToanBoPhieu(false);
    }
  };

  const fetchToanBoPhieuDatBan = async () => {
    if (danhSachBan.length > 0) {
      setLoadingPhieuDatBan(true);
      try {
        const resDatBan = await api.get(
          "/api/nhan-vien/truy-xuat-phieu-dat-ban",
        );
        if (resDatBan.data.status === "success" && resDatBan.data.data) {
          let allDatBan = resDatBan.data.data;
          allDatBan.sort(
            (a, b) => new Date(a.NgayGioNhanBan) - new Date(b.NgayGioNhanBan),
          );
          setDanhSachPhieuDatBan(allDatBan);
        }
      } catch (e) {
        console.error("Lỗi lấy ds đặt bàn", e);
      } finally {
        setLoadingPhieuDatBan(false);
      }
    }
  };

  useEffect(() => {
    const fetchData = async () => {
      if (!maChiNhanh) return;
      try {
        const resBan = await api.get(`/api/thong-tin-ban-an/${maChiNhanh}`);
        if (resBan.data.status === "success") {
          setDanhSachBan(resBan.data.data.filter((b) => b.CoSan === 1));
        }

        const resMenu = await api.get(`/api/thong-tin-thuc-don`, {
          params: { ma_chi_nhanh: maChiNhanh },
        });
        if (resMenu.data.status === "success") {
          const menuMapped = (resMenu.data.data || [])
            .filter((m) => m.CoSan === 1)
            .map((m) => ({ ...m, MaMon: m.MaMonAn || m.MaMon }));
          setThucDon(menuMapped);
        }
        await fetchToanBoPhieu(true);
      } catch (error) {
        console.error("Lỗi khi tải dữ liệu:", error);
      }
    };

    fetchData();
    const interval = setInterval(() => {
      if (!isDrawerVisible && !isModalDatBanVisible && !isModalSuaPDBVisible) {
        fetchData();
      }
    }, 15000);
    return () => clearInterval(interval);
  }, [maChiNhanh, isDrawerVisible, isModalDatBanVisible, isModalSuaPDBVisible]);

  useEffect(() => {
    fetchToanBoPhieuDatBan();
  }, [danhSachBan]);

  const fetchPhieuHienTai = async (maBanLoad, maPhieuLoad = null) => {
    setLoadingPhieu(true);
    try {
      const params = {};
      if (maBanLoad !== "MangVe" && !maPhieuLoad) {
        params.ma_ban_an = maBanLoad;
      }

      const res = await api.get(`/api/nhan-vien/truy-xuat-phieu-goi-mon`, {
        params,
      });

      if (res.data.status === "success" && res.data.data?.length > 0) {
        let targetPhieuId = maPhieuLoad;
        if (!targetPhieuId) {
          targetPhieuId = Math.max(
            ...res.data.data.map((item) => item.MaPhieuGoiMon || item.MaPhieu),
          );
        }

        const filteredData = res.data.data.filter(
          (item) =>
            Number(item.MaPhieuGoiMon || item.MaPhieu) ===
            Number(targetPhieuId),
        );

        if (filteredData.length > 0) {
          const tongTien = filteredData.reduce(
            (sum, item) => sum + (item.ThanhTien || 0),
            0,
          );
          setPhieuHienTai({
            ...res.data,
            data: filteredData,
            tong_tien: tongTien,
            ma_phieu_goi_mon: targetPhieuId,
          });
        } else {
          setPhieuHienTai(null);
        }
      } else {
        setPhieuHienTai(null);
      }
    } catch (error) {
      console.error(error);
      setPhieuHienTai(null);
    } finally {
      setLoadingPhieu(false);
    }
  };

  const handleChonBanClick = async (ban, stt, maPhieuLoad = null) => {
    setBanDuocChon({ ...ban, stt });
    setGioHang([]);
    setPhieuHienTai(null);
    setMaPhieuDatBanActive(null);

    setTrangThaiSdtDatBan(null);
    setHoTenKhachMoi("");
    setTaoTaiKhoanMoi(false);

    setIsEditingSDT(false);

    if (activeView === "dat_ban") {
      if (ban.isTakeaway)
        return message.warning(
          "Tính năng đặt trước chỉ áp dụng cho bàn ăn tại quán!",
        );
      formDatBan.resetFields();
      setIsModalDatBanVisible(true);
    } else {
      setIsDrawerVisible(true);
      setActiveTabDrawer("phieu_goi_mon");

      const dbStatus = (
        ban.TinhTrangSuDung ||
        ban.TinhTrang ||
        "BanTrong"
      ).trim();
      if (maPhieuLoad || dbStatus !== "BanTrong") {
        fetchPhieuHienTai(ban.isTakeaway ? "MangVe" : ban.MaBan, maPhieuLoad);
      }
    }
  };

  const xemChiTietPhieuDatBan = (phieuDatBan) => {
    const banThucTe = danhSachBan.find(
      (b) => Number(b.MaBan) === Number(phieuDatBan.MaBanAn),
    );
    if (banThucTe) {
      const stt = danhSachBan.indexOf(banThucTe) + 1;

      setBanDuocChon({ ...banThucTe, stt });
      setGioHang([]);
      setPhieuHienTai(null);

      setMaPhieuDatBanActive(phieuDatBan.MaPhieuDatBan);
      setTrangThaiSdtDatBan("hop_le");
      setHoTenKhachMoi("");
      setTaoTaiKhoanMoi(false);
      setIsEditingSDT(false);

      setIsDrawerVisible(true);
      setActiveTabDrawer("phieu_goi_mon");

      if (phieuDatBan.MaPhieuGoiMon) {
        fetchPhieuHienTai(
          banThucTe.isTakeaway ? "MangVe" : banThucTe.MaBan,
          phieuDatBan.MaPhieuGoiMon,
        );
      }
    } else {
      message.error("Không tìm thấy bàn của phiếu đặt này!");
    }
  };

  const kiemTraSDT = async (sdt) => {
    if (!sdt || sdt.length < 9) {
      setTrangThaiSdtDatBan(null);
      return;
    }
    try {
      const response = await api.get(`/api/kiem-tra-sdt-khach/${sdt}`);
      if (response.data.data === 1) {
        setTrangThaiSdtDatBan("hop_le");
      } else {
        setTrangThaiSdtDatBan("khong_ton_tai");
      }
    } catch (error) {
      console.error("Lỗi khi kết nối hệ thống kiểm tra SĐT!", error);
    }
  };

  const kiemTraSDTPGM = async (sdt) => {
    if (!sdt || sdt.length < 9) {
      setTrangThaiSdtPGM(null);
      return;
    }
    try {
      const response = await api.get(`/api/kiem-tra-sdt-khach/${sdt}`);
      if (response.data.data === 1) {
        setTrangThaiSdtPGM("hop_le");
      } else {
        setTrangThaiSdtPGM("khong_ton_tai");
      }
    } catch (error) {
      console.error("Lỗi khi kết nối hệ thống kiểm tra SĐT!", error);
    }
  };

  const onThucHienDatBan = async (values) => {
    try {
      if (trangThaiSdtDatBan === "khong_ton_tai" && taoTaiKhoanMoi) {
        if (!hoTenKhachMoi.trim()) {
          return message.error("Vui lòng nhập Họ Tên cho khách hàng mới!");
        }
        await api.post(`/api/tao-tai-khoan-khach`, {
          sdt: values.SDT,
          ho_ten: hoTenKhachMoi,
        });
        message.success("Đã đăng ký tài khoản cho khách hàng thành công!");
      }

      const res = await api.post("/api/nhan-vien/dat-ban-an", {
        ma_ban_an: banDuocChon.MaBan,
        ngay_gio_nhan: values.NgayGioNhan.format("YYYY-MM-DD HH:mm:ss"),
        sdt_khach: values.SDT,
      });

      if (res.data.status === "success") {
        message.success(
          "Khởi tạo Phiếu Đặt Bàn thành công! Vui lòng chọn món trước.",
        );
        setMaPhieuDatBanActive(res.data.ma_phieu_dat_ban);

        setIsModalDatBanVisible(false);
        setIsDrawerVisible(true);
        setActiveTabDrawer("thuc_don");
        fetchToanBoPhieuDatBan();
      }
    } catch (error) {
      let errorMsg = "Lỗi hệ thống khi tạo phiếu đặt bàn!";
      if (error.response && error.response.data && error.response.data.detail) {
        const detail = error.response.data.detail;
        if (typeof detail === "string") {
          const splitIndex = detail.indexOf(":");
          errorMsg =
            splitIndex !== -1
              ? detail.substring(splitIndex + 1).trim()
              : detail;
        } else {
          errorMsg = JSON.stringify(detail);
        }
      }
      message.error(errorMsg, 5);
    }
  };

  const xemChiTietPhieu = (phieu) => {
    if (phieu.MaBanAn) {
      const banThucTe = danhSachBan.find(
        (b) => Number(b.MaBan) === Number(phieu.MaBanAn),
      ) || {
        MaBan: phieu.MaBanAn,
        TinhTrang: "DangSuDung",
      };
      const stt =
        danhSachBan.findIndex(
          (b) => Number(b.MaBan) === Number(phieu.MaBanAn),
        ) + 1;
      handleChonBanClick(
        banThucTe,
        stt > 0 ? stt : phieu.MaBanAn,
        phieu.MaPhieuGoiMon,
      );
    } else {
      handleChonBanClick(
        { MaBan: "MangVe", isTakeaway: true, SDTKhach: phieu.SDTKhach },
        null,
        phieu.MaPhieuGoiMon,
      );
    }
  };

  const themVaoBill = (mon) => {
    const daCo = gioHang.find((item) => item.MaMon === mon.MaMon);
    if (daCo) {
      setGioHang(
        gioHang.map((i) =>
          i.MaMon === mon.MaMon ? { ...i, SoLuong: i.SoLuong + 1 } : i,
        ),
      );
    } else {
      setGioHang([...gioHang, { ...mon, SoLuong: 1 }]);
    }
    message.success({
      content: `Đã thêm ${mon.TenMon}`,
      key: "add_cart",
      duration: 1,
    });
  };

  const capNhatSoLuong = (maMon, soLuong) => {
    if (soLuong <= 0) setGioHang(gioHang.filter((i) => i.MaMon !== maMon));
    else
      setGioHang(
        gioHang.map((i) =>
          i.MaMon === maMon ? { ...i, SoLuong: soLuong } : i,
        ),
      );
  };

  const guiYeuCauBep = async () => {
    if (gioHang.length === 0)
      return message.warning("Vui lòng chọn món trước!");
    if (!banDuocChon || banDuocChon.isTakeaway)
      return message.error("Chỉ hỗ trợ đặt tại bàn!");

    setLoadingSubmit(true);
    try {
      if (maPhieuDatBanActive) {
        for (const mon of gioHang) {
          await api.post("/api/nhan-vien/dat-mon-truoc", {
            ma_phieu_dat_ban: maPhieuDatBanActive,
            ma_mon_an: mon.MaMon,
            so_luong: mon.SoLuong,
          });
        }
        message.success("Đã lưu các món đặt trước thành công!");
        setIsDrawerVisible(false);
        setMaPhieuDatBanActive(null);
        setActiveView("so_do_ban");
      } else {
        for (const mon of gioHang) {
          await api.post("/api/nhan-vien/goi-mon", {
            ma_ban_an: parseInt(banDuocChon.MaBan),
            ma_mon_an: mon.MaMon,
            so_luong: mon.SoLuong,
            ma_nhan_vien: parseInt(maNhanVien),
          });
        }
        message.success("Chốt món và Gửi Bếp thành công!");
        setActiveTabDrawer("phieu_goi_mon");
        const currentPhieuId =
          phieuHienTai?.data?.[0]?.MaPhieuGoiMon ||
          phieuHienTai?.ma_phieu_goi_mon;
        fetchPhieuHienTai(banDuocChon.MaBan, currentPhieuId);
      }

      setGioHang([]);
      fetchToanBoPhieu(true);
    } catch (error) {
      message.error("Lỗi khi gửi yêu cầu lưu món!");
    } finally {
      setLoadingSubmit(false);
    }
  };

  const handleXacNhanGoiMon = async () => {
    const maPhieu =
      phieuHienTai?.data?.[0]?.MaPhieuGoiMon || phieuHienTai?.ma_phieu_goi_mon;
    if (!maPhieu) return;

    setLoadingXacNhan(true);
    try {
      await api.post("/api/nhan-vien/xac-nhan-goi-mon", {
        ma_phieu_goi_mon: maPhieu,
      });
      message.success("Đã xác nhận và chuyển yêu cầu xuống Bếp!");
      fetchPhieuHienTai(banDuocChon.MaBan, maPhieu);
      fetchToanBoPhieu(true);
    } catch (error) {
      message.error("Có lỗi xảy ra khi xác nhận món!");
    } finally {
      setLoadingXacNhan(false);
    }
  };

  const handleCapNhatTrangThaiMon = async (record, trangThaiMoi) => {
    const maPhieu =
      phieuHienTai?.data?.[0]?.MaPhieuGoiMon || phieuHienTai?.ma_phieu_goi_mon;
    if (!maPhieu) return;

    if (!record.MaGoiMon) {
      return message.error("Lỗi dữ liệu: Không tìm thấy Mã Gọi Món!");
    }

    try {
      await api.patch("/api/nhan-vien/cap-nhat-trang-thai-goi-mon", {
        ma_phieu_goi_mon: maPhieu,
        ma_goi_mon: record.MaGoiMon,
        tinh_trang: trangThaiMoi,
      });
      message.success(`Đã cập nhật trạng thái món: ${record.TenMon}`);
      fetchPhieuHienTai(banDuocChon.MaBan, maPhieu);
      fetchToanBoPhieu(true);
    } catch (error) {
      message.error("Lỗi khi cập nhật trạng thái món!");
    }
  };

  const handleThanhToan = async () => {
    const maPhieuGoiMon =
      phieuHienTai?.ma_phieu_goi_mon ||
      phieuHienTai?.data?.[0]?.MaPhieuGoiMon ||
      phieuHienTai?.data?.[0]?.MaPhieu;

    setLoadingThanhToan(true);
    try {
      await api.post("/api/nhan-vien/thuc-hien-thanh-toan", {
        ma_phieu_goi_mon: maPhieuGoiMon,
        phuong_thuc_thanh_toan: phuongThucThanhToan,
      });
      message.success("Thanh toán thành công!");
      setIsDrawerVisible(false);
      setPhieuHienTai(null);
      fetchToanBoPhieu(true);
      fetchToanBoPhieuDatBan();

      const resBan = await api.get(`/api/thong-tin-ban-an/${maChiNhanh}`);
      if (resBan.data.status === "success") {
        setDanhSachBan(resBan.data.data.filter((b) => b.CoSan === 1));
      }
    } catch (error) {
      message.error("Có lỗi xảy ra khi thực hiện thanh toán!");
    } finally {
      setLoadingThanhToan(false);
    }
  };

  const handleXacNhanDonBan = async () => {
    if (!banDuocChon || banDuocChon.isTakeaway) return;
    setLoadingDonBan(true);
    try {
      await api.patch(
        `/api/nhan-vien/thay-doi-trang-thai-ban-an/${banDuocChon.MaBan}`,
        null,
        { params: { trang_thai: "BanTrong" } },
      );

      message.success("Bàn đã dọn xong và sẵn sàng đón khách mới!");
      setIsDrawerVisible(false);
      setPhieuHienTai(null);
      fetchToanBoPhieu(true);

      const resBan = await api.get(`/api/thong-tin-ban-an/${maChiNhanh}`);
      if (resBan.data.status === "success") {
        setDanhSachBan(resBan.data.data.filter((b) => b.CoSan === 1));
      }
    } catch (error) {
      message.error("Có lỗi xảy ra khi xác nhận dọn bàn!");
    } finally {
      setLoadingDonBan(false);
    }
  };

  const handleSaveInlineSDT = async () => {
    try {
      if (trangThaiSdtPGM === "khong_ton_tai" && taoTaiKhoanPGM) {
        if (!hoTenPGM.trim()) {
          return message.error("Vui lòng nhập Họ Tên cho khách hàng mới!");
        }
        await api.post(`/api/tao-tai-khoan-khach`, {
          sdt: newSDT,
          ho_ten: hoTenPGM,
        });
        message.success("Đã đăng ký tài khoản cho khách hàng thành công!");
      }

      const maPhieu =
        phieuHienTai?.ma_phieu_goi_mon ||
        phieuHienTai?.data?.[0]?.MaPhieuGoiMon;

      const res = await api.put(
        `/api/nhan-vien/chinh-sua-phieu-goi-mon/${maPhieu}`,
        {
          sdt_khach: newSDT,
        },
      );

      if (res.data.status === "success") {
        message.success("Cập nhật SĐT phiếu gọi món thành công!");
        setIsEditingSDT(false);
        fetchToanBoPhieu(false);
        fetchPhieuHienTai(
          banDuocChon.isTakeaway ? "MangVe" : banDuocChon.MaBan,
          maPhieu,
        );
      }
    } catch (error) {
      message.error("Lỗi khi cập nhật phiếu gọi món!");
    }
  };

  const onLuuSuaPhieuDatBan = async (values) => {
    try {
      const res = await api.put(
        `/api/nhan-vien/chinh-sua-phieu-dat-ban/${phieuDatBanDangSua.MaPhieuDatBan}`,
        {
          sdt_khach: values.SDTKhach,
          ngay_gio_nhan: values.NgayGioNhanBan.format("YYYY-MM-DD HH:mm:ss"),
          ma_ban_an: values.MaBanAn,
        },
      );
      if (res.data.status === "success") {
        message.success("Cập nhật thông tin phiếu đặt bàn thành công!");
        setIsModalSuaPDBVisible(false);
        fetchToanBoPhieuDatBan();
      }
    } catch (error) {
      let errorMsg = "Lỗi hệ thống khi cập nhật phiếu!";
      if (error.response && error.response.data && error.response.data.detail) {
        const detail = error.response.data.detail;
        if (typeof detail === "string") {
          const splitIndex = detail.indexOf(":");
          errorMsg =
            splitIndex !== -1
              ? detail.substring(splitIndex + 1).trim()
              : detail;
        } else {
          errorMsg = JSON.stringify(detail);
        }
      }
      message.error(errorMsg, 5);
    }
  };
  const handleCapNhatTrangThaiPDB = async (maPhieuDatBan, trangThai) => {
    try {
      const res = await api.patch(
        `/api/nhan-vien/cap-nhat-trang-thai-phieu-dat-ban/${maPhieuDatBan}`,
        null,
        { params: { tinh_trang: trangThai } },
      );
      if (res.data.status === "success") {
        message.success(
          trangThai === "DaNhanBan"
            ? "Khách đã nhận bàn thành công!"
            : "Đã hủy phiếu đặt bàn thành công!",
        );

        fetchToanBoPhieuDatBan();
        const resBan = await api.get(`/api/thong-tin-ban-an/${maChiNhanh}`);
        if (resBan.data.status === "success") {
          setDanhSachBan(resBan.data.data.filter((b) => b.CoSan === 1));
        }
        fetchToanBoPhieu(true);
      }
    } catch (error) {
      message.error("Có lỗi xảy ra khi thao tác với phiếu đặt bàn!");
    }
  };

  const tongTienMoi = gioHang.reduce(
    (sum, item) => sum + item.DonGia * item.SoLuong,
    0,
  );

  const getTableStyle = (tinhTrang) => {
    let bgColor = "#ffffff",
      borderColor = "#d9d9d9",
      textColor = "#8c8c8c";
    if (tinhTrang === "DangSuDung" || tinhTrang === "GoiMon") {
      bgColor = "#e6f7ff";
      borderColor = "#91d5ff";
      textColor = "#1890ff";
    } else if (tinhTrang === "CanThanhToan") {
      bgColor = "#f9f0ff";
      borderColor = "#d3adf7";
      textColor = "#722ed1";
    } else if (tinhTrang === "DaThanhToan") {
      bgColor = "#f6ffed";
      borderColor = "#b7eb8f";
      textColor = "#52c41a";
    } else if (tinhTrang === "DaDatTruoc") {
      bgColor = "#fff7e6";
      borderColor = "#ffd591";
      textColor = "#fa8c16";
    }
    return { backgroundColor: bgColor, borderColor, color: textColor };
  };

  const columnsPhieu = [
    {
      title: "Mã Phiếu",
      dataIndex: "MaPhieuGoiMon",
      key: "MaPhieuGoiMon",
      render: (text) => <Text strong>#{text}</Text>,
    },
    {
      title: "Phục vụ",
      key: "PhucVu",
      render: (_, r) => {
        if (r.MaBanAn) {
          const banIndex = danhSachBan.findIndex(
            (b) => Number(b.MaBan) === Number(r.MaBanAn),
          );
          const hienThiBan =
            banIndex !== -1 ? `Bàn ${banIndex + 1}` : `Bàn ${r.MaBanAn}`;
          return (
            <Text strong style={{ color: "#1890ff" }}>
              {hienThiBan}
            </Text>
          );
        }
        return `Mang về (${r.SDTKhach || "Khách lẻ"})`;
      },
    },
    {
      title: "Trạng thái",
      dataIndex: "TinhTrangPhieu",
      key: "TinhTrangPhieu",
      render: (t) => {
        let color = "blue";
        if (t === "CanThanhToan") color = "gold";
        if (t === "DaThanhToan") color = "green";
        if (t === "DaPhucVu") color = "cyan";
        if (t === "GoiMon") color = "volcano";
        return <Tag color={color}>{t}</Tag>;
      },
    },
    {
      title: "Tổng tiền",
      dataIndex: "TongTien",
      key: "TongTien",
      render: (v) => (
        <Text type="danger" strong>
          {v?.toLocaleString()}đ
        </Text>
      ),
    },
    {
      title: "Hành động",
      key: "action",
      render: (_, r) => (
        <Button type="primary" size="small" onClick={() => xemChiTietPhieu(r)}>
          Xử lý
        </Button>
      ),
    },
  ];

  const columnsPhieuDatBan = [
    {
      title: "Mã Đặt Bàn",
      dataIndex: "MaPhieuDatBan",
      key: "MaPhieuDatBan",
      render: (text) => <Text strong>#{text}</Text>,
    },
    {
      title: "Bàn ăn",
      dataIndex: "MaBanAn",
      key: "MaBanAn",
      render: (val) => {
        const b = danhSachBan.find((x) => Number(x.MaBan) === Number(val));
        return (
          <Text strong style={{ color: "#1890ff" }}>
            Bàn {b ? danhSachBan.indexOf(b) + 1 : val}
          </Text>
        );
      },
    },
    {
      title: "Thời gian nhận bàn",
      dataIndex: "NgayGioNhanBan",
      key: "NgayGioNhanBan",
      render: (val) => new Date(val).toLocaleString("vi-VN"),
    },
    {
      title: "SĐT Khách",
      dataIndex: "SDTKhach",
      key: "SDTKhach",
      render: (val) => <Text strong>{val}</Text>,
    },
    {
      title: "Tiền cọc",
      dataIndex: "TienCoc",
      key: "TienCoc",
      render: (val) => (
        <Text type="danger" strong>
          {(val || 0).toLocaleString()}đ
        </Text>
      ),
    },
    {
      title: "Trạng thái",
      dataIndex: "TinhTrang",
      key: "TinhTrang",
      render: (t) => {
        let color = "blue";
        if (t === "ChoNhanBan") color = "gold";
        if (t === "DaNhanBan") color = "green";
        if (t === "HuyDatBan") color = "red";
        return <Tag color={color}>{t}</Tag>;
      },
    },
    {
      title: "Hành động",
      key: "action",
      render: (_, r) => (
        <Space>
          <Button
            type="primary"
            size="small"
            onClick={() => xemChiTietPhieuDatBan(r)}
          >
            Xem Phiếu Món
          </Button>
          {r.TinhTrang === "ChoNhanBan" && (
            <Button
              type="primary"
              size="small"
              style={{ backgroundColor: "#52c41a", borderColor: "#52c41a" }}
              icon={<CheckCircleOutlined />}
              onClick={() =>
                handleCapNhatTrangThaiPDB(r.MaPhieuDatBan, "DaNhanBan")
              }
            >
              Nhận bàn
            </Button>
          )}

          {/* 🌟 THÊM NÚT HỦY KHI KHÁCH KHÔNG ĐẾN */}
          {r.TinhTrang === "ChoNhanBan" && (
            <Button
              type="primary"
              danger
              size="small"
              onClick={() => {
                Modal.confirm({
                  title: "Xác nhận hủy",
                  content: `Ông có chắc chắn muốn hủy phiếu đặt bàn #${r.MaPhieuDatBan} này không?`,
                  okText: "Hủy phiếu",
                  okType: "danger",
                  cancelText: "Quay lại",
                  onOk: () =>
                    handleCapNhatTrangThaiPDB(r.MaPhieuDatBan, "HuyDatBan"),
                });
              }}
            >
              Hủy
            </Button>
          )}

          <Button
            type="dashed"
            size="small"
            icon={<EditOutlined />}
            disabled={r.TinhTrang !== "ChoNhanBan"}
            onClick={() => {
              setPhieuDatBanDangSua(r);
              formSuaPDB.setFieldsValue({
                SDTKhach: r.SDTKhach,
                NgayGioNhanBan: r.NgayGioNhanBan
                  ? dayjs(r.NgayGioNhanBan)
                  : null,
                MaBanAn: r.MaBanAn,
              });
              setIsModalSuaPDBVisible(true);
            }}
          >
            Sửa
          </Button>
        </Space>
      ),
    },
  ];

  const danhSachPhieuChiNhanhNay = danhSachPhieuToanBo.filter((p) => {
    if (p.MaBanAn)
      return danhSachBan.some((b) => Number(b.MaBan) === Number(p.MaBanAn));
    return true;
  });

  const filteredDanhSachPhieu = danhSachPhieuChiNhanhNay.filter((p) => {
    if (filterTabPhieu === "can_xac_nhan") return p.TinhTrangPhieu === "GoiMon";
    if (filterTabPhieu === "dang_phuc_vu")
      return ["DoiLenMon", "ChoLenMon", "DangCheBien"].includes(
        p.TinhTrangPhieu,
      );
    if (filterTabPhieu === "da_phuc_vu") return p.TinhTrangPhieu === "DaPhucVu";
    if (filterTabPhieu === "can_thanh_toan")
      return p.TinhTrangPhieu === "CanThanhToan";
    return false;
  });

  const countCanXacNhan = danhSachPhieuChiNhanhNay.filter(
    (p) => p.TinhTrangPhieu === "GoiMon",
  ).length;
  const countCanThanhToan = danhSachPhieuChiNhanhNay.filter(
    (p) => p.TinhTrangPhieu === "CanThanhToan",
  ).length;
  const tongThongBaoGoiMon = countCanXacNhan + countCanThanhToan;

  const drawerTabs = [
    {
      key: "phieu_goi_mon",
      label: "PHIẾU GỌI MÓN",
      children: (
        <PhieuGoiMonTab
          loadingPhieu={loadingPhieu}
          phieuHienTai={phieuHienTai}
          currentTicketStatus={
            phieuHienTai?.data?.[0]?.TinhTrangPhieuGoiMon ||
            phieuHienTai?.data?.[0]?.TinhTrangPhieu ||
            "Chưa có"
          }
          loadingXacNhan={loadingXacNhan}
          onXacNhanGoiMon={handleXacNhanGoiMon}
          onCapNhatTrangThaiMon={handleCapNhatTrangThaiMon}
          gioHang={gioHang}
          tongTienMoi={tongTienMoi}
          onCapNhatSoLuong={capNhatSoLuong}
          onThemVaoBill={themVaoBill}
          loadingSubmit={loadingSubmit}
          onGuiYeuCauBep={guiYeuCauBep}
        />
      ),
    },
    {
      key: "thuc_don",
      label: "THỰC ĐƠN",
      children: (
        <div style={{ padding: "10px 0" }}>
          <Row gutter={[12, 12]}>
            {thucDon.map((mon) => (
              <Col span={12} key={mon.MaMon}>
                <Card
                  hoverable
                  onClick={() => themVaoBill(mon)}
                  style={{
                    borderRadius: "8px",
                    border: "1px solid #d9d9d9",
                    background: "#fafafa",
                  }}
                  bodyStyle={{ padding: "12px", textAlign: "center" }}
                >
                  <Text
                    strong
                    style={{
                      display: "block",
                      height: "40px",
                      overflow: "hidden",
                    }}
                  >
                    {mon.TenMon}
                  </Text>
                  <Text type="danger" strong>
                    {mon.DonGia?.toLocaleString()}đ
                  </Text>
                </Card>
              </Col>
            ))}
          </Row>
        </div>
      ),
    },
  ];

  const menuItems = [
    { key: "so_do_ban", icon: <AppstoreAddOutlined />, label: "Sơ đồ bàn" },
    { key: "dat_ban", icon: <CalendarOutlined />, label: "Đặt bàn trước" },
    {
      key: "danh_sach_phieu",
      icon: <UnorderedListOutlined />,
      label: (
        <span>
          Danh sách phiếu gọi món{" "}
          {tongThongBaoGoiMon > 0 && (
            <Badge
              count={tongThongBaoGoiMon}
              size="small"
              style={{ marginLeft: "8px" }}
              offset={[5, 0]}
            />
          )}
        </span>
      ),
    },
    {
      key: "danh_sach_phieu_dat_ban",
      icon: <UnorderedListOutlined />,
      label: "Danh sách phiếu đặt bàn",
    },
  ];

  return (
    <Layout style={{ minHeight: "100vh" }}>
      <Header
        style={{
          background: "#001f3f",
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          padding: "0 20px",
          boxShadow: "0 2px 8px rgba(0,0,0,0.15)",
          position: "sticky",
          top: 0,
          zIndex: 10,
        }}
      >
        <div style={{ display: "flex", alignItems: "center", flex: 1 }}>
          <Title
            level={2}
            style={{
              color: "#fff",
              margin: 0,
              paddingRight: "20px",
              fontWeight: 900,
              letterSpacing: 1,
              borderRight: "1px solid rgba(255, 255, 255, 0.2)",
            }}
          >
            POS
          </Title>
          <Menu
            theme="dark"
            mode="horizontal"
            selectedKeys={[activeView]}
            onClick={(e) => setActiveView(e.key)}
            items={menuItems}
            style={{
              flex: 1,
              borderBottom: "none",
              background: "transparent",
              marginLeft: "10px",
              fontWeight: 500,
            }}
          />
        </div>
        <div style={{ display: "flex", gap: "15px", alignItems: "center" }}>
          <Text style={{ color: "#fff", fontSize: "15px" }}>
            NV:{" "}
            <span style={{ fontWeight: "bold" }}>
              {maNhanVien} {tenNhanVien ? `- ${tenNhanVien}` : ""}
            </span>
          </Text>
          {role === "QuanLy" && (
            <div
              style={{
                paddingLeft: "15px",
                borderLeft: "1px solid rgba(255, 255, 255, 0.2)",
              }}
            >
              <Button
                type="primary"
                ghost
                icon={<AppstoreOutlined />}
                onClick={() => navigate("/quan-ly/dashboard")}
                style={{ borderColor: "#faad14", color: "#faad14" }}
              >
                Trang Quản Lý
              </Button>
            </div>
          )}
        </div>
      </Header>

      <Content style={{ padding: "30px", background: "#f0f2f5" }}>
        {(activeView === "so_do_ban" || activeView === "dat_ban") && (
          <div>
            <div
              style={{
                marginBottom: "20px",
                display: "flex",
                gap: "15px",
                alignItems: "center",
              }}
            >
              <Title level={4} style={{ margin: 0 }}>
                {activeView === "dat_ban"
                  ? "Chọn Bàn Đặt Trước"
                  : "Sơ đồ phòng bàn"}
              </Title>
              {activeView === "dat_ban" ? (
                <Tag
                  color="blue"
                  style={{ fontSize: "14px", padding: "4px 10px" }}
                >
                  Chế độ: Ghi nhận đặt bàn
                </Tag>
              ) : (
                <>
                  <Tag color="default">Bàn trống</Tag>
                  <Tag color="processing">Đang phục vụ</Tag>
                  <Tag color="purple">Cần thanh toán</Tag>
                  <Tag color="success">Đã thanh toán</Tag>
                  <Tag color="#fa8c16">Đã đặt trước</Tag>
                  <Tag color="volcano">
                    <BellOutlined /> Khách vừa order
                  </Tag>
                </>
              )}
            </div>

            <Row gutter={[20, 20]}>
              {activeView !== "dat_ban" && (
                <Col xs={12} sm={8} md={6} lg={4}>
                  <Card
                    hoverable
                    onClick={() =>
                      handleChonBanClick(
                        { MaBan: "MangVe", isTakeaway: true },
                        null,
                      )
                    }
                    style={{
                      position: "relative",
                      height: "140px",
                      width: "100%",
                      display: "flex",
                      flexDirection: "column",
                      justifyContent: "center",
                      alignItems: "center",
                      border: "2px dashed #1890ff",
                      backgroundColor: "#e6f7ff",
                      borderRadius: "12px",
                    }}
                    bodyStyle={{
                      padding: 0,
                      textAlign: "center",
                      width: "100%",
                    }}
                  >
                    <ShoppingOutlined
                      style={{
                        fontSize: "32px",
                        color: "#1890ff",
                        marginBottom: "10px",
                      }}
                    />
                    <Title level={5} style={{ margin: 0, color: "#1890ff" }}>
                      Khách Mang Về
                    </Title>
                  </Card>
                </Col>
              )}

              {danhSachBan.map((ban, index) => {
                const stt = index + 1;
                const dbStatus = (
                  ban.TinhTrangSuDung ||
                  ban.TinhTrang ||
                  "BanTrong"
                ).trim();
                let trangThaiThucTe = dbStatus;

                if (dbStatus === "BanTrong") {
                  const phieuDatBanCuaBan = danhSachPhieuDatBan.find(
                    (pdb) =>
                      Number(pdb.MaBanAn) === Number(ban.MaBan) &&
                      pdb.TinhTrang === "ChoNhanBan",
                  );
                  if (phieuDatBanCuaBan) {
                    const now = dayjs();
                    const gioNhanBan = dayjs(phieuDatBanCuaBan.NgayGioNhanBan);
                    const diffHours = gioNhanBan.diff(now, "hour", true);

                    if (diffHours <= 3 && diffHours >= -1) {
                      trangThaiThucTe = "DaDatTruoc";
                    }
                  }
                }
                const cacPhieuCuaBan = danhSachPhieuToanBo.filter(
                  (p) => Number(p.MaBanAn) === Number(ban.MaBan),
                );
                const phieuMoiNhat =
                  cacPhieuCuaBan.length > 0 ? cacPhieuCuaBan[0] : null;

                if (dbStatus === "DangSuDung" && phieuMoiNhat) {
                  if (phieuMoiNhat.TinhTrangPhieu === "CanThanhToan") {
                    trangThaiThucTe = "CanThanhToan";
                  } else if (phieuMoiNhat.TinhTrangPhieu === "DaThanhToan") {
                    trangThaiThucTe = "DaThanhToan";
                  } else {
                    trangThaiThucTe = "DangSuDung";
                  }
                }

                const coKhachVuaOrder =
                  phieuMoiNhat &&
                  phieuMoiNhat.TinhTrangPhieu === "GoiMon" &&
                  trangThaiThucTe !== "BanTrong";
                const styles = getTableStyle(trangThaiThucTe);
                let statusText = "Bàn trống",
                  StatusIcon = null;

                if (trangThaiThucTe === "DangSuDung") {
                  statusText = "Đang phục vụ";
                  StatusIcon = <CheckCircleOutlined />;
                } else if (trangThaiThucTe === "CanThanhToan") {
                  statusText = "Cần thanh toán";
                  StatusIcon = <CheckCircleOutlined />;
                } else if (trangThaiThucTe === "DaThanhToan") {
                  statusText = "Đã thanh toán";
                  StatusIcon = <CheckCircleOutlined />;
                } else if (trangThaiThucTe === "DaDatTruoc") {
                  statusText = "Đã đặt trước";
                  StatusIcon = <ClockCircleOutlined />;
                }

                const isDatBanActive = activeView === "dat_ban";
                const finalBorderColor = isDatBanActive
                  ? trangThaiThucTe === "BanTrong"
                    ? "#1890ff"
                    : "#d9d9d9"
                  : coKhachVuaOrder
                    ? "#fa541c"
                    : styles.borderColor;
                const finalBgColor = isDatBanActive
                  ? trangThaiThucTe === "BanTrong"
                    ? "#e6f7ff"
                    : "#f5f5f5"
                  : coKhachVuaOrder
                    ? "#e6f7ff"
                    : styles.backgroundColor;

                return (
                  <Col xs={12} sm={8} md={6} lg={4} key={ban.MaBan}>
                    <Card
                      hoverable
                      onClick={() => handleChonBanClick(ban, stt)}
                      style={{
                        position: "relative",
                        borderRadius: "12px",
                        border: `2px solid ${finalBorderColor}`,
                        backgroundColor: finalBgColor,
                        transition: "all 0.3s",
                        boxShadow: "0 2px 5px rgba(0,0,0,0.03)",
                        height: "140px",
                        display: "flex",
                        flexDirection: "column",
                        justifyContent: "center",
                        alignItems: "center",
                        width: "100%",
                        opacity:
                          isDatBanActive && trangThaiThucTe !== "BanTrong"
                            ? 0.6
                            : 1,
                      }}
                      bodyStyle={{
                        padding: 0,
                        textAlign: "center",
                        width: "100%",
                      }}
                    >
                      {!isDatBanActive && coKhachVuaOrder && (
                        <div
                          style={{
                            position: "absolute",
                            top: -1,
                            right: -1,
                            backgroundColor: "#fa541c",
                            color: "#fff",
                            padding: "4px 10px",
                            borderRadius: "0 11px 0 12px",
                            fontSize: "11px",
                            fontWeight: "bold",
                            boxShadow: "-2px 2px 5px rgba(0,0,0,0.1)",
                          }}
                        >
                          <BellOutlined style={{ marginRight: "4px" }} /> Khách
                          Order
                        </div>
                      )}
                      <CoffeeOutlined
                        style={{
                          fontSize: "26px",
                          color:
                            isDatBanActive && trangThaiThucTe === "BanTrong"
                              ? "#1890ff"
                              : "#595959",
                          marginBottom: "4px",
                        }}
                      />
                      <Title
                        level={4}
                        style={{
                          margin: 0,
                          fontWeight: 700,
                          color:
                            isDatBanActive && trangThaiThucTe === "BanTrong"
                              ? "#1890ff"
                              : undefined,
                        }}
                      >
                        Bàn {stt}
                      </Title>
                      <div
                        style={{
                          fontSize: "12px",
                          color: "#8c8c8c",
                          marginTop: "2px",
                          marginBottom: "4px",
                        }}
                      >
                        {ban.ViTri} • {ban.SoLuongChoNgoi} chỗ
                      </div>
                      <Text
                        style={{
                          fontSize: "12px",
                          fontWeight: "bold",
                          color:
                            isDatBanActive && trangThaiThucTe === "BanTrong"
                              ? "#1890ff"
                              : styles.color,
                        }}
                      >
                        {StatusIcon && (
                          <span style={{ marginRight: "4px" }}>
                            {StatusIcon}
                          </span>
                        )}{" "}
                        {statusText}
                      </Text>
                    </Card>
                  </Col>
                );
              })}
            </Row>
          </div>
        )}

        {activeView === "danh_sach_phieu" && (
          <Card
            style={{
              borderRadius: "12px",
              boxShadow: "0 2px 8px rgba(0,0,0,0.05)",
            }}
          >
            <div
              style={{
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
                marginBottom: "20px",
              }}
            >
              <Title level={4} style={{ margin: 0 }}>
                Quản lý hóa đơn / Phiếu gọi món
              </Title>
              <Button
                type="primary"
                icon={<ReloadOutlined />}
                onClick={() => fetchToanBoPhieu(false)}
              >
                Làm mới dữ liệu
              </Button>
            </div>
            <Tabs
              activeKey={filterTabPhieu}
              onChange={setFilterTabPhieu}
              items={[
                {
                  key: "can_xac_nhan",
                  label: (
                    <Badge
                      count={countCanXacNhan}
                      offset={[15, 0]}
                      size="small"
                    >
                      <span style={{ paddingRight: "10px" }}>
                        Khách gọi mới
                      </span>
                    </Badge>
                  ),
                },
                { key: "dang_phuc_vu", label: "Đang phục vụ / Bếp làm" },
                { key: "da_phuc_vu", label: "Đã phục vụ" },
                {
                  key: "can_thanh_toan",
                  label: (
                    <Badge
                      count={countCanThanhToan}
                      offset={[15, 0]}
                      size="small"
                    >
                      <span style={{ paddingRight: "10px" }}>
                        Cần thanh toán
                      </span>
                    </Badge>
                  ),
                },
              ]}
            />
            <Table
              columns={columnsPhieu}
              dataSource={filteredDanhSachPhieu}
              rowKey="MaPhieuGoiMon"
              loading={loadingToanBoPhieu}
              bordered
              pagination={{ pageSize: 10 }}
            />
          </Card>
        )}

        {activeView === "danh_sach_phieu_dat_ban" && (
          <Card
            style={{
              borderRadius: "12px",
              boxShadow: "0 2px 8px rgba(0,0,0,0.05)",
            }}
          >
            <div
              style={{
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
                marginBottom: "20px",
              }}
            >
              <Title level={4} style={{ margin: 0 }}>
                Danh sách Phiếu Đặt Bàn Hôm Nay
              </Title>
            </div>
            <Table
              columns={columnsPhieuDatBan}
              dataSource={danhSachPhieuDatBan}
              rowKey="MaPhieuDatBan"
              loading={loadingPhieuDatBan}
              bordered
              pagination={{ pageSize: 10 }}
            />
          </Card>
        )}
      </Content>

      <Modal
        title={
          <Title level={4} style={{ color: "#1890ff", margin: 0 }}>
            <CalendarOutlined /> THÔNG TIN ĐẶT BÀN #{banDuocChon?.stt}
          </Title>
        }
        open={isModalDatBanVisible}
        onCancel={() => {
          setIsModalDatBanVisible(false);
          setTrangThaiSdtDatBan(null);
          setHoTenKhachMoi("");
          setTaoTaiKhoanMoi(false);
        }}
        onOk={() => formDatBan.submit()}
        okText="Tạo phiếu & Chọn món"
        cancelText="Hủy bỏ"
        centered
      >
        <div style={{ paddingBottom: "250px", marginTop: "20px" }}>
          <Form form={formDatBan} layout="vertical" onFinish={onThucHienDatBan}>
            <Form.Item
              name="SDT"
              label={<Text strong>Số điện thoại khách hàng</Text>}
              rules={[{ required: true, message: "Vui lòng nhập SĐT!" }]}
            >
              <Input
                placeholder="Nhập số điện thoại (VD: 0912345678)"
                size="large"
                onChange={() => setTrangThaiSdtDatBan(null)}
                onBlur={(e) => kiemTraSDT(e.target.value)}
              />
            </Form.Item>
            {trangThaiSdtDatBan === "hop_le" && (
              <Text
                type="success"
                strong
                style={{
                  display: "block",
                  marginBottom: "15px",
                  marginTop: "-15px",
                }}
              >
                ✅ Số điện thoại hợp lệ (Khách hàng thành viên).
              </Text>
            )}
            {trangThaiSdtDatBan === "khong_ton_tai" && (
              <div
                style={{
                  marginBottom: "15px",
                  marginTop: "-10px",
                  padding: "10px",
                  background: "#fffbe6",
                  border: "1px solid #ffe58f",
                  borderRadius: "8px",
                }}
              >
                <Text
                  type="warning"
                  strong
                  style={{ display: "block", marginBottom: "8px" }}
                >
                  ⚠️ SĐT chưa đăng ký tài khoản thành viên!
                </Text>
                <Checkbox
                  checked={taoTaiKhoanMoi}
                  onChange={(e) => setTaoTaiKhoanMoi(e.target.checked)}
                  style={{ marginBottom: "10px" }}
                >
                  Tạo tài khoản khách hàng mới
                </Checkbox>
                {taoTaiKhoanMoi && (
                  <Input
                    placeholder="Nhập Họ và Tên khách hàng..."
                    value={hoTenKhachMoi}
                    onChange={(e) => setHoTenKhachMoi(e.target.value)}
                  />
                )}
              </div>
            )}
            <Form.Item
              name="NgayGioNhan"
              label={<Text strong>Ngày và Giờ nhận bàn</Text>}
              rules={[
                {
                  required: true,
                  message: "Vui lòng chọn thời gian nhận bàn!",
                },
              ]}
            >
              <DatePicker
                showTime
                format="YYYY-MM-DD HH:mm"
                size="large"
                style={{ width: "100%" }}
                placeholder="Chọn thời gian khách đến"
                placement="bottomLeft"
                getPopupContainer={() => document.body}
              />
            </Form.Item>
          </Form>
        </div>
      </Modal>

      <Modal
        title="Chỉnh sửa Phiếu Đặt Bàn"
        open={isModalSuaPDBVisible}
        onCancel={() => setIsModalSuaPDBVisible(false)}
        onOk={() => formSuaPDB.submit()}
        okText="Cập nhật thông tin"
        cancelText="Hủy"
      >
        {phieuDatBanDangSua && (
          <div
            style={{
              marginBottom: "20px",
              padding: "15px",
              background: "#f5f5f5",
              borderRadius: "8px",
            }}
          >
            <Text strong style={{ display: "block", marginBottom: "5px" }}>
              Thông tin phiếu (Không thể sửa):
            </Text>
            <Row gutter={[10, 10]}>
              <Col span={12}>
                <Text type="secondary">Mã đặt bàn:</Text>{" "}
                <Text strong>#{phieuDatBanDangSua.MaPhieuDatBan}</Text>
              </Col>
              <Col span={12}>
                <Text type="secondary">Tiền cọc:</Text>{" "}
                <Text strong type="danger">
                  {(phieuDatBanDangSua.TienCoc || 0).toLocaleString()}đ
                </Text>
              </Col>
              <Col span={12}>
                <Text type="secondary">Trạng thái:</Text>{" "}
                <Text strong>{phieuDatBanDangSua.TinhTrang}</Text>
              </Col>
            </Row>
          </div>
        )}

        <Form
          form={formSuaPDB}
          layout="vertical"
          onFinish={onLuuSuaPhieuDatBan}
          style={{ paddingBottom: "150px" }}
        >
          <Form.Item
            name="MaBanAn"
            label="Chọn Bàn ăn"
            rules={[{ required: true, message: "Vui lòng chọn bàn ăn!" }]}
          >
            <Select placeholder="Chọn bàn muốn đổi">
              {danhSachBan.map((ban, index) => (
                <Select.Option key={ban.MaBan} value={ban.MaBan}>
                  Bàn {index + 1} ({ban.ViTri} - {ban.SoLuongChoNgoi} chỗ)
                </Select.Option>
              ))}
            </Select>
          </Form.Item>

          <Form.Item
            name="SDTKhach"
            label="Số điện thoại khách"
            rules={[{ required: true, message: "Vui lòng nhập SĐT!" }]}
          >
            <Input placeholder="Ví dụ: 0912345678" />
          </Form.Item>

          <Form.Item
            name="NgayGioNhanBan"
            label="Giờ nhận bàn"
            rules={[{ required: true, message: "Chọn giờ nhận bàn!" }]}
          >
            <DatePicker
              showTime
              format="YYYY-MM-DD HH:mm"
              style={{ width: "100%" }}
              getPopupContainer={() => document.body}
            />
          </Form.Item>
        </Form>
      </Modal>

      <Drawer
        title={
          <div
            style={{
              display: "flex",
              justifyContent: "space-between",
              alignItems: "center",
            }}
          >
            <div>
              <Title
                level={4}
                style={{
                  margin: 0,
                  color: maPhieuDatBanActive ? "#fa541c" : "#1890ff",
                }}
              >
                {banDuocChon?.isTakeaway
                  ? "ĐƠN MANG VỀ"
                  : maPhieuDatBanActive
                    ? `ĐẶT TRƯỚC MÓN - BÀN ${banDuocChon?.stt}`
                    : `ĐẶT MÓN - BÀN SỐ ${banDuocChon?.stt}`}
              </Title>
              {!banDuocChon?.isTakeaway && (
                <Text type="secondary" style={{ fontSize: "13px" }}>
                  Vị trí: {banDuocChon?.ViTri}
                </Text>
              )}

              {phieuHienTai?.data?.[0] && !maPhieuDatBanActive && (
                <div
                  style={{
                    marginTop: "8px",
                    fontSize: "13px",
                    color: "#595959",
                    display: "flex",
                    flexDirection: "column",
                    gap: "4px",
                  }}
                >
                  <div>
                    <Text strong>Mã phiếu:</Text>{" "}
                    <Tag color="blue">
                      #
                      {phieuHienTai.data[0].MaPhieuGoiMon ||
                        phieuHienTai.data[0].MaPhieu}
                    </Tag>
                  </div>

                  <div>
                    <Text strong>SĐT Khách:</Text>
                    {!isEditingSDT ? (
                      <>
                        <span style={{ marginLeft: "5px" }}>
                          {phieuHienTai.data[0].SDTKhach || "Khách lẻ"}
                        </span>
                        {phieuHienTai.data[0].TinhTrangPhieuGoiMon !==
                          "DaThanhToan" &&
                          phieuHienTai.data[0].TinhTrangPhieu !==
                            "DaThanhToan" && (
                            <Button
                              type="text"
                              size="small"
                              icon={
                                <EditOutlined style={{ color: "#1890ff" }} />
                              }
                              onClick={() => {
                                setNewSDT(phieuHienTai.data[0].SDTKhach || "");
                                setTrangThaiSdtPGM(null);
                                setHoTenPGM("");
                                setTaoTaiKhoanPGM(false);
                                setIsEditingSDT(true);
                              }}
                              style={{ marginLeft: "5px", padding: 0 }}
                            />
                          )}
                      </>
                    ) : (
                      <div
                        style={{
                          marginTop: "8px",
                          padding: "12px",
                          background: "#f0f2f5",
                          borderRadius: "8px",
                          border: "1px solid #d9d9d9",
                        }}
                      >
                        <Input
                          placeholder="Nhập SĐT..."
                          value={newSDT}
                          onChange={(e) => {
                            setNewSDT(e.target.value.replace(/[^0-9]/g, ""));
                            setTrangThaiSdtPGM(null);
                          }}
                          onBlur={() => kiemTraSDTPGM(newSDT)}
                          style={{ width: "100%", marginBottom: "10px" }}
                        />

                        {trangThaiSdtPGM === "hop_le" && (
                          <Text
                            type="success"
                            strong
                            style={{ display: "block", marginBottom: "10px" }}
                          >
                            ✅ SĐT Hợp lệ.
                          </Text>
                        )}

                        {trangThaiSdtPGM === "khong_ton_tai" && (
                          <div style={{ marginBottom: "10px" }}>
                            <Text
                              type="warning"
                              strong
                              style={{ display: "block", marginBottom: "5px" }}
                            >
                              ⚠️ SĐT chưa đăng ký!
                            </Text>
                            <Checkbox
                              checked={taoTaiKhoanPGM}
                              onChange={(e) =>
                                setTaoTaiKhoanPGM(e.target.checked)
                              }
                              style={{ marginBottom: "8px" }}
                            >
                              Tạo tài khoản mới
                            </Checkbox>
                            {taoTaiKhoanPGM && (
                              <Input
                                placeholder="Họ và Tên khách hàng..."
                                value={hoTenPGM}
                                onChange={(e) => setHoTenPGM(e.target.value)}
                              />
                            )}
                          </div>
                        )}

                        <Space>
                          <Button
                            type="primary"
                            size="small"
                            onClick={handleSaveInlineSDT}
                          >
                            Lưu thay đổi
                          </Button>
                          <Button
                            size="small"
                            onClick={() => setIsEditingSDT(false)}
                          >
                            Hủy
                          </Button>
                        </Space>
                      </div>
                    )}
                  </div>

                  <div>
                    <Text strong>Thanh toán:</Text>{" "}
                    <Tag
                      color={
                        phieuHienTai.data[0].ThanhToan ? "green" : "default"
                      }
                    >
                      {phieuHienTai.data[0].ThanhToan || "Chưa thanh toán"}
                    </Tag>
                  </div>
                </div>
              )}
            </div>
            {maPhieuDatBanActive && (
              <Tag
                color="volcano"
                style={{ fontSize: "14px", padding: "4px 8px" }}
              >
                Chế độ đặt trước
              </Tag>
            )}
          </div>
        }
        placement="right"
        width={600}
        onClose={() => setIsDrawerVisible(false)}
        open={isDrawerVisible}
        bodyStyle={{ padding: "0 20px" }}
        footer={
          !maPhieuDatBanActive ? (
            <div style={{ padding: "10px 0" }}>
              {(() => {
                const tinhTrangPhieu =
                  phieuHienTai?.data?.[0]?.TinhTrangPhieuGoiMon ||
                  phieuHienTai?.data?.[0]?.TinhTrangPhieu;
                const isDaThanhToan = tinhTrangPhieu === "DaThanhToan";

                if (isDaThanhToan && !banDuocChon?.isTakeaway) {
                  return (
                    <Button
                      type="primary"
                      size="large"
                      icon={<CheckCircleOutlined />}
                      loading={loadingDonBan}
                      onClick={handleXacNhanDonBan}
                      style={{
                        width: "100%",
                        height: "50px",
                        fontSize: "16px",
                        fontWeight: "bold",
                        backgroundColor: "#52c41a",
                        borderColor: "#52c41a",
                      }}
                    >
                      XÁC NHẬN ĐÃ DỌN BÀN
                    </Button>
                  );
                }

                if (isDaThanhToan && banDuocChon?.isTakeaway) {
                  return (
                    <Button
                      type="primary"
                      size="large"
                      disabled
                      style={{
                        width: "100%",
                        height: "50px",
                        fontSize: "16px",
                        fontWeight: "bold",
                      }}
                    >
                      ĐƠN HÀNG ĐÃ THANH TOÁN
                    </Button>
                  );
                }

                return (
                  <>
                    {phieuHienTai &&
                      phieuHienTai.data?.length > 0 &&
                      !isDaThanhToan && (
                        <div style={{ marginBottom: "15px" }}>
                          <Text
                            strong
                            style={{ display: "block", marginBottom: "8px" }}
                          >
                            Phương thức thanh toán:
                          </Text>
                          <Select
                            value={phuongThucThanhToan}
                            onChange={setPhuongThucThanhToan}
                            style={{ width: "100%", height: "40px" }}
                            options={[
                              { value: "TienMat", label: "Tiền mặt / Quầy" },
                              {
                                value: "ChuyenKhoan",
                                label: "Chuyển khoản / Quẹt mã QR",
                              },
                              {
                                value: "TheTinDung",
                                label: "Thẻ tín dụng / Ghi nợ",
                              },
                            ]}
                          />
                        </div>
                      )}
                    <Button
                      type="primary"
                      size="large"
                      icon={<DollarOutlined />}
                      loading={loadingThanhToan}
                      onClick={handleThanhToan}
                      disabled={
                        !phieuHienTai ||
                        phieuHienTai.data?.length === 0 ||
                        isDaThanhToan
                      }
                      style={{
                        width: "100%",
                        height: "50px",
                        fontSize: "16px",
                        fontWeight: "bold",
                        backgroundColor:
                          phieuHienTai &&
                          phieuHienTai.data?.length > 0 &&
                          !isDaThanhToan
                            ? "#1890ff"
                            : undefined,
                      }}
                    >
                      THỰC HIỆN THANH TOÁN
                    </Button>
                  </>
                );
              })()}
            </div>
          ) : (
            <div style={{ padding: "10px 0" }}>
              <Button
                type="primary"
                size="large"
                icon={<CalendarOutlined />}
                loading={loadingSubmit}
                onClick={guiYeuCauBep}
                disabled={gioHang.length === 0}
                style={{
                  width: "100%",
                  height: "50px",
                  fontSize: "16px",
                  fontWeight: "bold",
                  backgroundColor: gioHang.length > 0 ? "#fa541c" : undefined,
                  borderColor: "transparent",
                }}
              >
                LƯU YÊU CẦU ĐẶT TRƯỚC MÓN
              </Button>
            </div>
          )
        }
      >
        <Tabs
          activeKey={activeTabDrawer}
          onChange={setActiveTabDrawer}
          items={drawerTabs}
          size="large"
          centered
          style={{ height: "100%" }}
        />
      </Drawer>
    </Layout>
  );
};

export default HoatDongNhanVien;
