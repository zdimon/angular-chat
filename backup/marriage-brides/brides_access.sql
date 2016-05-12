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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) NOT NULL,
  `controller` varchar(64) DEFAULT NULL,
  `view` tinyint(1) NOT NULL DEFAULT '0',
  `edit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`) USING BTREE,
  CONSTRAINT `access_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `users_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES (273,6,'index',1,0),(274,6,'girls',1,0),(275,6,'information',1,1),(295,8,'index',1,0),(296,8,'content',1,0),(297,8,'control',1,0),(298,8,'contacts',1,0),(299,8,'news',1,0),(300,8,'menu',1,0),(301,8,'slider',1,0),(302,8,'banners',1,0),(303,8,'mailTemplates',1,0),(304,8,'testimonials',1,0),(305,8,'FAQ',1,0),(306,8,'alcohol',1,0),(307,8,'countries',1,0),(308,8,'english',0,0),(309,8,'marital',1,0),(310,8,'reasons',1,0),(311,8,'agencies',1,0),(312,8,'girls',1,0),(313,8,'men',1,0),(329,9,'index',1,0),(330,9,'girls',0,0),(331,9,'information',0,0),(332,9,'bonuses',0,0),(333,9,'fines',0,0),(334,9,'orderreal',0,0),(335,9,'Realrelivered',0,0),(336,9,'Realrejected',0,0),(337,9,'Letters',0,0),(338,9,'Admirers',0,0),(339,9,'Statistic',0,0),(340,9,'Scammers',0,0),(367,11,'index',0,0),(368,11,'girls',1,1),(369,11,'information',0,0),(370,11,'bonuses',0,0),(371,11,'fines',0,0),(372,11,'orderreal',1,1),(373,11,'Realrelivered',1,1),(374,11,'Realrejected',1,1),(375,11,'Letters',1,1),(376,11,'Admirers',0,0),(377,11,'Statistic',0,0),(378,11,'Scammers',0,0),(379,11,'Questions',0,0),(415,12,'index',1,0),(416,12,'content',1,0),(417,12,'control',0,0),(418,12,'contacts',0,0),(419,12,'news',0,0),(420,12,'menu',0,0),(421,12,'slider',0,0),(422,12,'banners',0,0),(423,12,'mailTemplates',0,0),(424,12,'testimonials',0,0),(425,12,'FAQ',0,0),(426,12,'alcohol',0,0),(427,12,'countries',0,0),(428,12,'english',0,0),(429,12,'marital',0,0),(430,12,'reasons',0,0),(431,12,'agencies',0,0),(432,12,'girls',0,0),(433,12,'men',0,0),(434,12,'virtualgifts',0,0),(435,12,'realgifts',0,0),(436,12,'sets',0,0),(437,12,'addcoins',0,0),(438,12,'bonuses',0,0),(439,12,'fines',0,0),(440,12,'paymenhistory',0,0),(441,12,'dateme',0,0),(442,12,'phoneme',0,0),(443,12,'letters',0,0),(444,12,'admirers',0,0),(445,12,'statistic',0,0),(446,12,'subscribe',0,0),(447,12,'scammers',0,0),(448,12,'questions',1,1),(449,12,'antimat',0,0);
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:52:53
