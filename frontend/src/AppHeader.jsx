import React, { useState, useEffect } from "react";
import { Layout, Menu, Button, Space, Typography, Dropdown, Modal, Select, message, Badge } from "antd";
import { 
  UserOutlined, 
  LogoutOutlined, 
  ShoppingCartOutlined, 
  HomeOutlined, 
  QrcodeOutlined, 
  CarOutlined, 
  EnvironmentOutlined 
} from "@ant-design/icons";
import { useNavigate, useLocation } from "react-router-dom";
import { useTempStore } from "./store";
import AuthModal from "./AuthModal";
import api from "./api";

const { Header } = Layout;
const { Text, Title } = Typography;
const { Option } = Select;

const AppHeader = () => {
  const navigate = useNavigate();
  const location = useLocation();
  
  const [session, setSession] = useState(null);
  const [isAuthVisible, setIsAuthVisible] = useState(false);
  const [isQrModalVisible, setIsQrModalVisible] = useState(false);
  
  // QR simulation state
  const [danhSachChiNhanh, setDanhSachChiNhanh] = useState([]);
  const [selectedBranch, setSelectedBranch] = useState(null);
  const [danhSachBanAn, setDanhSachBanAn] = useState([]);
  const [selectedBanAn, setSelectedBanAn] = useState(null);
  const [loadingTables, setLoadingTables] = useState(false);

  const cart = useTempStore((state) => state.PhieuGoiMon);

  useEffect(() => {
    // Load session from localStorage
    const savedSession = localStorage.getItem("khach_session");
    if (savedSession) {
      try {
        const parsed = JSON.parse(savedSession);
        setSession(parsed);
        // Set token for axios requests
        api.defaults.headers.common["Authorization"] = `Bearer ${parsed.token}`;
      } catch (e) {
        console.error("Lỗi đọc session:", e);
      }
    }
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

  // Fetch branches for QR simulation
  const moModalQuetQR = async () => {
    setIsQrModalVisible(true);
    try {
      const res = await api.get("/api/thong-tin-chi-nhanh/");
      setDanhSachChiNhanh(res.data.data || []);
      if (res.data.data && res.data.data.length > 0) {
        // Tự động chọn chi nhánh đầu tiên
        const firstBranch = res.data.data[0].MaChiNhanh;
        setSelectedBranch(firstBranch);
        taiDanhSachBanAn(firstBranch);
      }
    } catch (error) {
      message.error("Lỗi tải danh sách chi nhánh!");
      console.error(error);
    }
  };

  const taiDanhSachBanAn = async (branchId) => {
    setLoadingTables(true);
    setSelectedBanAn(null);
    try {
      const res = await api.get(`/api/ds-ban-an/${branchId}`);
      // Lọc các bàn có sẵn và hoạt động
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
    if (!selectedBranch || !selectedBanAn) {
      message.error("Vui lòng chọn đầy đủ Chi nhánh và Bàn ăn!");
      return;
    }
    setIsQrModalVisible(false);
    message.success(`Đã quét QR Bàn số ${selectedBanAn} thành công!`);
    navigate(`/dat-mon?chiNhanh=${selectedBranch}&ban=${selectedBanAn}`);
  };

  const navigateToCart = () => {
    // Navigate to order page where cart is visible
    navigate("/dat-mon");
  };

  const userMenuItems = [
    {
      key: "info",
      label: (
        <div style={{ padding: "4px 12px" }}>
          <Text strong style={{ display: "block" }}>{session?.hoTen}</Text>
          <Text type="secondary" size="small">{session?.sdt}</Text>
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
        {/* Brand/Logo */}
        <div 
          onClick={() => navigate("/")} 
          style={{ 
            display: "flex", 
            alignItems: "center", 
            cursor: "pointer",
            gap: "10px"
          }}
        >
          <div style={{
            background: "linear-gradient(135deg, #1890ff, #52c41a)",
            width: "36px",
            height: "36px",
            borderRadius: "50%",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            boxShadow: "0 2px 6px rgba(24,144,255,0.3)"
          }}>
            <ShoppingCartOutlined style={{ color: "#fff", fontSize: "18px" }} />
          </div>
          <Title level={4} style={{ margin: 0, fontWeight: 800, background: "linear-gradient(135deg, #1890ff, #2f54eb)", WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent" }}>
            GOURMET F&B
          </Title>
        </div>

        {/* Menu Navigation */}
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
          <Menu.Item key="/" icon={<HomeOutlined />} onClick={() => navigate("/")}>
            Trang Chủ
          </Menu.Item>
          
          <Menu.Item key="qr-order" icon={<QrcodeOutlined />} onClick={moModalQuetQR}>
            Gọi Món Tại Bàn
          </Menu.Item>

          <Menu.Item key="/dat-mon" icon={<CarOutlined />} onClick={() => navigate("/dat-mon")}>
            Đặt Mang Về
          </Menu.Item>
        </Menu>

        {/* Action Buttons */}
        <Space size="large">
          {/* Cart Icon Badge */}
          {cart.length > 0 && (
            <Badge count={cart.length} showZero={false} offset={[5, -5]}>
              <Button 
                type="text" 
                shape="circle" 
                icon={<ShoppingCartOutlined style={{ fontSize: "20px", color: "#1890ff" }} />}
                onClick={navigateToCart}
              />
            </Badge>
          )}

          {/* User Auth */}
          {session ? (
            <Dropdown menu={{ items: userMenuItems }} placement="bottomRight" trigger={["click"]}>
              <Button 
                type="primary" 
                shape="round" 
                icon={<UserOutlined />}
                style={{ 
                  backgroundColor: "#52c41a", 
                  borderColor: "#52c41a",
                  boxShadow: "0 2px 6px rgba(82,196,26,0.2)"
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

      {/* Authentication Modal */}
      <AuthModal 
        visible={isAuthVisible} 
        onClose={() => setIsAuthVisible(false)} 
        onLoginSuccess={handleLoginSuccess}
      />

      {/* Simulated Table QR Scanner Modal */}
      <Modal
        title={
          <div style={{ textAlign: "center" }}>
            <Title level={3} style={{ margin: 0, color: "#1890ff" }}>
              <QrcodeOutlined /> QUÉT QR TẠI BÀN
            </Title>
            <Text type="secondary">Mô phỏng máy ảnh quét mã QR dán tại bàn ăn nhà hàng</Text>
          </div>
        }
        open={isQrModalVisible}
        onCancel={() => setIsQrModalVisible(false)}
        footer={null}
        width={450}
        centered
      >
        <div style={{ display: "flex", flexDirection: "column", gap: "20px", padding: "10px 0" }}>
          
          {/* Mock Camera View */}
          <div style={{
            height: "200px",
            background: "#000",
            borderRadius: "12px",
            position: "relative",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            overflow: "hidden",
            boxShadow: "inset 0 0 20px rgba(255,255,255,0.1), 0 4px 12px rgba(0,0,0,0.15)"
          }}>
            {/* Holographic scanning effect */}
            <div style={{
              position: "absolute",
              width: "100%",
              height: "2px",
              background: "linear-gradient(90deg, transparent, #52c41a, transparent)",
              top: "50%",
              left: 0,
              boxShadow: "0 0 8px #52c41a",
              animation: "scanAnim 2.5s infinite ease-in-out"
            }} />
            
            <div style={{
              width: "120px",
              height: "120px",
              border: "2px dashed #52c41a",
              borderRadius: "8px",
              display: "flex",
              alignItems: "center",
              justifyContent: "center"
            }}>
              <QrcodeOutlined style={{ fontSize: "60px", color: "#52c41a", opacity: 0.7 }} />
            </div>
            <div style={{ position: "absolute", bottom: "10px", color: "#52c41a", fontWeight: "bold" }}>
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

          {/* Table select dropdowns */}
          <div style={{ background: "#f5f5f5", padding: "16px", borderRadius: "8px" }}>
            <Space direction="vertical" style={{ width: "100%" }} size="middle">
              <div>
                <Text strong style={{ display: "block", marginBottom: "5px" }}>Chọn Chi Nhánh:</Text>
                <Select
                  style={{ width: "100%" }}
                  placeholder="Chọn chi nhánh..."
                  value={selectedBranch}
                  onChange={handleSelectBranchChange}
                  size="large"
                >
                  {danhSachChiNhanh.map((cn) => (
                    <Option key={cn.MaChiNhanh} value={cn.MaChiNhanh}>
                      <EnvironmentOutlined /> {cn.TenChiNhanh || cn.DiaChi} (Mã: {cn.MaChiNhanh})
                    </Option>
                  ))}
                </Select>
              </div>

              <div>
                <Text strong style={{ display: "block", marginBottom: "5px" }}>Chọn Bàn Ăn:</Text>
                <Select
                  style={{ width: "100%" }}
                  placeholder="Chọn bàn ăn..."
                  value={selectedBanAn}
                  onChange={(val) => setSelectedBanAn(val)}
                  disabled={loadingTables || danhSachBanAn.length === 0}
                  loading={loadingTables}
                  size="large"
                >
                  {danhSachBanAn.map((ban) => (
                    <Option key={ban.MaBan} value={ban.MaBan}>
                      Bàn #{ban.MaBan} - {ban.ViTri} ({ban.SoLuongChoNgoi} chỗ) - [{ban.TinhTrangSuDung}]
                    </Option>
                  ))}
                </Select>
                {danhSachBanAn.length === 0 && selectedBranch && !loadingTables && (
                  <Text type="danger" style={{ fontSize: "12px", marginTop: "4px", display: "block" }}>
                    Chi nhánh này chưa có bàn ăn khả dụng!
                  </Text>
                )}
              </div>
            </Space>
          </div>

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
              fontWeight: "bold"
            }}
            disabled={!selectedBranch || !selectedBanAn}
          >
            BẮT ĐẦU GỌI MÓN TẠI BÀN
          </Button>

        </div>
      </Modal>
    </>
  );
};

export default AppHeader;
