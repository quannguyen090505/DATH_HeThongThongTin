import React, { useState } from "react";
import { Modal, Form, Input, Button, Checkbox, message, Typography, Divider, Space } from "antd";
import { PhoneOutlined, UserOutlined, ArrowRightOutlined } from "@ant-design/icons";
import api from "./api";

const { Text, Title, Paragraph } = Typography;

const AuthModal = ({ visible, onClose, onLoginSuccess }) => {
  const [form] = Form.useForm();
  const [sdt, setSdt] = useState("");
  const [trangThaiSdt, setTrangThaiSdt] = useState(null); // null, 'hop_le', 'khong_ton_tai'
  const [loading, setLoading] = useState(false);
  const [hoTen, setHoTen] = useState("");

  const handlePhoneChange = (e) => {
    const value = e.target.value.replace(/[^0-9]/g, "");
    setSdt(value);
    setTrangThaiSdt(null);
  };

  const kiemTraSdt = async () => {
    if (!sdt || sdt.length < 9 || sdt.length > 11) {
      message.error("Vui lòng nhập số điện thoại hợp lệ (9-11 chữ số)!");
      return;
    }
    setLoading(true);
    try {
      const response = await api.get(`/api/kiem-tra-sdt-khach/${sdt}`);
      if (response.data.data === 1) {
        setTrangThaiSdt("hop_le");
        message.success("Số điện thoại đã đăng ký. Tiến hành đăng nhập!");
      } else {
        setTrangThaiSdt("khong_ton_tai");
        message.info("Số điện thoại mới! Vui lòng nhập tên để đăng ký tài khoản thành viên.");
      }
    } catch (error) {
      console.error("Lỗi kiểm tra SĐT:", error);
      message.error("Không thể kết nối đến hệ thống kiểm tra SĐT!");
    } finally {
      setLoading(false);
    }
  };

  const handleFinish = async () => {
    if (!sdt || sdt.length < 9) {
      message.error("Vui lòng nhập số điện thoại hợp lệ!");
      return;
    }

    setLoading(true);
    try {
      if (trangThaiSdt === "khong_ton_tai") {
        if (!hoTen.trim()) {
          message.error("Vui lòng nhập Họ và Tên để tạo tài khoản mới!");
          setLoading(false);
          return;
        }

        // 1. Tạo tài khoản khách mới
        await api.post("/api/tao-tai-khoan-khach", {
          sdt: sdt,
          ho_ten: hoTen,
          mat_khau: "khach123" // Mật khẩu mặc định do schema yêu cầu mat_khau
        });
        message.success("Đăng ký tài khoản thành viên thành công!");
      }

      // 2. Đăng nhập để lấy Token
      const resLogin = await api.post("/api/khach-dang-nhap", {
        sdt: sdt,
        mat_khau: "khach123" // schema requires mat_khau
      });

      if (resLogin.data.status === "success" || resLogin.data.access_token) {
        const token = resLogin.data.access_token;
        const sdtKhach = resLogin.data.sdt_khach || sdt;
        const tenKhach = hoTen.trim() || "Khách Hàng";

        const session = {
          token,
          sdt: sdtKhach,
          hoTen: tenKhach,
        };

        localStorage.setItem("khach_session", JSON.stringify(session));
        
        // Cập nhật Authorization header
        api.defaults.headers.common["Authorization"] = `Bearer ${token}`;

        message.success(`Đăng nhập thành công! Chào mừng ${tenKhach}.`);
        
        if (onLoginSuccess) {
          onLoginSuccess(session);
        }
        
        // Reset form
        form.resetFields();
        setSdt("");
        setHoTen("");
        setTrangThaiSdt(null);
        onClose();
      } else {
        message.error("Đăng nhập thất bại, vui lòng thử lại!");
      }
    } catch (error) {
      console.error("Lỗi đăng nhập/đăng ký:", error);
      const errMsg = error.response?.data?.detail || "Lỗi hệ thống. Vui lòng thử lại sau.";
      message.error(errMsg);
    } finally {
      setLoading(false);
    }
  };

  return (
    <Modal
      title={
        <div style={{ textAlign: "center", paddingBottom: "10px" }}>
          <Title level={3} style={{ margin: 0, color: "#1890ff" }}>
            ĐĂNG NHẬP THÀNH VIÊN
          </Title>
          <Paragraph type="secondary" style={{ margin: "5px 0 0 0" }}>
            Nhận ưu đãi tích điểm 0.1% hóa đơn khi đặt món
          </Paragraph>
        </div>
      }
      open={visible}
      onCancel={() => {
        form.resetFields();
        setSdt("");
        setHoTen("");
        setTrangThaiSdt(null);
        onClose();
      }}
      footer={null}
      width={400}
      centered
      bodyStyle={{ padding: "10px 24px 24px 24px" }}
    >
      <Divider style={{ margin: "10px 0 20px 0" }} />
      
      <Form form={form} layout="vertical" onFinish={handleFinish}>
        <Form.Item
          label={<Text strong>Số điện thoại</Text>}
          required
        >
          <Space.Compact style={{ width: "100%" }}>
            <Input
              prefix={<PhoneOutlined style={{ color: "#bfbfbf" }} />}
              placeholder="Nhập số điện thoại của bạn..."
              value={sdt}
              onChange={handlePhoneChange}
              maxLength={11}
              size="large"
              disabled={loading || trangThaiSdt !== null}
            />
            {trangThaiSdt === null && (
              <Button 
                type="primary" 
                onClick={kiemTraSdt} 
                loading={loading}
                size="large"
                style={{ backgroundColor: "#1890ff" }}
              >
                Kiểm tra
              </Button>
            )}
          </Space.Compact>
        </Form.Item>

        {trangThaiSdt === "khong_ton_tai" && (
          <div
            style={{
              padding: "16px",
              background: "#e6f7ff",
              border: "1px solid #91d5ff",
              borderRadius: "8px",
              marginBottom: "20px",
              animation: "fadeIn 0.3s ease",
            }}
          >
            <Form.Item
              label={<Text strong>Họ và Tên thành viên mới</Text>}
              required
            >
              <Input
                prefix={<UserOutlined style={{ color: "#bfbfbf" }} />}
                placeholder="Nhập họ và tên để tạo tài khoản..."
                value={hoTen}
                onChange={(e) => setHoTen(e.target.value)}
                size="large"
              />
            </Form.Item>
          </div>
        )}

        {trangThaiSdt === "hop_le" && (
          <div
            style={{
              padding: "12px",
              background: "#f6ffed",
              border: "1px solid #b7eb8f",
              borderRadius: "8px",
              marginBottom: "20px",
              textAlign: "center",
            }}
          >
            <Text type="success" strong>
              ✅ Tài khoản đã đăng ký thành công!
            </Text>
          </div>
        )}

        {trangThaiSdt !== null && (
          <div style={{ display: "flex", gap: "10px", marginTop: "10px" }}>
            <Button
              style={{ flex: 1 }}
              onClick={() => {
                setTrangThaiSdt(null);
                setHoTen("");
              }}
              size="large"
              disabled={loading}
            >
              Thay đổi SĐT
            </Button>
            <Button
              type="primary"
              htmlType="submit"
              style={{ flex: 2, backgroundColor: "#52c41a", borderColor: "#52c41a" }}
              size="large"
              loading={loading}
              icon={<ArrowRightOutlined />}
            >
              {trangThaiSdt === "khong_ton_tai" ? "Đăng ký & Đặt món" : "Đăng nhập ngay"}
            </Button>
          </div>
        )}
      </Form>
    </Modal>
  );
};

export default AuthModal;
