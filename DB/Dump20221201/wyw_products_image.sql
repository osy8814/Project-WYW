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
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
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
INSERT INTO `products_image` VALUES (310,'6c42a1f978b9f3ade55462ab8c56d31a.jpg','2022/11/28','084c29c1-fa4c-4c19-8ed4-fbfdd15f816a','2022-11-28 12:39:28.755'),(308,'에케달렌2.jpg','2022/11/28','10c41992-8def-4fad-ba30-bd83f2821cef','2022-11-28 12:35:06.644'),(122,'alvaro-matzumura-tzX5b75T-Qo-unsplash.jpg','2022/11/24','25f429c9-c078-4a9c-91bb-57b2785e98c1','2022-11-28 12:13:58.277'),(47,'r-architecture-CCjAPxoQWgQ-unsplash.jpg','2022/11/24','32de3cf5-6b93-46e5-a0be-9fbc4744566f','2022-11-28 12:28:14.584'),(118,'sarah-dorweiler-7tFlUFGa7Dk-unsplash.jpg','2022/11/24','420a40fc-5392-4d6d-b72c-390b1614087b','2022-11-28 13:00:38.261'),(116,'의자2.jpg','2022/11/28','539b12cf-2b2d-47af-a1e7-205cc3577d20','2022-11-28 12:43:17.503'),(310,'c62e7e848bc792d1424e9542f2bdd27e.jpg','2022/11/28','6f413c59-45b1-4dd9-a7a2-0b6c0cdfc5ef','2022-11-28 12:39:28.766'),(314,'거실의자1.jpg','2022/11/28','71d3bf85-2f9d-48d6-9525-267f53034d85','2022-11-28 23:57:10.198'),(312,'kim-schouten-f7h2nTvEknM-unsplash.jpg','2022/11/24','72b6db4c-7333-4787-b8c7-2ff4541b634e','2022-11-28 12:10:48.961'),(116,'의자3.jpg','2022/11/28','87d85e98-17a3-4858-b3bd-155d76edd95d','2022-11-28 12:43:17.513'),(309,'good-soul-shop-DlO0yz4U67A-unsplash.jpg','2022/11/24','959baf04-4eaa-42c1-9273-4039e0e1bc82','2022-11-30 14:07:30.135'),(313,'linus-mimietz-p3UWyaujtQo-unsplash.jpg','2022/11/27','9860f13f-bc6a-4cdd-8c8d-5053b9c37918','2022-11-28 13:01:12.170'),(308,'에케달렌1.png','2022/11/28','9ad0b433-558f-4218-ad23-a70e842f7751','2022-11-28 12:35:06.633'),(310,'4d2e094b92e4376aace6fdf352e525e0.jpg','2022/11/28','a44839a7-b12b-4ff3-a8e0-361b50083bbd','2022-11-28 12:39:28.744'),(113,'탁자.jpg','2022/11/28','b7314c25-db24-421a-b27b-e995d7d25c2b','2022-11-28 12:58:36.467'),(116,'의자.jpg','2022/11/28','cf0a7ac6-cc5d-41e0-98ee-00859e133847','2022-11-28 12:43:17.492'),(113,'탁자2.jpg','2022/11/28','ddb6a993-1f9e-484a-a9a1-b790c0fdc771','2022-11-28 12:58:36.478'),(122,'darren-richardson-wMaUWhnah7E-unsplash.jpg','2022/11/24','e6d3e69e-31bd-4c02-b12f-f1836b4c75e5','2022-11-28 12:13:58.266'),(113,'탁자3.jpg','2022/11/28','f19d58dd-6cab-453c-b817-077bc53f2d15','2022-11-28 12:58:36.489');
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

-- Dump completed on 2022-12-01  4:23:04
