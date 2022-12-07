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
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `bno` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `writer` varchar(20) NOT NULL,
  `view_cnt` int DEFAULT '0',
  `comment_cnt` int unsigned DEFAULT '0',
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `up_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'as 기간은 어떻게 되나요?','소비자 과실이 아닌 이상 제품 자체의 이상은 6개월에 한하여 \r\n\r\n무상으로 지원됩니다.\r\n','admin',2,0,'2022-12-01 11:48:27','2022-12-01 11:48:48'),(2,'상담과정에서 비용이 발생하나요?','전문적인 교육을 받은 디자이너들이 고객님의\r\n\r\n상담 무료로 도와드리고 있습니다\r\n\r\n감사합니다','admin',0,0,'2022-12-01 11:53:32','2022-12-01 11:53:32'),(3,'실측은 어떻게 하나요?','고객님께서 가구 배치 될 자리의 실측을 직접 하시고, \r\n\r\n저희 제품 사이즈와 비교 후 주문해주셔야됩니다.\r\n\r\n','admin',1,0,'2022-12-01 11:55:21','2022-12-01 11:55:21'),(4,'오늘 주문했어요, 언제오나요?','가구 전문 배송 기사님께 직접 배송/설치를 해드리기 때문에\r\n\r\n일반 택배 상품과 달리 주문 확인 후 수도권 7~1일 \r\n\r\n그 외 지역은 7~14일 정도 소요됩니다. ','admin',2,0,'2022-12-01 11:56:55','2022-12-01 11:56:55'),(5,'배송지를 변경하고 싶어오. 어떻게 해야 하나요?','배송출발 전에만 가능합니다.\r\n\r\n고객센터 0507-1234-1234로 연락주시기 바랍니다.','admin',4,0,'2022-12-01 12:05:08','2022-12-01 12:05:08'),(6,'교환이나 환불 기간은 어떻게 되나요?','교환이 가능한 기간은 상품을 받은 후 고객센터로 7일안에 접수가 되어야합니다\r\n\r\n환불이 가능한 기간은 상품을 받으신 후 고객센터로 30일안에 접수가 되어야합니다\r\n(주문제작 상품의 경우 제작이 들어간 이후부터는 변심반품이 불가합니다)\r\n\r\n교환/환불 건이 접수되어 고객센터로 상품이 도착하면 24시간 내에 처리를 해 드립니다','admin',3,0,'2022-12-01 12:05:44','2022-12-01 12:07:29'),(7,'상품에 이상이 있을 경우 배송비는 어떻게 하나요?','상품에 이상이 있는 경우 또는 오배송일 경우에는 배송비를 전액 판매자가 부담하게 됩니다.\r\n\r\n\r\n※ 반품요청시 고객센터 0507-1310-9931 로 연락을 주셔서\r\n\r\n반드시 배송방법 등 사전 안내를 받으셔야 합니다.','admin',1,0,'2022-12-01 12:09:08','2022-12-01 12:09:08'),(8,'주문 취소나 반품은 어디로 신청을 해야 하나요?','상품을 취소하시거나 반품을 하실 경우에는\r\n\r\n\r\n위의 게시판에 내용을 올려주시거나 고객센터로 연락 주시면 됩니다.\r\n\r\n \r\n처리 안내 및 처리 결과는 문자메세지나 전화를 통해 신속하게 고객님께 알려드리겠습니다.','admin',3,0,'2022-12-01 12:10:55','2022-12-01 12:10:55'),(9,'배송일정 변경 가능한가요?','배송일 변경은 최소 7일 전 고객센터로 연락주셔야 변경가능합니다\r\n\r\n당일 변경은 불가하며 게시판으로 변경 요청, 주말 배송 요청은 반영되지 않습니다','admin',4,0,'2022-12-01 12:13:33','2022-12-01 12:13:33');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
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
