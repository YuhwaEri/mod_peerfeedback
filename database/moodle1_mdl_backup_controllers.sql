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
-- Table structure for table `mdl_backup_controllers`
--

DROP TABLE IF EXISTS `mdl_backup_controllers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `operation` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backup',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1835 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='To store the backup_controllers as they are used';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_controllers`
--

LOCK TABLES `mdl_backup_controllers` WRITE;
/*!40000 ALTER TABLE `mdl_backup_controllers` DISABLE KEYS */;
INSERT INTO `mdl_backup_controllers` VALUES (1825,'44424489272e5c5a92fdc908b9435cc1','backup','activity',24074,'moodle2',0,10,364,1000,1,0,'744749087dc78111ab9cfbff6cc4c7c9',1676357463,1676357465,''),(1826,'4fed54683dfae177826dce673548e71e','backup','activity',23895,'moodle2',0,10,364,1000,1,0,'499a2797ad3f0362c25757167bcf637c',1676412663,1676412664,''),(1827,'9c5c06b8d560bc64271f249ad87831dd','backup','activity',24024,'moodle2',0,20,5,1000,1,0,'d492ff6c5a2d7d413184048187b59fbc',1676420808,1676420809,''),(1828,'f3dc6c5d14fea4e91df84807ded368ea','restore','activity',2697,'moodle2',0,20,5,1000,1,0,'9cb208198b4df106eb80aed77a0ba399',1676420809,1676420811,''),(1829,'544de0b8742f8c63d6786c3e8b205675','backup','activity',24023,'moodle2',0,10,364,1000,1,0,'6d0c1ddcd067e49b533d76b98adf9197',1676421064,1676421065,''),(1830,'1de8ce5fb596a8fdf821c6045287ac5a','backup','activity',23813,'moodle2',0,10,364,1000,1,0,'1f5443bfe5c2f4ec6ccf49e8eecb899f',1676467862,1676467863,''),(1831,'290f7b332032d2aa7b0c1a0fb7a8c842','backup','activity',23839,'moodle2',0,10,364,1000,1,0,'b991ada92ce881bc969113003c6e8069',1676468463,1676468465,''),(1832,'6bf719de6c338688387780dc3a4c63f3','backup','activity',23807,'moodle2',0,10,364,1000,1,0,'b4420b961b23c9060e7bf4e80ec69115',1676534464,1676534466,''),(1833,'e27ad52733f914c1ee61bfeb2edd0002','backup','activity',23805,'moodle2',0,10,364,1000,1,0,'7e381905ad28c52a4112b3bc17fec92c',1676534468,1676534469,''),(1834,'0f783451408b78940d21de2709561d2e','backup','activity',23815,'moodle2',0,10,364,1000,1,0,'e4f4583f4abc3522143f4a1c5f20da7a',1676617264,1676617275,'');
/*!40000 ALTER TABLE `mdl_backup_controllers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-23 17:21:43
