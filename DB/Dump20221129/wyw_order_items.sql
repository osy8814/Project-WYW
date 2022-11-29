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
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `product_count` int NOT NULL,
  `price` int unsigned NOT NULL DEFAULT '1',
  `save_point` int unsigned NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `product_id_fk_idx` (`product_id`),
  KEY `oder_id_fk_idx` (`order_id`),
  CONSTRAINT `order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (3,'2022_test1',61,2,70000,0),(4,'osy8814_2022112653',310,1,10000,0),(5,'admin_2022112610',310,1,10000,0),(6,'admin_2022112611',47,1,50000,0),(7,'admin_2022112612',309,1,30000,0),(8,'admin_2022112612',310,1,10000,0),(9,'admin_2022112612',45,1,400000,0),(10,'admin_202211261404',307,1,800000,0),(11,'admin_202211261423',310,1,10000,0),(12,'admin_202211261432',312,1,2000000,0),(13,'admin_202211261445',312,1,2000000,0),(14,'admin_202211261512',47,1,50000,0),(15,'admin_202211261518',310,1,10000,0),(16,'admin_202211261527',308,1,10000000,0),(17,'admin_202211261535',45,1,400000,0),(18,'admin_202211262723',312,1,2000000,0),(19,'admin_202211262221',312,1,2000000,0),(20,'admin_202211262228',312,1,2000000,0),(21,'admin_202211262428',312,1,2000000,0),(22,'admin_202211262838',312,1,2000000,0),(23,'admin_202211262857',312,1,2000000,0),(24,'admin_202211262909',312,1,2000000,0),(25,'admin_202211262922',312,1,2000000,0),(26,'admin_202211263458',312,1,2000000,0),(27,'admin_202211263811',312,1,2000000,0),(28,'admin_202211263950',312,1,2000000,0),(29,'admin_202211264522',312,1,2000000,0),(30,'admin_202211265139',312,1,2000000,0),(31,'admin_202211265330',312,1,2000000,0),(32,'admin_202211260142',312,1,2000000,0),(33,'admin_202211260300',312,1,2000000,0),(34,'admin_202211263948',312,1,2000000,0),(35,'admin_202211264008',309,1,30000,0),(36,'admin_202211264008',310,1,10000,0),(37,'admin_202211264008',312,1,2000000,0),(38,'admin_202211264311',309,1,30000,0),(39,'admin_202211264311',310,1,10000,0),(40,'admin_202211264311',312,1,2000000,0),(41,'admin_202211264319',310,1,10000,0),(42,'admin_202211264319',312,1,2000000,0),(43,'admin_202211264328',310,1,10000,0),(44,'admin_202211264328',312,1,2000000,0),(45,'admin_202211264340',310,1,10000,0),(46,'admin_202211264340',312,1,2000000,0),(47,'admin_202211264436',310,1,10000,0),(48,'admin_202211264436',312,1,2000000,0),(49,'admin_202211264512',310,1,10000,0),(50,'admin_202211264512',312,1,2000000,0),(51,'admin_202211264839',312,1,2000000,0),(52,'admin_202211264839',310,1,10000,0),(53,'admin_202211264839',309,1,30000,0),(54,'admin_202211264855',312,1,2000000,0),(55,'admin_202211264905',312,1,2000000,0),(56,'admin_202211265229',312,1,2000000,0),(57,'admin_202211265239',312,1,2000000,0),(58,'admin_202211265310',312,1,2000000,0),(59,'admin_202211270108',47,1,50000,0),(60,'admin_202211270108',310,1,10000,0),(61,'admin_202211270812',47,1,50000,0),(62,'admin_202211270812',310,1,10000,0),(63,'admin_202211270905',47,1,50000,0),(64,'admin_202211270905',310,1,10000,0),(65,'admin_202211271607',47,1,50000,0),(66,'admin_202211271607',310,1,10000,0),(67,'admin_202211273159',47,1,50000,0),(68,'admin_202211273159',310,1,10000,0),(69,'admin_202211273528',47,1,50000,0),(70,'admin_202211273528',310,1,10000,0),(71,'admin_202211273714',47,1,50000,0),(72,'admin_202211273714',310,1,10000,0),(73,'admin_202211274028',47,1,50000,0),(74,'admin_202211274028',310,1,10000,0),(75,'admin_202211271222',47,1,50000,0),(76,'admin_202211271222',310,1,10000,0),(77,'admin_202211271227',47,1,50000,0),(78,'admin_202211271227',310,1,10000,0),(79,'admin_202211271310',47,1,50000,0),(80,'admin_202211271310',310,1,10000,0),(81,'admin_202211272900',47,1,50000,0),(82,'admin_202211272900',310,1,10000,0),(83,'admin_202211273043',47,1,50000,0),(84,'admin_202211273043',310,1,10000,0),(85,'admin_202211273646',47,1,50000,0),(86,'admin_202211273646',310,1,10000,0),(101,'admin_202211275703',47,1,50000,0),(104,'admin_202211275818',309,1,30000,0),(109,'admin_202211270130',47,1,50000,0),(111,'admin_202211274219',47,1,50000,0),(118,'edcosy_202211280626',310,4,540000,0),(119,'admin_202211281951',122,2,80000,0);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-29  1:50:40
