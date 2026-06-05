import React, { useState } from "react";
import {
  Modal,
  Form,
  Input,
  Button,
  Checkbox,
  message,
  Typography,
  Divider,
  Space,
} from "antd";
import {
  PhoneOutlined,
  UserOutlined,
  ArrowRightOutlined,
} from "@ant-design/icons";
import api from "./api";

const { Text, Title, Paragraph } = Typography;

const KhachDangNhap = ({ visible, onClose, onLoginSuccess }) => {
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

  const thucHienDangNhap = async (tenKhachMoi = "") => {
    try {
      const resLogin = await api.post("/api/khach-dang-nhap", {
        sdt: sdt,
      });

      if (resLogin.data.status === "success" || resLogin.data.access_token) {
        const token = resLogin.data.access_token;
        const sdtKhach = resLogin.data.sdt_khach || sdt;
        const tenKhach = tenKhachMoi || "Khách Hàng";

        const session = { token, sdt: sdtKhach, hoTen: tenKhach };
        localStorage.setItem("khach_session", JSON.stringify(session));
        api.defaults.headers.common["Authorization"] = `Bearer ${token}`;

        message.success(`Đăng nhập thành công! Chào mừng ${tenKhach}.`);
        if (onLoginSuccess) onLoginSuccess(session);

        form.resetFields();
        setSdt("");
        setHoTen("");
        setTrangThaiSdt(null);
        onClose();
        return true;
      }
    } catch (error) {
      console.log("Khách hàng chưa tồn tại, chuyển sang đăng ký!");
      return false;
    }
  };

  const handleAction = async () => {
    if (!sdt || sdt.length < 9 || sdt.length > 11) {
      message.error("Vui lòng nhập số điện thoại hợp lệ (9-11 chữ số)!");
      return;
    }
    setLoading(true);
    try {
      if (trangThaiSdt === null) {
        const dangNhapThanhCong = await thucHienDangNhap();
        if (!dangNhapThanhCong) {
          setTrangThaiSdt("khong_ton_tai");
          message.info(
            "Số điện thoại mới! Vui lòng nhập tên để đăng ký tài khoản.",
          );
        }
      } else if (trangThaiSdt === "khong_ton_tai") {
        if (!hoTen.trim()) {
          message.error("Vui lòng nhập Họ và Tên để tạo tài khoản mới!");
          setLoading(false);
          return;
        }
        await api.post("/api/tao-tai-khoan-khach", {
          sdt: sdt,
          ho_ten: hoTen,
        });
        message.success("Đăng ký tài khoản thành viên thành công!");

        await thucHienDangNhap(hoTen.trim());
      }
    } catch (error) {
      console.error("Lỗi hệ thống:", error);
      message.error(
        error.response?.data?.detail ||
          "Lỗi kết nối máy chủ. Vui lòng thử lại!",
      );
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

      <Form form={form} layout="vertical" onFinish={handleAction}>
        <Form.Item
          label={<Text strong>Số điện thoại</Text>}
          required
          style={{ marginBottom: "8px" }}
        >
          <Input
            prefix={<PhoneOutlined style={{ color: "#bfbfbf" }} />}
            placeholder="Nhập số điện thoại của bạn..."
            value={sdt}
            onChange={handlePhoneChange}
            maxLength={11}
            size="large"
            disabled={loading || trangThaiSdt !== null}
          />
        </Form.Item>

        {trangThaiSdt === "khong_ton_tai" && (
          <div style={{ textAlign: "right", marginBottom: "15px" }}>
            <Button
              type="link"
              onClick={() => {
                setTrangThaiSdt(null);
                setHoTen("");
              }}
              disabled={loading}
              style={{ padding: 0 }}
            >
              Thay đổi SĐT khác
            </Button>
          </div>
        )}
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
              style={{ marginBottom: 0 }}
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

        <div style={{ textAlign: "center", marginTop: "10px" }}>
          <Button
            type="primary"
            htmlType="submit"
            style={{
              width: "100%",
              height: "45px",
              borderRadius: "25px",
              backgroundColor:
                trangThaiSdt === "khong_ton_tai" ? "#52c41a" : "#1890ff",
              borderColor:
                trangThaiSdt === "khong_ton_tai" ? "#52c41a" : "#1890ff",
              fontWeight: "bold",
              fontSize: "16px",
            }}
            size="large"
            loading={loading}
            icon={<ArrowRightOutlined />}
          >
            {trangThaiSdt === "khong_ton_tai"
              ? "Đăng ký & Đăng nhập"
              : "Đăng nhập ngay"}
          </Button>
        </div>
      </Form>
    </Modal>
  );
};

export default KhachDangNhap;
