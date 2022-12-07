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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `bno` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `writer` varchar(20) NOT NULL,
  `view_cnt` int DEFAULT '0',
  `comment_cnt` int unsigned DEFAULT '0',
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `up_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'쇼핑몰 오픈','쇼핑몰 오픈을 축하합니다','edcosy',13,0,'2022-11-30 01:40:18','2022-11-30 01:40:18'),(2,'가성비 좋고 조립이 쉬움','편의성과 가성비, 디자인 제품기능까지 모두 만족 합니다','edcosy',43,3,'2022-11-30 01:41:44','2022-11-30 01:41:44'),(3,'자주 이용 할 거 같아요','가격도 합리적이고, 안내도 친절하게 해 주셔서 \r\n\r\n부담없이 편하게 문의하기 좋아요','osy8814',12,1,'2022-11-30 01:43:18','2022-11-30 01:43:45'),(4,'디자인 좋아요','4인가구가 쓰기에 알맞으며 조립하기도 쉬웠어요\r\n\r\n배송도 문앞까지 해줬습니다 \r\n\r\n','asdf1',4,0,'2022-11-30 01:54:13','2022-11-30 01:54:13'),(6,'감성','어디나 흔하지 않는 디자인 ','osy8814',10,1,'2022-11-30 02:00:03','2022-11-30 02:00:03'),(7,'생각했던 분위기가 연출되었습니다','가구와 함께 입주 했어요 :-) \r\n똑같은 소파, 똑같은 화이트 인테리어는 하기 싫더라구요. \r\n그래서 제가 원했던 스타일로 꾸미기 충분했어요 :-) \r\n고급스러워서 사람들이 다들 호텔에 온 것 같은 느낌이라고 하더라구요. 30평대 아파트라도 ','edcosy',5,0,'2022-11-30 02:05:07','2022-11-30 02:08:57'),(8,'침대, 협탁, 스탠드까지 넘 이뻐요^^','이사하면서 침대와 협탁,스탠드까지 구매했는데 넘 이쁘고 만족스러워요 \r\n지인들도 다들 이쁘다고 하네요 \r\n친절하게 상담해주신 분들 감사합니다 잘 쓸게요','osy8814',11,0,'2022-11-30 02:06:27','2022-11-30 02:06:27'),(9,'역시 너무 예뻐요','인터넷으로 보고 일산 매장 방문해서 구입했어요 유럽풍으로 3인,2인,1인 조합 하고 싶었고,\r\n저희집 평수 35평에 너무 꽉 차 보일까봐 \r\n걱정했지만 아늑하니 너무 예쁩니다 ','asdf1',5,0,'2022-11-30 02:07:38','2022-11-30 02:07:38'),(10,'예쁜 6인 식탁','사이즈도 넉넉하고 가장자리라인&체어라인도 예쁘게 나왔어요','asdf1',8,0,'2022-11-30 02:07:57','2022-11-30 02:07:57'),(11,'페브릭 쇼파 분위기 최고입니다','이사하면서 페브릭쇼파로 바꾸려고 참 많이도 찾아다녔는데  \r\n너무 잘 했네요. 집안 분위기가 싹 바꼈고 \r\n가격에 비해 퀄리티도 좋은 가성비 최고입니다. ','edcosy',45,0,'2022-11-30 02:09:36','2022-11-30 02:09:36'),(16,'게시판도 있네요','와우','admin',4,0,'2022-12-02 17:48:17','2022-12-02 17:48:17');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-07 10:04:16
