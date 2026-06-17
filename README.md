# 🍽️ Hệ Thống Quản Lý Nhà Hàng (POS & KDS)

Một giải pháp phần mềm toàn diện hỗ trợ số hóa quy trình vận hành nhà hàng, bao gồm việc quản lý gọi món (Point of Sale - POS), hiển thị nhà bếp (Kitchen Display System - KDS), quản lý sơ đồ bàn và đối soát tài chính.

## 🛠 Công nghệ sử dụng
Dự án được xây dựng theo mô hình kiến trúc 3-tier/MVC:
* **Frontend:** ReactJS (UI Components, Axios call API)
* **Backend:** Python FastAPI (RESTful API, Pydantic validation)
* **Database:** MySQL (Tối ưu hóa với Stored Procedures & Triggers)

## ✨ Chức năng cốt lõi
* **Quản lý Sơ đồ bàn & Đặt bàn:** Theo dõi trạng thái bàn theo thời gian thực và xử lý overbooking.
* **Point of Sale (POS):** Đặt món tại bàn, đặt mang về, quản lý giỏ hàng và thanh toán (tích hợp ưu đãi thành viên).
* **Kitchen Display System (KDS):** Hiển thị và đồng bộ trạng thái chế biến món ăn giữa bếp và thu ngân.
* **Quản trị (Admin Dashboard):** Quản lý nhân sự, thực đơn, hóa đơn doanh thu và phiếu nhập kho (chi phí).

## 🚀 Hướng dẫn cài đặt & Chạy dự án

### 1. Khởi tạo Cơ sở dữ liệu
* Cài đặt MySQL Server.
* Tạo database `dath_hethongthongtin` và import file dump CSDL DATH.sql.

### 2. Khởi chạy Backend (FastAPI)
Di chuyển vào thư mục backend và cài đặt thư viện:
```bash
  cd backend
  pip install -r requirements.txt
  uvicorn main:app --reload
  (Backend sẽ chạy tại: http://localhost:8000)
```
### 2. Khởi chạy Frontend (React)
Di chuyển vào thư mục frontend và cài đặt thư viện:
```bash
  cd frontend
  npm install
  npm start
  (Frontend sẽ chạy tại: http://localhost:3000)
```
(Nếu cần demo qua mạng ngoại bộ, hãy sử dụng các công cụ Tunnel như Pinggy hoặc Ngrok để forward port, đã thiết lập trong api.jsx nhưng cần cài đặt thêm thư viện để hoạt động, cụ thể:
mở một terminal mới chạy song song với terminal đang chạy backendm chạy lệnh 
```bash
ngrok http 8000
```
và cấu hình lại baseURL trong api.jsx theo URL  được cung cấp tại dashboard của Ngrok khi truy cập vào Web interface/Forwarding, khi này port nội bộ 8000 sẽ được đưa ra internet,
sau đó chạy Pinggy
```bash
ssh -p 443 -R0:localhost:8000 a.pinggy.io
```
để lấy đường dẫn Public URL mà Pinggy trả về để chia sẻ với người dùng khác. Lúc này, toàn bộ các luồng request gọi món, thanh toán từ thiết bị Frontend sẽ được điều hướng thành công qua giao thức HTTPS về máy chủ cục bộ một cách ổn định, đảm bảo quá trình demo không bị gián đoạn.
)
Nhóm tác giả:
- Nguyễn Hoàng Minh Quân, mssv: 2312836
- Phạm Bùi Chí Dũng, mssv: 2310569
- Nguyễn Lâm, mssv: 2311822
