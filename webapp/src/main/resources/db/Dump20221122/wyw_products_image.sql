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
INSERT INTO `products_image` VALUES (67,'test0','test0','test0'),(68,'test1','test1','test1'),(77,'test10','test10','test10'),(167,'test100','test100','test100'),(168,'test101','test101','test101'),(169,'test102','test102','test102'),(170,'test103','test103','test103'),(171,'test104','test104','test104'),(172,'test105','test105','test105'),(173,'test106','test106','test106'),(174,'test107','test107','test107'),(175,'test108','test108','test108'),(176,'test109','test109','test109'),(78,'test11','test11','test11'),(177,'test110','test110','test110'),(178,'test111','test111','test111'),(179,'test112','test112','test112'),(180,'test113','test113','test113'),(181,'test114','test114','test114'),(182,'test115','test115','test115'),(183,'test116','test116','test116'),(184,'test117','test117','test117'),(185,'test118','test118','test118'),(186,'test119','test119','test119'),(79,'test12','test12','test12'),(187,'test120','test120','test120'),(188,'test121','test121','test121'),(189,'test122','test122','test122'),(190,'test123','test123','test123'),(191,'test124','test124','test124'),(192,'test125','test125','test125'),(193,'test126','test126','test126'),(194,'test127','test127','test127'),(195,'test128','test128','test128'),(196,'test129','test129','test129'),(80,'test13','test13','test13'),(197,'test130','test130','test130'),(198,'test131','test131','test131'),(199,'test132','test132','test132'),(200,'test133','test133','test133'),(201,'test134','test134','test134'),(202,'test135','test135','test135'),(203,'test136','test136','test136'),(204,'test137','test137','test137'),(205,'test138','test138','test138'),(206,'test139','test139','test139'),(81,'test14','test14','test14'),(207,'test140','test140','test140'),(208,'test141','test141','test141'),(209,'test142','test142','test142'),(210,'test143','test143','test143'),(211,'test144','test144','test144'),(212,'test145','test145','test145'),(213,'test146','test146','test146'),(214,'test147','test147','test147'),(215,'test148','test148','test148'),(216,'test149','test149','test149'),(82,'test15','test15','test15'),(217,'test150','test150','test150'),(218,'test151','test151','test151'),(219,'test152','test152','test152'),(220,'test153','test153','test153'),(221,'test154','test154','test154'),(222,'test155','test155','test155'),(223,'test156','test156','test156'),(224,'test157','test157','test157'),(225,'test158','test158','test158'),(226,'test159','test159','test159'),(83,'test16','test16','test16'),(227,'test160','test160','test160'),(228,'test161','test161','test161'),(229,'test162','test162','test162'),(230,'test163','test163','test163'),(231,'test164','test164','test164'),(232,'test165','test165','test165'),(233,'test166','test166','test166'),(234,'test167','test167','test167'),(235,'test168','test168','test168'),(236,'test169','test169','test169'),(84,'test17','test17','test17'),(237,'test170','test170','test170'),(238,'test171','test171','test171'),(239,'test172','test172','test172'),(240,'test173','test173','test173'),(241,'test174','test174','test174'),(242,'test175','test175','test175'),(243,'test176','test176','test176'),(244,'test177','test177','test177'),(245,'test178','test178','test178'),(246,'test179','test179','test179'),(85,'test18','test18','test18'),(247,'test180','test180','test180'),(248,'test181','test181','test181'),(249,'test182','test182','test182'),(250,'test183','test183','test183'),(251,'test184','test184','test184'),(252,'test185','test185','test185'),(253,'test186','test186','test186'),(254,'test187','test187','test187'),(255,'test188','test188','test188'),(256,'test189','test189','test189'),(86,'test19','test19','test19'),(257,'test190','test190','test190'),(258,'test191','test191','test191'),(259,'test192','test192','test192'),(260,'test193','test193','test193'),(261,'test194','test194','test194'),(262,'test195','test195','test195'),(263,'test196','test196','test196'),(264,'test197','test197','test197'),(265,'test198','test198','test198'),(266,'test199','test199','test199'),(69,'test2','test2','test2'),(87,'test20','test20','test20'),(267,'test200','test200','test200'),(268,'test201','test201','test201'),(269,'test202','test202','test202'),(270,'test203','test203','test203'),(271,'test204','test204','test204'),(272,'test205','test205','test205'),(273,'test206','test206','test206'),(274,'test207','test207','test207'),(275,'test208','test208','test208'),(276,'test209','test209','test209'),(88,'test21','test21','test21'),(277,'test210','test210','test210'),(278,'test211','test211','test211'),(279,'test212','test212','test212'),(280,'test213','test213','test213'),(281,'test214','test214','test214'),(282,'test215','test215','test215'),(283,'test216','test216','test216'),(284,'test217','test217','test217'),(285,'test218','test218','test218'),(286,'test219','test219','test219'),(89,'test22','test22','test22'),(287,'test220','test220','test220'),(288,'test221','test221','test221'),(289,'test222','test222','test222'),(290,'test223','test223','test223'),(291,'test224','test224','test224'),(292,'test225','test225','test225'),(293,'test226','test226','test226'),(294,'test227','test227','test227'),(295,'test228','test228','test228'),(296,'test229','test229','test229'),(90,'test23','test23','test23'),(297,'test230','test230','test230'),(298,'test231','test231','test231'),(299,'test232','test232','test232'),(300,'test233','test233','test233'),(301,'test234','test234','test234'),(302,'test235','test235','test235'),(303,'test236','test236','test236'),(304,'test237','test237','test237'),(305,'test238','test238','test238'),(306,'test239','test239','test239'),(91,'test24','test24','test24'),(307,'test240','test240','test240'),(308,'test241','test241','test241'),(309,'test242','test242','test242'),(310,'test243','test243','test243'),(311,'test244','test244','test244'),(312,'test245','test245','test245'),(313,'test246','test246','test246'),(314,'test247','test247','test247'),(315,'test248','test248','test248'),(92,'test25','test25','test25'),(93,'test26','test26','test26'),(94,'test27','test27','test27'),(95,'test28','test28','test28'),(96,'test29','test29','test29'),(70,'test3','test3','test3'),(97,'test30','test30','test30'),(98,'test31','test31','test31'),(99,'test32','test32','test32'),(100,'test33','test33','test33'),(101,'test34','test34','test34'),(102,'test35','test35','test35'),(103,'test36','test36','test36'),(104,'test37','test37','test37'),(105,'test38','test38','test38'),(106,'test39','test39','test39'),(71,'test4','test4','test4'),(107,'test40','test40','test40'),(108,'test41','test41','test41'),(109,'test42','test42','test42'),(110,'test43','test43','test43'),(111,'test44','test44','test44'),(112,'test45','test45','test45'),(113,'test46','test46','test46'),(114,'test47','test47','test47'),(115,'test48','test48','test48'),(116,'test49','test49','test49'),(72,'test5','test5','test5'),(117,'test50','test50','test50'),(118,'test51','test51','test51'),(119,'test52','test52','test52'),(120,'test53','test53','test53'),(121,'test54','test54','test54'),(122,'test55','test55','test55'),(123,'test56','test56','test56'),(124,'test57','test57','test57'),(125,'test58','test58','test58'),(126,'test59','test59','test59'),(73,'test6','test6','test6'),(127,'test60','test60','test60'),(128,'test61','test61','test61'),(129,'test62','test62','test62'),(130,'test63','test63','test63'),(131,'test64','test64','test64'),(132,'test65','test65','test65'),(133,'test66','test66','test66'),(134,'test67','test67','test67'),(135,'test68','test68','test68'),(136,'test69','test69','test69'),(74,'test7','test7','test7'),(137,'test70','test70','test70'),(138,'test71','test71','test71'),(139,'test72','test72','test72'),(140,'test73','test73','test73'),(141,'test74','test74','test74'),(142,'test75','test75','test75'),(143,'test76','test76','test76'),(144,'test77','test77','test77'),(145,'test78','test78','test78'),(146,'test79','test79','test79'),(75,'test8','test8','test8'),(147,'test80','test80','test80'),(148,'test81','test81','test81'),(149,'test82','test82','test82'),(150,'test83','test83','test83'),(151,'test84','test84','test84'),(152,'test85','test85','test85'),(153,'test86','test86','test86'),(154,'test87','test87','test87'),(155,'test88','test88','test88'),(156,'test89','test89','test89'),(76,'test9','test9','test9'),(157,'test90','test90','test90'),(158,'test91','test91','test91'),(159,'test92','test92','test92'),(160,'test93','test93','test93'),(161,'test94','test94','test94'),(162,'test95','test95','test95'),(163,'test96','test96','test96'),(164,'test97','test97','test97'),(165,'test98','test98','test98'),(166,'test99','test99','test99');
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

-- Dump completed on 2022-11-22 14:23:54
