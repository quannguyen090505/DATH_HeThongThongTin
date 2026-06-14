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
  `TinhTrangSuDung` enum('BanTrong','DaDatTruoc','DangSuDung','CanThanhToan','DaThanhToan') NOT NULL DEFAULT 'BanTrong',
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
INSERT INTO `banan` VALUES (1,1,'BanTrong','Tang 1',4,1),(2,1,'BanTrong','Tang 1',4,1),(3,1,'BanTrong','Tang 1',4,1),(4,1,'BanTrong','Tang 1',4,1),(5,1,'BanTrong','Tang 1',4,1),(6,1,'BanTrong','Tang 1',4,1),(7,2,'BanTrong','Tang 1',4,1),(8,2,'BanTrong','Tang 1',4,1),(9,2,'BanTrong','Tang 1',4,1),(10,2,'BanTrong','Tang 1',4,1),(11,2,'BanTrong','Tang 1',4,1),(12,2,'BanTrong','Tang 1',4,1),(13,2,'BanTrong','Tang 1',4,1),(14,3,'DangSuDung','Tang 1',4,1),(15,3,'DangSuDung','Tang 1',4,1),(16,3,'DaThanhToan','Tang 1',4,1),(17,3,'DangSuDung','Tang 1',4,1),(18,3,'BanTrong','Tang 1',4,1),(19,3,'DangSuDung','Tang 2',4,1),(20,3,'BanTrong','Tang 2',4,1),(21,3,'DangSuDung','Tang 2',4,1),(22,3,'DangSuDung','Tang 2',4,1),(23,3,'BanTrong','Tang 2',4,1),(24,3,'DangSuDung','Tang 1',4,1);
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
-- Temporary view structure for view `chitietphieudatban`
--

DROP TABLE IF EXISTS `chitietphieudatban`;
/*!50001 DROP VIEW IF EXISTS `chitietphieudatban`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `chitietphieudatban` AS SELECT 
 1 AS `MaPhieuDatBan`,
 1 AS `MaBanAn`,
 1 AS `NgayGioNhanBan`,
 1 AS `TinhTrang`,
 1 AS `TienCoc`,
 1 AS `SDTKhach`,
 1 AS `MaPhieuGoiMon`,
 1 AS `MaNhanVienPhucVu`*/;
