import React from "react";
import {
  Button,
  Typography,
  Table,
  Spin,
  Space,
  Modal,
  Dropdown,
  Tag,
  InputNumber,
} from "antd";
import {
  DownOutlined,
  MinusOutlined,
  PlusOutlined,
  CloseOutlined,
  SendOutlined,
} from "@ant-design/icons";

const { Title, Text } = Typography;

const PhieuGoiMonTab = ({
  loadingPhieu,
  phieuHienTai,
  currentTicketStatus,
  loadingXacNhan,
  onXacNhanGoiMon,
  onCapNhatTrangThaiMon,
  gioHang,
  tongTienMoi,
  onCapNhatSoLuong,
  onThemVaoBill,
  loadingSubmit,
  onGuiYeuCauBep,
}) => {
  // 🌟 Đã đổi logic bắt thuộc tính TinhTrangGoiMon
  const renderTagTinhTrangMon = (tinhTrang) => {
    switch (tinhTrang) {
      case "GoiMon":
        return <Tag color="volcano">Cần xác nhận</Tag>;
      case "ChoLenMon":
      case "DoiLenMon":
        return <Tag color="default">Chờ lên món</Tag>;
      case "DangCheBien":
        return <Tag color="cyan">Đang làm</Tag>;
      case "DaPhucVu":
        return <Tag color="blue">Đã lên món</Tag>;
      case "DaHuy":
      case "Huy":
        return <Tag color="error">Đã hủy</Tag>;
      default:
        return <Tag color="default">{tinhTrang || "N/A"}</Tag>;
    }
  };

  const renderTagTinhTrangPhieu = (tinhTrang) => {
    switch (tinhTrang) {
      case "GoiMon":
        return <Tag color="volcano">Khách chờ duyệt</Tag>;
      case "ChoLenMon":
      case "DoiLenMon":
      case "DangCheBien":
        return <Tag color="blue">Đang phục vụ</Tag>;
      case "YeuCauThanhToan":
        return <Tag color="gold">Yêu Cầu Thanh Toán</Tag>;
      case "DaThanhToan":
        return <Tag color="success">Đã Thanh Toán</Tag>;
      default:
        return <Tag color="default">{tinhTrang || "Chưa có"}</Tag>;
    }
  };

  return (
    <div style={{ padding: "10px 0" }}>
      {loadingPhieu ? (
        <Spin
          style={{ display: "block", textAlign: "center", margin: "20px" }}
        />
      ) : (
        phieuHienTai && (
          <div
            style={{
              marginBottom: "25px",
              background: "#e6f7ff",
              padding: "15px",
              borderRadius: "8px",
              border: "1px solid #91d5ff",
            }}
          >
            <div
              style={{
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
                marginBottom: "10px",
              }}
            >
              <Title level={5} style={{ color: "#1890ff", margin: 0 }}>
                Chi tiết hóa đơn
              </Title>
              <Space>
                {renderTagTinhTrangPhieu(currentTicketStatus)}

                {currentTicketStatus === "GoiMon" && (
                  <Button
                    type="primary"
                    size="small"
                    onClick={onXacNhanGoiMon}
                    loading={loadingXacNhan}
                    style={{
                      backgroundColor: "#fa541c",
                      borderColor: "#fa541c",
                    }}
                  >
                    Xác nhận Bếp
                  </Button>
                )}
              </Space>
            </div>

            <Table
              dataSource={phieuHienTai.data}
              rowKey={(record, index) => `${record.MaMon}_${index}`}
              pagination={false}
              size="small"
              columns={[
                {
                  title: "Tên món",
                  dataIndex: "TenMon",
                  render: (t) => <Text strong>{t}</Text>,
                },
                {
                  title: "SL",
                  dataIndex: "SoLuong",
                  align: "center",
                  width: 50,
                },
                {
                  title: "T.Thái",
                  // 🌟 SỬ DỤNG ĐÚNG TÊN TinhTrangGoiMon
                  dataIndex: "TinhTrangGoiMon",
                  align: "center",
                  render: (t) => renderTagTinhTrangMon(t),
                },
                {
                  title: "Hành động",
                  key: "actionMon",
                  align: "center",
                  render: (_, r) => {
                    // 🌟 Cập nhật lại điều kiện dựa vào TinhTrangGoiMon
                    if (
                      r.TinhTrangGoiMon === "DoiLenMon" ||
                      r.TinhTrangGoiMon === "ChoLenMon"
                    ) {
                      const menuItems = [
                        {
                          key: "DaPhucVu",
                          label: "Đã phục vụ",
                          onClick: () => onCapNhatTrangThaiMon(r, "DaPhucVu"),
                        },
                        {
                          key: "DaHuy",
                          danger: true,
                          label: "Hủy món",
                          onClick: () => {
                            Modal.confirm({
                              title: "Xác nhận hủy món",
                              content: `Bạn có chắc chắn muốn hủy món ${r.TenMon}?`,
                              okText: "Có, Hủy",
                              cancelText: "Không",
                              onOk: () => onCapNhatTrangThaiMon(r, "DaHuy"),
                            });
                          },
                        },
                      ];

                      return (
                        <Dropdown
                          menu={{ items: menuItems }}
                          trigger={["click"]}
                        >
                          <Button
                            size="small"
                            style={{
                              fontSize: "12px",
                              borderRadius: "4px",
                            }}
                          >
                            Thao tác <DownOutlined />
                          </Button>
                        </Dropdown>
                      );
                    }
                    return null;
                  },
                },
                {
                  title: "T.Tiền",
                  key: "thanhTien",
                  align: "right",
                  render: (_, r) => {
                    const isCanceled =
                      r.TinhTrangGoiMon === "Huy" ||
                      r.TinhTrangGoiMon === "DaHuy";
                    return (
                      <Text
                        delete={isCanceled}
                        type={isCanceled ? "secondary" : undefined}
                      >
                        {r.ThanhTien?.toLocaleString()}đ
                      </Text>
                    );
                  },
                },
              ]}
            />
            <div style={{ textAlign: "right", marginTop: "10px" }}>
              <Text type="secondary">Tổng tiền món cũ: </Text>
              <Text strong style={{ color: "#1890ff", fontSize: "16px" }}>
                {phieuHienTai.tong_tien?.toLocaleString()}đ
              </Text>
            </div>
          </div>
        )
      )}

      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          marginBottom: "15px",
        }}
      >
        <Title level={5} style={{ color: "#fa8c16", margin: 0 }}>
          Món mới gọi thêm {gioHang.length > 0 && `(${gioHang.length})`}
        </Title>
      </div>

      {gioHang.length === 0 ? (
        <div
          style={{
            textAlign: "center",
            padding: "30px",
            background: "#fafafa",
            borderRadius: "8px",
          }}
        >
          <Text type="secondary">Chưa có món mới nào được chọn.</Text>
        </div>
      ) : (
        <>
          {gioHang.map((item) => (
            <div
              key={item.MaMon}
              style={{
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
                padding: "12px",
                background: "#fffbe6",
                border: "1px solid #ffe58f",
                borderRadius: "8px",
                marginBottom: "10px",
              }}
            >
              <div style={{ flex: 1 }}>
                <Text strong style={{ display: "block", fontSize: "15px" }}>
                  {item.TenMon}
                </Text>
                <Text type="danger">{item.DonGia.toLocaleString()}đ</Text>
              </div>
              <div
                style={{ display: "flex", alignItems: "center", gap: "8px" }}
              >
                <Button
                  size="small"
                  shape="circle"
                  icon={<MinusOutlined />}
                  onClick={() => onCapNhatSoLuong(item.MaMon, item.SoLuong - 1)}
                />
                <InputNumber
                  value={item.SoLuong}
                  min={1}
                  onChange={(v) => onCapNhatSoLuong(item.MaMon, v)}
                  style={{ width: "45px" }}
                  controls={false}
                />
                <Button
                  size="small"
                  shape="circle"
                  icon={<PlusOutlined />}
                  onClick={() => onThemVaoBill(item)}
                />
                <Button
                  size="small"
                  danger
                  type="text"
                  icon={<CloseOutlined />}
                  onClick={() => onCapNhatSoLuong(item.MaMon, 0)}
                />
              </div>
            </div>
          ))}
          <div style={{ marginTop: "15px" }}>
            <div style={{ textAlign: "right", marginBottom: "15px" }}>
              <Text type="secondary">Cộng dồn mới: </Text>
              <Text strong style={{ color: "#ff4d4f", fontSize: "16px" }}>
                {tongTienMoi.toLocaleString()}đ
              </Text>
            </div>
            <Button
              type="primary"
              block
              size="large"
              icon={<SendOutlined />}
              loading={loadingSubmit}
              onClick={onGuiYeuCauBep}
              style={{ backgroundColor: "#52c41a", fontWeight: "bold" }}
            >
              GỬI BẾP (F9)
            </Button>
          </div>
        </>
      )}
    </div>
  );
};

export default PhieuGoiMonTab;
