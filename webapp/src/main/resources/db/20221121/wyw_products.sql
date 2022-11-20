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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cate_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `price` int NOT NULL DEFAULT '0',
  `stock` int NOT NULL DEFAULT '0',
  `cumulative_sales` int NOT NULL DEFAULT '0' COMMENT '누적 판매량\\n',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `dd_idx` (`cate_code`),
  CONSTRAINT `category_fk` FOREIGN KEY (`cate_code`) REFERENCES `products_category` (`cate_code`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (40,'admin','거실의자','<p>거실의자 &gt; 수정</p>','302',NULL,90000,20,0,'2022-11-20 04:37:08'),(41,'admin','침실의자','침실의자입니다.','102',NULL,2000,20,0,'2022-11-20 04:42:25'),(42,'admin','침실의자','침실의자입니다.','102',NULL,2000,20,0,'2022-11-20 04:43:21'),(45,'admin','테스트상품','<p>테스트상품 성명입니다</p>','102',NULL,400000,20000,0,'2022-11-20 04:47:17'),(46,'admin','ㄴㅇㄹㄹㅇㄴ','<p>213213123</p>','103',NULL,123123,123123,0,'2022-11-20 04:57:10'),(47,'admin','1232','<p>12412424</p>','302',NULL,123124124,2142424242,0,'2022-11-20 04:59:07'),(48,'admin','1123','<p>12323123</p>','202',NULL,12313,2133,0,'2022-11-20 06:00:12'),(51,'admin','123213','<p>13131313131</p>','203',NULL,2133131,3131313,0,'2022-11-20 21:12:43'),(52,'admin','주방 의자','<p>주방 의자</p>','302',NULL,30000,2000,0,'2022-11-20 21:29:30'),(53,'admin','침실의자','침실의자입니다.','102',NULL,2000,20,0,'2022-11-21 03:36:53'),(55,'admin','5555','<p>555555555555555</p>','303',NULL,555555,55555555,0,'2022-11-21 04:47:57');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-21  4:51:24
