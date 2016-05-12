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
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort` int(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,1432106796,1433337958,0,0,'Nulla posuere nunc quis est interdum, vitae','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin id nisl in dui consectetur tincidunt non et dolor. Cras vel porta diam. Cras viverra eleifend ipsum. Nulla facilisi. Nulla molestie tincidunt augue, nec venenatis sem ultricies eget. Sed enim sem, lacinia quis accumsan quis, auctor eu ligula. Donec justo elit, accumsan sit amet ullamcorper a, scelerisque et nulla. Integer interdum lobortis neque, nec luctus arcu imperdiet vitae. Nulla ut purus dictum, ornare ex sit amet, viverra erat. Quisque sagittis ex nec lacus posuere, eu dapibus nunc tempor. Donec in mauris purus. Phasellus ac dui eleifend, suscipit arcu non, tincidunt lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras ullamcorper volutpat metus at tempor. Nulla lobortis dignissim lacus, vitae lacinia nisi eleifend et. Suspendisse mollis purus lobortis, gravida velit non, sodales leo.</p>'),(2,1432106832,NULL,0,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur at. ','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi rutrum fermentum lorem, in euismod dui facilisis quis. Etiam orci odio, dapibus non tempor vitae, congue non magna. Nullam id ex at turpis rhoncus tempor. In pharetra ut libero nec auctor. Nulla facilisi. Cras hendrerit massa odio, sit amet blandit sapien eleifend sit amet. Suspendisse rhoncus posuere lacus ac venenatis. Cras blandit tristique scelerisque. Proin ut urna semper, sagittis elit eget, interdum leo. Sed lacinia ante sit amet vehicula condimentum. Etiam varius odio sapien, ut aliquet magna euismod eget.</p>'),(3,1441274409,NULL,0,0,'Тестовый Faq','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed maximus lorem. Vivamus sed metus aliquet, tempor turpis sit amet, volutpat risus. Fusce magna neque, pellentesque vitae purus vel, pellentesque maximus ante. Vivamus diam lectus, lobortis nec ipsum quis, laoreet semper odio. Nam consectetur nisi turpis, ut pulvinar justo aliquam vitae. Fusce egestas eros sodales, aliquam erat sed, vulputate massa. Mauris eu dolor vitae dui tempus semper. Cras elementum, nibh vel scelerisque dignissim, metus orci malesuada tellus, maximus eleifend urna libero quis ipsum. Ut ex lectus, scelerisque sed cursus nec, ullamcorper ut elit.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed maximus lorem. Vivamus sed metus aliquet, tempor turpis sit amet, volutpat risus. Fusce magna neque, pellentesque vitae purus vel, pellentesque maximus ante. Vivamus diam lectus, lobortis nec ipsum quis, laoreet semper odio. Nam consectetur nisi turpis, ut pulvinar justo aliquam vitae. Fusce egestas eros sodales, aliquam erat sed, vulputate massa. Mauris eu dolor vitae dui tempus semper. Cras elementum, nibh vel scelerisque dignissim, metus orci malesuada tellus, maximus eleifend urna libero quis ipsum. Ut ex lectus, scelerisque sed cursus nec, ullamcorper ut elit.</p>');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:51:43
