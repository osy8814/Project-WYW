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
-- Table structure for table `product_qna_a`
--

DROP TABLE IF EXISTS `product_qna_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_qna_a` (
  `a_id` bigint NOT NULL AUTO_INCREMENT,
  `qna_id` int NOT NULL,
  `user_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`a_id`),
  UNIQUE KEY `qna_id_UNIQUE` (`qna_id`),
  KEY `q_a_fk_idx` (`qna_id`),
  KEY `a_users_fk_idx` (`user_id`),
  CONSTRAINT `a_q_fk` FOREIGN KEY (`qna_id`) REFERENCES `product_qna_q` (`qna_id`),
  CONSTRAINT `a_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_qna_a`
--

LOCK TABLES `product_qna_a` WRITE;
/*!40000 ALTER TABLE `product_qna_a` DISABLE KEYS */;
INSERT INTO `product_qna_a` VALUES (1,3,'admin','아직 예정이 없습니다. 죄송합니다.','2022-12-04 16:06:02'),(4,4,'admin','색상은 따로 준비되어있지 않습니다.','2022-12-04 19:17:02'),(7,5,'admin','정확한 사이즈를 문의해주시기 바랍니다.','2022-12-04 19:38:26'),(8,6,'admin','컬러는 다로 선택이 불가능합니다.','2022-12-04 20:22:32'),(9,1,'admin','삭제확인','2022-12-04 20:34:55'),(10,10,'edcosy11','1800mm(가로) * 2200(세로)mm입니다.','2022-12-05 10:37:13');
/*!40000 ALTER TABLE `product_qna_a` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-05 14:54:10
