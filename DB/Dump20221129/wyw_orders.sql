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
INSERT INTO `orders` VALUES ('2022_test1','test','admin','test','test','test','010-1234-1234','배송준비',0,1000,'2022-11-26 18:48:00'),('admin_202211260142','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:01:42'),('admin_202211260300','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:03:00'),('admin_2022112610','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-26 21:10:24'),('admin_2022112611','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-26 21:11:05'),('admin_2022112612','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 21:12:07'),('admin_202211261404','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 21:14:04'),('admin_202211261423','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-26 21:14:23'),('admin_202211261432','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 21:14:32'),('admin_202211261445','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 21:14:45'),('admin_202211261512','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-26 21:15:12'),('admin_202211261518','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-26 21:15:18'),('admin_202211261527','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 21:15:27'),('admin_202211261535','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 21:15:35'),('admin_202211262221','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 22:22:21'),('admin_202211262228','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 22:22:28'),('admin_202211262428','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 22:24:28'),('admin_202211262723','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 21:27:23'),('admin_202211262838','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 22:28:38'),('admin_202211262857','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 22:28:57'),('admin_202211262909','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 22:29:09'),('admin_202211262922','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 22:29:22'),('admin_202211263458','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 22:34:58'),('admin_202211263811','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 22:38:11'),('admin_202211263948','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:39:48'),('admin_202211263950','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 22:39:50'),('admin_202211264008','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:40:08'),('admin_202211264311','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:43:11'),('admin_202211264319','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:43:19'),('admin_202211264328','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:43:28'),('admin_202211264340','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:43:40'),('admin_202211264436','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:44:36'),('admin_202211264512','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:45:12'),('admin_202211264522','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 22:45:22'),('admin_202211264839','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:48:39'),('admin_202211264855','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:48:55'),('admin_202211264905','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:49:05'),('admin_202211265139','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 22:51:39'),('admin_202211265229','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:52:29'),('admin_202211265239','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:52:39'),('admin_202211265310','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 23:53:10'),('admin_202211265330','admin','admin','1','1','1','-null-null','배송준비',0,0,'2022-11-26 22:53:30'),('admin_202211270108','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 00:01:08'),('admin_202211270130','admin','admin','1','1','1','-null-null','주문취소',3000,0,'2022-11-27 02:01:30'),('admin_202211270812','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 00:08:12'),('admin_202211270905','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 00:09:05'),('admin_202211271222','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 01:12:22'),('admin_202211271227','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 01:12:27'),('admin_202211271310','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 01:13:10'),('admin_202211271607','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 00:16:07'),('admin_202211272900','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 01:29:00'),('admin_202211273043','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 01:30:43'),('admin_202211273159','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 00:31:59'),('admin_202211273528','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 00:35:28'),('admin_202211273646','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 01:36:46'),('admin_202211273714','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 00:37:14'),('admin_202211274028','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 00:40:28'),('admin_202211274219','admin','admin','1','1','1','-null-null','주문취소',3000,0,'2022-11-27 03:42:19'),('admin_202211275703','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 01:57:03'),('admin_202211275818','admin','admin','1','1','1','-null-null','배송준비',3000,0,'2022-11-27 01:58:18'),('admin_202211281951','admin','admin','1','1','1','010-1111-1111','배송준비',0,0,'2022-11-28 21:19:51'),('edcosy_202211280626','오승영','edcosy','28308','충북 청주시 청원구 내수로 8','재수정11','010-5555-5555','배송준비',0,0,'2022-11-28 20:06:26'),('osy8814_2022112653','오승영','osy8814','28469','충북 청주시 흥덕구 운천동 1539','2222','010-1355-4864','배송준비',3000,0,'2022-11-26 19:53:10');
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

-- Dump completed on 2022-11-29  1:50:41
