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
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `bno` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `writer` varchar(20) NOT NULL,
  `view_cnt` int DEFAULT '0',
  `comment_cnt` int DEFAULT '0',
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `up_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'배송 교환반품 안내','1.제품 수령후 7일 이후 주문건은 교환/반품이 불가능 합니다.\r\n\r\n2.제품 파손, 품질 저하 등 이유로 교환/반품이 제한 될 수 있습니다\r\n\r\n3.잘못된 보관, 부주의 파손은 교환/ 환불이 불가능 합니다','admin',2,0,'2022-11-30 01:26:46','2022-11-30 01:26:46'),(2,'재입고 공지','오프라인 매장 확장을 준비하며\r\n\r\n일부 품목이 품절되어 \r\n\r\n2022년 3월 초부터 순차적으로 재입고 될 예정이오니 \r\n\r\n양해 부탁드립니다','admin',1,0,'2022-11-30 01:29:28','2022-11-30 01:29:28'),(3,'거래처 휴가에 따른 배송 안내 공지','기간:12월 11일 - 12월  17일\r\n\r\n거래처의 휴가기간으로 제품입고가 월활하지 \r\n못해 배송이 지연될 수 있습니다','admin',2,0,'2022-11-30 01:34:20','2022-11-30 01:34:20'),(4,'주문 마감시간 변경 안내','[변경전]\r\n오전 11시까지 결제완료시\r\n당일출고 익일백송\r\n\r\n[변경후]\r\n오전 9시까지 결제완료시\r\n당일출고 익일배송','admin',8,0,'2022-11-30 01:35:52','2022-11-30 01:35:52'),(5,'택배사 변경 안내','2023년 1월 부터 택배사가 변경 됩니다\r\n\r\n[변경전]\r\n우체국 택배\r\n\r\n[변경후]\r\ncj대한통운','admin',17,0,'2022-11-30 01:37:08','2022-11-30 01:37:08');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-05  8:00:19
