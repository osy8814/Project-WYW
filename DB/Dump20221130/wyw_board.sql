-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: wyw
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `bno` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `writer` varchar(20) NOT NULL,
  `view_cnt` int DEFAULT '0',
  `comment_cnt` int unsigned DEFAULT '0',
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `up_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=6772 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (6300,'title1','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6301,'title2','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6302,'title3','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6303,'title4','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6304,'title5','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6305,'title6','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6306,'title7','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6307,'title8','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6308,'title9','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6309,'title10','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6310,'title11','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6311,'title12','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6312,'title13','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6313,'title14','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6314,'title15','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6315,'title16','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6316,'title17','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6317,'title18','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6318,'title19','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6319,'title20','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6320,'title21','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6321,'title22','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6322,'title23','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6323,'title24','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6324,'title25','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6325,'title26','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6326,'title27','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6327,'title28','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6328,'title29','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6329,'title30','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6330,'title31','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6331,'title32','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6332,'title33','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6333,'title34','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6334,'title35','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6335,'title36','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6336,'title37','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6337,'title38','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6338,'title39','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6339,'title40','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6340,'title41','no content','asdf',0,0,'2022-11-11 10:32:18','2022-11-11 10:32:18'),(6341,'title42','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6342,'title43','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6343,'title44','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6344,'title45','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6345,'title46','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6346,'title47','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6347,'title48','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6348,'title49','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6349,'title50','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6350,'title51','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6351,'title52','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6352,'title53','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6353,'title54','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6354,'title55','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6355,'title56','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6356,'title57','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6357,'title58','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6358,'title59','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6359,'title60','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6360,'title61','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6361,'title62','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6362,'title63','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6363,'title64','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6364,'title65','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6365,'title66','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6366,'title67','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6367,'title68','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6368,'title69','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6369,'title70','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6370,'title71','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6371,'title72','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6372,'title73','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6373,'title74','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6374,'title75','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6375,'title76','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6376,'title77','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6377,'title78','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6378,'title79','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6379,'title80','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6380,'title81','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6381,'title82','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6382,'title83','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6383,'title84','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6384,'title85','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6385,'title86','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6386,'title87','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6387,'title88','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6388,'title89','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6389,'title90','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6390,'title91','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6391,'title92','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6392,'title93','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6393,'title94','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6394,'title95','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6395,'title96','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6396,'title97','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6397,'title98','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6398,'title99','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6399,'title100','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6400,'title101','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6401,'title102','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6402,'title103','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6403,'title104','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6404,'title105','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6405,'title106','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6406,'title107','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6407,'title108','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6408,'title109','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6409,'title110','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6410,'title111','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6411,'title112','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6412,'title113','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6413,'title114','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6414,'title115','no content','asdf',1,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6415,'title116','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6416,'title117','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6417,'title118','no content','asdf',1,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6418,'title119','no content','asdf',1,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6419,'title120','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6420,'title121','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6421,'title122','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6422,'title123','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6423,'title124','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6424,'title125','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6425,'title126','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6426,'title127','no content','asdf',0,0,'2022-11-11 10:32:19','2022-11-11 10:32:19'),(6427,'title128','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6428,'title129','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6429,'title130','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6430,'title131','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6431,'title132','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6432,'title133','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6433,'title134','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6434,'title135','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6435,'title136','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6436,'title137','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6437,'title138','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6438,'title139','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6439,'title140','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6440,'title141','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6441,'title142','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6442,'title143','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6443,'title144','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6444,'title145','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6445,'title146','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6446,'title147','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6447,'title148','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6448,'title149','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6449,'title150','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6450,'title151','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6451,'title152','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6452,'title153','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6453,'title154','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6454,'title155','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6455,'title156','no content','asdf',1,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6456,'title157','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6457,'title158','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6458,'title159','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6459,'title160','no content','asdf',1,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6460,'title161','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6461,'title162','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6462,'title163','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6463,'title164','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6464,'title165','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6465,'title166','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6466,'title167','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6467,'title168','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6468,'title169','no content','asdf',1,2,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6469,'title170','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6470,'title171','no content','asdf',3,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6471,'title172','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6472,'title173','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6473,'title174','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6474,'title175','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6475,'title176','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6476,'title177','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6477,'title178','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6478,'title179','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6479,'title180','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6480,'title181','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6481,'title182','no content','asdf',1,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6482,'title183','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6483,'title184','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6484,'title185','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6485,'title186','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6486,'title187','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6487,'title188','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6488,'title189','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6489,'title190','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6490,'title191','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6491,'title192','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6492,'title193','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6493,'title194','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6494,'title195','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6495,'title196','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6496,'title197','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6497,'title198','no content','asdf',3,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6498,'title199','no content','asdf',2,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6499,'title200','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6500,'title201','no content','asdf',1,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6501,'title202','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6502,'title203','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6503,'title204','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6504,'title205','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6505,'title206','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6506,'title207','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6507,'title208','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6508,'title209','no content','asdf',0,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6509,'title210','no content','asdf',2,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6510,'title211','no content','asdf',8,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6511,'title212','no content','asdf',2,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6512,'title213','no content','asdf',3,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6513,'title214','no content','asdf',2,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6514,'title215','no content','asdf',1,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6515,'title216','no content','asdf',3,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6516,'title217','no content','asdf',1,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6517,'title218','no content','asdf',2,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6518,'title219','no content','asdf',5,0,'2022-11-11 10:32:20','2022-11-11 10:32:20'),(6519,'title220','no content','asdf',17,0,'2022-11-11 10:32:20','2022-11-14 17:02:34'),(6520,'1234','asd','asdf',44,0,'2022-11-14 10:46:37','2022-11-14 10:46:37'),(6521,'안녕하세요?','방가워요','asdf',123,0,'2022-11-14 12:10:47','2022-11-14 12:10:47'),(6522,'점심','돈가스','asdf',46,0,'2022-11-14 12:22:07','2022-11-14 12:22:07'),(6523,'ㅇㄹㄴㅇㄹ','','asdf',84,0,'2022-11-14 12:30:54','2022-11-14 12:30:54'),(6524,'강아지 ','고양이','asdf',7,0,'2022-11-14 15:24:16','2022-11-14 15:24:16'),(6525,'강아지1','','asdf',11,0,'2022-11-14 15:29:54','2022-11-14 15:29:54'),(6526,'강아지 ','고양이','asdf',4,0,'2022-11-14 15:36:15','2022-11-14 15:36:15'),(6527,'강아지1','고양이','asdf',36,0,'2022-11-14 15:36:32','2022-11-14 15:36:32'),(6528,'2222','222','asdf',9,0,'2022-11-14 15:56:19','2022-11-14 15:56:19'),(6529,'강아지 키우고 싶다','고양이','asdf',53,0,'2022-11-14 16:02:08','2022-11-14 16:15:27'),(6530,'커피','아메리카노','asdf',27,0,'2022-11-14 16:18:05','2022-11-14 16:18:05'),(6531,'아메리카노','커피','asdf',136,9,'2022-11-14 16:23:41','2022-11-14 16:52:43'),(6532,'사과','과수원','asdf1',5,0,'2022-11-18 17:30:18','2022-11-18 17:30:18'),(6533,'바람','윈터','asdf1',16,0,'2022-11-18 17:30:46','2022-11-18 17:30:46'),(6771,'123213213','2121321321ㅇㄴㄹㄴㅇㄹㄴㄹㅇㄴㄹ','admin',6,0,'2022-11-22 13:37:40','2022-11-22 14:16:46');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-30  3:03:01
