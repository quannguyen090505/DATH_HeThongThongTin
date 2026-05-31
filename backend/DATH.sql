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
  `MaBan` int NOT NULL AUTO_INCREMENT,
  `MaChiNhanh` int NOT NULL,
  `TinhTrangSuDung` enum('BanTrong','DangSuDung','CanThanhToan','DaThanhToan') NOT NULL DEFAULT 'BanTrong',
  `ViTri` varchar(30) NOT NULL DEFAULT '0',
  `SoLuongChoNgoi` int NOT NULL DEFAULT '0',
  `CoSan` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`MaBan`),
  KEY `banan_ibfk_1` (`MaChiNhanh`),
  CONSTRAINT `banan_ibfk_1` FOREIGN KEY (`MaChiNhanh`) REFERENCES `chinhanh` (`MaChiNhanh`),
  CONSTRAINT `banan_chk_1` CHECK ((`SoLuongChoNgoi` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banan`
--

LOCK TABLES `banan` WRITE;
/*!40000 ALTER TABLE `banan` DISABLE KEYS */;
INSERT INTO `banan` VALUES (1,1,'DaThanhToan','Tang 1',4,1),(2,1,'DaThanhToan','Tang 1',4,1),(3,1,'DaThanhToan','Tang 1',4,1),(4,1,'DaThanhToan','Tang 1',4,1),(5,1,'DaThanhToan','Tang 1',4,1),(6,1,'BanTrong','Tang 1',4,1),(7,2,'DaThanhToan','Tang 1',4,1),(8,2,'DaThanhToan','Tang 1',4,1),(9,2,'DaThanhToan','Tang 1',4,1),(10,2,'DaThanhToan','Tang 1',4,1),(11,2,'BanTrong','Tang 1',4,1),(12,2,'BanTrong','Tang 1',4,1),(13,2,'BanTrong','Tang 1',4,1),(14,3,'DaThanhToan','Tang 1',4,1),(15,3,'DaThanhToan','Tang 1',4,1),(16,3,'DaThanhToan','Tang 1',4,1),(17,3,'DaThanhToan','Tang 1',4,1),(18,3,'BanTrong','Tang 1',4,1),(19,3,'BanTrong','Tang 2',4,1),(20,3,'BanTrong','Tang 2',4,1),(21,3,'BanTrong','Tang 2',4,1),(22,3,'BanTrong','Tang 2',4,1),(23,3,'BanTrong','Tang 2',4,1),(24,3,'BanTrong','Tang 1',4,1);
/*!40000 ALTER TABLE `banan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chinhanh`
--

DROP TABLE IF EXISTS `chinhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chinhanh` (
  `MaChiNhanh` int NOT NULL AUTO_INCREMENT,
  `DiaChi` varchar(30) DEFAULT NULL,
  `SDT` char(11) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `TinhTrangQuan` enum('ConCho','HetCho') DEFAULT 'ConCho',
  `GioMoCua` datetime DEFAULT NULL,
  `CoSan` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`MaChiNhanh`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chinhanh`
--

LOCK TABLES `chinhanh` WRITE;
/*!40000 ALTER TABLE `chinhanh` DISABLE KEYS */;
INSERT INTO `chinhanh` VALUES (1,'Quận 1, TP. HCM','1111','1111@gmail.com','ConCho','2026-05-12 08:00:00',1),(2,'Quận 3, TP. HCM','222','222@gmail.com','ConCho','2026-05-12 08:00:00',1),(3,'Quận 10, TP. HCM','333','333@gmail.com','ConCho','2026-05-12 08:00:00',1);
/*!40000 ALTER TABLE `chinhanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `chitietphieugoimon`
--

DROP TABLE IF EXISTS `chitietphieugoimon`;
/*!50001 DROP VIEW IF EXISTS `chitietphieugoimon`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `chitietphieugoimon` AS SELECT 
 1 AS `MaChiNhanh`,
 1 AS `MaBanAn`,
 1 AS `MaPhieuGoiMon`,
 1 AS `TinhTrangPhieuGoiMon`,
 1 AS `MaMon`,
 1 AS `TenMon`,
 1 AS `SoLuong`,
 1 AS `DonGiaMon`,
 1 AS `ThanhTien`,
 1 AS `TinhTrangMon`,
 1 AS `ThanhToan`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cungcapthucdon`
--

DROP TABLE IF EXISTS `cungcapthucdon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cungcapthucdon` (
  `MaChiNhanh` int NOT NULL,
  `MaMonAn` int NOT NULL,
  `DonGia` int NOT NULL DEFAULT '0',
  `CoSan` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaChiNhanh`,`MaMonAn`),
  KEY `cungcapthucdon_ibfk_2_idx` (`MaMonAn`),
  CONSTRAINT `cungcapthucdon_ibfk_1` FOREIGN KEY (`MaChiNhanh`) REFERENCES `chinhanh` (`MaChiNhanh`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cungcapthucdon_ibfk_2` FOREIGN KEY (`MaMonAn`) REFERENCES `monan` (`MaMon`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cungcapthucdon`
--

LOCK TABLES `cungcapthucdon` WRITE;
/*!40000 ALTER TABLE `cungcapthucdon` DISABLE KEYS */;
INSERT INTO `cungcapthucdon` (`MaChiNhanh`, `MaMonAn`, `DonGia`, `CoSan`) VALUES
(1, 1, 55000, 1),
(1, 2, 65000, 1),
(1, 3, 75000, 1),
(1, 4, 250000, 1),
(1, 5, 220000, 1),
(1, 6, 45000, 1),
(1, 7, 50000, 1),
(1, 8, 30000, 1),
(1, 9, 35000, 1),
(2, 1, 65000, 1),
(2, 2, 75000, 0),
(2, 3, 85000, 1),
(2, 4, 280000, 1),
(2, 5, 250000, 0),
(2, 6, 55000, 1),
(2, 7, 60000, 1),
(2, 8, 40000, 1),
(2, 9, 45000, 1),
(3, 1, 0, 0),
(3, 2, 0, 0),
(3, 3, 0, 0),
(3, 4, 0, 0),
(3, 5, 0, 0),
(3, 6, 45000, 1),
(3, 7, 50000, 1),
(3, 8, 30000, 1),
(3, 9, 35000, 1);
/*!40000 ALTER TABLE `cungcapthucdon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dattruocmon`
--

DROP TABLE IF EXISTS `dattruocmon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dattruocmon` (
  `MaPhieuDatBan` int NOT NULL,
  `MaPhieuGoiMon` int NOT NULL,
  PRIMARY KEY (`MaPhieuDatBan`,`MaPhieuGoiMon`),
  KEY `dattruocmon_ibfk_2_idx` (`MaPhieuGoiMon`),
  CONSTRAINT `dattruocmon_ibfk_1` FOREIGN KEY (`MaPhieuDatBan`) REFERENCES `phieudatban` (`MaPhieuDatBan`),
  CONSTRAINT `dattruocmon_ibfk_2` FOREIGN KEY (`MaPhieuGoiMon`) REFERENCES `phieugoimon` (`MaPhieuGoiMon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dattruocmon`
--

LOCK TABLES `dattruocmon` WRITE;
/*!40000 ALTER TABLE `dattruocmon` DISABLE KEYS */;
/*!40000 ALTER TABLE `dattruocmon` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `hoan_tat_dat_mon_truoc` AFTER INSERT ON `dattruocmon` FOR EACH ROW begin
	declare v_GiaTriHoaDon decimal(18,2);
    set v_GiaTriHoaDon = GiatriPhieuAn(p_MaPhieuGoiMon);
    update PhieuDatBan 
    set TienCoc=p_GiaTriHoaDon*0.3
    where MaPhieuDatBan=new.MaPhieuDatBan;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `dsbanan`
--

DROP TABLE IF EXISTS `dsbanan`;
/*!50001 DROP VIEW IF EXISTS `dsbanan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dsbanan` AS SELECT 
 1 AS `MaChiNhanh`,
 1 AS `MaBan`,
 1 AS `SoLuongChoNgoi`,
 1 AS `ViTri`,
 1 AS `TinhTrangSuDung`,
 1 AS `CoSan`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dsmonan`
--

DROP TABLE IF EXISTS `dsmonan`;
/*!50001 DROP VIEW IF EXISTS `dsmonan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dsmonan` AS SELECT 
 1 AS `MaChiNhanh`,
 1 AS `MaMonAn`,
 1 AS `TenMon`,
 1 AS `DonGia`,
 1 AS `HinhAnh`,
 1 AS `ThongTinMon`,
 1 AS `MaTheLoai`,
 1 AS `TenTheLoai`,
 1 AS `ThongTinTheLoai`,
 1 AS `CoSan`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dsnhanvien`
--

DROP TABLE IF EXISTS `dsnhanvien`;
/*!50001 DROP VIEW IF EXISTS `dsnhanvien`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dsnhanvien` AS SELECT 
 1 AS `MaChiNhanh`,
 1 AS `MaNhanVien`,
 1 AS `AnhThe`,
 1 AS `HoTen`,
 1 AS `VaiTro`,
 1 AS `SDT`,
 1 AS `DiaChi`,
 1 AS `CaLam`,
 1 AS `Luong`,
 1 AS `TinhTrangLamViec`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `MaHoaDon` int NOT NULL AUTO_INCREMENT,
  `MaPhieuGoiMon` int NOT NULL,
  `NgayGioTaoHoaDon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MaNhanVien` int NOT NULL,
  `GiaTri` int NOT NULL,
  `PhuongThucThanhToan` varchar(30) NOT NULL,
  PRIMARY KEY (`MaHoaDon`),
  KEY `hoadon_ibfk_1_idx` (`MaPhieuGoiMon`),
  KEY `hoadon_ibfk_2_idx` (`MaNhanVien`),
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaPhieuGoiMon`) REFERENCES `phieugoimon` (`MaPhieuGoiMon`),
  CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (1,1,'2026-05-14 09:10:00',1,130000,'TienMat'),(2,2,'2026-05-14 10:20:00',2,150000,'ChuyenKhoan'),(3,3,'2026-05-14 11:05:00',1,120000,'TienMat'),(4,4,'2026-05-14 12:40:00',3,120000,'TheTinDung'),(5,5,'2026-05-14 13:15:00',2,230000,'ChuyenKhoan'),(6,6,'2026-05-14 13:50:00',1,120000,'TienMat'),(7,7,'2026-05-14 14:30:00',3,250000,'ChuyenKhoan'),(8,8,'2026-05-14 15:45:00',2,140000,'TienMat'),(9,9,'2026-05-14 16:20:00',1,75000,'ChuyenKhoan'),(10,10,'2026-05-14 19:15:00',3,300000,'TheTinDung'),(101,101,'2026-05-15 12:45:00',6,360000,'TienMat'),(102,102,'2026-05-16 13:10:00',7,350000,'ChuyenKhoan'),(103,103,'2026-05-17 13:00:00',11,350000,'ChuyenKhoan'),(104,104,'2026-05-18 13:45:00',12,210000,'TienMat'),(201,201,'2026-05-15 20:30:00',1,15000000,'ChuyenKhoan'),(202,202,'2026-05-20 21:00:00',2,21000000,'TheTinDung'),(203,203,'2026-05-16 20:45:00',6,14000000,'ChuyenKhoan'),(204,204,'2026-05-21 21:30:00',7,18500000,'TheTinDung'),(205,205,'2026-05-17 20:30:00',11,17000000,'ChuyenKhoan'),(206,206,'2026-05-22 22:00:00',12,23000000,'TheTinDung');
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `giam_gia_hoa_don` BEFORE INSERT ON `hoadon` FOR EACH ROW begin
	declare v_GiaTriHoaDon decimal(18,2);
    declare v_SDTKhach varchar(11);
    declare v_DiemTichLuy int;
    
    set v_GiaTriHoaDon =  gia_tri_phieu_goi_mon(new.MaPhieuGoiMon);
    
    select SDTKhach into v_SDTKhach
    from PhieuGoiMon
    where MaPhieuGoiMon=new.MaPhieuGoiMon;
    select DiemTichLuy into v_DiemTichLuy
    from Khach
    where SDT=v_SDTKhach;
    if v_DiemTichLuy is not null and v_DiemTichLuy>5000
    then 
		set new.GiaTri =p_GiaTriHoaDon*(1- v_DiemTichLuy*0.0001);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tich_diem_cho_khach` AFTER INSERT ON `hoadon` FOR EACH ROW begin
	declare t_SDTKhach varchar(11);
    select SDTKhach into t_SDTKhach
    from PhieuGoiMon
    where MaPhieuGoiMon=new.MaPhieuGoiMon;
    if t_SDTKhach is not Null
    then 
		update Khach
		set DiemTichLuy=DiemTichLuy + new.GiaTri*0.001
		where SDT = t_SDTKhach;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cap_nhat_trang_thai_ban_2` AFTER INSERT ON `hoadon` FOR EACH ROW BEGIN
	update BanAn
    set TinhTrangSuDung="DaThanhToan"
    where MaBan=(
	select MaBanAn
    from PhieuGoiMon
    where MaPhieuGoiMon=new.MaPhieuGoiMon
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `khach`
--

DROP TABLE IF EXISTS `khach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khach` (
  `SDT` char(11) NOT NULL,
  `HoTen` varchar(30) DEFAULT NULL,
  `DiemTichLuy` int NOT NULL DEFAULT '0',
  `MatKhau` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SDT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach`
--

LOCK TABLES `khach` WRITE;
/*!40000 ALTER TABLE `khach` DISABLE KEYS */;
INSERT INTO `khach` VALUES ('0901234560','temp',0,NULL),('0901234567','Nguyễn Hoàng Nam',510,'$2b$12$ZIbljZ0ECeKx9xuQLdnqNuBtyc/IKJ9UfddaEXXmdt8iecd/Dv3eW'),('0909090909','Trần Thị Hồng',650,'$2b$12$ZIbljZ0ECeKx9xuQLdnqNuBtyc/IKJ9UfddaEXXmdt8iecd/Dv3eW'),('0911223344','Lê Thanh Hải',0,'$2b$12$ZIbljZ0ECeKx9xuQLdnqNuBtyc/IKJ9UfddaEXXmdt8iecd/Dv3eW'),('0912345678','Phạm Minh Tuấn',120,'$2b$12$ZIbljZ0ECeKx9xuQLdnqNuBtyc/IKJ9UfddaEXXmdt8iecd/Dv3eW'),('0987654321','Phan Hoàng My',600,'$2b$12$ZIbljZ0ECeKx9xuQLdnqNuBtyc/IKJ9UfddaEXXmdt8iecd/Dv3eW'),('12345678910','ddd',0,NULL);
/*!40000 ALTER TABLE `khach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monan`
--

DROP TABLE IF EXISTS `monan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monan` (
  `MaMon` int NOT NULL AUTO_INCREMENT,
  `TenMon` varchar(30) DEFAULT NULL,
  `HinhAnh` varchar(225) DEFAULT NULL,
  `ThongTinMoTa` varchar(100) DEFAULT NULL,
  `MaTheLoai` int DEFAULT NULL,
  PRIMARY KEY (`MaMon`),
  KEY `monan_ibfk_1_idx` (`MaTheLoai`),
  CONSTRAINT `monan_ibfk_1` FOREIGN KEY (`MaTheLoai`) REFERENCES `theloaimon` (`MaTheLoai`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monan`
--

LOCK TABLES `monan` WRITE;
/*!40000 ALTER TABLE `monan` DISABLE KEYS */;
INSERT INTO `monan` (`TenMon`, `HinhAnh`, `ThongTinMoTa`, `MaTheLoai`) VALUES
('Thịt Kho Tộ', 'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?auto=format&w=500', 'Thịt heo ba chỉ kho tiêu đậm đà', 1),
('Cá Lóc Kho', 'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&w=500', 'Cá lóc đồng kho mặn ngọt', 1),
('Gà Chiên Nước Mắm', 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&w=500', 'Cánh gà chiên giòn rụm, đậm vị mắm tỏi', 1),
('Lẩu Thái Hải Sản', 'https://images.unsplash.com/photo-1555126634-323283e090fa?auto=format&w=500', 'Lẩu chua cay mực, tôm, nghêu', 2),
('Lẩu Bò Nấm', 'https://images.unsplash.com/photo-1548943487-a2e4f4d662af?auto=format&w=500', 'Lẩu bò Mỹ cuộn nấm kim châm', 2),
('Cơm Tấm Sườn Bì', 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&w=500', 'Cơm tấm sườn nướng than hoa', 3),
('Cơm Chiên Hải Sản', 'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&w=500', 'Cơm chiên giòn với tôm và mực', 3),
('Nước Ép Dưa Hấu', 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?auto=format&w=500', 'Nước ép dưa hấu nguyên chất không đường', 4),
('Trà Đào Cam Sả', 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&w=500', 'Trà đào giải nhiệt mùa hè', 4);
/*!40000 ALTER TABLE `monan` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bo_sung_thuc_don` AFTER INSERT ON `monan` FOR EACH ROW BEGIN
    INSERT INTO cungcapthucdon (MaChiNhanh, MaMonAn)
    SELECT MaChiNhanh, NEW.MaMon
    FROM chinhanh;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `monduocgoi`
--

DROP TABLE IF EXISTS `monduocgoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monduocgoi` (
  `MaGoiMon` int NOT NULL AUTO_INCREMENT,
  `MaMonAn` int NOT NULL,
  `MaPhieuGoiMon` int NOT NULL,
  `SoLuong` int DEFAULT '0',
  `DonGiaMon` int NOT NULL DEFAULT '0',
  `TinhTrang` enum('GoiMon','DoiLenMon','DaPhucVu') NOT NULL DEFAULT 'GoiMon',
  PRIMARY KEY (`MaGoiMon`),
  KEY `goimon_ibfk_2_idx` (`MaPhieuGoiMon`),
  KEY `goimon_ibfk_1` (`MaMonAn`),
  CONSTRAINT `goimon_ibfk_1` FOREIGN KEY (`MaMonAn`) REFERENCES `monan` (`MaMon`) ON UPDATE CASCADE,
  CONSTRAINT `goimon_ibfk_2` FOREIGN KEY (`MaPhieuGoiMon`) REFERENCES `phieugoimon` (`MaPhieuGoiMon`) ON UPDATE CASCADE,
  CONSTRAINT `monduocgoi_chk_2` CHECK ((`SoLuong` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monduocgoi`
--

LOCK TABLES `monduocgoi` WRITE;
/*!40000 ALTER TABLE `monduocgoi` DISABLE KEYS */;
INSERT INTO `monduocgoi` VALUES (5,1,1,2,55000,'DaPhucVu'),(6,2,1,1,65000,'DaPhucVu'),(7,3,2,1,75000,'DaPhucVu'),(8,1,3,1,55000,'DaPhucVu'),(9,4,3,2,85000,'DaPhucVu'),(10,5,3,1,45000,'DaPhucVu'),(11,6,4,3,250000,'DaPhucVu'),(12,7,5,1,220000,'DaPhucVu'),(13,8,5,2,200000,'DaPhucVu'),(14,2,6,4,65000,'DaPhucVu'),(15,1,7,2,55000,'DaPhucVu'),(16,3,7,1,75000,'DaPhucVu'),(17,9,8,1,180000,'DaPhucVu'),(18,10,8,2,190000,'DaPhucVu'),(19,5,8,2,45000,'DaPhucVu'),(20,8,9,5,200000,'DaPhucVu'),(21,4,10,4,85000,'DaPhucVu'),(22,7,10,1,220000,'DaPhucVu'),(23,1,11,1,55000,'DoiLenMon'),(24,3,11,1,75000,'GoiMon'),(25,2,12,2,65000,'GoiMon'),(27,3,39,2,75000,'GoiMon'),(28,4,39,2,85000,'GoiMon'),(29,4,40,6,85000,'GoiMon'),(30,8,40,5,200000,'GoiMon'),(31,3,40,1,75000,'GoiMon'),(32,4,42,1,85000,'GoiMon'),(33,3,42,1,75000,'GoiMon'),(101,1,101,2,55000,'DaPhucVu'),(102,6,101,1,250000,'DaPhucVu'),(103,3,102,3,75000,'DaPhucVu'),(104,25,102,5,25000,'DaPhucVu'),(105,4,103,2,85000,'DaPhucVu'),(106,9,103,1,180000,'DaPhucVu'),(107,18,104,1,150000,'DaPhucVu'),(108,22,104,4,15000,'DaPhucVu'),(109,6,201,40,250000,'DaPhucVu'),(110,7,201,20,220000,'DaPhucVu'),(111,17,201,5,120000,'DaPhucVu'),(112,6,202,50,250000,'DaPhucVu'),(113,8,202,30,200000,'DaPhucVu'),(114,18,202,10,150000,'DaPhucVu'),(115,16,202,10,90000,'DaPhucVu'),(116,21,202,20,5000,'DaPhucVu'),(117,6,203,40,250000,'DaPhucVu'),(118,9,203,20,180000,'DaPhucVu'),(119,24,203,10,40000,'DaPhucVu'),(120,6,204,50,250000,'DaPhucVu'),(121,10,204,20,190000,'DaPhucVu'),(122,7,204,10,220000,'DaPhucVu'),(123,6,205,40,250000,'DaPhucVu'),(124,8,205,30,200000,'DaPhucVu'),(125,16,205,10,90000,'DaPhucVu'),(126,21,205,20,5000,'DaPhucVu'),(127,6,206,60,250000,'DaPhucVu'),(128,7,206,30,220000,'DaPhucVu'),(129,17,206,10,120000,'DaPhucVu'),(130,25,206,8,25000,'DaPhucVu');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bo_sung_don_gia` BEFORE INSERT ON `monduocgoi` FOR EACH ROW begin
	declare v_DonGia int;
	select DonGia into v_DonGia
    from MonAn
    where MaMon=new.MaMonAn;
    set new.DonGiaMon=v_DonGia;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `khach_goi_mon` AFTER INSERT ON `monduocgoi` FOR EACH ROW begin 
	declare v_MaPhieuGoiMon int;
    select MaPhieuGoiMon into v_MaPhieuGoiMon
    from MonDuocGoi
    where MaMonAn=new.MaMonAn and TinhTrang='GoiMon'
    limit 1;
    update PhieuGoiMon
    set TinhTrang = 'GoiMon'
    where MaPhieuGoiMon=v_MaPhieuGoiMon;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cap_nhat_tinh_trang_phieu_goi_mon_1` AFTER UPDATE ON `monduocgoi` FOR EACH ROW begin
	if new.TinhTrang='DaPhucVu'
    then 
		if not exists(
			select 1
			from MonDuocGoi
			where MaPhieuGoiMon=new.MaPhieuGoiMon and TinhTrang='ChoLenMon'
        )
        then 
			update PhieuGoiMon
			set TinhTrang='DaPhucVu'
			where MaPhieuGoiMon=new.MaPhieuGoiMon;
        end if;
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `MaChiNhanh` int NOT NULL,
  `MaNhanVien` int NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(30) NOT NULL,
  `SDT` char(11) NOT NULL,
  `DiaChi` varchar(30) NOT NULL,
  `VaiTro` enum('NhanVien','QuanLy') NOT NULL DEFAULT 'NhanVien',
  `CaLam` varchar(100) NOT NULL,
  `Luong` int NOT NULL DEFAULT '1',
  `MatKhau` varchar(225) NOT NULL DEFAULT '$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',
  `TinhTrangLamViec` int NOT NULL DEFAULT '1',
  `AnhThe` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`MaNhanVien`,`MaChiNhanh`),
  KEY `nhanvien_ibfk_1` (`MaChiNhanh`),
  CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`MaChiNhanh`) REFERENCES `chinhanh` (`MaChiNhanh`),
  CONSTRAINT `nhanvien_chk_1` CHECK ((`Luong` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,1,'Nguyễn Văn An','0901111111','Q1, TP.HCM','NhanVien','2026-05-12 08:00:00',8000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,2,'Trần Thị Bình','0901111112','Q3, TP.HCM','NhanVien','2026-05-12 08:00:00',7500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,3,'Lê Hoàng Cường','0901111113','Q4, TP.HCM','NhanVien','2026-05-12 14:00:00',6500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,4,'Phạm Mai Dung','0901111114','Q1, TP.HCM','NhanVien','2026-05-12 14:00:00',7000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,5,'Hoàng Trọng Ân','0901111115','Bình Thạnh, TP.HCM','NhanVien','2026-05-12 08:00:00',12000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,6,'Vũ Đức Duy','0902222221','Q3, TP.HCM','NhanVien','2026-05-12 08:00:00',8500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,7,'Đinh Thu Hà','0902222222','Q10, TP.HCM','NhanVien','2026-05-12 08:00:00',7200000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,8,'Bùi Khắc Huy','0902222223','Tân Bình, TP.HCM','NhanVien','2026-05-12 14:00:00',6800000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,9,'Ngô Thanh Hương','0902222224','Q3, TP.HCM','NhanVien','2026-05-12 14:00:00',7000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,10,'Lý Quốc Bảo','0902222225','Phú Nhuận, TP.HCM','NhanVien','2026-05-12 08:00:00',11500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,11,'Tô Tấn Phá','0903333331','Q10, TP.HCM','NhanVien','2026-05-12 08:00:00',8200000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,''),(3,12,'Hồ Ngọc Mai','0903333332','Q5, TP.HCM','NhanVien','2026-05-12 08:00:00',7500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,13,'Đỗ Văn Toàn','0903333333','Q11, TP.HCM','NhanVien','2026-05-12 14:00:00',6700000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,14,'Trịnh Tố Uyên','0903333334','Q10, TP.HCM','NhanVien','2026-05-12 14:00:00',7100000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,15,'Cao Đăng Khoa','0903333335','Tân Phú, TP.HCM','NhanVien','2026-05-12 08:00:00',11000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,16,'Trần Trọng Quản','0922334455','Quận 1, TP.HCM','QuanLy','2026-05-23 08:00:00',15000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,17,'Lê Thị Điều Hành','0933445566','Quận 10, TP.HCM','QuanLy','2026-05-23 08:00:00',16000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,18,'Phạm Minh Trí','0944556677','Thủ Đức, TP.HCM','QuanLy','2026-05-23 08:00:00',15500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieudatban`
--

DROP TABLE IF EXISTS `phieudatban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieudatban` (
  `MaPhieuDatBan` int NOT NULL AUTO_INCREMENT,
  `MaBanAn` int NOT NULL,
  `NgayGioTaoPhieu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NgayGioNhanBan` datetime NOT NULL,
  `TinhTrang` enum('ChoNhanBan','DaNhanban','HuyDatBan') NOT NULL DEFAULT 'ChoNhanBan',
  `TienCoc` int NOT NULL DEFAULT '0',
  `SDTKhach` char(11) NOT NULL,
  `MaNhanVienPhucVu` int NOT NULL,
  PRIMARY KEY (`MaPhieuDatBan`),
  KEY `phieudatban_ibfk_2` (`SDTKhach`),
  KEY `phieudatban_ibfk_1` (`MaBanAn`),
  KEY `phieudatban_ibfk_3_idx` (`MaNhanVienPhucVu`),
  CONSTRAINT `phieudatban_ibfk_1` FOREIGN KEY (`MaBanAn`) REFERENCES `banan` (`MaBan`),
  CONSTRAINT `phieudatban_ibfk_2` FOREIGN KEY (`SDTKhach`) REFERENCES `khach` (`SDT`),
  CONSTRAINT `phieudatban_ibfk_3` FOREIGN KEY (`MaNhanVienPhucVu`) REFERENCES `nhanvien` (`MaNhanVien`),
  CONSTRAINT `phieudatban_chk_1` CHECK ((`NgayGioNhanBan` >= `NgayGioTaoPhieu`))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieudatban`
--

LOCK TABLES `phieudatban` WRITE;
/*!40000 ALTER TABLE `phieudatban` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieudatban` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `kiem_tra_lich_dat_ban_1` BEFORE INSERT ON `phieudatban` FOR EACH ROW begin 
if exists(
select 1
from PhieuDatban
where MaBanAn=new.MaBanAn and abs(timestampdiff(minute,NgayGioNhanBan,new.NgayGioNhanBan))<180 and (TinhTrang='ChoNhanBan' or TinhTrang='DaNhanBan'))
then
signal sqlstate '45000' set message_text="Trung lich dat ban tuong ung";
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `kiem_tra_lich_dat_ban_2` BEFORE UPDATE ON `phieudatban` FOR EACH ROW begin 
if exists(
select 1
from PhieuDatban
where MaBanAn=new.MaBanAn and abs(timestampdiff(minute,NgayGioNhanBan,new.NgayGioNhanBan))<180 and (TinhTrang='ChoNhanBan' or TinhTrang='DaNhanBan'))
then
signal sqlstate '45000' set message_text="Trung lich dat ban tuong ung";
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `phieugoimon`
--

DROP TABLE IF EXISTS `phieugoimon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieugoimon` (
  `MaPhieuGoiMon` int NOT NULL AUTO_INCREMENT,
  `MaBanAn` int DEFAULT NULL,
  `SDTKhach` char(11) DEFAULT NULL,
  `MaNhanVienPhucVu` int DEFAULT NULL,
  `NgayGioTaoPhieu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DoUuTien` int NOT NULL DEFAULT '0',
  `TinhTrang` enum('GoiMon','ChoLenMon','DaPhucVu','YeuCauThanhToan') NOT NULL DEFAULT 'GoiMon',
  PRIMARY KEY (`MaPhieuGoiMon`),
  KEY `phieugoimon_ibfk_1_idx` (`MaBanAn`),
  KEY `phieugoimon_ibfk_2_idx` (`MaNhanVienPhucVu`),
  KEY `phieugoimon_ibfk_3_idx` (`SDTKhach`),
  CONSTRAINT `phieugoimon_ibfk_1` FOREIGN KEY (`MaBanAn`) REFERENCES `banan` (`MaBan`),
  CONSTRAINT `phieugoimon_ibfk_2` FOREIGN KEY (`MaNhanVienPhucVu`) REFERENCES `nhanvien` (`MaNhanVien`),
  CONSTRAINT `phieugoimon_ibfk_3` FOREIGN KEY (`SDTKhach`) REFERENCES `khach` (`SDT`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieugoimon`
--

LOCK TABLES `phieugoimon` WRITE;
/*!40000 ALTER TABLE `phieugoimon` DISABLE KEYS */;
INSERT INTO `phieugoimon` VALUES (1,1,NULL,1,'2026-05-14 08:30:00',0,'DaPhucVu'),(2,2,'0901234567',2,'2026-05-14 09:15:00',1,'DaPhucVu'),(3,3,NULL,1,'2026-05-14 10:00:00',0,'DaPhucVu'),(4,4,'0912345678',3,'2026-05-14 11:30:00',0,'DaPhucVu'),(5,5,NULL,2,'2026-05-14 12:00:00',0,'DaPhucVu'),(6,1,NULL,1,'2026-05-14 12:45:00',1,'DaPhucVu'),(7,2,'0987654321',3,'2026-05-14 13:10:00',0,'DaPhucVu'),(8,3,NULL,2,'2026-05-14 14:20:00',0,'DaPhucVu'),(9,4,NULL,1,'2026-05-14 15:30:00',0,'DaPhucVu'),(10,5,'0909090909',3,'2026-05-14 18:00:00',1,'DaPhucVu'),(11,1,NULL,2,'2026-05-14 19:30:00',0,'GoiMon'),(12,2,'0911223344',1,'2026-05-14 19:45:00',0,'GoiMon'),(39,NULL,'0901234567',NULL,'2026-05-27 00:41:09',0,'GoiMon'),(40,NULL,'0901234560',NULL,'2026-05-27 01:01:26',0,'GoiMon'),(42,NULL,'12345678910',NULL,'2026-05-28 16:02:21',0,'YeuCauThanhToan'),(101,7,'0901234567',6,'2026-05-15 11:30:00',0,'DaPhucVu'),(102,8,'0909090909',7,'2026-05-16 12:00:00',0,'DaPhucVu'),(103,14,'0987654321',11,'2026-05-17 11:45:00',0,'DaPhucVu'),(104,15,NULL,12,'2026-05-18 12:30:00',0,'DaPhucVu'),(201,1,NULL,1,'2026-05-15 18:00:00',0,'DaPhucVu'),(202,2,NULL,2,'2026-05-20 19:00:00',0,'DaPhucVu'),(203,9,NULL,6,'2026-05-16 18:30:00',0,'DaPhucVu'),(204,10,NULL,7,'2026-05-21 19:30:00',0,'DaPhucVu'),(205,16,NULL,11,'2026-05-17 18:00:00',0,'DaPhucVu'),(206,17,NULL,12,'2026-05-22 20:00:00',0,'DaPhucVu');
/*!40000 ALTER TABLE `phieugoimon` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `kiem_tra_thong_tin_phieu_goi_mon` BEFORE INSERT ON `phieugoimon` FOR EACH ROW begin
	if new.MaBanAn is null and new.SDTKhach is null
    then 
    signal sqlstate '45000' set message_text ="ma ban an hoac sdt khach phai duoc dien";
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cap_nhat_trang_thai_ban_1` AFTER INSERT ON `phieugoimon` FOR EACH ROW begin
if new.MaBanAn is not null and current_timestamp()=new.NgayGioTaoPhieu
then
	update BanAn
    set TinhTrangSuDung="DangSuDung"
    where MaBan=new.MaBanAn;
end if;
end */;;
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
  `MaNhapKho` int NOT NULL AUTO_INCREMENT,
  `MaNhanVienKiemToan` int NOT NULL,
  `NgayGioTaoPhieu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GiaTri` int NOT NULL,
  `ThongTinGhiChu` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MaNhapKho`),
  KEY `phieunhapkho_ibfk_1_idx` (`MaNhanVienKiemToan`),
  CONSTRAINT `phieunhapkho_ibfk_1` FOREIGN KEY (`MaNhanVienKiemToan`) REFERENCES `nhanvien` (`MaNhanVien`),
  CONSTRAINT `phieunhapkho_chk_1` CHECK ((`GiaTri` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieunhapkho`
--

LOCK TABLES `phieunhapkho` WRITE;
/*!40000 ALTER TABLE `phieunhapkho` DISABLE KEYS */;
INSERT INTO `phieunhapkho` VALUES (101,16,'2026-05-15 07:00:00',12000000,'Nhập rau củ quả CN1'),(102,16,'2026-05-20 07:00:00',18000000,'Nhập hải sản CN1'),(103,17,'2026-05-16 07:30:00',11500000,'Nhập thịt bò, heo CN2'),(104,17,'2026-05-21 07:30:00',16000000,'Nhập hải sản CN2'),(105,18,'2026-05-17 08:00:00',13000000,'Nhập rau củ quả CN3'),(106,18,'2026-05-22 08:00:00',19000000,'Nhập hải sản tươi CN3');
/*!40000 ALTER TABLE `phieunhapkho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quanly`
--

DROP TABLE IF EXISTS `quanly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quanly` (
  `MaNguoiQuanLy` int NOT NULL AUTO_INCREMENT,
  `MaSoThue` char(12) NOT NULL,
  PRIMARY KEY (`MaNguoiQuanLy`),
  CONSTRAINT `quanly_ibfk_1` FOREIGN KEY (`MaNguoiQuanLy`) REFERENCES `nhanvien` (`MaNhanVien`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quanly`
--

LOCK TABLES `quanly` WRITE;
/*!40000 ALTER TABLE `quanly` DISABLE KEYS */;
INSERT INTO `quanly` VALUES (16,'0312345678'),(17,'0312345679'),(18,'0312345680');
/*!40000 ALTER TABLE `quanly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theloaimon`
--

DROP TABLE IF EXISTS `theloaimon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theloaimon` (
  `MaTheLoai` int NOT NULL AUTO_INCREMENT,
  `TenTheLoai` varchar(30) DEFAULT NULL,
  `ThongTinMota` varchar(30) DEFAULT NULL,
  `CoSan` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`MaTheLoai`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theloaimon`
--

LOCK TABLES `theloaimon` WRITE;
/*!40000 ALTER TABLE `theloaimon` DISABLE KEYS */;
INSERT INTO `theloaimon` VALUES (1,'Món Mặn','Các món ăn chính với cơm',1),(2,'Món Lẩu','Lẩu các loại cho nhiều người',1),(3,'Cơm','Cơm chiên và cơm truyền thống',1),(4,'Món Nướng','Hải sản và thịt nướng tẩm ướp',1),(5,'Thức Uống','Nước giải khát và bia',1);
/*!40000 ALTER TABLE `theloaimon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tongkethoadon`
--

DROP TABLE IF EXISTS `tongkethoadon`;
/*!50001 DROP VIEW IF EXISTS `tongkethoadon`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tongkethoadon` AS SELECT 
 1 AS `MaChiNhanh`,
 1 AS `MaHoaDon`,
 1 AS `NgayGioTaoHoaDon`,
 1 AS `MaPhieuGoiMon`,
 1 AS `GiaTri`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tongketkinhphi`
--

DROP TABLE IF EXISTS `tongketkinhphi`;
/*!50001 DROP VIEW IF EXISTS `tongketkinhphi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tongketkinhphi` AS SELECT 
 1 AS `MaChiNhanh`,
 1 AS `MaNhapKho`,
 1 AS `NgayGioTaoPhieu`,
 1 AS `GiaTri`,
 1 AS `MaNhanVien`,
 1 AS `HoTenNhanVien`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'dath_hethongthongtin'
--

--
-- Dumping routines for database 'dath_hethongthongtin'
--
/*!50003 DROP FUNCTION IF EXISTS `gia_tri_phieu_goi_mon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `gia_tri_phieu_goi_mon`(f_MaPhieuGoiMon int) RETURNS decimal(18,2)
    DETERMINISTIC
BEGIN
    DECLARE v_Tong DECIMAL(18,2);
    SELECT SUM(SoLuong * DonGiaMon) INTO v_Tong
    FROM MonDuocGoi  
    WHERE MaPhieuGoiMon = f_MaPhieuGoiMon;
    RETURN IFNULL(v_Tong, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `khach_dat_mon_mang_ve` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `khach_dat_mon_mang_ve`(
in p_SDTKhach char(11),
in p_MaMonAn int,
in p_SoLuong int
)
begin
	declare v_MaPhieuGoiMon int;
    declare v_MaGoiMon int;
    
	select P.MaPhieuGoiMon into v_MaPhieuGoiMon
	from PhieuGoiMon P LEFT JOIN HoaDon HD on P.MaPhieuGoiMon=HD.MaPhieuGoiMon
	where P.SDTKhach=p_SDTKhach  and HD.MaHoaDon is Null and P.MaPhieuGoiMon is not Null
    limit 1;
    
	if v_MaPhieuGoiMon is null
    then 
		INSERT INTO phieugoimon (MaBanAn, SDTKhach)
		VALUES (null, p_SDTKhach);
        set v_MaPhieuGoiMon=last_insert_id();
	end if;
    
	select MaGoiMon into v_MaGoiMon
	from MonDuocGoi
	where MaMonAn=p_MaMonAn and MaPhieuGoiMon=v_MaPhieuGoiMon and TinhTrang ='GoiMon'
    limit 1;
    if v_MaGoiMon is not null
	then
		update MonDuocGoi
		set SoLuong=Soluong+p_SoLuong
		where MaGoiMon=v_MaGoiMon;
	else 
		insert into MonDuocGoi (MaPhieuGoiMon,MaMonAn,SoLuong,TinhTrang)
		values (v_MaPhieuGoiMon,p_MaMonAn,p_SoLuong,'GoiMon');
	end if; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `khach_goi_mon_tai_quan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `khach_goi_mon_tai_quan`(
in p_MaBanAn int,
in p_MaMonAn int,
in p_SoLuong int,
in p_SDTKhach char(11)
)
begin
	declare p_MaPhieuGoiMon int;
    declare p_MaGoiMon int;
    
	select P.MaPhieuGoiMon into p_MaPhieuGoiMon
	from PhieuGoiMon P LEFT JOIN HoaDon HD on P.MaPhieuGoiMon=HD.MaPhieuGoiMon
	where P.MaBanAn=p_MaBanAn  and HD.MaHoaDon is Null
    limit 1;
    
	if p_MaPhieuGoiMon is null
    then 
		INSERT INTO phieugoimon (MaBanAn, SDTKhach)
		VALUES (p_MaBanAn, p_SDTKhach);
        set p_MaPhieuGoiMon=last_insert_id();
	end if;
    
	select MaGoiMon into p_MaGoiMon
	from MonDuocGoi
	where MaMonAn=p_MaMonAn and MaPhieuGoiMon=p_MaPhieuGoiMon and TinhTrang ='GoiMon'
    limit 1;
    if p_MaGoiMon is not null
	then
		if p_SoLuong>0 
        then
			update MonDuocGoi
			set SoLuong=Soluong+p_SoLuong
			where MaGoiMon=p_MaGoiMon;
		else
			delete from MonDuocGoi
            where MaGoiMon=p_MaGoiMon;
		end if;
	else 
		insert into MonDuocGoi (MaPhieuGoiMon,MaMonAn,SoLuong,TinhTrang)
		values (p_MaPhieuGoiMon,p_MaMonAn,p_SoLuong,'GoiMon');
	end if; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nhan_vien_dat_mon_truoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nhan_vien_dat_mon_truoc`(
in p_MaPhieuDatBan int,
in p_MaMonAn int,
in p_SoLuong int,
in p_MaNV int
)
begin
	declare v_MaPhieuGoiMon int;
	declare v_MaBanAn int;
    declare v_NgayGioNhanBan datetime;
    declare v_SDTKhach char(11);
    declare v_MaGoiMon int;
    START TRANSACTION;

	select P.MaPhieuGoiMon into v_MaPhieuGoiMon
	from GoiMonTruoc
	where P.MaPhieuDatBan=p_MaPhieuDatBan
    limit 1;
    
	if v_MaPhieuGoiMon is null
    then
        select MaBanAn, NgayGioNhanBan,SDTKhach into v_MaBanAn,v_NgayGioNhanBan,v_SDTKhach
		from PhieuDatBan
		where MaPhieuDatban=p_MaPhieuDatBan;
        
		INSERT INTO phieugoimon (MaBanAn, NgayGioTaoPhieu, SDTKhach,MaNhanVienPhucVu)
		VALUES (v_MaBanAn, v_NgayGioNhanBan, v_SDTKhach,p_MaNV);
		set v_MaPhieuGoiMon=last_insert_id();
        INSERT INTO dattruocmon (MaPhieuDatBan, MaPhieuGoiMon) 
		VALUES (p_MaPhieuDatBan, v_MaPhieuGoiMon);
	end if;
    
	select MaGoiMon into v_MaGoiMon
	from MonDuocGoi
	where MaMonAn=p_MaMonAn and MaPhieuGoiMon=v_MaPhieuGoiMon and TinhTrang ='ChoLenMon'
    limit 1;
    if v_MaGoiMon is not null
	then
		if p_SoLuong>0 
        then
			update MonDuocGoi
			set SoLuong=Soluong+p_SoLuong
			where MaGoiMon=p_MaGoiMon;
		else
			delete from MonDuocGoi
            where MaGoiMon=p_MaGoiMon;
		end if;
	else 
		insert into MonDuocGoi (MaPhieuGoiMon,MaMonAn,SoLuong,TinhTrang)
		values (v_MaPhieuGoiMon,p_MaMonAn,p_SoLuong,'ChoLenMon');
	end if; 
	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nhan_vien_goi_mon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nhan_vien_goi_mon`(
in p_MaBanAn int,
in p_MaMonAn int,
in p_SoLuong int,
in p_SDTKhach char(11),
in p_MaNV int
)
begin
	declare p_MaPhieuGoiMon int;
    declare p_MaGoiMon int;
    
	select P.MaPhieuGoiMon into p_MaPhieuGoiMon
	from PhieuGoiMon P LEFT JOIN HoaDon HD on P.MaPhieuGoiMon=HD.MaPhieuGoiMon
	where P.MaBanAn=p_MaBanAn  and HD.MaHoaDon is Null
    limit 1;
    
	if p_MaPhieuGoiMon is null
    then
		INSERT INTO phieugoimon (MaBanAn, SDTKhach,MaNhanVienPhucVu)
		VALUES (p_MaBanAn, p_SDTKhach,p_MaNV);
		set p_MaPhieuGoiMon=last_insert_id();
	end if;
    
	select MaGoiMon into p_MaGoiMon
	from MonDuocGoi
	where MaMonAn=p_MaMonAn and MaPhieuGoiMon=p_MaPhieuGoiMon and TinhTrang ='ChoLenMon'
    limit 1;
    if p_MaGoiMon is not null
	then
		if p_SoLuong>0 
        then
			update MonDuocGoi
			set SoLuong=Soluong+p_SoLuong
			where MaGoiMon=p_MaGoiMon;
		else
			delete from MonDuocGoi
            where MaGoiMon=p_MaGoiMon;
		end if;
	else 
		insert into MonDuocGoi (MaPhieuGoiMon,MaMonAn,SoLuong,TinhTrang)
		values (p_MaPhieuGoiMon,p_MaMonAn,p_SoLuong,'ChoLenMon');
	end if; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nhan_vien_xac_nhan_yeu_cau_goi_mon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nhan_vien_xac_nhan_yeu_cau_goi_mon`(in p_MaPhieuGoiMon int)
begin 
	update MonDuocGoi
    set TinhTrang='ChoLenMon'
    where MaPhieuGoiMon=p_MaPhieuGoiMon and TinhTrang='GoiMon';
    update PhieuGoiMon
    set TinhTrang = 'ChoLenMon'
    where MaPhieuGoiMon=v_MaPhieuGoiMon;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tao_phieu_dat_ban` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tao_phieu_dat_ban`(
in p_MaBanAn int,
in p_NgayGioNhanBan datetime,
in p_SDTKhach char(11),
in p_MaNV int
)
begin 
	INSERT INTO phieudatban (MaBanAn, NgayGioNhanBan, SDTKhach, MaNhanVienPhucVu)
    VALUES (p_MaBanAn, p_NgayGioNhanBan, p_SDTKhach, p_MaNV);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `thanh_toan_phieu_goi_mon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `thanh_toan_phieu_goi_mon`(
    IN p_MaPhieuGoiMon int,
    IN p_PTThanhToan NVARCHAR(30),
    IN p_MaNV int
)
BEGIN
    INSERT INTO HoaDon (MaPhieuGoiMon, MaNhanVien, GiaTri, PhuongThucThanhToan)
    VALUES (p_MaPhieuGoiMon, p_MaNV, p_GiaTriHoaDon, p_PTThanhToan);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `them_ban_an` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `them_ban_an`(
in p_MaChiNhanh int,
in p_SoLuongChoNgoi int,
in p_ViTri varchar(30)
)
begin 
	insert into banan(MachiNhanh,SoLuongCHoNgoi,ViTri)
    values(p_MaChiNhanh,p_SoLuongChoNgoi,p_ViTri);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `them_chi_nhanh` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `them_chi_nhanh`(
in p_DiaChi varchar(30),
in p_SDT char(11),
in p_Email varchar(30),
in p_GioMoCua datetime
)
begin 
	insert into ChiNhanh(Diachi,SDT,Email,GioMoCua)
    values(p_DiaChi,p_SDT,p_Email,p_GioMoCua);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `them_mon_moi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `them_mon_moi`(
in p_TenMon varchar(30),
in p_DonGia int,
in p_ThongTinMoTa varchar(100),
in p_HinhAnh varchar(225),
in p_MaTheLoai int,
in p_MaChiNhanh int
)
begin 
	declare v_MaMon int;
	insert into MonAn(TenMon,MaTheLoai,ThongTinMoTa,HinhAnh) 
    value(p_TenMon,p_MaTheLoai,p_ThongTinMoTa,p_HinhAnh);
    set v_MaMon=last_insert_id();
	update CungCapThucDon
    set DonGia =p_DonGia , CoSan=1
    where MaChiNhanh=p_MaChiNhanh and MaMonAn= v_MaMon;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `them_the_loai_mon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `them_the_loai_mon`(
in p_TenTheLoai varchar(30),
in p_ThongTinMoTa varchar(30)
)
begin
	insert into TheLoaiMon(TenTheLoai,ThongTinMota)
    values(p_TenTheLoai,p_ThongTinMoTa);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `thong_ke_doanh_so` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `thong_ke_doanh_so`(
in p_MaChiNhanh int,
in p_ThoiGianBatDau datetime,
in p_ThoiGianKetThuc datetime,
in p_DoanhSoToiThieu int,
in p_DoanhSoToiDa int,
in p_PhamVi enum('Ngay','Thang','Nam'),
in p_UuTien enum('ChiNhanh','ThoiGian')
)
begin 
	select HD.MaChiNhanh, 
	CASE 
		WHEN p_UuTien = 'ChiNhanh' THEN NULL
        ELSE 
			case p_PhamVi
				WHEN 'Nam' THEN DATE_FORMAT(HD.NgayGioTaoHoaDon, '%Y')     
				WHEN 'Thang' THEN DATE_FORMAT(HD.NgayGioTaoHoaDon, '%m-%Y')  
				ELSE DATE_FORMAT(HD.NgayGioTaoHoaDon, '%d-%m-%Y')
			end
	END as ThoiGian,
    sum(HD.GiaTri) as DoanhSo
    from TongKetHoaDon HD 
    where (p_MaChiNhanh is null or p_MaChiNhanh=HD.MaChiNhanh)
    and (p_ThoiGianBatDau is NULL or HD.NgayGioTaoHoaDon >= p_ThoiGianBatDau) 
    and ( p_ThoiGianKetThuc is null or HD.NgayGioTaoHoaDon<=p_ThoiGianKetThuc)
    group by  
		HD.MaChiNhanh,
		NgayGioTaoHoaDon
    having (p_DoanhSoToiThieu is null or DoanhSo>=p_DoanhSoToiThieu) and ( p_DoanhSoToiDa is null or DoanhSo<=p_DoanhSoToiDa)
	ORDER BY 
        CASE WHEN p_UuTien = 'ChiNhanh' THEN HD.MaChiNhanh ELSE HD.NgayGioTaoHoaDon END ASC,
        CASE WHEN p_UuTien = 'ChiNhanh' THEN HD.NgayGioTaoHoaDon ELSE HD.MaChiNhanh END ASC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `thong_ke_kinh_phi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `thong_ke_kinh_phi`(
in p_MaChiNhanh int,
in p_ThoiDiemBatDau datetime,
in p_ThoiDiemKetThuc datetime,
in p_PhamVi enum ('Ngay','Thang','Nam'),
in p_UuTien enum('ChiNhanh','ThoiGian')
)
begin
	select KP.MaChiNhanh,
	CASE 
			WHEN p_UuTien = 'ChiNhanh' THEN NULL 
            ELSE 
				case p_PhamVi
					WHEN 'Nam' THEN DATE_FORMAT(KP.NgayGioTaoPhieu, '%Y')     
					WHEN 'Thang' THEN DATE_FORMAT(KP.NgayGioTaoPhieu, '%m-%Y')  
					ELSE DATE_FORMAT(KP.NgayGioTaoPhieu, '%d-%m-%Y')
				end
        END as ThoiGian,
		sum(KP.GiaTri) as TongKinhPhi
    from TongKetKinhPhi KP
    where (p_MaChiNhanh is null or KP.MaChiNhanh = p_MachiNhanh)
    and (p_ThoiDiemBatDau is null or KP.NgayGioTaoPhieu >=p_ThoiDiemBatDau)
    and (p_ThoiDiemKetThuc is null or KP.NgayGioTaoPhieu<=p_ThoiDiemKetThuc)
    group by 
		KP.MaChiNhanh,
		NgayGioTaoPhieu
    order by
		case when p_UuTien='ChiNhanh' then KP.MaChiNhanh else KP.NgayGioTaoPhieu end asc,
        case when p_UuTien='ChiNhanh' then KP.NgayGioTaoPhieu else KP.MaChiNhanh end asc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `thong_ke_mon_an` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `thong_ke_mon_an`(
	in p_MaChiNhanh int,
	in p_ThoiGianBatDau datetime,
	in p_ThoiGianKetThuc datetime,
	in p_PhamVi enum('Ngay','Thang','Nam'),
	in p_GioiHan int,
	in p_UuTien enum('ChiNhanh','ThoiGian')
	)
begin
		select HD.MaChiNhanh,
        CASE 
			WHEN p_UuTien = 'ChiNhanh' THEN NULL 
            ELSE 
				case p_PhamVi
					WHEN 'Nam' THEN DATE_FORMAT(HD.NgayGioTaoHoaDon, '%Y')     
					WHEN 'Thang' THEN DATE_FORMAT(HD.NgayGioTaoHoaDon, '%m-%Y')  
					ELSE DATE_FORMAT(HD.NgayGioTaoHoaDon, '%d-%m-%Y')
				end
        END as ThoiGian,
		MA.TenMon, 
        sum(MDG.SoLuong) as DoanhSoBanRa
		from TongKetHoaDon HD
		join MonDuocGoi MDG on HD.MaPhieuGoiMon =MDG.MaPhieuGoiMon
		join MonAn MA on MDG.MaMonAn = MA.MaMon
		where (p_MaChiNhanh is NULL or p_MachiNhanh=HD.MaChiNhanh)
		and (p_ThoiGianBatDau is NULL or HD.NgayGioTaoHoaDon >= p_ThoiGianBatDau) 
		and ( p_ThoiGianKetThuc is null or HD.NgayGioTaoHoaDon<=p_ThoiGianKetThuc)
		group by  HD.MaChiNhanh,ThoiGian, MA.TenMon
		order by 
        DoanhSoBanRa desc,
			CASE WHEN p_UuTien = 'ChiNhanh' THEN HD.MaChiNhanh ELSE ThoiGian END ASC,
			CASE WHEN p_UuTien = 'ChiNhanh' THEN ThoiGian ELSE HD.MaChiNhanh END ASC
			
		limit p_GioiHan;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `truy_xuat_ds_nv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `truy_xuat_ds_nv`( in p_MaChiNhanh int, in p_MaNhanVien int)
begin
	select MaChiNhanh,MaNhanVien,HoTen,SDT,DiaChi,VaiTro,CaLam,Luong,AnhThe,TinhTrangLamViec
    from DSNhanVien
    where (p_MaChiNhanh is null or MaChiNhanh=p_MaChiNhanh) and (p_MaNhanVien is null or MaNhanVien =p_MaNhanVien);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `truy_xuat_phieu_goi_mon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `truy_xuat_phieu_goi_mon`(
in p_MaBanAn int, 
in p_TinhTrang enum("GoiMon","DoiLenMon","DaPhucVu"),
in p_ThanhToan bool
)
begin
	select *
    from ChiTietPhieuGoiMon
    where (p_MaBanAn is null or MaBanAn=p_MaBanAn) 
    and (p_TinhTrang is null or TinhTrangPhieuGoiMon =p_TinhTrang )
    and (p_ThanhToan is null or ThanhToan=p_ThanhToan);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `chitietphieugoimon`
--

/*!50001 DROP VIEW IF EXISTS `chitietphieugoimon`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `chitietphieugoimon` AS select `ba`.`MaChiNhanh` AS `MaChiNhanh`,`ba`.`MaBan` AS `MaBanAn`,`p`.`MaPhieuGoiMon` AS `MaPhieuGoiMon`,`p`.`TinhTrang` AS `TinhTrangPhieuGoiMon`,`ma`.`MaMon` AS `MaMon`,`ma`.`TenMon` AS `TenMon`,`mdg`.`SoLuong` AS `SoLuong`,`mdg`.`DonGiaMon` AS `DonGiaMon`,(`mdg`.`SoLuong` * `mdg`.`DonGiaMon`) AS `ThanhTien`,`mdg`.`TinhTrang` AS `TinhTrangMon`,(case when (`hd`.`MaHoaDon` is null) then false else true end) AS `ThanhToan` from ((((`monan` `ma` join `monduocgoi` `mdg` on((`ma`.`MaMon` = `mdg`.`MaMonAn`))) join `phieugoimon` `p` on((`mdg`.`MaPhieuGoiMon` = `p`.`MaPhieuGoiMon`))) left join `banan` `ba` on((`p`.`MaBanAn` = `ba`.`MaBan`))) left join `hoadon` `hd` on((`p`.`MaPhieuGoiMon` = `hd`.`MaPhieuGoiMon`))) order by `ba`.`MaChiNhanh`,`ba`.`MaBan` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dsbanan`
--

/*!50001 DROP VIEW IF EXISTS `dsbanan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dsbanan` AS select `cn`.`MaChiNhanh` AS `MaChiNhanh`,`ba`.`MaBan` AS `MaBan`,`ba`.`SoLuongChoNgoi` AS `SoLuongChoNgoi`,`ba`.`ViTri` AS `ViTri`,`ba`.`TinhTrangSuDung` AS `TinhTrangSuDung`,`ba`.`CoSan` AS `CoSan` from (`chinhanh` `cn` join `banan` `ba` on((`cn`.`MaChiNhanh` = `ba`.`MaChiNhanh`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dsmonan`
--

/*!50001 DROP VIEW IF EXISTS `dsmonan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dsmonan` AS select `td`.`MaChiNhanh` AS `MaChiNhanh`,`ma`.`MaMon` AS `MaMonAn`,`ma`.`TenMon` AS `TenMon`,`td`.`DonGia` AS `DonGia`,`ma`.`HinhAnh` AS `HinhAnh`,`ma`.`ThongTinMoTa` AS `ThongTinMon`,`tl`.`MaTheLoai` AS `MaTheLoai`,`tl`.`TenTheLoai` AS `TenTheLoai`,`tl`.`ThongTinMota` AS `ThongTinTheLoai`,`td`.`CoSan` AS `CoSan` from ((`monan` `ma` left join `cungcapthucdon` `td` on((`td`.`MaMonAn` = `ma`.`MaMon`))) left join `theloaimon` `tl` on((`ma`.`MaTheLoai` = `tl`.`MaTheLoai`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dsnhanvien`
--

/*!50001 DROP VIEW IF EXISTS `dsnhanvien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dsnhanvien` AS select `cn`.`MaChiNhanh` AS `MaChiNhanh`,`nv`.`MaNhanVien` AS `MaNhanVien`,`nv`.`AnhThe` AS `AnhThe`,`nv`.`HoTen` AS `HoTen`,`nv`.`VaiTro` AS `VaiTro`,`nv`.`SDT` AS `SDT`,`nv`.`DiaChi` AS `DiaChi`,`nv`.`CaLam` AS `CaLam`,`nv`.`Luong` AS `Luong`,`nv`.`TinhTrangLamViec` AS `TinhTrangLamViec` from (`nhanvien` `nv` join `chinhanh` `cn` on((`nv`.`MaChiNhanh` = `cn`.`MaChiNhanh`))) order by `cn`.`MaChiNhanh` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tongkethoadon`
--

/*!50001 DROP VIEW IF EXISTS `tongkethoadon`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tongkethoadon` AS select `cn`.`MaChiNhanh` AS `MaChiNhanh`,`hd`.`MaHoaDon` AS `MaHoaDon`,`hd`.`NgayGioTaoHoaDon` AS `NgayGioTaoHoaDon`,`p`.`MaPhieuGoiMon` AS `MaPhieuGoiMon`,`hd`.`GiaTri` AS `GiaTri` from (((`hoadon` `hd` join `phieugoimon` `p` on((`hd`.`MaPhieuGoiMon` = `p`.`MaPhieuGoiMon`))) join `banan` `ba` on((`p`.`MaBanAn` = `ba`.`MaBan`))) join `chinhanh` `cn` on((`ba`.`MaChiNhanh` = `cn`.`MaChiNhanh`))) order by `cn`.`MaChiNhanh`,`hd`.`NgayGioTaoHoaDon` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tongketkinhphi`
--

/*!50001 DROP VIEW IF EXISTS `tongketkinhphi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tongketkinhphi` AS select `cn`.`MaChiNhanh` AS `MaChiNhanh`,`p`.`MaNhapKho` AS `MaNhapKho`,`p`.`NgayGioTaoPhieu` AS `NgayGioTaoPhieu`,`p`.`GiaTri` AS `GiaTri`,`nv`.`MaNhanVien` AS `MaNhanVien`,`nv`.`HoTen` AS `HoTenNhanVien` from ((`phieunhapkho` `p` join `nhanvien` `nv` on((`p`.`MaNhanVienKiemToan` = `nv`.`MaNhanVien`))) join `chinhanh` `cn` on((`nv`.`MaChiNhanh` = `cn`.`MaChiNhanh`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-31 15:53:39
