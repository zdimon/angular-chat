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
-- Table structure for table `seo_counters`
--

DROP TABLE IF EXISTS `seo_counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_counters` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `script` text,
  `status` int(1) DEFAULT '0',
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_counters`
--

LOCK TABLES `seo_counters` WRITE;
/*!40000 ALTER TABLE `seo_counters` DISABLE KEYS */;
INSERT INTO `seo_counters` VALUES (1,'Liveinternet','<!--LiveInternet counter--><script type=\"text/javascript\"><!--\r\ndocument.write(\"<a href=\'//www.liveinternet.ru/click\' \"+\r\n\"target=_blank><img src=\'//counter.yadro.ru/hit?t21.6;r\"+\r\nescape(document.referrer)+((typeof(screen)==\"undefined\")?\"\":\r\n\";s\"+screen.width+\"*\"+screen.height+\"*\"+(screen.colorDepth?\r\nscreen.colorDepth:screen.pixelDepth))+\";u\"+escape(document.URL)+\r\n\";\"+Math.random()+\r\n\"\' alt=\'\' title=\'LiveInternet: показано число просмотров за 24\"+\r\n\" часа, посетителей за 24 часа и за сегодня\' \"+\r\n\"border=\'0\' width=\'88\' height=\'31\'><\\/a>\")\r\n//--></script><!--/LiveInternet-->\r\n',0,1404925196,1431364648);
/*!40000 ALTER TABLE `seo_counters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:50:40
