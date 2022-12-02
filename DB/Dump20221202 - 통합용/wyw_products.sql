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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cate_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ratingAvg` decimal(2,1) DEFAULT '3.0',
  `price` int NOT NULL DEFAULT '0',
  `stock` int unsigned NOT NULL DEFAULT '0',
  `cumulative_sales` int unsigned NOT NULL DEFAULT '0' COMMENT '누적 판매량\\\\n',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `dd_idx` (`cate_code`),
  CONSTRAINT `category_fk` FOREIGN KEY (`cate_code`) REFERENCES `products_category` (`cate_code`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (47,'admin','KYRRE 쉬레','<p>이 제품에는 목재처럼 재생 가능한 소재를 사용해서 화석 연료나 유한 소재의 사용을 피했어요.</p><p>&nbsp;</p><p>지구에 긍정적인 영향을 미치고자 합니다.&nbsp;</p><p>&nbsp;</p><p>이러한 목표를 달성하기 위해 2030년까지 모든 제품에 재활용 또는 재생 가능한 소재를 사용하고,&nbsp;</p><p>&nbsp;</p><p>책임 있는 방식으로 소재를 공급 받으려고 노력하고 있습니다.</p>','302',5.0,39000,21,13,'2022-11-20 04:59:07'),(113,'admin','MOXBODA 목스보다','<p>접이식 제품으로 편하게 보관할 수 있습니다.</p><p>&nbsp;</p><p>대나무는 내구성이 높고 재사용이 가능하며 지속 가능한 소재입니다.</p>','201',5.0,69000,2,50,'2022-10-20 06:00:12'),(116,'admin','TEODORES 테오도레스','<p>이 편안한 의자는 견고하지만 가벼우며 쌓아 둘 수도 있습니다.&nbsp;</p><p>&nbsp;</p><p>식당에 두든 입구나 침대 옆에 두든,&nbsp;</p><p>&nbsp;</p><p>다양한 테이블 및 스타일과 잘 어울리므로 높은 만족감을 선사합니다.</p>','202',1.5,35000,6,50,'2022-10-20 06:00:12'),(118,'admin','ODGER 오드게르','<p>의자를 조립하는 데 도구가 필요하지 않으며&nbsp;</p><p>&nbsp;</p><p>시트 아래의 단순한 메커니즘을 이용해 서로 끼워주기만 하면 됩니다.</p><p>&nbsp;</p><p>그릇 모양의 시트와 둥근 형태로 처리한 등받이 덕분에 편안하게 앉아 있을 수 있습니다.</p>','102',4.6,39500,4,201,'2022-10-20 06:00:12'),(122,'admin','BERGSHULT 베리스훌트 / GRANHULT 그란훌트','<p>벽선반의 긴 측면 한편은 경사진 가장자리,&nbsp;</p><p>&nbsp;</p><p>반대편은 매끄러운 가장자리여서 선호하는 스타일에 따라 원하는 면을 선택할 수 있습니다.</p><p>&nbsp;</p><p>벽선반은 원하는 길이로 자를 수 있으며&nbsp;</p><p>&nbsp;</p><p>GRANHULT/그란훌트 브래킷을 사용하면 절단면이 티가 나지 않습니다.</p>','103',2.2,80000,1,302,'2022-10-20 06:00:12'),(308,'admin','EKEDALEN 에케달렌','<p>테이블을 확장하지 않을 때도 상판에 이음새가 드러나지 않는 스마트한 디자인입니다.</p><p>&nbsp;</p><p>길이를 조절하기만 하면 아이들과 숙제를 하거나 그림을 그리고 게임을 하는 등, 다양한 활동에 적합한 공간을 만들 수 있습니다.</p><p>&nbsp;</p><p>테이블 다리는 테이블이 확장되더라도 항상 테이블의 모서리에 자리하고 있어 의자를 놓을 공간도 충분합니다.</p><p>&nbsp;</p><p>한 사람의 힘으로 빠르고 간편하게 테이블을 확장할 수 있습니다.</p><p>&nbsp;</p><p>보조상판을 테이블 밑에 보관해두고 언제든지 꺼내 쓸 수 있습니다.</p><p>&nbsp;</p><p>원목의 나뭇결과 색상이 각각 다르기 때문에 테이블마다 독특한 매력을 느낄 수 있습니다.</p><p>&nbsp;</p><p>간편하게 같은 시리즈의 의자와 벤치를 사용하면 잘 어울리며 IKEA의 다른 의자와 조합해도 근사합니다.</p><p>&nbsp;</p><p>가장 엄격한 기준의 안정성, 내구성 및 안전도 테스트를 통과한 테이블입니다. 수년 동안 매일같이 사용해도 튼튼합니다.</p>','301',5.0,490000,9,21,'2022-11-20 04:37:08'),(309,'admin','KUNGSFORS 쿵스포르스','<p>전문 셰프에게서 아이디어를 얻어 가정에 맞게 적용했습니다.&nbsp;</p><p>&nbsp;</p><p>레스토랑 주방처럼 내구성이 좋은 소재와 스마트한 벽 수납에 중점을 둔 솔루션입니다.&nbsp;</p><p>&nbsp;</p><p>여러 제품을 조합하여 취향에 맞게 구성할 수도 있고 기존 콤비네이션을 사용할 수도 있습니다.</p>','303',0.5,125000,13,19,'2022-11-23 21:19:45'),(310,'admin','NORDVIKEN 노르드비켄','<p>이 넓은 나무 식탁은 전통적인 느낌을 선사하며</p><p>&nbsp;</p><p>곧 여러분의 가정에서 자연스럽게 모임의 장소가 될 것입니다.&nbsp;</p><p>&nbsp;</p><p>견고한 구조와 매끄러운 확장 메커니즘 덕분에&nbsp;</p><p>&nbsp;</p><p>오래 사용할 수 있는 인기 가구가 되었습니다.</p>','301',1.8,540000,5,6,'2022-11-23 21:23:28'),(312,'admin','IDANÄS 이다네스','<p>진공 청소기로 침대 프레임 아래를 청소하면&nbsp;</p><p>&nbsp;</p><p>공간을 깨끗하고 먼지 없이 유지할 수 있습니다.</p><p>&nbsp;</p><p>침대 옆판은 매트리스의 두께에 따라&nbsp;</p><p>&nbsp;</p><p>위치를 조절할 수 있습니다.</p>','104',4.5,2000000,11,15,'2022-11-23 22:49:30'),(313,'admin','VADHEIM 바드헤임','<p>VADHEIM 바드헤임은 디자인이 깔끔해 다른 침실 가구와 쉽게 매치할 수 있어요.</p><p>&nbsp;</p><p>둥근 패딩 침대헤드는 보기에 아름답고 기대기에도 좋아요.</p><p>&nbsp;</p><p>침대헤드를 둘러싼 두꺼운 파이핑은 개성 있으면서도 세련된 느낌을 줍니다.</p><p>&nbsp;</p><p>침대에 꼭 맞는 투톤 멜란지 커버는 부드러운 질감이 느껴집니다.</p><p>&nbsp;</p><p>무난한 스타일의 얇은 침대 다리는 밝고 가벼운 느낌을 줍니다.</p><p>&nbsp;</p><p>침대 아래에는 수납상자를 넣어둘 공간이 충분하므로 추가 이불과 베개 등의 물품을 보관하기에 안성맞춤입니다.</p><p>&nbsp;</p><p>진공 청소기로 침대 프레임 아래를 청소하면 공간을 깨끗하고 먼지 없이 유지할 수 있습니다.</p><p>&nbsp;</p><p>침대 옆판은 매트리스의 두께에 따라 위치를 조절할 수 있습니다.</p><p>&nbsp;</p>','104',2.6,2500000,5,16,'2022-11-27 15:42:03'),(314,'admin','KARLPETTER 칼페테르','<h2><strong>치수</strong></h2><p>&nbsp;</p><p><strong>깊이:&nbsp;</strong>49 cm</p><p>&nbsp;</p><p><strong>높이:&nbsp;</strong>42 cm</p><p>&nbsp;</p><p><strong>시트 깊이:&nbsp;</strong>41 cm</p><p>&nbsp;</p><p><strong>시트 폭:&nbsp;</strong>46 cm</p><p>&nbsp;</p><p><strong>시험 중량:&nbsp;</strong>110 kg</p><p>&nbsp;</p><p><strong>폭:&nbsp;</strong>46 cm</p>','202',3.0,49000,18,24,'2022-11-28 23:57:10');
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

-- Dump completed on 2022-12-02  3:36:57
