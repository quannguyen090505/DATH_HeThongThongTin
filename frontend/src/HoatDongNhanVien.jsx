import React, { useState, useEffect } from "react";
import { Button, Typography, Layout } from "antd";
import { useNavigate } from "react-router-dom";
import { jwtDecode } from "jwt-decode";

const { Header, Content } = Layout;
const { Title } = Typography;

const HoatDongNhanVien = () => {
  const navigate = useNavigate();
  const [role, setRole] = useState(null);

  useEffect(() => {
    const token = localStorage.getItem("token_nhan_vien");
    if (token) {
      try {
        const decoded = jwtDecode(token);
        setRole(decoded.role);
      } catch (error) {
        console.error("Token không hợp lệ");
      }
    }
  }, []);

  return (
    <Layout style={{ minHeight: "100vh" }}>
      <Header
        style={{
          background: "#001f3f",
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          padding: "0 20px",
        }}
      >
        <Title level={3} style={{ color: "#fff", margin: 0 }}>
          POS - ĐẶT BÀN & GỌI MÓN
        </Title>

        <div style={{ display: "flex", gap: "15px" }}>
          <Button type="primary">Sơ đồ bàn</Button>
          <Button>Danh sách phiếu</Button>

          {role === "QuanLy" && (
            <Button
              danger
              type="primary"
              onClick={() => navigate("/quan-ly/dashboard")}
            >
              Khu Vực Quản Lý
            </Button>
          )}
        </div>
      </Header>

      <Content style={{ padding: "20px" }}>
        <h1>Giao diện phục vụ </h1>
      </Content>
    </Layout>
  );
};

export default HoatDongNhanVien;
