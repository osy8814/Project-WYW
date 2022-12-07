-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: wyw
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_state` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_fee` int NOT NULL,
  `use_point` int NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_order_fk_idx` (`user_id`),
  CONSTRAINT `user_order_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('admin_202211291147','admin','admin','1','1','1','010-1111-1111','주문취소',0,0,'2022-11-29 23:11:47'),('admin_202211303517','admin','admin','13480','경기 성남시 분당구 대왕판교로 477','주소테스트','010-1111-1111','배송진행',0,0,'2022-11-30 01:35:17'),('admin_202211303819','admin','admin','13480','경기 성남시 분당구 대왕판교로 477','주소테스트','010-1111-1111','주문취소',3000,0,'2022-11-30 14:38:19'),('admin_202211305525','admin','admin','13480','경기 성남시 분당구 대왕판교로 477','주소테스트','010-1111-1111','배송진행',0,0,'2022-11-30 02:55:25'),('admin_202212025159','admin','admin','13480','경기 성남시 분당구 대왕판교로 477','주소테스트','010-1111-1111','배송진행',0,0,'2022-12-02 03:51:59'),('admin_202212052605','admin','admin','13480','경기 성남시 분당구 대왕판교로 477','주소테스트','011-1111-1111','배송준비',0,0,'2022-12-05 16:26:05'),('admin_202212060916','admin','admin','13480','경기 성남시 분당구 대왕판교로 477','주소테스트','011-1111-1111','배송준비',0,0,'2022-12-06 14:09:16'),('admin_202212060948','수취인1','admin','13529','경기 성남시 분당구 판교역로 지하 160','수취정보','010-3333-3333','배송준비',0,0,'2022-12-06 14:09:48'),('anhj91_202211300051','안효진','anhj91','28473','충북 청주시 흥덕구 사운로 283','5-2','010-3171-9053','주문취소',0,0,'2022-11-30 21:00:51'),('anhj91_202211305818','안효진','anhj91','28473','충북 청주시 흥덕구 사운로 283','5-2','010-3171-9053','배송준비',0,0,'2022-11-30 20:58:18'),('edcosy11_202211302532','누구든','edcosy11','28204','충북 청주시 상당구 가덕면 가덕시동길 10','11','010-1234-5478','배송진행',0,0,'2022-11-30 15:25:32'),('osy8814_202212055302','오승영','osy8814','28456','충북 청주시 흥덕구 신봉동 4','목화아파트','010-1355-1355','배송진행',0,0,'2022-12-05 09:53:02'),('osy8814_202212055631','오승영','osy8814','28456','충북 청주시 흥덕구 신봉동 4','목화아파트','010-1355-1355','배송준비',0,0,'2022-12-05 11:56:31'),('osy8814_202212055702','오승영','osy8814','28456','충북 청주시 흥덕구 신봉동 4','목화아파트','010-1355-1355','배송준비',0,0,'2022-12-05 11:57:02'),('osy8814_202212063716','오승영','osy8814','28456','충북 청주시 흥덕구 신봉동 4','목화아파트','010-1355-1355','배송준비',0,0,'2022-12-06 13:37:16');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-07 10:04:15
