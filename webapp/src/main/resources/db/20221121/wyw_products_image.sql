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
-- Table structure for table `products_image`
--

DROP TABLE IF EXISTS `products_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_image` (
  `product_id` bigint DEFAULT NULL,
  `file_name` varchar(200) NOT NULL,
  `upload_path` varchar(200) NOT NULL,
  `uuid` varchar(200) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `products_image_products_null_fk` (`product_id`),
  CONSTRAINT `products_image_products_null_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_image`
--

LOCK TABLES `products_image` WRITE;
/*!40000 ALTER TABLE `products_image` DISABLE KEYS */;
INSERT INTO `products_image` VALUES (55,'game.png','2022\\11\\21','0915b5ad-afd9-4812-b2ba-05068302cacf'),(48,'flame_icon.png','2022\\11\\20','126f9ef7-1a03-4d5d-b043-889cff31b95f'),(52,'fashion.png','2022\\11\\20','19e6862d-5412-4a01-b258-7176d13afe34'),(55,'clip2.png','2022\\11\\21','51ae0bc8-a729-4a71-8cec-e64f6cfed893'),(48,'clip2.png','2022\\11\\20','61d9b024-b037-4f9a-8641-955d308f5e34'),(51,'game.png','2022\\11\\20','808d84ab-c0f3-445f-920c-e5c1ec440676'),(52,'giftbox2.png','2022\\11\\20','84ab6395-2c9f-45fd-b4c4-b5a811e5246f'),(51,'giftbox.png','2022\\11\\20','963549e5-aa46-4931-bd67-60d1dd3a0ed8'),(51,'donuts.png','2022\\11\\20','9ba27538-f406-4a99-84de-005a4dc4be18'),(48,'clip.jpg','2022\\11\\20','ccee858b-c0f2-4f7e-b755-05fc806394ce'),(51,'live.png','2022\\11\\20','d54bd3ed-b3b6-4bc7-961e-98108f92d9b1'),(53,'test3','test3','test3'),(53,'test4','test4','test4');
/*!40000 ALTER TABLE `products_image` ENABLE KEYS */;
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
