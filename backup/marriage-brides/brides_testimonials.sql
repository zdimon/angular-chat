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
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials` (
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
  `views` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,1432039607,1462214108,1,'Olga and Frank','olga-and-frank4287',1431900000,'<div id=\"lipsum\">\r\n<p>I want to tell you the story of our love. I was a member on many websites but without success. I met Frank in two weeks after my registration on this site. Maybe it was fate but I liked him right away. We started talking though chat and writing letters. It was great but we needed more. We wanted to talk all the time. Then we started to talk on the phone and through mail. He said he wanted to come meet me. I waited for him for more than 2 months. I was so glad because I knew that I already love this man. When we met each other at the airport, we finally understood that we were born for each other. We spent a wonderful week together. We did everything together. We could be talking for 3 hours but it felt like 10 min. We are so happy we found our true love, each other.<br /><br />Olga and Frank</p>\r\n</div>','Olga and Frank','Olga and Frank','Olga and Frank','Olga and Frank','6f3065cc5747bf4e15c6788d587b491b.jpg',110),(2,1441271066,1462315963,1,'Christina and Enrico','christina-and-enrico',1441231200,'<p style=\"text-align: right;\">Hello! Before all I would like to thank you for your professional help to meet Christina. She is a wonderful girl and also good at Italian language. Our meeting was not very long and I would like to develop my friendship with her. I am an eyes surgeon, busy in research and in writing in scientific magazines, but I believe that it\'s better to meet some girls to choose the best. I receive about 80 letters every day and I wish I was able to understand their character. Obviously I\'ll be happy to tell you that I will be satisfied. In Italy we say that the good day can be seen from the morning and I am really interested in Christina.<br /><br />Christina and Enrico</p>','Christina and Enrico','title','Christina and Enrico','Christina and Enrico','b10da3af03918fa3faf9ae009b17aab4.jpg',66),(6,1441271972,1462133504,1,'Tatiana and Mickey','tatiana-and-mickey',1441231200,'<p>I had a wonderful time with Tatiana. When Tatiana came to my door and I saw her for the first time, she was more beautiful than her photos. I was so nervous, but we instantly made a connection, it felt as if we new each other for years. I enjoyed every minute with Tatiana, she made me feel so relaxed.Tatiana and myself stay in contact and I am coming back to Ukraine to be with Tatiana again. I enjoyed Ukraine very much it is a very interesting country with amazing people, the Ukrainian people are always willing to help due to the language barrier and I managed very well with the help of the people. The Marriage-Brides team and translators where very helpful. They were very professional. I would like to say to all the gents, treat the woman like a lady and always consider the lady\'s feelings. Marriage-Brides is fantastic.<br /><br />Tatiana and Mickey</p>','Tatiana and Mickey','title','Tatiana and Mickey','Tatiana and Mickey','0b9160465e00c5463706fceda49fb690.jpg',41),(8,1441280622,1462119801,1,' Elena and Braulio','-elena-and-braulio',1445637600,'<p>Dearest Marriage-Brides team, with all sincerity and soulfulness of my heart I want to say that you really make dreams come true. To all people who are searching, I want to say that never give up and always believe in your dreams, believe in Your true love and it will find you, as it happened with me and Braulio. We have found each other by destiny and we have been writing to each other for many years. This summer was magnificent time for us, we were traveling and enjoying time together. We continue to write to each other and call each other every day, to make the distance short . I want to say that I am the happiest woman, because I met my true love. And I wish everyone to find happiness and true love.&nbsp;<br />Elena and Braulio&nbsp;</p>',' Elena and Braulio',' Elena and Braulio',' Elena and Braulio',' Elena and Braulio','320775c14d6f2574d988329eec6bcf23.jpg',41),(9,1441287161,1462119840,1,'Irina and Scoot ','irina-and-scoot-',1447282800,'<p>When I registered, I thought that relationships can\\\'t be developed on the web site. Thanks to Marriage-Brides , I changed my mind. I met a very nice man here - Scott. We communicated for a long time and those were happy hours) He wants make his woman happy every day, he has a great sense of humor, he wants to travel. We have a lot in common and maybe that is why we decided to have a meeting in real life.Our meeting was so nice, we were smiling, talking and sometimes - just only looking in each other\\\'s eyes. I could see his soul in his eyes and his desire to be with me and that makes me feel very good. I want to thank Marriage-Brides for this opportunity!&nbsp;<br />Irina and Scoot</p>','Irina and Scoot ','Irina and Scoot ','Irina and Scoot ','Irina and Scoot ','7d0498738343ae9e5904eb903862f149.jpg',45),(10,1441352902,1462119758,1,'Anna and Matt ','anna-and-matt-',1450738800,'<p>I want to thank Marriage-Brides for acquainting me with Anna. After meeting online and chatting for a month we decided to meet in person. I made the trip to Ukraine and it was wonderful. Meeting in person was a very special moment for us both and she exceeded all my expectations! Julia from the agency was a big help and a lot of fun. Our time spent together was casual and fun. We enjoyed getting to know more about one another in person. It\'s amazing to think what Marriage-Brides makes possible. Bringing together two people from great distances who share the same dreams, perhaps to fall in love and be happy together for many years to come. Thanks again Marriage-Brides, for allowing me the opportunity to meet Anna!&nbsp;<br />Anna and Matt&nbsp;</p>','Anna and Matt ','Anna and Matt ','Anna and Matt ','Anna and Matt ','0afafa6b33f351cabc55d2bac676bc6c.jpg',55),(13,1445601752,1445829057,0,'Тест 1','test-1',1445551200,'<p>ауцащкцрет пыатп аы ьиаи аьивт</p>','','','','','8e17299b13b8423b0c03e85279db07a0.jpg',1),(14,1445601773,1445829028,0,'Тест 2','test-2',1445551200,'<p>аапдпотппа итапл тиьт имьтмьи мить</p>','','','','',NULL,1),(15,1445601918,1445829042,0,'Тест 3','test-3',1445551200,'<p>птапаодп папптп атьпвп птаьп автьпвпи</p>','','','','',NULL,1),(16,1445601942,1445829073,0,'Тест 5','test-5',1445551200,'<p>папдоарпат иврвпы ррти тпв пврьтвпр</p>','','','','',NULL,1),(17,1445601942,1445828886,0,'Тест 5','test-53849',1445551200,'<p>папдоарпат иврвпы ррти тпв пврьтвпр</p>','','','','',NULL,2),(18,1445602449,1445828827,0,'Тест 6','test-6',1445551200,'','','','','',NULL,1),(19,1445602476,1445828807,0,'Тест 8','test-8',1445551200,'','','','','',NULL,1),(20,1445602601,1445828723,0,'Тест 10','test-10',1445551200,'','','','','',NULL,1),(21,1445602619,1445828866,0,'Тест 11','test-11',1445551200,'','','','','',NULL,3),(22,1445602644,1455836506,0,'Olga and Frank','olga-and-frank',1445551200,'<p>I want to tell you the story of our love. I was a member on many websites but without success. I met Frank in two weeks after my registration on this site. Maybe it was fate but I liked him right away. We started talking though chat and writing letters. It was great but we needed more. We wanted to talk all the time. Then we started to talk on the phone and through mail. He said he wanted to come meet me. I waited for him for more than 2 months. I was so glad because I knew that I already love this man. When we met each other at the airport, we finally understood that we were born for each other. We spent a wonderful week together. We did everything together. We could be talking for 3 hours but it felt like 10 min. We are so happy we found our true love, each other.<br /><br />Olga and Frank</p>','','','','','6f6cb60baaa8e74c603ea111375ae5bd.png',4);
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:52:55
