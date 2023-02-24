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
-- Table structure for table `mdl_chat_messages`
--

DROP TABLE IF EXISTS `mdl_chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `issystem` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores all the actual chat messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_messages`
--

LOCK TABLES `mdl_chat_messages` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages` DISABLE KEYS */;
INSERT INTO `mdl_chat_messages` VALUES (1,1,20,47,1,'enter',1537314533),(2,1,20,47,0,'We would like to talk with Celeste about chip pricing and terms',1537314566),(3,1,3,0,1,'enter',1537314605),(4,1,3,0,0,'beep 20',1537314620),(5,1,3,0,1,'exit',1537314834),(6,1,20,47,1,'exit',1537376113),(7,1,3,0,1,'enter',1537376123),(8,1,3,0,1,'exit',1537383608),(9,1,20,47,1,'enter',1537384082),(10,1,20,47,0,'Gabe Varden to discuss box prices',1537384112),(11,1,3,0,1,'enter',1537384157),(12,1,20,47,1,'exit',1537384325),(13,2,496,476,1,'enter',1578847649),(14,2,496,476,0,'TEST process question',1578847666),(15,2,3,0,1,'enter',1578847724),(16,2,3,0,1,'exit',1578847811),(17,2,496,476,1,'exit',1578853262),(18,2,3,0,1,'enter',1578935332),(19,2,3,0,1,'exit',1578935624),(20,3,3,0,1,'enter',1578935668),(21,3,3,0,0,'This is a test request from a Student role.',1578935685),(22,3,496,476,1,'enter',1578935721),(23,3,496,476,0,'Responding as ABC1',1578935768),(24,3,496,476,0,'Sending as ABC1 which is in ABC1 group.',1578935897),(25,2,496,0,1,'enter',1581356302),(26,2,496,0,1,'exit',1581356368),(27,4,1721,887,1,'enter',1599152036),(28,4,1721,887,0,'Hey RTD2, are you out there?',1599152050),(29,4,1724,887,1,'enter',1599152076),(30,4,1724,887,1,'exit',1599152162),(31,4,1720,0,1,'enter',1600381391),(32,4,1720,0,0,'test - can I upload files?',1600381408),(33,4,1720,0,1,'exit',1600381463);
/*!40000 ALTER TABLE `mdl_chat_messages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-23 17:25:09
