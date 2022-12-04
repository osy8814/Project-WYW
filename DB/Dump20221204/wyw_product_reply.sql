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
-- Table structure for table `product_reply`
--

DROP TABLE IF EXISTS `product_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reply` (
  `reply_id` int NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '좋아요!',
  `rating` decimal(2,1) NOT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `user_id_reply_fk_idx` (`user_id`),
  KEY `product_id_reply_fk_idx` (`product_id`),
  CONSTRAINT `product_id_reply_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `user_id_reply_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reply`
--

LOCK TABLES `product_reply` WRITE;
/*!40000 ALTER TABLE `product_reply` DISABLE KEYS */;
INSERT INTO `product_reply` VALUES (9,312,'osy8814','2022-11-27 14:45:54','좋습니다.',4.5),(10,312,'osy8814','2022-11-27 14:45:54','좋습니다.',4.5),(11,312,'osy8814','2022-11-27 14:45:54','좋습니다.',4.5),(12,312,'osy8814','2022-11-27 14:45:54','좋습니다.',4.5),(13,312,'osy8814','2022-11-27 14:45:54','좋습니다.',4.5),(14,312,'osy8814','2022-11-27 14:45:54','좋습니다.',4.5),(15,312,'osy8814','2022-11-27 14:45:54','좋습니다.',4.5),(16,312,'osy8814','2022-11-27 14:45:54','좋습니다.',4.5),(17,312,'osy8814','2022-11-27 14:45:54','좋습니다.',4.5),(18,312,'osy8814','2022-11-27 14:45:54','좋습니다.',4.5),(19,312,'osy8814','2022-11-27 14:45:54','좋습니다.',4.5),(20,312,'osy8814','2022-11-27 14:45:54','좋습니다.',4.5),(21,312,'osy8814','2022-11-27 14:45:54','좋습니다.',4.5),(22,122,'admin','2022-11-27 17:31:04','좋은지 모르겠어요....',2.0),(23,122,'admin','2022-11-27 19:46:05','댓글기능 별로에요',3.5),(25,118,'edcosy','2022-11-27 20:22:19','ll;;',5.0),(26,118,'edcosy','2022-11-27 20:23:34','이제 써집니다',5.0),(27,118,'edcosy','2022-11-27 20:25:43','ㅍㅍㅍㅍㅍ',5.0),(28,113,'edcosy','2022-11-27 21:17:11','111',5.0),(29,118,'edcosy','2022-11-27 21:21:20','초기화테스트\n',5.0),(30,118,'edcosy','2022-11-27 21:21:32','초기화 잘됩니다',2.5),(32,118,'admin','2022-11-28 00:03:01','평점적용 테스트',5.0),(33,313,'edcosy','2022-11-28 00:17:23','평점 리셋',4.5),(34,312,'edcosy','2022-11-28 00:17:49','평점세탁',5.0),(58,313,'admin','2022-11-28 11:43:51','평점 확인',5.0),(59,313,'admin','2022-11-28 11:44:03','평점',0.5),(72,313,'edcosy','2022-11-28 21:03:07','진짜 별로에요 사지마세요',0.5),(78,116,'edcosy11','2022-11-30 15:12:29','앉을 자리가 없습니다.',1.5),(79,310,'edcosy11','2022-11-30 15:12:56','의자가 안와서 서서 먹었습니다.',2.5),(80,314,'edcosy11','2022-11-30 15:13:19','이 의자는 다리가 없네요...',1.0),(81,122,'edcosy11','2022-11-30 15:13:45','선반에 고양이가 못들어갑니다.',1.0),(82,314,'anhj91','2022-12-01 20:51:11','편하고 좋아요~ 칼라가 다양했으면 좋겠어요',5.0),(83,310,'anhj91','2022-12-01 20:53:18','판매자에게 문의했는데 불친절하네요',1.0),(84,308,'anhj91','2022-12-01 20:54:06','깔끔하고 좋아요~',5.0),(85,47,'anhj91','2022-12-01 20:54:41','다용도로사용하기 좋아요',5.0);
/*!40000 ALTER TABLE `product_reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-04  4:58:01
