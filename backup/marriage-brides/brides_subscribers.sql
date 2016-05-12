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
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `ip` varchar(16) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `hash` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
INSERT INTO `subscribers` VALUES (1,1422974161,NULL,'gupeyixok@flurred.com','178.136.229.251',1,'2aa7c76b58e86020036d2451d04aa0b9f4bd3dde'),(2,1423037499,NULL,'zolota_ira@mail.ru','178.136.229.251',1,'3c2669e5a7e530cf78585dd28a98ce80e8611799'),(3,1423043808,NULL,'palenaya.v.wezom@gmail.com','178.136.229.251',1,'17d818e355bc39e0d022aa76e7ed07f54602d9ad'),(5,1423084954,NULL,'nokeyeve@flurred.com','93.79.159.189',1,'8a6769318c2deebd0fcb9cc664db16afa328a514'),(6,1423664650,1423664668,'alyohina.i.wezom@gmail.com','127.0.0.1',0,'5484d3ac6c180bd4d84b548b7f25a96c0e988c6d'),(7,1424248369,NULL,'demyanenko.v.wezom@gmail.com','127.0.0.1',1,'304003ffedc5899e1d16cbe5cfcd4eab844dd8ff'),(8,1424248645,NULL,'demyanenko.v.wezgom@gmail.com','127.0.0.1',1,'e30e0d5e8465bdcbc9e19e1b142873e48105ef63'),(9,1424249058,NULL,'alyohina.i.wezo4m@gmail.com','127.0.0.1',1,'09fac4dd7240aa34473193a5f0d95e7ecf708d43'),(10,1424334784,NULL,'demyanenko.v.wezom@gmailf.com','127.0.0.1',1,'4c2c15a998205e728f33dca938bce607d9502fec'),(11,1424334792,NULL,'admin@ds.sds','127.0.0.1',0,'af9157aa20e2397207146cbc52317f5738a0ae8a'),(12,1426685865,NULL,'test.wezom@mail.ru','178.136.229.251',1,'77acb593f3eda63e6a4f77c05a3dc18231dd26fc'),(13,1430912853,1442249451,'osadlhs2@mail.ru','127.0.0.1',1,'6253e4890ade30af4de534837a8adb96'),(16,1442249463,NULL,'osadlhs@mail.ru',NULL,1,NULL);
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:51:50
