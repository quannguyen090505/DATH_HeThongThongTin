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
INSERT INTO `banan` VALUES (1,1,'DangSuDung','Tang 1',4),(2,1,'DangSuDung','Tang 1',4),(3,1,'BanTrong','Tang 1',4),(4,1,'BanTrong','Tang 1',4),(5,1,'BanTrong','Tang 1',4),(6,1,'BanTrong','Tang 1',4),(7,2,'BanTrong','Tang 1',4),(8,2,'BanTrong','Tang 1',4),(9,2,'BanTrong','Tang 1',4),(10,2,'BanTrong','Tang 1',4),(11,2,'BanTrong','Tang 1',4),(12,2,'BanTrong','Tang 1',4),(13,2,'BanTrong','Tang 1',4),(14,3,'BanTrong','Tang 1',4),(15,3,'BanTrong','Tang 1',4),(16,3,'BanTrong','Tang 1',4),(17,3,'BanTrong','Tang 1',4),(18,3,'BanTrong','Tang 1',4),(19,3,'BanTrong','Tang 2',4),(20,3,'BanTrong','Tang 2',4),(21,3,'BanTrong','Tang 2',4),(22,3,'BanTrong','Tang 2',4),(23,3,'BanTrong','Tang 2',4),(24,3,'BanTrong','Tang 1',4);
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
  PRIMARY KEY (`MaChiNhanh`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chinhanh`
--

LOCK TABLES `chinhanh` WRITE;
/*!40000 ALTER TABLE `chinhanh` DISABLE KEYS */;
INSERT INTO `chinhanh` VALUES (1,'Quận 1, TP. HCM','1111','1111@gmail.com','ConCho','2026-05-12 08:00:00'),(2,'Quận 3, TP. HCM','222','222@gmail.com','ConCho','2026-05-12 08:00:00'),(3,'Quận 10, TP. HCM','333','333@gmail.com','ConCho','2026-05-12 08:00:00');
/*!40000 ALTER TABLE `chinhanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cungcapthucdon`
--

DROP TABLE IF EXISTS `cungcapthucdon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cungcapthucdon` (
  `MaChiNhanh` int NOT NULL,
  `MaMonAn` int NOT NULL,
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
INSERT INTO `cungcapthucdon` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,2),(1,3),(2,3),(3,3),(1,4),(2,4),(3,4),(1,5),(2,5),(3,5),(1,6),(2,6),(3,6),(1,7),(2,7),(3,7),(1,8),(2,8),(3,8),(1,9),(2,9),(3,9),(1,10),(2,10),(3,10),(1,11),(2,11),(3,11),(1,12),(2,12),(3,12),(1,13),(2,13),(3,13),(1,14),(2,14),(3,14),(1,15),(2,15),(3,15),(1,16),(2,16),(3,16),(1,17),(2,17),(3,17),(1,18),(2,18),(3,18),(1,19),(2,19),(3,19),(1,20),(2,20),(3,20),(1,21),(2,21),(3,21),(1,22),(2,22),(3,22),(1,23),(2,23),(3,23),(1,24),(2,24),(3,24),(1,25),(2,25),(3,25);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
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
    
    set v_GiaTriHoaDon =  gia_tri_phi_goi_mon(new.MaPhieuGoiMon);
    
    select SDTKhach into v_SDTKhach
    from PhieuGoiMon
    where MaPhieu=new.MaPhieuGoiMon;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cap_nhat_trang_thai_ban_2` AFTER INSERT ON `hoadon` FOR EACH ROW begin
	update BanAn
    set TinhTrangSuDung="DaThanhToan"
    where MaBan=(
	select MaBanAn
    from PhieuGoiMon
    where MaPhieuGoiMon=new.MaPhieuGoiMon
    );
end */;;
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
  `DonGia` int NOT NULL DEFAULT '0',
  `MaTheLoai` int DEFAULT NULL,
  `ThongTinMoTa` varchar(30) DEFAULT NULL,
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
INSERT INTO `monan` VALUES (1,'Thịt Kho Tộ',55000,1,'Thịt heo kho tiêu đâm đà'),(2,'Cá Lóc Kho Tộ',65000,1,'Cá lóc đồng kho mặn ngọt'),(3,'Gà Chiên Nước Mắm',75000,1,'Cánh gà chiên giòn rụm'),(4,'Sườn Xào Chua Ngọt',85000,1,'Sườn non xào vị chua ngọt'),(5,'Đậu Hũ Nhồi Thịt',45000,1,'Đậu hũ chiên nhồi thịt băm'),(6,'Lẩu Thái Hải Sản',250000,2,'Lẩu chua cay tôm mực'),(7,'Lẩu Bò Nấm',220000,2,'Lẩu bò Mỹ nấm kim châm'),(8,'Lẩu Gà Lá Giang',200000,2,'Lẩu gà ta nấu lá giang'),(9,'Lẩu Cá Diêu Hồng',180000,2,'Lẩu cá tươi sống rau xanh'),(10,'Lẩu Cua Đồng',190000,2,'Lẩu cua đồng miền Tây'),(11,'Cơm Chiên Hải Sản',65000,3,'Cơm chiên tôm mực'),(12,'Cơm Chiên Dưa Bò',70000,3,'Cơm chiên thịt bò dưa chua'),(13,'Cơm Tấm Sườn Bì',50000,3,'Cơm tấm sườn nướng mỡ hành'),(14,'Cơm Gà Xối Mỡ',60000,3,'Cơm gà xối mỡ tỏi gòn'),(15,'Cơm Trắng',15000,3,'Cơm gạo dẻo thơm'),(16,'Hàu Nướng Phô Mai',90000,4,'Hàu Pháp nướng thơm béo'),(17,'Mực Nướng Sa Tế',120000,4,'Mực ống nguyên con nướng cay'),(18,'Sườn Nướng Tảng',150000,4,'Sườn non nướng BBQ'),(19,'Bạch Tuộc Nướng',110000,4,'Bạch tuộc ướp sa tế'),(20,'Bò Nướng Lá Lốt',85000,4,'Bò cuộn lá lốt nướng mỡ chài'),(21,'Trà Đá',5000,5,'Trà đá mát lạnh'),(22,'Nước Suối Lavie',15000,5,'Nước khoáng đóng chai'),(23,'Nước Ép Dưa Hấu',35000,5,'Nước ép trái cây tươi'),(24,'Trà Đào Cam Sả',40000,5,'Trà đào giải nhiệt mùa hè'),(25,'Bia Heineken',25000,5,'Bia lon 330ml');
/*!40000 ALTER TABLE `monan` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monduocgoi`
--

LOCK TABLES `monduocgoi` WRITE;
/*!40000 ALTER TABLE `monduocgoi` DISABLE KEYS */;
INSERT INTO `monduocgoi` VALUES (2,2,4,1,65000,'DoiLenMon');
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
    where MaMonAn=new.MaMonAn and TinhTrang='GoiMon';
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
-- Table structure for table `nguoiquanly`
--

DROP TABLE IF EXISTS `nguoiquanly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoiquanly` (
  `MaNguoiQuanLy` int NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(30) NOT NULL,
  `MatKhau` varchar(30) NOT NULL,
  `MaSoThue` char(12) NOT NULL,
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
  `MaNhanVien` int NOT NULL AUTO_INCREMENT,
  `MaChiNhanh` int NOT NULL,
  `HoTen` varchar(30) NOT NULL,
  `SDT` char(11) NOT NULL,
  `DiaChi` varchar(30) NOT NULL,
  `CaLam` datetime NOT NULL,
  `Luong` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaNhanVien`),
  KEY `nhanvien_ibfk_1` (`MaChiNhanh`),
  CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`MaChiNhanh`) REFERENCES `chinhanh` (`MaChiNhanh`),
  CONSTRAINT `nhanvien_chk_1` CHECK ((`Luong` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,1,'Nguyễn Văn An','0901111111','Q1, TP.HCM','2026-05-12 08:00:00',8000000),(2,1,'Trần Thị Bình','0901111112','Q3, TP.HCM','2026-05-12 08:00:00',7500000),(3,1,'Lê Hoàng Cường','0901111113','Q4, TP.HCM','2026-05-12 14:00:00',6500000),(4,1,'Phạm Mai Dung','0901111114','Q1, TP.HCM','2026-05-12 14:00:00',7000000),(5,1,'Hoàng Trọng Ân','0901111115','Bình Thạnh, TP.HCM','2026-05-12 08:00:00',12000000),(6,2,'Vũ Đức Duy','0902222221','Q3, TP.HCM','2026-05-12 08:00:00',8500000),(7,2,'Đinh Thu Hà','0902222222','Q10, TP.HCM','2026-05-12 08:00:00',7200000),(8,2,'Bùi Khắc Huy','0902222223','Tân Bình, TP.HCM','2026-05-12 14:00:00',6800000),(9,2,'Ngô Thanh Hương','0902222224','Q3, TP.HCM','2026-05-12 14:00:00',7000000),(10,2,'Lý Quốc Bảo','0902222225','Phú Nhuận, TP.HCM','2026-05-12 08:00:00',11500000),(11,3,'Tô Tấn Phát','0903333331','Q10, TP.HCM','2026-05-12 08:00:00',8200000),(12,3,'Hồ Ngọc Mai','0903333332','Q5, TP.HCM','2026-05-12 08:00:00',7500000),(13,3,'Đỗ Văn Toàn','0903333333','Q11, TP.HCM','2026-05-12 14:00:00',6700000),(14,3,'Trịnh Tố Uyên','0903333334','Q10, TP.HCM','2026-05-12 14:00:00',7100000),(15,3,'Cao Đăng Khoa','0903333335','Tân Phú, TP.HCM','2026-05-12 08:00:00',11000000);
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
  `TinhTrang` enum('GoiMon','ChoLenMon','DaPhucVu') NOT NULL DEFAULT 'GoiMon',
  PRIMARY KEY (`MaPhieuGoiMon`),
  KEY `phieugoimon_ibfk_1_idx` (`MaBanAn`),
  KEY `phieugoimon_ibfk_2_idx` (`MaNhanVienPhucVu`),
  KEY `phieugoimon_ibfk_3_idx` (`SDTKhach`),
  CONSTRAINT `phieugoimon_ibfk_1` FOREIGN KEY (`MaBanAn`) REFERENCES `banan` (`MaBan`),
  CONSTRAINT `phieugoimon_ibfk_2` FOREIGN KEY (`MaNhanVienPhucVu`) REFERENCES `nhanvien` (`MaNhanVien`),
  CONSTRAINT `phieugoimon_ibfk_3` FOREIGN KEY (`SDTKhach`) REFERENCES `khach` (`SDT`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieugoimon`
--

LOCK TABLES `phieugoimon` WRITE;
/*!40000 ALTER TABLE `phieugoimon` DISABLE KEYS */;
INSERT INTO `phieugoimon` VALUES (4,1,NULL,NULL,'2026-05-12 16:59:09',0,'GoiMon');
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
  `MaTheLoai` int NOT NULL AUTO_INCREMENT,
  `TenTheLoai` varchar(30) DEFAULT NULL,
  `ThongTinMota` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MaTheLoai`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theloaimon`
--

LOCK TABLES `theloaimon` WRITE;
/*!40000 ALTER TABLE `theloaimon` DISABLE KEYS */;
INSERT INTO `theloaimon` VALUES (1,'Món Mặn','Các món ăn chính với cơm'),(2,'Món Lẩu','Lẩu các loại cho nhiều người'),(3,'Cơm','Cơm chiên và cơm truyền thống'),(4,'Món Nướng','Hải sản và thịt nướng tẩm ướp'),(5,'Thức Uống','Nước giải khát và bia');
/*!40000 ALTER TABLE `theloaimon` ENABLE KEYS */;
UNLOCK TABLES;

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
CREATE DEFINER=`root`@`localhost` FUNCTION `gia_tri_phieu_goi_mon`(MaPhieuAn int) RETURNS decimal(18,2)
    DETERMINISTIC
BEGIN
    DECLARE v_Tong DECIMAL(18,2);
    SELECT SUM(gm.SoLuongMon * ma.DonGia) INTO v_Tong
    FROM GoiMon as GM JOIN MonAn as MA ON GM.MaMon = MA.MaMon
    WHERE GM.MaPhieu = MaPhieuAn;
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
	where P.SDTKhach=p_SDTKhach  and HD.MaHoaDon is Null and P.MaHoaDon is Null
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
		where MaGoiMon=p_MaGoiMon;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `them_mon_moi`(in p_TenMon varchar(30),
in p_DonGia int,
in p_ThongTinMoTa varchar(30),
in p_MaTheLoai int,
in p_MaChiNhanh int
)
begin 
	insert into MonAn(TenMon,DonGia,MaTheLoai,ThongTinMoTa) 
    value(p_TenMon,p_DonGia,p_MaTheLoai,p_ThongTinMoTa);
    if p_MaChiNhanh is not Null
    then
		insert into cungcapthucdon
		values(p_MaChiNhanh,last_insert_id());
	end if;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `truy_xuat_ds_nv`( in p_MaChiNhanh int)
begin
	select *
    from DSNhanVien
    where MaChiNhanh=p_MaChiNhanh;
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
    where MaBanAn=p_MaBanAn 
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
/*!50001 VIEW `chitietphieugoimon` AS select `ba`.`MaBan` AS `MaBanAn`,`p`.`MaPhieuGoiMon` AS `MaPhieuGoiMon`,`p`.`TinhTrang` AS `TinhTrangPhieuGoiMon`,`ma`.`TenMon` AS `TenMon`,`mdg`.`SoLuong` AS `SoLuong`,`mdg`.`DonGiaMon` AS `DonGiaMon`,(`mdg`.`SoLuong` * `mdg`.`DonGiaMon`) AS `ThanhTien`,`mdg`.`TinhTrang` AS `TinhTrang`,(case when (`hd`.`MaHoaDon` is null) then false else true end) AS `ThanhToan` from ((((`monan` `ma` join `monduocgoi` `mdg` on((`ma`.`MaMon` = `mdg`.`MaMonAn`))) join `phieugoimon` `p` on((`mdg`.`MaPhieuGoiMon` = `p`.`MaPhieuGoiMon`))) join `banan` `ba` on((`p`.`MaBanAn` = `ba`.`MaBan`))) left join `hoadon` `hd` on((`p`.`MaPhieuGoiMon` = `hd`.`MaPhieuGoiMon`))) */;
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
/*!50001 VIEW `dsnhanvien` AS select `cn`.`MaChiNhanh` AS `MaChiNhanh`,`nv`.`HoTen` AS `HoTen`,`nv`.`SDT` AS `SDT`,`nv`.`DiaChi` AS `DiaChi`,`nv`.`CaLam` AS `CaLam`,`nv`.`Luong` AS `Luong` from (`nhanvien` `nv` join `chinhanh` `cn` on((`nv`.`MaChiNhanh` = `cn`.`MaChiNhanh`))) */;
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

-- Dump completed on 2026-05-14 11:13:18
