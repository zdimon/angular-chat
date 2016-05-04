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
-- Table structure for table `liqpay_history`
--

DROP TABLE IF EXISTS `liqpay_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liqpay_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `text` text,
  `created_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liqpay_history`
--

LOCK TABLES `liqpay_history` WRITE;
/*!40000 ALTER TABLE `liqpay_history` DISABLE KEYS */;
INSERT INTO `liqpay_history` VALUES (92,'{\"payment_id\":68414558,\"transaction_id\":68414558,\"status\":\"sandbox\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"c0fbfedeb98d55b5231250455d7567e1-1-45\",\"liqpay_order_id\":\"1356662u1441204988448166\",\"description\":\"Buy coins to user: Vladik. From site: brides.mirbu.com\",\"sender_phone\":\"380951417543\",\"amount\":20.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":0.55,\"agent_commission\":0.0,\"amount_debit\":475.06,\"amount_credit\":475.06,\"commission_debit\":0.0,\"commission_credit\":13.06,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0}',1441204988),(93,'{\"payment_id\":68414660,\"transaction_id\":68414660,\"status\":\"sandbox\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"a0146151e67842f3d32cca0fb2b5093e-7-45\",\"liqpay_order_id\":\"1356662u1441205047761124\",\"description\":\"Buy coins to user: Vladik. From site: brides.mirbu.com\",\"sender_phone\":\"380951417543\",\"amount\":1.0e3,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":27.5,\"agent_commission\":0.0,\"amount_debit\":23753.0,\"amount_credit\":23753.0,\"commission_debit\":0.0,\"commission_credit\":653.21,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0}',1441205047),(94,'{\"payment_id\":68415791,\"transaction_id\":68415791,\"status\":\"sandbox\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"e34aedbc8777c577fdb4ec2fde1bf336-6-45\",\"liqpay_order_id\":\"1356662u1441205711435059\",\"description\":\"Buy coins to user: Vladik. From site: brides.mirbu.com\",\"sender_phone\":\"380951417543\",\"amount\":500.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":13.75,\"agent_commission\":0.0,\"amount_debit\":11876.5,\"amount_credit\":11876.5,\"commission_debit\":0.0,\"commission_credit\":326.6,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0}',1441205711),(95,'{\"payment_id\":68410971,\"transaction_id\":68410971,\"status\":\"sandbox\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"858c3f875f6416efd2cc86b007b84348-6-45\",\"liqpay_order_id\":\"1356662u1441202836300337\",\"description\":\"Buy coins to user: Vladik. From site: brides.mirbu.com\",\"sender_phone\":\"380951417543\",\"amount\":500.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":13.75,\"agent_commission\":0.0,\"amount_debit\":11876.5,\"amount_credit\":11876.5,\"commission_debit\":0.0,\"commission_credit\":326.6,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0}',1441207667),(96,'{\"payment_id\":68411441,\"transaction_id\":68411441,\"status\":\"sandbox\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"94ffcafcd8eada50651f718eb8f41aa3-7-45\",\"liqpay_order_id\":\"1356662u1441203102791831\",\"description\":\"Buy coins to user: Vladik. From site: brides.mirbu.com\",\"sender_phone\":\"380951417543\",\"amount\":1.0e3,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":27.5,\"agent_commission\":0.0,\"amount_debit\":23753.0,\"amount_credit\":23753.0,\"commission_debit\":0.0,\"commission_credit\":653.21,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0}',1441207934),(97,'{\"payment_id\":68613634,\"transaction_id\":68613634,\"status\":\"sandbox\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"19f8ee7de6ffa29dc58adcdec9b1968e-6-46\",\"liqpay_order_id\":\"1356662u1441281241547882\",\"description\":\"Buy coins to user: Denis. From site: brides.mirbu.com\",\"sender_phone\":\"380951417543\",\"amount\":500.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":13.75,\"agent_commission\":0.0,\"amount_debit\":11792.45,\"amount_credit\":11792.45,\"commission_debit\":0.0,\"commission_credit\":324.29,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0}',1441281241),(98,'{\"payment_id\":68623833,\"transaction_id\":68623833,\"status\":\"sandbox\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"416b78cccb891b900c55cecd3a5358cb-5-46\",\"liqpay_order_id\":\"1356662u1441283755892633\",\"description\":\"Buy coins to user: Denis. From site: brides.mirbu.com\",\"sender_phone\":\"380951417543\",\"amount\":320.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":8.8,\"agent_commission\":0.0,\"amount_debit\":7547.17,\"amount_credit\":7547.17,\"commission_debit\":0.0,\"commission_credit\":207.55,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0}',1441283756),(99,'{\"payment_id\":81989309,\"transaction_id\":81989309,\"status\":\"sandbox\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"c0177c212acd3f96ec246c010aeef6c8-12-14\",\"liqpay_order_id\":\"4739289u1445428349087460\",\"description\":\"Buy coins to user: Anton. From site: marriage-brides.com\",\"sender_phone\":\"380953574796\",\"amount\":1.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":0.03,\"agent_commission\":0.0,\"amount_debit\":24.33,\"amount_credit\":24.33,\"commission_debit\":0.0,\"commission_credit\":0.67,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0}',1445428349),(100,'{\"action\":\"pay\",\"payment_id\":91010463,\"status\":\"sandbox\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"3f3f1d1a7ec26832baccbcf8b53a6094-3-149\",\"liqpay_order_id\":\"4739289u1447531776152075\",\"description\":\"Buy coins to user: Frank. From site: marriage-brides.com\",\"sender_phone\":\"380953574796\",\"sender_card_mask2\":\"516875*35\",\"sender_card_bank\":\"pb\",\"sender_card_country\":804,\"ip\":\"176.109.243.187\",\"amount\":30.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":0.83,\"agent_commission\":0.0,\"amount_debit\":744.42,\"amount_credit\":744.42,\"commission_debit\":0.0,\"commission_credit\":20.47,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"7\",\"transaction_id\":91010463}',1447531776),(101,'{\"action\":\"pay\",\"payment_id\":91021724,\"status\":\"sandbox\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"ecee4e0a2882fa47b369cc71cdc5d235-1-149\",\"liqpay_order_id\":\"4739289u1447535532942478\",\"description\":\"Buy coins to user: Frank. From site: marriage-brides.com\",\"sender_phone\":\"380953574796\",\"sender_card_mask2\":\"516875*35\",\"sender_card_bank\":\"pb\",\"sender_card_country\":804,\"ip\":\"176.109.243.187\",\"amount\":1.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":0.03,\"agent_commission\":0.0,\"amount_debit\":24.81,\"amount_credit\":24.81,\"commission_debit\":0.0,\"commission_credit\":0.68,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"7\",\"transaction_id\":91021724}',1447535533),(102,'{\"action\":\"pay\",\"payment_id\":94126564,\"status\":\"failure\",\"err_code\":\"9868\",\"err_description\":\"External decline\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"aec589148b56a80c7acce9b9f9ca8c55-2-296\",\"liqpay_order_id\":\"10161972u1448166976510478\",\"description\":\"Buy coins to user: david. From site: marriage-brides.com\",\"sender_phone\":\"15877847912\",\"sender_card_mask2\":\"531634*36\",\"sender_card_bank\":\"TORONTO-DOMINION BANK, THE    \",\"sender_card_country\":840,\"ip\":\"108.181.74.248\",\"amount\":50.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":1.38,\"agent_commission\":0.0,\"amount_debit\":1259.45,\"amount_credit\":1259.45,\"commission_debit\":0.0,\"commission_credit\":34.63,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"5\",\"transaction_id\":94126564,\"code\":\"9868\"}',1448166984),(103,'{\"action\":\"pay\",\"payment_id\":94128468,\"status\":\"failure\",\"err_code\":\"9868\",\"err_description\":\"External decline\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"4144d1801b703c76771a6468f1c36521-4-296\",\"liqpay_order_id\":\"10161972u1448169220355290\",\"description\":\"Buy coins to user: david. From site: marriage-brides.com\",\"sender_phone\":\"15877847912\",\"sender_card_mask2\":\"531634*36\",\"sender_card_bank\":\"TORONTO-DOMINION BANK, THE    \",\"sender_card_country\":840,\"ip\":\"108.181.74.248\",\"amount\":90.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":2.48,\"agent_commission\":0.0,\"amount_debit\":2267.0,\"amount_credit\":2267.0,\"commission_debit\":0.0,\"commission_credit\":62.34,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"5\",\"transaction_id\":94128468,\"code\":\"9868\"}',1448169227),(104,'{\"action\":\"pay\",\"payment_id\":94128987,\"status\":\"wait_secure\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"7e9cda4f77e7d107ec71fcf1c2f95886-4-296\",\"liqpay_order_id\":\"10161972u1448169596122689\",\"description\":\"Buy coins to user: david. From site: marriage-brides.com\",\"sender_phone\":\"15877847912\",\"sender_card_mask2\":\"452001*74\",\"sender_card_bank\":\"The Toronto-Dominion Bank\",\"sender_card_country\":840,\"ip\":\"108.181.74.248\",\"amount\":90.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":2.48,\"agent_commission\":0.0,\"amount_debit\":2267.0,\"amount_credit\":2267.0,\"commission_debit\":0.0,\"commission_credit\":62.34,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"authcode_debit\":\"000718\",\"rrn_debit\":\"000274425586\",\"mpi_eci\":\"5\",\"transaction_id\":94128987}',1448169604),(105,'{\"action\":\"pay\",\"payment_id\":94128987,\"status\":\"reversed\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"7e9cda4f77e7d107ec71fcf1c2f95886-4-296\",\"liqpay_order_id\":\"10161972u1448169596122689\",\"description\":\"Buy coins to user: david. From site: marriage-brides.com\",\"sender_phone\":\"15877847912\",\"sender_card_mask2\":\"452001*74\",\"sender_card_bank\":\"The Toronto-Dominion Bank\",\"sender_card_country\":840,\"ip\":\"108.181.74.248\",\"amount\":90.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":2.48,\"agent_commission\":0.0,\"amount_debit\":2267.0,\"amount_credit\":2267.0,\"commission_debit\":0.0,\"commission_credit\":62.34,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"authcode_debit\":\"000718\",\"rrn_debit\":\"000274425586\",\"mpi_eci\":\"5\",\"transaction_id\":94128987}',1448169834),(106,'{\"action\":\"pay\",\"payment_id\":94150369,\"status\":\"wait_accept\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"af5fac317c613714bd6cd68bcecdb7e4-1-149\",\"liqpay_order_id\":\"4739289u1448176172631284\",\"description\":\"Buy coins to user: Frank. From site: marriage-brides.com\",\"sender_phone\":\"380953574796\",\"sender_card_mask2\":\"516875*52\",\"sender_card_bank\":\"pb\",\"sender_card_country\":804,\"ip\":\"176.109.228.210\",\"amount\":1.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":0.03,\"agent_commission\":0.0,\"amount_debit\":25.19,\"amount_credit\":25.19,\"commission_debit\":0.0,\"commission_credit\":0.69,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"authcode_debit\":\"586819\",\"rrn_debit\":\"000274451145\",\"mpi_eci\":\"7\",\"transaction_id\":94150369}',1448176180),(107,'{\"action\":\"pay\",\"payment_id\":94126564,\"status\":\"failure\",\"err_code\":\"9868\",\"err_description\":\"External decline\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"aec589148b56a80c7acce9b9f9ca8c55-2-296\",\"liqpay_order_id\":\"10161972u1448166976510478\",\"description\":\"Buy coins to user: david. From site: marriage-brides.com\",\"sender_phone\":\"15877847912\",\"sender_card_mask2\":\"531634*36\",\"sender_card_bank\":\"TORONTO-DOMINION BANK, THE    \",\"sender_card_country\":840,\"ip\":\"108.181.74.248\",\"amount\":50.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":1.38,\"agent_commission\":0.0,\"amount_debit\":1259.45,\"amount_credit\":1259.45,\"commission_debit\":0.0,\"commission_credit\":34.63,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"5\",\"transaction_id\":94126564,\"code\":\"9868\"}',1448179917),(108,'{\"action\":\"pay\",\"payment_id\":94126564,\"status\":\"failure\",\"err_code\":\"9868\",\"err_description\":\"External decline\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"aec589148b56a80c7acce9b9f9ca8c55-2-296\",\"liqpay_order_id\":\"10161972u1448166976510478\",\"description\":\"Buy coins to user: david. From site: marriage-brides.com\",\"sender_phone\":\"15877847912\",\"sender_card_mask2\":\"531634*36\",\"sender_card_bank\":\"TORONTO-DOMINION BANK, THE    \",\"sender_card_country\":840,\"ip\":\"108.181.74.248\",\"amount\":50.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":1.38,\"agent_commission\":0.0,\"amount_debit\":1259.45,\"amount_credit\":1259.45,\"commission_debit\":0.0,\"commission_credit\":34.63,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"5\",\"transaction_id\":94126564,\"code\":\"9868\"}',1448179921),(109,'{\"action\":\"pay\",\"payment_id\":94150369,\"status\":\"wait_accept\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"af5fac317c613714bd6cd68bcecdb7e4-1-149\",\"liqpay_order_id\":\"4739289u1448176172631284\",\"description\":\"Buy coins to user: Frank. From site: marriage-brides.com\",\"sender_phone\":\"380953574796\",\"sender_card_mask2\":\"516875*52\",\"sender_card_bank\":\"pb\",\"sender_card_country\":804,\"ip\":\"176.109.228.210\",\"amount\":1.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":0.03,\"agent_commission\":0.0,\"amount_debit\":25.19,\"amount_credit\":25.19,\"commission_debit\":0.0,\"commission_credit\":0.69,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"authcode_debit\":\"586819\",\"rrn_debit\":\"000274451145\",\"mpi_eci\":\"7\",\"transaction_id\":94150369}',1448182435),(110,'{\"action\":\"pay\",\"payment_id\":94150369,\"status\":\"success\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"af5fac317c613714bd6cd68bcecdb7e4-1-149\",\"liqpay_order_id\":\"4739289u1448176172631284\",\"description\":\"Buy coins to user: Frank. From site: marriage-brides.com\",\"sender_phone\":\"380953574796\",\"sender_card_mask2\":\"516875*52\",\"sender_card_bank\":\"pb\",\"sender_card_country\":804,\"ip\":\"176.109.228.210\",\"amount\":1.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":0.03,\"agent_commission\":0.0,\"amount_debit\":25.19,\"amount_credit\":25.19,\"commission_debit\":0.0,\"commission_credit\":0.69,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"authcode_debit\":\"586819\",\"authcode_credit\":\"137509\",\"rrn_debit\":\"000274451145\",\"rrn_credit\":\"000300227844\",\"mpi_eci\":\"7\",\"transaction_id\":94150369}',1451740439),(111,'{\"action\":\"pay\",\"payment_id\":112798040,\"status\":\"success\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"519ece0d61adb18630c9ef73176af1cb-1-149\",\"liqpay_order_id\":\"4739289u1451741204746319\",\"description\":\"Buy coins to user: Frank. From site: marriage-brides.com\",\"sender_phone\":\"380953574796\",\"sender_card_mask2\":\"516875*52\",\"sender_card_bank\":\"pb\",\"sender_card_country\":804,\"ip\":\"176.109.232.27\",\"amount\":1.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":0.03,\"agent_commission\":0.0,\"amount_debit\":25.71,\"amount_credit\":25.71,\"commission_debit\":0.0,\"commission_credit\":0.71,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"authcode_debit\":\"093255\",\"authcode_credit\":\"283120\",\"rrn_debit\":\"000300235108\",\"rrn_credit\":\"000300235112\",\"mpi_eci\":\"7\",\"transaction_id\":112798040}',1451741212),(112,'{\"action\":\"pay\",\"payment_id\":94128468,\"status\":\"failure\",\"err_code\":\"9868\",\"err_description\":\"External decline\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"4144d1801b703c76771a6468f1c36521-4-296\",\"liqpay_order_id\":\"10161972u1448169220355290\",\"description\":\"Buy coins to user: david. From site: marriage-brides.com\",\"sender_phone\":\"15877847912\",\"sender_card_mask2\":\"531634*36\",\"sender_card_bank\":\"TORONTO-DOMINION BANK, THE    \",\"sender_card_country\":840,\"ip\":\"108.181.74.248\",\"amount\":90.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":2.48,\"agent_commission\":0.0,\"amount_debit\":2267.0,\"amount_credit\":2267.0,\"commission_debit\":0.0,\"commission_credit\":62.34,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"5\",\"transaction_id\":94128468,\"code\":\"9868\"}',1452286720),(113,'{\"action\":\"pay\",\"payment_id\":94128468,\"status\":\"failure\",\"err_code\":\"9868\",\"err_description\":\"External decline\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"4144d1801b703c76771a6468f1c36521-4-296\",\"liqpay_order_id\":\"10161972u1448169220355290\",\"description\":\"Buy coins to user: david. From site: marriage-brides.com\",\"sender_phone\":\"15877847912\",\"sender_card_mask2\":\"531634*36\",\"sender_card_bank\":\"TORONTO-DOMINION BANK, THE    \",\"sender_card_country\":840,\"ip\":\"108.181.74.248\",\"amount\":90.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":2.48,\"agent_commission\":0.0,\"amount_debit\":2267.0,\"amount_credit\":2267.0,\"commission_debit\":0.0,\"commission_credit\":62.34,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"5\",\"transaction_id\":94128468,\"code\":\"9868\"}',1452286733),(114,'{\"action\":\"pay\",\"payment_id\":119136552,\"status\":\"failure\",\"err_code\":\"limit\",\"err_description\":\"Превышен лимит\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"8d79d428c9c080eb1bfaa13d8ead6549-4-367\",\"liqpay_order_id\":\"11246357u1453074826529344\",\"description\":\"Buy coins to user: lars. From site: marriage-brides.com\",\"sender_phone\":\"491722419579\",\"sender_card_mask2\":\"554591*23\",\"sender_card_bank\":\"PPRO FINANCIAL LTD.           \",\"sender_card_country\":528,\"ip\":\"80.133.8.151\",\"amount\":90.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":2.48,\"agent_commission\":0.0,\"amount_debit\":2380.95,\"amount_credit\":2380.95,\"commission_debit\":0.0,\"commission_credit\":65.48,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"5\",\"transaction_id\":119136552,\"code\":\"limit\"}',1453074830),(115,'{\"action\":\"pay\",\"payment_id\":119136650,\"status\":\"failure\",\"err_code\":\"limit\",\"err_description\":\"Превышен лимит\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"431bfdc27bf5b3fa5b8d08c27602e6b6-4-367\",\"liqpay_order_id\":\"11246357u1453074975408741\",\"description\":\"Buy coins to user: lars. From site: marriage-brides.com\",\"sender_phone\":\"491722419579\",\"sender_card_mask2\":\"554591*23\",\"sender_card_bank\":\"PPRO FINANCIAL LTD.           \",\"sender_card_country\":528,\"ip\":\"80.133.8.151\",\"amount\":90.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":2.48,\"agent_commission\":0.0,\"amount_debit\":2380.95,\"amount_credit\":2380.95,\"commission_debit\":0.0,\"commission_credit\":65.48,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"5\",\"transaction_id\":119136650,\"code\":\"limit\"}',1453074980),(116,'{\"action\":\"pay\",\"payment_id\":119136757,\"status\":\"failure\",\"err_code\":\"limit\",\"err_description\":\"Превышен лимит\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"406d14d5b9ec830ae71513184b76667c-4-367\",\"liqpay_order_id\":\"11246357u1453075140626272\",\"description\":\"Buy coins to user: lars. From site: marriage-brides.com\",\"sender_phone\":\"491722419579\",\"sender_card_mask2\":\"554591*23\",\"sender_card_bank\":\"PPRO FINANCIAL LTD.           \",\"sender_card_country\":528,\"ip\":\"80.133.8.151\",\"amount\":90.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":2.48,\"agent_commission\":0.0,\"amount_debit\":2380.95,\"amount_credit\":2380.95,\"commission_debit\":0.0,\"commission_credit\":65.48,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"5\",\"transaction_id\":119136757,\"code\":\"limit\"}',1453075144),(117,'{\"action\":\"pay\",\"payment_id\":119136905,\"status\":\"failure\",\"err_code\":\"limit\",\"err_description\":\"Превышен лимит\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"adadb91fe31c60d4d7c60ea3bf7a043b-4-367\",\"liqpay_order_id\":\"11246357u1453075396550822\",\"description\":\"Buy coins to user: lars. From site: marriage-brides.com\",\"sender_phone\":\"491722419579\",\"sender_card_mask2\":\"554591*23\",\"sender_card_bank\":\"PPRO FINANCIAL LTD.           \",\"sender_card_country\":528,\"ip\":\"80.133.8.151\",\"amount\":90.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":2.48,\"agent_commission\":0.0,\"amount_debit\":2380.95,\"amount_credit\":2380.95,\"commission_debit\":0.0,\"commission_credit\":65.48,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"5\",\"transaction_id\":119136905,\"code\":\"limit\"}',1453075400),(118,'{\"action\":\"pay\",\"payment_id\":119137107,\"status\":\"failure\",\"err_code\":\"limit\",\"err_description\":\"Превышен лимит\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"8f79e5bfef7c4a7d90e11777be041f5a-4-367\",\"liqpay_order_id\":\"11246357u1453075778097561\",\"description\":\"Buy coins to user: lars. From site: marriage-brides.com\",\"sender_phone\":\"491722419579\",\"sender_card_mask2\":\"554591*23\",\"sender_card_bank\":\"PPRO FINANCIAL LTD.           \",\"sender_card_country\":528,\"ip\":\"80.133.8.151\",\"amount\":90.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":2.48,\"agent_commission\":0.0,\"amount_debit\":2380.95,\"amount_credit\":2380.95,\"commission_debit\":0.0,\"commission_credit\":65.48,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"5\",\"transaction_id\":119137107,\"code\":\"limit\"}',1453075782),(119,'{\"action\":\"pay\",\"payment_id\":119137161,\"status\":\"failure\",\"err_code\":\"limit\",\"err_description\":\"Превышен лимит\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"6354813a846dc76dffbe14e7638d731f-4-367\",\"liqpay_order_id\":\"11246357u1453075880445753\",\"description\":\"Buy coins to user: lars. From site: marriage-brides.com\",\"sender_phone\":\"491722419579\",\"sender_card_mask2\":\"554591*23\",\"sender_card_bank\":\"PPRO FINANCIAL LTD.           \",\"sender_card_country\":528,\"ip\":\"80.133.8.151\",\"amount\":90.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":2.48,\"agent_commission\":0.0,\"amount_debit\":2380.95,\"amount_credit\":2380.95,\"commission_debit\":0.0,\"commission_credit\":65.48,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"5\",\"transaction_id\":119137161,\"code\":\"limit\"}',1453075884),(120,'{\"action\":\"pay\",\"payment_id\":119377999,\"status\":\"failure\",\"err_code\":\"limit\",\"err_description\":\"Превышен лимит\",\"version\":3,\"type\":\"buy\",\"public_key\":\"i95964199861\",\"acq_id\":414963,\"order_id\":\"e51fee24150ccc71e17f9a85851a0226-4-367\",\"liqpay_order_id\":\"11246357u1453120775777525\",\"description\":\"Buy coins to user: lars. From site: marriage-brides.com\",\"sender_phone\":\"491722419579\",\"sender_card_mask2\":\"554591*23\",\"sender_card_bank\":\"PPRO FINANCIAL LTD.           \",\"sender_card_country\":528,\"ip\":\"80.133.8.151\",\"amount\":90.0,\"currency\":\"USD\",\"sender_commission\":0.0,\"receiver_commission\":2.48,\"agent_commission\":0.0,\"amount_debit\":2387.27,\"amount_credit\":2387.27,\"commission_debit\":0.0,\"commission_credit\":65.65,\"currency_debit\":\"UAH\",\"currency_credit\":\"UAH\",\"sender_bonus\":0.0,\"amount_bonus\":0.0,\"mpi_eci\":\"5\",\"transaction_id\":119377999,\"code\":\"limit\"}',1453120784),(121,'',1453298251),(122,'Previus response had incorect signature',1453298251),(123,'',1453299016),(124,'Previus response had incorect signature',1453299016);
/*!40000 ALTER TABLE `liqpay_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:52:17
