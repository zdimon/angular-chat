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
-- Table structure for table `users_videos`
--

DROP TABLE IF EXISTS `users_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_videos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `approval` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text,
  `video` varchar(128) DEFAULT NULL,
  `image` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `users_videos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_videos`
--

LOCK TABLES `users_videos` WRITE;
/*!40000 ALTER TABLE `users_videos` DISABLE KEYS */;
INSERT INTO `users_videos` VALUES (25,NULL,1444557238,NULL,1,1,0,'','ea6e2beb6a84a9d5af084353c6a2b7d2.mp4','1f9da74d2257d1642b4862def9545c4c.jpg'),(26,NULL,1444745126,1444745206,1,1,0,'','4935212205b6bacb090c7beffe47c90f.mp4','24e8dda1a968d47c9c79f4cac92c2a04.jpg'),(33,NULL,1444820434,NULL,0,0,0,'','492891ebb99426cdf8906bbad66fd127.mp4','9882ccad63b30bc9dfe1bf94b84f32b7.jpg'),(34,NULL,1444889580,1444889594,1,1,0,'','0a2042bd032fabe0237e825d00471a02.mp4','8cce882859137611b1ef2772d16c3b42.jpg'),(36,NULL,1445356881,NULL,0,1,0,'','2a0930e9232ee6bff50fb4ffd9ccbae5.mp4','b95a3ba52234d34b589a3ca058ff9597.jpg'),(38,297,1448008404,1452521086,1,1,1,'','92531bd5504effd4461ab43ea3c4d523.mp4','13c39a875c170ab43c1db7a7150c3106.jpg'),(44,321,1452261311,1452521089,1,1,1,'Hello)))))))))','dad6635271a47588a6c7b16b1cae7073.mp4',NULL),(50,332,1453322136,1453326676,1,1,1,'','15d6ebf142a25faa0aa030194bfe1752.mp4',NULL),(51,332,1453327181,1453328413,0,1,1,'I want to meet a man who will make me happy','49af6b50ccfd2d078e063dc7fb638475.mp4','db2c2d7937fb117f2539d990f2cd8400.jpg'),(52,332,1453327243,NULL,0,1,0,'I want to meet a man who will make me happy','08dabdf8dc69e10ab0033fbe6d044246.mp4','919eeeef68a245c875f327e33b373dcc.jpg'),(53,332,1453327289,NULL,1,1,0,'I want to meet a man who will make me happy','5928d0a4796634382d3046818be4a691.mp4','fd96ef4cbe88fd94d33a7fdb8176b956.jpg');
/*!40000 ALTER TABLE `users_videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:52:15
