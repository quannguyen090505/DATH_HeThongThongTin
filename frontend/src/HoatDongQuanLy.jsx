import React, { useState, useEffect } from "react";
import {
  Layout,
  Typography,
  Card,
  Select,
  DatePicker,
  Space,
  message,
  Row,
  Col,
  Menu,
  Descriptions,
  Badge,
  Table,
  Button,
  Modal,
  Form,
  Input,
  InputNumber,
  Popconfirm,
  Tag,
  Tabs,
  Avatar,
} from "antd";
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip as RechartsTooltip,
  ResponsiveContainer,
  Legend,
} from "recharts";
import {
  DashboardOutlined,
  CoffeeOutlined,
  TeamOutlined,
  ShopOutlined,
  UserOutlined,
  EnvironmentOutlined,
  PhoneOutlined,
  PlusOutlined,
  EditOutlined,
  DeleteOutlined,
} from "@ant-design/icons";
import api from "./api";
import { jwtDecode } from "jwt-decode";

const { Header, Content } = Layout;
const { Title, Text } = Typography;
const { RangePicker } = DatePicker;

const HoatDongQuanLy = () => {
  const [trangHienTai, setTrangHienTai] = useState("dashboard");
  const danhMucMenu = [
    {
      key: "dashboard",
      icon: <DashboardOutlined />,
      label: "Dashboard Thống Kê",
    },
    {
      key: "thuc-don",
      icon: <CoffeeOutlined />,
      label: "Quản Lý Thực Đơn (CRUD)",
    },
    {
      key: "nhan-vien",
      icon: <TeamOutlined />,
      label: "Quản Lý Nhân Viên (CRUD)",
    },
  ];
  const [ThongTinNhanVien, setThongTinNhanVien] = useState([]);
  const [ThongTinChiNhanh, setThongTinChiNhanh] = useState([]);
  useEffect(() => {
    const layThongTinProfile = async () => {
      try {
        const MaNhanVien = jwtDecode(
          localStorage.getItem("token_nhan_vien"),
        ).sub;
        const MaChiNhanh = localStorage.getItem("ma_chi_nhanh");

        const [resNhanVien, resChiNhanh] = await Promise.all([
          api.get("/api/quan-ly/truy-xuat-danh-sach-nv/", {
            params: { ma_nhan_vien: MaNhanVien },
          }),
          api.get("/api/thong-tin-chi-nhanh/", {
            params: { ma_chi_nhanh: MaChiNhanh },
          }),
        ]);

        const dataNV = resNhanVien.data.data[0];
        const dataCN = resChiNhanh.data.data[0];

        setThongTinNhanVien({
          ho_ten: dataNV.HoTen,
          sdt: dataNV.SDT,
          dia_chi: dataNV.DiaChi,
          ca_lam: dataNV.CaLam,
          vai_tro: dataNV.VaiTro,
        });

        setThongTinChiNhanh({
          ma_chi_nhanh: dataCN.MaChiNhanh,
          dia_chi: dataCN.DiaChi,
          sdt: dataCN.SDT,
          email: dataCN.Email,
          gio_mo_cuu: dataCN.GioMoCua,
        });
      } catch (error) {
        console.error("Lỗi khi tải dữ liệu Profile quản lý:", error);
        message.error("Không thể tải thông tin cá nhân và chi nhánh!");
      }
    };
    layThongTinProfile();
  }, []);

  const [DuLieuMonBanChay, setDuLieuMonBanChay] = useState([]);
  const [DanhSachTenMon, setDanhSachTenMon] = useState([]);
  const [ThoiGianMon, setThoiGianMon] = useState(null);
  const [PhamViMon, setPhamViMon] = useState(null);
  const [GioiHanMon, setGioiHanMon] = useState(5);
  const [UuTienMon, setUuTienMon] = useState("");
  useEffect(() => {
    const layDuLieuMon = async () => {
      try {
        const ChiNhanhHienTai = localStorage.getItem("ma_chi_nhanh");
        const params = {};

        if (UuTienMon) params.uu_tien = UuTienMon;
        else params.ma_chi_nhanh = ChiNhanhHienTai;

        if (ThoiGianMon && ThoiGianMon.length === 2) {
          params.thoi_gian_bat_dau = ThoiGianMon[0].format("YYYY-MM-DD");
          params.thoi_gian_ket_thuc = ThoiGianMon[1].format("YYYY-MM-DD");
        }
        if (GioiHanMon !== "all") params.gioi_han = GioiHanMon;
        else params.gioi_han = 9999999;
        if (PhamViMon) params.pham_vi = PhamViMon;

        const response = await api.get("/api/quan-ly/thong-ke-mon-an", {
          params,
        });
        const mapThoiGian = new Map();
        const setMonAnUnique = new Set();

        response.data.data.forEach((item) => {
          const mocX =
            UuTienMon === "ChiNhanh"
              ? `Cơ sở ${item.MaChiNhanh}`
              : item.ThoiGian || "Toàn bộ";

          setMonAnUnique.add(item.TenMon);

          if (!mapThoiGian.has(mocX)) {
            mapThoiGian.set(mocX, { ThoiGianHienThi: mocX });
          }

          const dongHienTai = mapThoiGian.get(mocX);
          dongHienTai[item.TenMon] =
            (dongHienTai[item.TenMon] || 0) + item.DoanhSoBanRa;
        });

        setDuLieuMonBanChay(Array.from(mapThoiGian.values()));
        setDanhSachTenMon(Array.from(setMonAnUnique));
      } catch (error) {
        message.error("Lỗi tải dữ liệu Món bán chạy!");
      }
    };
    layDuLieuMon();
  }, [ThoiGianMon, PhamViMon, GioiHanMon, UuTienMon]);

  const [DuLieuTaiChinh, setDuLieuTaiChinh] = useState([]);
  const [ThoiGianTC, setThoiGianTC] = useState(null);
  const [PhamViTC, setPhamViTC] = useState(null);
  const [UuTienTC, setUuTienTC] = useState("");
  useEffect(() => {
    const layDuLieuTaiChinh = async () => {
      try {
        const ChiNhanhHienTai = localStorage.getItem("ma_chi_nhanh");
        const params = {};

        if (UuTienTC) params.uu_tien = UuTienTC;
        else params.ma_chi_nhanh = ChiNhanhHienTai;

        if (ThoiGianTC && ThoiGianTC.length === 2) {
          params.thoi_gian_bat_dau = ThoiGianTC[0].format("YYYY-MM-DD");
          params.thoi_gian_ket_thuc = ThoiGianTC[1].format("YYYY-MM-DD");
        }
        if (PhamViTC) params.pham_vi = PhamViTC;

        const [resDoanhSo, resKinhPhi] = await Promise.all([
          api.get("/api/quan-ly/thong-ke-doanh-so", { params }),
          api.get("/api/quan-ly/thong-ke-kinh-phi", { params }),
        ]);

        const dataDoanhSo = resDoanhSo.data.data || [];
        const dataKinhPhi = resKinhPhi.data.data || [];

        const mapGopDuLieu = new Map();

        dataDoanhSo.forEach((item) => {
          const id = UuTienTC === "ChiNhanh" ? item.MaChiNhanh : item.ThoiGian;

          mapGopDuLieu.set(id, {
            DoanhSo: item.DoanhSo || 0,
            TongKinhPhi: 0,
            TenHienThi:
              UuTienTC === "ChiNhanh"
                ? `Cơ sở ${item.MaChiNhanh}`
                : item.ThoiGian,
          });
        });

        dataKinhPhi.forEach((item) => {
          const id = UuTienTC === "ChiNhanh" ? item.MaChiNhanh : item.ThoiGian;

          if (mapGopDuLieu.has(id)) {
            const dataHienTai = mapGopDuLieu.get(id);
            dataHienTai.TongKinhPhi = item.TongKinhPhi || 0;
            mapGopDuLieu.set(id, dataHienTai);
          } else {
            mapGopDuLieu.set(id, {
              DoanhSo: 0,
              TongKinhPhi: item.TongKinhPhi || 0,
              TenHienThi:
                UuTienTC === "ChiNhanh"
                  ? `Cơ sở ${item.MaChiNhanh}`
                  : item.ThoiGian,
            });
          }
        });

        const dataDaPhoiHop = Array.from(mapGopDuLieu.values());

        setDuLieuTaiChinh(dataDaPhoiHop);
      } catch (error) {
        message.error("Lỗi tải dữ liệu Đối chiếu tài chính!");
      }
    };
    layDuLieuTaiChinh();
  }, [ThoiGianTC, PhamViTC, UuTienTC]);

  const [dsMonAn, setDsMonAn] = useState([]);
  const [dsTheLoai, setDsTheLoai] = useState([]);
  const [isModalMonOpen, setIsModalMonOpen] = useState(false);
  const [monDangSua, setMonDangSua] = useState(null);
  const [formSuaMon] = Form.useForm();
  const [isModalThemMonOpen, setIsModalThemMonOpen] = useState(false);
  const [formThemMon] = Form.useForm();
  const layDanhSachMon = async () => {
    try {
      const MaChiNhanh = localStorage.getItem("ma_chi_nhanh");
      const res = await api.get("/api/thong-tin-thuc-don", {
        params: { ma_chi_nhanh: MaChiNhanh },
      });
      setDsMonAn(Array.isArray(res.data.data) ? res.data.data : []);
    } catch (error) {
      message.error("Lỗi khi tải danh sách thực đơn!");
    }
  };
  const layDanhSachTheLoai = async () => {
    try {
      const res = await api.get("/api/thong-tin-the-loai-mon");
      setDsTheLoai(res.data.data);
    } catch (error) {
      console.error("Lỗi khi tải danh sách thể loại", error);
    }
  };
  useEffect(() => {
    if (trangHienTai === "thuc-don") {
      layDanhSachMon();
      layDanhSachTheLoai();
      layDanhSachBan();
    }
  }, [trangHienTai]);
  const ChinhSuaThongTinMonAn = async (values) => {
    try {
      const MaChiNhanh = localStorage.getItem("ma_chi_nhanh");
      const payload = {
        don_gia: values.DonGia,
      };

      if (monDangSua) {
        await api.put(
          `/api/quan-ly/chinh-sua-thong-tin-mon-an/${MaChiNhanh}/${monDangSua.MaMonAn}`,
          payload,
        );
        message.success("Cập nhật thành công!");
      } else {
        await api.post("/api/quan-ly/them-mon-moi", payload);
        message.success("Thêm mới thành công!");
      }

      setIsModalMonOpen(false);
      formSuaMon.resetFields();
      layDanhSachMon();
    } catch (error) {
      message.error("Có lỗi xảy ra khi lưu!");
      console.error("Chi tiết lỗi 422:", error.response?.data);
    }
  };
  const ChinhSuaTrangThaiMonAn = async (record, TrangThaiMoi) => {
    try {
      const MaChiNhanh = localStorage.getItem("ma_chi_nhanh");

      await api.put(
        `/api/quan-ly/chinh-trang-thai-mon-an/${MaChiNhanh}/${record.MaMonAn}/${TrangThaiMoi}`,
      );

      const cauThongBao =
        TrangThaiMoi === 1
          ? "Đã mở bán lại món ăn!"
          : "Đã ngừng phục vụ món này!";
      message.success(cauThongBao);

      layDanhSachMon();
    } catch (error) {
      message.error("Lỗi khi cập nhật trạng thái món!");
      console.error(error);
    }
  };
  const ThemMonMoi = async (values) => {
    try {
      const maChiNhanh = localStorage.getItem("ma_chi_nhanh");

      const payload = {
        ten_mon: values.TenMon,
        hinh_anh: values.HinhAnh || "",
        don_gia: values.DonGia,
        thong_tin_mo_ta: values.ThongTinMoTa || "",
        ma_the_loai: values.MaTheLoai,
        ma_chi_nhanh: maChiNhanh,
      };

      const res = await api.post(
        `/api/quan-ly/them-mon-moi/${maChiNhanh}`,
        payload,
      );

      message.success(res.data.message || "Thêm món mới thành công!");
      setIsModalThemMonOpen(false);
      formThemMon.resetFields();
      layDanhSachMon();
    } catch (error) {
      message.error("Lỗi khi thêm món mới!");
      console.error(error);
    }
  };
  const columnsThucDon = [
    {
      title: "Tên món",
      dataIndex: "TenMon",
      key: "TenMon",
      fontWeight: "bold",
    },
    {
      title: "Hình ảnh",
      key: "HinhAnh",
      width: 100,
      align: "center",
      render: (_, record) => {
        const url = record.HinhAnh;

        return (
          <img
            src={url || "https://placehold.co/60x60?text=No+Image"}
            alt={record.TenMon || "Món ăn"}
            style={{
              width: 60,
              height: 60,
              borderRadius: "8px",
              objectFit: "cover",
              border: "1px solid #f0f0f0",
              boxShadow: "0 2px 4px rgba(0,0,0,0.05)",
            }}
            onError={(e) => {
              e.target.src = "https://placehold.co/60x60?text=No+Image";
            }}
          />
        );
      },
    },
    {
      title: "Đơn giá",
      dataIndex: "DonGia",
      key: "DonGia",
      render: (gia) => <Tag color="green">{gia.toLocaleString()} đ</Tag>,
    },
    {
      title: "Thể loại",
      dataIndex: "TenTheLoai",
      key: "TenTheLoai",
      fontWeight: "bold",
    },
    { title: "Mô tả", dataIndex: "ThongTinMon", key: "ThongTinMon" },
    {
      title: "Phục vụ",
      dataIndex: "CoSan",
      key: "CoSan",
      render: (status) => {
        let color = status === 1 ? "green" : "orange";
        let text = status === 1 ? "Đang bán" : "Ngừng bán";
        return <Tag color={color}>{text}</Tag>;
      },
    },
    {
      title: "Hành động",
      key: "action",
      render: (_, record) => {
        const TrangThaiHientai = record.CoSan === 0;

        return (
          <Space size="middle">
            <Button
              type="primary"
              ghost
              icon={<EditOutlined />}
              onClick={() => {
                setMonDangSua(record);
                formSuaMon.setFieldsValue(record);
                setIsModalMonOpen(true);
              }}
            >
              Sửa
            </Button>

            {TrangThaiHientai ? (
              <Popconfirm
                title="Bạn muốn mở bán lại món này?"
                onConfirm={() => ChinhSuaTrangThaiMonAn(record, 1)}
                okText="Mở bán"
                cancelText="Hủy"
              >
                <Button
                  style={{
                    background: "#52c41a",
                    color: "#fff",
                    borderColor: "#52c41a",
                  }}
                >
                  Mở bán
                </Button>
              </Popconfirm>
            ) : (
              <Popconfirm
                title="Bạn có chắc muốn ngừng phục vụ món này?"
                onConfirm={() => ChinhSuaTrangThaiMonAn(record, 0)}
                okText="Đồng ý"
                cancelText="Hủy"
                okButtonProps={{ danger: true }}
              >
                <Button danger>Ngưng bán</Button>
              </Popconfirm>
            )}
          </Space>
        );
      },
    },
  ];
  const [tuKhoaTimKiem, setTuKhoaTimKiem] = useState("");
  const [boLocTheLoai, setBoLocTheLoai] = useState(null);
  const [boLocTrangThai, setBoLocTrangThai] = useState(null);
  const danhSachMonHienThi = dsMonAn.filter((mon) => {
    const tenMon = mon.TenMon ? mon.TenMon.toLowerCase() : "";
    const tuKhoa = tuKhoaTimKiem.toLowerCase();
    const khopTuKhoa = tenMon.includes(tuKhoa);
    const khopTheLoai = boLocTheLoai ? mon.MaTheLoai === boLocTheLoai : true;
    const khopTrangThai =
      boLocTrangThai === 0 || boLocTrangThai === 1
        ? mon.CoSan === boLocTrangThai
        : true;
    return khopTuKhoa && khopTheLoai && khopTrangThai;
  });

  const [dsBanAn, setDsBanAn] = useState([]);
  const [isModalBanOpen, setIsModalBanOpen] = useState(false);
  const [banDangSua, setBanDangSua] = useState(null);
  const [formBan] = Form.useForm();
  const layDanhSachBan = async () => {
    try {
      const maChiNhanh = localStorage.getItem("ma_chi_nhanh");
      const res = await api.get(`/api/ds-ban-an/${maChiNhanh}`);
      setDsBanAn(res.data.data || []);
    } catch (error) {
      message.error("Lỗi khi tải danh sách bàn ăn!");
    }
  };
  const ChinhSuaThongTinBanAn = async (values) => {
    try {
      const maChiNhanh = localStorage.getItem("ma_chi_nhanh");
      const payload = {
        ma_chi_nhanh: parseInt(maChiNhanh),
        vi_tri: values.ViTri,
        so_luong_cho_ngoi: values.SoLuongChoNgoi,
      };

      if (banDangSua) {
        await api.put(
          `/api/quan-ly/chinh-sua-ban-an/${maChiNhanh}/${banDangSua.MaBan}`,
          payload,
        );
        message.success("Cập nhật bàn ăn thành công!");
      } else {
        await api.post("/api/quan-ly/them-ban-an", payload);
        message.success("Thêm bàn mới thành công!");
      }
      setIsModalBanOpen(false);
      formBan.resetFields();
      layDanhSachBan();
    } catch (error) {
      message.error("Lỗi khi lưu thông tin bàn!");
    }
  };
  const ChinhTrangTrangThaiBan = async (MaBan, TrangThaiMoi) => {
    try {
      const maChiNhanh = localStorage.getItem("ma_chi_nhanh");
      await api.put(
        `/api/quan-ly/chinh-trang-thai-ban-an/${maChiNhanh}/${MaBan}/${TrangThaiMoi}`,
      );
      message.success(
        TrangThaiMoi === 1 ? "Bàn đang hoạt động" : "Bàn ngưng hoạt động",
      );
      layDanhSachBan();
    } catch (error) {
      message.error("Lỗi khi cập nhật trạng thái bàn!");
    }
  };
  const columnsBanAn = [
    {
      title: "STT",
      dataIndex: "STT",
      key: "STT",
      width: 60,
      align: "center",
      fontWeight: "bold",
    },
    { title: "Khu vực / Vị trí", dataIndex: "ViTri", key: "ViTri" },
    {
      title: "Số chỗ ngồi",
      dataIndex: "SoLuongChoNgoi",
      key: "SoLuongChoNgoi",
      render: (val) => `${val} Chỗ ngồi`,
    },
    {
      title: "Hoạt động",
      dataIndex: "TinhTrangSuDung",
      key: "TinhTrangSuDung",
      render: (status) => {
        const colorMap = {
          BanTrong: "green",
          DangSuDung: "red",
          CanThanhToan: "orange",
          DaThanhToan: "blue",
        };
        return (
          <Tag color={colorMap[status] || "default"}>
            {status === "BanTrong" ? "Bàn trống" : status}
          </Tag>
        );
      },
    },
    {
      title: "Trạng thái",
      dataIndex: "CoSan",
      key: "CoSan",
      render: (status) => {
        const TrangThai = status == 1;
        return (
          <Tag color={TrangThai ? "green" : "red"}>
            {TrangThai ? "Đang phục vụ" : "Ngừng phục vụ"}
          </Tag>
        );
      },
    },
    {
      title: "Hành động",
      key: "action",
      render: (_, record) => {
        const TrangThai = record.CoSan == 1;

        return (
          <Space size="middle">
            <Button
              type="primary"
              ghost
              icon={<EditOutlined />}
              onClick={() => {
                setBanDangSua(record);
                formBan.setFieldsValue(record);
                setIsModalBanOpen(true);
              }}
            >
              Sửa
            </Button>

            {TrangThai ? (
              <Popconfirm
                title="Tạm ngưng phục vụ bàn này?"
                onConfirm={() => ChinhTrangTrangThaiBan(record.MaBan, 0)}
                okText="Ngưng"
                okButtonProps={{ danger: true }}
              >
                <Button danger>Ngưng phục vụ</Button>
              </Popconfirm>
            ) : (
              <Popconfirm
                title="Mở lại bàn này?"
                onConfirm={() => ChinhTrangTrangThaiBan(record.MaBan, 1)}
                okText="Mở"
              >
                <Button
                  style={{
                    background: "#52c41a",
                    color: "#fff",
                    borderColor: "#52c41a",
                  }}
                >
                  Mở phục vụ
                </Button>
              </Popconfirm>
            )}
          </Space>
        );
      },
    },
  ];

  const [dsNhanVien, setDsNhanVien] = useState([]);
  const [isModalNVOpen, setIsModalNVOpen] = useState(false);
  const [nvDangSua, setNvDangSua] = useState(null);
  const [formNV] = Form.useForm();
  const token = localStorage.getItem("token_nhan_vien");
  const maNhanVienHienTai = jwtDecode(token).sub;
  const layDanhSachNhanVien = async () => {
    try {
      const maChiNhanh = localStorage.getItem("ma_chi_nhanh");
      const res = await api.get("/api/quan-ly/truy-xuat-danh-sach-nv/", {
        params: { ma_chi_nhanh: maChiNhanh },
      });
      setDsNhanVien(res.data.data);
    } catch (error) {
      message.error("Lỗi khi tải danh sách nhân viên!");
    }
  };
  useEffect(() => {
    if (trangHienTai === "thuc-don") {
      layDanhSachMon();
      layDanhSachTheLoai();
      layDanhSachBan();
    }
    if (trangHienTai === "nhan-vien") {
      layDanhSachNhanVien();
    }
  }, [trangHienTai]);
  const ChinhSuaThongTinNhanVien = async (values) => {
    try {
      const maChiNhanh = localStorage.getItem("ma_chi_nhanh");

      const payload = {
        ho_ten: values.HoTen,
        sdt: values.SDT,
        dia_chi: values.DiaChi || "",
        ca_lam: values.CaLam || "",
        vai_tro: values.VaiTro,
        luong: values.Luong || 0,
        anh_the: values.AnhThe || "",
      };

      if (nvDangSua) {
        await api.put(
          `/api/quan-ly/chinh-sua-nv/${maChiNhanh}/${nvDangSua.MaNhanVien}`,
          payload,
        );
        message.success("Cập nhật thông tin nhân viên thành công!");
      } else {
        await api.post("/api/quan-ly/them-nhan-vien-moi", payload);
        message.success("Thêm nhân viên mới thành công!");
      }

      setIsModalNVOpen(false);
      formNV.resetFields();
      layDanhSachNhanVien();
    } catch (error) {
      message.error("Lỗi khi lưu thông tin nhân viên!");
      console.error(error);
    }
  };
  const ChinhSuaTrangThaiNhanVien = async (record, TrangThaiMoi) => {
    try {
      const maChiNhanh = localStorage.getItem("ma_chi_nhanh");

      await api.put(
        `/api/quan-ly/chinh-trang-thai-nv/${maChiNhanh}/${record.MaNhanVien}/${TrangThaiMoi}`,
      );

      message.success(
        TrangThaiMoi == 1
          ? "Đã khôi phục trạng thái Đang làm việc!"
          : "Đã cập nhật trạng thái Nghỉ việc!",
      );
      layDanhSachNhanVien();
    } catch (error) {
      message.error("Lỗi khi cập nhật trạng thái nhân viên!");
      console.error(error);
    }
  };
  const columnsNhanVien = [
    {
      title: "Ảnh đại diện",
      dataIndex: "AnhThe",
      key: "AnhThe",
      width: 100,
      align: "center",
      render: (url) => (
        <Avatar
          src={url}
          size={45}
          icon={<UserOutlined />}
          style={{ border: "1px solid #d9d9d9", backgroundColor: "#f5f5f5" }}
        />
      ),
    },
    {
      title: "Họ và Tên",
      dataIndex: "HoTen",
      key: "HoTen",
      fontWeight: "bold",
      color: "#004d33",
    },
    {
      title: "Vai trò",
      dataIndex: "VaiTro",
      key: "VaiTro",
      render: (vt) => <Tag color="blue">{vt}</Tag>,
    },
    { title: "Số điện thoại", dataIndex: "SDT", key: "SDT" },
    {
      title: "Ca làm việc",
      dataIndex: "CaLam",
      key: "CaLam",
      render: (ca) =>
        ca
          ? ca.split(",").map((c) => (
              <Tag color="purple" key={c}>
                {c.trim()}
              </Tag>
            ))
          : "Chưa phân ca",
    },
    {
      title: "Tình trạng",
      dataIndex: "TinhTrangLamViec",
      key: "TinhTrangLamViec",
      render: (status) => {
        const DangLam = status === 1;
        return (
          <Tag color={DangLam ? "green" : "red"}>
            {DangLam ? "Đang làm việc" : "Đã nghỉ"}
          </Tag>
        );
      },
    },
    {
      title: "Hành động",
      key: "action",
      render: (_, record) => {
        const DangLam = record.TinhTrangLamViec === 1;

        return (
          <Space size="middle">
            <Button
              type="primary"
              ghost
              icon={<EditOutlined />}
              onClick={() => {
                setNvDangSua(record);
                formNV.setFieldsValue(record);
                setIsModalNVOpen(true);
              }}
            >
              Sửa
            </Button>

            {DangLam ? (
              <Popconfirm
                title="Xác nhận cho nhân viên này nghỉ việc?"
                onConfirm={() => ChinhSuaTrangThaiNhanVien(record, 0)}
                okText="Nghỉ việc"
                okButtonProps={{ danger: true }}
                cancelText="Hủy"
              >
                <Button danger icon={<DeleteOutlined />}>
                  Nghỉ việc
                </Button>
              </Popconfirm>
            ) : (
              <Popconfirm
                title="Khôi phục nhân viên này đi làm lại?"
                onConfirm={() => ChinhSuaTrangThaiNhanVien(record, 1)}
                okText="Khôi phục"
                cancelText="Hủy"
              >
                <Button
                  style={{
                    background: "#52c41a",
                    color: "#fff",
                    borderColor: "#52c41a",
                  }}
                >
                  Đi làm lại
                </Button>
              </Popconfirm>
            )}
          </Space>
        );
      },
    },
  ];
  const nguoiQuanLy = dsNhanVien.find(
    (nv) => String(nv.MaNhanVien) === maNhanVienHienTai,
  );
  const danhSachNhanVienKhac = dsNhanVien.filter(
    (nv) => String(nv.MaNhanVien) !== maNhanVienHienTai,
  );

  return (
    <Layout style={{ minHeight: "100vh", background: "#f5f7fa" }}>
      <Header
        style={{
          display: "flex",
          alignItems: "center",
          background: "#fff",
          padding: 0,
          boxShadow: "0 2px 8px rgba(0,0,0,0.06)",
          position: "sticky",
          top: 0,
          zIndex: 10,
        }}
      >
        <div
          style={{
            padding: "0 30px",
            fontSize: "18px",
            fontWeight: "bold",
            color: "#004d33",
            borderRight: "1px solid #f0f0f0",
          }}
        >
          HỆ THỐNG QUẢN TRỊ
        </div>
        <Menu
          mode="horizontal"
          selectedKeys={[trangHienTai]}
          onClick={(e) => setTrangHienTai(e.key)}
          items={danhMucMenu}
          style={{ flex: 1, borderBottom: "none", fontWeight: 500 }}
        />
      </Header>

      <Content
        style={{
          padding: "30px",
          maxWidth: "1600px",
          margin: "0 auto",
          width: "100%",
        }}
      >
        {trangHienTai === "dashboard" && (
          <>
            <Title
              level={2}
              style={{
                color: "#004d33",
                marginBottom: "30px",
                textAlign: "center",
              }}
            >
              DASHBOARD QUẢN TRỊ KINH DOANH
            </Title>
            <Card
              style={{
                borderRadius: "12px",
                boxShadow: "0 4px 12px rgba(0,0,0,0.05)",
                marginBottom: "30px",
              }}
            >
              <Row gutter={24}>
                <Col span={12} style={{ borderRight: "1px solid #f0f0f0" }}>
                  <Descriptions
                    title={
                      <>
                        <ShopOutlined
                          style={{ color: "#1890ff", marginRight: 8 }}
                        />
                        Thông tin Cơ sở
                      </>
                    }
                    column={1}
                    labelStyle={{ fontWeight: 500, color: "#8c8c8c" }}
                  >
                    <Descriptions.Item label="Chi nhánh hiện tại">
                      <Badge
                        status="success"
                        text={
                          <strong style={{ fontSize: "15px" }}>
                            Cơ sở {ThongTinChiNhanh.ma_chi_nhanh}
                          </strong>
                        }
                      />
                    </Descriptions.Item>
                    <Descriptions.Item
                      label={
                        <>
                          <EnvironmentOutlined /> Địa chỉ
                        </>
                      }
                    >
                      {ThongTinChiNhanh.dia_chi}
                    </Descriptions.Item>
                    <Descriptions.Item
                      label={
                        <>
                          <PhoneOutlined /> Hotline
                        </>
                      }
                    >
                      {ThongTinChiNhanh.sdt}
                    </Descriptions.Item>
                    <Descriptions.Item label="Email chi nhánh">
                      {ThongTinChiNhanh.email || "Chưa cập nhật"}
                    </Descriptions.Item>
                    <Descriptions.Item label="Giờ mở cửa">
                      {ThongTinChiNhanh.gio_mo_cuu || "Chưa cập nhật"}
                    </Descriptions.Item>
                  </Descriptions>
                </Col>

                <Col span={12} style={{ paddingLeft: "30px" }}>
                  <Descriptions
                    title={
                      <>
                        <UserOutlined
                          style={{ color: "#52c41a", marginRight: 8 }}
                        />
                        Thông tin Quản trị viên
                      </>
                    }
                    column={1}
                    labelStyle={{ fontWeight: 500, color: "#8c8c8c" }}
                  >
                    <Descriptions.Item label="Họ và tên">
                      <strong style={{ fontSize: "15px", color: "#004d33" }}>
                        {ThongTinNhanVien.ho_ten}
                      </strong>
                    </Descriptions.Item>
                    <Descriptions.Item label="Phân quyền">
                      <Badge color="gold" text={ThongTinNhanVien.vai_tro} />
                    </Descriptions.Item>
                    <Descriptions.Item label="SĐT cá nhân">
                      {ThongTinNhanVien.sdt}
                    </Descriptions.Item>
                    <Descriptions.Item label="Địa chỉ liên hệ">
                      {ThongTinNhanVien.dia_chi}
                    </Descriptions.Item>
                    <Descriptions.Item label="Ca trực">
                      {ThongTinNhanVien.ca_lam || "Chưa xác định"}
                    </Descriptions.Item>
                    <Descriptions.Item label="Trạng thái hệ thống">
                      <Badge status="processing" text="Đang trực tuyến" />
                    </Descriptions.Item>
                  </Descriptions>
                </Col>
              </Row>
            </Card>
            <Row gutter={24}>
              <Col span={12}>
                <Card
                  title="🏆 TOP MÓN BÁN CHẠY"
                  style={{
                    borderRadius: "12px",
                    boxShadow: "0 4px 12px rgba(0,0,0,0.05)",
                  }}
                >
                  <Space
                    wrap
                    style={{
                      marginBottom: 20,
                      width: "100%",
                      justifyContent: "center",
                    }}
                  >
                    <RangePicker
                      format="DD/MM/YYYY"
                      style={{ width: 220 }}
                      onChange={(dates) => setThoiGianMon(dates)}
                      allowClear
                    />
                    <Select
                      placeholder="Chọn phạm vi"
                      value={PhamViMon}
                      style={{ width: 120 }}
                      onChange={setPhamViMon}
                      options={[
                        { value: "Ngay", label: "Theo ngày" },
                        { value: "Thang", label: "Theo tháng" },
                        { value: "Nam", label: "Theo năm" },
                      ]}
                    />
                    <Select
                      style={{ width: 220 }}
                      value={UuTienMon}
                      onChange={setUuTienMon}
                      options={[
                        { value: "", label: "Cơ sở hiện tại" },
                        {
                          value: "ChiNhanh",
                          label: "Toàn hệ thống (Theo Cơ sở)",
                        },
                        {
                          value: "ThoiGian",
                          label: "Toàn hệ thống (Theo Ngày)",
                        },
                      ]}
                    />
                    <Select
                      value={GioiHanMon}
                      style={{ width: 80 }}
                      onChange={setGioiHanMon}
                      options={[
                        { value: 5, label: "Top 5" },
                        { value: 10, label: "Top 10" },
                        { value: "all", label: "Tất cả" },
                      ]}
                    />
                  </Space>

                  {DuLieuMonBanChay.length === 0 ? (
                    <div
                      style={{
                        textAlign: "center",
                        padding: "50px",
                        color: "#999",
                      }}
                    >
                      Chưa có dữ liệu.
                    </div>
                  ) : (
                    <div
                      style={{
                        width: "100%",
                        height: 400,
                        minWidth: 1,
                        minHeight: 1,
                      }}
                    >
                      <ResponsiveContainer>
                        <BarChart
                          data={DuLieuMonBanChay}
                          margin={{ top: 20, right: 30, left: 0, bottom: 80 }}
                        >
                          <CartesianGrid
                            strokeDasharray="3 3"
                            vertical={false}
                          />
                          <XAxis
                            dataKey="ThoiGianHienThi"
                            angle={-45}
                            textAnchor="end"
                            height={80}
                            interval={0}
                            tick={{ fontSize: 11 }}
                          />
                          <YAxis tickFormatter={(val) => val} />
                          <RechartsTooltip
                            cursor={{ fill: "transparent" }}
                            formatter={(value, name) => [
                              `${value} lượt gọi`,
                              name,
                            ]}
                          />

                          {/* ========================================================
                        CHÚ Ý 1: CHUYỂN CHÚ THÍCH (LEGEND) XUỐNG DƯỚI
                        Thay đổi verticalAlign="top" -> "bottom" 
                      ======================================================== */}
                          <Legend
                            verticalAlign="bottom"
                            iconType="circle"
                            iconSize={10}
                            wrapperStyle={{ paddingTop: 10, fontSize: 12 }}
                          />

                          {DanhSachTenMon.map((tenMon, index) => {
                            const mangMau = [
                              "#fa8c16",
                              "#1890ff",
                              "#52c41a",
                              "#f5222d",
                              "#722ed1",
                              "#13c2c2",
                              "#eb2f96",
                              "#faad14",
                            ];
                            return (
                              <Bar
                                key={tenMon}
                                dataKey={tenMon}
                                name={tenMon}
                                fill={mangMau[index % mangMau.length]}
                                barSize={15}
                                radius={[2, 2, 0, 0]}
                              />
                            );
                          })}
                        </BarChart>
                      </ResponsiveContainer>
                    </div>
                  )}
                </Card>
              </Col>

              <Col span={12}>
                <Card
                  title="⚖️ ĐỐI CHIẾU DOANH THU & KINH PHÍ"
                  style={{
                    borderRadius: "12px",
                    boxShadow: "0 4px 12px rgba(0,0,0,0.05)",
                  }}
                >
                  <Space
                    wrap
                    style={{
                      marginBottom: 20,
                      width: "100%",
                      justifyContent: "center",
                    }}
                  >
                    <RangePicker
                      format="DD/MM/YYYY"
                      onChange={(dates) => setThoiGianTC(dates)}
                      allowClear
                    />
                    <Select
                      placeholder="Chọn phạm vi"
                      style={{ width: 110 }}
                      onChange={setPhamViTC}
                      allowClear
                      options={[
                        { value: "Ngay", label: "Theo Ngày" },
                        { value: "Thang", label: "Theo Tháng" },
                        { value: "Nam", label: "Theo Năm" },
                      ]}
                    />
                    <Select
                      style={{ width: 220 }}
                      value={UuTienTC}
                      onChange={setUuTienTC}
                      options={[
                        { value: "", label: "Cơ sở hiện tại" },
                        {
                          value: "ChiNhanh",
                          label: "Toàn hệ thống (Theo Cơ sở)",
                        },
                        {
                          value: "ThoiGian",
                          label: "Toàn hệ thống (Theo Ngày)",
                        },
                      ]}
                    />
                  </Space>

                  {DuLieuTaiChinh.length === 0 ? (
                    <div
                      style={{
                        textAlign: "center",
                        padding: "50px",
                        color: "#999",
                      }}
                    >
                      Chưa có dữ liệu.
                    </div>
                  ) : (
                    <div
                      style={{
                        width: "100%",
                        height: 400,
                        minWidth: 1,
                        minHeight: 1,
                      }}
                    >
                      <ResponsiveContainer>
                        <BarChart
                          data={DuLieuTaiChinh}
                          margin={{ top: 20, right: 30, left: 10, bottom: 80 }}
                        >
                          <CartesianGrid
                            strokeDasharray="3 3"
                            vertical={false}
                          />
                          <XAxis
                            dataKey="TenHienThi"
                            angle={-45}
                            textAnchor="end"
                            height={80}
                            interval={0}
                            tick={{ fontSize: 11 }}
                          />
                          <YAxis
                            tickFormatter={(val) => `${val / 1000000}M đ`}
                          />
                          <RechartsTooltip
                            formatter={(val) => `${val.toLocaleString()} đ`}
                          />
                          <Legend
                            verticalAlign="bottom"
                            iconType="circle"
                            iconSize={10}
                            wrapperStyle={{ paddingTop: 10, fontSize: 12 }}
                          />

                          <Bar
                            dataKey="TongKinhPhi"
                            name="Kinh Phí"
                            fill="#ff4d4f"
                            radius={[4, 4, 0, 0]}
                            barSize={20}
                          />
                          <Bar
                            dataKey="DoanhSo"
                            name="Doanh số"
                            fill="#52c41a"
                            radius={[4, 4, 0, 0]}
                            barSize={20}
                          />
                        </BarChart>
                      </ResponsiveContainer>
                    </div>
                  )}
                </Card>
              </Col>
            </Row>
          </>
        )}
        {trangHienTai === "thuc-don" && (
          <Card
            style={{
              borderRadius: "12px",
              boxShadow: "0 4px 12px rgba(0,0,0,0.05)",
              minHeight: "600px",
            }}
          >
            <Tabs
              defaultActiveKey="mon-an"
              items={[
                {
                  key: "mon-an",
                  label: (
                    <>
                      <CoffeeOutlined /> Quản lý Món Ăn
                    </>
                  ),
                  children: (
                    <>
                      <div
                        style={{
                          display: "flex",
                          justifyContent: "space-between",
                          marginBottom: 16,
                          marginTop: 10,
                        }}
                      >
                        <Title
                          level={4}
                          style={{ color: "#004d33", margin: 0 }}
                        >
                          🍲 Danh sách Món Ăn
                        </Title>
                        <Button
                          type="primary"
                          icon={<PlusOutlined />}
                          onClick={() => {
                            formThemMon.resetFields();
                            setIsModalThemMonOpen(true);
                          }}
                        >
                          Thêm Món Mới
                        </Button>
                      </div>

                      <div
                        style={{
                          marginBottom: 20,
                          display: "flex",
                          gap: "16px",
                          background: "#fafafa",
                          padding: "16px",
                          borderRadius: "8px",
                        }}
                      >
                        <Input.Search
                          placeholder="Gõ tên món hoặc mô tả để tìm..."
                          allowClear
                          enterButton
                          onChange={(e) => setTuKhoaTimKiem(e.target.value)}
                          style={{ width: 350 }}
                        />
                        <Select
                          placeholder="Lọc theo thể loại"
                          allowClear
                          showSearch
                          optionFilterProp="label"
                          onChange={(value) =>
                            setBoLocTheLoai(value !== undefined ? value : "")
                          }
                          style={{ width: 250 }}
                          options={dsTheLoai.map((tl) => ({
                            value: tl.MaTheLoai,
                            label: tl.TenTheLoai,
                          }))}
                        />
                        <Select
                          placeholder="Trạng thái phục vụ"
                          allowClear
                          onChange={(value) =>
                            setBoLocTrangThai(value !== undefined ? value : "")
                          }
                          style={{ width: 180 }}
                          options={[
                            { value: 1, label: "Đang bán" },
                            { value: 0, label: "Ngừng bán" },
                          ]}
                        />
                      </div>

                      <Title
                        level={5}
                        style={{ marginTop: 20, color: "#1890ff" }}
                      ></Title>
                      <Table
                        columns={columnsThucDon}
                        dataSource={danhSachMonHienThi}
                        rowKey={(record) => record.MaMonAn}
                        bordered
                        pagination={{ pageSize: 5 }}
                      />

                      <Modal
                        title={monDangSua ? "Cập nhật Món Ăn" : "Thêm Món Mới"}
                        open={isModalMonOpen}
                        onCancel={() => setIsModalMonOpen(false)}
                        onOk={() => formSuaMon.submit()}
                        okText="Lưu dữ liệu"
                        cancelText="Hủy"
                      >
                        <Form
                          form={formSuaMon}
                          layout="vertical"
                          onFinish={ChinhSuaThongTinMonAn}
                        >
                          <Form.Item
                            name="DonGia"
                            label="Đơn giá (VNĐ)"
                            rules={[
                              { required: true, message: "Vui lòng nhập giá!" },
                            ]}
                          >
                            <InputNumber
                              style={{ width: "100%" }}
                              formatter={(value) =>
                                `${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                              }
                            />
                          </Form.Item>
                        </Form>
                      </Modal>
                      <Modal
                        title="Thêm Món Mới"
                        open={isModalThemMonOpen}
                        onCancel={() => {
                          setIsModalThemMonOpen(false);
                          formThemMon.resetFields();
                        }}
                        onOk={() => formThemMon.submit()}
                        okText="Thêm mới"
                        cancelText="Hủy"
                      >
                        <Form
                          form={formThemMon}
                          layout="vertical"
                          onFinish={ThemMonMoi}
                        >
                          <Form.Item
                            name="TenMon"
                            label="Tên món ăn"
                            rules={[
                              {
                                required: true,
                                message: "Vui lòng nhập tên món!",
                              },
                            ]}
                          >
                            <Input placeholder="Ví dụ: Lẩu Thái Cay" />
                          </Form.Item>

                          <Form.Item
                            name="MaTheLoai"
                            label="Thể loại"
                            rules={[
                              {
                                required: true,
                                message: "Vui lòng chọn thể loại!",
                              },
                            ]}
                          >
                            <Select placeholder="-- Chọn thể loại --">
                              {dsTheLoai.map((tl) => (
                                <Select.Option
                                  key={tl.MaTheLoai}
                                  value={tl.MaTheLoai}
                                >
                                  {tl.TenTheLoai}
                                </Select.Option>
                              ))}
                            </Select>
                          </Form.Item>

                          <Form.Item
                            name="DonGia"
                            label="Đơn giá (VNĐ)"
                            rules={[
                              { required: true, message: "Vui lòng nhập giá!" },
                            ]}
                          >
                            <InputNumber
                              style={{ width: "100%" }}
                              min={0}
                              formatter={(value) =>
                                `${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                              }
                            />
                          </Form.Item>

                          <Form.Item name="ThongTinMoTa" label="Mô tả ngắn">
                            <Input.TextArea
                              rows={3}
                              placeholder="Mô tả nguyên liệu, hương vị..."
                            />
                          </Form.Item>

                          <Form.Item
                            name="HinhAnh"
                            label="Đường dẫn hình ảnh (URL)"
                          >
                            <Input placeholder="https://link-hinh-anh-mon-an.png" />
                          </Form.Item>
                        </Form>
                      </Modal>
                    </>
                  ),
                },
                {
                  key: "ban-an",
                  label: (
                    <>
                      <ShopOutlined /> Quản lý Bàn Ăn
                    </>
                  ),
                  children: (
                    <>
                      <div
                        style={{
                          display: "flex",
                          justifyContent: "space-between",
                          marginBottom: 16,
                          marginTop: 10,
                        }}
                      >
                        <Title
                          level={4}
                          style={{ color: "#004d33", margin: 0 }}
                        >
                          🪑 Danh sách Bàn Ăn
                        </Title>
                        <Button
                          type="primary"
                          icon={<PlusOutlined />}
                          onClick={() => {
                            setBanDangSua(null);
                            formBan.resetFields();
                            setIsModalBanOpen(true);
                          }}
                        >
                          Thêm Bàn Mới
                        </Button>
                      </div>

                      <Table
                        columns={columnsBanAn}
                        dataSource={dsBanAn.map((ban, index) => ({
                          ...ban,
                          STT: index + 1,
                        }))}
                        rowKey="MaBan"
                        bordered
                        pagination={{ pageSize: 8 }}
                      />
                      <Modal
                        title={banDangSua ? "Cập nhật Bàn Ăn" : "Thêm Bàn Mới"}
                        open={isModalBanOpen}
                        onCancel={() => setIsModalBanOpen(false)}
                        onOk={() => formBan.submit()}
                        okText="Lưu dữ liệu"
                        cancelText="Hủy"
                      >
                        <Form
                          form={formBan}
                          layout="vertical"
                          onFinish={ChinhSuaThongTinBanAn}
                        >
                          <Form.Item
                            name="ViTri"
                            label="Vị trí"
                            rules={[
                              {
                                required: true,
                                message:
                                  "Nhập vị trí bàn (VD: Tầng 1, Ban công...)",
                              },
                            ]}
                          >
                            <Input placeholder="VD: Tầng 1 - Gần cửa sổ" />
                          </Form.Item>
                          <Form.Item
                            name="SoLuongChoNgoi"
                            label="Số lượng chỗ ngồi"
                            rules={[
                              { required: true, message: "Nhập số lượng chỗ!" },
                            ]}
                          >
                            <InputNumber
                              min={1}
                              max={20}
                              style={{ width: "100%" }}
                            />
                          </Form.Item>
                        </Form>
                      </Modal>
                    </>
                  ),
                },
              ]}
            />
          </Card>
        )}{" "}
        {trangHienTai === "nhan-vien" && (
          <div
            style={{ display: "flex", flexDirection: "column", gap: "20px" }}
          >
            {nguoiQuanLy && (
              <Badge.Ribbon text="QUẢN LÝ" color="red">
                <Card
                  style={{
                    borderRadius: "12px",
                    boxShadow: "0 8px 16px rgba(255, 77, 79, 0.1)",
                    background: "#fff1f0",
                    borderColor: "#ffa39e",
                  }}
                >
                  <Row gutter={24} align="middle">
                    <Col span={4} style={{ textAlign: "center" }}>
                      <div style={{ fontSize: "60px", color: "#ff4d4f" }}>
                        <UserOutlined />
                      </div>
                    </Col>
                    <Col span={16}>
                      <Title level={2} style={{ color: "#cf1322", margin: 0 }}>
                        {nguoiQuanLy.HoTen}
                      </Title>
                      <Text style={{ fontSize: "16px", color: "#8c8c8c" }}>
                        Mã số: {nguoiQuanLy.MaNhanVien} | SĐT: {nguoiQuanLy.SDT}
                      </Text>
                      <br />
                      <Text style={{ fontSize: "16px", color: "#8c8c8c" }}>
                        Địa chỉ: {nguoiQuanLy.DiaChi}
                      </Text>
                    </Col>
                    <Col span={4} style={{ textAlign: "right" }}>
                      <Button
                        type="primary"
                        danger
                        size="large"
                        onClick={() => {
                          setNvDangSua(nguoiQuanLy);
                          formNV.setFieldsValue(nguoiQuanLy);
                          setIsModalNVOpen(true);
                        }}
                      >
                        Cập nhật thông tin
                      </Button>
                    </Col>
                  </Row>
                </Card>
              </Badge.Ribbon>
            )}

            <Card
              style={{
                borderRadius: "12px",
                boxShadow: "0 4px 12px rgba(0,0,0,0.05)",
                minHeight: "500px",
              }}
            >
              <div
                style={{
                  display: "flex",
                  justifyContent: "space-between",
                  marginBottom: 16,
                }}
              >
                <Title level={4} style={{ color: "#004d33", margin: 0 }}>
                  👥 Danh sách Nhân sự cấp dưới
                </Title>
                <Button
                  type="primary"
                  icon={<PlusOutlined />}
                  onClick={() => {
                    setNvDangSua(null);
                    formNV.resetFields();
                    setIsModalNVOpen(true);
                  }}
                >
                  Tuyển thêm Nhân Viên
                </Button>
              </div>

              <Table
                columns={columnsNhanVien}
                dataSource={danhSachNhanVienKhac}
                rowKey="MaNhanVien"
                bordered
                pagination={{ pageSize: 6 }}
              />
            </Card>

            <Modal
              title={
                nvDangSua ? "Cập nhật Thông tin Nhân sự" : "Thêm Nhân Viên Mới"
              }
              open={isModalNVOpen}
              onCancel={() => setIsModalNVOpen(false)}
              onOk={() => formNV.submit()}
              okText="Lưu dữ liệu"
              cancelText="Hủy"
            >
              <Form
                form={formNV}
                layout="vertical"
                onFinish={ChinhSuaThongTinNhanVien}
              >
                <Form.Item
                  name="HoTen"
                  label="Họ và Tên"
                  rules={[{ required: true, message: "Nhập tên nhân viên!" }]}
                >
                  <Input placeholder="Nguyễn Văn A" />
                </Form.Item>

                <Form.Item
                  name="VaiTro"
                  label="Vai trò"
                  rules={[
                    { required: true, message: "Vui lòng điền vai trò!" },
                  ]}
                >
                  <Input placeholder="nhân viên" />
                </Form.Item>

                <Form.Item
                  name="SDT"
                  label="Số điện thoại"
                  rules={[{ required: true, message: "Nhập SĐT!" }]}
                >
                  <Input placeholder="09xxxxxxx" />
                </Form.Item>

                <Form.Item
                  name="Luong"
                  label="Mức lương (VNĐ)"
                  rules={[{ required: true, message: "Nhập mức lương!" }]}
                >
                  <InputNumber
                    style={{ width: "100%" }}
                    min={0}
                    formatter={(value) =>
                      `${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                    }
                  />
                </Form.Item>

                <Form.Item
                  name="CaLam"
                  label="Ca làm việc (Cách nhau bằng dấu phẩy)"
                >
                  <Input placeholder="VD: Ca Sáng, Ca Tối" />
                </Form.Item>
                <Form.Item name="DiaChi" label="Địa chỉ liên hệ">
                  <Input placeholder="Phường/Quận/Thành phố..." />
                </Form.Item>

                <Form.Item name="AnhThe" label="Đường dẫn ảnh đại diện (URL)">
                  <Input placeholder="https://link-hinh-anh-nhan-vien.png" />
                </Form.Item>
              </Form>
            </Modal>
          </div>
        )}{" "}
      </Content>
    </Layout>
  );
};

export default HoatDongQuanLy;
