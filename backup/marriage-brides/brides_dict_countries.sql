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
-- Table structure for table `dict_countries`
--

DROP TABLE IF EXISTS `dict_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict_countries` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict_countries`
--

LOCK TABLES `dict_countries` WRITE;
/*!40000 ALTER TABLE `dict_countries` DISABLE KEYS */;
INSERT INTO `dict_countries` VALUES (1,'USA',1432538636,0,1),(2,'Ukraine',1432538640,0,1),(3,'Canada',1432561103,1432643956,1),(4,'Russia',1432561107,0,1),(5,'Mexico',1432561114,0,1),(6,'Italy',1432561119,0,1),(7,'Dominicana',1432561134,0,1),(8,'Spain',1432561145,0,1),(9,'Japan',1432561150,0,1),(10,'China',1432561154,0,1),(11,'Poland',1432642310,0,1),(12,'Turkey',1432643256,0,1),(13,'Belarus',1432644053,0,1),(14,'Costa Rica',1432644121,0,1),(16,'Greece',1432644563,0,1),(17,'Scandinavian countries, France, Tropics islands',1447715963,0,0),(18,'karaiviki',1452284538,0,0),(19,'Around Europe',1452314494,0,0),(20,'Germany',1452314529,0,0),(21,'Domenicana',1453415371,0,0),(22,'Tüm dünya ülkeleri',1453460677,0,0),(23,'Dünya turu',1453460835,0,0),(24,'Portugal, Caribic, Australia, South Pac',1453910042,0,0),(25,'Portugal, Caribean, Australia, South sea',1453910478,0,0),(26,'Portugal, Caribean islands, south sea, Australia',1453918010,0,0),(27,'Caribean Sea',1453963686,0,0),(28,'Pacific islands',1456295366,0,0),(29,'Carribean',1457136986,0,0),(30,'AFTER',1458834240,0,0),(31,'Slovenia',1458932221,0,0),(32,'Bahamas',1461896346,0,0),(33,'wold wide',1461922533,0,0),(34,'world wide',1461935702,0,0);
/*!40000 ALTER TABLE `dict_countries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:50:50
