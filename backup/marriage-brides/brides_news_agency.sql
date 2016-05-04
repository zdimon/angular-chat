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
-- Table structure for table `news_agency`
--

DROP TABLE IF EXISTS `news_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_agency` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `date` int(10) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_agency`
--

LOCK TABLES `news_agency` WRITE;
/*!40000 ALTER TABLE `news_agency` DISABLE KEYS */;
INSERT INTO `news_agency` VALUES (1,1444750529,1444750553,0,'Тестовая новость',1444687200,'<p><strong>Использовать все виды списков</strong></p>\r\n<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Etiam id leo at eros tempor aliquet nec vitae mi.</li>\r\n<li>Sed vel leo quis est dictum egestas.</li>\r\n<li>Morbi ac orci at ex pharetra finibus vitae in sem.</li>\r\n<li>Sed et odio ac velit euismod varius vitae in ligula.</li>\r\n</ul>\r\n<ol>\r\n<li>Curabitur vehicula arcu elementum ultrices convallis.</li>\r\n<li>Curabitur at massa ultrices, sollicitudin ipsum eu, tincidunt sem.</li>\r\n<li>Praesent iaculis nibh quis lectus egestas porta.</li>\r\n<li>Sed condimentum felis tristique elit ultrices, vel pulvinar nisl mollis.</li>\r\n</ol>\r\n<p>▪&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nulla bibendum arcu pellentesque enim ultricies, at luctus mi scelerisque.</p>\r\n<p>▪&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nulla vel risus sollicitudin, interdum felis non, consectetur risus.</p>\r\n<p>▪&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Phasellus ut odio non turpis tincidunt consectetur non non sem.</p>\r\n<p>▪&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Duis in quam ac ante sagittis accumsan ut ac dolor.</p>\r\n<p>▪&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Morbi eleifend enim aliquam neque dapibus blandit.</p>\r\n<p>o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vestibulum in mauris in velit malesuada volutpat ac eget orci.</p>\r\n<p>o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Duis faucibus odio at arcu placerat, in aliquet leo mollis.</p>\r\n<p><strong>Выравнивание</strong> <strong>по</strong> <strong>левому</strong> <strong>краю</strong></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed maximus lorem. Vivamus sed metus aliquet, tempor turpis sit amet, volutpat risus. Fusce magna neque, pellentesque vitae purus vel, pellentesque maximus ante. Vivamus diam lectus, lobortis nec ipsum quis, laoreet semper odio. Nam consectetur nisi turpis, ut pulvinar justo aliquam vitae. Fusce egestas eros sodales, aliquam erat sed, vulputate massa. Mauris eu dolor vitae dui tempus semper. Cras elementum, nibh vel scelerisque dignissim, metus orci malesuada tellus, maximus eleifend urna libero quis ipsum. Ut ex lectus, scelerisque sed cursus nec, ullamcorper ut elit.</p>\r\n<p><strong>Выравнивание</strong> <strong>по</strong> <strong>правому</strong> <strong>краю</strong></p>\r\n<p>Cras imperdiet dolor eu vestibulum congue. Proin suscipit fermentum ex, quis tempor est cursus non. Nullam suscipit augue dui. Ut molestie interdum tortor maximus commodo. Vestibulum non est volutpat, molestie mauris in, feugiat est. Donec consequat ligula sed egestas pretium. Nam ac mauris rhoncus, lobortis dui non, molestie leo. Quisque pretium sed metus sed tristique. Fusce a nibh eu justo pharetra blandit. Nullam id risus erat. Aenean malesuada quam ut est auctor, vitae ullamcorper velit congue. In in placerat tellus. Duis sit amet dui id purus porta ornare non ac erat. Aenean dapibus arcu elit, tempor gravida arcu blandit eu.</p>\r\n<p><strong>Выравнивание</strong> <strong>по</strong> <strong>центру</strong></p>\r\n<p>Sed tempor, ante vitae faucibus feugiat, felis magna pretium nisl, ac pellentesque mi mi id augue. Aliquam a mauris lobortis, congue odio ac, dictum quam. Suspendisse tempus orci ut molestie cursus. Etiam consectetur vehicula ipsum, et sodales nisl. Vestibulum id aliquam libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ut leo in neque pharetra iaculis.</p>\r\n<p><strong>Выравнивание</strong> <strong>по</strong> <strong>ширине</strong></p>\r\n<p>Donec quis fermentum risus. Aliquam efficitur aliquam urna, vitae ornare purus feugiat non. Nam laoreet, velit at porta aliquam, dolor sem pretium nulla, vel sagittis sapien ante eget sapien. Sed est elit, lacinia et urna vel, venenatis vestibulum tortor. Duis ac tincidunt dolor. Pellentesque lacinia hendrerit urna sit amet lobortis. Suspendisse potenti. Vivamus eu sapien sollicitudin, elementum turpis efficitur, feugiat sapien. Nulla congue rutrum nisl. Quisque pretium facilisis ligula eu tincidunt. Donec posuere lorem eu est mattis commodo. Suspendisse pretium nibh nec convallis vehicula. Cras ac suscipit mi, vitae laoreet mauris. Aliquam erat volutpat. Quisque scelerisque nunc ut congue scelerisque.</p>\r\n<p><strong>Добавить ссылку &ndash; одна открывается в текущем окне, одна в соседнем </strong></p>\r\n<p><a href=\"http://uk.lipsum.com/\">Proin justo nisl, faucibus</a> nec dignissim a, tincidunt at lorem. Vivamus ligula arcu, faucibus a ex et, viverra molestie velit. Donec ut justo arcu. Integer a lorem ut massa mattis vestibulum. Fusce in lacus eget dolor finibus vestibulum. Vestibulum lobortis placerat felis non feugiat. Sed eu risus non nisi iaculis elementum. <a href=\"https://google.com/\">Etiam eu eros eget</a> ante cursus laoreet in ut nisi. Phasellus porta, est vitae accumsan dictum, erat nibh bibendum tellus, id suscipit elit mauris nec felis. Nunc in sodales erat, in scelerisque sapien. Aenean rutrum ligula leo, nec fringilla mi consectetur a. Quisque molestie nulla sit amet nibh dictum maximus.</p>\r\n<p><strong>Изменить форматирование &ndash; размер, цвет, фон, формат, начертание шрифта (все возможные варианты редактора)</strong></p>\r\n<p><strong>Nunc ac massa sit amet erat dignissim tristique. In hac habitasse platea dictumst. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent lorem justo, vestibulum quis posuere blandit, </strong>volutpat <em>vitae tellus. Sed blandit tortor vitae libero porttitor, eu vehicula odio dapibus. Quisque rhoncus facilisis vulputate. Etiam mi sem, placerat ut erat non, accumsan dignissim magna. Nullam tempor eleifend erat eu placerat. Nulla suscipit nunc sed</em> tortor sodales sodales. Suspendisse porta placerat tellus, eget luctus arcu blandit at. Suspendisse imperdiet, sapien ac hendrerit laoreet, mauris tortor porttitor augue, pellentesque mattis nisi nulla eu urna. Donec dictum sed velit id tristique. Vivamus sit amet eleifend ex. Quisque ullamcorper rhoncus congue.</p>\r\n<p>Duis imperdiet neque velit, vel tempor dui volutpat sit amet. Sed laoreet quam vitae sem vulputate vulputate sed et metus. Phasellus nec eros rhoncus, semper tortor nec, rutrum justo. Donec in lectus ullamcorper, aliquam nibh vitae, commodo augue. Duis eget lorem ac purus venenatis eleifend. Phasellus finibus magna at ante volutpat, vel porttitor ante gravida. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\r\n<table width=\"717\">\r\n<tbody>\r\n<tr>\r\n<td width=\"33\">\r\n<p>№</p>\r\n</td>\r\n<td width=\"110\">\r\n<p>1</p>\r\n</td>\r\n<td width=\"58\">\r\n<p>2</p>\r\n</td>\r\n<td width=\"60\">\r\n<p>3</p>\r\n</td>\r\n<td width=\"80\">\r\n<p>4</p>\r\n</td>\r\n<td width=\"86\">\r\n<p>5</p>\r\n</td>\r\n<td width=\"67\">\r\n<p>6</p>\r\n</td>\r\n<td width=\"80\">\r\n<p>7</p>\r\n</td>\r\n<td width=\"72\">\r\n<p>8</p>\r\n</td>\r\n<td width=\"72\">\r\n<p>9</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"33\">\r\n<p>1</p>\r\n</td>\r\n<td width=\"110\">\r\n<p>Phasellus non libero ut sem scelerisque dignissim. Fusce suscipit sit amet tellus eget semper. Aliquam sollicitudin quis lectus eu dignissim.</p>\r\n</td>\r\n<td width=\"58\">\r\n<p>mollis, sodales nulla non, molestie tortor. Vivamus pretium sed mi finibus efficitur. Sed in diam laoreet, varius dolor sed, ultrices leo.</p>\r\n</td>\r\n<td width=\"60\">\r\n<p>Nam vulputate ipsum eros, sed vulputate massa mattis eu. In nec dolor nec magna molestie laoreet ut nec erat. Ut vulputate</p>\r\n</td>\r\n<td width=\"80\">\r\n<p>gravida vestibulum. Aliquam vel leo magna. Nam in eros non ante suscipit placerat. Pellentesque feugiat ante augue, sed ultrices metus tempor a.</p>\r\n</td>\r\n<td width=\"86\">\r\n<p>pulvinar condimentum. Integer ut pretium velit. Aliquam erat volutpat. Duis pretium, turpis eget rutrum euismod, leo odio eleifend mauris,</p>\r\n</td>\r\n<td width=\"67\">\r\n<p>Vivamus eu risus sed mi pharetra tincidunt. Maecenas nibh dui, facilisis sed turpis vel, congue cursus mi. Nunc id accumsan ipsum.</p>\r\n</td>\r\n<td width=\"80\">\r\n<p>libero. Maecenas erat elit, sollicitudin at nunc eleifend, auctor mollis ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n<td width=\"72\">\r\n<p>Phasellus non libero ut sem scelerisque dignissim. Fusce suscipit sit amet tellus eget semper. Aliquam sollicitudin quis lectus eu dignissim.</p>\r\n</td>\r\n<td width=\"72\">\r\n<p>Phasellus non libero ut sem scelerisque dignissim. Fusce suscipit sit amet tellus eget semper. Aliquam sollicitudin quis lectus eu dignissim.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"33\">\r\n<p>2.</p>\r\n</td>\r\n<td width=\"110\">\r\n<p>Phasellus non libero ut sem scelerisque dignissim. Fusce suscipit sit amet tellus eget semper. Aliquam sollicitudin quis lectus eu dignissim.</p>\r\n</td>\r\n<td width=\"58\">\r\n<p>mollis, sodales nulla non, molestie tortor. Vivamus pretium sed mi finibus efficitur. Sed in diam laoreet, varius dolor sed, ultrices leo.</p>\r\n</td>\r\n<td width=\"60\">\r\n<p>Nam vulputate ipsum eros, sed vulputate massa mattis eu. In nec dolor nec magna molestie laoreet ut nec erat. Ut vulputate</p>\r\n</td>\r\n<td width=\"80\">\r\n<p>gravida vestibulum. Aliquam vel leo magna. Nam in eros non ante suscipit placerat. Pellentesque feugiat ante augue, sed ultrices metus tempor a.</p>\r\n</td>\r\n<td width=\"86\">\r\n<p>pulvinar condimentum. Integer ut pretium velit. Aliquam erat volutpat. Duis pretium, turpis eget rutrum euismod, leo odio eleifend mauris,</p>\r\n</td>\r\n<td width=\"67\">\r\n<p>Vivamus eu risus sed mi pharetra tincidunt. Maecenas nibh dui, facilisis sed turpis vel, congue cursus mi. Nunc id accumsan ipsum.</p>\r\n</td>\r\n<td width=\"80\">\r\n<p>libero. Maecenas erat elit, sollicitudin at nunc eleifend, auctor mollis ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n<td width=\"72\">\r\n<p>Phasellus non libero ut sem scelerisque dignissim. Fusce suscipit sit amet tellus eget semper. Aliquam sollicitudin quis lectus eu dignissim.</p>\r\n</td>\r\n<td width=\"72\">\r\n<p>Phasellus non libero ut sem scelerisque dignissim. Fusce suscipit sit amet tellus eget semper. Aliquam sollicitudin quis lectus eu dignissim.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"33\">\r\n<p>3.</p>\r\n</td>\r\n<td width=\"110\">\r\n<p>Phasellus non libero ut sem scelerisque dignissim. Fusce suscipit sit amet tellus eget semper. Aliquam sollicitudin quis lectus eu dignissim.</p>\r\n</td>\r\n<td width=\"58\">\r\n<p>mollis, sodales nulla non, molestie tortor. Vivamus pretium sed mi finibus efficitur. Sed in diam laoreet, varius dolor sed, ultrices leo.</p>\r\n</td>\r\n<td width=\"60\">\r\n<p>Nam vulputate ipsum eros, sed vulputate massa mattis eu. In nec dolor nec magna molestie laoreet ut nec erat. Ut vulputate</p>\r\n</td>\r\n<td width=\"80\">\r\n<p>gravida vestibulum. Aliquam vel leo magna. Nam in eros non ante suscipit placerat. Pellentesque feugiat ante augue, sed ultrices metus tempor a.</p>\r\n</td>\r\n<td width=\"86\">\r\n<p>pulvinar condimentum. Integer ut pretium velit. Aliquam erat volutpat. Duis pretium, turpis eget rutrum euismod, leo odio eleifend mauris,</p>\r\n</td>\r\n<td width=\"67\">\r\n<p>Vivamus eu risus sed mi pharetra tincidunt. Maecenas nibh dui, facilisis sed turpis vel, congue cursus mi. Nunc id accumsan ipsum.</p>\r\n</td>\r\n<td width=\"80\">\r\n<p>libero. Maecenas erat elit, sollicitudin at nunc eleifend, auctor mollis ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n<td width=\"72\">\r\n<p>Phasellus non libero ut sem scelerisque dignissim. Fusce suscipit sit amet tellus eget semper. Aliquam sollicitudin quis lectus eu dignissim.</p>\r\n</td>\r\n<td width=\"72\">\r\n<p>Phasellus non libero ut sem scelerisque dignissim. Fusce suscipit sit amet tellus eget semper. Aliquam sollicitudin quis lectus eu dignissim.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p><strong>Вставить изображение с описанием</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Вставить видео с изображением</strong> <strong>https://youtu.be/aJsrR36toLg</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Вставить видео без изображения</strong></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>'),(2,1445612693,NULL,0,'Тест 1',1445551200,''),(3,1445612698,NULL,0,'Тест 2',1445551200,''),(4,1445612710,NULL,0,'Тест 3',1445551200,''),(5,1445612721,NULL,0,'Тест 5',1445551200,''),(6,1445612731,NULL,0,'Тест 6',1445551200,'');
/*!40000 ALTER TABLE `news_agency` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:51:10
