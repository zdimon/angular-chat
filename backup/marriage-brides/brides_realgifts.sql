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
-- Table structure for table `realgifts`
--

DROP TABLE IF EXISTS `realgifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realgifts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `image` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `cost` int(10) DEFAULT '0',
  `text` text,
  `parent_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realgifts`
--

LOCK TABLES `realgifts` WRITE;
/*!40000 ALTER TABLE `realgifts` DISABLE KEYS */;
INSERT INTO `realgifts` VALUES (37,1440774209,1444425125,1,'c9588f32d20cfc4511b725da41b0b0c2.jpg','Parfumes',500,'Nina Ricci 50ml',35),(39,1440774209,1443571242,1,'77a27b158140f1ae2be392e9db4a689f.jpg','White Roses',30,'Perfect roses from Holland. The minimum quantity for an order is 3 roses.',34),(40,1440774209,1443571253,1,'1f00c6a0b19e2c01ecfd9f7352b55fa3.jpg','Red Roses',30,'Perfect roses from Holland. The minimum quantity for an order is 3 roses.',34),(41,1440774576,1443571265,1,'2257a7781f7ee31b339fb84d10374b13.jpg','Pink Roses',30,'Perfect roses from Holland. The minimum quantity for an order is 3 roses.',34),(43,1440774947,1444425106,1,'0c248046927b17b8baee1f50f625f7ea.jpg','Parfumes',500,'Chanel 50ml',35),(45,1440774947,1444425091,1,'cb15094271aa92cf9c55e36fbf9e45b0.jpg','Parfumes',500,'Versace 50ml',35),(46,1440774926,1444424171,1,'4d197040b6c3addbf74d1f0eb048b80f.jpg','Toys',75,'Soft toy',40),(48,1440775685,1444424346,1,'d0d595d447981011b0c90ec825d57d3d.jpg','Candy',50,'Rafaello',36),(50,1440775685,1444424336,1,'aee69d5e6203268f4566e130b499d6a1.jpg','Сandy',50,'Ferrero Rocher',36),(51,1440775658,1444425194,1,'75678d8c1073f96eeac9090b06337ca0.jpg','Сake',90,'Sweet chocolate cake',36),(53,1440775839,1444424588,1,'c0be53ca1ece8609739ef28d77e8ca85.jpg','Candy basket',150,'Chocolate sweets',37),(54,1440775818,1444424599,1,'09ad509cf5cfad1ab75974a11bd9416f.jpg','Fruit basket',150,'Juicy fruit',37),(55,1443570325,1444424556,1,'e952c1dc507190c07bcfa14d0b4fc53f.jpg','Gold ring',1350,'Gold wedding ring 2gr.',40),(56,1443570573,1444425304,1,'cecab71ee4bfec387b5293e504663fc5.jpg','shoes',500,'elegant shoes',40),(59,1443571370,NULL,1,'71b5e10378a2a7283e7dfcdc4793f774.jpg','Carnation',20,'The minimum quantity for an order is 3 carnation',34),(60,1443571828,1444676895,1,'ae312fbd7c61dc8210d40eefebd0eff4.jpg','cosmetics',300,'Eye shadow, lip stick, blush for the face',40),(62,1443624086,1444424648,1,'2958d7ed950e44d5ddbbf74295c13992.jpg','Сhocolates',35,'Sweet candy',36),(64,1443627544,1444425068,1,'cbd567837df4fea7dcf56a3ab39e2260.jpg','Parfumes',500,'Jadore Dior 50ml',35),(65,1443627624,1444425058,1,'e964846fb05530229ac1fbf84cac7fb2.jpg','Parfumes',500,'Dolce&Gabbana 50ml',35),(66,1444425736,1444673729,1,'b8eb5796f3cb2ba5d03befdaf9175c54.jpg','Coat',3500,'Warm coat for lady',40),(67,1444674097,1444674133,1,'9d7aebc2524d68a73819f13930fa8e77.jpg','Orchid',100,'Bouquet of orchids',34),(68,1444675044,1454026476,1,'53370b76d3d8dc22097fe07bc24b7d7a.jpg','Mobile Phone',3870,'iPhone 6',40),(69,1444675581,1444676775,1,'fc2e4e75c73d98b3befbf9b7cf93d24b.jpg','Tablet',3000,'Apple ',40),(70,1444676022,1444677982,1,'e0ea3ddaaf8b537ae1853292dfdb2e41.jpg','The camera',5000,'Nikon ',40),(71,1444676747,NULL,1,'aed0bd845834fb789b3bbd3365fcaf4b.jpg','Notebook',5000,'Apple ',40),(72,1444677636,1444677652,0,'28b30d4c734ef84effa88b6795a8b3cf.jpg','Webcam ',300,'Logitech HD Webcam C270 ',40),(73,1444677871,1444677909,1,'4ad01316950bd76c1b689ebcec95aac6.jpg','Martini',250,'',36);
/*!40000 ALTER TABLE `realgifts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:51:58
