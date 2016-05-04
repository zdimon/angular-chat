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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) DEFAULT '0',
  `name` varchar(255) CHARACTER SET cp1251 DEFAULT NULL,
  `link` varchar(255) CHARACTER SET cp1251 DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `icon` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '1',
  `agency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Доступен ли пункт меню агенству',
  `count` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,0,'Панель управления','index/index',0,1,'fa-dashboard',1,1,NULL),(3,0,'Пользователи',NULL,11,1,'fa-users',1,0,NULL),(4,0,'Настройки сайта','config/edit',33,1,'fa-cogs',1,0,NULL),(5,0,'Управление страницами',NULL,22,1,'fa-folder-open-o',1,0,NULL),(6,5,'Текстовые страницы','content/index',1,1,NULL,1,0,NULL),(8,2,'Метрика','seo/metrika/index',1,1,NULL,1,0,NULL),(9,2,'Счётчики','seo/counters/index',3,1,NULL,1,0,NULL),(12,2,'Теги для конкретных ссылок','seo/links/index',0,1,NULL,1,0,NULL),(14,0,'Шаблоны писем','mailTemplates/index',32,1,'fa-file-image-o',1,0,NULL),(15,0,'Меню',NULL,31,1,'fa-list-ul',1,0,NULL),(16,15,'Верхнее меню','top_menu/index',1,1,NULL,1,0,NULL),(17,15,'Добавить пункт в меню','menu/add',4,1,NULL,1,0,NULL),(18,0,'Новости','news/index',23,1,'fa-bullhorn',1,0,NULL),(24,0,'Слайдшоу','slider/index',25,1,'fa-picture-o',1,0,NULL),(27,0,'Банерная система','banners/index',26,1,'fa-puzzle-piece',1,0,NULL),(36,0,'Управление заявками клиентов',NULL,18,1,'fa-envelope-o',1,0,NULL),(54,0,'Лента событий','log/index',30,1,'fa-tasks',1,0,NULL),(59,5,'Другие страницы','control/index',3,1,NULL,1,0,NULL),(64,0,'Отзывы','testimonials/index',28,1,'fa-weixin',1,0,NULL),(67,15,'Нижнее меню','bottom_menu/index',2,1,NULL,1,0,NULL),(68,15,'Меню в подвале сайта','footer_menu/index',3,1,NULL,1,0,NULL),(69,0,'FAQ','FAQ/index',27,1,'fa-inbox',1,0,NULL),(72,0,'Справочники',NULL,29,1,'fa-book',1,0,NULL),(73,72,'Алкоголь','alcohol/index',1,1,NULL,1,0,NULL),(75,72,'Страны для путешествий','countries/index',3,1,NULL,1,0,NULL),(77,72,'Уровни английского языка','english/index',5,1,NULL,1,0,NULL),(79,72,'Семейные положения','marital/index',7,1,NULL,1,0,NULL),(81,72,'Причины регистрации','reasons/index',9,1,NULL,1,0,NULL),(82,3,'Девушки','girls/index',1,1,NULL,1,0,NULL),(84,3,'Мужчины','men/index',3,1,NULL,1,0,NULL),(86,3,'Администраторы агенств','agency_admins/index',5,1,NULL,1,0,NULL),(88,3,'Администраторы','admins/index',7,1,NULL,1,0,NULL),(90,0,'Агенства','agencies/index',13,1,'fa-home',1,0,NULL),(94,0,'Роли администраторов','roles/index',12,1,'fa-user',1,1,NULL),(95,36,'Все заявки','requests/index',1,1,NULL,1,0,NULL),(96,36,'Новые заявки','requests/new',2,1,NULL,1,0,'newRequests'),(97,36,'Закрытые','requests/closed',3,1,NULL,1,0,'closedRequests'),(98,0,'Видео девушек','videos/index',14,1,'fa-video-camera',1,1,NULL),(99,0,'Виртуальные подарки',NULL,16,1,'fa-gift',1,0,NULL),(100,99,'Список подарков','virtualgifts/index',1,1,NULL,1,0,NULL),(101,99,'Добавить подарок','virtualgifts/add',2,1,NULL,1,0,NULL),(102,0,'Реальные подарки',NULL,15,1,'fa-gift',1,0,NULL),(103,102,'Группы подарков','rggroups/index',1,1,NULL,1,0,NULL),(104,102,'Добавить группу','rggroups/add',2,1,NULL,1,0,NULL),(105,102,'Подарки','realgifts/index',3,1,NULL,1,0,NULL),(106,102,'Добавить подарок','realgifts/add',4,1,NULL,1,0,NULL),(107,0,'Внутрення валюта',NULL,19,1,'fa-money',1,0,NULL),(108,107,'Наборы оплаты','sets/index',1,1,NULL,1,0,NULL),(109,107,'Добавить набор','sets/add',2,1,NULL,1,0,NULL),(110,107,'Пополнить счёт','addcoins',3,1,NULL,1,0,NULL),(113,102,'Заказы','orderreal/index',5,1,NULL,1,0,'countOrdersGifts'),(114,0,'Финансы',NULL,20,1,'fa-money',1,0,NULL),(115,114,'Бонусы','bonuses/index',1,1,NULL,1,0,NULL),(116,114,'Штрафы','fines/index',2,1,NULL,1,0,NULL),(122,114,'Покупка кредитов','paymenthistory/purchase',3,1,NULL,1,0,NULL),(123,114,'Траты кредитов','paymenthistory/waste',4,1,NULL,1,0,NULL),(124,72,'Цвет глаз','eyes/index',6,1,NULL,1,0,NULL),(125,72,'Цвет волос','hair/index',7,1,NULL,1,0,NULL),(126,72,'Образование','education/index',8,1,NULL,1,0,NULL),(127,72,'Страны','country/index',9,1,NULL,1,0,NULL),(128,72,'Города','city/index',10,1,NULL,1,0,NULL),(129,0,'Заказы',NULL,17,1,'fa-shopping-cart',1,0,NULL),(130,129,'Контактная информация','dateme/index',1,1,NULL,1,0,'countOrdersDateme'),(131,0,'Новости агенств','agencyNews/index',28,1,'fa-bullhorn',1,0,NULL),(132,129,'Телефонный звонок','phoneme/index',2,1,NULL,1,0,'countOrdersPhoneme'),(133,0,'Корреспонденция','',21,1,'fa-krw',1,0,NULL),(134,133,'Письма','letters/ladies',1,1,NULL,1,0,NULL),(135,0,'Каталог',NULL,2,1,'fa-folder-open-o',0,1,NULL),(136,135,'Девушки','girls/index',1,1,NULL,0,1,NULL),(137,135,'Сложные мужчины и скаммеры','scammers/index',2,1,NULL,0,1,NULL),(138,135,'Добавить девушку','girls/add',3,1,NULL,0,1,NULL),(139,135,'Финансы. Бонусы','bonuses/index',4,1,NULL,0,1,NULL),(140,135,'Финансы. Штрафы','fines/index',5,1,NULL,0,1,NULL),(141,135,'Правила','rules',6,1,NULL,0,1,NULL),(142,135,'Новости','all_news',7,1,NULL,0,1,NULL),(143,0,'Переписка девушек',NULL,3,1,'fa-krw',0,1,NULL),(144,143,'Статистика переписки','letters/ladies',1,1,NULL,0,1,NULL),(145,0,'Вопросы и ответы',NULL,4,1,'fa-inbox',0,1,NULL),(146,145,'Письма от дирекции сайта','questions/index',1,1,NULL,0,1,'countUnreadedQuestions'),(147,145,'Письма дирекции сайта','questions/to',2,0,NULL,0,1,NULL),(148,145,'Новый вопрос дирекции сайта','questions/send',3,1,NULL,0,1,NULL),(149,0,'Реальные подарки',NULL,5,1,'fa-gift',0,1,NULL),(150,149,'Заказы (новые и в работе)','orderreal/index',1,1,NULL,0,1,NULL),(151,149,'Доставленные','realdelivered/index',2,1,NULL,0,1,NULL),(152,149,'Отмененные','realrejected/index',3,1,NULL,0,1,NULL),(153,0,'Настройки',NULL,6,1,'fa-cogs',0,1,NULL),(154,153,'Профиль агенства','information',1,1,NULL,0,1,NULL),(155,153,'Банковская информация','bank',2,1,NULL,0,1,NULL),(156,0,'Выход','auth/logout',666,1,'fa-share',0,1,NULL),(157,0,'Администраторы','agency_admins/index',7,1,'fa-users',0,1,NULL),(158,0,'Статистики','statistic/ladies',21,1,'fa-info',1,0,NULL),(159,0,'Статистики','statistic/ladies',665,1,'fa-info',0,1,NULL),(160,0,'Рассылка',NULL,22,1,'fa-rss',1,0,NULL),(161,160,'Список подписчиков','subscribers/index',1,0,NULL,1,0,NULL),(162,160,'Добавить подписчика','subscribers/add',2,0,NULL,1,0,NULL),(163,160,'Список разосланных писем','subscribe/index',3,1,NULL,1,0,NULL),(164,160,'Разослать письмо','subscribe/send',4,1,NULL,1,0,NULL),(165,0,'Журналы чатов','chat/index',21,1,'fa-paste',1,0,NULL),(166,0,'Сложные мужчины и скаммеры','scammers/index',29,1,'fa-renren',1,0,NULL),(167,4,'Основные настройки','config/edit',1,1,NULL,1,0,NULL),(168,4,'Настройка цен','config/costs',2,1,NULL,1,0,NULL),(169,0,'Вопросы и ответы',NULL,30,1,'fa-inbox',1,0,NULL),(170,169,'Вопросы агенств','questions/index',1,1,NULL,1,0,'countUnreadedQuestions'),(171,169,'Создать тему','questions/send',2,1,NULL,1,0,NULL),(172,0,'Антимат','antimat/index',21,1,'fa-text-width',1,0,NULL),(173,36,'Добавить заявку','requests/add',4,1,NULL,1,0,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:51:18
