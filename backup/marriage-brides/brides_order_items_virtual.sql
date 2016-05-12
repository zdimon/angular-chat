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
-- Table structure for table `order_items_virtual`
--

DROP TABLE IF EXISTS `order_items_virtual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items_virtual` (
  `id_order_virtual` int(10) DEFAULT NULL,
  `id_virtual_gift` int(10) DEFAULT NULL,
  `cost` int(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  KEY `virual_items` (`id_order_virtual`) USING BTREE,
  CONSTRAINT `order_items_virtual_ibfk_1` FOREIGN KEY (`id_order_virtual`) REFERENCES `order_virtual_gifts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items_virtual`
--

LOCK TABLES `order_items_virtual` WRITE;
/*!40000 ALTER TABLE `order_items_virtual` DISABLE KEYS */;
INSERT INTO `order_items_virtual` VALUES (1,45,15,1),(2,32,15,2),(3,31,15,1),(4,49,10,1),(5,32,15,1),(5,33,15,1),(6,48,15,1),(7,38,15,1),(7,37,15,1),(7,45,15,1),(7,47,15,1),(7,48,15,1),(8,32,15,1),(9,31,15,1),(10,31,15,1),(10,32,15,1),(11,31,15,1),(11,32,15,1),(12,31,15,1),(12,32,15,1),(13,31,15,1),(13,32,15,1),(14,30,15,1),(14,31,15,1),(14,32,15,1),(14,33,15,1),(14,34,15,1),(14,48,15,1),(14,37,15,1),(14,38,15,1),(14,45,15,1),(14,47,15,1),(15,37,15,1),(15,38,15,1),(15,45,15,1),(15,47,15,1),(15,48,15,1),(16,32,15,3),(17,31,15,1),(17,32,15,1),(18,47,15,1),(19,31,15,1),(19,32,15,1),(20,31,15,1),(20,32,15,1),(21,47,15,1),(21,48,15,1),(22,33,15,1),(22,7,15,1),(23,32,15,1),(25,32,15,1),(26,31,15,1),(27,47,15,1),(28,32,15,1),(29,32,15,1),(30,32,15,1),(31,47,15,1),(32,45,15,1),(32,47,15,1),(33,32,15,1),(34,45,15,1),(35,47,15,1),(36,45,15,1),(37,47,15,1),(38,47,15,1),(39,45,15,1),(40,45,15,1),(41,47,15,1),(42,38,15,1),(43,33,15,1),(44,38,15,1),(45,47,15,1),(46,20,15,1),(47,47,15,1),(48,45,15,1),(49,45,15,1),(50,45,15,1),(51,45,15,1),(52,45,15,1),(53,45,15,1),(54,47,15,1),(55,18,15,1),(55,48,15,1),(56,21,15,1),(57,45,15,1),(57,47,15,1),(58,45,15,1),(59,47,15,1),(60,47,15,1),(61,47,15,1),(62,48,15,1),(63,47,15,1),(64,45,15,1),(65,45,15,1),(67,47,15,1),(68,48,15,1),(69,45,15,1),(70,45,15,1),(71,48,15,1),(72,47,15,1),(73,45,15,1),(74,47,15,1),(75,47,15,1),(76,47,15,1),(77,21,15,1),(78,45,15,1),(79,45,15,1);
/*!40000 ALTER TABLE `order_items_virtual` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:53:09
