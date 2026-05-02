-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurantmanagement
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `banan`
--

DROP TABLE IF EXISTS `banan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banan` (
  `MaBanAn` varchar(10) NOT NULL,
  `TinhTrangSuDung` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ViTri` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SoLuongChoNgoi` int DEFAULT NULL,
  `MaChiNhanh` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MaBanAn`),
  KEY `MaChiNhanh` (`MaChiNhanh`),
  CONSTRAINT `banan_ibfk_1` FOREIGN KEY (`MaChiNhanh`) REFERENCES `chinhanh` (`MaChiNhanh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chinhanh`
--

DROP TABLE IF EXISTS `chinhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chinhanh` (
  `MaChiNhanh` varchar(10) NOT NULL,
  `DiaChi` text,
  `ThongTinLienLac` varchar(100) DEFAULT NULL,
  `ThoiGianMoCua` varchar(50) DEFAULT NULL,
  `TinhTrang` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MaChiNhanh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goimon`
--

DROP TABLE IF EXISTS `goimon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goimon` (
  `MaMon` varchar(10) NOT NULL,
  `MaPhieu` varchar(10) NOT NULL,
  `SoLuongMon` int DEFAULT NULL,
  PRIMARY KEY (`MaMon`,`MaPhieu`),
  KEY `MaPhieu` (`MaPhieu`),
  CONSTRAINT `goimon_ibfk_1` FOREIGN KEY (`MaMon`) REFERENCES `monan` (`MaMon`),
  CONSTRAINT `goimon_ibfk_2` FOREIGN KEY (`MaPhieu`) REFERENCES `phieugoimon` (`MaPhieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `MaHoaDon` varchar(10) NOT NULL,
  `MaPhieu` varchar(10) DEFAULT NULL,
  `NgayTaoHoaDon` date DEFAULT NULL,
  `GioTaoHoaDon` time DEFAULT NULL,
  `GiaTriHoaDon` decimal(18,2) DEFAULT '0.00',
  `PhuongThucThanhToan` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MaNhanVienThanhToan` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MaHoaDon`),
  KEY `MaPhieu` (`MaPhieu`),
  KEY `MaNhanVienThanhToan` (`MaNhanVienThanhToan`),
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaPhieu`) REFERENCES `phieugoimon` (`MaPhieu`),
  CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`MaNhanVienThanhToan`) REFERENCES `nhanvien` (`MaNhanVien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monan`
--

DROP TABLE IF EXISTS `monan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monan` (
  `MaMon` varchar(10) NOT NULL,
  `MaTheLoai` varchar(10) DEFAULT NULL,
  `TenMon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DonGia` decimal(18,2) DEFAULT NULL,
  `MoTa` text,
  PRIMARY KEY (`MaMon`),
  KEY `MaTheLoai` (`MaTheLoai`),
  CONSTRAINT `monan_ibfk_1` FOREIGN KEY (`MaTheLoai`) REFERENCES `theloai` (`MaTheLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `MaNhanVien` varchar(10) NOT NULL,
  `MaChiNhanh` varchar(10) DEFAULT NULL,
  `HoTen` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SoDienThoai` varchar(15) DEFAULT NULL,
  `DiaChiCuTru` text,
  `VaiTro` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ThongTinCaLam` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Luong` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`MaNhanVien`),
  KEY `MaChiNhanh` (`MaChiNhanh`),
  CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`MaChiNhanh`) REFERENCES `chinhanh` (`MaChiNhanh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phieugoimon`
--

DROP TABLE IF EXISTS `phieugoimon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieugoimon` (
  `MaPhieu` varchar(10) NOT NULL,
  `MaKhach` varchar(10) DEFAULT NULL,
  `MaBanAn` varchar(10) DEFAULT NULL,
  `MaNhanVienPhucVu` varchar(10) DEFAULT NULL,
  `NgayTaoPhieu` date DEFAULT NULL,
  `GioTaoPhieu` time DEFAULT NULL,
  `TongSoMon` int DEFAULT '0',
  `DoUuTien` int DEFAULT NULL,
  PRIMARY KEY (`MaPhieu`),
  KEY `MaBanAn` (`MaBanAn`),
  KEY `MaNhanVienPhucVu` (`MaNhanVienPhucVu`),
  CONSTRAINT `phieugoimon_ibfk_1` FOREIGN KEY (`MaBanAn`) REFERENCES `banan` (`MaBanAn`),
  CONSTRAINT `phieugoimon_ibfk_2` FOREIGN KEY (`MaNhanVienPhucVu`) REFERENCES `nhanvien` (`MaNhanVien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_After_Insert_PhieuGoiMon` AFTER INSERT ON `phieugoimon` FOR EACH ROW BEGIN
    UPDATE BanAn 
    SET TinhTrangSuDung = N'Đang dùng' 
    WHERE MaBanAn = NEW.MaBanAn;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `phieunhapkho`
--

DROP TABLE IF EXISTS `phieunhapkho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieunhapkho` (
  `MaNhapKho` varchar(10) NOT NULL,
  `NgayTao` date DEFAULT NULL,
  `GioTao` time DEFAULT NULL,
  `MaNhanVienKiemToan` varchar(10) DEFAULT NULL,
  `GiaTri` decimal(18,2) DEFAULT NULL,
  `GhiChu` text,
  PRIMARY KEY (`MaNhapKho`),
  KEY `MaNhanVienKiemToan` (`MaNhanVienKiemToan`),
  CONSTRAINT `phieunhapkho_ibfk_1` FOREIGN KEY (`MaNhanVienKiemToan`) REFERENCES `nhanvien` (`MaNhanVien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quanly`
--

DROP TABLE IF EXISTS `quanly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quanly` (
  `MaNguoiQuanLy` varchar(10) NOT NULL,
  `TenDangNhap` varchar(50) DEFAULT NULL,
  `MatKhau` varchar(255) DEFAULT NULL,
  `MaSoThue` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MaNguoiQuanLy`),
  UNIQUE KEY `TenDangNhap` (`TenDangNhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `theloai`
--

DROP TABLE IF EXISTS `theloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theloai` (
  `MaTheLoai` varchar(10) NOT NULL,
  `TenTheLoai` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MoTa` text,
  PRIMARY KEY (`MaTheLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'restaurantmanagement'
--
/*!50003 DROP FUNCTION IF EXISTS `GetTongTienPhieu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetTongTienPhieu`(p_MaPhieu VARCHAR(10)) RETURNS decimal(18,2)
    DETERMINISTIC
BEGIN
    DECLARE v_Tong DECIMAL(18,2);
    SELECT SUM(gm.SoLuongMon * ma.DonGia) INTO v_Tong
    FROM GoiMon gm
    JOIN MonAn ma ON gm.MaMon = ma.MaMon
    WHERE gm.MaPhieu = p_MaPhieu;
    RETURN IFNULL(v_Tong, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ThanhToanHoaDon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_ThanhToanHoaDon`(
    IN p_MaHoaDon VARCHAR(10),
    IN p_MaPhieu VARCHAR(10),
    IN p_PTThanhToan NVARCHAR(50),
    IN p_MaNV VARCHAR(10)
)
BEGIN
    -- 1. Tạo hóa đơn
    INSERT INTO HoaDon (MaHoaDon, MaPhieu, NgayTaoHoaDon, GioTaoHoaDon, PhuongThucThanhToan, MaNhanVienThanhToan)
    VALUES (p_MaHoaDon, p_MaPhieu, CURDATE(), CURTIME(), p_PT, p_MaNV);
    
    -- 2. Cập nhật bàn về trạng thái Trống
    UPDATE BanAn SET TinhTrangSuDung = N'Trống'
    WHERE MaBanAn = (SELECT MaBanAn FROM PhieuGoiMon WHERE MaPhieu = p_MaPhieu);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ThongKeDoanhThu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_ThongKeDoanhThu`(IN p_MaCN VARCHAR(10))
BEGIN
    SELECT cn.MaChiNhanh, SUM(hd.GiaTriHoaDon) as TongDoanhThu
    FROM ChiNhanh cn
    JOIN NhanVien nv ON cn.MaChiNhanh = nv.MaChiNhanh
    JOIN HoaDon hd ON nv.MaNhanVien = hd.MaNhanVienThanhToan
    WHERE cn.MaChiNhanh = p_MaCN
    GROUP BY cn.MaChiNhanh;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-27  3:39:44
