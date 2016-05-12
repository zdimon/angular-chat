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
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `zna` text,
  `updated_at` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(32) DEFAULT NULL,
  `values` text COMMENT 'Возможные значения в json массиве ключ => значение. Для селекта и радио',
  `group` varchar(128) DEFAULT NULL COMMENT 'Группа настроек',
  PRIMARY KEY (`id`),
  KEY `block` (`group`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  CONSTRAINT `config_ibfk_1` FOREIGN KEY (`group`) REFERENCES `config_groups` (`alias`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `config_ibfk_2` FOREIGN KEY (`type`) REFERENCES `config_types` (`alias`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'E-Mail администратора сайта (отправитель по умолчанию)','marriage_brides@yahoo.com',1461786599,1,1,'admin_email',1,'input',NULL,'mail'),(4,'Copyright','All Rights Reserved © Marriage-brides.com 2016',1461786599,1,4,'copyright',1,'input',NULL,'static'),(5,'Отображение всплывающих сообщений на сайте','topRight',1434835221,0,2000,'message_output',1,'radio','[{\"key\":\"Отображать вверху\",\"value\":\"top\"},{\"key\":\"Отображать вверху слева\",\"value\":\"topLeft\"},{\"key\":\"Отображать вверху по центру\",\"value\":\"topCenter\"},{\"key\":\"Отображать вверху справа\",\"value\":\"topRight\"},{\"key\":\"Отображать по центру слева\",\"value\":\"centerLeft\"},{\"key\":\"Отображать по центру\",\"value\":\"center\"},{\"key\":\"Отображать по центру справа\",\"value\":\"centerRight\"},{\"key\":\"Отображать внизу слева\",\"value\":\"bottomLeft\"},{\"key\":\"Отображать внизу по центру\",\"value\":\"bottomCenter\"},{\"key\":\"Отображать внизу справа\",\"value\":\"bottomRight\"},{\"key\":\"Отображать внизу\",\"value\":\"bottom\"}]','basic'),(9,'Количество строк в списках в админ-панели','20',1461786599,1,9,'limit_backend',1,'input',NULL,'basic'),(19,'Использовать СМТП','0',1461786599,1,3,'smtp',1,'select','[{\"key\":\"Да\",\"value\":1},{\"key\":\"Нет\",\"value\":0}]','mail'),(20,'SMTP server','',1461786599,1,4,'host',0,'input',NULL,'mail'),(22,'Логин','1111',1461786599,1,5,'username',0,'input',NULL,'mail'),(23,'Пароль','1111',1461786599,1,6,'password',0,'password',NULL,'mail'),(24,'Тип подключения','tls',1461786599,1,7,'secure',0,'select','[{\"key\":\"TLS\",\"value\":\"tls\"},{\"key\":\"SSL\",\"value\":\"ssl\"}]','mail'),(25,'Порт. Например 465 или 587. (587 по умолчанию)','587',1461786599,1,8,'port',0,'input',NULL,'mail'),(26,'Имя латинницей (отображается в заголовке письма)','Info',1461786599,1,2,'name',1,'input',NULL,'mail'),(27,'Запаролить сайт','0',1461786599,1,0,'auth',1,'select','[{\"key\":\"Да\",\"value\":\"1\"},{\"key\":\"Нет\",\"value\":\"0\"}]','security'),(28,'Логин','1111',1461786599,1,2,'username',0,'input',NULL,'security'),(29,'Пароль','1111',1461786599,1,3,'password',0,'password',NULL,'security'),(30,'Включить минификацию стилей и скриптов','0',1445602989,0,0,'minify',1,'select','[{\"key\":\"Да\",\"value\":\"1\"},{\"key\":\"Нет\",\"value\":\"0\"}]','basic'),(31,'Twitter','https://twitter.com/MarriageBrides',1461786599,1,NULL,'twitter',0,'input',NULL,'socials'),(32,'Facebook','https://www.facebook.com',1461786599,1,NULL,'facebook',0,'input',NULL,'socials'),(33,'Google+','https://plus.google.com/u/0/114537635755850808885',1461786599,1,NULL,'google-plus',0,'input',NULL,'socials'),(34,'Pinterest','https://www.pinterest.com',1461786599,1,NULL,'pinterest',0,'input',NULL,'socials'),(35,'Количество новостей на главной странице','5',1461786599,1,NULL,'limit_news_main_page',1,'select','[{\"key\":\"1\",\"value\":\"1\"},{\"key\":\"2\",\"value\":\"2\"},{\"key\":\"3\",\"value\":\"3\"},{\"key\":\"4\",\"value\":\"4\"},{\"key\":\"5\",\"value\":\"5\"}]','basic'),(36,'Количество новостей / отзывов в списках','20',1461786599,1,NULL,'limit_news',1,'select','[{\"key\":\"5\",\"value\":\"5\"},{\"key\":\"10\",\"value\":\"10\"},{\"key\":\"15\",\"value\":\"15\"},{\"key\":\"20\",\"value\":\"20\"}]','basic'),(37,'Главная страница. Текст в блоке \"Featured Videos\"','Marriage-brides.com has assembled the best videos of Ladies that want you to see them in motion, telling their story and enticing you to contact them.',1461786599,1,NULL,'featured-videos',0,'textarea',NULL,'static'),(38,'Главная страница. Текст в блоке \"Chat with Online Girls!\"','Thousand of Users Online, waiting for you! Sign up & enjoy the VideoChat!',1461786599,1,NULL,'chat-online',0,'textarea',NULL,'static'),(39,'Главная страница. Текст в блоке \"Just Married\"','Every month our partners send us reports on wedding and engagement. We are pleased to unite the hearts of people who have not previously had the opportunity to meet in person and through our website, could find happiness.',1461786599,1,NULL,'just-married',0,'textarea',NULL,'static'),(40,'Доступ к видео после оплаты (в минутах)','2',1461786599,1,0,'video-access-time',1,'input',NULL,'basic'),(41,'Стоимость видео (coins)','10.000000',1452290426,1,5,'video',1,'input',NULL,'cost'),(42,'Стартовое количество coins при регистрации','0.000000',1452290426,1,NULL,'start_coins',1,'input',NULL,'cost'),(43,'Стоимость отправки письма (coins)','10.000000',1452290426,1,3,'cost_send_letter',1,'input',NULL,'cost'),(44,'Стоимость прочтения письма','10.000000',1452290426,1,1,'cost_read_letter',1,'input',NULL,'cost'),(45,'Количество символов в письме','1000',1461786599,1,NULL,'letter_chars_count',1,'input',NULL,'basic'),(46,'Отчисление агенству за прочтения письма','3.330000',1452290426,1,2,'agency_read_letter',1,'input',NULL,'cost'),(47,'Отчисление агенству за отправку письма','3.330000',1452290426,1,4,'agency_send_letter',1,'input',NULL,'cost'),(48,'Отчисление агенству за просмотр видео','3.330000',1452290426,1,6,'agency_video',1,'input',NULL,'cost'),(49,'Стоимость в долларах одного coin','0.450000',1452290426,1,NULL,'kurs',1,'input',NULL,'cost'),(50,'Количество фото, которое может прикрепить к письму мужчина','5',1461786598,1,1,'count_photo_man',1,'select','[{\"key\":\"0\",\"value\":\"0\"},{\"key\":\"1\",\"value\":\"1\"},{\"key\":\"2\",\"value\":\"2\"},{\"key\":\"3\",\"value\":\"3\"},{\"key\":\"4\",\"value\":\"4\"},{\"key\":\"5\",\"value\":\"5\"},{\"key\":\"6\",\"value\":\"6\"}]','basic'),(51,'Количество фото, которое может прикрепить к письму женщина','3',1461786598,1,1,'count_photo_wooman',1,'select','[{\"key\":\"0\",\"value\":\"0\"},{\"key\":\"1\",\"value\":\"1\"},{\"key\":\"2\",\"value\":\"2\"},{\"key\":\"3\",\"value\":\"3\"},{\"key\":\"4\",\"value\":\"4\"},{\"key\":\"5\",\"value\":\"5\"},{\"key\":\"6\",\"value\":\"6\"}]','basic'),(52,'Отчисление агенству за полученный виртуальный подарок, %','20.000000',1452290426,1,7,'agency_send_virtual_gift',1,'input',NULL,'cost'),(53,'Количество виртуальных подарков, которое может отправить женщина в месяц','30',1461786598,1,1,'count_virtual_gifts',1,'input',NULL,'basic'),(54,'Публичный ключ LiqPay','i95964199861',1461786598,1,1,'liqpay_public_key',1,'input',NULL,'basic'),(55,'Приватный ключ LiqPay','BSADZweXgBi5kudfOzUznsIiUJg73N0b6n2AfbH5',1461786598,1,1,'liqpay_private_key',1,'input',NULL,'basic'),(56,'Количество кредитов отчисляемых агенству за минуту текстового чата','0.330000',1452290426,1,8,'agency_text_chat',1,'input',NULL,'cost'),(57,'Количество кредитов отчисляемых агенству за минуту видео чата','0.330000',1452290426,1,9,'agency_video_chat',1,'input',NULL,'cost'),(58,'Стоимость запроса контактных данных женщины','500.000000',1452290426,1,10,'cost_date_me',1,'input',NULL,'cost'),(59,'Количество кредитов отчисляемых агенству за предоставление контактной информации','100.000000',1452290426,1,11,'agency_date_me',1,'input',NULL,'cost'),(60,'Стоимость запроса телефонного звонка','100.000000',1452290426,1,12,'cost_phone_me',1,'input',NULL,'cost'),(61,'Отчисление агенству за заказ телефонного разговора','20.000000',1452290427,1,13,'agency_phone_me',1,'input',NULL,'cost'),(62,'Количество кредитов отчисляемых агенству за минуту аудио чата','0.330000',1452290427,1,14,'agency_audio_chat',1,'input',NULL,'cost'),(63,'Сумма, которую должен потратить мужчина, что бы попасть в скаммеры (coins)','500.000000',1452290427,1,15,'to_scammer',1,'input',NULL,'cost'),(64,'Стоимость минуты видео чато','1.000000',1452290427,1,15,'cost_video_chat',1,'input',NULL,'cost'),(65,'Стоимость минуты текстового чата','1.000000',1452290427,1,16,'cost_chat',1,'input',NULL,'cost'),(66,'Стоимость минуты аудио чата','1.000000',1452290427,1,17,'cost_audio_chat',1,'input',NULL,'cost'),(67,'Тайм-аут снятия','60',1461786598,1,18,'cost_timeout',1,'input',NULL,'basic'),(68,'Attention! На главной странице ЛК девушки','<p>Marriage-brides.com glad to welcome you on a site of international dating - marriage-brides.com. Want to find your soulmate? Searching for a decent companion? Want to meet a men from foreign countries? Do not lose your chance! Registration on marriage-brides.com&nbsp;- it already halfway to achieving its goal!</p>\r\n<p>Participants in our site are already men from the U.S., Australia, Canada, Germany and many other countries around the world. Each of them has its own interests, hobbies, passions. Maybe they are the same as yours? Maybe that you\'re missing in their lives?</p>\r\n<p>So, it\'s time to know them. We allow you to prospect for new acquaintances, new interesting dialogue and new experiences! Tired of being alone? Then welcome to the world of exciting adventures on marriage-brides.com!</p>',1461786598,1,6,'home-girl-text',1,'tiny',NULL,'static'),(70,'Пароль SilentPostPassword для Multicards','ko23SH08ey93',1461786598,1,2,'password_multi',1,'input',NULL,'basic'),(71,'Id мерчанта Multicards','241525',1461786598,1,2,'merchant_id_multi',1,'input',NULL,'basic'),(72,'Order page Id','01',1461786598,1,2,'order_page_id_multi',1,'input',NULL,'basic');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:51:55