SET character_set_client = @saved_cs_client;

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
 1 AS `NgayGioTaoPhieu`,
 1 AS `SDTKhach`,
 1 AS `TinhTrangPhieuGoiMon`,
 1 AS `MaGoiMon`,
 1 AS `TenMon`,
 1 AS `SoLuong`,
 1 AS `DonGiaMon`,
 1 AS `ThanhTien`,
 1 AS `TinhTrangGoiMon`*/;
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
INSERT INTO `cungcapthucdon` VALUES (1,1,85000,1),(1,2,90000,1),(1,3,95000,1),(1,4,100000,1),(1,5,105000,1),(1,6,110000,1),(1,7,115000,1),(1,8,120000,1),(1,9,125000,1),(1,10,130000,1),(1,11,135000,1),(1,12,140000,1),(1,13,145000,1),(1,14,150000,1),(1,15,155000,1),(1,16,160000,1),(1,17,165000,1),(1,18,170000,1),(1,19,175000,1),(1,20,180000,1),(1,31,0,0),(2,1,95000,1),(2,2,100000,1),(2,3,105000,1),(2,4,110000,1),(2,5,115000,1),(2,6,120000,1),(2,7,125000,1),(2,8,130000,1),(2,9,135000,1),(2,10,140000,1),(2,11,145000,1),(2,12,150000,1),(2,13,155000,1),(2,14,160000,1),(2,15,165000,1),(2,16,170000,1),(2,17,175000,1),(2,18,180000,1),(2,19,185000,1),(2,20,190000,1),(2,21,195000,1),(2,22,200000,1),(2,23,205000,1),(2,24,210000,1),(2,25,215000,1),(2,31,0,0),(3,1,90000,1),(3,2,95000,1),(3,3,100000,1),(3,4,105000,1),(3,5,110000,1),(3,6,115000,1),(3,7,120000,1),(3,8,125000,1),(3,9,130000,1),(3,10,135000,1),(3,11,140000,1),(3,12,145000,1),(3,13,150000,1),(3,14,155000,1),(3,15,160000,1),(3,16,165000,1),(3,17,170000,1),(3,18,175000,1),(3,19,180000,1),(3,20,185000,1),(3,21,190000,1),(3,22,195000,1),(3,23,200000,1),(3,24,205000,1),(3,25,210000,1),(3,26,215000,1),(3,27,220000,1),(3,28,225000,1),(3,29,230000,1),(3,30,235000,1),(3,31,67000,1);
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
INSERT INTO `dattruocmon` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(17,3038),(18,3044),(20,3053);
/*!40000 ALTER TABLE `dattruocmon` ENABLE KEYS */;
UNLOCK TABLES;

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
  `XacNhanThanhToan` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaHoaDon`),
  KEY `hoadon_ibfk_1_idx` (`MaPhieuGoiMon`),
  KEY `hoadon_ibfk_2_idx` (`MaNhanVien`),
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaPhieuGoiMon`) REFERENCES `phieugoimon` (`MaPhieuGoiMon`),
  CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (1,1,'2026-05-01 20:30:00',1,260000,'TienMat',1),(2,2,'2026-05-05 21:00:00',2,85671,'ChuyenKhoan',1),(3,3,'2026-05-10 19:30:00',3,110000,'The',1),(4,4,'2026-05-15 20:45:00',4,230000,'TienMat',1),(5,5,'2026-05-20 21:30:00',1,145440,'ChuyenKhoan',1),(6,6,'2026-05-02 13:45:00',2,90000,'The',1),(7,7,'2026-05-03 19:10:00',3,190000,'TienMat',1),(8,8,'2026-05-04 20:30:00',4,300000,'ChuyenKhoan',1),(9,9,'2026-05-06 21:40:00',1,105000,'The',1),(10,10,'2026-05-07 12:20:00',2,84037,'TienMat',1),(11,11,'2026-05-08 14:15:00',3,100000,'ChuyenKhoan',1),(12,12,'2026-05-09 20:10:00',4,210000,'The',1),(13,13,'2026-05-11 21:50:00',1,110000,'TienMat',1),(14,14,'2026-05-12 19:40:00',2,330000,'ChuyenKhoan',1),(15,15,'2026-05-13 20:15:00',3,90000,'The',1),(16,16,'2026-05-14 22:20:00',4,95000,'TienMat',1),(17,17,'2026-05-16 12:45:00',1,200000,'ChuyenKhoan',1),(18,18,'2026-05-17 13:50:00',2,200000,'The',1),(19,19,'2026-05-18 19:15:00',3,105000,'TienMat',1),(20,20,'2026-05-19 20:45:00',4,74005,'ChuyenKhoan',1),(21,21,'2026-05-21 21:20:00',1,100000,'The',1),(22,22,'2026-05-22 19:10:00',2,300000,'TienMat',1),(23,23,'2026-05-23 20:30:00',3,105000,'ChuyenKhoan',1),(24,24,'2026-05-24 13:00:00',4,210000,'The',1),(25,25,'2026-05-25 20:00:00',1,475000,'TienMat',1),(26,26,'2026-05-26 20:30:00',2,95000,'ChuyenKhoan',1),(27,27,'2026-05-27 21:15:00',3,190000,'The',1),(28,28,'2026-05-28 12:30:00',4,47729,'TienMat',1),(29,29,'2026-05-29 13:40:00',1,220000,'ChuyenKhoan',1),(30,30,'2026-05-30 20:20:00',2,85000,'The',1),(32,31,'2026-05-02 12:00:00',1,260000,'TienMat',1),(33,32,'2026-05-04 13:40:00',2,285000,'ChuyenKhoan',1),(34,33,'2026-05-06 19:30:00',3,205000,'The',1),(35,34,'2026-05-09 20:50:00',4,340000,'TienMat',1),(36,35,'2026-05-12 21:15:00',1,370000,'ChuyenKhoan',1),(37,36,'2026-05-15 12:45:00',2,200000,'The',1),(38,37,'2026-05-18 14:00:00',3,315000,'TienMat',1),(39,38,'2026-05-21 19:30:00',4,270000,'ChuyenKhoan',1),(40,39,'2026-05-24 20:25:00',1,300000,'The',1),(41,40,'2026-05-28 21:40:00',2,295000,'TienMat',1),(42,41,'2026-05-03 12:30:00',3,190000,'ChuyenKhoan',1),(43,42,'2026-05-05 13:50:00',4,300000,'The',1),(44,43,'2026-05-08 19:40:00',1,215000,'TienMat',1),(45,44,'2026-05-11 21:00:00',2,230000,'ChuyenKhoan',1),(46,45,'2026-05-14 21:20:00',3,385000,'The',1),(47,46,'2026-05-17 12:55:00',4,210000,'TienMat',1),(48,47,'2026-05-20 14:10:00',1,335000,'ChuyenKhoan',1),(49,48,'2026-05-23 19:50:00',2,380000,'The',1),(50,49,'2026-05-26 20:30:00',3,410000,'TienMat',1),(51,50,'2026-05-30 21:45:00',4,330000,'ChuyenKhoan',1),(52,51,'2026-05-02 19:10:00',1,270000,'The',1),(53,52,'2026-05-07 20:25:00',2,290000,'TienMat',1),(54,53,'2026-05-10 21:40:00',3,210000,'ChuyenKhoan',1),(55,54,'2026-05-13 13:00:00',4,330000,'The',1),(56,55,'2026-05-16 14:20:00',1,370000,'TienMat',1),(57,56,'2026-05-19 20:00:00',2,400000,'ChuyenKhoan',1),(58,57,'2026-05-22 21:15:00',3,325000,'The',1),(59,58,'2026-05-25 12:30:00',4,450000,'TienMat',1),(60,59,'2026-05-27 13:45:00',1,385000,'ChuyenKhoan',1),(61,60,'2026-05-31 20:10:00',2,430000,'The',1),(62,61,'2026-05-03 12:00:00',1,12000000,'ChuyenKhoan',1),(63,62,'2026-05-03 13:30:00',2,6750000,'ChuyenKhoan',1),(64,63,'2026-05-12 21:00:00',3,28500000,'ChuyenKhoan',1),(65,64,'2026-05-12 21:30:00',4,4400000,'TienMat',1),(66,65,'2026-05-12 22:00:00',1,4875000,'The',1),(67,66,'2026-05-20 21:00:00',2,17550000,'ChuyenKhoan',1),(68,67,'2026-05-20 22:00:00',3,5500000,'The',1),(69,68,'2026-05-15 14:00:00',4,3000000,'TienMat',1),(70,69,'2026-05-15 15:00:00',1,4200000,'ChuyenKhoan',1),(71,70,'2026-05-25 20:00:00',2,4750000,'The',1),(72,71,'2026-05-25 21:00:00',3,5850000,'TienMat',1),(73,72,'2026-05-08 21:00:00',4,3425000,'ChuyenKhoan',1),(74,73,'2026-05-22 21:00:00',1,3625000,'The',1),(75,74,'2026-05-28 21:00:00',2,3000000,'ChuyenKhoan',1),(76,75,'2026-05-31 21:00:00',3,4750000,'The',1),(77,76,'2026-05-03 21:00:00',1,11000000,'ChuyenKhoan',1),(78,77,'2026-05-12 21:30:00',2,25100000,'ChuyenKhoan',1),(79,78,'2026-05-22 22:00:00',3,13900000,'TienMat',1),(80,79,'2026-05-10 20:30:00',1,14500000,'ChuyenKhoan',1),(81,80,'2026-05-10 21:00:00',2,11050000,'The',1),(82,81,'2026-05-03 20:45:00',3,12300000,'TienMat',1),(83,82,'2026-05-12 21:15:00',4,10400000,'ChuyenKhoan',1),(84,83,'2026-05-31 20:30:00',1,7800000,'The',1),(85,84,'2026-05-05 21:00:00',1,13500000,'ChuyenKhoan',1),(86,85,'2026-05-15 21:30:00',2,12300000,'The',1),(87,86,'2026-05-22 21:00:00',3,8650000,'TienMat',1),(88,87,'2026-05-28 22:00:00',4,11100000,'ChuyenKhoan',1),(89,88,'2026-05-05 21:15:00',1,9750000,'The',1),(90,89,'2026-05-15 22:00:00',2,12900000,'ChuyenKhoan',1),(91,90,'2026-05-22 21:30:00',3,10700000,'TienMat',1),(92,91,'2026-05-28 22:30:00',4,12600000,'The',1),(103,3054,'2026-06-13 21:15:56',18,300000,'TienMat',1),(104,3056,'2026-06-14 15:00:16',18,148778,'TienMat',1),(105,3058,'2026-06-14 15:47:17',18,0,'TienMat',1),(106,3059,'2026-06-14 16:00:50',18,93575,'TienMat',1),(107,3057,'2026-06-14 16:15:43',18,68720,'TienMat',1),(108,3060,'2026-06-14 16:27:43',18,190000,'TienMat',1),(109,3062,'2026-06-14 16:36:17',18,450000,'TienMat',0),(110,3062,'2026-06-14 16:36:33',18,450000,'TienMat',0),(111,3053,'2026-06-14 16:43:11',18,375000,'TienMat',1),(112,3048,'2026-06-14 16:59:54',18,785000,'TienMat',1),(113,3045,'2026-06-14 17:16:59',18,373737,'TienMat',1),(114,3045,'2026-06-14 17:17:23',18,299300,'TienMat',1);
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
    declare v_SDTKhach varchar(11);
    declare v_DiemTichLuy int;
    
    select SDTKhach into v_SDTKhach
    from PhieuGoiMon
    where MaPhieuGoiMon=new.MaPhieuGoiMon;
    select DiemTichLuy into v_DiemTichLuy
    from Khach
    where SDT=v_SDTKhach;
    if v_DiemTichLuy is not null and v_DiemTichLuy>5000
    then 
		set new.GiaTri =new.GiaTri*(1- v_DiemTichLuy*0.0001);
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cap_nhat_tinh_trang_phieu_goi_mon_2` AFTER INSERT ON `hoadon` FOR EACH ROW BEGIN
    UPDATE PhieuGoiMon
    SET TinhTrang = 'DaThanhToan'
    WHERE MaPhieuGoiMon = NEW.MaPhieuGoiMon; 
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
  PRIMARY KEY (`SDT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach`
--

LOCK TABLES `khach` WRITE;
/*!40000 ALTER TABLE `khach` DISABLE KEYS */;
INSERT INTO `khach` VALUES ('0901234560','temp',0),('0901234567','Nguyễn Hoàng Nam',5075),('0901234568','temp8',0),('0903333331','test dat ban',0),('0909090909','Trần Thị Hồng',5782),('0911223344','Lê Thanh Hải',1645),('0912345678','Phạm Minh Tuấn',3295),('0987654321','Phan Hoàng My',6415),('12345678910','ddd',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monan`
--

