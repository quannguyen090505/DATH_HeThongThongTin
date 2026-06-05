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
INSERT INTO `banan` VALUES (1,1,'DaThanhToan','Tang 1',4,1),(2,1,'DaThanhToan','Tang 1',4,1),(3,1,'DaThanhToan','Tang 1',4,1),(4,1,'DaThanhToan','Tang 1',4,1),(5,1,'DaThanhToan','Tang 1',4,1),(6,1,'DaThanhToan','Tang 1',4,1),(7,2,'DaThanhToan','Tang 1',4,1),(8,2,'DaThanhToan','Tang 1',4,1),(9,2,'DaThanhToan','Tang 1',4,1),(10,2,'DaThanhToan','Tang 1',4,1),(11,2,'DaThanhToan','Tang 1',4,1),(12,2,'DaThanhToan','Tang 1',4,1),(13,2,'BanTrong','Tang 1',4,1),(14,3,'DaThanhToan','Tang 1',4,1),(15,3,'DaThanhToan','Tang 1',4,1),(16,3,'DaThanhToan','Tang 1',4,1),(17,3,'DaThanhToan','Tang 1',4,1),(18,3,'DaThanhToan','Tang 1',4,1),(19,3,'BanTrong','Tang 2',4,1),(20,3,'BanTrong','Tang 2',4,1),(21,3,'BanTrong','Tang 2',4,1),(22,3,'BanTrong','Tang 2',4,1),(23,3,'BanTrong','Tang 2',4,1),(24,3,'BanTrong','Tang 1',4,1);
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
INSERT INTO `cungcapthucdon` VALUES (1,1,85000,1),(1,2,90000,1),(1,3,95000,1),(1,4,100000,1),(1,5,105000,1),(1,6,110000,1),(1,7,115000,1),(1,8,120000,1),(1,9,125000,1),(1,10,130000,1),(1,11,135000,1),(1,12,140000,1),(1,13,145000,1),(1,14,150000,1),(1,15,155000,1),(1,16,160000,1),(1,17,165000,1),(1,18,170000,1),(1,19,175000,1),(1,20,180000,1),(2,1,95000,1),(2,2,100000,1),(2,3,105000,1),(2,4,110000,1),(2,5,115000,1),(2,6,120000,1),(2,7,125000,1),(2,8,130000,1),(2,9,135000,1),(2,10,140000,1),(2,11,145000,1),(2,12,150000,1),(2,13,155000,1),(2,14,160000,1),(2,15,165000,1),(2,16,170000,1),(2,17,175000,1),(2,18,180000,1),(2,19,185000,1),(2,20,190000,1),(2,21,195000,1),(2,22,200000,1),(2,23,205000,1),(2,24,210000,1),(2,25,215000,1),(3,1,90000,1),(3,2,95000,1),(3,3,100000,1),(3,4,105000,1),(3,5,110000,1),(3,6,115000,1),(3,7,120000,1),(3,8,125000,1),(3,9,130000,1),(3,10,135000,1),(3,11,140000,1),(3,12,145000,1),(3,13,150000,1),(3,14,155000,1),(3,15,160000,1),(3,16,165000,1),(3,17,170000,1),(3,18,175000,1),(3,19,180000,1),(3,20,185000,1),(3,21,190000,1),(3,22,195000,1),(3,23,200000,1),(3,24,205000,1),(3,25,210000,1),(3,26,215000,1),(3,27,220000,1),(3,28,225000,1),(3,29,230000,1),(3,30,235000,1);
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
INSERT INTO `dattruocmon` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
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
    set v_GiaTriHoaDon = gia_tri_phieu_goi_mon(new.MaPhieuGoiMon);
    update phieudatban 
    set TienCoc=v_GiaTriHoaDon*0.3
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (1,1,'2026-05-01 20:30:00',1,345000,'TienMat'),(2,2,'2026-05-05 21:15:00',2,1025000,'ChuyenKhoan'),(3,3,'2026-05-10 19:45:00',6,500000,'TheTinDung'),(4,4,'2026-05-15 21:00:00',7,580000,'TienMat'),(5,5,'2026-05-20 21:30:00',11,900000,'ChuyenKhoan'),(6,6,'2026-05-02 13:45:00',1,280000,'TienMat'),(7,7,'2026-05-03 19:20:00',2,240000,'ChuyenKhoan'),(8,8,'2026-05-04 20:30:00',3,1875000,'TheTinDung'),(9,9,'2026-05-06 21:15:00',4,100000,'TienMat'),(10,10,'2026-05-07 12:30:00',6,975000,'ChuyenKhoan'),(11,11,'2026-05-08 14:10:00',7,170000,'TienMat'),(12,12,'2026-05-09 20:20:00',8,400000,'ChuyenKhoan'),(13,13,'2026-05-11 21:45:00',9,140000,'TheTinDung'),(14,14,'2026-05-12 19:50:00',11,940000,'ChuyenKhoan'),(15,15,'2026-05-13 20:30:00',12,110000,'TienMat'),(16,16,'2026-05-14 22:15:00',13,135000,'ChuyenKhoan'),(17,17,'2026-05-16 12:45:00',14,1230000,'TheTinDung'),(18,18,'2026-05-17 14:00:00',1,345000,'TienMat'),(19,19,'2026-05-18 19:30:00',2,115000,'ChuyenKhoan'),(20,20,'2026-05-19 21:10:00',6,1690000,'TheTinDung'),(21,21,'2026-05-21 21:40:00',7,100000,'TienMat'),(22,22,'2026-05-22 19:20:00',11,465000,'ChuyenKhoan'),(23,23,'2026-05-23 21:00:00',12,285000,'TheTinDung'),(24,24,'2026-05-24 13:15:00',1,240000,'TienMat'),(25,25,'2026-05-25 20:00:00',6,825000,'ChuyenKhoan'),(26,26,'2026-05-26 20:20:00',11,565000,'TheTinDung'),(27,27,'2026-05-27 21:30:00',2,250000,'TienMat'),(28,31,'2026-05-02 10:15:00',1,165000,'TienMat'),(29,32,'2026-05-04 11:45:00',2,405000,'ChuyenKhoan'),(30,33,'2026-05-07 14:20:00',6,145000,'TienMat'),(31,34,'2026-05-09 16:40:00',7,1420000,'TheTinDung'),(32,35,'2026-05-11 18:30:00',11,180000,'ChuyenKhoan'),(33,1001,'2026-05-02 20:00:00',1,15150000,'ChuyenKhoan'),(34,1002,'2026-05-10 20:30:00',2,18090000,'TheTinDung'),(35,1003,'2026-05-20 21:00:00',3,12000000,'ChuyenKhoan'),(36,1004,'2026-05-28 21:30:00',4,22060000,'TienMat'),(37,2001,'2026-05-05 20:00:00',6,25300000,'TheTinDung'),(38,2002,'2026-05-15 20:30:00',7,17020000,'ChuyenKhoan'),(39,2003,'2026-05-25 21:00:00',8,18990000,'TienMat'),(40,3001,'2026-05-03 20:00:00',11,13960000,'ChuyenKhoan'),(41,3002,'2026-05-12 20:30:00',12,28020000,'TheTinDung'),(42,3003,'2026-05-22 21:00:00',13,15970000,'ChuyenKhoan');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tich_diem_cho_khach` AFTER INSERT ON `hoadon` FOR EACH ROW begin
	declare t_SDTKhach varchar(11);
    select SDTKhach into t_SDTKhach
    from phieugoimon
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
	update banan
    set TinhTrangSuDung="DaThanhToan"
    where MaBan=(
	select MaBanAn
    from phieugoimon
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
INSERT INTO `khach` VALUES ('0901234560','temp',0,NULL),('0901234567','Nguyễn Hoàng Nam',1500,'$2b$12$ZIbljZ0ECeKx9xuQLdnqNuBtyc/IKJ9UfddaEXXmdt8iecd/Dv3eW'),('0909090909','Trần Thị Hồng',3055,'$2b$12$ZIbljZ0ECeKx9xuQLdnqNuBtyc/IKJ9UfddaEXXmdt8iecd/Dv3eW'),('0911223344','Lê Thanh Hải',785,'$2b$12$ZIbljZ0ECeKx9xuQLdnqNuBtyc/IKJ9UfddaEXXmdt8iecd/Dv3eW'),('0912345678','Phạm Minh Tuấn',2255,'$2b$12$ZIbljZ0ECeKx9xuQLdnqNuBtyc/IKJ9UfddaEXXmdt8iecd/Dv3eW'),('0987654321','Phan Hoàng My',3370,'$2b$12$ZIbljZ0ECeKx9xuQLdnqNuBtyc/IKJ9UfddaEXXmdt8iecd/Dv3eW'),('12345678910','ddd',0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monan`
--

