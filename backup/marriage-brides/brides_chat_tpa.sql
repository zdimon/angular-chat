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
-- Table structure for table `chat_tpa`
--

DROP TABLE IF EXISTS `chat_tpa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_tpa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `domain` varchar(250) NOT NULL,
  `secret` varchar(250) NOT NULL,
  `timeout_chating` int(11) NOT NULL,
  `charge_url` varchar(250) NOT NULL,
  `get_balance_url` varchar(250) NOT NULL,
  `billing_page` varchar(250) NOT NULL,
  `price_text_chat` decimal(12,2) NOT NULL,
  `price_video` decimal(12,2) NOT NULL,
  `favorite_url` varchar(250) NOT NULL,
  `message_url` varchar(250) NOT NULL,
  `price_audio` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_tpa_b068931c` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_tpa`
--

LOCK TABLES `chat_tpa` WRITE;
/*!40000 ALTER TABLE `chat_tpa` DISABLE KEYS */;
INSERT INTO `chat_tpa` VALUES (2,'tpa1com','tpa1.com','',300,'http://marriage-brides.com/chat-request/charge','http://marriage-brides.com/api/[user_id]/tpa1com/get_balance','http://marriage-brides.com/account/get-coins',1.00,1.00,'http://marriage-brides.com/chat-request/favorites','http://marriage-brides.com/chat-request/message',1.00);
/*!40000 ALTER TABLE `chat_tpa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:52:04
