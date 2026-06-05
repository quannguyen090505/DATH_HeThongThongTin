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
  Spin,
  message,
} from "antd";
import {
  EnvironmentOutlined,
  TeamOutlined,
  PhoneOutlined,
  ShoppingOutlined,
  QrcodeOutlined,
  ArrowRightOutlined,
  EyeOutlined,
} from "@ant-design/icons";
import { useNavigate } from "react-router-dom";
import HeaderTrangChu from "./HeaderTrangChu";
import api from "./api";

const { Title, Text, Paragraph } = Typography;

const TrangChu = () => {
  const navigate = useNavigate();
  const [danhSachChiNhanh, setDanhSachChiNhanh] = useState([]);
  const [monDuocChon, setMonDuocChon] = useState(null);
  const [isModalVisible, setIsModalVisible] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchDanhSachChiNhanh = async () => {
      setLoading(true);
      try {
        const responseChiNhanh = await api.get("/api/thong-tin-chi-nhanh/");
        const danhSachCN = responseChiNhanh.data.data || [];

        const dataHoanChinh = await Promise.all(
          danhSachCN
            .filter((chiNhanh) => chiNhanh.CoSan === 1)
            .map(async (chiNhanh) => {
              try {
                const responseThucDon = await api.get(
                  "/api/thong-tin-thuc-don",
                  {
                    params: { ma_chi_nhanh: chiNhanh.MaChiNhanh },
                  },
                );

                const thucDonCuaCN = (responseThucDon.data.data || [])
                  .filter((mon) => mon.CoSan === 1)
                  .map((mon) => ({
                    ...mon,
                    MaMon: mon.MaMonAn,
                  }));

                return {
                  ...chiNhanh,
                  ThucDon: thucDonCuaCN.slice(0, 4),
                };
              } catch (err) {
                console.error(
                  `Lỗi tải thực đơn chi nhánh ${chiNhanh.MaChiNhanh}:`,
                  err,
                );
                return {
                  ...chiNhanh,
                  ThucDon: [],
                };
              }
            }),
        );

        setDanhSachChiNhanh(dataHoanChinh);
      } catch (error) {
        console.error("Lỗi khi tải dữ liệu hệ thống:", error);
        message.error("Không thể kết nối đến máy chủ để tải dữ liệu!");
      } finally {
        setLoading(false);
      }
    };

    fetchDanhSachChiNhanh();
  }, []);

  const moChiTietMon = (mon) => {
    setMonDuocChon(mon);
    setIsModalVisible(true);
  };

  const chuyenTrangDatMon = (maChiNhanh) => {
    navigate(`/dat-mon?chiNhanh=${maChiNhanh}`);
  };

  return (
    <div
      style={{
        background: "linear-gradient(180deg, #f9fbfd 0%, #f4f7f6 100%)",
        minHeight: "100vh",
        paddingBottom: "80px",
        fontFamily: "'Outfit', 'Inter', sans-serif",
      }}
    >
      <HeaderTrangChu />
      <div
        style={{
          background: "linear-gradient(135deg, #1890ff 0%, #1d39c4 100%)",
          color: "#fff",
          padding: "80px 20px",
          textAlign: "center",
          boxShadow: "0 4px 20px rgba(24,144,255,0.15)",
          marginBottom: "40px",
          position: "relative",
          overflow: "hidden",
        }}
      >
        <div
          style={{
            position: "absolute",
            width: "300px",
            height: "300px",
            background: "rgba(255,255,255,0.05)",
            borderRadius: "50%",
            top: "-50px",
            right: "-50px",
          }}
        />
        <div
          style={{
            position: "absolute",
            width: "200px",
            height: "200px",
            background: "rgba(255,255,255,0.05)",
            borderRadius: "50%",
            bottom: "-50px",
            left: "-50px",
          }}
        />

        <div style={{ maxWidth: "800px", margin: "0 auto" }}>
          <Title
            level={1}
            style={{
              color: "#fff",
              fontWeight: 800,
              fontSize: "2.8rem",
              marginBottom: "15px",
            }}
          >
            Trải Nghiệm Ẩm Thực Đỉnh Cao
          </Title>
          <Paragraph
            style={{
              color: "rgba(255,255,255,0.85)",
              fontSize: "1.2rem",
              marginBottom: "30px",
            }}
          >
            Hệ thống nhà hàng Gourmet F&B mang đến những món ăn hảo hạng, nguyên
            liệu tươi sạch chuẩn 5 sao cùng quy trình phục vụ số hóa hiện đại
            bậc nhất.
          </Paragraph>
        </div>
      </div>

      <div
        id="chi-nhanh-section"
        style={{ maxWidth: "1200px", margin: "0 auto", padding: "0 20px" }}
      >
        <div style={{ textAlign: "center", marginBottom: "50px" }}>
          <Title level={2} style={{ fontWeight: 800 }}>
            Các Chi Nhánh Hệ Thống
          </Title>
          <Text type="secondary" style={{ fontSize: "1.1rem" }}>
            Chọn chi nhánh gần nhất để đặt món mang về hoặc quét QR gọi món tại
            bàn ăn
          </Text>
        </div>

        {loading ? (
          <div
            style={{
              display: "flex",
              justifyContent: "center",
              padding: "100px 0",
            }}
          >
            <Spin size="large" tip="Đang tải dữ liệu nhà hàng..." />
          </div>
        ) : (
          danhSachChiNhanh.map((chiNhanh) => (
            <div
              key={chiNhanh.MaChiNhanh}
              style={{
                marginBottom: "60px",
                background: "#fff",
                borderRadius: "16px",
                boxShadow: "0 4px 15px rgba(0,0,0,0.03)",
                padding: "30px",
                border: "1px solid rgba(0, 0, 0, 0.04)",
              }}
            >
              {/* Branch Details Card */}
              <Row gutter={[24, 24]} align="middle">
                <Col xs={24} md={16}>
                  <Space direction="vertical" size="small">
                    <div
                      style={{
                        display: "flex",
                        alignItems: "center",
                        gap: "10px",
                        flexWrap: "wrap",
                      }}
                    >
                      <Title level={3} style={{ margin: 0, fontWeight: 700 }}>
                        {chiNhanh.TenChiNhanh ||
                          `Chi nhánh ${chiNhanh.MaChiNhanh}`}
                      </Title>
                      <Tag
                        color={
                          chiNhanh.TinhTrangQuan === "HetCho" ? "red" : "green"
                        }
                        style={{
                          borderRadius: "10px",
                          fontWeight: "bold",
                          padding: "2px 10px",
                        }}
                      >
                        {chiNhanh.TinhTrangQuan === "HetCho"
                          ? "HẾT CHỖ"
                          : "CÒN CHỖ"}
                      </Tag>{" "}
                    </div>

                    <Text
                      type="secondary"
                      style={{ display: "block", marginBottom: "15px" }}
                    >
                      Thời gian mở cửa:{" "}
                      {chiNhanh.GioMoCua
                        ? new Date(chiNhanh.GioMoCua).toLocaleTimeString([], {
                            hour: "2-digit",
                            minute: "2-digit",
                          })
                        : "08:00"}{" "}
                      - 22:00
                    </Text>

                    <Row gutter={[20, 10]}>
                      <Col span={24}>
                        <div
                          style={{
                            display: "flex",
                            alignItems: "flex-start",
                            gap: "8px",
                          }}
                        >
                          <EnvironmentOutlined
                            style={{ color: "#1890ff", marginTop: "4px" }}
                          />
                          <div>
                            <Text strong>Địa chỉ: </Text>
                            <Text>{chiNhanh.DiaChi}</Text>
                          </div>
                        </div>
                      </Col>
                      <Col span={24}>
                        <div
                          style={{
                            display: "flex",
                            alignItems: "center",
                            gap: "8px",
                          }}
                        >
                          <PhoneOutlined style={{ color: "#1890ff" }} />
                          <div>
                            <Text strong>Hotline: </Text>
                            <Text>{chiNhanh.SDT || "1900 xxxx"}</Text>
                          </div>
                        </div>
                      </Col>
                    </Row>
                  </Space>
                </Col>

                <Col
                  xs={24}
                  md={8}
                  style={{
                    display: "flex",
                    justifyContent: "md-flex-end",
                    gap: "12px",
                    flexWrap: "wrap",
                  }}
                >
                  <Button
                    type="primary"
                    icon={<ShoppingOutlined />}
                    onClick={() => chuyenTrangDatMon(chiNhanh.MaChiNhanh)}
                    style={{
                      height: "46px",
                      borderRadius: "23px",
                      fontWeight: "bold",
                      backgroundColor: "#1890ff",
                      flex: 1,
                      minWidth: "150px",
                    }}
                  >
                    Đặt Mang Về
                  </Button>
                </Col>
              </Row>

              <Divider style={{ margin: "25px 0" }} />

              <div>
                <Title
                  level={4}
                  style={{
                    marginBottom: "20px",
                    display: "flex",
                    justifyContent: "space-between",
                    alignItems: "center",
                  }}
                >
                  <span>Thực Đơn Nổi Bật</span>
                  <Button
                    type="link"
                    icon={<ArrowRightOutlined />}
                    onClick={() => chuyenTrangDatMon(chiNhanh.MaChiNhanh)}
                    style={{ padding: 0 }}
                  >
                    Xem tất cả thực đơn
                  </Button>
                </Title>

                <Row gutter={[16, 16]}>
                  {chiNhanh.ThucDon && chiNhanh.ThucDon.length > 0 ? (
                    chiNhanh.ThucDon.map((mon) => (
                      <Col xs={24} sm={12} md={8} lg={6} key={mon.MaMon}>
                        <Card
                          hoverable
                          onClick={() => moChiTietMon(mon)}
                          cover={
                            <div
                              style={{
                                overflow: "hidden",
                                height: "150px",
                                borderTopLeftRadius: "12px",
                                borderTopRightRadius: "12px",
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
                                  transition: "transform 0.3s ease",
                                }}
                                className="food-img"
                              />
                            </div>
                          }
                          style={{
                            borderRadius: "12px",
                            overflow: "hidden",
                            border: "1px solid rgba(0, 0, 0, 0.05)",
                            boxShadow: "0 2px 8px rgba(0,0,0,0.02)",
                          }}
                        >
                          <Card.Meta
                            title={
                              <div
                                style={{
                                  display: "flex",
                                  justifyContent: "space-between",
                                  alignItems: "flex-start",
                                  gap: "10px",
                                }}
                              >
                                <Text strong style={{ fontSize: "1rem" }}>
                                  {mon.TenMon}
                                </Text>
                              </div>
                            }
                            description={
                              <div
                                style={{
                                  marginTop: "5px",
                                  display: "flex",
                                  justifyContent: "space-between",
                                  alignItems: "center",
                                }}
                              >
                                <Text
                                  type="danger"
                                  strong
                                  style={{ fontSize: "1.1rem" }}
                                >
                                  {mon.DonGia.toLocaleString()} đ
                                </Text>
                                <Button
                                  size="small"
                                  type="text"
                                  icon={<EyeOutlined />}
                                />
                              </div>
                            }
                          />
                        </Card>
                      </Col>
                    ))
                  ) : (
                    <div
                      style={{
                        width: "100%",
                        textAlign: "center",
                        padding: "20px 0",
                        color: "#8c8c8c",
                      }}
                    >
                      Không có thực đơn hiển thị hoặc thực đơn trống.
                    </div>
                  )}
                </Row>
              </div>
            </div>
          ))
        )}
      </div>

      {/* Styled image hover effect */}
      <style>{`
        .food-img:hover {
          transform: scale(1.08);
        }
      `}</style>

      {/* Dish Details Modal */}
      <Modal
        title={null}
        open={isModalVisible}
        onCancel={() => setIsModalVisible(false)}
        footer={[
          <Button
            key="back"
            type="primary"
            shape="round"
            onClick={() => setIsModalVisible(false)}
            style={{ height: "40px", padding: "0 24px" }}
          >
            Đóng lại
          </Button>,
        ]}
        centered
        width={480}
        bodyStyle={{ padding: 0 }}
      >
        {monDuocChon && (
          <div>
            <div
              style={{
                height: "240px",
                overflow: "hidden",
                borderTopLeftRadius: "8px",
                borderTopRightRadius: "8px",
                position: "relative",
              }}
            >
              <img
                alt={monDuocChon.TenMon}
                src={
                  monDuocChon.HinhAnh ||
                  "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500"
                }
                style={{ width: "100%", height: "100%", objectFit: "cover" }}
              />
              <div
                style={{
                  position: "absolute",
                  bottom: 0,
                  left: 0,
                  width: "100%",
                  background:
                    "linear-gradient(0deg, rgba(0,0,0,0.8) 0%, transparent 100%)",
                  padding: "20px",
                  color: "#fff",
                }}
              >
                <Title
                  level={3}
                  style={{ color: "#fff", margin: 0, fontWeight: 700 }}
                >
                  {monDuocChon.TenMon}
                </Title>
              </div>
            </div>

            <div style={{ padding: "24px" }}>
              <div
                style={{
                  display: "flex",
                  justifyContent: "space-between",
                  alignItems: "center",
                  marginBottom: "15px",
                }}
              >
                <Text type="secondary" style={{ fontSize: "1rem" }}>
                  Đơn giá món ăn:
                </Text>
                <Title
                  level={3}
                  style={{ color: "#ff4d4f", margin: 0, fontWeight: 800 }}
                >
                  {monDuocChon.DonGia.toLocaleString()} VNĐ
                </Title>
              </div>

              <Divider style={{ margin: "15px 0" }} />

              <Text
                strong
                style={{
                  fontSize: "1.05rem",
                  display: "block",
                  marginBottom: "8px",
                }}
              >
                Mô tả chi tiết món:
              </Text>
              <Paragraph style={{ color: "#595959", lineHeight: "1.6" }}>
                {monDuocChon.ThongTinMon ||
                  "Món ăn hảo hạng được chế biến bởi bếp trưởng chuyên nghiệp của hệ thống Gourmet F&B, đem đến hương vị tươi ngon đậm đà khó cưỡng."}
              </Paragraph>
            </div>
          </div>
        )}
      </Modal>
    </div>
  );
};

export default TrangChu;
