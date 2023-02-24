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
-- Table structure for table `mdl_course_categories`
--

DROP TABLE IF EXISTS `mdl_course_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Course categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_categories`
--

LOCK TABLES `mdl_course_categories` WRITE;
/*!40000 ALTER TABLE `mdl_course_categories` DISABLE KEYS */;
INSERT INTO `mdl_course_categories` VALUES (1,'Miscellaneous',NULL,NULL,0,0,120000,5,1,1,1519117507,1,'/1',NULL),(6,'Quest Diagnostics','','',1,0,150000,1,1,1,1537208143,1,'/6',NULL),(7,'Dell','','',1,0,30000,53,1,1,1561057997,1,'/7',NULL),(8,'General Electric','','',1,0,80000,9,1,1,1561057836,1,'/8',NULL),(9,'Cisco','','',1,0,20000,11,1,1,1542752934,1,'/9',NULL),(10,'FLIR','','',1,0,70000,2,1,1,1561058019,1,'/10',NULL),(11,'Dolan School of Business','','<p>Dolan School of Business, business school in Fairfield University</p>',1,0,40000,17,1,1,1546185515,1,'/11',NULL),(12,'Flex','','<p>Flex My Factory RMMO programs<br></p>',1,0,60000,10,1,1,1547671946,1,'/12',NULL),(13,'Purdue','','',1,0,140000,5,0,0,1548717927,1,'/13',NULL),(14,'Program Templates','','',1,0,130000,11,1,1,1552681527,1,'/14',NULL),(15,'Stryker','','',1,0,180000,2,1,1,1555357947,1,'/15',NULL),(16,'TRI Internal Training','','<p>This is a group of programs of TRI employees should be using to enhance their LMS skills.</p>',1,0,210000,8,1,1,1561061250,1,'/16',NULL),(17,'Tate & Lyle','','<p>New Customer</p>',1,0,190000,1,1,1,1564745069,1,'/17',NULL),(19,'TBC','','',1,0,200000,5,1,1,1565650257,1,'/19',NULL),(21,'EA','','<p>Electronic Arts&nbsp;Xcelerators</p>',1,0,50000,1,1,1,1574388633,1,'/21',NULL),(22,'Stanley Black & Decker','','',1,0,170000,6,1,1,1581447435,1,'/22',NULL),(24,'General Mills','','<p>General Mills - AMEA</p>',1,0,90000,1,1,1,1597073135,1,'/24',NULL),(25,'GYB Courses','','',1,0,100000,1,1,1,1618315332,1,'/25',NULL),(26,'Varian','','',1,0,220000,3,1,1,1619398666,1,'/26',NULL),(27,'Red Wing','','',1,0,160000,1,1,1,1621692481,1,'/27',NULL),(28,'Hubbell','','<p>Hubbell Programs</p>',1,0,110000,2,1,1,1631102157,1,'/28',NULL),(29,'Atlas Holdings','','',1,0,10000,1,1,1,1649127238,1,'/29',NULL),(31,'Carestream','','',1,0,230000,1,1,1,1668671102,1,'/31',NULL);
/*!40000 ALTER TABLE `mdl_course_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-23 17:20:46
