-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dersyonetimsistemi
-- ------------------------------------------------------
-- Server version	5.1.73-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `akademisyan_has_yetki`
--

DROP TABLE IF EXISTS `akademisyan_has_yetki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akademisyan_has_yetki` (
  `akademisyan_akademisyenNo` varchar(10) COLLATE utf8_turkish_ci NOT NULL,
  `yetki_yetkiId` int(11) NOT NULL,
  KEY `fk_akademisyan_has_yetki_akademisyan1_idx` (`akademisyan_akademisyenNo`),
  KEY `fk_akademisyan_has_yetki_yetki1_idx` (`yetki_yetkiId`),
  CONSTRAINT `fk_akademisyan_has_yetki_akademisyan1` FOREIGN KEY (`akademisyan_akademisyenNo`) REFERENCES `akademisyen` (`akademisyenNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_akademisyan_has_yetki_yetki1` FOREIGN KEY (`yetki_yetkiId`) REFERENCES `yetki` (`yetkiId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akademisyan_has_yetki`
--

LOCK TABLES `akademisyan_has_yetki` WRITE;
/*!40000 ALTER TABLE `akademisyan_has_yetki` DISABLE KEYS */;
INSERT INTO `akademisyan_has_yetki` VALUES ('a11122333 ',0),('a14788654',0),('a10055555 ',1),('a80090741',1),('a21222222',2),('a1222388 ',0),('a12145869 ',0),('a11111111',3),('a95050123',0),('a12144511',0),('a77882000',0),('a25463333',0),('a31212121',0),('s15151515',0);
/*!40000 ALTER TABLE `akademisyan_has_yetki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `akademisyen`
--

DROP TABLE IF EXISTS `akademisyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akademisyen` (
  `akademisyenNo` varchar(10) COLLATE utf8_turkish_ci NOT NULL,
  `akademisyenAd` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `akademisyenSoyad` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `akademisyenSifre` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `akademisyenEposta` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `akademisyenCepTel` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `akademisyenIsTel` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `bolum_bolumId` int(11) NOT NULL,
  `pasifMi` bit(1) NOT NULL,
  PRIMARY KEY (`akademisyenNo`),
  KEY `fk_akademisyan_bolum1_idx` (`bolum_bolumId`),
  CONSTRAINT `fk_akademisyan_bolum1` FOREIGN KEY (`bolum_bolumId`) REFERENCES `bolum` (`bolumId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akademisyen`
--

LOCK TABLES `akademisyen` WRITE;
/*!40000 ALTER TABLE `akademisyen` DISABLE KEYS */;
INSERT INTO `akademisyen` VALUES ('a10055555 ','Bünyamin','Karabulut','654321','bunyamin.karabulut@bil.omu.edu.tr','53255501022','03622251158',1,'\0'),('a11111111','Ahmet','Atik','12345','ahmet@gmail.com','52122311223','1996',1,''),('a11122333 ','Recai','Oktaş','123456','roktas@bil.omu.edu.tr','05334578921','3622145879',1,'\0'),('a12144511','Kerem','Erzurumlu','12345','kerem@linux.org.tr','05315147215','1189',1,'\0'),('a12145869 ','Erhan','Ergün','12345','erhan.ergun@bil.omu.edu.tr','05389745261','03629631245',1,'\0'),('a1222388 ','İsmail','İşeri','12345','ismail.iseri@bil.omu.edu.tr','05324789966','03627891245',1,'\0'),('a14788654','Nurettin','Şenyer','54321','seyyah@bil.omu.edu.tr','53255501022','3622145879',1,'\0'),('a21222222','Temel','Reis','12345','temel@gmail.com','05315142214','05315142214',2,'\0'),('a25463333','Çağatay','Turhan','ça25463333tu','cagtay@gmail.com','53155522211','5555',11,'\0'),('a31212121','Esin','Hazneci','es31212121ha','esin@hotmail.com','55555555555','1111',11,'\0'),('a77882000','Mustafa','Yapıcı','mu77882000ya','mustafa@gmail.com','05621112255','1788',11,'\0'),('a80090741','Birol','Elevli','12345','birol@gmail.com','53255501022','03622251157',4,'\0'),('a95050123','Sedat','Akleylek','12345','sedat.akleylek@bil.omu.edu.tr','05621112255','1989',1,''),('s15151515','Gökhan','Kayhan','gö15151515ka','gokhan.kayhan@bil.omu.edu.tr','53255501022','5511',1,'');
/*!40000 ALTER TABLE `akademisyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bolum`
--

DROP TABLE IF EXISTS `bolum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bolum` (
  `bolumId` int(11) NOT NULL,
  `bolumAd` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`bolumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bolum`
--

LOCK TABLES `bolum` WRITE;
/*!40000 ALTER TABLE `bolum` DISABLE KEYS */;
INSERT INTO `bolum` VALUES (1,'Bilgisayar Mühendisliği'),(2,'Çevre Mühendisliği'),(3,'Elektrik ve Elektronik Mühendisliği '),(4,'Endüstri Mühendisliği'),(5,'Gıda Mühendisliği'),(6,'Harita Mühendisliği'),(7,'İnşaat Mühendisliği'),(8,'Kimya Mühendisliği'),(9,'Makina Mühendisliği'),(10,'Malzeme Bilimi Mühendisliği'),(11,'Diğer Bölümler');
/*!40000 ALTER TABLE `bolum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bolumbilgileri`
--

DROP TABLE IF EXISTS `bolumbilgileri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bolumbilgileri` (
  `bolumBilgiId` int(11) NOT NULL AUTO_INCREMENT,
  `bolumAd` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `ogretimUyesi` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `ders` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `dersAtama` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `dersProgrami` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `durum` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `donemId` int(11) NOT NULL,
  PRIMARY KEY (`bolumBilgiId`),
  KEY `donem` (`donemId`),
  CONSTRAINT `donem` FOREIGN KEY (`donemId`) REFERENCES `donem` (`donemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bolumbilgileri`
--

LOCK TABLES `bolumbilgileri` WRITE;
/*!40000 ALTER TABLE `bolumbilgileri` DISABLE KEYS */;
/*!40000 ALTER TABLE `bolumbilgileri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ders`
--

DROP TABLE IF EXISTS `ders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ders` (
  `dersId` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `dersAd` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `dersKredi` int(11) DEFAULT NULL,
  `pratikDersSaati` int(11) DEFAULT NULL,
  `teorikDersSaati` int(11) DEFAULT NULL,
  `labDersSaati` int(11) DEFAULT NULL,
  `bolum_bolumId` int(11) NOT NULL,
  `ders_Yil` int(11) NOT NULL,
  `donem_donemAd` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `secmeliMi` bigint(20) NOT NULL,
  `labVarMi` bit(1) DEFAULT NULL,
  PRIMARY KEY (`dersId`),
  KEY `fk_ders_bolum1_idx` (`bolum_bolumId`),
  CONSTRAINT `fk_ders_bolum1` FOREIGN KEY (`bolum_bolumId`) REFERENCES `bolum` (`bolumId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ders`
--

LOCK TABLES `ders` WRITE;
/*!40000 ALTER TABLE `ders` DISABLE KEYS */;
INSERT INTO `ders` VALUES ('BIL101','Bilgisayar Mühendisliğine Giriş ',3,0,3,0,1,1,NULL,0,NULL),('BIL103','Programlamaya Giriş',4,0,3,2,1,1,NULL,0,''),('BIL105','Fizik1',4,0,3,2,1,1,NULL,0,''),('BIL107','Matematik1',4,0,4,0,1,1,NULL,0,NULL),('BIL121','Ayrık Matematik',3,0,3,0,1,1,NULL,0,NULL),('BIL201','Algoritmalar',3,0,3,0,1,2,'1',0,NULL),('BIL206','Sayısal Tas. ve Mantıksal Dev.',3,0,3,0,1,2,'1',0,NULL),('BIL210','Veri Yapıları',3,0,3,0,1,2,NULL,0,NULL),('BIL215','Nesne Yönelimli Programlama',4,0,3,2,1,2,'2',0,''),('BIL252','Sayısal Çözümleme',3,0,3,0,1,2,NULL,0,NULL),('BIL301','Sistem Programlama',3,0,3,2,1,3,'1',0,''),('BIL303','Veri Tabanı Yönetim Sistemi',4,0,3,2,1,3,'2',0,''),('BIL335','Web Teknolojileri',3,0,3,0,1,3,'1',1,NULL),('BIL353','Yöneylem Araştırması',3,0,3,0,1,3,'1',1,NULL),('BIL404','Bilgisayar Ağları',3,0,3,0,1,4,'2',0,NULL),('BIL430','Bilgisayarlı Görüye Giriş',3,0,3,0,1,4,NULL,1,NULL),('BIL435','Programlamada Özel Konular ',3,0,3,0,1,4,NULL,0,NULL),('END205','Mühendislik Uygulaması',3,0,3,0,4,2,NULL,0,NULL),('END430','Mühendislik Ekonomisi',3,0,3,0,4,4,NULL,0,NULL),('INS202','Statik Hesaplama',4,0,4,0,7,2,'1',0,NULL);
/*!40000 ALTER TABLE `ders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ders_has_akademisyan`
--

DROP TABLE IF EXISTS `ders_has_akademisyan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ders_has_akademisyan` (
  `dersAkId` int(11) NOT NULL AUTO_INCREMENT,
  `ders_dersId` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `akademisyan_akademisyenNo` varchar(10) COLLATE utf8_turkish_ci NOT NULL,
  `donem_donemId` int(11) DEFAULT NULL,
  PRIMARY KEY (`dersAkId`),
  KEY `fk_ders_has_akademisyan_ders1_idx` (`ders_dersId`),
  KEY `fk_ders_has_akademisyan_akademisyan1_idx` (`akademisyan_akademisyenNo`),
  KEY `fk_ders_has_akademisyan_donem1_idx` (`donem_donemId`),
  CONSTRAINT `fk_ders_has_akademisyan_akademisyan1` FOREIGN KEY (`akademisyan_akademisyenNo`) REFERENCES `akademisyen` (`akademisyenNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ders_has_akademisyan_ders1` FOREIGN KEY (`ders_dersId`) REFERENCES `ders` (`dersId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ders_has_akademisyan_donem1` FOREIGN KEY (`donem_donemId`) REFERENCES `donem` (`donemId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ders_has_akademisyan`
--

LOCK TABLES `ders_has_akademisyan` WRITE;
/*!40000 ALTER TABLE `ders_has_akademisyan` DISABLE KEYS */;
INSERT INTO `ders_has_akademisyan` VALUES (36,'BIL105','a25463333',3),(37,'BIL107','a77882000',3),(38,'BIL353','a31212121',3),(39,'BIL303','a10055555 ',3),(40,'BIL301','a11122333 ',3),(41,'BIL101','a12144511',3),(42,'BIL206','a12145869 ',3),(43,'BIL335','a1222388 ',3),(44,'BIL210','a14788654',3),(45,'BIL121','a12144511',3),(46,'BIL103','a14788654',3),(47,'BIL301','a12144511',3);
/*!40000 ALTER TABLE `ders_has_akademisyan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ders_has_ogrenci`
--

DROP TABLE IF EXISTS `ders_has_ogrenci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ders_has_ogrenci` (
  `ogrenci_ogrenciNo` varchar(10) COLLATE utf8_turkish_ci NOT NULL,
  `ders_dersId` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`ogrenci_ogrenciNo`,`ders_dersId`),
  KEY `fk_ders_has_ogrenci_ogrenci1_idx` (`ogrenci_ogrenciNo`),
  KEY `fk_ders_has_ogrenci_ders1_idx` (`ders_dersId`),
  CONSTRAINT `fk_ders_has_ogrenci_ders1` FOREIGN KEY (`ders_dersId`) REFERENCES `ders` (`dersId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ders_has_ogrenci_ogrenci1` FOREIGN KEY (`ogrenci_ogrenciNo`) REFERENCES `ogrenci` (`ogrenciNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ders_has_ogrenci`
--

LOCK TABLES `ders_has_ogrenci` WRITE;
/*!40000 ALTER TABLE `ders_has_ogrenci` DISABLE KEYS */;
/*!40000 ALTER TABLE `ders_has_ogrenci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ders_has_sinif`
--

DROP TABLE IF EXISTS `ders_has_sinif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ders_has_sinif` (
  `ders_dersId` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `sinif_sinifId` int(11) NOT NULL,
  KEY `fk_ders_has_sinif_ders1_idx` (`ders_dersId`),
  KEY `fk_ders_has_sinif_sinif1_idx` (`sinif_sinifId`),
  CONSTRAINT `fk_ders_has_sinif_ders1` FOREIGN KEY (`ders_dersId`) REFERENCES `ders` (`dersId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ders_has_sinif_sinif1` FOREIGN KEY (`sinif_sinifId`) REFERENCES `sinif` (`sinifId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ders_has_sinif`
--

LOCK TABLES `ders_has_sinif` WRITE;
/*!40000 ALTER TABLE `ders_has_sinif` DISABLE KEYS */;
/*!40000 ALTER TABLE `ders_has_sinif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dersprogrami`
--

DROP TABLE IF EXISTS `dersprogrami`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dersprogrami` (
  `sinif_sinifId` int(11) NOT NULL,
  `ders_dersId` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `saat_saatId` int(11) NOT NULL,
  `gun_gunId` int(11) NOT NULL,
  `donem_donemId` int(11) NOT NULL,
  `akademisyenNo` varchar(9) COLLATE utf8_turkish_ci NOT NULL,
  `labDersiMi` int(1) DEFAULT NULL,
  KEY `sinif_fk` (`sinif_sinifId`),
  KEY `saat_fk` (`saat_saatId`),
  KEY `donem_fk` (`donem_donemId`),
  KEY `gun_fk` (`gun_gunId`),
  KEY `ders_fk` (`ders_dersId`),
  KEY `akademsiyen_fk` (`akademisyenNo`),
  CONSTRAINT `akademsiyen_fk` FOREIGN KEY (`akademisyenNo`) REFERENCES `ders_has_akademisyan` (`akademisyan_akademisyenNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ders_fk` FOREIGN KEY (`ders_dersId`) REFERENCES `ders_has_akademisyan` (`ders_dersId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `donem_fk` FOREIGN KEY (`donem_donemId`) REFERENCES `donem` (`donemId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gun_fk` FOREIGN KEY (`gun_gunId`) REFERENCES `gun` (`gunId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `saat_fk` FOREIGN KEY (`saat_saatId`) REFERENCES `saat` (`saatId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sinif_fk` FOREIGN KEY (`sinif_sinifId`) REFERENCES `sinif` (`sinifId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dersprogrami`
--

LOCK TABLES `dersprogrami` WRITE;
/*!40000 ALTER TABLE `dersprogrami` DISABLE KEYS */;
INSERT INTO `dersprogrami` VALUES (7,'BIL101',2,5,3,'a12144511',0),(7,'BIL101',3,5,3,'a12144511',0),(7,'BIL101',4,5,3,'a12144511',0),(5,'BIL121',5,1,3,'a12144511',0),(5,'BIL121',6,1,3,'a12144511',0),(5,'BIL121',7,1,3,'a12144511',0),(5,'BIL103',2,1,3,'a14788654',0),(5,'BIL103',3,1,3,'a14788654',0),(5,'BIL103',4,1,3,'a14788654',0),(5,'BIL105',2,2,3,'a25463333',0),(5,'BIL105',3,2,3,'a25463333',0),(5,'BIL105',4,2,3,'a25463333',0),(5,'BIL107',5,5,3,'a77882000',0),(5,'BIL107',6,5,3,'a77882000',0),(5,'BIL107',7,5,3,'a77882000',0),(5,'BIL107',8,5,3,'a77882000',0),(5,'BIL206',2,3,3,'a12145869',0),(5,'BIL206',3,3,3,'a12145869',0),(5,'BIL206',4,3,3,'a12145869',0),(8,'BIL301',2,2,3,'a11122333',0),(8,'BIL301',3,2,3,'a11122333',0),(9,'BIL301',4,2,3,'a11122333',0),(12,'BIL103',5,2,3,'a14788654',0),(12,'BIL103',6,2,3,'a14788654',0),(5,'BIL103',6,2,3,'a14788654',1),(5,'BIL103',5,2,3,'a14788654',1);
/*!40000 ALTER TABLE `dersprogrami` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donem`
--

DROP TABLE IF EXISTS `donem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donem` (
  `donemId` int(11) NOT NULL AUTO_INCREMENT,
  `donemAd` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `akademikYil` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `aktifMi` bit(1) DEFAULT NULL,
  PRIMARY KEY (`donemId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donem`
--

LOCK TABLES `donem` WRITE;
/*!40000 ALTER TABLE `donem` DISABLE KEYS */;
INSERT INTO `donem` VALUES (1,'Güz','2014-2015','\0'),(2,'Bahar','2014-2015','\0'),(3,'Güz','2015-2016',''),(4,'Bahar','2015-2016','\0'),(5,'Güz','2016-2017','\0');
/*!40000 ALTER TABLE `donem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dosya`
--

DROP TABLE IF EXISTS `dosya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dosya` (
  `dosyaId` int(11) NOT NULL AUTO_INCREMENT,
  `dosyaAd` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dosyaYolu` text COLLATE utf8_turkish_ci,
  `ders_dersId` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dosyaHakkindaAciklama` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dosyaTipi` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`dosyaId`),
  KEY `fk_dosya_ders1_idx` (`ders_dersId`),
  CONSTRAINT `fk_dosya_ders1` FOREIGN KEY (`ders_dersId`) REFERENCES `ders` (`dersId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosya`
--

LOCK TABLES `dosya` WRITE;
/*!40000 ALTER TABLE `dosya` DISABLE KEYS */;
INSERT INTO `dosya` VALUES (24,'Deneme','../bitirmeProje2/belgeler/06-Lifecycle-Listeners.pdf','BIL252','deneme','.pdf'),(25,'Deneme','../bitirmeProje2/belgeler/06-Lifecycle-Listeners.pdf','BIL252','deneme','.pdf'),(26,'edde','../bitirmeProje2/belgeler/5.docx','BIL303','eeded','.docx'),(27,'abc','../bitirmeProje2/belgeler/downloadfile-5.pdf','BIL252','abcdefeg','.pdf'),(31,'Deneme','../bitirmeProje2/belgeler/BitirmeProje.pdf','BIL303','deneme','.pdf');
/*!40000 ALTER TABLE `dosya` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duyuru`
--

DROP TABLE IF EXISTS `duyuru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duyuru` (
  `duyuruId` int(11) NOT NULL AUTO_INCREMENT,
  `duyuruKonuBaslik` text COLLATE utf8_turkish_ci,
  `duyuruMesaj` text COLLATE utf8_turkish_ci,
  PRIMARY KEY (`duyuruId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duyuru`
--

LOCK TABLES `duyuru` WRITE;
/*!40000 ALTER TABLE `duyuru` DISABLE KEYS */;
INSERT INTO `duyuru` VALUES (1,'23 Nisan Hakkında','23 Nisan saat 11 de Atatürk Kongre Merkezinde şöyleşi vardır. Tüm öğrencilerimiz ve akademisyenler davetlidir. '),(2,'Ders Yönetim Sistemi Hakkında','Sistem en iyi duruma getirilecektir'),(3,'Bitirme Projeleri Hakkında','Bitirme projeleri için afiş hazırlanması 1 haftada yapılmalıdır.'),(4,'Deneme','Deneme Deneme'),(5,'Sayısal Çöz Sınav hakkında','Sınav tarihi değişti...'),(6,'Deneme','Bu bir denemedir..'),(7,'Bitirme Projesi Sergi Hk.','Yarın saat 09:00 da Bilgisayar Mühendisliği bölüm yerinde proje sergisi olacaktır. Tüm öğrencilerimiz davetllidir.'),(8,'Mühendislik hk','Yarın saat 13.00 konferans salonunda seminer vardır.'),(9,'19 Mayıs hk.','19 Mayıs gençlik ve spor bayramı kutlu olsun'),(10,'Sistem Bilgileri','Sistem bilgileri en yakın zamanda düzenlenecektir.'),(11,'Bitirme Projesi','Bitirme Sunumları Tez Sunumları yarın yapılacaktır');
/*!40000 ALTER TABLE `duyuru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gun`
--

DROP TABLE IF EXISTS `gun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gun` (
  `gunId` int(11) NOT NULL AUTO_INCREMENT,
  `gunAd` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`gunId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gun`
--

LOCK TABLES `gun` WRITE;
/*!40000 ALTER TABLE `gun` DISABLE KEYS */;
INSERT INTO `gun` VALUES (1,'Pazartesi'),(2,'Salı'),(3,'Çarşamba'),(4,'Perşembe'),(5,'Cuma');
/*!40000 ALTER TABLE `gun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogrenci`
--

DROP TABLE IF EXISTS `ogrenci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogrenci` (
  `ogrenciNo` varchar(10) COLLATE utf8_turkish_ci NOT NULL,
  `ogrenciAd` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrenciSoyad` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrenciSifre` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrenciEposta` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ogrenciCepTel` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `bolum_bolumId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ogrenciNo`),
  KEY `fk_ogrenci_bolum_idx` (`bolum_bolumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogrenci`
--

LOCK TABLES `ogrenci` WRITE;
/*!40000 ALTER TABLE `ogrenci` DISABLE KEYS */;
INSERT INTO `ogrenci` VALUES ('o10060215','İlkin','Zeynallı','12345','ilkin.zeynalli@bil.omu.edu.tr','05066066606',1),('o11060280','Fatih','Çelikel','12345','fatih.celikel@bil.omu.edu.tr','05352135757',1),('o12060122','Ali','Veli','12345','adnan@gmail.com',NULL,1),('o12060717','Ufuk','Palavar','12345','ufuk.palavar@bil.omu.edu.tr','05315141450',1),('o12060719','Salim','Özata','12345','salim@bil.omu.edu.tr','null',1);
/*!40000 ALTER TABLE `ogrenci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saat`
--

DROP TABLE IF EXISTS `saat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saat` (
  `saatId` int(11) NOT NULL AUTO_INCREMENT,
  `saatAd` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`saatId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saat`
--

LOCK TABLES `saat` WRITE;
/*!40000 ALTER TABLE `saat` DISABLE KEYS */;
INSERT INTO `saat` VALUES (1,'8:15/9:00'),(2,'9:15/10:00'),(3,'10:15/11:00'),(4,'11:15/12:00'),(5,'13:00/13:45'),(6,'14:00/14:45'),(7,'15:00/15:45'),(8,'16:00/16:45');
/*!40000 ALTER TABLE `saat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinif`
--

DROP TABLE IF EXISTS `sinif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sinif` (
  `sinifId` int(11) NOT NULL,
  `sinifAd` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `kapasite` int(11) NOT NULL,
  `labMi` bit(1) NOT NULL,
  PRIMARY KEY (`sinifId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinif`
--

LOCK TABLES `sinif` WRITE;
/*!40000 ALTER TABLE `sinif` DISABLE KEYS */;
INSERT INTO `sinif` VALUES (1,'MF100',100,'\0'),(2,'MF101',100,'\0'),(3,'MF102',100,'\0'),(4,'MF103',100,'\0'),(5,'MF104',100,'\0'),(6,'MF105',100,'\0'),(7,'MF106',70,'\0'),(8,'MF107',70,'\0'),(9,'MF108',70,'\0'),(10,'MF109',70,'\0'),(11,'MF110',70,'\0'),(12,'L19/R19',70,'');
/*!40000 ALTER TABLE `sinif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinif_has_bolum`
--

DROP TABLE IF EXISTS `sinif_has_bolum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sinif_has_bolum` (
  `bolum_bolumId` int(11) NOT NULL,
  `sinif_sinifId` int(11) NOT NULL,
  KEY `fk_sinif_has_bolum_bolum1_idx` (`bolum_bolumId`),
  KEY `fk_sinif_has_bolum_sinif1_idx` (`sinif_sinifId`),
  CONSTRAINT `fk_sinif_has_bolum_bolum1` FOREIGN KEY (`bolum_bolumId`) REFERENCES `bolum` (`bolumId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sinif_has_bolum_sinif1` FOREIGN KEY (`sinif_sinifId`) REFERENCES `sinif` (`sinifId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinif_has_bolum`
--

LOCK TABLES `sinif_has_bolum` WRITE;
/*!40000 ALTER TABLE `sinif_has_bolum` DISABLE KEYS */;
/*!40000 ALTER TABLE `sinif_has_bolum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yetki`
--

DROP TABLE IF EXISTS `yetki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yetki` (
  `yetkiId` int(11) NOT NULL,
  `yetkiAd` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`yetkiId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yetki`
--

LOCK TABLES `yetki` WRITE;
/*!40000 ALTER TABLE `yetki` DISABLE KEYS */;
INSERT INTO `yetki` VALUES (0,'Normal'),(1,'Bölüm Başkanı'),(2,'Admin'),(3,'Süper Admin');
/*!40000 ALTER TABLE `yetki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dersyonetimsistemi'
--

--
-- Dumping routines for database 'dersyonetimsistemi'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_AkademisyenDers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AkademisyenDers`(
IN akNo varchar(9), 
IN akDersId VARCHAR(45)
)
Select akademisyenAd,akademisyenSoyad,dersAd,ders_has_akademisyan.donem_donemId FROM donem, akademisyen,ders,ders_has_akademisyan WHERE akademisyenNo = akNo AND ders_has_akademisyan.akademisyan_akademisyenNo = akNo AND dersId = akDersId and ders_has_akademisyan.ders_dersId = akDersId and donemId = ders_has_akademisyan.donem_donemId ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_kontrol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_kontrol`(
IN akNo varchar(9), 
IN sifre VARCHAR(45)
)
Select akademisyenAd,akademisyenSoyad,akademisyenNo,akademisyenSifre,akademisyenEposta,akademisyenCepTel,akademisyenIsTel,bolum_bolumId,yetki_yetkiId from akademisyen,akademisyan_has_yetki   WHERE akademisyenNo = akNo and akademisyenSifre = sifre AND akademisyan_akademisyenNo=akNo ;;
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

-- Dump completed on 2015-06-08 16:09:32
