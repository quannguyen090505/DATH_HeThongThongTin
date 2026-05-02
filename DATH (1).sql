CREATE DATABASE  IF NOT EXISTS `dath_hethongthongtin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dath_hethongthongtin`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dath_hethongthongtin
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
  `MaBanAn` varchar(5) NOT NULL,
  `TinhTrangSuDung` enum('Ban trong','Dang su dung','Goi mon','Can thanh toan','Can don') DEFAULT 'Ban trong',
  `ViTri` varchar(30) DEFAULT NULL,
  `SoChoNgoi` int DEFAULT NULL,
  `MaChiNhanh` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`MaBanAn`),
  KEY `MaChiNhanh` (`MaChiNhanh`),
  CONSTRAINT `banan_ibfk_1` FOREIGN KEY (`MaChiNhanh`) REFERENCES `chinhanh` (`MaChiNhanh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banan`
--

LOCK TABLES `banan` WRITE;
/*!40000 ALTER TABLE `banan` DISABLE KEYS */;
/*!40000 ALTER TABLE `banan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chinhanh`
--

DROP TABLE IF EXISTS `chinhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chinhanh` (
  `MaChiNhanh` varchar(5) NOT NULL,
  `DiaChi` varchar(30) DEFAULT NULL,
  `SDT` char(11) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `TinhTrangQuan` enum('Con cho','Het Cho') DEFAULT 'Con cho',
  `GioMoCua` datetime DEFAULT NULL,
  PRIMARY KEY (`MaChiNhanh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chinhanh`
--

LOCK TABLES `chinhanh` WRITE;
/*!40000 ALTER TABLE `chinhanh` DISABLE KEYS */;
/*!40000 ALTER TABLE `chinhanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cungcapthucdon`
--

DROP TABLE IF EXISTS `cungcapthucdon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cungcapthucdon` (
  `MaChiNhanh` varchar(5) NOT NULL,
  `MaMonAn` varchar(5) NOT NULL,
  PRIMARY KEY (`MaChiNhanh`,`MaMonAn`),
  KEY `cungcapthucdon_ibfk_2_idx` (`MaMonAn`),
  CONSTRAINT `cungcapthucdon_ibfk_1` FOREIGN KEY (`MaChiNhanh`) REFERENCES `chinhanh` (`MaChiNhanh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cungcapthucdon_ibfk_2` FOREIGN KEY (`MaMonAn`) REFERENCES `monan` (`MaMon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cungcapthucdon`
--

LOCK TABLES `cungcapthucdon` WRITE;
/*!40000 ALTER TABLE `cungcapthucdon` DISABLE KEYS */;
/*!40000 ALTER TABLE `cungcapthucdon` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `kiem_tra_so_luong1` BEFORE INSERT ON `cungcapthucdon` FOR EACH ROW begin
	if (new.SoLuongMon < 0) then
	signal sqlstate '45000' set message_text="so luong mon khong the la so am";
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `kiem_tra_so_luong_1` BEFORE INSERT ON `cungcapthucdon` FOR EACH ROW begin
	if (new.SoLuongMon < 0) then
	signal sqlstate '45000' set message_text="so luong mon khong the la so am";
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `kiem_tra_so_luong2` BEFORE UPDATE ON `cungcapthucdon` FOR EACH ROW begin
	if (new.SoLuongMon<0) then
    signal sqlstate '45000' set message_text="so luong mon khong the la so am\n";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `kiem_tra_so_luong_2` BEFORE UPDATE ON `cungcapthucdon` FOR EACH ROW begin
	if (new.SoLuongMon<0) then
    signal sqlstate '45000' set message_text="so luong mon khong the la so am\n";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dattruocmon`
--

DROP TABLE IF EXISTS `dattruocmon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dattruocmon` (
  `MaPhieuDatBan` varchar(5) NOT NULL,
  `MaPhieuAn` varchar(5) NOT NULL,
  PRIMARY KEY (`MaPhieuDatBan`,`MaPhieuAn`),
  KEY `MaPhieuAn` (`MaPhieuAn`),
  CONSTRAINT `dattruocmon_ibfk_1` FOREIGN KEY (`MaPhieuDatBan`) REFERENCES `phieudatban` (`MaPhieuDatBan`),
  CONSTRAINT `dattruocmon_ibfk_2` FOREIGN KEY (`MaPhieuAn`) REFERENCES `phieugoimon` (`MaPhieuAn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dattruocmon`
--

LOCK TABLES `dattruocmon` WRITE;
/*!40000 ALTER TABLE `dattruocmon` DISABLE KEYS */;
/*!40000 ALTER TABLE `dattruocmon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `MaHoaDon` varchar(5) NOT NULL,
  `MaPhieuAn` varchar(5) DEFAULT NULL,
  `NgayGioTaoHoaDon` datetime DEFAULT NULL,
  `MaNhanVien` varchar(5) DEFAULT NULL,
  `GiaTriHoaDon` int DEFAULT NULL,
  `PhuongThucThanhToan` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MaHoaDon`),
  UNIQUE KEY `MaPhieuAn_UNIQUE` (`MaPhieuAn`),
  KEY `hoadon_ibfk_2_idx` (`MaNhanVien`),
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaPhieuAn`) REFERENCES `phieugoimon` (`MaPhieuAn`),
  CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khach`
--

DROP TABLE IF EXISTS `khach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khach` (
  `SDT` char(11) NOT NULL,
  `HoTen` varchar(30) DEFAULT NULL,
  `DiemTichLuy` int DEFAULT NULL,
  PRIMARY KEY (`SDT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach`
--

LOCK TABLES `khach` WRITE;
/*!40000 ALTER TABLE `khach` DISABLE KEYS */;
/*!40000 ALTER TABLE `khach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monan`
--

DROP TABLE IF EXISTS `monan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monan` (
  `MaMon` varchar(5) NOT NULL,
  `TenMon` varchar(30) DEFAULT NULL,
  `DonGia` int DEFAULT NULL,
  `MaTheLoai` varchar(5) DEFAULT NULL,
  `ThongTinMoTa` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MaMon`),
  KEY `MaTheLoai` (`MaTheLoai`),
  CONSTRAINT `monan_ibfk_1` FOREIGN KEY (`MaTheLoai`) REFERENCES `theloaimon` (`MaTheLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monan`
--

LOCK TABLES `monan` WRITE;
/*!40000 ALTER TABLE `monan` DISABLE KEYS */;
/*!40000 ALTER TABLE `monan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monduocgoi`
--

DROP TABLE IF EXISTS `monduocgoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monduocgoi` (
  `MaMonAn` varchar(5) NOT NULL,
  `MaPhieuAn` varchar(5) NOT NULL,
  `SoLuongMon` int DEFAULT '0',
  PRIMARY KEY (`MaMonAn`,`MaPhieuAn`),
  KEY `goimon_ibfk_2_idx` (`MaPhieuAn`),
  CONSTRAINT `goimon_ibfk_1` FOREIGN KEY (`MaMonAn`) REFERENCES `monan` (`MaMon`),
  CONSTRAINT `goimon_ibfk_2` FOREIGN KEY (`MaPhieuAn`) REFERENCES `phieugoimon` (`MaPhieuAn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monduocgoi`
--

LOCK TABLES `monduocgoi` WRITE;
/*!40000 ALTER TABLE `monduocgoi` DISABLE KEYS */;
/*!40000 ALTER TABLE `monduocgoi` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `so_luong_mon_goi_1` BEFORE INSERT ON `monduocgoi` FOR EACH ROW begin
	if new.SoLuongMon <= 0 then
    signal sqlstate '45000' set message_text="so luong mon goi khong the nho hon hoac bang 0";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nguoiquanly`
--

DROP TABLE IF EXISTS `nguoiquanly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoiquanly` (
  `MaNguoiQuanLy` varchar(5) NOT NULL,
  `TenDangNhap` varchar(30) DEFAULT NULL,
  `MatKhau` varchar(30) DEFAULT NULL,
  `MaSoThue` char(12) DEFAULT NULL,
  PRIMARY KEY (`MaNguoiQuanLy`),
  UNIQUE KEY `MaNguoiQuanLy_UNIQUE` (`MaNguoiQuanLy`),
  CONSTRAINT `nguoiquanly_ibfk_1` FOREIGN KEY (`MaNguoiQuanLy`) REFERENCES `nhanvien` (`MaNhanVien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoiquanly`
--

LOCK TABLES `nguoiquanly` WRITE;
/*!40000 ALTER TABLE `nguoiquanly` DISABLE KEYS */;
/*!40000 ALTER TABLE `nguoiquanly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `MaNhanVien` varchar(5) NOT NULL,
  `MaChiNhanh` varchar(5) DEFAULT NULL,
  `HoTen` varchar(30) DEFAULT NULL,
  `SDT` char(11) DEFAULT NULL,
  `DiaChi` varchar(30) DEFAULT NULL,
  `CaLam` datetime DEFAULT NULL,
  `Luong` int DEFAULT NULL,
  PRIMARY KEY (`MaNhanVien`),
  KEY `MaChiNhanh` (`MaChiNhanh`),
  CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`MaChiNhanh`) REFERENCES `chinhanh` (`MaChiNhanh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieudatban`
--

DROP TABLE IF EXISTS `phieudatban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieudatban` (
  `MaPhieuDatBan` varchar(5) NOT NULL,
  `MaBanAn` varchar(5) DEFAULT NULL,
  `NgayGioTaoPhieu` datetime DEFAULT NULL,
  `NgayGioNhanBan` datetime DEFAULT NULL,
  `TinhTrang` enum('DangXuLy','ChuaNhanBan','DaNhanban','HuyDatBan') DEFAULT 'DangXuLy',
  `TienCoc` int DEFAULT NULL,
  `SDTKhach` char(11) DEFAULT NULL,
  `MaNhanVienPhucVu` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`MaPhieuDatBan`),
  KEY `MaBanAn` (`MaBanAn`),
  KEY `SDTKhach` (`SDTKhach`),
  KEY `phieudatban_ibfk_3` (`MaNhanVienPhucVu`),
  CONSTRAINT `phieudatban_ibfk_1` FOREIGN KEY (`MaBanAn`) REFERENCES `banan` (`MaBanAn`),
  CONSTRAINT `phieudatban_ibfk_2` FOREIGN KEY (`SDTKhach`) REFERENCES `khach` (`SDT`),
  CONSTRAINT `phieudatban_ibfk_3` FOREIGN KEY (`MaNhanVienPhucVu`) REFERENCES `nhanvien` (`MaNhanVien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieudatban`
--

LOCK TABLES `phieudatban` WRITE;
/*!40000 ALTER TABLE `phieudatban` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieudatban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieugoimon`
--

DROP TABLE IF EXISTS `phieugoimon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieugoimon` (
  `MaPhieuAn` varchar(5) NOT NULL,
  `MaBanAn` varchar(5) DEFAULT NULL,
  `SDTKhach` char(11) DEFAULT NULL,
  `NgayGioTaoPhieu` datetime DEFAULT NULL,
  `TongSoMon` int DEFAULT NULL,
  `MaNhanVienPhucVu` varchar(5) DEFAULT NULL,
  `DoUuTien` int DEFAULT '0',
  PRIMARY KEY (`MaPhieuAn`),
  KEY `phieugoimon_ibfk_1_idx` (`MaBanAn`),
  KEY `phieugoimon_ibfk_2_idx` (`MaNhanVienPhucVu`),
  KEY `phieugoimon_ibfk_3_idx` (`SDTKhach`),
  CONSTRAINT `phieugoimon_ibfk_1` FOREIGN KEY (`MaBanAn`) REFERENCES `banan` (`MaBanAn`),
  CONSTRAINT `phieugoimon_ibfk_2` FOREIGN KEY (`MaNhanVienPhucVu`) REFERENCES `nhanvien` (`MaNhanVien`),
  CONSTRAINT `phieugoimon_ibfk_3` FOREIGN KEY (`SDTKhach`) REFERENCES `khach` (`SDT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieugoimon`
--

LOCK TABLES `phieugoimon` WRITE;
/*!40000 ALTER TABLE `phieugoimon` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieugoimon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieunhapkho`
--

DROP TABLE IF EXISTS `phieunhapkho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieunhapkho` (
  `MaNhapKho` varchar(5) NOT NULL,
  `NgayGioTaoPhieu` datetime DEFAULT NULL,
  `MaNhanVienKiemToan` varchar(5) DEFAULT NULL,
  `GiaTriPhieu` int DEFAULT NULL,
  `ThongTinGhiChu` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MaNhapKho`),
  KEY `MaNhanVienKiemToan` (`MaNhanVienKiemToan`),
  CONSTRAINT `phieunhapkho_ibfk_1` FOREIGN KEY (`MaNhanVienKiemToan`) REFERENCES `nhanvien` (`MaNhanVien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieunhapkho`
--

LOCK TABLES `phieunhapkho` WRITE;
/*!40000 ALTER TABLE `phieunhapkho` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieunhapkho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theloaimon`
--

DROP TABLE IF EXISTS `theloaimon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theloaimon` (
  `MaTheLoai` varchar(5) NOT NULL,
  `TenTheLoai` varchar(30) DEFAULT NULL,
  `ThongTinMota` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MaTheLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theloaimon`
--

LOCK TABLES `theloaimon` WRITE;
/*!40000 ALTER TABLE `theloaimon` DISABLE KEYS */;
/*!40000 ALTER TABLE `theloaimon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dath_hethongthongtin'
--

--
-- Dumping routines for database 'dath_hethongthongtin'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-29 15:37:36
