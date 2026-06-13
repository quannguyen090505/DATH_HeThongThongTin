import React, { useState, useEffect } from "react";
import {
  Layout,
  Menu,
  Button,
  Space,
  Typography,
  Dropdown,
  Modal,
  Select,
  message,
  Badge,
} from "antd";
import {
  UserOutlined,
  LogoutOutlined,
  ShoppingCartOutlined,
  HomeOutlined,
  QrcodeOutlined,
  CarOutlined,
  EnvironmentOutlined,
} from "@ant-design/icons";
import { useNavigate, useLocation } from "react-router-dom";
import { useTempStore } from "./store";
import KhachDangNhap from "./KhachDangNhap";
import api from "./api";

const { Header } = Layout;
const { Text, Title } = Typography;
const { Option } = Select;

const HeaderTrangChu = () => {
  const navigate = useNavigate();
  const location = useLocation();

  const [session, setSession] = useState(null);
  const [isAuthVisible, setIsAuthVisible] = useState(false);
  const [isQrModalVisible, setIsQrModalVisible] = useState(false);

  const [danhSachChiNhanh, setDanhSachChiNhanh] = useState([]);
  const [selectedBranch, setSelectedBranch] = useState(null);
  const [danhSachBanAn, setDanhSachBanAn] = useState([]);
  const [selectedBanAn, setSelectedBanAn] = useState(null);
  const [loadingTables, setLoadingTables] = useState(false);

  const cart = useTempStore((state) => state.PhieuGoiMon);

  useEffect(() => {
    const savedSession = localStorage.getItem("khach_session");
    if (savedSession) {
      try {
        const parsed = JSON.parse(savedSession);
        setSession(parsed);
        api.defaults.headers.common["Authorization"] = `Bearer ${parsed.token}`;
      } catch (e) {
        console.error("Lỗi đọc session:", e);
      }
    }
    const layDanhSachChiNhanh = async () => {
      try {
        const res = await api.get("/api/thong-tin-chi-nhanh/");
        setDanhSachChiNhanh(res.data.data || []);
      } catch (error) {
        console.error("Lỗi tải danh sách chi nhánh:", error);
      }
    };
    layDanhSachChiNhanh();
  }, []);

  const handleLogout = () => {
    localStorage.removeItem("khach_session");
    delete api.defaults.headers.common["Authorization"];
    setSession(null);
    message.success("Đã đăng xuất tài khoản thành viên.");
    navigate("/");
  };

  const handleLoginSuccess = (newSession) => {
    setSession(newSession);
  };

  const moModalQuetQR = async () => {
    setIsQrModalVisible(true);
    setDanhSachChiNhanh(res.data.data || []);
    if (res.data.data && res.data.data.length > 0) {
      const firstBranch = res.data.data[0].MaChiNhanh;
      setSelectedBranch(firstBranch);
      taiDanhSachBanAn(firstBranch);
    }
  };

  const taiDanhSachBanAn = async (branchId) => {
    setLoadingTables(true);
    setSelectedBanAn(null);
    try {
      const res = await api.get(`/api/ds-ban-an/${branchId}`);
      const banAn = res.data.data || [];
      setDanhSachBanAn(banAn);
      if (banAn.length > 0) {
        setSelectedBanAn(banAn[0].MaBan);
      }
    } catch (error) {
      message.error("Lỗi tải danh sách bàn ăn!");
      console.error(error);
    } finally {
      setLoadingTables(false);
    }
  };

  const handleSelectBranchChange = (value) => {
    setSelectedBranch(value);
    taiDanhSachBanAn(value);
  };

  const batDauGoiMonTaiBan = () => {
    const maChiNhanhQuetDuoc = 1;
    const maBanQuetDuoc = 1;
    setIsQrModalVisible(false);
    message.success(`Đã quét QR Bàn số ${selectedBanAn} thành công!`);
    navigate(`/dat-mon?chiNhanh=${selectedBranch}&ban=${selectedBanAn}`);
  };

  const navigateToCart = () => {
    navigate("/dat-mon");
  };

  const userMenuItems = [
    {
      key: "info",
      label: (
        <div style={{ padding: "4px 12px" }}>
          <Text strong style={{ display: "block" }}>
            {session?.hoTen}
          </Text>
          <Text type="secondary" size="small">
            {session?.sdt}
          </Text>
        </div>
      ),
    },
    {
      type: "divider",
    },
    {
      key: "logout",
      icon: <LogoutOutlined />,
      label: "Đăng xuất",
      onClick: handleLogout,
    },
  ];

  return (
    <>
      <Header
        style={{
          position: "sticky",
          top: 0,
          zIndex: 1000,
          width: "100%",
          maxWidth: "100%",
          boxSizing: "border-box",
          display: "flex",
          alignItems: "center",
          justifyContent: "space-between",
          padding: "0 24px",
          background: "rgba(255, 255, 255, 0.85)",
          backdropFilter: "blur(10px)",
          borderBottom: "1px solid rgba(0, 0, 0, 0.08)",
          boxShadow: "0 2px 8px rgba(0,0,0,0.05)",
          height: "64px",
        }}
      >
        <div
          onClick={() => navigate("/")}
          style={{
            display: "flex",
            alignItems: "center",
            cursor: "pointer",
            gap: "10px",
          }}
        >
          <div
            style={{
              background: "linear-gradient(135deg, #1890ff, #52c41a)",
              width: "36px",
              height: "36px",
              borderRadius: "50%",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              boxShadow: "0 2px 6px rgba(24,144,255,0.3)",
            }}
          >
            <ShoppingCartOutlined style={{ color: "#fff", fontSize: "18px" }} />
          </div>
          <Title
            level={4}
            style={{
              margin: 0,
              fontWeight: 800,
              background: "linear-gradient(135deg, #1890ff, #2f54eb)",
              WebkitBackgroundClip: "text",
              WebkitTextFillColor: "transparent",
            }}
          >
            GOURMET F&B
          </Title>
        </div>

        <Menu
          mode="horizontal"
          selectedKeys={[location.pathname + location.search]}
          style={{
            flex: 1,
            justifyContent: "center",
            borderBottom: "none",
            background: "transparent",
            minWidth: "300px",
          }}
        >
          <Menu.Item
            key="/"
            icon={<HomeOutlined />}
            onClick={() => navigate("/")}
          >
            Trang Chủ
          </Menu.Item>

          <Menu.Item
            key="qr-order"
            icon={<QrcodeOutlined />}
            onClick={moModalQuetQR}
          >
            Gọi Món Tại Bàn
          </Menu.Item>

          <Menu.SubMenu
            key="dat-mang-ve"
            icon={<CarOutlined />}
            title="Đặt Mang Về"
          >
            {danhSachChiNhanh.map((cn) => (
              <Menu.Item
                key={`/dat-mon?chiNhanh=${cn.MaChiNhanh}`}
                onClick={() => navigate(`/dat-mon?chiNhanh=${cn.MaChiNhanh}`)}
              >
                <EnvironmentOutlined /> {cn.DiaChi}
              </Menu.Item>
            ))}
          </Menu.SubMenu>
        </Menu>

        <Space size="large">
          {cart.length > 0 && (
            <Badge count={cart.length} showZero={false} offset={[5, -5]}>
              <Button
                type="text"
                shape="circle"
                icon={
                  <ShoppingCartOutlined
                    style={{ fontSize: "20px", color: "#1890ff" }}
                  />
                }
                onClick={navigateToCart}
              />
            </Badge>
          )}

          {session ? (
            <Dropdown
              menu={{ items: userMenuItems }}
              placement="bottomRight"
              trigger={["click"]}
            >
              <Button
                type="primary"
                shape="round"
                icon={<UserOutlined />}
                style={{
                  backgroundColor: "#52c41a",
                  borderColor: "#52c41a",
                  boxShadow: "0 2px 6px rgba(82,196,26,0.2)",
                }}
              >
                {session.hoTen}
              </Button>
            </Dropdown>
          ) : (
            <Button
              type="primary"
              shape="round"
              icon={<UserOutlined />}
              onClick={() => setIsAuthVisible(true)}
              style={{ boxShadow: "0 2px 6px rgba(24,144,255,0.2)" }}
            >
              Đăng nhập SĐT
            </Button>
          )}
        </Space>
      </Header>

      <KhachDangNhap
        visible={isAuthVisible}
        onClose={() => setIsAuthVisible(false)}
        onLoginSuccess={handleLoginSuccess}
      />

      <Modal
        title={
          <div style={{ textAlign: "center" }}>
            <Title level={3} style={{ margin: 0, color: "#1890ff" }}>
              <QrcodeOutlined /> QUÉT QR TẠI BÀN
            </Title>
            <Text type="secondary">
              Mô phỏng máy ảnh quét mã QR dán tại bàn ăn nhà hàng
            </Text>
          </div>
        }
        open={isQrModalVisible}
        onCancel={() => setIsQrModalVisible(false)}
        footer={null}
        width={450}
        centered
      >
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            gap: "20px",
            padding: "10px 0",
          }}
        >
          <div
            style={{
              height: "200px",
              background: "#000",
              borderRadius: "12px",
              position: "relative",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              overflow: "hidden",
              boxShadow:
                "inset 0 0 20px rgba(255,255,255,0.1), 0 4px 12px rgba(0,0,0,0.15)",
            }}
          >
            <div
              style={{
                position: "absolute",
                width: "100%",
                height: "2px",
                background:
                  "linear-gradient(90deg, transparent, #52c41a, transparent)",
                top: "50%",
                left: 0,
                boxShadow: "0 0 8px #52c41a",
                animation: "scanAnim 2.5s infinite ease-in-out",
              }}
            />

            <div
              style={{
                width: "120px",
                height: "120px",
                border: "2px dashed #52c41a",
                borderRadius: "8px",
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
              }}
            >
              <QrcodeOutlined
                style={{ fontSize: "60px", color: "#52c41a", opacity: 0.7 }}
              />
            </div>
            <div
              style={{
                position: "absolute",
                bottom: "10px",
                color: "#52c41a",
                fontWeight: "bold",
              }}
            >
              [ ĐANG MÔ PHỎNG CAMERA ]
            </div>
          </div>

          <style>{`
            @keyframes scanAnim {
              0% { top: 10%; }
              50% { top: 90%; }
              100% { top: 10%; }
            }
          `}</style>
          <Button
            type="primary"
            size="large"
            block
            onClick={batDauGoiMonTaiBan}
            style={{
              backgroundColor: "#52c41a",
              borderColor: "#52c41a",
              height: "48px",
              fontSize: "16px",
              fontWeight: "bold",
            }}
          >
            BẮT ĐẦU GỌI MÓN TẠI BÀN
          </Button>
        </div>
      </Modal>
    </>
  );
};

export default HeaderTrangChu;
