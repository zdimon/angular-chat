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
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`) USING BTREE,
  KEY `auth_permission_417f1b1c` (`content_type_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add Site',7,'add_tpa'),(20,'Can change Site',7,'change_tpa'),(21,'Can delete Site',7,'delete_tpa'),(22,'Can add chat user',8,'add_chatuser'),(23,'Can change chat user',8,'change_chatuser'),(24,'Can delete chat user',8,'delete_chatuser'),(25,'Can add Chat session',9,'add_chatroom'),(26,'Can change Chat session',9,'change_chatroom'),(27,'Can delete Chat session',9,'delete_chatroom'),(28,'Can add chat user2 room',10,'add_chatuser2room'),(29,'Can change chat user2 room',10,'change_chatuser2room'),(30,'Can delete chat user2 room',10,'delete_chatuser2room'),(31,'Can add message',11,'add_chatmessage'),(32,'Can change message',11,'change_chatmessage'),(33,'Can delete message',11,'delete_chatmessage'),(34,'Can add Contact',12,'add_chatcontacts'),(35,'Can change Contact',12,'change_chatcontacts'),(36,'Can delete Contact',12,'delete_chatcontacts'),(37,'Can add chat transactions',13,'add_chattransactions'),(38,'Can change chat transactions',13,'change_chattransactions'),(39,'Can delete chat transactions',13,'delete_chattransactions'),(40,'Can add chat templates',14,'add_chattemplates'),(41,'Can change chat templates',14,'change_chattemplates'),(42,'Can delete chat templates',14,'delete_chattemplates'),(43,'Can add chat stopword',15,'add_chatstopword'),(44,'Can change chat stopword',15,'change_chatstopword'),(45,'Can delete chat stopword',15,'delete_chatstopword'),(46,'Can add chat blocklist',16,'add_chatblocklist'),(47,'Can change chat blocklist',16,'change_chatblocklist'),(48,'Can delete chat blocklist',16,'delete_chatblocklist'),(49,'Can add task state',17,'add_taskmeta'),(50,'Can change task state',17,'change_taskmeta'),(51,'Can delete task state',17,'delete_taskmeta'),(52,'Can add saved group result',18,'add_tasksetmeta'),(53,'Can change saved group result',18,'change_tasksetmeta'),(54,'Can delete saved group result',18,'delete_tasksetmeta'),(55,'Can add interval',19,'add_intervalschedule'),(56,'Can change interval',19,'change_intervalschedule'),(57,'Can delete interval',19,'delete_intervalschedule'),(58,'Can add crontab',20,'add_crontabschedule'),(59,'Can change crontab',20,'change_crontabschedule'),(60,'Can delete crontab',20,'delete_crontabschedule'),(61,'Can add periodic tasks',21,'add_periodictasks'),(62,'Can change periodic tasks',21,'change_periodictasks'),(63,'Can delete periodic tasks',21,'delete_periodictasks'),(64,'Can add periodic task',22,'add_periodictask'),(65,'Can change periodic task',22,'change_periodictask'),(66,'Can delete periodic task',22,'delete_periodictask'),(67,'Can add worker',23,'add_workerstate'),(68,'Can change worker',23,'change_workerstate'),(69,'Can delete worker',23,'delete_workerstate'),(70,'Can add task',24,'add_taskstate'),(71,'Can change task',24,'change_taskstate'),(72,'Can delete task',24,'delete_taskstate');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:50:27
