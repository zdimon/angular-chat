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
-- Table structure for table `mail_templates`
--

DROP TABLE IF EXISTS `mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_templates`
--

LOCK TABLES `mail_templates` WRITE;
/*!40000 ALTER TABLE `mail_templates` DISABLE KEYS */;
INSERT INTO `mail_templates` VALUES (1,'Контактная форма ( Администратору )','Новое сообщение из контактной формы - сайт {{site}}','<p>Вам пришло новое письмо из контактной формы с сайта {{site}}!</p>\r\n<p>Имя отправителя: {{name}} ( {{ip}} ).</p>\r\n<p>E-Mail отправителя: {{email}}.</p>\r\n<p>IP отправителя: {{ip}}.</p>\r\n<p>Дата сообщения: {{date}}.</p>\r\n<p>Текст сообщения: {{text}}.</p>\r\n<p>&nbsp;</p>\r\n<p>Письмо сгенерировано автоматически. Пожалуйста не отвечайте на него!</p>',1430937977,1),(4,'Подтверждение регистрации ( Пользователю )','Please confirm your email address, website {{site}}','<p><span class=\"translation-chunk\" data-align=\"0:7\">Dear</span> <span class=\"translation-chunk\" data-align=\"9:14\">sir !</span> <span class=\"translation-chunk\" data-align=\"15:46\">to confirm the registration</span> <span class=\"translation-chunk\" data-align=\"48:56\">on the website</span>&nbsp;{{site}}, click on the link:</p>\r\n<p>{{link}}&nbsp;<img src=\"http://marriage-brides.com/Media/files/filemanager/marriage-brides.com.jpg\" alt=\"\" width=\"403\" height=\"604\" /></p>',1447471737,0),(5,'Восстановление пароля ( Пользователю )','password recovery','<p>Your new password to access the site&nbsp;{{site}}:</p>\r\n<p>{{password}}</p>',1447423197,1),(6,'Изменение пароля ( Пользователю )','Change password - {{site}}','<p>Ваш новый пароль:</p>\r\n<p>{{password}}</p>',1447423226,1),(13,'Письмо пользователю после ответа администратором на заявку','Thanks! We\'ve received your Customer Care feedback!','<p><strong>Hello {{name}}!</strong></p>\r\n<p>Thank you for taking the time to write to us.</p>\r\n<p>{{answer}}</p>\r\n<p>With Love &amp; Lipstick,</p>\r\n<p>Administration of Marriage-Brides</p>\r\n<p>&nbsp;</p>\r\n<p><em>{{name}}</em></p>\r\n<p><em>{{email}}</em></p>\r\n<p><strong>{{topic}}</strong></p>\r\n<p>{{text}}</p>',1435757883,1),(14,'Письмо на емейлы агенства после утверждения','Thanks for being with us!','<p>Your agency {{agency}} was successfully activated!</p>',1435757883,1),(15,'Письмо на емейл созданного администратора агенства после утвержд','Your data to login to site {{site}}','<p>Hello, {{name}}!</p><p>Your data to login to site {{site}} are:</p><ul><li>login: <b>{{email}}</b></li><li>Password: <b>{{password}}</b></li></ul>',1435757883,1),(16,'Письмо на все емейлы агенства после его деактивации','Your agency has been deactivated','<p>Hello!</p><p>Agency {{agency}} was deactivated on the site {{site}} by this reason:</p><p>{{reason}}</p>',1435757883,1);
/*!40000 ALTER TABLE `mail_templates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:53:11
