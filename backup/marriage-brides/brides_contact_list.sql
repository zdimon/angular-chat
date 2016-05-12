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
-- Table structure for table `contact_list`
--

DROP TABLE IF EXISTS `contact_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_list` (
  `user_id` int(10) DEFAULT NULL,
  `contact_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_list`
--

LOCK TABLES `contact_list` WRITE;
/*!40000 ALTER TABLE `contact_list` DISABLE KEYS */;
INSERT INTO `contact_list` VALUES (38,45),(45,35),(45,38),(45,34),(14,52),(32,14),(34,14),(52,14),(46,52),(52,46),(52,56),(56,52),(57,56),(52,54),(54,52),(54,57),(56,57),(57,54),(32,54),(54,32),(61,52),(52,61),(34,54),(66,54),(54,66),(45,32),(46,54),(46,66),(66,46),(38,46),(46,38),(68,32),(32,68),(14,40),(41,14),(38,28),(69,70),(70,69),(69,41),(14,31),(45,31),(32,76),(76,32),(77,32),(45,52),(45,71),(32,80),(34,80),(38,80),(80,38),(80,32),(80,66),(32,81),(14,32),(38,75),(38,14),(38,68),(32,64),(32,75),(26,32),(75,32),(32,99),(34,99),(38,99),(56,40),(99,40),(40,99),(32,46),(99,32),(93,32),(32,93),(34,93),(95,34),(95,32),(99,57),(57,99),(108,32),(46,32),(32,95),(45,70),(32,26),(28,32),(14,37),(32,45),(14,105),(32,69),(40,26),(38,26),(26,38),(32,28),(28,38),(46,34),(69,32),(14,34),(26,119),(119,26),(28,119),(31,45),(14,122),(26,57),(26,122),(37,14),(46,71),(31,14),(164,32),(32,164),(38,164),(34,164),(164,34),(164,31),(164,38),(26,113),(26,165),(172,164),(164,172),(85,52),(85,172),(164,165),(165,164),(164,167),(167,164),(45,113),(164,37),(175,167),(14,172),(50,172),(175,165),(165,175),(167,175),(26,172),(50,32),(175,127),(50,167),(26,167),(184,167),(184,32),(190,167),(190,32),(45,172),(45,159),(207,172),(207,159),(14,167),(207,32),(207,34),(207,167),(172,207),(175,141),(175,172),(14,212),(212,175),(208,213),(213,175),(14,213),(175,213),(208,32),(214,213),(214,32),(175,32),(175,217),(14,157),(14,159),(14,218),(234,235),(234,31),(31,234),(234,236),(234,232),(234,122),(32,175),(122,234),(32,251),(70,175),(14,236),(259,32),(32,259),(259,31),(26,243),(269,275),(275,137),(275,138),(275,224),(138,275),(224,275),(137,273),(70,275),(124,288),(159,292),(277,292),(124,292),(70,296),(132,298),(129,306),(122,292),(122,313),(122,331),(350,272),(227,272),(272,227),(272,344),(344,272),(227,425),(70,429),(14,227),(236,375),(296,70),(70,26),(221,442),(137,275),(445,236),(236,445),(445,219),(445,227),(219,445),(227,445),(340,14),(14,417),(135,14),(70,445),(445,70),(352,130),(130,352),(446,352),(70,465),(429,137),(137,429),(137,464),(137,352),(446,464),(130,296),(70,352),(26,285),(285,26),(130,464),(464,137),(464,343),(343,464),(70,475),(137,475),(446,466),(446,475),(446,459),(446,445),(130,475),(130,482),(444,482),(70,14),(70,486),(486,70),(130,429),(475,246),(14,70),(26,70),(26,137),(446,429),(246,475),(70,464),(445,446),(137,296),(137,367),(137,445),(137,427),(137,272),(137,378),(137,375),(232,475),(475,219),(219,475),(219,429),(70,272),(70,454),(70,367),(70,319),(70,510),(446,454),(70,513),(506,513),(137,513),(130,513),(130,14),(70,482),(482,137),(484,424),(484,506),(139,484),(484,139),(137,482),(137,484),(130,484),(70,484),(130,445),(130,512),(130,449),(484,130),(130,375),(130,532),(475,141),(130,454),(130,538),(130,545),(545,70),(545,446),(545,277),(446,545),(545,502),(424,534),(424,545),(424,530),(424,527),(424,518),(424,475),(424,466),(424,460),(424,459),(424,429),(424,407),(424,381),(414,510),(414,507),(414,466),(414,429),(414,392),(414,388),(414,375);
/*!40000 ALTER TABLE `contact_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:51:14
