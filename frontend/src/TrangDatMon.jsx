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
  Space,
  Divider,
} from "antd";
import {
  ShoppingCartOutlined,
  CloseOutlined,
  UserOutlined,
} from "@ant-design/icons";
import { useTempStore } from "./store";
import api from "./api";

const { Title, Text } = Typography;

const TrangDatMon = () => {
  const [ThucDon, setThucDon] = useState([]);
  const [isCartVisible, setIsCartVisible] = useState(false);
  const [isCheckoutVisible, setIsCheckoutVisible] = useState(false);

  const [Sdt, setSdt] = useState("");
  const [TrangThaiSdt, setTrangThaiSdt] = useState(null);
  const [HoTen, setHoTen] = useState("");
  const [TaoTaiKhoan, setTaoTaiKhoan] = useState(false);
  const [PhuongThucThanhToan, setPhuongThucThanhToan] = useState("tien_mat");

  const PhieuGoiMon = useTempStore((state) => state.PhieuGoiMon);
  const ThemMon = useTempStore((state) => state.ThemMon);
  const XoaMon = useTempStore((state) => state.XoaMon);
  const TangSoLuong = useTempStore((state) => state.TangSoLuong);
  const GiamSoLuong = useTempStore((state) => state.GiamSoLuong);
  const XoaPhieuGoiMon = useTempStore((state) => state.XoaPhieuGoiMon);
  useEffect(() => {
    /*const userInfoString = localStorage.getItem("user_info"); 
    if (userInfoString) {
      const user = JSON.parse(userInfoString);
      if (user.SDT) {
        setSdt(user.SDT);
        setTrangThaiSdt('hop_le'); 
      }
    }
      */
    const fetchThucDon = async () => {
      try {
        const response = await api.get("/api/thuc-don/1");
        setThucDon(response.data.data || response.data);
      } catch (error) {
        console.error("Lỗi khi thực đơn:", error);
      }
    };
    fetchThucDon();
  }, []);
  const TongTien = PhieuGoiMon.reduce(
    (tong, item) => tong + item.DonGia * item.SoLuong,
    0,
  );
  const CuaSoThanhToan = () => {
    if (PhieuGoiMon.length === 0) {
      message.warning("Phiếu gọi món trống!");
      return;
    }
    setIsCartVisible(false);
    setIsCheckoutVisible(true);
  };
  const KiemTraSDT = async () => {
    if (!Sdt || Sdt.length < 9) {
      setTrangThaiSdt(null);
      message.error("Vui lòng nhập SĐT hợp lệ!");
      return;
    }
    try {
      const response = await api.get(`/api/kiem-tra-sdt-khach/${Sdt}`);
      if (response.data.data == 1) {
        setTrangThaiSdt("hop_le");
      } else {
        setTrangThaiSdt("khong_ton_tai");
      }
    } catch (error) {
      message.error("Lỗi khi kết nối hệ thống kiểm tra SĐT!");
    }
  };

  const ChotPhieuGoiMon = async () => {
    if (!Sdt || Sdt.length < 9) {
      message.error("Vui lòng nhập SĐT hợp lệ trước khi đặt!");
      return;
    }
    if (TrangThaiSdt === "khong_ton_tai" && TaoTaiKhoan && !HoTen.trim()) {
      message.error("Vui lòng nhập Họ Tên để tạo tài khoản!");
      return;
    }
    try {
      if (TrangThaiSdt === "khong_ton_tai" && TaoTaiKhoan) {
        await api.post(`/api/tao-tai-khoan-khach`, {
          sdt: Sdt,
          ho_ten: HoTen,
        });
      }
      for (const item of PhieuGoiMon) {
        await api.post("/api/khach/dat-mang-ve", {
          ma_mon_an: item.MaMon,
          so_luong: item.SoLuong,
          sdt_khach: Sdt,
        });
      }
      await api.post("api/khach/yeu-cau-thanh-toan", {
        sdt_khach: Sdt,
        phuong_thuc_thanh_toan: PhuongThucThanhToan,
      });
      setIsCheckoutVisible(false);
      XoaPhieuGoiMon();
    } catch (error) {
      message.error("Lỗi khi chốt đơn! Vui lòng thử lại.");
    }
  };

  const cotPhieuGoiMon = [
    {
      title: "Tên món",
      dataIndex: "TenMon",
      key: "TenMon",
      width: 140, // Thu hẹp cột tên món
      ellipsis: true, // Nếu tên món dài quá nó sẽ tự biến thành dấu "..."
    },
    {
      title: "SL",
      key: "SoLuong",
      width: 110, // Nới rộng cột này để chứa 2 nút bấm
      align: "center",
      render: (_, record) => (
        <div
          style={{
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
            gap: "8px",
          }}
        >
          <Button
            size="small"
            onClick={() => GiamSoLuong(record)}
            disabled={record.SoLuong <= 1} // Tự mờ đi nếu số lượng là 1 (chặn giảm tiếp)
          >
            -
          </Button>
          <span
            style={{ fontWeight: "bold", width: "20px", textAlign: "center" }}
          >
            {record.SoLuong}
          </span>
          <Button size="small" onClick={() => TangSoLuong(record)}>
            +
          </Button>
        </div>
      ),
    },
    {
      title: "Tiền",
      key: "thanhTien",
      render: (_, record) =>
        `${(record.DonGia * record.SoLuong).toLocaleString()}đ`,
    },
    {
      title: "",
      key: "hanhDong",
      width: 40,
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
      style={{ background: "#f5f5f5", minHeight: "100vh", padding: "30px 0" }}
    >
      <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "0 20px" }}>
        <Title level={2} style={{ textAlign: "center", marginBottom: "30px" }}>
          Hệ Thống Đặt Món F&B
        </Title>

        <Row gutter={[24, 24]}>
          {ThucDon.map((mon) => (
            <Col xs={8} sm={8} md={6} lg={6} xl={6} key={mon.MaMon}>
              <Card
                hoverable
                bodyStyle={{ padding: "15px", textAlign: "center" }}
                style={{ borderRadius: "10px", overflow: "hidden" }}
              >
                <Title
                  level={5}
                  style={{
                    marginTop: 0,
                    marginBottom: "10px",
                    height: "45px",
                    overflow: "hidden",
                  }}
                >
                  {mon.TenMon}
                </Title>
                <img
                  alt={mon.TenMon}
                  src={
                    mon.HinhAnh ||
                    "https://via.placeholder.com/200?text=Chưa+có+hình"
                  }
                  style={{
                    width: "100%",
                    height: "140px",
                    objectFit: "cover",
                    borderRadius: "8px",
                    marginBottom: "10px",
                  }}
                />
                <div
                  style={{
                    display: "flex",
                    justifyContent: "space-between",
                    alignItems: "center",
                  }}
                >
                  <span
                    style={{
                      color: "red",
                      fontWeight: "bold",
                      fontSize: "16px",
                      alignItems: "center",
                    }}
                  >
                    {mon.DonGia.toLocaleString()} đ
                  </span>
                  <Button
                    type="primary"
                    shape="circle"
                    size="large"
                    style={{
                      backgroundColor: "#52c41a",
                      borderColor: "#52c41a",
                    }}
                    icon={<ShoppingCartOutlined style={{ fontSize: "20px" }} />}
                    onClick={() => ThemMon(mon)}
                  />
                </div>
              </Card>
            </Col>
          ))}
        </Row>

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
            width: "60px",
            height: "60px",
            bottom: "50px",
            right: "50px",
            backgroundColor: "#fa8c16",
          }}
          onClick={() => setIsCartVisible(true)}
        />

        <Modal
          title={
            <Title
              level={3}
              style={{ textAlign: "center", margin: 0, color: "#fa8c16" }}
            >
              PHIẾU GỌI MÓN
            </Title>
          }
          open={isCartVisible}
          onCancel={() => setIsCartVisible(false)}
          footer={null} // Tắt phần footer mặc định của Modal
          width={650}
          centered
        >
          <Table
            dataSource={PhieuGoiMon}
            columns={cotPhieuGoiMon}
            rowKey="MaMon"
            pagination={false}
            size="small"
          />

          <div style={{ marginTop: "20px", textAlign: "right" }}>
            <Title level={3} style={{ color: "#d9363e" }}>
              Tổng cộng: {TongTien.toLocaleString()} đ
            </Title>
          </div>

          <Row gutter={10} style={{ marginTop: "20px" }}>
            <Col span={8}>
              <Button
                type="primary"
                block
                size="large"
                onClick={CuaSoThanhToan}
                style={{ backgroundColor: "#1890ff" }}
              >
                XÁC NHẬN ĐẶT MÓN
              </Button>
            </Col>
          </Row>
        </Modal>

        <Modal
          title={
            <Title
              level={3}
              style={{ textAlign: "center", margin: 0, color: "#1890ff" }}
            >
              THÔNG TIN ĐẶT MÓN
            </Title>
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
              <Text strong>Số điện thoại đặt hàng:</Text>
              <Input
                placeholder="Nhập SĐT..."
                allowClear
                size="large"
                value={Sdt}
                onChange={(e) => {
                  setSdt(e.target.value);
                  setTrangThaiSdt(null);
                }}
                onBlur={KiemTraSDT}
                prefix={<UserOutlined />}
                style={{ marginTop: "8px" }}
              />

              {TrangThaiSdt === "khong_ton_tai" && (
                <div
                  style={{
                    marginTop: "10px",
                    padding: "10px",
                    background: "#fffbe6",
                    border: "1px solid #ffe58f",
                    borderRadius: "5px",
                  }}
                >
                  <Checkbox
                    checked={TaoTaiKhoan}
                    onChange={(e) => setTaoTaiKhoan(e.target.checked)}
                  >
                    Tạo tài khoản thành viên với SĐT mới
                  </Checkbox>
                  {TaoTaiKhoan && (
                    <Input
                      placeholder="Nhập Họ và Tên..."
                      value={HoTen}
                      onChange={(e) => setHoTen(e.target.value)}
                      style={{ marginTop: "10px" }}
                    />
                  )}
                </div>
              )}
              {TrangThaiSdt === "hop_le" && (
                <Text
                  type="success"
                  style={{ display: "block", marginTop: "5px" }}
                >
                  ✅ SĐT hợp lệ. Nhận ưu đãi thành viên!
                </Text>
              )}
            </div>

            <div>
              <Text strong>Phương thức thanh toán:</Text>
              <Radio.Group
                onChange={(e) => setPhuongThucThanhToan(e.target.value)}
                value={PhuongThucThanhToan}
                style={{
                  display: "flex",
                  flexDirection: "column",
                  gap: "10px",
                  marginTop: "8px",
                }}
              >
                <Radio value="tien_mat">
                  Thanh toán tiền mặt khi nhận hàng
                </Radio>
                <Radio value="chuyen_khoan">
                  Chuyển khoản ngân hàng (Mã QR)
                </Radio>
                <Radio value="momo">Ví điện tử MoMo</Radio>
              </Radio.Group>
            </div>

            <Divider style={{ margin: "10px 0" }} />

            <div style={{ textAlign: "center" }}>
              <Title
                level={4}
                style={{ color: "#d9363e", marginBottom: "15px" }}
              >
                Cần thanh toán: {TongTien.toLocaleString()} đ
              </Title>
              <Button
                type="primary"
                size="large"
                block
                style={{
                  backgroundColor: "#52c41a",
                  height: "50px",
                  fontSize: "18px",
                }}
                onClick={ChotPhieuGoiMon}
              >
                XÁC NHẬN THÔNG TIN ĐẶT MÓN
              </Button>
            </div>
          </div>
        </Modal>
      </div>
    </div>
  );
};
export default TrangDatMon;
