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
-- Table structure for table `product_qna_q`
--

DROP TABLE IF EXISTS `product_qna_q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_qna_q` (
  `qna_id` int NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(1000) DEFAULT '문의사항입니다.',
  `is_answered` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`qna_id`),
  KEY `product_qna_products_fk` (`product_id`),
  KEY `product_qna_users_fk_idx` (`user_id`),
  CONSTRAINT `product_qna_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_qna_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_qna_q`
--

LOCK TABLES `product_qna_q` WRITE;
/*!40000 ALTER TABLE `product_qna_q` DISABLE KEYS */;
INSERT INTO `product_qna_q` VALUES (1,116,'edcosy','2022-12-03 11:05:03','수정됨',1,1),(3,116,'admin','2022-12-04 03:40:42','추가 입고 문의 수정확인',1,1),(4,113,'edcosy','2022-12-04 04:56:11','다른색상도 있나요? 희색 찾고 있습니다.',1,0),(5,113,'edcosy','2022-12-04 05:50:49','사이즈 문의',1,0),(6,314,'edcosy','2022-12-04 06:23:55','컬러선택가능한가요?',1,0),(7,116,'edcosy','2022-12-04 18:48:48','테스트문의2',0,1),(8,118,'osy8814','2022-12-05 09:40:23','거실에 놔도 괜찮을까요?',0,0),(9,116,'osy8814','2022-12-05 09:48:56','사이즈가 어떻게 되나요? 큰가요?',0,0),(10,313,'edcosy11','2022-12-05 10:35:53','가로세로 길이가 궁금합니다.',1,0),(11,309,'osy8814','2022-12-05 10:55:48','방수기능있나요?',0,0),(12,122,'osy8814','2022-12-05 10:57:00','높이가 어느정도 되나요?',0,0);
/*!40000 ALTER TABLE `product_qna_q` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-05 14:54:11
