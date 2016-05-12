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
-- Table structure for table `order_virtual_gifts`
--

DROP TABLE IF EXISTS `order_virtual_gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_virtual_gifts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `sender_id` int(10) DEFAULT NULL,
  `receiver_id` int(10) DEFAULT NULL,
  `read` tinyint(1) DEFAULT '0',
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_virtual_gifts`
--

LOCK TABLES `order_virtual_gifts` WRITE;
/*!40000 ALTER TABLE `order_virtual_gifts` DISABLE KEYS */;
INSERT INTO `order_virtual_gifts` VALUES (1,1444803632,NULL,32,164,1,''),(2,1444804104,NULL,164,32,1,''),(3,1444830162,NULL,85,172,1,''),(4,1444981833,NULL,175,167,1,''),(5,1445085269,NULL,175,165,1,'Привет!'),(6,1445085305,NULL,165,175,1,''),(7,1445262125,NULL,26,172,1,''),(8,1445354640,NULL,164,172,1,''),(9,1445354762,NULL,164,32,1,''),(10,1445354916,NULL,164,167,1,''),(11,1445355037,NULL,164,172,1,''),(12,1445355199,NULL,164,167,1,''),(13,1445355480,NULL,164,167,1,''),(14,1445359307,NULL,164,167,1,''),(15,1445359517,NULL,167,164,0,''),(16,1445359575,NULL,167,14,1,''),(17,1445359600,NULL,167,175,1,''),(18,1445521870,NULL,14,167,1,''),(19,1445584166,NULL,172,164,0,''),(20,1445584342,NULL,207,172,1,''),(21,1445601297,NULL,175,167,1,''),(22,1445706211,NULL,14,32,1,''),(23,1445861859,NULL,214,213,1,''),(24,1445861860,NULL,214,213,1,''),(25,1445873055,NULL,214,32,1,''),(26,1445873656,NULL,175,32,1,''),(27,1445938766,NULL,31,14,1,''),(28,1445952017,NULL,213,214,1,''),(29,1445957631,NULL,175,217,1,''),(30,1445957770,NULL,217,175,1,''),(31,1446647121,NULL,32,242,1,''),(32,1447070896,NULL,26,32,1,''),(33,1447333193,NULL,259,32,1,''),(34,1447414752,NULL,221,149,1,''),(35,1447494288,NULL,235,275,0,'Hi wait  you  in  my   CHAT '),(36,1447629041,NULL,243,274,0,'hello. how is your mood?))'),(37,1447678769,NULL,140,283,0,'wait  you  in my CHAT'),(38,1447708233,NULL,122,274,0,'I want  you  my  love  '),(39,1447717078,NULL,126,292,1,'you are very beautiful'),(40,1447718251,NULL,137,292,1,'kiss for you ))'),(41,1447719519,NULL,126,292,1,'Hello! I like your profile! Write to me, i will be glad to know about you better!'),(42,1447727246,NULL,124,292,1,'Hi, how\'s your day?? you can tell me more about you? I wish that I get to know you better'),(43,1447727844,NULL,244,292,1,'I want LOVE Davide'),(44,1447781464,NULL,70,296,1,'I  LOVE  MY DENNIS))))))))'),(45,1448202023,NULL,70,296,0,'i want  you  my love DENNIS'),(46,1448472555,NULL,130,175,0,''),(47,1450289417,NULL,124,298,1,'i like  you  Brandon  '),(48,1452023475,NULL,132,313,0,'Hi! you a very nice man and i would like to chat with you here!'),(49,1452284652,NULL,137,319,1,'Hello! Very good to see you . Hope you will say \"Hello\" for me))'),(50,1452284674,NULL,137,322,0,'Hello! Very good to see you . Hope you will say \"Hello\" for me))'),(51,1452284702,NULL,137,292,0,'Hello! Very good to see you . Hope you will say \"Hello\" for me))'),(52,1452284815,NULL,137,306,0,'Hello! Very good to see you . Hope you will say \"Hello\" for me))'),(53,1452284838,NULL,137,298,1,'Hello! Very good to see you . Hope you will say \"Hello\" for me))'),(54,1452969144,NULL,269,367,0,'how was your day?? I want your love !'),(55,1452985864,NULL,70,367,0,'I LOVE YOU'),(56,1453076952,NULL,70,367,0,''),(57,1453168480,NULL,70,296,0,'IWANT  YOU  YOU  MY  HOT  LOVE  KISS  ME   !'),(58,1453229104,NULL,236,355,0,'I want your love !'),(59,1453332207,NULL,351,314,0,'I want  love  you  '),(60,1453410717,NULL,266,367,0,'for you, Lars!'),(61,1453479765,NULL,137,381,0,'for you!'),(62,1453548603,NULL,227,272,1,'I want you and I to love each other a lot !'),(63,1453568349,NULL,266,394,0,'for you'),(64,1453631536,NULL,121,407,0,'Hello John!'),(65,1453664937,NULL,136,296,0,'kiss for you!'),(66,1454037660,NULL,137,429,1,'have you seen my pics in panties?'),(67,1454147324,NULL,336,442,1,'Hi sexy  you like  me  ?'),(68,1454198770,NULL,444,275,0,'when I see your pics ! you are very beautiful !'),(69,1454206013,NULL,417,275,0,'you like me ?'),(70,1454339280,NULL,129,442,1,'hello! i would be very glad to chat with you and know you better! kiss'),(71,1454364558,NULL,413,429,1,'Hello Axel. Answer me please)))) i will wait!'),(72,1454419679,NULL,126,445,1,'i want you!!!'),(73,1454778516,NULL,471,429,1,'Hi, I\'m the new girl on the site, want to find a man for real relationships! '),(74,1455192712,NULL,130,464,1,'i like  you   Bruce ))))))'),(75,1455323139,NULL,70,475,1,'I want  you  !!!!!!!!'),(76,1455405584,NULL,446,466,0,'I WANT  YOU  MY HOT  LOVE '),(77,1455432860,NULL,444,482,1,'happy Valentine\'s day ! I want you to love me and make me happy and I you !'),(78,1457734150,NULL,131,510,1,'Hello! How is your search?'),(79,1461934727,NULL,540,544,0,'kiss for you');
/*!40000 ALTER TABLE `order_virtual_gifts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:53:21
