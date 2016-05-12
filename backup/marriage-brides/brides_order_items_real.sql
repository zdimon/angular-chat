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
-- Table structure for table `order_items_real`
--

DROP TABLE IF EXISTS `order_items_real`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items_real` (
  `id_order_real` int(10) DEFAULT NULL,
  `id_real_gift` int(10) DEFAULT NULL,
  `cost` int(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  KEY `virual_items` (`id_order_real`) USING BTREE,
  CONSTRAINT `order_items_real_ibfk_1` FOREIGN KEY (`id_order_real`) REFERENCES `order_real_gifts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items_real`
--

LOCK TABLES `order_items_real` WRITE;
/*!40000 ALTER TABLE `order_items_real` DISABLE KEYS */;
INSERT INTO `order_items_real` VALUES (1,40,30,2),(2,50,50,1),(3,41,30,1),(4,74,10,1),(5,41,30,1),(6,40,30,2),(7,40,30,1),(8,40,30,1),(9,40,30,1),(10,39,30,1),(11,40,30,1),(12,39,30,1),(13,39,30,1),(14,39,30,1),(15,40,30,1),(16,41,30,1),(16,40,30,10),(16,39,30,1),(17,40,30,2),(18,59,20,1),(19,40,30,3),(20,40,30,1),(21,40,30,1),(22,40,30,1),(23,40,30,1),(24,40,30,1),(25,40,30,2),(26,40,30,1),(27,67,100,1),(28,40,30,1),(29,40,30,1),(30,40,30,1),(31,41,30,1),(31,40,30,1),(32,41,30,1),(33,40,30,1),(34,40,30,2),(35,50,50,1),(35,39,30,1),(36,54,150,1),(37,40,30,1),(38,40,30,1),(39,40,30,1),(40,40,30,1),(40,50,50,1),(41,72,300,1),(42,40,30,1),(43,40,30,1),(44,40,30,1),(45,41,30,2),(46,40,30,1),(47,40,30,1),(48,40,30,1),(49,40,30,1),(50,50,50,1),(51,69,3000,1),(52,46,75,1),(53,40,30,1),(54,40,30,1),(55,40,30,1),(56,40,30,1),(57,40,30,1),(58,50,50,1);
/*!40000 ALTER TABLE `order_items_real` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:51:54