LOCK TABLES `monan` WRITE;
/*!40000 ALTER TABLE `monan` DISABLE KEYS */;
INSERT INTO `monan` VALUES (1,'Bò Lúc Lắc Khoai Tây','https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500','Bò mềm, khoai tây chiên giòn',1),(2,'Bò Nướng Tảng','https://images.unsplash.com/photo-1544025162-d76694265947?w=500','Bò nướng tảng sốt tiêu xanh',1),(3,'Bò Xào Sate','https://images.unsplash.com/photo-1600891964092-4316c288032e?w=500','Bò xào cay nồng',1),(4,'Bò Né Trứng Ốp La','https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=500','Bò né chảo gang xèo xèo',1),(5,'Thăn Bò Áp Chảo','https://images.unsplash.com/photo-1600891964943-4316c288032e?w=500','Thăn bò Mỹ áp chảo sốt vang',1),(6,'Gỏi Bò Bóp Thấu','https://images.unsplash.com/photo-1534080564583-6be75777b70a?w=500','Gỏi bò chua ngọt khai vị',1),(7,'Gà Nướng Muối Ớt','https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=500','Gà nướng nguyên con cay nồng',2),(8,'Sườn Heo Nướng BBQ','https://images.unsplash.com/photo-1544025162-d76694265947?w=500','Sườn heo nướng mật ong',2),(9,'Cánh Gà Chiên Mắm','https://images.unsplash.com/photo-1569058242253-1df69ce8eb5c?w=500','Cánh gà chiên giòn rụm',2),(10,'Ba Chỉ Heo Quay','https://images.unsplash.com/photo-1516684732162-798a0062be99?w=500','Heo quay da giòn',2),(11,'Gà Hấp Lá Chanh','https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=500','Gà ta hấp lá chanh thơm lừng',2),(12,'Giò Heo Hầm Thuốc Bắc','https://images.unsplash.com/photo-1548943487-a2e4f4d662af?w=500','Giò heo hầm bồi bổ sức khỏe',2),(13,'Tôm Hùm Phô Mai','https://images.unsplash.com/photo-1559742811-822873691fc8?w=500','Tôm hùm bỏ lò phô mai',3),(14,'Mực Ống Hấp Hành','https://images.unsplash.com/photo-1599487405270-45c7ebc508ce?w=500','Mực hấp gừng hành',3),(15,'Hàu Nướng Mỡ Hành','https://images.unsplash.com/photo-1615141982883-c7ad0e69fd62?w=500','Hàu nướng than hoa',3),(16,'Cua Hoàng Đế Hấp','https://images.unsplash.com/photo-1553659971-f01207815844?w=500','Cua hấp sả tươi',3),(17,'Bạch Tuộc Nhúng Mẻ','https://images.unsplash.com/photo-1535399831218-d5bd36d1a6b3?w=500','Bạch tuộc giòn sần sật',3),(18,'Nghêu Hấp Thái','https://images.unsplash.com/photo-1565557618462-23114d59f6b9?w=500','Nghêu hấp cay xé lưỡi',3),(19,'Lẩu Thái Hải Sản','https://images.unsplash.com/photo-1555126634-323283e090fa?w=500','Lẩu chua cay tôm mực',4),(20,'Lẩu Bò Nhúng Giấm','https://images.unsplash.com/photo-1548943487-a2e4f4d662af?w=500','Lẩu bò nhúng giấm chua thanh',4),(21,'Lẩu Nấm Chim Câu','https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500','Lẩu nấm thanh đạm',4),(22,'Lẩu Gà Lá Giang','https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500','Lẩu gà ta lá giang',4),(23,'Lẩu Cá Tầm','https://images.unsplash.com/photo-1580476262798-bddd9f4b7369?w=500','Lẩu cá tầm măng chua',4),(24,'Lẩu Riêu Cua Bắp Bò','https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500','Lẩu riêu cua đồng xịn',4),(25,'Trà Đào Cam Sả','https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500','Trà đào giải nhiệt',5),(26,'Nước Ép Dưa Hấu','https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500','Nước ép tươi 100%',5),(27,'Bia Heineken','https://images.unsplash.com/photo-1614316315201-14036f0224d0?w=500','Bia nhập khẩu',5),(28,'Bia Tiger Nâu','https://images.unsplash.com/photo-1614316315201-14036f0224d0?w=500','Bia chai lạnh',5),(29,'Coca Cola','https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=500','Nước ngọt lon',5),(30,'Nước Suối Lavie','https://images.unsplash.com/photo-1548839140-29a749e1abc5?w=500','Nước suối tinh khiết',5);
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
  `TinhTrang` enum('DatMonTruoc','GoiMon','DoiLenMon','DaPhucVu') NOT NULL DEFAULT 'GoiMon',
  PRIMARY KEY (`MaGoiMon`),
  KEY `goimon_ibfk_2_idx` (`MaPhieuGoiMon`),
  KEY `goimon_ibfk_1` (`MaMonAn`),
  CONSTRAINT `goimon_ibfk_1` FOREIGN KEY (`MaMonAn`) REFERENCES `monan` (`MaMon`) ON UPDATE CASCADE,
  CONSTRAINT `goimon_ibfk_2` FOREIGN KEY (`MaPhieuGoiMon`) REFERENCES `phieugoimon` (`MaPhieuGoiMon`) ON UPDATE CASCADE,
  CONSTRAINT `monduocgoi_chk_2` CHECK ((`SoLuong` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monduocgoi`
--

LOCK TABLES `monduocgoi` WRITE;
/*!40000 ALTER TABLE `monduocgoi` DISABLE KEYS */;
INSERT INTO `monduocgoi` VALUES (1,1,1,2,85000,'DaPhucVu'),(2,19,1,1,175000,'DaPhucVu'),(3,7,2,1,125000,'DaPhucVu'),(4,27,2,4,225000,'DaPhucVu'),(5,13,3,2,155000,'DaPhucVu'),(6,20,3,1,190000,'DaPhucVu'),(7,2,4,1,100000,'DaPhucVu'),(8,30,4,2,240000,'DaPhucVu'),(9,14,5,3,160000,'DaPhucVu'),(10,25,5,2,210000,'DaPhucVu'),(11,3,6,1,95000,'DaPhucVu'),(12,21,6,1,185000,'DaPhucVu'),(13,8,7,2,120000,'DaPhucVu'),(14,15,8,5,155000,'DaPhucVu'),(15,28,8,5,220000,'DaPhucVu'),(16,4,9,1,100000,'DaPhucVu'),(17,9,10,2,135000,'DaPhucVu'),(18,29,10,3,235000,'DaPhucVu'),(19,16,11,1,170000,'DaPhucVu'),(20,5,12,2,105000,'DaPhucVu'),(21,22,12,1,190000,'DaPhucVu'),(22,10,13,1,140000,'DaPhucVu'),(23,17,14,3,170000,'DaPhucVu'),(24,26,14,2,215000,'DaPhucVu'),(25,6,15,1,110000,'DaPhucVu'),(26,11,16,1,135000,'DaPhucVu'),(27,18,17,2,175000,'DaPhucVu'),(28,27,17,4,220000,'DaPhucVu'),(29,1,18,2,85000,'DaPhucVu'),(30,19,18,1,175000,'DaPhucVu'),(31,7,19,1,115000,'DaPhucVu'),(32,13,20,2,155000,'DaPhucVu'),(33,28,20,6,230000,'DaPhucVu'),(34,2,21,1,100000,'DaPhucVu'),(35,14,22,3,155000,'DaPhucVu'),(36,3,23,1,100000,'DaPhucVu'),(37,20,23,1,185000,'DaPhucVu'),(38,8,24,2,120000,'DaPhucVu'),(39,15,25,5,165000,'DaPhucVu'),(40,4,26,1,105000,'DaPhucVu'),(41,29,26,2,230000,'DaPhucVu'),(42,9,27,2,125000,'DaPhucVu'),(43,16,28,1,170000,'GoiMon'),(44,25,28,2,215000,'GoiMon'),(45,5,29,2,110000,'DoiLenMon'),(46,10,30,1,130000,'DaPhucVu'),(47,30,30,3,235000,'DaPhucVu'),(48,17,31,1,165000,'DaPhucVu'),(49,6,32,2,110000,'DaPhucVu'),(50,21,32,1,185000,'DaPhucVu'),(51,11,33,1,145000,'DaPhucVu'),(52,18,34,3,180000,'DaPhucVu'),(53,26,34,4,220000,'DaPhucVu'),(54,1,35,2,90000,'DaPhucVu'),(55,7,36,1,125000,'DaPhucVu'),(56,13,37,1,145000,'DaPhucVu'),(57,22,37,1,190000,'DaPhucVu'),(58,2,38,2,100000,'DaPhucVu'),(59,14,39,3,155000,'DaPhucVu'),(60,27,39,2,220000,'DaPhucVu'),(61,3,40,1,95000,'DaPhucVu'),(62,8,41,2,130000,'DaPhucVu'),(63,15,42,4,160000,'DaPhucVu'),(64,28,42,6,230000,'DaPhucVu'),(65,4,43,1,100000,'DaPhucVu'),(66,9,44,2,135000,'GoiMon'),(67,16,45,1,165000,'DoiLenMon'),(68,19,1001,50,175000,'DaPhucVu'),(69,16,1001,40,160000,'DaPhucVu'),(70,24,1002,60,200000,'DaPhucVu'),(71,13,1002,42,145000,'DaPhucVu'),(72,20,1003,40,180000,'DaPhucVu'),(73,14,1003,32,150000,'DaPhucVu'),(74,19,1004,80,175000,'DaPhucVu'),(75,15,1004,52,155000,'DaPhucVu'),(76,24,2001,80,210000,'DaPhucVu'),(77,16,2001,50,170000,'DaPhucVu'),(78,19,2002,60,185000,'DaPhucVu'),(79,14,2002,37,160000,'DaPhucVu'),(80,20,2003,60,190000,'DaPhucVu'),(81,15,2003,46,165000,'DaPhucVu'),(82,19,3001,50,180000,'DaPhucVu'),(83,14,3001,32,155000,'DaPhucVu'),(84,24,3002,90,205000,'DaPhucVu'),(85,16,3002,58,165000,'DaPhucVu'),(86,20,3003,50,185000,'DaPhucVu'),(87,15,3003,42,160000,'DaPhucVu');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `khach_goi_mon` AFTER INSERT ON `monduocgoi` FOR EACH ROW begin 
	declare v_MaPhieuGoiMon int;
    select MaPhieuGoiMon into v_MaPhieuGoiMon
    from monduocgoi
    where MaMonAn=new.MaMonAn and TinhTrang='GoiMon'
    limit 1;
    update phieugoimon
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
			from monduocgoi
			where MaPhieuGoiMon=new.MaPhieuGoiMon and TinhTrang='ChoLenMon'
        )
        then 
			update phieugoimon
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
  `VaiTro` enum('nhanvien','QuanLy') NOT NULL DEFAULT 'nhanvien',
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
INSERT INTO `nhanvien` VALUES (1,1,'Nguyễn Văn An','0901111111','Q1, TP.HCM','nhanvien','2026-05-12 08:00:00',8000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,2,'Trần Thị Bình','0901111112','Q3, TP.HCM','nhanvien','2026-05-12 08:00:00',7500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,3,'Lê Hoàng Cường','0901111113','Q4, TP.HCM','nhanvien','2026-05-12 14:00:00',6500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,4,'Phạm Mai Dung','0901111114','Q1, TP.HCM','nhanvien','2026-05-12 14:00:00',7000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,5,'Hoàng Trọng Ân','0901111115','Bình Thạnh, TP.HCM','nhanvien','2026-05-12 08:00:00',12000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,6,'Vũ Đức Duy','0902222221','Q3, TP.HCM','nhanvien','2026-05-12 08:00:00',8500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,7,'Đinh Thu Hà','0902222222','Q10, TP.HCM','nhanvien','2026-05-12 08:00:00',7200000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,8,'Bùi Khắc Huy','0902222223','Tân Bình, TP.HCM','nhanvien','2026-05-12 14:00:00',6800000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,9,'Ngô Thanh Hương','0902222224','Q3, TP.HCM','nhanvien','2026-05-12 14:00:00',7000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,10,'Lý Quốc Bảo','0902222225','Phú Nhuận, TP.HCM','nhanvien','2026-05-12 08:00:00',11500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,11,'Tô Tấn Phát','0903333331','Q10, TP.HCM','nhanvien','2026-05-12 08:00:00',8200000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,''),(3,12,'Hồ Ngọc Mai','0903333332','Q5, TP.HCM','nhanvien','2026-05-12 08:00:00',7500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,13,'Đỗ Văn Toàn','0903333333','Q11, TP.HCM','nhanvien','2026-05-12 14:00:00',6700000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,14,'Trịnh Tố Uyên','0903333334','Q10, TP.HCM','nhanvien','2026-05-12 14:00:00',7100000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,15,'Cao Đăng Khoa','0903333335','Tân Phú, TP.HCM','nhanvien','2026-05-12 08:00:00',11000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,16,'Trần Trọng Quản','0922334455','Quận 1, TP.HCM','QuanLy','2026-05-23 08:00:00',15000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,17,'Lê Thị Điều Hành','0933445566','Quận 10, TP.HCM','QuanLy','2026-05-23 08:00:00',16000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,18,'Phạm Minh Trí','0944556677','Thủ Đức, TP.HCM','QuanLy','2026-05-23 08:00:00',15500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieudatban`
--

LOCK TABLES `phieudatban` WRITE;
/*!40000 ALTER TABLE `phieudatban` DISABLE KEYS */;
INSERT INTO `phieudatban` VALUES (1,1,'2026-05-01 10:00:00','2026-05-01 19:00:00','DaNhanban',103500,'0901234567',1),(2,2,'2026-05-05 09:00:00','2026-05-05 20:00:00','DaNhanban',307500,'0909090909',2),(3,7,'2026-05-10 14:00:00','2026-05-10 18:30:00','DaNhanban',150000,'0911223344',6),(4,8,'2026-05-15 11:00:00','2026-05-15 19:30:00','DaNhanban',174000,'0912345678',7),(5,14,'2026-05-20 15:00:00','2026-05-20 20:00:00','DaNhanban',270000,'0987654321',11);
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
where  MaBanAn=new.MaBanAn and abs(timestampdiff(minute,NgayGioNhanBan,new.NgayGioNhanBan))<180 and TinhTrang IN ('ChoNhanBan', 'DaNhanBan'))
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
where MaBanAn=new.MaBanAn and MaPhieuDatBan!=new.MaPhieuDatBan and  abs(timestampdiff(minute,NgayGioNhanBan,new.NgayGioNhanBan))<180 and TinhTrang IN ('ChoNhanBan', 'DaNhanBan'))
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
) ENGINE=InnoDB AUTO_INCREMENT=3004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieugoimon`
--

LOCK TABLES `phieugoimon` WRITE;
/*!40000 ALTER TABLE `phieugoimon` DISABLE KEYS */;
INSERT INTO `phieugoimon` VALUES (1,1,'0901234567',1,'2026-05-01 19:00:00',1,'DaPhucVu'),(2,2,'0909090909',2,'2026-05-05 20:00:00',1,'DaPhucVu'),(3,7,'0911223344',6,'2026-05-10 18:30:00',1,'DaPhucVu'),(4,8,'0912345678',7,'2026-05-15 19:30:00',1,'DaPhucVu'),(5,14,'0987654321',11,'2026-05-20 20:00:00',1,'DaPhucVu'),(6,3,NULL,1,'2026-05-02 12:30:00',0,'DaPhucVu'),(7,4,'0901234567',2,'2026-05-03 18:00:00',0,'DaPhucVu'),(8,5,NULL,3,'2026-05-04 19:15:00',0,'DaPhucVu'),(9,6,NULL,4,'2026-05-06 20:30:00',0,'DaPhucVu'),(10,9,'0909090909',6,'2026-05-07 11:00:00',0,'DaPhucVu'),(11,10,NULL,7,'2026-05-08 13:20:00',0,'DaPhucVu'),(12,11,NULL,8,'2026-05-09 19:00:00',0,'DaPhucVu'),(13,12,'0911223344',9,'2026-05-11 20:45:00',0,'DaPhucVu'),(14,15,NULL,11,'2026-05-12 18:30:00',0,'DaPhucVu'),(15,16,NULL,12,'2026-05-13 19:10:00',0,'DaPhucVu'),(16,17,'0912345678',13,'2026-05-14 21:00:00',0,'DaPhucVu'),(17,18,NULL,14,'2026-05-16 11:30:00',0,'DaPhucVu'),(18,1,NULL,1,'2026-05-17 12:45:00',0,'DaPhucVu'),(19,2,NULL,2,'2026-05-18 18:20:00',0,'DaPhucVu'),(20,7,'0987654321',6,'2026-05-19 19:30:00',0,'DaPhucVu'),(21,8,NULL,7,'2026-05-21 20:15:00',0,'DaPhucVu'),(22,14,NULL,11,'2026-05-22 18:00:00',0,'DaPhucVu'),(23,15,NULL,12,'2026-05-23 19:40:00',0,'DaPhucVu'),(24,3,'0901234567',1,'2026-05-24 12:00:00',0,'DaPhucVu'),(25,9,NULL,6,'2026-05-25 18:45:00',0,'DaPhucVu'),(26,16,NULL,11,'2026-05-26 19:10:00',0,'DaPhucVu'),(27,4,NULL,2,'2026-05-27 20:20:00',0,'DaPhucVu'),(28,10,'0909090909',7,'2026-05-28 11:15:00',0,'GoiMon'),(29,17,NULL,12,'2026-05-29 12:30:00',0,'ChoLenMon'),(30,5,NULL,3,'2026-05-30 19:00:00',0,'YeuCauThanhToan'),(31,NULL,'0901234567',1,'2026-05-02 10:00:00',0,'DaPhucVu'),(32,NULL,'0909090909',2,'2026-05-04 11:30:00',0,'DaPhucVu'),(33,NULL,'0911223344',6,'2026-05-07 14:00:00',0,'DaPhucVu'),(34,NULL,'0912345678',7,'2026-05-09 16:20:00',0,'DaPhucVu'),(35,NULL,'0987654321',11,'2026-05-11 18:10:00',0,'DaPhucVu'),(36,NULL,'0901234567',12,'2026-05-13 10:45:00',0,'DaPhucVu'),(37,NULL,'0909090909',1,'2026-05-15 15:30:00',0,'DaPhucVu'),(38,NULL,'0911223344',6,'2026-05-18 19:00:00',0,'DaPhucVu'),(39,NULL,'0912345678',11,'2026-05-20 20:15:00',0,'DaPhucVu'),(40,NULL,'0987654321',2,'2026-05-22 17:40:00',0,'DaPhucVu'),(41,NULL,'0901234567',7,'2026-05-24 11:15:00',0,'DaPhucVu'),(42,NULL,'0909090909',12,'2026-05-26 13:00:00',0,'DaPhucVu'),(43,NULL,'0911223344',1,'2026-05-28 14:30:00',0,'DaPhucVu'),(44,NULL,'0912345678',6,'2026-05-29 18:20:00',0,'GoiMon'),(45,NULL,'0987654321',11,'2026-05-30 19:45:00',0,'ChoLenMon'),(1001,1,NULL,1,'2026-05-02 18:00:00',0,'DaPhucVu'),(1002,2,NULL,2,'2026-05-10 18:30:00',0,'DaPhucVu'),(1003,3,NULL,3,'2026-05-20 19:00:00',0,'DaPhucVu'),(1004,4,NULL,4,'2026-05-28 19:30:00',0,'DaPhucVu'),(2001,7,NULL,6,'2026-05-05 18:00:00',0,'DaPhucVu'),(2002,8,NULL,7,'2026-05-15 18:30:00',0,'DaPhucVu'),(2003,9,NULL,8,'2026-05-25 19:00:00',0,'DaPhucVu'),(3001,14,NULL,11,'2026-05-03 18:00:00',0,'DaPhucVu'),(3002,15,NULL,12,'2026-05-12 18:30:00',0,'DaPhucVu'),(3003,16,NULL,13,'2026-05-22 19:00:00',0,'DaPhucVu');
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
	update banan
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieunhapkho`
--

