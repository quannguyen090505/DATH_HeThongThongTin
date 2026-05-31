import React, { useState } from "react";
import { Form, Input, Button, Card, Typography, message } from "antd";
import { UserOutlined, LockOutlined } from "@ant-design/icons";
import { useNavigate } from "react-router-dom";
import { jwtDecode } from "jwt-decode";
import api from "./api";

const { Title } = Typography;

//để mở trang đăng nhập nội bộ truy cập đường dẫn http://localhost:5173/dang-nhap-noi-bo

const TrangDangNhapNhanVien = () => {
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);

  const xuLyDangNhap = async (values) => {
    setLoading(true);
    try {
      const payload = {
        sdt: values.sdt,
        mat_khau: values.matkhau,
      };

      const response = await api.post("/api/nhan-vien-dang-nhap", payload);

      const token = response.data.access_token;
      localStorage.setItem("token_nhan_vien", token);
      localStorage.setItem("ma_chi_nhanh", response.data.ma_chi_nhanh);
      const decoded = jwtDecode(token);

      message.success("Đăng nhập thành công!");

      navigate("/nhan-vien/phuc-vu");
    } catch (error) {
      console.error(error);
      message.error("Đăng nhập thất bại! Sai tài khoản hoặc mật khẩu.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div
      style={{
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        height: "100vh",
        background: "#004d33",
      }}
    >
      <Card
        style={{
          width: 400,
          borderRadius: "12px",
          boxShadow: "0 10px 30px rgba(0,0,0,0.2)",
        }}
      >
        <div style={{ textAlign: "center", marginBottom: "20px" }}>
          <Title level={3} style={{ color: "#ffb100" }}>
            HỆ THỐNG NỘI BỘ
          </Title>
        </div>

        <Form name="login_nhan_vien" onFinish={xuLyDangNhap} layout="vertical">
          <Form.Item
            name="sdt"
            rules={[{ required: true, message: "Vui lòng nhập tài khoản!" }]}
          >
            <Input
              prefix={<UserOutlined />}
              size="large"
              placeholder="Tài khoản / Mã nhân viên"
            />
          </Form.Item>

          <Form.Item
            name="matkhau"
            rules={[{ required: true, message: "Vui lòng nhập mật khẩu!" }]}
          >
            <Input.Password
              prefix={<LockOutlined />}
              size="large"
              placeholder="Mật khẩu"
            />
          </Form.Item>

          <Form.Item>
            <Button
              type="primary"
              htmlType="submit"
              size="large"
              block
              loading={loading}
              style={{ background: "#004d33" }}
            >
              ĐĂNG NHẬP
            </Button>
          </Form.Item>
        </Form>
      </Card>
    </div>
  );
};

export default TrangDangNhapNhanVien;
