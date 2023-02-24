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
-- Table structure for table `mdl_analytics_used_files`
--

DROP TABLE IF EXISTS `mdl_analytics_used_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdl_analytics_used_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `modelid` bigint(10) NOT NULL DEFAULT '0',
  `fileid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_analusedfile_modactfil_ix` (`modelid`,`action`,`fileid`),
  KEY `mdl_analusedfile_mod_ix` (`modelid`),
  KEY `mdl_analusedfile_fil_ix` (`fileid`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Files that have already been used for training and predictio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_analytics_used_files`
--

LOCK TABLES `mdl_analytics_used_files` WRITE;
/*!40000 ALTER TABLE `mdl_analytics_used_files` DISABLE KEYS */;
INSERT INTO `mdl_analytics_used_files` VALUES (1,2,847,'predicted',1521232288),(2,2,30438,'predicted',1522843252),(3,2,33586,'predicted',1524139252),(4,2,33939,'predicted',1525176045),(5,2,34440,'predicted',1525521646),(6,2,36454,'predicted',1526745560),(7,2,36552,'predicted',1527249657),(8,2,36577,'predicted',1528149647),(9,2,36720,'predicted',1528408847),(10,2,36779,'predicted',1528754447),(11,2,36960,'predicted',1528927247),(12,2,37166,'predicted',1530050437),(13,2,37183,'predicted',1530136835),(14,2,37204,'predicted',1531173642),(15,2,45456,'predicted',1537993528),(16,2,45855,'predicted',1538085661),(17,2,56308,'predicted',1539727265),(18,2,56776,'predicted',1540764062),(19,2,57113,'predicted',1540850462),(20,2,58492,'predicted',1540936862),(21,2,59812,'predicted',1541023262),(22,2,60154,'predicted',1541109662),(23,2,68723,'predicted',1542063662),(24,2,69155,'predicted',1542150062),(25,2,70368,'predicted',1542754862),(26,2,73597,'predicted',1543446062),(27,2,90537,'predicted',1545346862),(28,2,90852,'predicted',1546297261),(29,2,92880,'predicted',1547852462),(30,2,93165,'predicted',1548284462),(31,2,93246,'predicted',1548457264),(32,2,94772,'predicted',1548802864),(33,2,106719,'predicted',1551481264),(34,2,110547,'predicted',1552600863),(35,2,111938,'predicted',1552687264),(36,2,112176,'predicted',1552946464),(37,2,114388,'predicted',1554156065),(38,2,115467,'predicted',1554328864),(39,2,134784,'predicted',1555365665),(40,2,139381,'predicted',1555452066),(41,2,193567,'predicted',1556748063),(42,2,193902,'predicted',1556834465),(43,2,212447,'predicted',1558216864),(44,2,213279,'predicted',1558562464),(45,2,216152,'predicted',1559080865),(46,2,217199,'predicted',1559167264),(47,2,221976,'predicted',1560290465),(48,2,223471,'predicted',1560376864),(49,2,241770,'predicted',1561500064),(50,2,243067,'predicted',1561672864),(51,2,243953,'predicted',1562018465),(52,2,248091,'predicted',1562796063),(53,2,263301,'predicted',1563400862),(54,2,269422,'predicted',1564092063),(55,2,277015,'predicted',1565733664),(56,2,278513,'predicted',1565820063),(57,2,282566,'predicted',1566770464),(58,2,283175,'predicted',1566856863),(59,2,283802,'predicted',1567029664),(60,2,284661,'predicted',1567634464),(61,2,284823,'predicted',1568066463),(62,2,300237,'predicted',1568844063),(63,2,301576,'predicted',1569276063),(64,2,313767,'predicted',1570140063),(65,2,316052,'predicted',1570658463),(66,2,319612,'predicted',1571176862),(67,2,335719,'predicted',1571781663),(68,2,338188,'predicted',1571868063),(69,2,338635,'predicted',1572040863),(70,2,339557,'predicted',1572127263),(71,2,340607,'predicted',1572472863),(72,2,348253,'predicted',1573254064),(73,2,365768,'predicted',1574463664),(74,2,366571,'predicted',1574722863),(75,2,376709,'predicted',1576018863),(76,2,378692,'predicted',1576537263),(77,2,380132,'predicted',1576796464),(78,2,380241,'predicted',1577487664),(79,2,395536,'predicted',1580598064),(80,2,396082,'predicted',1580770863),(81,2,397007,'predicted',1580943664),(82,2,398168,'predicted',1581289263),(83,2,401663,'predicted',1582412463),(84,2,403465,'predicted',1582671663),(85,2,423323,'predicted',1585260063),(86,2,423829,'predicted',1586210463),(87,2,424111,'predicted',1586296863),(88,2,424393,'predicted',1586988063),(89,2,425076,'predicted',1587592863),(90,2,425464,'predicted',1587679263),(91,2,425886,'predicted',1588197663),(92,2,426123,'predicted',1589234463),(93,2,435818,'predicted',1591308063),(94,2,437600,'predicted',1593122464),(95,2,441496,'predicted',1595282463),(96,2,442456,'predicted',1596232863),(97,2,463654,'predicted',1597442463),(98,2,516419,'predicted',1598479263),(99,2,522550,'predicted',1599602463),(100,2,526040,'predicted',1602021663),(101,2,526856,'predicted',1603490463),(102,2,550667,'predicted',1606950063),(103,2,553376,'predicted',1608246063),(104,2,555103,'predicted',1609714863),(105,2,559422,'predicted',1610838064),(106,2,564198,'predicted',1611702064),(107,2,570238,'predicted',1614639662),(108,2,571122,'predicted',1614812462),(109,2,588148,'predicted',1616968863),(110,2,588931,'predicted',1617660063),(111,2,591418,'predicted',1618351263),(112,2,594133,'predicted',1618437663),(113,2,604443,'predicted',1619474462),(114,2,608911,'predicted',1621461663),(115,2,627567,'predicted',1622412063),(116,2,629856,'predicted',1623708062),(117,2,635305,'predicted',1628546462),(118,2,635923,'predicted',1629928864),(119,2,637782,'predicted',1630015263),(120,2,638350,'predicted',1630101662),(121,2,639818,'predicted',1630620062),(122,2,642835,'predicted',1631138463),(123,2,662823,'predicted',1632434463),(124,2,665984,'predicted',1632952862),(125,2,678608,'predicted',1634940063),(126,2,679471,'predicted',1635199262),(127,2,680848,'predicted',1635285662),(128,2,687897,'predicted',1635804063),(129,2,700423,'predicted',1637017263),(130,2,710882,'predicted',1640041262),(131,2,720128,'predicted',1643497263),(132,2,721346,'predicted',1644361263),(133,2,724025,'predicted',1645311663),(134,2,725805,'predicted',1646089263),(135,2,734359,'predicted',1648245662),(136,2,735682,'predicted',1650319263),(137,2,760552,'predicted',1652306464),(138,2,766440,'predicted',1653343262),(139,2,767280,'predicted',1654207263),(140,2,778026,'predicted',1654984863),(141,2,778924,'predicted',1655157663),(142,2,792100,'predicted',1656972063),(143,2,808024,'predicted',1659996062),(144,2,816463,'predicted',1661205664),(145,2,818599,'predicted',1662069663),(146,2,830563,'predicted',1663020064),(147,2,837669,'predicted',1663797662),(148,2,857889,'predicted',1665439262),(149,2,883152,'predicted',1666303262),(150,2,920408,'predicted',1667426463),(151,2,921638,'predicted',1667775663),(152,2,930947,'predicted',1668553263),(153,2,932615,'predicted',1668726063),(154,2,936593,'predicted',1668985264),(155,2,940087,'predicted',1669590064),(156,2,950873,'predicted',1670972463),(157,2,970872,'predicted',1673650864),(158,2,973829,'predicted',1673996465),(159,2,995903,'predicted',1676329263);
/*!40000 ALTER TABLE `mdl_analytics_used_files` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-23 17:22:25
