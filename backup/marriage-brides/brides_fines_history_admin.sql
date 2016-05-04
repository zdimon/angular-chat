-- MySQL dump 10.13  Distrib 5.6.30, for debian-linux-gnu (x86_64)
--
-- Host: marriage-brides.com    Database: brides
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fines_history_admin`
--

DROP TABLE IF EXISTS `fines_history_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fines_history_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `agency_id` int(10) DEFAULT NULL,
  `user_from` int(10) DEFAULT NULL,
  `user_to` int(10) DEFAULT NULL,
  `sum` float(12,2) DEFAULT NULL,
  `reason` text,
  `kurs` int(10) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `room_id` int(10) DEFAULT NULL,
  `charge_back` tinyint(1) DEFAULT '0',
  `refund` tinyint(1) DEFAULT '0',
  `prim` text,
  `tranzaction_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fines_history_admin`
--

LOCK TABLES `fines_history_admin` WRITE;
/*!40000 ALTER TABLE `fines_history_admin` DISABLE KEYS */;
INSERT INTO `fines_history_admin` VALUES (1,6,164,37,3.00,'Pay for send real gift',0,1444982411,NULL,NULL,1,0,'',64),(2,28,164,167,0.00,'Pay for video',0,1444982475,NULL,NULL,0,1,'',59),(3,28,207,167,0.00,'Pay for order phone call',0,1445614374,NULL,NULL,1,0,'',152),(4,28,207,167,0.00,'Pay for order phone call',0,1445614376,NULL,NULL,1,0,'',152),(5,28,207,167,0.00,'Pay for order phone call',0,1445614376,NULL,NULL,1,0,'',152),(6,28,207,167,0.00,'Pay for order phone call',0,1445614377,NULL,NULL,1,0,'',152),(7,28,207,167,0.00,'Pay for order phone call',0,1445614377,NULL,NULL,1,0,'',152),(8,28,207,167,1.00,'Pay for order phone call',0,1445614391,NULL,NULL,1,0,'Тест 1',152),(9,28,207,167,0.00,'Pay for order phone call',0,1445614560,NULL,NULL,0,1,'Тест 2',152),(10,28,207,172,1.00,'Pay for buy contact information',0,1445614631,NULL,NULL,1,0,'Тест 3',151),(11,28,207,172,0.00,'Pay for buy contact information',0,1445614906,NULL,NULL,0,1,'',151),(12,28,14,167,0.00,'Pay for send virtual gift',0,1445614968,NULL,NULL,1,0,'',141),(13,28,175,167,0.00,'Send letter',0,1445615001,NULL,NULL,1,0,'',159),(14,28,175,167,0.00,'Pay for send virtual gift',0,1445615023,NULL,NULL,1,0,'',157),(15,28,175,167,0.00,'Send letter',0,1445615057,NULL,NULL,0,1,'',159),(16,28,207,172,0.00,'Pay for send real gift',0,1445615124,NULL,NULL,1,0,'',158),(17,28,207,172,0.00,'Pay for send real gift',0,1445615164,NULL,NULL,0,1,'',158),(18,28,207,172,3.00,'Pay for video chat',0,1445615251,NULL,436,0,1,'тест 5',143),(19,28,207,172,10.00,'Pay for video chat',0,1445615358,NULL,436,1,0,'Тест 6',143),(20,6,175,32,13.00,'Pay for send real gift',0,1446018404,NULL,NULL,1,0,'Тест1',189),(21,6,175,32,13.00,'Pay for send real gift',0,1446018406,NULL,NULL,1,0,'Тест1',189),(22,6,175,32,13.00,'Pay for send real gift',0,1446018408,NULL,NULL,1,0,'Тест1',189),(23,6,175,32,13.00,'Pay for send real gift',0,1446018408,NULL,NULL,1,0,'Тест1',189),(24,6,175,70,2.50,'Read letter',0,1446018548,NULL,NULL,0,1,'',187),(25,6,175,32,0.00,'Read letter',0,1446022554,NULL,NULL,0,1,'',190),(26,6,175,32,0.00,'Read letter',0,1446022563,NULL,NULL,1,0,'',190),(27,6,175,32,3.50,'Pay for send real gift',0,1446022939,NULL,NULL,0,1,'',189),(28,6,175,31,10.00,'Pay for buy contact information',0,1446029777,NULL,NULL,1,0,'',178),(29,6,175,32,13.50,'Pay for send real gift',0,1446030929,NULL,NULL,1,0,'',191),(30,6,14,32,3.25,'Pay for text chat',0,1446031520,NULL,474,0,1,'тест 2',185);
/*!40000 ALTER TABLE `fines_history_admin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:52:56
