import { useEffect, useState } from "react";
import {
  Card,
  Button,
  Row,
  Col,
  Table,
  Typography,
  Modal,
  FloatButton,
  Badge,
  message,
  Input,
  Radio,
  Checkbox,
  Divider,
  InputNumber,
  Alert,
  Tag,
} from "antd";
import {
  ShoppingCartOutlined,
  CloseOutlined,
  UserOutlined,
  EnvironmentOutlined,
  ShopOutlined,
  InfoCircleOutlined,
  ClockCircleOutlined,
} from "@ant-design/icons";
import { useSearchParams, useNavigate } from "react-router-dom";
import { useTempStore } from "./store";
import AppHeader from "./HeaderTrangChu";
import api from "./api";

const { Title, Text } = Typography;

const TrangDatMon = () => {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const maChiNhanh = searchParams.get("chiNhanh");
  const maBanAn = searchParams.get("ban");

  const [ThucDon, setThucDon] = useState([]);
  const [thongTinChiNhanh, setThongTinChiNhanh] = useState(null);
  const [loading, setLoading] = useState(true);

  const [isCartVisible, setIsCartVisible] = useState(false);
  const [isCheckoutVisible, setIsCheckoutVisible] = useState(false);

  const [Sdt, setSdt] = useState("");
  const [TrangThaiSdt, setTrangThaiSdt] = useState(null);
  const [HoTen, setHoTen] = useState("");
  const [TaoTaiKhoan, setTaoTaiKhoan] = useState(false);
  const [PhuongThucThanhToan, setPhuongThucThanhToan] = useState("tien_mat");

  const [activeOrder, setActiveOrder] = useState(null);
  const [isStatusModalVisible, setIsStatusModalVisible] = useState(false);
  const [ptThanhToanStatus, setPtThanhToanStatus] = useState("tien_mat");
  const [submittingPayment, setSubmittingPayment] = useState(false);

  const PhieuGoiMon = useTempStore((state) => state.PhieuGoiMon);
  const ThemMon = useTempStore((state) => state.ThemMon);
  const XoaMon = useTempStore((state) => state.XoaMon);
  const TangSoLuong = useTempStore((state) => state.TangSoLuong);
  const GiamSoLuong = useTempStore((state) => state.GiamSoLuong);
  const CapNhatSoLuong = useTempStore((state) => state.CapNhatSoLuong);
  const XoaPhieuGoiMon = useTempStore((state) => state.XoaPhieuGoiMon);

  const fetchActiveOrder = async (sdtParam = null) => {
    let currentSdt = sdtParam || Sdt;
    const savedSession = localStorage.getItem("khach_session");

    if (savedSession) {
      try {
        const parsed = JSON.parse(savedSession);
        if (parsed.sdt) currentSdt = parsed.sdt;
      } catch (e) {}
    }

    let params = {};
    if (maBanAn && maBanAn !== "null") {
      params.ma_ban_an = maBanAn;
    } else if (currentSdt) {
      params.sdt_khach = currentSdt;
    } else {
      return setActiveOrder(null);
    }

    try {
      const response = await api.get(`/api/khach/truy-xuat-phieu-goi-mon`, {
        params,
      });
      if (
        response.data.status === "success" &&
        response.data.data?.length > 0
      ) {
        setActiveOrder(response.data);
      } else {
        setActiveOrder(null);
      }
    } catch (error) {
      console.error("Lỗi lấy thông tin phiếu gọi món:", error);
      setActiveOrder(null);
    }
  };

  useEffect(() => {
    const savedSession = localStorage.getItem("khach_session");
    if (savedSession) {
      try {
        const parsed = JSON.parse(savedSession);
        if (parsed.sdt) {
          setSdt(parsed.sdt);
          setHoTen(parsed.hoTen || "");
          setTrangThaiSdt("hop_le");
        }
      } catch (e) {}
    }

    const fetchChiNhanh = async () => {
      if (!maChiNhanh || maChiNhanh === "null") return;
      try {
        const res = await api.get(
          `/api/thong-tin-chi-nhanh/?ma_chi_nhanh=${maChiNhanh}`,
        );
        if (res.data.data?.length > 0) setThongTinChiNhanh(res.data.data[0]);
      } catch (err) {}
    };

    const fetchThucDon = async () => {
      if (!maChiNhanh || maChiNhanh === "null") return setLoading(false);
      setLoading(true);
      try {
        const response = await api.get("/api/thong-tin-thuc-don", {
          params: { ma_chi_nhanh: maChiNhanh },
        });
        const mapped = (response.data.data || [])
          .filter((item) => item.CoSan === 1)
          .map((item) => ({
            ...item,
            MaMon: item.MaMonAn !== undefined ? item.MaMonAn : item.MaMon,
          }));
        setThucDon(mapped);
      } catch (error) {
        message.error("Lỗi tải thực đơn chi nhánh. Vui lòng chọn lại!");
      } finally {
        setLoading(false);
      }
    };

    fetchChiNhanh();
    fetchThucDon();
  }, [maChiNhanh]);

  useEffect(() => {
    fetchActiveOrder();
    const interval = setInterval(fetchActiveOrder, 30000);
    return () => clearInterval(interval);
  }, [maBanAn, Sdt]);

  const TongTien = PhieuGoiMon.reduce(
    (tong, item) => tong + item.DonGia * item.SoLuong,
    0,
  );

  const CuaSoThanhToan = () => {
    if (PhieuGoiMon.length === 0)
      return message.warning("Phiếu gọi món của bạn đang trống!");
    setIsCartVisible(false);
    setIsCheckoutVisible(true);
  };

  const KiemTraSDT = async () => {
    if (!Sdt || Sdt.length < 9 || Sdt.length > 11) {
      setTrangThaiSdt(null);
      return message.error("Vui lòng nhập SĐT hợp lệ!");
    }
    try {
      const response = await api.get(`/api/kiem-tra-sdt-khach/${Sdt}`);
      if (response.data.data === 1) {
        setTrangThaiSdt("hop_le");
      } else {
        setTrangThaiSdt("khong_ton_tai");
      }
    } catch (error) {
      message.error("Lỗi khi kết nối hệ thống kiểm tra SĐT!");
    }
  };

  const ChotPhieuGoiMon = async () => {
    const isDineIn = maBanAn && maBanAn !== "null";

    if (!isDineIn && (!Sdt || Sdt.length < 9)) {
      return message.error(
        "Vui lòng nhập SĐT hợp lệ trước khi đặt món mang về!",
      );
    }

    if (Sdt && Sdt.length > 0 && Sdt.length < 9) {
      return message.error("Số điện thoại không hợp lệ!");
    }

    if (
      Sdt &&
      TrangThaiSdt === "khong_ton_tai" &&
      TaoTaiKhoan &&
      !HoTen.trim()
    ) {
      return message.error("Vui lòng nhập Họ Tên để đăng ký tài khoản!");
    }

    try {
      if (Sdt && TrangThaiSdt === "khong_ton_tai" && TaoTaiKhoan) {
        await api.post(`/api/tao-tai-khoan-khach`, { sdt: Sdt, ho_ten: HoTen });
        message.success("Đã tạo tài khoản thành viên thành công!");
      }

      if (Sdt) {
        localStorage.setItem(
          "khach_session",
          JSON.stringify({ sdt: Sdt, hoTen: HoTen || "Khách Hàng" }),
        );
      }

      const endpoint = isDineIn
        ? "/api/khach/goi-mon"
        : "/api/khach/dat-mang-ve";

      for (const item of PhieuGoiMon) {
        await api.post(endpoint, {
          ma_mon_an: item.MaMon,
          so_luong: item.SoLuong,
          sdt_khach: Sdt ? Sdt : null,
          ...(isDineIn
            ? { ma_ban_an: parseInt(maBanAn) }
            : { ma_chi_nhanh: parseInt(maChiNhanh) }),
        });
      }

      setIsCheckoutVisible(false);
      XoaPhieuGoiMon();

      if (isDineIn) {
        message.success("Món ăn của bạn đã được gửi xuống bếp chuẩn bị!");
        setTimeout(() => fetchActiveOrder(), 800);
      } else {
        message.success(
          "Đặt món mang về thành công! Nhà hàng đang chuẩn bị món.",
        );
        await api.post("/api/khach/yeu-cau-thanh-toan", {
          ma_ban_an: null,
          sdt_khach: Sdt,
          phuong_thuc_thanh_toan: PhuongThucThanhToan,
        });
        message.success(
          "Đã gửi yêu cầu thanh toán và chốt hóa đơn thành công!",
        );
        setTimeout(() => navigate("/"), 1500);
      }
    } catch (error) {
      console.error(error);
      message.error("Lỗi khi chốt đơn hàng! Vui lòng kiểm tra và thử lại.");
    }
  };

  const getStatusBadgeStatus = (status) => {
    switch (status) {
      case "GoiMon":
        return "processing";
      case "ChoLenMon":
        return "warning";
      case "DaPhucVu":
        return "success";
      case "YeuCauThanhToan":
        return "default";
      default:
        return "default";
    }
  };

  const getStatusDetails = (status) => {
    switch (status) {
      case "GoiMon":
        return { text: "Yêu cầu gọi món mới", color: "blue" };
      case "ChoLenMon":
        return { text: "Đang chế biến / Chuẩn bị", color: "orange" };
      case "DaPhucVu":
        return { text: "Đã phục vụ xong", color: "green" };
      case "YeuCauThanhToan":
        return { text: "Đang chờ thanh toán", color: "purple" };
      default:
        return { text: "Đang xử lý", color: "default" };
    }
  };

  const getDishStatusTag = (status) => {
    switch (status) {
      case "DatMonTruoc":
        return <Tag color="blue">Đặt trước</Tag>;
      case "GoiMon":
        return <Tag color="cyan">Chờ xác nhận</Tag>;
      case "DoiLenMon":
        return <Tag color="orange">Đang chuẩn bị</Tag>;
      case "DaPhucVu":
        return <Tag color="green">Đã lên món</Tag>;
      default:
        return <Tag>{status}</Tag>;
    }
  };

  const handleYeuCauThanhToanStatusModal = async () => {
    const isDineIn = maBanAn && maBanAn !== "null";

    if (!isDineIn && !Sdt) {
      return message.error("Vui lòng nhập SĐT để thanh toán hóa đơn mang về!");
    }

    setSubmittingPayment(true);
    try {
      const payload = {
        phuong_thuc_thanh_toan: ptThanhToanStatus,
      };

      if (isDineIn) {
        payload.ma_ban_an = parseInt(maBanAn);
      } else {
        payload.ma_ban_an = null;
      }

      if (Sdt) {
        payload.sdt_khach = Sdt;
      }

      await api.post("/api/khach/yeu-cau-thanh-toan", payload);
      message.success(
        "Đã gửi yêu cầu thanh toán thành công! Vui lòng chờ nhân viên.",
      );
      await fetchActiveOrder();
    } catch (error) {
      message.error("Gửi yêu cầu thanh toán thất bại!");
    } finally {
      setSubmittingPayment(false);
    }
  };

  const cotStatusPhieu = [
    {
      title: "Tên món ăn",
      dataIndex: "TenMon",
      key: "TenMon",
      width: 250,
      render: (text) => <Text strong>{text}</Text>,
    },
    {
      title: "Số lượng",
      dataIndex: "SoLuong",
      key: "SoLuong",
      align: "center",
      width: 100,
    },
    {
      title: "Đơn giá",
      key: "DonGia",
      render: (_, record) =>
        `${(record.DonGia || record.DonGiaMon || 0).toLocaleString()}đ`,
    },
    {
      title: "Thành tiền",
      key: "ThanhTien",
      render: (_, record) =>
        `${((record.DonGia || record.DonGiaMon || 0) * record.SoLuong).toLocaleString()}đ`,
    },
    {
      title: "Trạng thái",
      dataIndex: "TinhTrangMon",
      key: "TinhTrangMon",
      align: "center",
      render: (status) => getDishStatusTag(status),
    },
  ];

  const cotPhieuGoiMon = [
    {
      title: "Tên món ăn",
      dataIndex: "TenMon",
      key: "TenMon",
      width: 220,
      ellipsis: true,
      render: (text) => <Text strong>{text}</Text>,
    },
    {
      title: "Số lượng",
      key: "SoLuong",
      width: 140,
      align: "center",
      render: (_, record) => (
        <div
          style={{
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
            gap: "6px",
          }}
        >
          <Button
            size="small"
            onClick={() => GiamSoLuong(record)}
            disabled={record.SoLuong <= 1}
          >
            -
          </Button>
          <InputNumber
            min={1}
            max={99}
            value={record.SoLuong}
            onChange={(val) => {
              if (val >= 1) CapNhatSoLuong(record.MaMon, val);
            }}
            style={{ width: "55px", textAlign: "center" }}
            controls={false}
          />
          <Button size="small" onClick={() => TangSoLuong(record)}>
            +
          </Button>
        </div>
      ),
    },
    {
      title: "Đơn giá",
      dataIndex: "DonGia",
      key: "DonGia",
      render: (val) => `${val.toLocaleString()}đ`,
    },
    {
      title: "Thành tiền",
      key: "thanhTien",
      render: (_, record) =>
        `${(record.DonGia * record.SoLuong).toLocaleString()}đ`,
    },
    {
      title: "",
      key: "hanhDong",
      width: 50,
      align: "center",
      render: (_, record) => (
        <CloseOutlined
          style={{
            color: "red",
            cursor: "pointer",
            fontSize: "16px",
            fontWeight: "bold",
          }}
          onClick={() => XoaMon(record.MaMon)}
        />
      ),
    },
  ];

  return (
    <div
      style={{
        background: "linear-gradient(180deg, #f9fbfd 0%, #f4f7f6 100%)",
        minHeight: "100vh",
        paddingBottom: "80px",
        fontFamily: "'Outfit', 'Inter', sans-serif",
      }}
    >
      <AppHeader />

      <div
        style={{ maxWidth: "1200px", margin: "30px auto", padding: "0 20px" }}
      >
        <div style={{ marginBottom: "25px" }}>
          {maBanAn ? (
            <Alert
              message={
                <div
                  style={{
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "space-between",
                    flexWrap: "wrap",
                    gap: "10px",
                  }}
                >
                  <span>
                    <ShopOutlined /> Bạn đang gọi món tại{" "}
                    <Text
                      strong
                      style={{ color: "#1890ff", fontSize: "1.1rem" }}
                    >
                      Bàn số {maBanAn}
                    </Text>{" "}
                    -{" "}
                    <Text strong>
                      {thongTinChiNhanh?.DiaChi || `Chi nhánh ${maChiNhanh}`}
                    </Text>
                  </span>
                  <Tag color="blue" icon={<InfoCircleOutlined />}>
                    Gọi tại bàn ăn (Dine-in)
                  </Tag>
                </div>
              }
              type="info"
              showIcon
              style={{
                borderRadius: "12px",
                border: "1px solid #91d5ff",
                padding: "12px 20px",
              }}
            />
          ) : (
            <Alert
              message={
                <div
                  style={{
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "space-between",
                    flexWrap: "wrap",
                    gap: "10px",
                  }}
                >
                  <span>
                    <EnvironmentOutlined /> Đang đặt món mang về tại:{" "}
                    <Text strong>
                      {thongTinChiNhanh?.DiaChi || `Chi nhánh ${maChiNhanh}`}
                    </Text>
                  </span>
                  <Tag color="orange">Đặt mang về (Takeaway)</Tag>
                </div>
              }
              type="warning"
              showIcon
              style={{
                borderRadius: "12px",
                border: "1px solid #ffe58f",
                padding: "12px 20px",
              }}
            />
          )}
        </div>

        <Title
          level={2}
          style={{ textAlign: "center", marginBottom: "35px", fontWeight: 800 }}
        >
          THỰC ĐƠN ĐẶT MÓN HẤP DẪN
        </Title>

        {loading ? (
          <div
            style={{
              display: "flex",
              justifyContent: "center",
              padding: "100px 0",
            }}
          >
            <Badge
              status="processing"
              text="Đang tải thực đơn chi nhánh..."
              style={{ fontSize: "1.2rem" }}
            />
          </div>
        ) : (
          <Row gutter={[20, 20]}>
            {ThucDon.map((mon) => (
              <Col xs={12} sm={8} md={6} lg={6} xl={6} key={mon.MaMon}>
                <Card
                  hoverable
                  bodyStyle={{ padding: "15px", textAlign: "center" }}
                  style={{
                    borderRadius: "14px",
                    overflow: "hidden",
                    border: "1px solid rgba(0,0,0,0.05)",
                    boxShadow: "0 4px 12px rgba(0,0,0,0.02)",
                  }}
                  cover={
                    <div
                      style={{
                        height: "150px",
                        overflow: "hidden",
                        position: "relative",
                      }}
                    >
                      <img
                        alt={mon.TenMon}
                        src={
                          mon.HinhAnh ||
                          "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500"
                        }
                        style={{
                          width: "100%",
                          height: "100%",
                          objectFit: "cover",
                        }}
                      />
                    </div>
                  }
                >
                  <Title
                    level={5}
                    style={{
                      marginTop: 0,
                      marginBottom: "10px",
                      height: "44px",
                      overflow: "hidden",
                      fontWeight: 700,
                      fontSize: "0.95rem",
                    }}
                  >
                    {mon.TenMon}
                  </Title>
                  <div
                    style={{
                      display: "flex",
                      justifyContent: "space-between",
                      alignItems: "center",
                      marginTop: "15px",
                    }}
                  >
                    <span
                      style={{
                        color: "#ff4d4f",
                        fontWeight: 800,
                        fontSize: "1.1rem",
                      }}
                    >
                      {mon.DonGia.toLocaleString()} đ
                    </span>
                    <Button
                      type="primary"
                      shape="circle"
                      size="large"
                      style={{
                        backgroundColor: "#1890ff",
                        borderColor: "#1890ff",
                        boxShadow: "0 2px 8px rgba(24,144,255,0.3)",
                      }}
                      disabled={!mon.CoSan}
                      icon={
                        <ShoppingCartOutlined style={{ fontSize: "20px" }} />
                      }
                      onClick={() => {
                        ThemMon(mon);
                        message.success(`Đã thêm ${mon.TenMon} vào giỏ!`);
                      }}
                    />
                  </div>
                </Card>
              </Col>
            ))}
          </Row>
        )}

        <FloatButton
          icon={
            <Badge count={PhieuGoiMon.length} size="large" offset={[5, -5]}>
              <ShoppingCartOutlined
                style={{ color: "white", fontSize: "24px" }}
              />
            </Badge>
          }
          type="primary"
          style={{
            width: "65px",
            height: "65px",
            bottom: "50px",
            right: "50px",
            backgroundColor: "#1d39c4",
          }}
          onClick={() => setIsCartVisible(true)}
        />

        <Modal
          title={
            <div style={{ textAlign: "center" }}>
              <Title level={3} style={{ margin: 0, color: "#ff7a45" }}>
                <ShoppingCartOutlined /> CHI TIẾT GIỎ HÀNG
              </Title>
              <Text type="secondary">
                {maBanAn
                  ? `Gọi món phục vụ tại Bàn #${maBanAn}`
                  : "Đặt món mang về tận nhà"}
              </Text>
            </div>
          }
          open={isCartVisible}
          onCancel={() => setIsCartVisible(false)}
          footer={null}
          width={700}
          centered
          bodyStyle={{ padding: "20px 10px" }}
        >
          <Table
            dataSource={PhieuGoiMon}
            columns={cotPhieuGoiMon}
            rowKey="MaMon"
            pagination={false}
            size="middle"
            style={{ marginTop: "10px" }}
          />
          <Divider style={{ margin: "20px 0" }} />
          <div
            style={{
              display: "flex",
              justifyContent: "space-between",
              alignItems: "center",
              padding: "0 10px",
            }}
          >
            <Title level={3} style={{ color: "#ff4d4f", margin: 0 }}>
              Tổng tiền: {TongTien.toLocaleString()} đ
            </Title>
            <Button
              type="primary"
              size="large"
              onClick={CuaSoThanhToan}
              disabled={PhieuGoiMon.length === 0}
              style={{
                backgroundColor: "#1890ff",
                height: "46px",
                borderRadius: "23px",
                padding: "0 30px",
                fontWeight: "bold",
              }}
            >
              TIẾN HÀNH ĐẶT MÓN
            </Button>
          </div>
        </Modal>

        <Modal
          title={
            <div style={{ textAlign: "center" }}>
              <Title level={3} style={{ margin: 0, color: "#1890ff" }}>
                THÔNG TIN GIAO DỊCH
              </Title>
              <Text type="secondary">
                {maBanAn
                  ? "Cung cấp số điện thoại để tích điểm (Không bắt buộc)"
                  : "Vui lòng cung cấp số điện thoại để nhận điểm tích lũy"}
              </Text>
            </div>
          }
          open={isCheckoutVisible}
          onCancel={() => setIsCheckoutVisible(false)}
          footer={null}
          width={500}
          centered
        >
          <div
            style={{
              display: "flex",
              flexDirection: "column",
              gap: "20px",
              marginTop: "20px",
            }}
          >
            <div>
              <Text strong>
                {maBanAn
                  ? "Số điện thoại (Tùy chọn):"
                  : "Số điện thoại liên lạc (*):"}
              </Text>
              <Input
                placeholder={
                  maBanAn
                    ? "Nhập số điện thoại (Tùy chọn)..."
                    : "Nhập số điện thoại..."
                }
                allowClear
                size="large"
                value={Sdt}
                onChange={(e) => {
                  setSdt(e.target.value.replace(/[^0-9]/g, ""));
                  setTrangThaiSdt(null);
                }}
                onBlur={() => {
                  if (Sdt) KiemTraSDT();
                }}
                prefix={<UserOutlined />}
                style={{ marginTop: "8px" }}
              />

              {TrangThaiSdt === "khong_ton_tai" && (
                <div
                  style={{
                    marginTop: "15px",
                    padding: "15px",
                    background: "#fffbe6",
                    border: "1px solid #ffe58f",
                    borderRadius: "8px",
                  }}
                >
                  <Checkbox
                    checked={TaoTaiKhoan}
                    onChange={(e) => setTaoTaiKhoan(e.target.checked)}
                    style={{ marginBottom: "10px" }}
                  >
                    Tạo tài khoản thành viên mới với SĐT này
                  </Checkbox>
                  {TaoTaiKhoan && (
                    <Input
                      placeholder="Nhập Họ và Tên của bạn..."
                      value={HoTen}
                      onChange={(e) => setHoTen(e.target.value)}
                      size="large"
                      style={{ marginTop: "8px" }}
                    />
                  )}
                </div>
              )}
              {TrangThaiSdt === "hop_le" && (
                <div
                  style={{
                    marginTop: "8px",
                    display: "flex",
                    alignItems: "center",
                    gap: "5px",
                  }}
                >
                  <Text type="success" strong>
                    ✅ Số điện thoại hợp lệ. Đã liên kết tài khoản thành viên!
                  </Text>
                </div>
              )}
            </div>

            {!maBanAn && (
              <div>
                <Text strong>Phương thức thanh toán:</Text>
                <Radio.Group
                  onChange={(e) => setPhuongThucThanhToan(e.target.value)}
                  value={PhuongThucThanhToan}
                  style={{
                    display: "flex",
                    flexDirection: "column",
                    gap: "12px",
                    marginTop: "10px",
                  }}
                >
                  <Radio value="tien_mat">
                    Thanh toán tiền mặt / Trực tiếp tại quầy
                  </Radio>
                  <Radio value="chuyen_khoan">
                    Chuyển khoản Ngân hàng (Quét mã QR)
                  </Radio>
                  <Radio value="momo">Ví điện tử MoMo</Radio>
                </Radio.Group>
              </div>
            )}

            <Divider style={{ margin: "10px 0" }} />

            <div style={{ textAlign: "center" }}>
              <Title
                level={4}
                style={{ color: "#ff4d4f", marginBottom: "20px" }}
              >
                {maBanAn ? "Tạm tính: " : "Cần thanh toán: "}{" "}
                {TongTien.toLocaleString()} đ
              </Title>
              <Button
                type="primary"
                size="large"
                block
                style={{
                  background:
                    "linear-gradient(135deg, #1890ff 0%, #1d39c4 100%)",
                  border: "none",
                  height: "50px",
                  fontSize: "18px",
                  fontWeight: "bold",
                  borderRadius: "25px",
                  boxShadow: "0 4px 12px rgba(24,144,255,0.3)",
                  color: "white",
                }}
                onClick={ChotPhieuGoiMon}
              >
                {maBanAn ? "GỬI YÊU CẦU ĐẶT MÓN" : "XÁC NHẬN CHỐT ĐƠN HÀNG"}
              </Button>
            </div>
          </div>
        </Modal>

        {activeOrder && (
          <FloatButton
            icon={
              <Badge
                status={getStatusBadgeStatus(
                  activeOrder.tinh_trang_phieu ||
                    activeOrder.data[0]?.TinhTrangPhieuGoiMon,
                )}
              >
                <ClockCircleOutlined
                  style={{ color: "white", fontSize: "24px" }}
                />
              </Badge>
            }
            type="default"
            style={{
              width: "65px",
              height: "65px",
              bottom: "50px",
              right: "130px",
              backgroundColor: "#52c41a",
            }}
            onClick={() => setIsStatusModalVisible(true)}
            tooltip="Theo dõi tình trạng phục vụ"
          />
        )}

        <Modal
          title={
            <div style={{ textAlign: "center" }}>
              <Title level={3} style={{ margin: 0, color: "#52c41a" }}>
                <ClockCircleOutlined /> THEO DÕI PHIẾU GỌI MÓN
              </Title>
              <Text type="secondary">
                {activeOrder?.ma_ban_an
                  ? `Phiếu đang phục vụ tại Bàn #${activeOrder.ma_ban_an}`
                  : "Phiếu đặt món mang về"}
              </Text>
            </div>
          }
          open={isStatusModalVisible}
          onCancel={() => setIsStatusModalVisible(false)}
          footer={null}
          width={750}
          centered
        >
          {activeOrder && (
            <div style={{ marginTop: "15px" }}>
              <div
                style={{
                  display: "flex",
                  justifyContent: "space-between",
                  alignItems: "center",
                  marginBottom: "15px",
                }}
              >
                <div>
                  <Text strong>Mã phiếu: </Text>
                  <Tag color="cyan">#{activeOrder.ma_phieu}</Tag>
                </div>
                <div>
                  <Text strong>Tình trạng: </Text>
                  <Tag
                    color={
                      getStatusDetails(
                        activeOrder.tinh_trang_phieu ||
                          activeOrder.data[0]?.TinhTrangPhieuGoiMon,
                      ).color
                    }
                  >
                    {getStatusDetails(
                      activeOrder.tinh_trang_phieu ||
                        activeOrder.data[0]?.TinhTrangPhieuGoiMon,
                    ).text.toUpperCase()}
                  </Tag>
                </div>
              </div>

              <Table
                dataSource={activeOrder.data}
                columns={cotStatusPhieu}
                rowKey={(record, idx) =>
                  `${record.MaMon || record.MaMonAn || idx}-${idx}`
                }
                pagination={false}
                size="middle"
                style={{ marginTop: "10px" }}
              />
              <Divider style={{ margin: "20px 0" }} />

              <div
                style={{
                  display: "flex",
                  justifyContent: "space-between",
                  alignItems: "center",
                  padding: "0 10px",
                  marginBottom: "20px",
                }}
              >
                <Title level={3} style={{ color: "#ff4d4f", margin: 0 }}>
                  Tổng hóa đơn:{" "}
                  {(
                    activeOrder.tong_tien ||
                    activeOrder.data.reduce(
                      (sum, item) =>
                        sum +
                        (item.DonGia || item.DonGiaMon || 0) *
                          (item.SoLuong || 0),
                      0,
                    )
                  ).toLocaleString()}{" "}
                  đ
                </Title>
              </div>

              {(() => {
                const trangThaiPhieuHienTai =
                  activeOrder.tinh_trang_phieu ||
                  activeOrder.data[0]?.TinhTrangPhieuGoiMon;
                const duocPhepThanhToan =
                  trangThaiPhieuHienTai &&
                  !["GoiMon", "YeuCauThanhToan", "DaThanhToan"].includes(
                    trangThaiPhieuHienTai,
                  );

                if (trangThaiPhieuHienTai === "YeuCauThanhToan")
                  return (
                    <Alert
                      message="Đang chờ thanh toán"
                      description="Bạn đã gửi yêu cầu thanh toán thành công. Vui lòng chờ nhân viên phục vụ hỗ trợ bạn thanh toán tại bàn hoặc tại quầy."
                      type="warning"
                      showIcon
                      style={{ borderRadius: "10px" }}
                    />
                  );
                if (trangThaiPhieuHienTai === "GoiMon")
                  return (
                    <Alert
                      message="Đang chờ nhà hàng xác nhận"
                      description="Đơn hàng của bạn vừa được gửi đi. Vui lòng chờ bộ phận bếp xác nhận món trước khi tiến hành thanh toán."
                      type="info"
                      showIcon
                      style={{ borderRadius: "10px" }}
                    />
                  );

                if (duocPhepThanhToan) {
                  return (
                    <div
                      style={{
                        background: "#f9f9f9",
                        padding: "20px",
                        borderRadius: "12px",
                        border: "1px solid #e8e8e8",
                      }}
                    >
                      <Title
                        level={5}
                        style={{ marginTop: 0, marginBottom: "15px" }}
                      >
                        <InfoCircleOutlined
                          style={{ color: "#1890ff", marginRight: "8px" }}
                        />{" "}
                        Xác nhận thanh toán
                      </Title>
                      <div style={{ marginBottom: "15px" }}>
                        <Text
                          strong
                          style={{ display: "block", marginBottom: "8px" }}
                        >
                          Chọn phương thức thanh toán:
                        </Text>
                        <Radio.Group
                          onChange={(e) => setPtThanhToanStatus(e.target.value)}
                          value={ptThanhToanStatus}
                          style={{
                            display: "flex",
                            flexDirection: "row",
                            flexWrap: "wrap",
                            gap: "15px",
                          }}
                        >
                          <Radio value="tien_mat">Tiền mặt / Quầy</Radio>
                          <Radio value="chuyen_khoan">Chuyển khoản QR</Radio>
                          <Radio value="momo">Ví MoMo</Radio>
                        </Radio.Group>
                      </div>
                      <Button
                        type="primary"
                        size="large"
                        block
                        loading={submittingPayment}
                        style={{
                          backgroundColor: "#ff7a45",
                          borderColor: "#ff7a45",
                          height: "45px",
                          borderRadius: "22px",
                          fontWeight: "bold",
                        }}
                        onClick={handleYeuCauThanhToanStatusModal}
                      >
                        GỬI YÊU CẦU THANH TOÁN
                      </Button>
                    </div>
                  );
                }
                return null;
              })()}
            </div>
          )}
        </Modal>
      </div>
    </div>
  );
};

export default TrangDatMon;