LOCK TABLES `phieunhapkho` WRITE;
/*!40000 ALTER TABLE `phieunhapkho` DISABLE KEYS */;
INSERT INTO `phieunhapkho` VALUES (1,16,'2026-05-02 07:00:00',12500000,'Nhập thịt bò & gia vị CN1'),(2,16,'2026-05-10 07:30:00',15000000,'Nhập hải sản tươi CN1'),(3,16,'2026-05-20 08:00:00',9000000,'Nhập rau củ quả CN1'),(4,16,'2026-05-28 07:15:00',18000000,'Nhập bia & nước giải khát CN1'),(5,17,'2026-05-05 07:45:00',21000000,'Nhập thịt & hải sản CN2'),(6,17,'2026-05-15 08:10:00',14500000,'Nhập rau củ quả CN2'),(7,17,'2026-05-25 07:20:00',16000000,'Nhập bia & nước ngọt CN2'),(8,18,'2026-05-03 08:30:00',11000000,'Nhập rau củ quả CN3'),(9,18,'2026-05-12 07:50:00',25000000,'Nhập tôm hùm, cua hoàng đế CN3'),(10,18,'2026-05-22 08:45:00',13500000,'Nhập nước giải khát CN3');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theloaimon`
--

LOCK TABLES `theloaimon` WRITE;
/*!40000 ALTER TABLE `theloaimon` DISABLE KEYS */;
INSERT INTO `theloaimon` VALUES (1,'Món Bò','Các món từ thịt bò cao cấp',1),(2,'Món Gà & Heo','Thịt gia cầm và heo',1),(3,'Hải Sản','Hải sản tươi sống',1),(4,'Lẩu','Lẩu cho 2-4 người ăn',1),(5,'Thức Uống','Nước giải khát, bia, trà',1);
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
    FROM monduocgoi  
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
	from phieugoimon P LEFT JOIN hoadon HD on P.MaPhieuGoiMon=HD.MaPhieuGoiMon
	where P.SDTKhach=p_SDTKhach  and HD.MaHoaDon is Null and P.MaPhieuGoiMon is not Null
    limit 1;
    
	if v_MaPhieuGoiMon is null
    then 
		INSERT INTO phieugoimon (MaBanAn, SDTKhach)
		VALUES (null, p_SDTKhach);
        set v_MaPhieuGoiMon=last_insert_id();
	end if;
    
	select MaGoiMon into v_MaGoiMon
	from monduocgoi
	where MaMonAn=p_MaMonAn and MaPhieuGoiMon=v_MaPhieuGoiMon and TinhTrang ='GoiMon'
    limit 1;
    if v_MaGoiMon is not null
	then
		update monduocgoi
		set SoLuong=Soluong+p_SoLuong
		where MaGoiMon=v_MaGoiMon;
	else 
		insert into monduocgoi (MaPhieuGoiMon,MaMonAn,SoLuong,TinhTrang)
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
	from phieugoimon P LEFT JOIN hoadon HD on P.MaPhieuGoiMon=HD.MaPhieuGoiMon
	where P.MaBanAn=p_MaBanAn  and HD.MaHoaDon is Null
    limit 1;
    
	if p_MaPhieuGoiMon is null
    then 
		INSERT INTO phieugoimon (MaBanAn, SDTKhach)
		VALUES (p_MaBanAn, p_SDTKhach);
        set p_MaPhieuGoiMon=last_insert_id();
	end if;
    
	select MaGoiMon into p_MaGoiMon
	from monduocgoi
	where MaMonAn=p_MaMonAn and MaPhieuGoiMon=p_MaPhieuGoiMon and TinhTrang ='GoiMon'
    limit 1;
    if p_MaGoiMon is not null
	then
		if p_SoLuong>0 
        then
			update monduocgoi
			set SoLuong=Soluong+p_SoLuong
			where MaGoiMon=p_MaGoiMon;
		else
			delete from monduocgoi
            where MaGoiMon=p_MaGoiMon;
		end if;
	else 
		insert into monduocgoi (MaPhieuGoiMon,MaMonAn,SoLuong,TinhTrang)
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
		from phieudatban
		where MaPhieuDatban=p_MaPhieuDatBan;
        
		INSERT INTO phieugoimon (MaBanAn, NgayGioTaoPhieu, SDTKhach,MaNhanVienPhucVu)
		VALUES (v_MaBanAn, v_NgayGioNhanBan, v_SDTKhach,p_MaNV);
		set v_MaPhieuGoiMon=last_insert_id();
        INSERT INTO dattruocmon (MaPhieuDatBan, MaPhieuGoiMon) 
		VALUES (p_MaPhieuDatBan, v_MaPhieuGoiMon);
	end if;
    
	select MaGoiMon into v_MaGoiMon
	from monduocgoi
	where MaMonAn=p_MaMonAn and MaPhieuGoiMon=v_MaPhieuGoiMon and TinhTrang ='ChoLenMon'
    limit 1;
    if v_MaGoiMon is not null
	then
		if p_SoLuong>0 
        then
			update monduocgoi
			set SoLuong=Soluong+p_SoLuong
			where MaGoiMon=p_MaGoiMon;
		else
			delete from monduocgoi
            where MaGoiMon=p_MaGoiMon;
		end if;
	else 
		insert into monduocgoi (MaPhieuGoiMon,MaMonAn,SoLuong,TinhTrang)
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
	from phieugoimon P LEFT JOIN hoadon HD on P.MaPhieuGoiMon=HD.MaPhieuGoiMon
	where P.MaBanAn=p_MaBanAn  and HD.MaHoaDon is Null
    limit 1;
    
	if p_MaPhieuGoiMon is null
    then
		INSERT INTO phieugoimon (MaBanAn, SDTKhach,MaNhanVienPhucVu)
		VALUES (p_MaBanAn, p_SDTKhach,p_MaNV);
		set p_MaPhieuGoiMon=last_insert_id();
	end if;
    
	select MaGoiMon into p_MaGoiMon
	from monduocgoi
	where MaMonAn=p_MaMonAn and MaPhieuGoiMon=p_MaPhieuGoiMon and TinhTrang ='ChoLenMon'
    limit 1;
    if p_MaGoiMon is not null
	then
		if p_SoLuong>0 
        then
			update monduocgoi
			set SoLuong=Soluong+p_SoLuong
			where MaGoiMon=p_MaGoiMon;
		else
			delete from monduocgoi
            where MaGoiMon=p_MaGoiMon;
		end if;
	else 
		insert into monduocgoi (MaPhieuGoiMon,MaMonAn,SoLuong,TinhTrang)
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
	update monduocgoi
    set TinhTrang='ChoLenMon'
    where MaPhieuGoiMon=p_MaPhieuGoiMon and TinhTrang='GoiMon';
    update phieugoimon
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
    INSERT INTO hoadon (MaPhieuGoiMon, MaNhanVien, GiaTri, PhuongThucThanhToan)
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
	insert into chinhanh(Diachi,SDT,Email,GioMoCua)
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
	insert into monan(TenMon,MaTheLoai,ThongTinMoTa,HinhAnh) 
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
	insert into theloaimon(TenTheLoai,ThongTinMota)
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
in p_UuTien enum('chinhanh','ThoiGian')
)
begin 
	select HD.MaChiNhanh, 
	CASE 
		WHEN p_UuTien = 'chinhanh' THEN NULL
        ELSE 
			case p_PhamVi
				WHEN 'Nam' THEN DATE_FORMAT(HD.NgayGioTaoHoaDon, '%Y')     
				WHEN 'Thang' THEN DATE_FORMAT(HD.NgayGioTaoHoaDon, '%m-%Y')  
				ELSE DATE_FORMAT(HD.NgayGioTaoHoaDon, '%d-%m-%Y')
			end
	END as ThoiGian,
    sum(HD.GiaTri) as DoanhSo
    from tongkethoadon HD 
    where (p_MaChiNhanh is null or p_MaChiNhanh=HD.MaChiNhanh)
    and (p_ThoiGianBatDau is NULL or HD.NgayGioTaoHoaDon >= p_ThoiGianBatDau) 
    and ( p_ThoiGianKetThuc is null or HD.NgayGioTaoHoaDon<=p_ThoiGianKetThuc)
    group by  
		HD.MaChiNhanh,
		NgayGioTaoHoaDon
    having (p_DoanhSoToiThieu is null or DoanhSo>=p_DoanhSoToiThieu) and ( p_DoanhSoToiDa is null or DoanhSo<=p_DoanhSoToiDa)
	ORDER BY 
        CASE WHEN p_UuTien = 'chinhanh' THEN HD.MaChiNhanh ELSE HD.NgayGioTaoHoaDon END ASC,
        CASE WHEN p_UuTien = 'chinhanh' THEN HD.NgayGioTaoHoaDon ELSE HD.MaChiNhanh END ASC;
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
in p_UuTien enum('chinhanh','ThoiGian')
)
begin
	select KP.MaChiNhanh,
	CASE 
			WHEN p_UuTien = 'chinhanh' THEN NULL 
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
		case when p_UuTien='chinhanh' then KP.MaChiNhanh else KP.NgayGioTaoPhieu end asc,
        case when p_UuTien='chinhanh' then KP.NgayGioTaoPhieu else KP.MaChiNhanh end asc;
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
	in p_UuTien enum('chinhanh','ThoiGian')
	)
begin
		select HD.MaChiNhanh,
        CASE 
			WHEN p_UuTien = 'chinhanh' THEN NULL 
            ELSE 
				case p_PhamVi
					WHEN 'Nam' THEN DATE_FORMAT(HD.NgayGioTaoHoaDon, '%Y')     
					WHEN 'Thang' THEN DATE_FORMAT(HD.NgayGioTaoHoaDon, '%m-%Y')  
					ELSE DATE_FORMAT(HD.NgayGioTaoHoaDon, '%d-%m-%Y')
				end
        END as ThoiGian,
		MA.TenMon, 
        sum(MDG.SoLuong) as DoanhSoBanRa
		from tongkethoadon HD
		join monduocgoi MDG on HD.MaPhieuGoiMon =MDG.MaPhieuGoiMon
		join monan MA on MDG.MaMonAn = MA.MaMon
		where (p_MaChiNhanh is NULL or p_MachiNhanh=HD.MaChiNhanh)
		and (p_ThoiGianBatDau is NULL or HD.NgayGioTaoHoaDon >= p_ThoiGianBatDau) 
		and ( p_ThoiGianKetThuc is null or HD.NgayGioTaoHoaDon<=p_ThoiGianKetThuc)
		group by  HD.MaChiNhanh,ThoiGian, MA.TenMon
		order by 
        DoanhSoBanRa desc,
			CASE WHEN p_UuTien = 'chinhanh' THEN HD.MaChiNhanh ELSE ThoiGian END ASC,
			CASE WHEN p_UuTien = 'chinhanh' THEN ThoiGian ELSE HD.MaChiNhanh END ASC
			
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
    from chitietphieugoimon
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

-- Dump completed on 2026-05-31 21:30:18