LOCK TABLES `monan` WRITE;
/*!40000 ALTER TABLE `monan` DISABLE KEYS */;
INSERT INTO `monan` VALUES (1,'Bò Lúc Lắc Khoai Tây','https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500','Bò mềm, khoai tây chiên giòn',1),(2,'Bò Nướng Tảng','https://images.unsplash.com/photo-1544025162-d76694265947?w=500','Bò nướng tảng sốt tiêu xanh',1),(3,'Bò Xào Sate','https://images.unsplash.com/photo-1600891964092-4316c288032e?w=500','Bò xào cay nồng',1),(4,'Bò Né Trứng Ốp La','https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=500','Bò né chảo gang xèo xèo',1),(5,'Thăn Bò Áp Chảo','https://images.unsplash.com/photo-1600891964943-4316c288032e?w=500','Thăn bò Mỹ áp chảo sốt vang',1),(6,'Gỏi Bò Bóp Thấu','https://images.unsplash.com/photo-1534080564583-6be75777b70a?w=500','Gỏi bò chua ngọt khai vị',1),(7,'Gà Nướng Muối Ớt','https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=500','Gà nướng nguyên con cay nồng',2),(8,'Sườn Heo Nướng BBQ','https://images.unsplash.com/photo-1544025162-d76694265947?w=500','Sườn heo nướng mật ong',2),(9,'Cánh Gà Chiên Mắm','https://images.unsplash.com/photo-1569058242253-1df69ce8eb5c?w=500','Cánh gà chiên giòn rụm',2),(10,'Ba Chỉ Heo Quay','https://images.unsplash.com/photo-1516684732162-798a0062be99?w=500','Heo quay da giòn',2),(11,'Gà Hấp Lá Chanh','https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=500','Gà ta hấp lá chanh thơm lừng',2),(12,'Giò Heo Hầm Thuốc Bắc','https://images.unsplash.com/photo-1548943487-a2e4f4d662af?w=500','Giò heo hầm bồi bổ sức khỏe',2),(13,'Tôm Hùm Phô Mai','https://images.unsplash.com/photo-1559742811-822873691fc8?w=500','Tôm hùm bỏ lò phô mai',3),(14,'Mực Ống Hấp Hành','https://images.unsplash.com/photo-1599487405270-45c7ebc508ce?w=500','Mực hấp gừng hành',3),(15,'Hàu Nướng Mỡ Hành','https://images.unsplash.com/photo-1615141982883-c7ad0e69fd62?w=500','Hàu nướng than hoa',3),(16,'Cua Hoàng Đế Hấp','https://images.unsplash.com/photo-1553659971-f01207815844?w=500','Cua hấp sả tươi',3),(17,'Bạch Tuộc Nhúng Mẻ','https://images.unsplash.com/photo-1535399831218-d5bd36d1a6b3?w=500','Bạch tuộc giòn sần sật',3),(18,'Nghêu Hấp Thái','https://images.unsplash.com/photo-1565557618462-23114d59f6b9?w=500','Nghêu hấp cay xé lưỡi',3),(19,'Lẩu Thái Hải Sản','https://images.unsplash.com/photo-1555126634-323283e090fa?w=500','Lẩu chua cay tôm mực',4),(20,'Lẩu Bò Nhúng Giấm','https://images.unsplash.com/photo-1548943487-a2e4f4d662af?w=500','Lẩu bò nhúng giấm chua thanh',4),(21,'Lẩu Nấm Chim Câu','https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500','Lẩu nấm thanh đạm',4),(22,'Lẩu Gà Lá Giang','https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500','Lẩu gà ta lá giang',4),(23,'Lẩu Cá Tầm','https://images.unsplash.com/photo-1580476262798-bddd9f4b7369?w=500','Lẩu cá tầm măng chua',4),(24,'Lẩu Riêu Cua Bắp Bò','https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500','Lẩu riêu cua đồng xịn',4),(25,'Trà Đào Cam Sả','https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500','Trà đào giải nhiệt',5),(26,'Nước Ép Dưa Hấu','https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500','Nước ép tươi 100%',5),(27,'Bia Heineken','https://images.unsplash.com/photo-1614316315201-14036f0224d0?w=500','Bia nhập khẩu',5),(28,'Bia Tiger Nâu','https://images.unsplash.com/photo-1614316315201-14036f0224d0?w=500','Bia chai lạnh',5),(29,'Coca Cola','https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=500','Nước ngọt lon',5),(30,'Nước Suối Lavie','https://images.unsplash.com/photo-1548839140-29a749e1abc5?w=500','Nước suối tinh khiết',5),(31,'69','','',1);
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
  `TinhTrang` enum('GoiMon','DoiLenMon','DaPhucVu','DaHuy') NOT NULL DEFAULT 'GoiMon',
  PRIMARY KEY (`MaGoiMon`),
  KEY `goimon_ibfk_2_idx` (`MaPhieuGoiMon`),
  KEY `goimon_ibfk_1` (`MaMonAn`),
  CONSTRAINT `goimon_ibfk_1` FOREIGN KEY (`MaMonAn`) REFERENCES `monan` (`MaMon`) ON UPDATE CASCADE,
  CONSTRAINT `goimon_ibfk_2` FOREIGN KEY (`MaPhieuGoiMon`) REFERENCES `phieugoimon` (`MaPhieuGoiMon`) ON UPDATE CASCADE,
  CONSTRAINT `monduocgoi_chk_2` CHECK ((`SoLuong` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monduocgoi`
--

LOCK TABLES `monduocgoi` WRITE;
/*!40000 ALTER TABLE `monduocgoi` DISABLE KEYS */;
INSERT INTO `monduocgoi` VALUES (1,1,1,2,85000,'DaPhucVu'),(2,2,1,1,90000,'DaPhucVu'),(3,3,2,2,95000,'DaPhucVu'),(4,4,3,1,110000,'DaPhucVu'),(5,5,4,2,115000,'DaPhucVu'),(6,2,6,1,90000,'DaPhucVu'),(7,3,7,2,95000,'DaPhucVu'),(8,4,8,3,100000,'DaPhucVu'),(9,5,9,1,105000,'DaPhucVu'),(10,1,10,2,95000,'DaPhucVu'),(11,2,11,1,100000,'DaPhucVu'),(12,3,12,2,105000,'DaPhucVu'),(13,4,13,1,110000,'DaPhucVu'),(14,1,5,4,90000,'DaPhucVu'),(15,5,14,3,110000,'DaPhucVu'),(16,1,15,1,90000,'DaPhucVu'),(17,2,16,1,95000,'DaPhucVu'),(18,4,18,2,100000,'DaPhucVu'),(19,5,19,1,105000,'DaPhucVu'),(20,1,20,2,95000,'DaPhucVu'),(21,2,21,1,100000,'DaPhucVu'),(22,3,17,2,100000,'DaPhucVu'),(23,3,22,3,100000,'DaPhucVu'),(24,5,24,2,105000,'DaPhucVu'),(25,1,25,5,95000,'DaPhucVu'),(26,4,23,1,105000,'DaPhucVu'),(27,3,27,2,95000,'DaPhucVu'),(28,4,28,1,110000,'DaPhucVu'),(29,2,26,1,95000,'DaPhucVu'),(30,1,30,1,85000,'DaPhucVu'),(31,5,29,2,110000,'DaPhucVu'),(48,1,31,2,85000,'DaPhucVu'),(49,2,31,1,90000,'DaPhucVu'),(50,3,32,3,95000,'DaPhucVu'),(51,4,33,1,100000,'DaPhucVu'),(52,5,33,1,105000,'DaPhucVu'),(53,1,34,4,85000,'DaPhucVu'),(54,2,35,2,90000,'DaPhucVu'),(55,3,35,2,95000,'DaPhucVu'),(56,4,36,2,100000,'DaPhucVu'),(57,5,37,3,105000,'DaPhucVu'),(58,1,38,1,85000,'DaPhucVu'),(59,2,38,1,90000,'DaPhucVu'),(60,3,38,1,95000,'DaPhucVu'),(61,4,39,3,100000,'DaPhucVu'),(62,5,40,2,105000,'DaPhucVu'),(63,1,40,1,85000,'DaPhucVu'),(64,1,41,2,95000,'DaPhucVu'),(65,2,42,3,100000,'DaPhucVu'),(66,3,43,1,105000,'DaPhucVu'),(67,4,43,1,110000,'DaPhucVu'),(68,5,44,2,115000,'DaPhucVu'),(69,1,45,3,95000,'DaPhucVu'),(70,2,45,1,100000,'DaPhucVu'),(71,3,46,2,105000,'DaPhucVu'),(72,4,47,2,110000,'DaPhucVu'),(73,5,47,1,115000,'DaPhucVu'),(74,1,48,4,95000,'DaPhucVu'),(75,2,49,2,100000,'DaPhucVu'),(76,3,49,2,105000,'DaPhucVu'),(77,4,50,3,110000,'DaPhucVu'),(78,1,51,3,90000,'DaPhucVu'),(79,2,52,2,95000,'DaPhucVu'),(80,3,52,1,100000,'DaPhucVu'),(81,4,53,2,105000,'DaPhucVu'),(82,5,54,3,110000,'DaPhucVu'),(83,1,55,2,90000,'DaPhucVu'),(84,2,55,2,95000,'DaPhucVu'),(85,3,56,4,100000,'DaPhucVu'),(86,4,57,1,105000,'DaPhucVu'),(87,5,57,2,110000,'DaPhucVu'),(88,1,58,5,90000,'DaPhucVu'),(89,2,59,3,95000,'DaPhucVu'),(90,3,59,1,100000,'DaPhucVu'),(91,4,60,2,105000,'DaPhucVu'),(92,5,60,2,110000,'DaPhucVu'),(120,1,61,40,95000,'DaPhucVu'),(121,2,61,40,100000,'DaPhucVu'),(122,3,61,40,105000,'DaPhucVu'),(123,4,62,30,110000,'DaPhucVu'),(124,5,62,30,115000,'DaPhucVu'),(125,1,63,60,85000,'DaPhucVu'),(126,2,63,60,90000,'DaPhucVu'),(127,3,63,60,95000,'DaPhucVu'),(128,4,63,60,100000,'DaPhucVu'),(129,5,63,60,105000,'DaPhucVu'),(130,1,64,20,85000,'DaPhucVu'),(131,2,64,30,90000,'DaPhucVu'),(132,3,65,25,95000,'DaPhucVu'),(133,4,65,25,100000,'DaPhucVu'),(134,1,66,45,90000,'DaPhucVu'),(135,2,66,45,95000,'DaPhucVu'),(136,3,66,45,100000,'DaPhucVu'),(137,4,66,45,105000,'DaPhucVu'),(138,5,67,50,110000,'DaPhucVu'),(139,1,68,15,95000,'DaPhucVu'),(140,3,68,15,105000,'DaPhucVu'),(141,2,69,20,100000,'DaPhucVu'),(142,4,69,20,110000,'DaPhucVu'),(143,1,70,25,85000,'DaPhucVu'),(144,5,70,25,105000,'DaPhucVu'),(145,2,71,30,95000,'DaPhucVu'),(146,3,71,30,100000,'DaPhucVu'),(147,3,72,15,95000,'DaPhucVu'),(148,4,72,20,100000,'DaPhucVu'),(149,1,73,20,95000,'DaPhucVu'),(150,5,73,15,115000,'DaPhucVu'),(151,2,74,15,95000,'DaPhucVu'),(152,4,74,15,105000,'DaPhucVu'),(153,1,75,10,85000,'DaPhucVu'),(154,2,75,10,90000,'DaPhucVu'),(155,3,75,10,95000,'DaPhucVu'),(156,4,75,10,100000,'DaPhucVu'),(157,5,75,10,105000,'DaPhucVu'),(158,1,76,40,85000,'DaPhucVu'),(159,2,76,40,90000,'DaPhucVu'),(160,4,76,40,100000,'DaPhucVu'),(161,1,77,50,95000,'DaPhucVu'),(162,2,77,50,100000,'DaPhucVu'),(163,3,77,50,105000,'DaPhucVu'),(164,4,77,50,110000,'DaPhucVu'),(165,5,77,40,115000,'DaPhucVu'),(166,1,78,50,90000,'DaPhucVu'),(167,3,78,50,100000,'DaPhucVu'),(168,5,78,40,110000,'DaPhucVu'),(169,1,79,50,90000,'DaPhucVu'),(170,2,79,50,95000,'DaPhucVu'),(171,4,79,50,105000,'DaPhucVu'),(172,3,80,50,100000,'DaPhucVu'),(173,5,80,55,110000,'DaPhucVu'),(174,1,81,40,90000,'DaPhucVu'),(175,3,81,45,100000,'DaPhucVu'),(176,4,81,40,105000,'DaPhucVu'),(177,2,82,40,95000,'DaPhucVu'),(178,5,82,60,110000,'DaPhucVu'),(179,1,83,30,90000,'DaPhucVu'),(180,3,83,30,100000,'DaPhucVu'),(181,4,83,20,105000,'DaPhucVu'),(182,1,84,50,85000,'DaPhucVu'),(183,2,84,50,90000,'DaPhucVu'),(184,3,84,50,95000,'DaPhucVu'),(185,4,85,60,100000,'DaPhucVu'),(186,5,85,60,105000,'DaPhucVu'),(187,1,86,40,85000,'DaPhucVu'),(188,5,86,50,105000,'DaPhucVu'),(189,2,87,60,90000,'DaPhucVu'),(190,3,87,60,95000,'DaPhucVu'),(191,1,88,50,95000,'DaPhucVu'),(192,2,88,50,100000,'DaPhucVu'),(193,3,89,60,105000,'DaPhucVu'),(194,4,89,60,110000,'DaPhucVu'),(195,5,90,60,115000,'DaPhucVu'),(196,1,90,40,95000,'DaPhucVu'),(197,2,91,40,100000,'DaPhucVu'),(198,3,91,40,105000,'DaPhucVu'),(199,4,91,40,110000,'DaPhucVu'),(207,1,3034,2,90000,'DaPhucVu'),(208,1,3035,1,90000,'DaHuy'),(209,2,3035,1,95000,'DaPhucVu'),(210,1,3035,1,90000,'DaHuy'),(211,2,3036,2,95000,'DaPhucVu'),(212,4,3037,2,105000,'DoiLenMon'),(213,1,3038,2,90000,'DoiLenMon'),(214,1,3036,2,90000,'DaHuy'),(215,1,3036,1,90000,'DaPhucVu'),(216,1,3039,1,85000,'GoiMon'),(217,4,3040,2,105000,'DoiLenMon'),(218,4,3041,2,105000,'DoiLenMon'),(219,4,3042,2,105000,'DaHuy'),(220,4,3042,1,105000,'DaPhucVu'),(221,6,3043,2,115000,'DaHuy'),(222,2,3043,1,95000,'DaHuy'),(223,6,3043,1,115000,'DaPhucVu'),(224,1,3044,1,90000,'DoiLenMon'),(225,3,3045,1,100000,'DoiLenMon'),(226,5,3045,1,110000,'DoiLenMon'),(227,14,3046,1,155000,'GoiMon'),(228,27,3046,1,220000,'GoiMon'),(229,9,3047,1,130000,'GoiMon'),(230,6,3047,1,115000,'GoiMon'),(231,1,3048,1,90000,'DoiLenMon'),(232,5,3048,1,110000,'DoiLenMon'),(233,7,3048,1,120000,'DoiLenMon'),(234,29,3048,1,230000,'DoiLenMon'),(235,30,3048,1,235000,'DoiLenMon'),(236,3,3049,1,100000,'DoiLenMon'),(237,3,3049,1,100000,'GoiMon'),(238,6,3049,1,115000,'GoiMon'),(239,2,3052,2,95000,'DaPhucVu'),(240,28,3052,1,225000,'DaPhucVu'),(241,28,3052,1,225000,'DaPhucVu'),(242,2,3052,1,95000,'DaHuy'),(243,5,3053,1,110000,'DoiLenMon'),(244,8,3053,1,125000,'DoiLenMon'),(245,11,3053,1,140000,'DoiLenMon'),(246,1,3054,1,90000,'DaPhucVu'),(247,25,3054,1,210000,'DaPhucVu'),(248,2,3055,1,95000,'DaPhucVu'),(249,3,3055,1,100000,'DaPhucVu'),(250,2,3056,1,100000,'DaPhucVu'),(251,5,3056,1,115000,'DaPhucVu'),(252,22,3056,1,200000,'DaPhucVu');
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
declare v_DonGiaMon int;
declare v_MaChiNhanh int;
select MaChiNhanh into v_MaChiNhanh
from PhieuGoiMon
where MaPhieuGoiMon=new.MaPhieuGoiMon;
select DonGia into v_DonGiaMon
from CungCapThucDon
where MaMonAn=new.MaMonAn and MaChiNhanh=v_MaChiNhanh;
set new.DonGiaMon=v_DonGiaMon;end */;;
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
if new.TinhTrang='GoiMon'
then
    update PhieuGoiMon
    set TinhTrang = 'GoiMon'
    where MaPhieuGoiMon=new.MaPhieuGoiMon;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cap_nhat_tinh_trang_phieu_goi_mon` AFTER UPDATE ON `monduocgoi` FOR EACH ROW BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM MonDuocGoi
        WHERE MaPhieuGoiMon = NEW.MaPhieuGoiMon AND TinhTrang != 'DaHuy'
    ) THEN
        UPDATE PhieuGoiMon SET TinhTrang = 'DaHuy' WHERE MaPhieuGoiMon = NEW.MaPhieuGoiMon;
    ELSEIF NOT EXISTS (
        SELECT 1 FROM MonDuocGoi
        WHERE MaPhieuGoiMon = NEW.MaPhieuGoiMon AND TinhTrang NOT IN ('DaPhucVu', 'DaHuy')
    ) THEN
        UPDATE PhieuGoiMon SET TinhTrang = 'DaPhucVu' WHERE MaPhieuGoiMon = NEW.MaPhieuGoiMon;
    END IF;
END */;;
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
INSERT INTO `nhanvien` VALUES (1,1,'Nguyễn Văn An','0901111111','Q1, TP.HCM','NhanVien','2026-05-12 08:00:00',8000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,2,'Trần Thị Bình','0901111112','Q3, TP.HCM','NhanVien','2026-05-12 08:00:00',7500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,3,'Lê Hoàng Cường','0901111113','Q4, TP.HCM','NhanVien','2026-05-12 14:00:00',6500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,4,'Phạm Mai Dung','0901111114','Q1, TP.HCM','NhanVien','2026-05-12 14:00:00',7000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,5,'Hoàng Trọng Ân','0901111115','Bình Thạnh, TP.HCM','NhanVien','2026-05-12 08:00:00',12000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,6,'Vũ Đức Duy','0902222221','Q3, TP.HCM','NhanVien','2026-05-12 08:00:00',8500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,7,'Đinh Thu Hà','0902222222','Q10, TP.HCM','NhanVien','2026-05-12 08:00:00',7200000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,8,'Bùi Khắc Huy','0902222223','Tân Bình, TP.HCM','NhanVien','2026-05-12 14:00:00',6800000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,9,'Ngô Thanh Hương','0902222224','Q3, TP.HCM','NhanVien','2026-05-12 14:00:00',7000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,10,'Lý Quốc Bảo','0902222225','Phú Nhuận, TP.HCM','NhanVien','2026-05-12 08:00:00',11500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,11,'Tô Tấn Phát','0903333331','Q10, TP.HCM','NhanVien','2026-05-12 08:00:00',8200000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,''),(3,12,'Hồ Ngọc Mai','0903333332','Q5, TP.HCM','NhanVien','2026-05-12 08:00:00',7500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,13,'Đỗ Văn Toàn','0903333333','Q11, TP.HCM','NhanVien','2026-05-12 14:00:00',6700000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,14,'Trịnh Tố Uyên','0903333334','Q10, TP.HCM','NhanVien','2026-05-12 14:00:00',7100000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,15,'Cao Đăng Khoa','0903333335','Tân Phú, TP.HCM','NhanVien','2026-05-12 08:00:00',11000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(1,16,'Trần Trọng Quản','0922334455','Quận 1, TP.HCM','QuanLy','2026-05-23 08:00:00',15000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(2,17,'Lê Thị Điều Hành','0933445566','Quận 10, TP.HCM','QuanLy','2026-05-23 08:00:00',16000000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL),(3,18,'Phạm Minh Trí','0944556677','Thủ Đức, TP.HCM','QuanLy','2026-05-23 08:00:00',15500000,'$2b$12$.amLsBOHcrYXpA1cm/FTpeV2ROhV7c07igkLMmFg8x6idWsYF4vHO',1,NULL);
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
  KEY `phieudatban_ibfk_1` (`MaBanAn`),
  KEY `phieudatban_ibfk_3_idx` (`MaNhanVienPhucVu`),
  CONSTRAINT `phieudatban_ibfk_1` FOREIGN KEY (`MaBanAn`) REFERENCES `banan` (`MaBan`),
  CONSTRAINT `phieudatban_ibfk_2` FOREIGN KEY (`MaNhanVienPhucVu`) REFERENCES `nhanvien` (`MaNhanVien`),
  CONSTRAINT `phieudatban_chk_1` CHECK ((`NgayGioNhanBan` >= `NgayGioTaoPhieu`))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieudatban`
--

LOCK TABLES `phieudatban` WRITE;
/*!40000 ALTER TABLE `phieudatban` DISABLE KEYS */;
INSERT INTO `phieudatban` VALUES (1,1,'2026-05-01 10:00:00','2026-05-01 19:00:00','DaNhanban',103500,'0901234567',1),(2,2,'2026-05-05 09:00:00','2026-05-05 20:00:00','DaNhanban',307500,'0909090909',2),(3,7,'2026-05-10 14:00:00','2026-05-10 18:30:00','DaNhanban',150000,'0911223344',6),(4,8,'2026-05-15 11:00:00','2026-05-15 19:30:00','DaNhanban',174000,'0912345678',7),(5,14,'2026-05-20 15:00:00','2026-05-20 20:00:00','DaNhanban',270000,'0987654321',11),(19,15,'2026-06-13 21:13:20','2026-06-14 15:00:00','ChoNhanBan',0,'0903333331',18),(20,21,'2026-06-13 21:14:27','2026-06-14 16:00:00','ChoNhanBan',112500,'0903333332',18);
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
IF new.NgayGioNhanBan<now() 
THEN
	SIGNAL SQLSTATE '45000' 
	SET MESSAGE_TEXT = 'Thời gian nhận bàn phải sau thời gian hiện tại!';
END IF;
if exists(
	select 1
	from PhieuDatban
	where MaBanAn=new.MaBanAn 
    and abs(timestampdiff(minute,NgayGioNhanBan,new.NgayGioNhanBan))<180 
    and TinhTrang IN ('ChoNhanBan', 'DaNhanBan'))
then
	signal sqlstate '45000' set message_text="Trùng lịch đã có ở bàn hiện tại";
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
IF (NEW.NgayGioNhanBan != OLD.NgayGioNhanBan) OR (NEW.MaBanAn != OLD.MaBanAn) 
THEN
	IF NEW.NgayGioNhanBan <= NOW() 
    THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Thời gian nhận bàn phải sau thời gian hiện tại!';
	END IF;
	if exists(
		select 1
		from PhieuDatban
		where MaBanAn=new.MaBanAn 
			and MaPhieuDatBan!=new.MaPhieuDatBan 
            and  abs(timestampdiff(minute,NgayGioNhanBan,new.NgayGioNhanBan))<180 
            and TinhTrang IN ('ChoNhanBan', 'DaNhanBan'))
	then
			signal sqlstate '45000' set message_text="Trùng lịch đã có ở bàn hiện tại";
	end if;
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
  `MaChiNhanh` int DEFAULT NULL,
  `SDTKhach` char(11) DEFAULT NULL,
  `MaNhanVienPhucVu` int DEFAULT NULL,
  `NgayGioTaoPhieu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DoUuTien` int NOT NULL DEFAULT '0',
  `TinhTrang` enum('GoiMon','DoiLenMon','DaPhucVu','DaHuy','CanThanhToan','DaThanhToan') NOT NULL DEFAULT 'GoiMon',
  PRIMARY KEY (`MaPhieuGoiMon`),
  KEY `phieugoimon_ibfk_1_idx` (`MaBanAn`),
  KEY `phieugoimon_ibfk_2_idx` (`MaNhanVienPhucVu`),
  KEY `phieugoimon_ibfk_3_idx` (`MaChiNhanh`),
  CONSTRAINT `phieugoimon_ibfk_1` FOREIGN KEY (`MaBanAn`) REFERENCES `banan` (`MaBan`),
  CONSTRAINT `phieugoimon_ibfk_2` FOREIGN KEY (`MaNhanVienPhucVu`) REFERENCES `nhanvien` (`MaNhanVien`),
  CONSTRAINT `phieugoimon_ibfk_3` FOREIGN KEY (`MaChiNhanh`) REFERENCES `chinhanh` (`MaChiNhanh`)
) ENGINE=InnoDB AUTO_INCREMENT=3057 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieugoimon`
--

LOCK TABLES `phieugoimon` WRITE;
/*!40000 ALTER TABLE `phieugoimon` DISABLE KEYS */;
INSERT INTO `phieugoimon` VALUES (1,1,1,'0901234567',1,'2026-05-01 19:00:00',0,'DaThanhToan'),(2,2,1,'0909090909',2,'2026-05-05 20:00:00',0,'DaThanhToan'),(3,7,2,'0911223344',3,'2026-05-10 18:30:00',0,'DaThanhToan'),(4,8,2,'0912345678',4,'2026-05-15 19:30:00',0,'DaThanhToan'),(5,14,3,'0987654321',1,'2026-05-20 20:00:00',0,'DaThanhToan'),(6,3,1,NULL,2,'2026-05-02 12:30:00',0,'DaThanhToan'),(7,4,1,'0901234567',3,'2026-05-03 18:00:00',0,'DaThanhToan'),(8,5,1,NULL,4,'2026-05-04 19:15:00',0,'DaThanhToan'),(9,6,1,NULL,1,'2026-05-06 20:30:00',0,'DaThanhToan'),(10,9,2,'0909090909',2,'2026-05-07 11:00:00',0,'DaThanhToan'),(11,10,2,NULL,3,'2026-05-08 13:20:00',0,'DaThanhToan'),(12,11,2,NULL,4,'2026-05-09 19:00:00',0,'DaThanhToan'),(13,12,2,'0911223344',1,'2026-05-11 20:45:00',0,'DaThanhToan'),(14,15,3,NULL,2,'2026-05-12 18:30:00',0,'DaThanhToan'),(15,16,3,NULL,3,'2026-05-13 19:10:00',0,'DaThanhToan'),(16,17,3,'0912345678',4,'2026-05-14 21:00:00',0,'DaThanhToan'),(17,18,3,NULL,1,'2026-05-16 11:30:00',0,'DaThanhToan'),(18,1,1,NULL,2,'2026-05-17 12:45:00',0,'DaThanhToan'),(19,2,1,NULL,3,'2026-05-18 18:20:00',0,'DaThanhToan'),(20,7,2,'0987654321',4,'2026-05-19 19:30:00',0,'DaThanhToan'),(21,8,2,NULL,1,'2026-05-21 20:15:00',0,'DaThanhToan'),(22,14,3,NULL,2,'2026-05-22 18:00:00',0,'DaThanhToan'),(23,15,3,NULL,3,'2026-05-23 19:40:00',0,'DaThanhToan'),(24,3,1,'0901234567',4,'2026-05-24 12:00:00',0,'DaThanhToan'),(25,9,2,NULL,1,'2026-05-25 18:45:00',0,'DaThanhToan'),(26,16,3,NULL,2,'2026-05-26 19:10:00',0,'DaThanhToan'),(27,4,1,NULL,3,'2026-05-27 20:20:00',0,'DaThanhToan'),(28,10,2,'0909090909',4,'2026-05-28 11:15:00',0,'DaThanhToan'),(29,17,3,NULL,1,'2026-05-29 12:30:00',0,'DaThanhToan'),(30,5,1,NULL,2,'2026-05-30 19:00:00',0,'DaThanhToan'),(31,1,1,'0901112222',1,'2026-05-02 11:00:00',0,'DaThanhToan'),(32,2,1,NULL,2,'2026-05-04 12:30:00',0,'DaThanhToan'),(33,3,1,'0903334444',3,'2026-05-06 18:15:00',0,'DaThanhToan'),(34,4,1,NULL,4,'2026-05-09 19:40:00',0,'DaThanhToan'),(35,5,1,'0905556666',1,'2026-05-12 20:00:00',0,'DaThanhToan'),(36,6,1,NULL,2,'2026-05-15 11:30:00',0,'DaThanhToan'),(37,1,1,'0907778888',3,'2026-05-18 12:45:00',0,'DaThanhToan'),(38,2,1,NULL,4,'2026-05-21 18:20:00',0,'DaThanhToan'),(39,3,1,'0909990000',1,'2026-05-24 19:10:00',0,'DaThanhToan'),(40,4,1,NULL,2,'2026-05-28 20:25:00',0,'DaThanhToan'),(41,7,2,'0911112222',3,'2026-05-03 11:15:00',0,'DaThanhToan'),(42,8,2,NULL,4,'2026-05-05 12:40:00',0,'DaThanhToan'),(43,9,2,'0913334444',1,'2026-05-08 18:30:00',0,'DaThanhToan'),(44,10,2,NULL,2,'2026-05-11 19:50:00',0,'DaThanhToan'),(45,11,2,'0915556666',3,'2026-05-14 20:10:00',0,'DaThanhToan'),(46,12,2,NULL,4,'2026-05-17 11:45:00',0,'DaThanhToan'),(47,13,2,'0917778888',1,'2026-05-20 13:00:00',0,'DaThanhToan'),(48,7,2,NULL,2,'2026-05-23 18:40:00',0,'DaThanhToan'),(49,8,2,'0919990000',3,'2026-05-26 19:20:00',0,'DaThanhToan'),(50,9,2,NULL,4,'2026-05-30 20:35:00',0,'DaThanhToan'),(51,14,3,'0921112222',1,'2026-05-02 18:00:00',0,'DaThanhToan'),(52,15,3,NULL,2,'2026-05-07 19:15:00',0,'DaThanhToan'),(53,16,3,'0923334444',3,'2026-05-10 20:30:00',0,'DaThanhToan'),(54,17,3,NULL,4,'2026-05-13 11:45:00',0,'DaThanhToan'),(55,18,3,'0925556666',1,'2026-05-16 13:10:00',0,'DaThanhToan'),(56,19,3,NULL,2,'2026-05-19 18:50:00',0,'DaThanhToan'),(57,20,3,'0927778888',3,'2026-05-22 20:05:00',0,'DaThanhToan'),(58,21,3,NULL,4,'2026-05-25 11:20:00',0,'DaThanhToan'),(59,22,3,'0929990000',1,'2026-05-27 12:35:00',0,'DaThanhToan'),(60,23,3,NULL,2,'2026-05-31 19:00:00',0,'DaThanhToan'),(61,7,2,'0910000001',1,'2026-05-03 10:00:00',1,'DaThanhToan'),(62,8,2,'0910000002',2,'2026-05-03 11:30:00',1,'DaThanhToan'),(63,1,1,'0910000003',3,'2026-05-12 17:00:00',1,'DaThanhToan'),(64,2,1,'0910000004',4,'2026-05-12 18:30:00',1,'DaThanhToan'),(65,3,1,'0910000005',1,'2026-05-12 19:00:00',1,'DaThanhToan'),(66,14,3,'0910000006',2,'2026-05-20 18:00:00',1,'DaThanhToan'),(67,15,3,'0910000007',3,'2026-05-20 19:30:00',1,'DaThanhToan'),(68,9,2,'0910000008',4,'2026-05-15 12:00:00',0,'DaThanhToan'),(69,10,2,'0910000009',1,'2026-05-15 13:00:00',0,'DaThanhToan'),(70,4,1,'0910000010',2,'2026-05-25 18:00:00',0,'DaThanhToan'),(71,19,3,'0910000011',3,'2026-05-25 19:00:00',0,'DaThanhToan'),(72,5,1,'0910000012',4,'2026-05-08 19:00:00',0,'DaThanhToan'),(73,11,2,'0910000013',1,'2026-05-22 19:00:00',0,'DaThanhToan'),(74,20,3,'0910000014',2,'2026-05-28 19:00:00',0,'DaThanhToan'),(75,6,1,'0910000015',3,'2026-05-31 19:00:00',0,'DaThanhToan'),(76,1,1,'0999000111',1,'2026-05-03 18:00:00',1,'DaThanhToan'),(77,7,2,'0999000222',2,'2026-05-12 18:30:00',1,'DaThanhToan'),(78,14,3,'0999000333',3,'2026-05-22 19:00:00',1,'DaThanhToan'),(79,14,3,'0930000001',1,'2026-05-10 18:00:00',1,'DaThanhToan'),(80,15,3,'0930000002',2,'2026-05-10 19:00:00',1,'DaThanhToan'),(81,16,3,'0930000003',3,'2026-05-03 18:30:00',1,'DaThanhToan'),(82,17,3,'0930000004',4,'2026-05-12 19:00:00',1,'DaThanhToan'),(83,18,3,'0930000005',1,'2026-05-31 18:45:00',1,'DaThanhToan'),(84,1,1,'0940000001',1,'2026-05-05 18:00:00',1,'DaThanhToan'),(85,2,1,'0940000002',2,'2026-05-15 19:00:00',1,'DaThanhToan'),(86,3,1,'0940000003',3,'2026-05-22 18:30:00',1,'DaThanhToan'),(87,4,1,'0940000004',4,'2026-05-28 19:30:00',1,'DaThanhToan'),(88,7,2,'0940000005',1,'2026-05-05 18:30:00',1,'DaThanhToan'),(89,8,2,'0940000006',2,'2026-05-15 19:30:00',1,'DaThanhToan'),(90,9,2,'0940000007',3,'2026-05-22 19:00:00',1,'DaThanhToan'),(91,10,2,'0940000008',4,'2026-05-28 20:00:00',1,'DaThanhToan'),(3045,14,3,'0987654321',NULL,'2026-06-13 21:05:23',0,'DoiLenMon'),(3046,17,3,'',NULL,'2026-06-13 21:05:46',0,'GoiMon'),(3047,22,3,'0911223344',NULL,'2026-06-13 21:08:33',0,'GoiMon'),(3048,19,3,NULL,18,'2026-06-13 21:08:57',0,'DoiLenMon'),(3049,24,3,NULL,18,'2026-06-13 21:09:28',0,'GoiMon'),(3052,21,3,NULL,18,'2026-06-13 21:11:19',0,'DaPhucVu'),(3053,21,3,'0903333332',18,'2026-06-14 16:00:00',0,'DoiLenMon'),(3054,16,3,NULL,18,'2026-06-13 21:15:48',0,'DaThanhToan'),(3055,15,3,NULL,18,'2026-06-13 21:16:08',0,'CanThanhToan'),(3056,NULL,2,'0987654321',NULL,'2026-06-13 21:17:18',0,'CanThanhToan');
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cap_nhat_trang_thai_phieu_goi_mon_3` BEFORE UPDATE ON `phieugoimon` FOR EACH ROW begin
if old.MaBanAn is null and new.MaBanAn is null and new.TinhTrang ='DoiLenMon'
then
	set new.TinhTrang='CanThanhToan';
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
  `MaQuanLy` int NOT NULL,
  `MaChiNhanh` int NOT NULL,
  `NgayGioTaoPhieu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GiaTri` int NOT NULL,
  `ThongTinGhiChu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MaNhapKho`),
  KEY `phieunhapkho_ibfk_1_idx` (`MaQuanLy`),
  CONSTRAINT `phieunhapkho_ibfk_1` FOREIGN KEY (`MaQuanLy`) REFERENCES `nhanvien` (`MaNhanVien`),
  CONSTRAINT `phieunhapkho_chk_1` CHECK ((`GiaTri` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieunhapkho`
--

LOCK TABLES `phieunhapkho` WRITE;
/*!40000 ALTER TABLE `phieunhapkho` DISABLE KEYS */;
INSERT INTO `phieunhapkho` VALUES (1,16,1,'2026-05-02 07:00:00',12500000,'Nhập thịt bò & gia vị CN1'),(2,16,1,'2026-05-10 07:30:00',15000000,'Nhập hải sản tươi CN1'),(3,16,1,'2026-05-20 08:00:00',9000000,'Nhập rau củ quả CN1'),(4,16,1,'2026-05-28 07:15:00',18000000,'Nhập bia & nước giải khát CN1'),(5,17,2,'2026-05-05 07:45:00',21000000,'Nhập thịt & hải sản CN2'),(6,17,2,'2026-05-15 08:10:00',14500000,'Nhập rau củ quả CN2'),(7,17,2,'2026-05-25 07:20:00',16000000,'Nhập bia & nước ngọt CN2'),(8,18,3,'2026-05-03 08:30:00',11000000,'Nhập rau củ quả CN3'),(9,18,3,'2026-05-12 07:50:00',25000000,'Nhập tôm hùm, cua hoàng đế CN3'),(10,18,3,'2026-05-22 08:45:00',13500000,'Nhập nước giải khát CN3');
/*!40000 ALTER TABLE `phieunhapkho` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `xac_dinh_chi_nhanh` BEFORE INSERT ON `phieunhapkho` FOR EACH ROW BEGIN
declare v_MaChiNhanh int;
select MaChiNhanh into v_MaChiNhanh
from NhanVien
where MaNhanVien=new.MaQuanLy;
set new.MaChiNhanh=v_MaChiNhanh;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
 1 AS `GiaTri`,
 1 AS `HoTenNhanVien`*/;
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
    WHERE MaPhieuGoiMon = f_MaPhieuGoiMon and TinhTrang != 'DaHuy'  ;
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
in p_SoLuong int,
in p_MaChiNhanh int
)
begin
	declare v_MaPhieuGoiMon int;
    declare v_MaGoiMon int;
    
	select P.MaPhieuGoiMon into v_MaPhieuGoiMon
	from PhieuGoiMon P LEFT JOIN HoaDon HD on P.MaPhieuGoiMon=HD.MaPhieuGoiMon
	where P.SDTKhach=p_SDTKhach  and HD.MaHoaDon is Null and P.MaPhieuGoiMon is not Null 
    AND P.MaChiNhanh = p_MaChiNhanh
    and P.TinhTrang not in ('DaThanhToan','CanThanhToan','DaHuy')
    order by P.MaPhieuGoiMon desc
    limit 1;
    
	if v_MaPhieuGoiMon is null
    then 
		INSERT INTO phieugoimon (MaBanAn, SDTKhach,MaChiNhanh)
		VALUES (null, p_SDTKhach,p_MaChiNhanh);
        set v_MaPhieuGoiMon=last_insert_id();
	end if;
    
	select MaGoiMon into v_MaGoiMon
	from MonDuocGoi
	where MaMonAn=p_MaMonAn and MaPhieuGoiMon=v_MaPhieuGoiMon and TinhTrang ='GoiMon'
    order by MaGoiMon desc
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
	declare v_MaPhieuGoiMon int;
    declare v_MaGoiMon int;
    declare v_MaChiNhanh int;
    
	select P.MaPhieuGoiMon into v_MaPhieuGoiMon
	from PhieuGoiMon P LEFT JOIN HoaDon HD on P.MaPhieuGoiMon=HD.MaPhieuGoiMon
	where P.MaBanAn=p_MaBanAn  and HD.MaHoaDon is Null
    and P.TinhTrang not in ('DaThanhToan','CanThanhToan','DaHuy')
    order by P.MaPhieuGoiMon desc
    limit 1;
    
	if v_MaPhieuGoiMon is null
    then 
        select MaChiNhanh into v_MaChiNhanh
        from BanAn
        where Maban=p_MaBanAn;
		INSERT INTO phieugoimon (MaBanAn, SDTKhach,MaChiNhanh)
		VALUES (p_MaBanAn, p_SDTKhach,v_MaChiNhanh);
        set v_MaPhieuGoiMon=last_insert_id();
	end if;
    
	select MaGoiMon into v_MaGoiMon
	from MonDuocGoi
	where MaMonAn=p_MaMonAn and MaPhieuGoiMon=v_MaPhieuGoiMon and TinhTrang ='GoiMon'
    limit 1;
    if v_MaGoiMon is not null
	then
		if p_SoLuong>0 
        then
			update MonDuocGoi
			set SoLuong=Soluong+p_SoLuong
			where MaGoiMon=v_MaGoiMon;
		else
			delete from MonDuocGoi
            where MaGoiMon=v_MaGoiMon;
		end if;
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
/*!50003 DROP PROCEDURE IF EXISTS `khach_truy_xuat_phieu_goi_mon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `khach_truy_xuat_phieu_goi_mon`(
in p_MaBanAn int, 
in p_sdt char(11)
)
begin
declare v_MaPhieu int;
	select max(MaPhieuGoiMon) into v_MaPhieu
    from ChiTietPhieuGoiMon
    where (p_MaBanAn is null or MaBanAn=p_MaBanAn) 
    and (p_sdt is null or SDTKhach=p_sdt);
    IF v_MaPhieu IS NOT NULL THEN
        SELECT * FROM ChiTietPhieuGoiMon 
        WHERE MaPhieuGoiMon = v_MaPhieu;
    END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nhan_vien_dat_truoc_mon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nhan_vien_dat_truoc_mon`(
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
    declare v_MaChiNhanh int;
    declare v_TienCoc decimal(18,2);
    START TRANSACTION;

	select max(MaPhieuGoiMon) into v_MaPhieuGoiMon
	from DatTruocMon
	where MaPhieuDatBan=p_MaPhieuDatBan;
    
	if v_MaPhieuGoiMon is null
    then
        select MaBanAn, NgayGioNhanBan,SDTKhach into v_MaBanAn,v_NgayGioNhanBan,v_SDTKhach
		from PhieuDatBan
		where MaPhieuDatban=p_MaPhieuDatBan;
        
        select MaChiNhanh into v_MaChiNhanh
        from BanAn
        where Maban=v_MaBanAn;

		INSERT INTO phieugoimon (MaBanAn, NgayGioTaoPhieu, SDTKhach,MaNhanVienPhucVu,MaChiNhanh,TinhTrang)
		VALUES (v_MaBanAn, v_NgayGioNhanBan, v_SDTKhach,p_MaNV,v_MaChiNhanh,'DoiLenMon');
		set v_MaPhieuGoiMon=last_insert_id();
        INSERT INTO dattruocmon (MaPhieuDatBan, MaPhieuGoiMon) 
		VALUES (p_MaPhieuDatBan, v_MaPhieuGoiMon);
	end if;
    
	select MaGoiMon into v_MaGoiMon
	from MonDuocGoi
	where MaMonAn=p_MaMonAn and MaPhieuGoiMon=v_MaPhieuGoiMon and TinhTrang ='DoiLenMon'
    limit 1;
    if v_MaGoiMon is not null
	then
		if p_SoLuong>0 
        then
			update MonDuocGoi
			set SoLuong=Soluong+p_SoLuong
			where MaGoiMon=v_MaGoiMon;
		else
			delete from MonDuocGoi
            where MaGoiMon=v_MaGoiMon;
		end if;
	else 
		insert into MonDuocGoi (MaPhieuGoiMon,MaMonAn,SoLuong,TinhTrang)
		values (v_MaPhieuGoiMon,p_MaMonAn,p_SoLuong,'DoiLenMon');
	end if; 
    
    set v_TienCoc = gia_tri_phieu_goi_mon(v_MaPhieuGoiMon) * 0.3;
    update PhieuDatBan
    set TienCoc = v_TienCoc
    where MaPhieuDatBan = p_MaPhieuDatBan;
    select v_TienCoc;
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
	declare v_MaPhieuGoiMon int;
    declare v_MaGoiMon int;
    declare v_MaChiNhanh int;
    
	select P.MaPhieuGoiMon into v_MaPhieuGoiMon
	from PhieuGoiMon P LEFT JOIN HoaDon HD on P.MaPhieuGoiMon=HD.MaPhieuGoiMon
	where P.MaBanAn=p_MaBanAn  and HD.MaHoaDon is Null
    and P.TinhTrang not in ('DaThanhToan','CanThanhToan','DaHuy')
    order by P.MaPhieuGoiMon desc
    limit 1;
    
	if v_MaPhieuGoiMon is null
    then
        select MaChiNhanh into v_MaChiNhanh
        from BanAn
        where MaBan=p_MaBanAn; 
		INSERT INTO phieugoimon (MaBanAn, SDTKhach,MaNhanVienPhucVu,MaChiNhanh,TinhTrang)
		VALUES (p_MaBanAn, p_SDTKhach,p_MaNV,v_MaChiNhanh,'DoiLenMon');
		set v_MaPhieuGoiMon=last_insert_id();
	else
        UPDATE PhieuGoiMon 
        SET TinhTrang = 'DoiLenMon' 
        WHERE MaPhieuGoiMon = v_MaPhieuGoiMon 
          AND TinhTrang NOT IN ('GoiMon', 'DoiLenMon'); 
    end if;
    
	select MaGoiMon into v_MaGoiMon
	from MonDuocGoi
	where MaMonAn=p_MaMonAn and MaPhieuGoiMon=v_MaPhieuGoiMon and TinhTrang ='DoiLenMon'
    limit 1;
    if v_MaGoiMon is not null
	then
		if p_SoLuong>0 
        then
			update MonDuocGoi
			set SoLuong=Soluong+p_SoLuong
			where MaGoiMon=v_MaGoiMon;
		else
			delete from MonDuocGoi
            where MaGoiMon=v_MaGoiMon;
		end if;
	else 
		insert into MonDuocGoi (MaPhieuGoiMon,MaMonAn,SoLuong,TinhTrang)
		values (v_MaPhieuGoiMon,p_MaMonAn,p_SoLuong,'DoiLenMon');
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
    set TinhTrang='DoiLenMon'
    where MaPhieuGoiMon=p_MaPhieuGoiMon and TinhTrang='GoiMon';
    update PhieuGoiMon
    set TinhTrang = 'DoiLenMon'
    where MaPhieuGoiMon=p_MaPhieuGoiMon;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nv_truy_xuat_phieu_goi_mon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nv_truy_xuat_phieu_goi_mon`(
in p_MaBanAn int, 
in p_sdt char(11),
in p_TinhTrang varchar(30),
in p_ThanhToan int
)
begin
declare v_MaPhieu int;
	select *
    from ChiTietPhieuGoiMon
    where (p_MaBanAn is null or MaBanAn=p_MaBanAn) 
    and (p_sdt is null or SDTKhach=p_sdt) 
    and (p_TinhTrang is null or TinhTrangPhieuGoiMon =p_TinhTrang )
    AND (
          DATE(NgayGioTaoPhieu) = CURDATE() 
          OR TinhTrangPhieuGoiMon NOT IN ('DaThanhToan', 'DaHuy')
      )
    ORDER BY MaPhieuGoiMon DESC;
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
    select last_insert_id() as MaPhieuDatBan;
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
	declare v_GiaTriHoaDon double;
	set v_GiaTriHoaDon=gia_tri_phieu_goi_mon(p_MaPhieuGoiMon);
    INSERT INTO HoaDon (MaPhieuGoiMon, MaNhanVien, GiaTri, PhuongThucThanhToan)
    VALUES (p_MaPhieuGoiMon, p_MaNV, v_GiaTriHoaDon, p_PTThanhToan);
END ;;
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
in p_sdt char(11)
)
begin
declare v_MaPhieu int;
	select max(MaPhieuGoiMon) into v_MaPhieu
    from ChiTietPhieuGoiMon
    where (p_MaBanAn is null or MaBanAn=p_MaBanAn) 
    and (p_sdt is null or SDTKhach=p_sdt);
    IF v_MaPhieu IS NOT NULL THEN
        SELECT * FROM ChiTietPhieuGoiMon 
        WHERE MaPhieuGoiMon = v_MaPhieu;
    END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `chitietphieudatban`
--

/*!50001 DROP VIEW IF EXISTS `chitietphieudatban`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `chitietphieudatban` AS select `pdb`.`MaPhieuDatBan` AS `MaPhieuDatBan`,`pdb`.`MaBanAn` AS `MaBanAn`,`pdb`.`NgayGioNhanBan` AS `NgayGioNhanBan`,`pdb`.`TinhTrang` AS `TinhTrang`,`pdb`.`TienCoc` AS `TienCoc`,`pdb`.`SDTKhach` AS `SDTKhach`,`dtm`.`MaPhieuGoiMon` AS `MaPhieuGoiMon`,`pdb`.`MaNhanVienPhucVu` AS `MaNhanVienPhucVu` from (`phieudatban` `pdb` left join `dattruocmon` `dtm` on((`pdb`.`MaPhieuDatBan` = `dtm`.`MaPhieuDatBan`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `chitietphieugoimon` AS select `p`.`MaChiNhanh` AS `MaChiNhanh`,`ba`.`MaBan` AS `MaBanAn`,`p`.`MaPhieuGoiMon` AS `MaPhieuGoiMon`,`p`.`NgayGioTaoPhieu` AS `NgayGioTaoPhieu`,`p`.`SDTKhach` AS `SDTKhach`,`p`.`TinhTrang` AS `TinhTrangPhieuGoiMon`,`mdg`.`MaGoiMon` AS `MaGoiMon`,`ma`.`TenMon` AS `TenMon`,`mdg`.`SoLuong` AS `SoLuong`,`mdg`.`DonGiaMon` AS `DonGiaMon`,(`mdg`.`SoLuong` * `mdg`.`DonGiaMon`) AS `ThanhTien`,`mdg`.`TinhTrang` AS `TinhTrangGoiMon` from ((((`monan` `ma` join `monduocgoi` `mdg` on((`ma`.`MaMon` = `mdg`.`MaMonAn`))) join `phieugoimon` `p` on((`mdg`.`MaPhieuGoiMon` = `p`.`MaPhieuGoiMon`))) left join `banan` `ba` on((`p`.`MaBanAn` = `ba`.`MaBan`))) left join `hoadon` `hd` on((`p`.`MaPhieuGoiMon` = `hd`.`MaPhieuGoiMon`))) order by `ba`.`MaChiNhanh`,`ba`.`MaBan` */;
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
/*!50001 VIEW `tongkethoadon` AS select `p`.`MaChiNhanh` AS `MaChiNhanh`,`hd`.`MaHoaDon` AS `MaHoaDon`,`hd`.`NgayGioTaoHoaDon` AS `NgayGioTaoHoaDon`,`p`.`MaPhieuGoiMon` AS `MaPhieuGoiMon`,`hd`.`GiaTri` AS `GiaTri`,`nv`.`HoTen` AS `HoTenNhanVien` from ((`hoadon` `hd` join `phieugoimon` `p` on((`hd`.`MaPhieuGoiMon` = `p`.`MaPhieuGoiMon`))) join `nhanvien` `nv` on((`hd`.`MaNhanVien` = `nv`.`MaNhanVien`))) order by `p`.`MaChiNhanh`,`hd`.`NgayGioTaoHoaDon` */;
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
/*!50001 VIEW `tongketkinhphi` AS select `p`.`MaChiNhanh` AS `MaChiNhanh`,`p`.`MaNhapKho` AS `MaNhapKho`,`p`.`NgayGioTaoPhieu` AS `NgayGioTaoPhieu`,`p`.`GiaTri` AS `GiaTri`,`nv`.`MaNhanVien` AS `MaNhanVien`,`nv`.`HoTen` AS `HoTenNhanVien` from (`phieunhapkho` `p` join `nhanvien` `nv` on((`p`.`MaQuanLy` = `nv`.`MaNhanVien`))) */;
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

-- Dump completed on 2026-06-13 21:22:58
