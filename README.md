- Đây là repo Đồ án tốt nghiệp - hướng hệ thống thông tin HK252
- Để dùng chung và xây dụng database sử dụng ngôn ngữ mySQL, hãy pull file DATH.sql về máy để chỉnh sửa
- Sau khi pull file về máy, lựa chọn mục "Server" trên thanh công cụ, chọn "Import data",  lựa chọn "Import from sefl-contained file" và chọn file mới pull về (chọn target schema nếu cần), chọn "Dump structure and data" để lấy được dữ liệu đầy đủ nhất, cuối cùng "Start import" để load dữ liệu lên MySQL Workbench và bắt đầu sử dụng
  <img width="1920" height="1030" alt="image" src="https://github.com/user-attachments/assets/c5e8f3c1-eea9-4820-ab2d-afdc01f79868" />
- Khi muốn push file lên repo chung, hãy chọn mục "Server" trên thanh công cụ, chọn "Export data" để xuất code, lựa chọn schema để xuất dữ liệu, lựa chọn "Dump structure and data", chọn các ô "Dump stored procedures and function" + "Dump triggers" và "Export to self-contained file" ( chọn "Include create schema" nếu cần) trước khi chọn "Start export" để dữ liệu xuất ra đầy đủ nhất
<img width="1920" height="1030" alt="image" src="https://github.com/user-attachments/assets/96b481ad-4474-4ef9-b63c-617b2de44c13" />
