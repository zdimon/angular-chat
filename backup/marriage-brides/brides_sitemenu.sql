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
-- Table structure for table `sitemenu`
--

DROP TABLE IF EXISTS `sitemenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitemenu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(10) NOT NULL DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - Верхнее меню, 1 - нижнее меню, 2 - меню в футере',
  `group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - Company, 1 - About us, 2 - Ladies Profiles, 3 - Ladies Profiles',
  `flaged` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemenu`
--

LOCK TABLES `sitemenu` WRITE;
/*!40000 ALTER TABLE `sitemenu` DISABLE KEYS */;
INSERT INTO `sitemenu` VALUES (16,1432101312,NULL,1,0,'Home','/',0,0,0),(17,1432101330,NULL,1,1,'Ladies online','/online',0,0,1),(18,1432101352,1435655998,1,3,'Top 100 Ladies','/top-100',0,0,0),(20,1432101373,NULL,1,5,'About us','/about-us',0,0,0),(21,1432101389,NULL,1,6,'Contacts','/contacts',0,0,0),(22,1432101412,1432103198,0,0,'Contact us','/contacts',2,0,0),(23,1432101426,1433338963,1,1,'Privacy','/privacy',2,0,0),(24,1432101444,NULL,1,2,'Terms & Conditions','/terms-and-conditions',2,0,0),(25,1432101455,NULL,1,3,'Partnership','/partnership',2,0,0),(27,1432101490,NULL,1,1,'Contact Us','/contacts',1,0,0),(28,1432101500,NULL,1,2,'FAQ','/faq',1,0,0),(29,1432101514,NULL,1,3,'Anti scam-policy','/anti-scam-policy',1,0,0),(31,1432101548,NULL,1,5,'Who we are','/who-we-are',1,1,0),(32,1432101567,1443473221,1,6,'How it Works','/how-it-works',1,1,0),(33,1432101584,NULL,1,7,'Tips and Advice','/tips-and-advice',1,1,0),(35,1432101624,NULL,0,9,'Personal Privacy','/personal-privacy',1,1,0),(36,1432101649,1444311970,1,10,'Search for Ladies','/search',1,2,0),(37,1432101671,NULL,0,11,'Most Popular Searches','/most-popular-searches',1,2,0),(41,1432101745,NULL,1,15,'Online Ladies','/online',1,2,0),(42,1432102857,1441282231,1,2,'Search','/search',0,0,0),(50,1443564147,NULL,0,0,'License agreement','/License agreement',1,0,0),(51,1444426394,1444426569,0,0,'Top 100 Ladies','/top 100 Ladies',1,2,0),(52,1448548611,NULL,0,4,'Site map','sitemap',2,0,0);
/*!40000 ALTER TABLE `sitemenu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:51:44
