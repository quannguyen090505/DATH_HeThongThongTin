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
  CONSTRAINT `banan_chk_1` CHECK ((`SoLuongChoNgoi` >= 0))
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
  `MaChiNhanh` int NOT NULL AUTO_INCREMENT,
  `DiaChi` varchar(30) DEFAULT NULL,
  `SDT` char(11) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `TinhTrangQuan` enum('ConCho','HetCho') DEFAULT 'ConCho',
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
  `MaChiNhanh` int NOT NULL,
  `MaMonAn` int NOT NULL,
  PRIMARY KEY (`MaChiNhanh`,`MaMonAn`),
  KEY `cungcapthucdon_ibfk_2_idx` (`MaMonAn`),
  CONSTRAINT `cungcapthucdon_ibfk_1` FOREIGN KEY (`MaChiNhanh`) REFERENCES `chinhanh` (`MaChiNhanh`),
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
  `MaGoiMon` int NOT NULL AUTO_INCREMENT,
  `MaMonAn` int NOT NULL,
  `MaPhieuGoiMon` int NOT NULL,
  `SoLuong` int DEFAULT '0',
  `DonGiaMon` int NOT NULL DEFAULT '0',
  `TinhTrang` enum('GoiMon','ChoLenMon','DaPhucVu') NOT NULL DEFAULT 'GoiMon',
  PRIMARY KEY (`MaGoiMon`),
  KEY `goimon_ibfk_2_idx` (`MaPhieuGoiMon`),
  KEY `goimon_ibfk_1` (`MaMonAn`),
  CONSTRAINT `goimon_ibfk_1` FOREIGN KEY (`MaMonAn`) REFERENCES `monan` (`MaMon`) ON UPDATE CASCADE,
  CONSTRAINT `goimon_ibfk_2` FOREIGN KEY (`MaPhieuGoiMon`) REFERENCES `phieugoimon` (`MaPhieuGoiMon`) ON UPDATE CASCADE,
  CONSTRAINT `monduocgoi_chk_2` CHECK ((`SoLuong` >= 0))
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieugoimon`
--

LOCK TABLES `phieugoimon` WRITE;
/*!40000 ALTER TABLE `phieugoimon` DISABLE KEYS */;
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
/*!50003 DROP PROCEDURE IF EXISTS `khach_goi_mon_mang_ve` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `khach_goi_mon_mang_ve`(
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
		update MonDuocGoi
		set SoLuong=Soluong+p_SoLuong
		where MaGoiMon=p_MaGoiMon;
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
		update MonDuocGoi
		set SoLuong=Soluong+p_SoLuong
		where MaGoiMon=p_MaGoiMon;
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
/*!50003 DROP PROCEDURE IF EXISTS `nhan_vien_goi_mon_dat_truoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nhan_vien_goi_mon_dat_truoc`(
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
		update MonDuocGoi
		set SoLuong=Soluong+p_SoLuong
		where MaGoiMon=p_MaGoiMon;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-12  1:46:31
