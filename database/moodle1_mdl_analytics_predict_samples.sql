-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: moodle1
-- ------------------------------------------------------
-- Server version	5.5.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mdl_analytics_predict_samples`
--

DROP TABLE IF EXISTS `mdl_analytics_predict_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdl_analytics_predict_samples` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `modelid` bigint(10) NOT NULL,
  `analysableid` bigint(10) NOT NULL,
  `timesplitting` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rangeindex` bigint(10) NOT NULL,
  `sampleids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_analpredsamp_modanatimr_ix` (`modelid`,`analysableid`,`timesplitting`,`rangeindex`),
  KEY `mdl_analpredsamp_mod_ix` (`modelid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Samples already used for predictions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_analytics_predict_samples`
--

LOCK TABLES `mdl_analytics_predict_samples` WRITE;
/*!40000 ALTER TABLE `mdl_analytics_predict_samples` DISABLE KEYS */;
INSERT INTO `mdl_analytics_predict_samples` VALUES (1,2,1,'\\core\\analytics\\time_splitting\\single_range',0,'{\"2\":2,\"4\":4,\"5\":5,\"6\":6,\"7\":7,\"8\":8,\"9\":9,\"10\":10,\"11\":11,\"12\":12,\"13\":13,\"14\":14,\"17\":17,\"16\":16,\"18\":18,\"20\":20,\"21\":21,\"23\":23,\"22\":22,\"25\":25,\"26\":26,\"27\":27,\"28\":28,\"29\":29,\"24\":24,\"30\":30,\"31\":31,\"33\":33,\"36\":36,\"38\":38,\"32\":32,\"40\":40,\"39\":39,\"41\":41,\"34\":34,\"42\":42,\"43\":43,\"44\":44,\"45\":45,\"46\":46,\"51\":51,\"52\":52,\"48\":48,\"53\":53,\"54\":54,\"55\":55,\"58\":58,\"56\":56,\"59\":59,\"60\":60,\"61\":61,\"838\":838,\"837\":837,\"839\":839,\"1065\":1065,\"1766\":1766,\"1767\":1767,\"1768\":1768,\"1769\":1769,\"1771\":1771,\"1770\":1770,\"1772\":1772,\"1773\":1773,\"1774\":1774,\"1775\":1775,\"1776\":1776,\"1778\":1778,\"1780\":1780,\"1777\":1777,\"1783\":1783,\"1784\":1784,\"1785\":1785,\"1786\":1786,\"1788\":1788,\"1789\":1789,\"1792\":1792,\"1793\":1793,\"1790\":1790,\"1791\":1791,\"1794\":1794,\"1781\":1781,\"1796\":1796,\"1797\":1797,\"1798\":1798,\"1800\":1800,\"1779\":1779,\"1877\":1877,\"1878\":1878,\"1876\":1876,\"1879\":1879,\"1880\":1880,\"1956\":1956,\"1787\":1787,\"1957\":1957,\"1958\":1958,\"1960\":1960,\"1962\":1962,\"1961\":1961,\"1959\":1959,\"1799\":1799,\"1963\":1963,\"1964\":1964,\"1965\":1965,\"1991\":1991,\"1992\":1992,\"1993\":1993,\"2019\":2019,\"2022\":2022,\"2023\":2023,\"2025\":2025,\"2026\":2026,\"2028\":2028,\"2027\":2027,\"2079\":2079,\"2280\":2280,\"2282\":2282,\"2284\":2284,\"2385\":2385,\"2386\":2386,\"2387\":2387,\"2489\":2489,\"2490\":2490,\"2491\":2491,\"2492\":2492,\"2496\":2496,\"2497\":2497,\"2493\":2493,\"2498\":2498,\"2499\":2499,\"2500\":2500,\"2501\":2501,\"2502\":2502,\"2503\":2503,\"2504\":2504,\"2505\":2505,\"2506\":2506,\"2507\":2507,\"2508\":2508,\"2509\":2509,\"2510\":2510,\"2512\":2512,\"2513\":2513,\"2514\":2514,\"2515\":2515,\"2516\":2516,\"2518\":2518,\"2517\":2517,\"2519\":2519,\"2520\":2520,\"2521\":2521,\"2522\":2522,\"2523\":2523,\"2524\":2524,\"2525\":2525,\"2527\":2527,\"2528\":2528,\"2529\":2529,\"2530\":2530,\"2531\":2531,\"2532\":2532,\"2533\":2533,\"2535\":2535,\"2536\":2536,\"2537\":2537,\"2538\":2538,\"2539\":2539,\"2540\":2540,\"2542\":2542,\"2541\":2541,\"2543\":2543,\"2544\":2544,\"2545\":2545,\"2546\":2546,\"2547\":2547,\"2548\":2548,\"2549\":2549,\"2550\":2550,\"2551\":2551,\"2552\":2552,\"2553\":2553,\"2555\":2555,\"2556\":2556,\"2557\":2557,\"2559\":2559,\"2561\":2561,\"2560\":2560,\"2562\":2562,\"2564\":2564,\"2563\":2563,\"2565\":2565,\"2566\":2566,\"2567\":2567,\"2568\":2568,\"2569\":2569,\"2570\":2570,\"2571\":2571,\"2697\":2697}',1521232288,1676329262);
/*!40000 ALTER TABLE `mdl_analytics_predict_samples` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-23 17:26:53
