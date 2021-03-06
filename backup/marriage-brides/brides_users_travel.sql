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
-- Table structure for table `users_travel`
--

DROP TABLE IF EXISTS `users_travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_travel` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `country_id` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `users_travel_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_travel_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `dict_countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2793 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_travel`
--

LOCK TABLES `users_travel` WRITE;
/*!40000 ALTER TABLE `users_travel` DISABLE KEYS */;
INSERT INTO `users_travel` VALUES (1264,275,1),(1265,283,3),(1266,283,14),(1267,283,7),(1268,283,16),(1269,283,6),(1270,283,9),(1271,283,1),(1272,288,1),(1371,292,3),(1372,292,10),(1373,292,14),(1374,292,7),(1375,292,16),(1376,292,6),(1377,292,5),(1378,292,11),(1379,292,4),(1380,292,8),(1381,292,2),(1382,292,1),(1383,298,13),(1384,298,16),(1385,298,6),(1386,298,11),(1387,298,4),(1388,298,8),(1389,298,12),(1390,298,2),(1391,298,1),(1408,305,13),(1409,305,10),(1410,305,4),(1411,305,2),(1494,304,3),(1495,304,10),(1496,304,16),(1497,304,6),(1498,304,9),(1499,304,5),(1500,304,4),(1501,304,8),(1502,304,2),(1503,304,1),(1827,364,13),(1828,364,3),(1829,364,10),(1830,364,14),(1831,364,7),(1832,364,16),(1833,364,6),(1834,364,9),(1835,364,5),(1836,364,11),(1837,364,4),(1838,364,8),(1839,364,12),(1840,364,2),(1841,364,1),(1862,369,13),(1863,369,3),(1864,369,16),(1865,369,6),(1866,369,11),(1867,369,4),(1868,369,8),(1869,369,2),(1870,369,1),(1878,375,10),(1879,375,7),(1880,375,6),(1881,375,5),(1882,375,8),(1883,375,2),(1884,375,21),(1954,381,13),(1955,381,3),(1956,381,10),(1957,381,14),(1958,381,7),(1959,381,16),(1960,381,6),(1961,381,9),(1962,381,5),(1963,381,11),(1964,381,4),(1965,381,8),(1966,381,12),(1967,381,2),(1968,381,1),(1969,378,3),(1970,378,10),(1971,378,7),(1972,378,16),(1973,378,6),(1974,378,9),(1975,378,5),(1976,378,11),(1977,378,4),(1978,378,8),(1979,378,2),(1980,378,1),(2004,392,13),(2005,392,3),(2006,392,10),(2007,392,14),(2008,392,7),(2009,392,16),(2010,392,6),(2011,392,9),(2012,392,5),(2013,392,11),(2014,392,4),(2015,392,8),(2016,392,12),(2017,392,2),(2018,392,1),(2084,390,13),(2085,390,3),(2086,390,10),(2087,390,14),(2088,390,6),(2089,390,9),(2090,390,5),(2091,390,11),(2092,390,4),(2093,390,8),(2094,390,12),(2095,390,2),(2096,390,1),(2292,319,6),(2293,319,2),(2294,319,1),(2385,460,13),(2386,460,11),(2387,460,4),(2388,460,2),(2389,460,20),(2390,466,3),(2391,466,10),(2392,466,14),(2393,466,7),(2394,466,16),(2395,466,6),(2396,466,9),(2397,466,5),(2398,466,11),(2399,466,8),(2400,466,12),(2401,466,2),(2402,466,1),(2403,466,24),(2409,475,16),(2410,475,6),(2411,475,8),(2412,475,12),(2413,475,1),(2429,483,10),(2430,483,6),(2431,483,9),(2432,483,11),(2433,483,4),(2434,483,8),(2435,483,2),(2509,445,13),(2510,445,10),(2511,445,14),(2512,445,16),(2513,445,6),(2514,445,9),(2515,445,11),(2516,445,4),(2517,445,8),(2518,445,2),(2570,454,13),(2571,454,3),(2572,454,14),(2573,454,7),(2574,454,16),(2575,454,6),(2576,454,9),(2577,454,5),(2578,454,11),(2579,454,4),(2580,454,8),(2581,454,2),(2582,454,1),(2622,429,13),(2623,429,3),(2624,429,14),(2625,429,7),(2626,429,16),(2627,429,6),(2628,429,9),(2629,429,5),(2630,429,11),(2631,429,4),(2632,429,8),(2633,429,2),(2634,429,1),(2635,405,1),(2636,14,10),(2637,14,16),(2638,14,6),(2639,14,11),(2640,14,4),(2641,14,8),(2642,14,12),(2643,14,1),(2644,507,7),(2645,507,16),(2646,507,6),(2647,507,5),(2648,507,4),(2649,507,8),(2650,507,2),(2651,507,1),(2656,518,3),(2657,518,9),(2658,518,4),(2659,518,1),(2691,527,13),(2692,527,10),(2693,527,14),(2694,527,7),(2695,527,16),(2696,527,6),(2697,527,9),(2698,527,5),(2699,527,11),(2700,527,4),(2701,527,8),(2702,527,12),(2703,527,2),(2704,527,1),(2705,382,3),(2706,382,16),(2707,382,11),(2708,382,4),(2709,382,12),(2710,382,2),(2711,382,31),(2736,530,6),(2737,530,8),(2738,530,2),(2739,530,1),(2743,494,13),(2744,494,3),(2745,494,10),(2746,494,14),(2747,494,7),(2748,494,16),(2749,494,6),(2750,494,9),(2751,494,5),(2752,494,11),(2753,494,4),(2754,494,8),(2755,494,12),(2756,494,2),(2757,494,1),(2758,26,3),(2759,26,6),(2760,26,8),(2761,538,3),(2762,538,6),(2763,538,9),(2764,538,5),(2765,538,4),(2766,538,8),(2767,538,1),(2778,545,14),(2779,545,7),(2780,545,16),(2781,545,6),(2782,545,9),(2783,545,5),(2784,545,8),(2785,545,2),(2786,545,1),(2792,544,2);
/*!40000 ALTER TABLE `users_travel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:53:20
