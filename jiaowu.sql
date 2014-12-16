-- MySQL dump 10.11
--
-- Host: localhost    Database: jiaowu
-- ------------------------------------------------------
-- Server version	5.5.20-log

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
-- Current Database: `jiaowu`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jiaowu` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jiaowu`;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `courses` (
  `CID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Cname` varchar(100) NOT NULL,
  `TID` smallint(6) NOT NULL,
  UNIQUE KEY `CID` (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Hamagong',2),(2,'TaiJiquan',3),(3,'Yiyangzhi',6),(4,'Jinshejianfa',1),(5,'Qianzhuwandushou',4),(6,'Qishangquan',5),(7,'Qiankundanuoyi',7),(8,'Wanliduxing',8),(9,'Pixiejianfa',3),(10,'Jiuyinbaiguzhua',7);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `scores` (
  `ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `SID` smallint(6) NOT NULL,
  `CID` smallint(6) NOT NULL,
  `Score` float DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (1,2,2,67),(2,2,3,71),(3,1,2,90),(4,1,7,45),(5,3,6,32),(6,3,1,99),(7,4,8,95),(8,4,10,36);
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `students` (
  `SID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Age` tinyint(3) unsigned DEFAULT NULL,
  `Gender` enum('F','M') DEFAULT 'M',
  `CID1` smallint(5) unsigned DEFAULT NULL,
  `CID2` smallint(5) unsigned DEFAULT NULL,
  `TID` smallint(6) DEFAULT NULL,
  `CreateTime` datetime DEFAULT '2012-04-06 10:00:00',
  UNIQUE KEY `SID` (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=3907 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'GuoJing',19,'M',2,7,3,'2012-04-06 10:00:00'),(2,'YangGuo',17,'M',2,3,1,'2012-04-06 10:00:00'),(3,'DingDian',25,'M',6,1,7,'2012-04-06 10:00:00'),(4,'HuFei',31,'M',8,10,5,'2012-04-06 10:00:00'),(5,'HuangRong',16,'F',5,9,9,'2012-04-06 10:00:00'),(6,'YueLingshang',18,'F',8,4,NULL,'2012-04-06 10:00:00'),(7,'ZhangWuji',20,'M',1,7,NULL,'2012-04-06 10:00:00'),(8,'Xuzhu',26,'M',2,4,NULL,'2012-04-06 10:00:00'),(9,'LingHuchong',22,'M',11,NULL,NULL,'2012-04-06 10:00:00'),(10,'YiLin',19,'F',18,NULL,NULL,'2012-04-06 10:00:00');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutors`
--

DROP TABLE IF EXISTS `tutors`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tutors` (
  `TID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Tname` varchar(50) NOT NULL,
  `Gender` enum('F','M') DEFAULT 'M',
  `Age` tinyint(3) unsigned DEFAULT NULL,
  UNIQUE KEY `TID` (`TID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tutors`
--

LOCK TABLES `tutors` WRITE;
/*!40000 ALTER TABLE `tutors` DISABLE KEYS */;
INSERT INTO `tutors` VALUES (1,'HongQigong','M',93),(2,'HuangYaoshi','M',63),(3,'Miejueshitai','F',72),(4,'OuYangfeng','M',76),(5,'YiDeng','M',90),(6,'YuCanghai','M',56),(7,'Jinlunfawang','M',67),(8,'HuYidao','M',42),(9,'NingZhongze','F',49);
/*!40000 ALTER TABLE `tutors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-04-06  3:09:09
