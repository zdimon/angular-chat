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
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` int(10) DEFAULT NULL COMMENT 'Дата заявки',
  `updated_at` int(10) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Статус заявки 0 / 1',
  `reason` varchar(255) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT 'Agency name',
  `country` varchar(64) DEFAULT NULL COMMENT 'Country',
  `city` varchar(128) DEFAULT NULL COMMENT 'City',
  `province` varchar(64) DEFAULT NULL COMMENT 'Province',
  `postal_code` varchar(32) DEFAULT NULL COMMENT 'Postal code',
  `phone` varchar(64) DEFAULT NULL COMMENT 'Phone number',
  `fax` varchar(64) DEFAULT NULL COMMENT 'Fax',
  `skype` varchar(64) DEFAULT NULL COMMENT 'Skype',
  `email` varchar(64) DEFAULT NULL COMMENT 'E-Mail',
  `address` varchar(255) DEFAULT NULL COMMENT 'Address',
  `website` varchar(64) DEFAULT NULL COMMENT 'Website URL',
  `director_name` varchar(64) DEFAULT NULL COMMENT 'Agency`s director. Full name',
  `director_email` varchar(64) DEFAULT NULL COMMENT 'Agency`s director. Phone number',
  `director_phone` varchar(64) DEFAULT NULL COMMENT 'Agency`s director. E-mail',
  `admin_name` varchar(64) DEFAULT NULL COMMENT 'Contact Persone (Administrator). Full name',
  `admin_email` varchar(64) DEFAULT NULL COMMENT 'Contact Persone (Administrator). Phone number',
  `admin_phone` varchar(64) DEFAULT NULL COMMENT 'Contact Persone (Administrator). E-mail',
  `staff` varchar(128) DEFAULT NULL COMMENT 'Number of staff',
  `profiles` varchar(128) DEFAULT NULL COMMENT 'Number of lady profile',
  `photographer` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Have professional photographer?',
  `visit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Can clients visit your agency?',
  `success_marriages` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Aim at successfull mmarriages?',
  `video_profiles` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Have video profiles?',
  `legal` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is your agency legally registered?',
  `collaborate_agencies` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Do you collaborate with other agencies?',
  `hear` text COMMENT 'How did you hear about Marriage-Braides?',
  `collaborate_sites` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Do you collaborate with other dating sites?',
  `sites_names` text COMMENT '*If yes? please state their names',
  `balance` float(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (6,1432733195,1455091293,0,1,NULL,'Intelligent Fruits Inc.','Ukraine1','Kherson','','73034','380992740348','','','vitaliy.demyanenko.1991@gmail.com','','','Timoshenko Olga','timoshenko@gmail.com','380507265701','Vitaliy Demianenko','demyanenko.v.wezom@gmail.com','380992740348','10','120',1,0,1,0,0,0,'google.com',0,'',7.50),(15,1443306077,1447143377,0,1,NULL,'Natali','Ukraine','Kiev','','31051','0958769876','','','natalia827@mail.ru','','','Nata','natalia827@mail.ru','0958878787','Olya','pbride@mail.ru','0957887878','10','30',1,1,1,1,1,1,'on the internet',0,'',346.50),(16,1455833489,1455833865,0,1,NULL,'Elena ','Ukraine','luhansk','','00000','0000000','','','evt1973@mail.ru','','','lena','evt1973@mail.ru','0000000','mmmm','evt1973@mail.ru','0000000','100','100',1,1,1,1,1,0,'00000',0,'',4.50),(17,1456851102,NULL,0,0,NULL,'I\'ll turn on the camera','Ukraine ','Kiev','','02081','38 (095) 332-48-74','','seventh.heavenlove','seventh.heaven.ua@gmail.com','','','Gonchar Olga','seventh.heaven.ua@gmail.com','380638042728','Jakovenko Anna','seventh.heaven.ua@gmail.com','380953324874','10','30',1,1,1,1,1,1,'We learned from other agencies',1,'Khanuma\r\nRomance Company\r\nBridge',0.00);
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:52:29
