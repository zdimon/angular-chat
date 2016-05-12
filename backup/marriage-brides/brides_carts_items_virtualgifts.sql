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
-- Table structure for table `carts_items_virtualgifts`
--

DROP TABLE IF EXISTS `carts_items_virtualgifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts_items_virtualgifts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cart_id` int(10) NOT NULL,
  `virtualgift_id` int(10) NOT NULL,
  `count` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cart` (`cart_id`) USING BTREE,
  KEY `id_goods` (`virtualgift_id`) USING BTREE,
  KEY `cart_id` (`cart_id`) USING BTREE,
  KEY `catalog_id` (`virtualgift_id`) USING BTREE,
  CONSTRAINT `carts_items_virtualgifts_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts_virtualgifts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=500 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts_items_virtualgifts`
--

LOCK TABLES `carts_items_virtualgifts` WRITE;
/*!40000 ALTER TABLE `carts_items_virtualgifts` DISABLE KEYS */;
INSERT INTO `carts_items_virtualgifts` VALUES (198,2944,7,1),(199,2944,21,3),(200,2944,19,6),(201,2944,17,8),(202,2944,15,6),(203,2944,27,2),(249,2957,6,45),(250,2992,31,1),(251,2992,30,1),(252,2992,29,1),(270,3209,26,1),(275,3195,30,1),(280,2989,32,1),(281,2989,31,1),(341,3141,31,1),(351,37412,11,1),(352,3272,28,1),(373,38065,8,4),(376,37940,31,3),(377,37940,30,1),(379,37420,32,1),(380,37428,7,1),(381,37426,27,1),(390,39689,8,1),(391,40032,38,1),(394,40346,47,1),(395,40346,45,1),(410,41721,48,1),(440,42456,8,1),(450,42575,7,1),(454,75253,47,1),(455,75253,14,1),(456,75253,25,1),(457,75253,9,1),(486,159037,18,1),(487,159037,37,1),(488,159037,30,1),(498,165176,32,1);
/*!40000 ALTER TABLE `carts_items_virtualgifts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:51:11
