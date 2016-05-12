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
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `date` int(10) DEFAULT NULL,
  `text` text,
  `h1` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `keywords` text,
  `image` varchar(255) DEFAULT NULL,
  `show_image` tinyint(1) NOT NULL DEFAULT '1',
  `views` int(10) NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned DEFAULT '0' COMMENT '0 - девкам и незарегестрированным, 1 - мужикам',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (8,1455662372,1462341572,1,' ATTENTION +20% OF YOUR BONUS FOR APRIL ','bonus-20---from-april',1462053600,'<p>Dear Sirs! in April on our website discount portal ! You will be added + 20% coins of the value of Your purchase&nbsp;<br /><br /></p>\r\n<p><span class=\"translation-chunk\" data-align=\"0:16\">the bonus is</span> <span class=\"translation-chunk\" data-align=\"19:34\">if you buy</span> <span class=\"translation-chunk\" data-align=\"36:41\">more than</span> <span class=\"translation-chunk\" data-align=\"42:54\">100 coins for</span> <span class=\"translation-chunk\" data-align=\"56:69\">one purchase.&nbsp;<span class=\"translation-chunk\" data-align=\"0:16\">If</span> <span class=\"translation-chunk\" data-align=\"17:32\">you have not received</span> <span class=\"translation-chunk\" data-align=\"42:52\">your bonus</span> <span class=\"translation-chunk\" data-align=\"33:40\">in time</span> <span class=\"translation-chunk\" data-align=\"53:64\">please</span> <span class=\"translation-chunk\" data-align=\"68:89\">inform</span> <span class=\"translation-chunk\" data-align=\"90:112\">the customer service of the website</span> <span class=\"translation-chunk\" data-align=\"113:147\">official.marriage.brides@gmail.com</span></span></p>\r\n<p><img src=\"http://marriage-brides.com/Media/files/filemanager/2b127b.jpg\" alt=\"\" width=\"486\" height=\"300\" /></p>','','','','','2f2107cea5c12250a51500ea98211c4b.png',1,93,0),(9,1457966129,1458973778,0,'Dear sir ! today, there may be errors in the chat ! go work on the website','dear-sir--today-there-may-be-errors-in-the-chat--go-work-on-the-website',1457910000,'<p><span class=\"translation-chunk\" data-align=\"0:7\">Dear</span> <span class=\"translation-chunk\" data-align=\"8:13\">sir !</span> <span class=\"translation-chunk\" data-align=\"15:31\">today, there may be</span> <span class=\"translation-chunk\" data-align=\"32:48\">errors in the</span> <span class=\"translation-chunk\" data-align=\"49:53\">chat</span><span class=\"translation-chunk\"> ! </span><span class=\"translation-chunk\" data-align=\"56:67\">go work</span> <span class=\"translation-chunk\" data-align=\"69:77\">on the website</span></p>','','','','',NULL,1,3,1),(10,1458651947,1458682567,0,'Dear sir ! if you have a problem in the chat  ! You need to clean browser cache','dear-sir--if-you-have-a-problem-in-the-chat---you-need-to-clean-browser-cache',1458601200,'<p><span class=\"translation-chunk\" data-align=\"0:7\">Dear</span> <span class=\"translation-chunk\" data-align=\"9:14\">sir !</span> <span class=\"translation-chunk\" data-align=\"16:20\">if</span> <span class=\"translation-chunk\" data-align=\"22:39\">you have a problem in</span> <span class=\"translation-chunk\" data-align=\"40:44\">the chat</span><span class=\"translation-chunk\"> , </span><span class=\"translation-chunk\" data-align=\"48:57\">you need</span> <span class=\"translation-chunk\" data-align=\"59:68\">to clean</span> <span class=\"translation-chunk\" data-align=\"74:87\">&nbsp;browser</span> <span class=\"translation-chunk\" data-align=\"70:73\">cache</span> <span class=\"translation-chunk\" data-align=\"89:103\">and log in again</span> <span class=\"translation-chunk\" data-align=\"104:111\">to the site</span> <span class=\"translation-chunk\" data-align=\"112:119\">just</span> <span class=\"translation-chunk\" data-align=\"122:123\">about</span> <span class=\"translation-chunk\" data-align=\"124:128\">all</span> <span class=\"translation-chunk\" data-align=\"130:147\">errors report</span> <span class=\"translation-chunk\" data-align=\"150:151\">in</span> <span class=\"translation-chunk\" data-align=\"154:171\">support</span> <span class=\"translation-chunk\" data-align=\"172:177\">of the site</span> <span class=\"translation-chunk\" data-align=\"180:214\">official.marriage.brides@gmail.com</span></p>','','','','','cd1891a8e33667a0ca7dfc4201c10274.jpg',0,2,1),(11,1458654197,1459282866,0,'Dear sir we have updated the chat ! in case of errors report to support official.marriage.brides@gmail.com','dear-sir-we-have-updated-the-chat--in-case-of-errors-report-to-support-officialmarriagebridesgmailcom',1459202400,'<p><span class=\"translation-chunk\" data-align=\"0:7\">Dear</span> <span class=\"translation-chunk\" data-align=\"9:12\">sir</span> <span class=\"translation-chunk\" data-align=\"14:26\">we have updated</span> <span class=\"translation-chunk\" data-align=\"27:30\">the chat</span><span class=\"translation-chunk\"> ! </span><span class=\"translation-chunk\" data-align=\"34:35\">in</span> <span class=\"translation-chunk\" data-align=\"36:76\">case of errors report</span> <span class=\"translation-chunk\" data-align=\"81:94\">to support</span> <span class=\"translation-chunk\" data-align=\"95:129\">official.marriage.brides@gmail.com</span></p>','','','','','b7863130b1c6cff8c5d0a36c0a33c9c1.jpg',0,1,1),(12,1460294342,1460294386,0,'Dear sir ! today, there may be errors in the chat ! go work on the website','dear-sir--today-there-may-be-errors-in-the-chat--go-work-on-the-website1995',1460239200,'<p><span class=\"translation-chunk\" data-align=\"0:7\">Dear</span>&nbsp;<span class=\"translation-chunk\" data-align=\"8:13\">sir !</span>&nbsp;<span class=\"translation-chunk\" data-align=\"15:31\">today, there may be</span>&nbsp;<span class=\"translation-chunk\" data-align=\"32:48\">errors in the</span>&nbsp;<span class=\"translation-chunk\" data-align=\"49:53\">chat</span><span class=\"translation-chunk\">&nbsp;!&nbsp;</span><span class=\"translation-chunk\" data-align=\"56:67\">go work</span>&nbsp;<span class=\"translation-chunk\" data-align=\"69:77\">on the website</span></p>','','','','',NULL,0,0,1),(13,1460544583,1461088755,0,'Dear sir ! if your chat doesn\'t work , clean cache of your browser and visit the site again','dear-sir--if-your-chat-doesnt-work--clean-cache-of-your-browser-and-visit-the-site-again',1460498400,'<p><span class=\"translation-chunk\" data-align=\"0:7\">Dear</span> <span class=\"translation-chunk\" data-align=\"8:13\">sir !</span> <span class=\"translation-chunk\" data-align=\"16:20\">if</span> <span class=\"translation-chunk\" data-align=\"21:25\">your</span> <span class=\"translation-chunk\" data-align=\"26:29\">chat</span> <span class=\"translation-chunk\" data-align=\"31:43\">doesn\'t work</span> <span class=\"translation-chunk\" data-align=\"45:57\">, clean</span> <span class=\"translation-chunk\" data-align=\"59:62\">cache</span> <span class=\"translation-chunk\" data-align=\"63:105\">of your browser and visit the site again</span><img src=\"http://marriage-brides.com/Media/files/filemanager/tasto-10-architetto-fran-01.png\" alt=\"\" width=\"149\" height=\"149\" /></p>','','','','','93f70abddc55d906bb8a08d6448557f8.jpg',0,3,1),(14,1460544629,1461684848,0,'Dear sir ! if your chat doesn\'t work , clean cache of your browser and visit the site again','dear-sir--if-your-chat-doesnt-work--clean-cache-of-your-browser-and-visit-the-site-again5689',1460498400,'<p><span class=\"translation-chunk\" data-align=\"0:7\">Dear</span> <span class=\"translation-chunk\" data-align=\"8:13\">sir !</span> <span class=\"translation-chunk\" data-align=\"16:20\">if</span> <span class=\"translation-chunk\" data-align=\"21:25\">your</span> <span class=\"translation-chunk\" data-align=\"26:29\">chat</span> <span class=\"translation-chunk\" data-align=\"31:43\">doesn\'t work</span> <span class=\"translation-chunk\" data-align=\"45:57\">, clean</span> <span class=\"translation-chunk\" data-align=\"59:62\">cache</span> <span class=\"translation-chunk\" data-align=\"63:105\">of your browser and visit the site again</span><img src=\"http://marriage-brides.com/Media/files/filemanager/tasto-10-architetto-fran-01.png\" alt=\"\" width=\"108\" height=\"108\" /></p>','','','','','b4619d62327c9191bf676e6b35951bc7.jpg',0,12,0);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:53:17
