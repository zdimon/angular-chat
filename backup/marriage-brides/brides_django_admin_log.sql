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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_e8701ad4` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-09-03 14:58:58','1','tpa1.com',2,'Changed timeout_chating.',7,1),(2,'2015-09-03 15:01:11','1','tpa1.com',2,'Changed timeout_chating.',7,1),(3,'2015-09-07 08:13:23','1','tpa1.com',2,'Changed charge_url.',7,1),(4,'2015-09-07 08:16:57','1','tpa1.com',2,'Changed charge_url.',7,1),(5,'2015-09-07 11:46:32','1','tpa1.com',2,'Changed timeout_chating.',7,1),(6,'2015-09-08 15:09:07','1','tpa1.com',2,'Changed price_audio.',7,1),(7,'2015-09-09 07:51:22','1','tpa1.com',2,'Changed charge_url.',7,1),(8,'2015-09-09 07:51:49','8','ChatTransactions object',3,'',13,1),(9,'2015-09-09 07:51:49','6','ChatTransactions object',3,'',13,1),(10,'2015-09-09 07:51:49','5','ChatTransactions object',3,'',13,1),(11,'2015-09-09 07:51:49','4','ChatTransactions object',3,'',13,1),(12,'2015-09-09 07:51:49','2','ChatTransactions object',3,'',13,1),(13,'2015-09-09 07:51:49','1','ChatTransactions object',3,'',13,1),(14,'2015-09-09 09:11:36','1','tpa1.com',2,'Changed timeout_chating.',7,1),(15,'2015-09-09 12:40:27','1','ChatStopword object',1,'',15,1),(16,'2015-09-10 09:08:50','1','tpa1.com',2,'Changed favorite_url.',7,1),(17,'2015-09-10 11:09:55','1','tpa1.com',2,'Changed price_text_chat, price_video and price_audio.',7,1),(18,'2015-09-11 07:49:00','2','tpa1.com',2,'Changed timeout_chating.',7,1),(19,'2015-09-11 07:56:26','2','tpa1.com',2,'Changed timeout_chating.',7,1),(20,'2015-09-11 07:56:49','2','tpa1.com',2,'Changed timeout_chating.',7,1),(21,'2015-09-11 08:06:28','2','tpa1.com',2,'Changed charge_url.',7,1),(22,'2015-09-18 07:48:34','2','tpa1.com',2,'Changed price_text_chat, price_video and price_audio.',7,1),(23,'2015-09-22 07:38:57','2','tpa1.com',2,'Changed favorite_url.',7,1),(24,'2015-10-08 13:17:40','4','ChatStopword object',1,'',15,1),(25,'2015-10-08 13:26:20','3','ChatStopword object',3,'',15,1),(26,'2015-10-12 13:03:22','2','tpa1.com',2,'Changed charge_url, get_balance_url, favorite_url, message_url and billing_page.',7,1),(27,'2016-01-29 13:11:24','2','tpa1.com',2,'Changed timeout_chating.',7,1),(28,'2016-01-29 13:27:00','2','tpa1.com',2,'Changed timeout_chating.',7,1),(29,'2016-03-29 10:21:26','2','charge-money: every 60 seconds',2,'Changed regtask.',22,1),(30,'2016-03-29 14:58:35','2','charge-money: every 60 seconds',3,'',22,1),(31,'2016-03-29 14:59:21','3','charge-money: every 60 seconds',1,'',22,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:53:02
