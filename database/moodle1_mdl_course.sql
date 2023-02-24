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
-- Table structure for table `mdl_course`
--

DROP TABLE IF EXISTS `mdl_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8mb4_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `enddate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `calendartype` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB AUTO_INCREMENT=2698 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Central course table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course`
--

LOCK TABLES `mdl_course` WRITE;
/*!40000 ALTER TABLE `mdl_course` DISABLE KEYS */;
INSERT INTO `mdl_course` VALUES (1,0,1,'TRI-Sim Learning Management System','TRI-Sim LMS','','<p><span class=\"rangySelectionBoundary\" id=\"selectionBoundary_1519118129950_9902471636666856\" style=\"line-height: 0; display: none;\">﻿</span><span class=\"rangySelectionBoundary\" id=\"selectionBoundary_1519118132110_8595690866521168\" style=\"line-height: 0; display: none;\">﻿</span><span class=\"rangySelectionBoundary\" id=\"selectionBoundary_1519118139293_4873468442892692\" style=\"line-height: 0; display: none;\">﻿</span><span class=\"rangySelectionBoundary\" id=\"selectionBoundary_1519118141164_334500226911731\" style=\"line-height: 0; display: none;\">﻿</span>Our moodle Site</p>',0,'site',1,3,0,0,0,0,0,0,1,1,0,0,0,'','','',1519117506,1534964186,0,0,0,1675108258),(2,1,120001,'Basics of Finance and Acounting','Finance','','<p>Basics of Finance and Accounting, including major topics such as accounting principles, the accounting cycle, financial statements, depreciation, amortization, inventory, and financial statement analysis. This course will be split into five major sections/topics.&nbsp;<br></p>',1,'topics',1,5,1518249600,0,0,5242880,0,0,1,1,0,0,0,'','','',1518199951,1597073553,0,1,0,1675108258),(4,12,60002,'Flex - RM MO','My Flex Factory','','<p>Real McCoy MO</p>',1,'topics',0,5,1519891200,1556694000,0,0,0,1,1,1,1,1,0,'','','',1519863236,1523510005,0,1,0,1675108258),(5,11,40015,'Dolan School of Business - Finance 500','FI 500','','RMH Simulation',1,'topcoll',1,5,1546588800,1597070700,0,0,0,0,1,1,0,0,0,'','','',1522842569,1597070766,0,1,0,1675108258),(14,1,120003,'Test (RM MO Course)','Test','','This is the test course that will hold all the testing for the LMS.&nbsp;',1,'topics',0,5,1561622400,1568585820,4,0,0,1,1,1,1,0,0,'','','',1519863236,1568585837,0,1,0,1675108258),(21,7,30046,'Dell Supply Chain Summit -- Austin','Dell Supply Chain Summit','','<p>This course is a Supply Chain simulation that is designed for Dell employees.</p>',1,'topics',0,5,1531119600,1531206000,0,0,0,0,1,1,1,1,0,'en','','',1531161025,1561038433,0,1,0,1675108258),(22,7,30047,'Dell Supply Chain Summit -- Brazil','Dell Supply Chain Summit -- Brazil','','',1,'topcoll',0,5,1531810800,1532071980,0,0,0,0,1,1,1,1,0,'','','',1531768122,1561038478,0,1,0,1675108258),(23,1,120004,'test scheduler course','test scheduler course','','<p>test scheduler course<br></p>',1,'topics',1,5,1532070000,1563606000,0,0,0,0,1,1,1,1,0,'','','',1531991678,1548944717,0,1,0,1675108258),(24,8,80007,'GE Global Customer Education','China Eastern','','',1,'topics',0,5,1533020400,1533022740,0,0,0,0,1,1,1,1,0,'','','',1532971995,1542703179,0,1,0,1675108258),(25,7,30051,'Dell Supply Chain Summit -- Penang','Dell Supply Chain Summit -- Penang','','',1,'topics',0,5,1531810800,1532071980,0,0,0,0,1,1,1,1,0,'','','',1531768122,1542702811,0,1,0,1675108258),(26,7,30048,'Dell Supply Chain Summit -- Chennai','Dell Supply Chain Summit -- Chennai','','',1,'topics',0,5,1531810800,1532071860,0,0,0,0,1,1,1,1,0,'','','',1531768122,1542702772,0,1,0,1675108258),(27,7,30049,'Dell Supply Chain Summit -- Franklin','Dell Supply Chain Summit -- Franklin','','',1,'topics',0,5,1531810800,1542357000,0,0,0,0,1,1,1,1,0,'','','',1531768122,1542702658,0,1,0,1675108258),(28,7,30052,'Dell Supply Chain Summit -- Shanghai','Dell Supply Chain Summit -- Shanghai','','',1,'topics',0,5,1542441600,1543481040,0,0,0,0,1,1,1,1,0,'','','',1531768122,1542703541,0,1,0,1675108258),(29,7,30050,'Dell Supply Chain Summit -- Limerick','Dell Supply Chain Summit -- Limerick','','',1,'topics',0,5,1531810800,0,0,0,0,0,1,1,1,1,0,'','','',1531768122,1548700319,0,1,0,1675108258),(30,6,150001,'Quest LQA','Quest LQA','','',1,'topics',1,5,1538377200,1538724960,0,0,0,0,1,1,0,0,0,'','','',1522842569,1542703003,0,1,0,1675108258),(31,7,30040,'Dell SCGP - Austin - Oct-2018','Dell SCGP - Austin - Oct-2018','','<p>Dell SCGP - Austin</p><p>Real McCoy MO</p>',1,'topics',0,5,1537945200,1538293080,17,0,0,1,1,1,1,1,0,'','','',1519863236,1567001256,0,1,0,1675108258),(32,7,30044,'Dell Supply Chain Development Program - Austin - Nov-2018','Dell SCDP - Austin - Nov-2018','','<p>Dell SCDP - Austin</p><p>Real McCoy MO</p>',1,'topics',0,5,1541142000,1541407020,0,0,0,1,1,1,1,1,0,'','','',1519863236,1567000376,0,1,0,1675108258),(34,7,30045,'Dell Supply Chain Development Program - Xiamen','Dell SCDP - Xiamen','','<p>Dell SCGP - Austin</p><p>Real McCoy MO</p>',1,'topcoll',0,5,1542268800,1542962640,0,0,0,1,1,1,1,1,0,'','','',1519863236,1542703572,0,1,0,1675108258),(38,8,80003,'GE Customer Education - Nov 2018','GE Customer Education - Nov 2018','','',1,'topcoll',0,5,1540882800,1566245880,0,0,0,0,1,1,1,1,0,'','','',1532971995,1566245920,0,1,0,1675108258),(39,8,80002,'GE Customer Education - Dec 2018','GE Customer Education - Dec 2018','','',1,'topcoll',0,5,1538377200,1566245880,0,0,0,0,1,1,1,1,0,'','','',1532971995,1566245900,0,1,0,1675108258),(41,7,30026,'Dell PDP - Nov 2018','Dell PDP - Nov 2018','','',1,'topics',0,5,1541923200,1542098100,0,0,0,0,1,1,1,1,0,'','','',1531768122,1542702962,0,1,0,1675108258),(46,14,130010,'RMH Program Template','RMH Template','','RMH Simulation',1,'topics',1,5,1546675200,0,0,0,0,0,1,1,0,0,0,'','','',1522842569,1546185594,0,1,0,1675108258),(51,12,60007,'MyFlexFactory - Budapest Feb-2019','Flex MFF - Budapest 2019','','<p>MyFlexFactory - Budapest, February 2019</p><p>Real McCoy MO</p>',1,'topics',0,5,1547798400,1556906100,0,0,0,1,1,1,1,1,0,'','','',1519863236,1556906120,0,1,0,1675108258),(52,12,60008,'MyFlexFactory - Old Memos','Flex MFF - Old Memos','','<p>MyFlexFactory - Budapest, February 2019</p><p>Real McCoy MO</p>',1,'topics',0,5,1547798400,0,0,0,0,1,1,1,1,1,0,'','','',1519863236,1547822860,0,1,0,1675108258),(53,13,140001,'Purdue','P3 2019','','',1,'topics',0,5,1549008000,1556696340,0,0,0,0,0,1,1,1,0,'','','',1532971995,1548718122,0,1,0,1675108258),(54,7,30033,'Dell S3 CFO Development Program - Spring-2019','Dell S3 - Spring-2019','','',1,'topics',1,5,1551427200,1566768060,0,0,0,0,1,1,1,0,0,'','','',1522842569,1567000954,0,1,0,1675108258),(55,9,20001,'Cisco Advanced Financial Analysis - Apr 2019','Cisco AFA - Apr 2019','','<p>Cisco Advanced Financial Analysis Program</p><p>Real McCoy Simulation</p>',1,'topics',0,5,1553065200,1564663920,0,0,0,1,1,1,1,1,0,'','','',1519863236,1565095966,0,1,0,1675108258),(60,7,30020,'Dell GOS Summit - Singapore - Apr-2019','Dell GOS Summit - Singapore - Apr-2019','','<p>Dell GOS Strategy Summit</p><p>Real McCoy MO</p>',1,'topcoll',0,5,1554015600,1556905980,0,0,0,1,1,1,1,1,0,'','','',1519863236,1567000816,0,1,0,1675108258),(61,10,70001,'FLIR Improving Business Acumen-Apr 2019','FLIR IBA - April-2019','','<p>P3 Simulation<br></p>',1,'topcoll',0,5,1554361200,1562486160,0,0,0,1,1,1,1,1,0,'','','',1519863236,1562572628,0,1,0,1675108258),(837,10,70002,'FLIR Improving Business Acumen-May 2019','FLIR IBA - May-2019','','<p>P3 Simulation<br></p>',1,'topcoll',0,5,1555311600,1562486100,0,0,0,1,1,1,1,1,0,'','','',1519863236,1592411332,0,1,0,1675108258),(838,15,180002,'Stryker Finance Leadership Simulation','Stryker FLS - 2019','','<p>Real McCoy Simulation</p>',1,'topics',0,5,1555311600,1562485980,0,0,0,1,1,1,1,1,0,'','','',1519863236,1562572405,0,1,0,1675108258),(839,9,20009,'Cisco Operations - May 2019','Cisco Operations - May 2019','','',1,'topics',0,5,1555311600,1562486280,0,0,0,0,1,1,1,1,0,'','','',1531768122,1562572712,0,1,0,1675108258),(1766,14,130003,'Dell Customer Supply Chain Planning - May-2019','Dell CSCP - May 2019','','',1,'topics',0,5,1556694000,1562486040,0,0,0,0,1,1,1,1,0,'','','',1531768122,1567000462,0,1,0,1675108258),(1768,14,130009,'RM MO Course Template - July 2019','RM MO Template - July 2019','','<p>This is the RM MO simulation.</p>',1,'topics',0,5,1551772800,1575297900,0,0,0,1,1,1,1,1,0,'','','',1519863236,1575297956,0,1,0,1675108258),(1769,14,130008,'P3 Template - May 2019 copy 1','P3 Template_1','','<p>P3 Simulation<br></p>',1,'topics',0,5,1559026800,0,0,0,0,1,1,1,1,1,0,'','','',1519863236,1557237140,0,1,0,1675108258),(1770,1,120005,'Zoom Information Course','Zoom Info','','<p>This is a course for the employees of TRI to understand the Zoom Calling.</p>',1,'topcoll',1,5,1559170800,0,0,0,0,0,1,1,1,1,0,'','','',1559156821,1559159633,0,1,0,1675108258),(1771,7,30005,'CFO of the Future Simulation - Dell FDP - July-2019','Dell FDP - July-2019','','<p>Robotic Surgeon Simulation<br></p>',1,'topics',0,5,1559026800,1565448300,0,0,0,1,1,1,1,1,0,'','','',1519863236,1567000696,0,1,0,1675108258),(1772,14,130006,'LMS Internal Training Course Template -- June 2019','Internal Training Template -- June 2019','','',1,'topics',0,5,1559026800,0,0,0,0,1,1,1,1,1,0,'','','',1519863236,1561668767,0,1,0,1675108258),(1773,8,80008,'GE RM MO Demo - June 2019','RM MO Demo - June 2019','','<p>Real McCoy MO Simulation</p>',1,'topics',0,5,1551772800,1562482800,0,0,0,1,1,1,1,1,0,'','','',1519863236,1562575662,0,1,0,1675108258),(1774,14,130001,'CFO of the Future Template - June 2019','CFO Template - June 2019','','<p>Robotic Surgeon Simulation<br></p>',1,'topics',0,5,1559026800,0,0,0,0,1,1,1,1,1,0,'','','',1519863236,1560363156,0,1,0,1675108258),(1775,8,80001,'GE AFMC GROW - Baden -  July 2019','GE AFMC GROW - Baden - July 2019','','<p>Real McCoy Simulation</p>',1,'topcoll',0,5,1562569200,1564663740,0,0,0,1,1,1,1,0,0,'','','',1519863236,1565095804,0,1,0,1675108258),(1776,7,30009,'Dell CFO of the Future - Penang - July 2019','Dell CFO - Penang - July 2019','','<p>Robotic Surgeon Simulation<br></p>',1,'topcoll',0,5,1561964400,1565448240,0,0,0,1,1,1,1,0,0,'','','',1519863236,1566053088,0,1,0,1675108258),(1777,8,80009,'GE Supply Chain - Atlanta - August, 2019','GE Supply Chain - Atlanta - August, 2019','','',1,'topcoll',0,5,1564642800,1566053100,0,0,0,1,1,1,1,0,0,'','','',1519863236,1566053153,0,1,0,1675108258),(1778,16,210004,'evelynb Training - July 2019','evelynb - July 2019','','',1,'topics',0,5,1559026800,1577731140,0,0,0,1,1,1,1,1,0,'','','',1519863236,1577731185,0,1,0,1675108258),(1779,1,120002,'Evelyn RM Test Quarterly Reports - July 2019','Evelyn RM Test - July 2019','','<p>Real McCoy Simulation</p>',1,'topcoll',0,5,1555311600,0,0,0,0,1,1,1,2,0,0,'','','',1519863236,1583769437,0,1,0,1675108258),(1780,16,210006,'Mikeg-Training-July2019','Mikeg-July2019','','',1,'topics',0,5,1559026800,1568585760,0,0,0,1,1,1,1,1,0,'','','',1519863236,1568585781,0,1,0,1675108258),(1781,17,190001,'Developing Business Partnership','DBP','','RMH Simulation for Tate &amp; Lyle',1,'topcoll',1,5,1609488000,1619766000,0,0,0,0,1,1,0,0,0,'','','',1522842569,1604595414,0,1,0,1675108258),(1783,19,200001,'TBC Business Essentials Program - August 2019','TBC Business Essentials Program - August 2019','','',1,'topics',0,5,1564642800,1566200820,0,0,0,0,1,1,1,0,0,'','','',1531768122,1574149685,0,1,0,1675108258),(1784,14,130004,'Hubbell IBA - Oct-2019','Hubbell IBA - Oct-2019','','RMH Simulation',1,'topcoll',1,5,1565420400,0,0,0,0,0,1,1,0,0,0,'','','',1522842569,1571075880,0,1,0,1675108258),(1785,11,40005,'Dolan School of Business - FI 500 - Fall 2019 - Sept Live Class','FI 500 - Fall 2019 - Sept Live Class','','RMH Simulation',1,'topics',1,5,1567321200,1596210660,0,0,0,0,1,1,0,0,0,'','','',1522842569,1596210678,0,1,0,1675108258),(1786,11,40004,'Dolan School of Business - FI 500 - Fall 2019 -  Oct Virtual Class','FI 500 - Fall 2019 - Oct Virtual Class','','RMH Simulation',1,'topics',1,5,1567321200,1670259240,0,0,0,0,1,1,0,0,0,'','','',1522842569,1670345676,0,1,0,1675108258),(1787,14,130002,'Cisco LIFT - SC - Dec-2019','Cisco LIFT - SC - Dec-2019','','RMH Simulation',1,'topics',1,5,1573804800,0,0,0,0,0,1,1,0,0,0,'','','',1522842569,1572469845,0,1,0,1675108258),(1788,7,30027,'Dell S3 - Fall 2019','Dell S3 - Fall 2019','','',1,'topcoll',1,5,1567321200,1582586760,0,0,0,0,1,1,1,0,0,'','','',1522842569,1582586783,0,1,0,1675108258),(1789,7,30024,'Dell LDP US - Austin - Sept-2019','Dell LDP US - Austin - Sept-2019','','',1,'topcoll',0,5,1566802800,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1568585719,0,1,0,1675108258),(1790,8,80004,'GE Customer Education- Air China Cincinnati Sept 2019','GE Customer Education - Air China Cincinnati Sept 2019','','',1,'topcoll',0,5,1567004400,1570149360,0,0,0,0,1,1,1,1,0,'','','',1532971995,1570149413,0,1,0,1675108258),(1791,7,30022,'Dell LDP Asia - Oct-2019','Dell LDP Asia - Oct-2019','','',1,'topcoll',0,5,1566802800,1571470980,0,0,0,1,1,1,1,0,0,'','','',1519863236,1574149412,0,1,0,1675108258),(1792,7,30035,'Dell SCDP - US - Nov-2019','Dell SCDP - US - Nov-2019','','',1,'topcoll',0,5,1570258800,1573890000,0,0,0,1,1,1,1,0,0,'','','',1519863236,1574149255,0,1,0,1675108258),(1793,7,30034,'Dell SCDP - Asia - Nov-2019','Dell SCDP - Asia - Nov-2019','','',1,'topcoll',0,5,1566802800,1576009740,0,0,0,1,1,1,1,0,0,'','','',1519863236,1576009795,0,1,0,1675108258),(1794,7,30041,'Dell SCGP - Austin - Oct-2019','Dell SCGP - Austin - Oct-2019','','',1,'topcoll',0,5,1567580400,1596210780,0,0,0,1,0,0,1,0,0,'','','',1519863236,1596210822,0,1,0,1675108258),(1796,8,80006,'GE Customer Education- China Eastern Oct 2019','GE Customer Education - China Eastern Oct 2019 ','','',1,'topcoll',0,5,1568242800,1568879040,0,0,0,0,1,1,1,1,0,'','','',1532971995,1574149495,0,1,0,1675108258),(1797,19,200005,'TBC Business Essentials Program - September 2019','TBC Business Essentials Program - September 2019','','',1,'topics',0,5,1569222000,1569915900,0,0,0,0,1,1,1,0,0,'','','',1531768122,1574149562,0,1,0,1675108258),(1798,7,30008,'Dell CFO of the Future - Buenos Aires - October 2019','Dell CFO of the Future - Buenos Aires - October 2019','','<p>Robotic Surgeon Simulation<br></p>',1,'topcoll',0,5,1569913200,1573397040,0,0,0,1,1,1,1,0,0,'','','',1519863236,1566053088,0,1,0,1675108258),(1799,8,80005,'GE Customer Education- China 2020','GE Customer Education - China 2020','','',1,'topcoll',0,5,1578045600,0,0,0,0,0,1,1,1,1,0,'','','',1532971995,1568759694,0,1,0,1675108258),(1800,12,60005,'MyFlexFactory - Batam - Nov-2019','MyFlexFactory - Batam - Nov-2019','','',1,'topcoll',0,5,1570604400,1577824320,0,0,0,1,1,1,1,0,0,'','','',1519863236,1576009995,0,1,0,1675108258),(1876,7,30025,'Dell PDP - Austin - Nov 2019','Dell PDP - Austin - Nov 2019','','',1,'topics',0,5,1571036400,1576009680,0,0,0,0,1,1,1,1,0,'','','',1531768122,1576009757,0,1,0,1675108258),(1877,16,210003,'ericw - Training - 10-2019','ericw - 10-2019','','',1,'topics',0,5,1571774400,0,0,0,0,1,1,1,1,1,0,'','','',1519863236,1561668767,0,1,0,1675108258),(1878,16,210005,'ewest2 -Training - 10-2019','ewest2-102019','','',1,'topcoll',0,5,1571727600,0,0,0,0,1,1,1,1,1,0,'','','',1519863236,1571947420,0,1,0,1675108258),(1880,19,200004,'TBC Business Essentials Program - October 2019','TBC Business Essentials Program - October 2019','','',1,'topics',0,5,1571900400,1572421260,0,0,0,0,1,1,1,0,0,'','','',1531768122,1574149331,0,1,0,1675108258),(1956,9,20003,'Cisco LIFT - Dec-2019','Cisco LIFT - Dec-2019','','RMH Simulation',1,'topcoll',1,5,1572418800,1670259060,0,0,0,0,1,1,0,0,0,'','','',1522842569,1670345527,0,1,0,1675108258),(1957,21,50001,'Xcelerators Sprint 2 December 2019','Xcelerators Sprint 2 December 2019','','',1,'topics',0,5,1571900400,0,0,0,0,0,1,1,1,0,0,'','','',1531768122,1575375456,0,1,0,1675108258),(1958,9,20008,'Cisco Operations - December 2019','Cisco Operations - December 2019','','',1,'topics',0,5,1574668800,0,0,0,0,0,1,1,1,1,0,'','','',1531768122,1576190412,0,1,0,1675108258),(1959,12,60006,'MyFlexFactory - Budapest - Jan 2020','MyFlexFactory - Budapest - Jan 2020','','',1,'topcoll',0,5,1575187200,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1576773934,0,1,0,1675108258),(1961,19,200002,'TBC Business Essentials Program - December 2019','TBC Business Essentials Program - December 2019','','',1,'topics',0,5,1576479600,1577000460,0,0,0,0,1,1,1,0,0,'','','',1531768122,1576506989,0,1,0,1675108258),(1962,11,40006,'Dolan School of Business - FI 500 - Winter Intersession - January 2020','Dolan School of Business - FI 500 - Winter Intersession - January 2020','','RMH Simulation',1,'topics',1,5,1576483200,1670259240,0,0,0,0,1,1,0,0,0,'','','',1522842569,1670345709,0,1,0,1675108258),(1963,12,60004,'MyFlexFactory - 2020 Template','MyFlexFactory - 2020 Template','','',1,'topcoll',0,5,1577808000,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1576773934,0,1,0,1675108258),(1964,7,30019,'Dell FLP - March 2020','Dell FLP - March 2020','','<p>Dell FLP</p><p>Real McCoy Simulation</p>',1,'topcoll',0,5,1580716800,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1597417958,0,0,0,1675108258),(1965,19,200003,'TBC Business Essentials Program - February 2020','TBC Business Essentials Program - February 2020','','',1,'topcoll',0,5,1580886000,0,0,0,0,0,1,1,1,0,0,'','','',1531768122,1581441747,0,1,0,1675108258),(1991,11,40003,'Dolan School of Business - FI 330 - Spring 2020 - Virtual Class','Dolan School of Business - FI 330 - Spring 2020','','RMH Simulation',1,'topics',1,5,1581235200,1670259180,0,0,0,0,1,1,0,0,0,'','','',1522842569,1670345630,0,1,0,1675108258),(1992,11,40002,'Dolan School of Business - FI 330 - 2020 - Virtual Class','Dolan School of Business - FI 330 - 2020','','<p>Real McCoy Simulation</p>',1,'topics',0,5,1581235200,1588409580,0,0,0,1,1,1,1,1,0,'','','',1519863236,1562572405,0,1,0,1675108258),(1993,22,170005,'Stanley Black and Decker SLP Cohort 1 - North America','SBD - SLP USA','','',1,'topcoll',0,5,1595228400,1598857200,0,0,0,1,1,1,1,1,0,'','','',1519863236,1597937514,0,1,0,1675108258),(2020,13,140002,'Purdue MBA 2020','Purdue P3 2020','','',1,'topics',0,5,1549008000,1556696340,0,0,0,0,0,1,1,1,0,'','','',1532971995,1548718122,0,1,0,1675108258),(2022,7,30030,'Dell S3 - Spring 2020','Dell S3 - Spring 2020','','',1,'topcoll',1,5,1582531200,1596299880,0,0,0,0,1,1,1,0,0,'','','',1522842569,1598978342,0,1,0,1675108258),(2025,9,20002,'Cisco Advanced Financial Analysis - Spring 2020 - Virtual','Cisco Advanced Financial Analysis - Spring 2020 - Virtual','','<p>Cisco AFA</p><p>Real McCoy Simulation</p>',1,'topcoll',0,5,1585119600,1670249700,0,0,0,1,1,1,1,0,0,'','','',1519863236,1670336164,0,0,0,1675108258),(2079,16,210001,'BH 301 FOR MARIA ','BH 301 FOR MARIA ','','<p>Pre-Work for Baker Hughes 301 Program</p>',1,'topics',1,5,1586934000,0,0,0,0,0,1,1,1,1,0,'','','',1586275671,1586975052,0,1,0,1675108258),(2385,16,210007,'TEST COURSE','TEST COURSE','','',1,'topcoll',0,5,1588143600,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1600384768,0,0,0,1675108258),(2388,16,210002,'Course Access TEST','Course Access TEST','','',1,'topcoll',0,5,1588143600,1591634760,0,0,0,1,1,1,1,0,0,'','','',1519863236,1591721220,0,0,0,1675108258),(2489,14,130005,'KF Demo ','KF Demo ','','',1,'topcoll',0,5,1591772400,1595171760,0,0,0,0,1,1,1,0,0,'','','',1531768122,1595258236,0,1,0,1675108258),(2490,22,170006,'Stanley Black and Decker SLP Cohort 2 - Asia & Europe','SBD - SLP Asia & Europe','','',1,'topcoll',0,5,1595228400,1598857200,0,0,0,1,1,1,1,1,0,'','','',1519863236,1597938236,0,1,0,1675108258),(2493,24,90001,'Emerging Leaders Program','ELP - Sep-2020','1','<p>RMH for General Mills</p>',1,'topcoll',1,5,1598511600,1607587200,0,0,0,0,1,1,1,1,0,'','','',1597072514,1598542369,0,1,0,1675108258),(2495,11,40001,'Course restoration in progress','restoring','',NULL,0,'topics',1,1,0,0,0,0,0,0,0,1,0,0,0,'','','',1597416902,1597416902,0,0,0,1675108258),(2496,11,40007,'Dolan School of Business - FI 6500 - Fall 2020','FI 6500 - Fall 2020','','RMH Simulation',1,'topics',1,5,1597388400,1675196400,0,0,0,0,1,1,0,0,0,'','','',1522842569,1675196449,0,0,0,1675196449),(2497,7,30028,'Dell S3 - Fall 2020','Dell S3 - Fall 2020','','',1,'topcoll',1,5,1598425200,1614555600,0,0,0,0,1,1,1,0,0,'','','',1522842569,1614555618,0,1,0,1675108258),(2498,7,30039,'DELL SCDP Austin 2020','Dell SCDP Austin 2020','','',1,'topcoll',0,5,1575187200,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1602504086,0,1,0,1675108258),(2499,7,30043,'DELL SCGP Austin 2020','DELL SCGP Austin 2020','','',1,'topcoll',0,5,1575187200,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1599595319,0,1,0,1675108258),(2500,7,30038,'DELL SCDP Asia 2020','DELL SCDP Asia 2020','','',1,'topcoll',0,5,1575187200,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1599595472,0,1,0,1675108258),(2501,11,40010,'Dolan School of Business - FI 6500 - October 2020','FI 6500 - October 2020','','RMH Simulation',1,'topics',1,5,1601881200,1676231640,0,0,0,0,1,1,0,0,0,'','','',1522842569,1676318086,0,0,0,1676318086),(2503,9,20007,'Cisco LIFT1 Fall 2020','Cisco LIFT1 Fall 2020','','<p>Cisco LIFT1 Fall 2020<br></p>',1,'topcoll',1,5,1606982400,1607966400,0,0,0,0,1,1,1,1,0,'','','',1606927673,1607966452,0,1,0,1675108258),(2504,11,40013,'Dolan School of Business - FI 6500 - Winter Intersession 2021','FI 6500 - Winter Intersession 2021','','RMH Simulation',1,'topics',1,5,1608105600,0,0,0,0,0,1,1,0,0,0,'','','',1522842569,1608167500,0,0,0,1675108258),(2505,14,130007,'Mondelez Financial Acumen Skill Training','MDLZ FAST','','<p>This course if run using the RMH Case written for MDLZ. Facilitators and participants use the MS Teams software within the MDLZ IT environment to deliver the program. The most up tp date versions o the models and other program information can be found here for facilitator shared access.&nbsp;</p>',1,'topcoll',1,5,1609660800,1639568160,0,0,0,0,1,1,1,1,0,'','','',1609674413,1618773589,0,1,0,1675108258),(2506,13,140003,'Purdue Weekend MBA 2021','Purdue MBA 2021','','',1,'topcoll',0,5,1610697600,1614326400,0,0,0,1,1,1,1,1,0,'','','',1519863236,1611192148,0,1,0,1675108258),(2507,9,20004,'Cisco LIFT - February 2021','Cisco LIFT - February 2021','','RMH Simulation',1,'topcoll',1,5,1611648000,1670259120,0,0,0,0,1,1,0,0,0,'','','',1522842569,1670345576,0,1,0,1675108258),(2508,7,30031,'Dell S3 - Spring 2021','Dell S3 - Spring 2021','','',1,'topcoll',1,5,1614499200,1629739200,0,0,0,0,1,1,1,0,0,'','','',1522842569,1629739232,0,1,0,1675108258),(2509,7,30011,'Dell FAP CFO of the Future - Americas','Dell FAP Americas','','<p>Dell&nbsp; FAP Program</p><p>CFO of the Future</p><p>Americas cohort</p><p>March 2021</p>',1,'topcoll',1,5,1615190400,0,0,0,0,0,1,1,1,0,0,'','','',1614748787,1617650534,0,1,0,1675108258),(2510,7,30013,'Dell FAP CFO of the Future - EMEA','Dell FAP EMEA','','<p>Dell&nbsp; FAP Program</p><p>CFO of the Future</p><p>Americas cohort</p><p>April 2021</p>',1,'topcoll',1,5,1617001200,0,0,0,0,0,1,1,1,0,0,'','','',1614748787,1617643708,0,1,0,1675108258),(2512,7,30012,'Dell FAP CFO of the Future - APJ','Dell FAP APJ','','<p>Dell&nbsp; FAP Program</p><p>CFO of the Future</p><p>APJ cohort</p><p>April 2021</p>',1,'topcoll',1,5,1617667200,0,0,0,0,0,1,1,1,0,0,'','','',1614748787,1617643656,0,1,0,1675108258),(2513,25,100001,'Grow Your Business QA','GYB QA','','',1,'topcoll',1,5,1618383600,0,0,0,0,0,1,1,1,1,0,'','','',1618315597,1618315597,0,1,0,1675108258),(2514,22,170002,'Stanley Black and Decker FFX - May 2021 Virtual','SBD FFX May 2021','','<p>SBD FFX</p><p>Real McCoy Simulation</p>',1,'topcoll',0,5,1618383600,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1618425307,0,0,0,1675108258),(2515,26,220003,'Varian FDP Spring 2021','Varian FDP Spring 2021','','RMH Simulation',1,'topcoll',1,5,1619247600,0,0,0,0,0,1,1,0,0,0,'','','',1522842569,1571075880,0,1,0,1675108258),(2516,27,160001,'Red Wing Business Essentials Program - June 2021','Red Wing BEP','','',1,'topcoll',0,5,1621663200,0,0,0,0,0,1,1,1,0,0,'','','',1531768122,1622122104,0,1,0,1675108258),(2517,14,130011,'VSP Oct 2021','VSP Oct 2021','','',1,'topcoll',0,5,1622534400,0,0,0,0,0,1,1,1,0,0,'','','',1531768122,1623688097,0,1,0,1675108258),(2518,11,40014,'Dolan School of Business - FI6500 - June 2021 Intersession','FI6500 - June 2021 Intersession','','RMH Simulation',1,'topics',1,5,1622358000,0,0,0,0,0,1,1,0,0,0,'','','',1522842569,1622512667,0,0,0,1675108258),(2519,11,40016,'Fairfield FI500 Fall China','Fairfield FI500 Fall China','','',1,'topcoll',0,5,1627801200,0,0,0,0,1,1,1,1,1,0,'','','',1519863236,1647556502,0,1,0,1675108258),(2520,7,30006,'Dell ADP Asia - September 2021','Dell ADP Asia','','',1,'topcoll',0,5,1630468800,0,0,0,0,0,1,1,1,1,0,'','','',1531768122,1630557895,0,1,0,1675108258),(2521,7,30007,'Dell ADP US - September 2021','Dell ADP US','','',1,'topcoll',0,5,1630468800,0,0,0,0,0,1,1,1,1,0,'','','',1531768122,1630504542,0,1,0,1675108258),(2522,7,30029,'Dell S3 - Fall 2021','Dell S3 - Fall 2021','','',1,'topcoll',1,5,1630047600,1643732400,0,0,0,0,1,1,1,0,0,'','','',1522842569,1643806411,0,1,0,1675108258),(2523,11,40012,'Dolan School of Business - FI 6500 - September 2021','FI 6500 - September 2021','','RMH Simulation',1,'topics',1,5,1629961200,0,0,0,0,0,1,1,0,0,0,'','','',1522842569,1601937801,0,0,0,1675108258),(2524,7,30021,'DELL LDP Americas 2021','Dell LDP Americas 2021','','',1,'topcoll',0,5,1630479600,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1630557424,0,1,0,1675108258),(2525,28,110002,'Hubbell IBA - October 2021','Hubbell IBA - October 2021','','RMH Simulation',1,'topcoll',1,5,1631084400,0,0,0,0,0,1,1,0,0,0,'','','',1522842569,1571075880,0,1,0,1675108258),(2527,7,30023,'Dell LDP Asia 2021','Dell LDP Asia ','','',1,'topcoll',0,5,1632380400,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1630557424,0,1,0,1675108258),(2528,7,30036,'Dell SCDP Americas Fall 2021','Dell SCDP Americas Fall 2021','','',1,'topcoll',0,5,1632898800,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1632951897,0,1,0,1675108258),(2531,7,30042,'Dell SCGP Americas Fall 2021','Dell SCGP Americas Fall 2021','','',1,'topcoll',0,5,1632466800,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1632951897,0,1,0,1675108258),(2532,11,40011,'Dolan School of Business - FI 6500 - October 2021','FI 6500 - October 2021','','RMH Simulation',1,'topics',1,5,1635058800,1676231700,0,0,0,0,1,1,0,0,0,'','','',1522842569,1676318126,0,0,0,1676318126),(2533,26,220002,'Varian FDP Fall 2021','Varian FDP Fall 2021','','RMH Simulation',1,'topcoll',1,5,1635145200,0,0,0,0,0,1,1,0,0,0,'','','',1522842569,1571075880,0,1,0,1675108258),(2535,7,30037,'Dell SCDP APJ Fall 2021','Dell SCDP APJ Fall 2021','','',1,'topcoll',0,5,1635750000,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1632951897,0,1,0,1675108258),(2536,9,20006,'Cisco LIFT1 Dec 2021','Cisco LIFT1 Dec 2021','','<p>Cisco LIFT1 Fall 2021<br></p>',1,'topcoll',1,5,1637395200,1639243200,0,0,0,0,1,1,1,1,0,'','','',1606927673,1639139509,0,1,0,1675108258),(2537,11,40008,'Dolan School of Business - FI 6500 - January 2022','FI 6500 - January 2022','','RMH Simulation',1,'topics',1,5,1639987200,1675196460,0,0,0,0,1,1,0,0,0,'','','',1522842569,1675196484,0,0,0,1675196484),(2538,22,170004,'Stanley Black and Decker SLP - North America Fall 2022','SBD - SLP North America','','',1,'topcoll',0,5,1664683200,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1666651560,0,1,0,1675108258),(2539,22,170003,'Stanley Black and Decker SLP - EMEA ','Stanley Black and Decker SLP - EMEA ','','',1,'topcoll',0,5,1643691600,0,0,0,0,1,1,1,1,1,0,'','','',1519863236,1661720183,0,1,0,1675108258),(2540,13,140004,'Purdue Weekend MBA 2022','Purdue MBA 2022','','',1,'topcoll',0,5,1644307200,1647936000,0,0,0,1,1,1,0,0,0,'','','',1519863236,1644348018,0,0,0,1675108258),(2541,7,30032,'Dell S3 - Spring 2022','Dell S3 - Spring 2022','','',1,'topcoll',1,5,1644825600,1660000860,0,0,0,0,1,1,1,0,0,'','','',1522842569,1660000914,0,1,0,1675108258),(2542,9,20005,'Cisco Lift - March 2022','Cisco Lift - March 2022','','RMH Simulation',1,'topcoll',1,5,1645257600,1675196340,0,0,0,0,1,1,0,0,0,'','','',1522842569,1675196414,0,1,0,1675196414),(2543,11,40017,'Fairfield FI500 Spring China','Fairfield FI500 Spring China','','',1,'topcoll',0,5,1648796400,0,0,0,0,1,1,1,1,1,0,'','','',1519863236,1631744421,0,1,0,1675108258),(2544,29,10001,'Atlas Holding','Atlas Holding','','<p>Atlas Holding</p><p>Real McCoy Simulation</p>',1,'topcoll',0,5,1650351600,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1650305317,0,0,0,1675108258),(2545,7,30015,'Dell FAP June 2022 CFO of the Future - Americas','Dell FAP Americas June 2022','','<p>Dell&nbsp; FAP Program</p><p>CFO of the Future</p><p>Americas cohort</p><p><br></p>',1,'topcoll',1,5,1615190400,0,0,0,0,0,1,1,1,0,0,'','','',1614748787,1653662199,0,1,0,1675108258),(2546,11,40009,'Dolan School of Business - FI 6500 - June 2022','FI 6500 - June 2022','','RMH Simulation',1,'topics',1,5,1653289200,1675196460,0,0,0,0,1,1,0,0,0,'','','',1522842569,1675196513,0,0,0,1675196513),(2547,15,180001,'Stryker AIM Simulation','Stryker AIM Simulation','','<p>Stryker AIM Simulation</p><p>Real McCoy Simulation</p>',1,'topcoll',0,5,1654066800,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1654137298,0,0,0,1675108258),(2548,16,210008,'Tim\'s Dev Test Course','TTC','','',1,'topcoll',1,5,1654758000,0,0,0,0,0,1,1,1,1,0,'','','',1654912198,1654912198,0,1,0,1675108258),(2549,7,30014,'Dell FAP July 2022 CFO of the Future - APJ','Dell FAP APJ July 2022','','<p>Dell&nbsp; FAP Program</p><p>CFO of the Future</p><p>APJ cohort</p><p><br></p>',1,'topcoll',1,5,1655017200,0,7,0,0,0,1,1,1,0,0,'','','',1614748787,1655151780,0,1,0,1675108258),(2550,7,30010,'Dell FAP August 2022 CFO of the Future - LATAM','Dell FAP LATAM August 2022','','<p>Dell FAP Program</p><p>CFO of the Future</p><p>LATAM cohort</p><p><br></p>',1,'topcoll',1,5,1655017200,0,0,0,0,0,1,1,1,0,0,'','','',1614748787,1655152545,0,1,0,1675108258),(2551,28,110001,'Hubbell IBA - July 2022','Hubbell IBA - July 2022','','RMH Simulation<p><br></p>',1,'topcoll',1,5,1656918000,0,0,0,0,0,1,1,0,0,0,'','','',1522842569,1657110841,0,1,0,1675108258),(2552,7,30016,'Dell FAP September 2022 CFO of the Future - EMEA','Dell FAP EMEA September 2022','','<p>Dell FAP Program</p><p>CFO of the Future</p><p>LATAM cohort</p><p><br></p>',1,'topcoll',1,5,1659337200,0,0,0,0,0,1,1,1,0,0,'','','',1614748787,1659987498,0,1,0,1675108258),(2553,7,30017,'Dell FDP S3 - Fall 2022','Dell FDP S3 - Fall 2022','','',1,'topcoll',1,5,1661410800,1675267200,0,0,0,0,1,1,1,0,0,'','','',1522842569,1675191191,0,1,0,1675191191),(2555,12,60003,'My Flex Factory Sept 2022','MyFlexFactory','','',1,'topcoll',1,5,1659337200,0,0,0,0,0,1,1,1,1,0,'','','',1662045397,1662045449,0,1,0,1675108258),(2556,12,60001,'MyFlexFactory - 2022 Americas','MyFlexFactory - 2022 Americas','','',1,'topcoll',0,5,1664550000,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1665747534,0,1,0,1675108258),(2557,7,30018,'Dell Financial Leadership Program 2022','Dell FLP 2022','','<p>Dell Financial Leadership Program</p><p>Real McCoy Simulation</p>',1,'topcoll',0,5,1663225200,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1664323410,0,0,0,1675108258),(2560,7,30004,'EMPTY COURSE','EMPTY COURSE','','',1,'topcoll',1,5,1665471600,1674248940,0,0,0,0,1,1,1,1,0,'','','',1665432632,1665433359,0,1,0,1675108258),(2561,7,30003,'Dell MDP S3 Fall 2022','Dell MDP S3 Fall 2022','','',1,'topcoll',0,5,1665374400,1673625600,0,0,0,1,1,1,1,1,0,'','','',1519863236,1673613444,0,1,0,1675108258),(2562,7,30002,'Dell SCDP 2022 - North America','Dell SCDP 2022 - North America','','',1,'topcoll',0,5,1665414000,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1666274516,0,1,0,1675108258),(2563,22,170001,'Stanley Black and Decker FFX Program - 2022','Stanley FFX 2022','','<p>Stanley Black and Decker FFX</p><p>Real McCoy Simulation</p>',1,'topcoll',0,5,1667718000,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1667759001,0,0,0,1675108258),(2564,7,30001,'Dell SCDP 2022 - Asia','Dell SCDP 2022 - Asia','','',1,'topcoll',0,5,1667401200,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1666274516,0,1,0,1675108258),(2565,26,220001,'Varian FDP Fall 2022','Varian FDP Fall 2022','','RMH Simulation',1,'topcoll',1,5,1668499200,0,0,0,0,0,1,1,0,0,0,'','','',1522842569,1571075880,0,1,0,1675527796),(2566,31,230001,'Carestream Product Line Manager Program','Carestream PLM','','<p>Carestream Product Line Manager Program</p><p>Real McCoy Simulation</p>',1,'topcoll',0,5,1668672000,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1668681325,0,0,0,1675108258),(2567,12,0,'MyFlexFactory - 2022 Asia','MyFlexFactory - 2022 Asia','','',1,'topcoll',0,5,1668960000,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1669916329,0,1,0,1675108258),(2568,9,0,'Cisco LIFT1 Dec 2022','Cisco LIFT1 Dec 2022','','<p>Cisco LIFT1 Fall 2022<br></p>',1,'topcoll',1,5,1668931200,1670692800,0,0,0,0,1,1,1,1,0,'','','',1606927673,1670615906,0,1,0,1675108258),(2569,7,0,'Dell SCGP Austin - 2023','Dell SCGP Austin - 2023','','',1,'topcoll',0,5,1671292800,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1671419984,0,1,0,1675108258),(2570,9,0,'Cisco Lift - February 2023','Cisco Lift - February 2023','','RMH Simulation',1,'topcoll',1,5,1673596800,0,0,0,0,0,1,1,0,0,0,'','','',1522842569,1645282427,0,1,0,1676421446),(2571,12,0,'MyFlexFactory - 2023 Europe','MyFlexFactory - 2023 Europe','','',1,'topcoll',0,5,1642348800,0,0,0,0,1,1,1,1,0,0,'','','',1519863236,1669916329,0,1,0,1676637051),(2697,13,0,'Purdue Weekend MBA 2023','Purdue MBA 2023','','',1,'topcoll',0,5,1676275200,1679904000,0,0,0,1,1,1,0,0,0,'','','',1519863236,1644348018,0,0,0,1677164082);
/*!40000 ALTER TABLE `mdl_course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-23 17:24:34
