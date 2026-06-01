import React, { useState, useEffect } from "react";
import {
  Typography,
  Row,
  Col,
  Card,
  Button,
  Modal,
  Tag,
  Divider,
  Space,
} from "antd";
import {
  EnvironmentOutlined,
  TeamOutlined,
  PhoneOutlined,
  ShoppingOutlined,
} from "@ant-design/icons";
import { useNavigate } from "react-router-dom";
import api from "./api"; // Nhớ đảm bảo ông đã import api

const { Title, Text, Paragraph } = Typography;

const TrangChu = () => {
  const navigate = useNavigate();
  const [danhSachChiNhanh, setDanhSachChiNhanh] = useState([]);
  const [monDuocChon, setMonDuocChon] = useState(null);
  const [isModalVisible, setIsModalVisible] = useState(false);

  useEffect(() => {
    const fetchDanhSachChiNhanh = async () => {
      try {
        const responseChiNhanh = await api.get("/api/thong-tin-chi-nhanh");
        const danhSachCN = responseChiNhanh.data.data;

        const dataHoanChinh = await Promise.all(
          danhSachCN.map(async (chiNhanh) => {
            const responseThucDon = await api.get(
              `/api/thuc-don/${chiNhanh.MaChiNhanh}`,
            );
            const thucDonCuaCN = responseThucDon.data.data;
            return {
              ...chiNhanh,
              ThucDon: thucDonCuaCN,
            };
          }),
        );

        setDanhSachChiNhanh(dataHoanChinh);
      } catch (error) {
        console.error("Lỗi khi tải dữ liệu hệ thống:", error);
      }
    };

    fetchDanhSachChiNhanh();
  }, []);

  const moChiTietMon = (mon) => {
    setMonDuocChon(mon);
    setIsModalVisible(true);
  };

  const chuyenTrangDatMon = (maChiNhanh) => {
    navigate(`/dat-mang-ve?chiNhanh=${maChiNhanh}`);
  };

  return (
    <div
      style={{
        background: "#ffffff",
        minHeight: "100vh",
        paddingBottom: "50px",
      }}
    >
      <div
        style={{
          padding: "20px 40px",
          borderBottom: "1px solid #ccc",
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
        }}
      >
        <Title level={2} style={{ margin: 0 }}>
          Trang chủ hệ thống
        </Title>
        <div style={{ display: "flex", gap: "30px", alignItems: "center" }}>
          <Text>CƠ SỞ</Text>
          <Text>LIÊN HỆ</Text>
        </div>
      </div>

      <div
        style={{ maxWidth: "1200px", margin: "40px auto", padding: "0 20px" }}
      >
        {danhSachChiNhanh.map((chiNhanh) => (
          <div key={chiNhanh.MaChiNhanh} style={{ marginBottom: "60px" }}>
            <Title level={3}>{chiNhanh.TenChiNhanh}</Title>

            <Card style={{ marginBottom: "20px", border: "1px solid #000" }}>
              <Title level={2}>{chiNhanh.TenDayDu}</Title>

              <Space style={{ marginBottom: "20px" }}>
                <Tag>ĐANG MỞ</Tag>
                <Text>HOẠT ĐỘNG TỪ {chiNhanh.GioMoCua}</Text>
              </Space>

              <Row gutter={40} style={{ marginBottom: "20px" }}>
                <Col>
                  <Text>Chi nhánh </Text>
                  <Text strong>
                    <EnvironmentOutlined /> {chiNhanh.MaChiNhanh}
                  </Text>
                </Col>
                <Col>
                  <Text>Sức chứa: </Text>
                  <Text strong>
                    <TeamOutlined /> {chiNhanh.SucChua}
                  </Text>
                </Col>
                <Col>
                  <Text>Địa chỉ: </Text>
                  <Text strong>{chiNhanh.DiaChi}</Text>
                </Col>
              </Row>

              <Space size="middle">
                <Button
                  icon={<ShoppingOutlined />}
                  onClick={() => chuyenTrangDatMon(chiNhanh.MaChiNhanh)}
                >
                  Mua Mang Về Ngay
                </Button>
                <Button icon={<PhoneOutlined />}>{chiNhanh.Hotline}</Button>
              </Space>
            </Card>

            <div>
              <Title level={4}>Thực Đơn Nổi Bật</Title>
              <Row gutter={[16, 16]}>
                {chiNhanh.ThucDon?.map((mon) => (
                  <Col xs={24} sm={12} md={8} lg={6} key={mon.MaMon}>
                    <Card
                      hoverable
                      onClick={() => moChiTietMon(mon)}
                      style={{ border: "1px solid #ccc" }}
                    >
                      <Title level={5}>{mon.TenMon}</Title>
                      <Text strong>{mon.DonGia.toLocaleString()} đ</Text>
                    </Card>
                  </Col>
                ))}
              </Row>
            </div>

            <Divider style={{ borderColor: "#000", borderWidth: "2px" }} />
          </div>
        ))}
      </div>

      <Modal
        title="Chi Tiết Món Ăn"
        open={isModalVisible}
        onCancel={() => setIsModalVisible(false)}
        footer={[
          <Button key="back" onClick={() => setIsModalVisible(false)}>
            Đóng lại
          </Button>,
        ]}
        centered
      >
        {monDuocChon && (
          <div>
            <Title level={3}>{monDuocChon.TenMon}</Title>
            <Title level={4}>{monDuocChon.DonGia.toLocaleString()} VNĐ</Title>
            <Divider />
            <Text strong>Mô tả chi tiết:</Text>
            <Paragraph style={{ marginTop: "10px" }}>
              {monDuocChon.ThongTinMon || "Món ăn chưa có mô tả."}
            </Paragraph>
          </div>
        )}
      </Modal>
    </div>
  );
};

export default TrangChu;
