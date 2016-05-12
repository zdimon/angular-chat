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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-09-02 13:56:41'),(2,'auth','0001_initial','2015-09-02 13:56:41'),(3,'admin','0001_initial','2015-09-02 13:56:41'),(4,'contenttypes','0002_remove_content_type_name','2015-09-02 13:56:41'),(5,'auth','0002_alter_permission_name_max_length','2015-09-02 13:56:41'),(6,'auth','0003_alter_user_email_max_length','2015-09-02 13:56:41'),(7,'auth','0004_alter_user_username_opts','2015-09-02 13:56:41'),(8,'auth','0005_alter_user_last_login_null','2015-09-02 13:56:41'),(9,'auth','0006_require_contenttypes_0002','2015-09-02 13:56:41'),(10,'chat','0001_initial','2015-09-02 14:13:20'),(11,'chat','0002_tpa_charge_url','2015-09-02 14:13:20'),(12,'chat','0003_tpa_get_balance_url','2015-09-02 14:13:20'),(13,'chat','0004_tpa_billing_page','2015-09-02 14:13:20'),(14,'chat','0005_auto_20150814_1338','2015-09-02 14:13:20'),(15,'chat','0006_auto_20150817_1201','2015-09-02 14:13:20'),(16,'chat','0007_chatroom_activiti','2015-09-02 14:13:21'),(17,'chat','0008_auto_20150817_1223','2015-09-02 14:13:21'),(18,'chat','0009_auto_20150817_1335','2015-09-02 14:13:21'),(19,'chat','0010_auto_20150817_1346','2015-09-02 14:13:21'),(20,'chat','0011_auto_20150821_1457','2015-09-02 14:13:21'),(21,'chat','0012_auto_20150822_0909','2015-09-02 14:13:21'),(22,'chat','0013_auto_20150822_0959','2015-09-02 14:13:21'),(23,'chat','0014_chatblocklist','2015-09-02 14:13:21'),(24,'chat','0015_chatblocklist_tpa','2015-09-02 14:13:21'),(25,'chat','0016_auto_20150901_1853','2015-09-02 14:13:23'),(26,'chat','0017_auto_20150902_1222','2015-09-02 14:13:23'),(27,'sessions','0001_initial','2015-09-02 14:13:23'),(28,'chat','0018_auto_20150907_0821','2015-09-07 08:22:18'),(29,'chat','0019_auto_20150908_0630','2015-09-08 06:30:53'),(30,'chat','0020_tpa_price_audio','2015-09-08 15:07:49'),(31,'chat','0021_chattransactions_coins_audio','2015-09-08 15:07:49'),(32,'chat','0022_chatcontacts_activity','2015-09-14 14:12:35'),(33,'chat','0023_chatuser_activity','2015-11-13 08:11:38'),(34,'chat','0024_chatmessage_message_trans','2016-02-11 09:44:04'),(35,'chat','0025_chatmessage_is_translated','2016-02-11 13:42:53'),(36,'djcelery','0001_initial','2016-03-29 10:14:20');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:52:20
