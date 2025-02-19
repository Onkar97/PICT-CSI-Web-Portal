-- MySQL dump 10.13  Distrib 8.0.12, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: pictcsi
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ENTRY_FOR_EVENT`
--

DROP TABLE IF EXISTS `ENTRY_FOR_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ENTRY_FOR_EVENT` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(5) NOT NULL,
  `EVENT_ID` int(5) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `REGISTERED_EVENT` varchar(50) NOT NULL,
  `ALLOCATED_SEATS` int(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `EVENT_ID` (`EVENT_ID`),
  CONSTRAINT `ENTRY_FOR_EVENT_ibfk_2` FOREIGN KEY (`EVENT_ID`) REFERENCES `EVENT` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENTRY_FOR_EVENT`
--

LOCK TABLES `ENTRY_FOR_EVENT` WRITE;
/*!40000 ALTER TABLE `ENTRY_FOR_EVENT` DISABLE KEYS */;
INSERT INTO `ENTRY_FOR_EVENT` VALUES (1001,1001,1001,'2018-08-29 16:14:09','Enthusia',91),(1002,1002,1002,'2018-08-29 16:15:54','Blockchain Workshop',180),(1003,1003,1003,'2018-08-29 16:16:19','C Session',45),(1004,1004,1004,'2018-08-29 16:16:50','Android Workshop',144),(1005,1005,1005,'2018-08-29 16:17:26','Python Workshop',172);
/*!40000 ALTER TABLE `ENTRY_FOR_EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT`
--

DROP TABLE IF EXISTS `EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EVENT` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AVAILABLE_COUNT` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT`
--

LOCK TABLES `EVENT` WRITE;
/*!40000 ALTER TABLE `EVENT` DISABLE KEYS */;
INSERT INTO `EVENT` VALUES (1001,'Enthusia','2018-08-29 16:09:35',100),(1002,'Blockchain Workshop','2018-08-29 16:11:32',200),(1003,'C Session','2018-08-29 16:11:52',50),(1004,'Android Workshop','2018-08-29 16:12:12',150),(1005,'Python Workshop','2018-08-29 16:12:32',180);
/*!40000 ALTER TABLE `EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_USER`
--

DROP TABLE IF EXISTS `WEB_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WEB_USER` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(50) NOT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `STATE` varchar(20) DEFAULT NULL,
  `COUNTRY` varchar(20) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `MOBILE` varchar(20) NOT NULL,
  `PASSWORD` varchar(40) DEFAULT 'a',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  UNIQUE KEY `MOBILE` (`MOBILE`),
  UNIQUE KEY `USER_NAME` (`USER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_USER`
--

LOCK TABLES `WEB_USER` WRITE;
/*!40000 ALTER TABLE `WEB_USER` DISABLE KEYS */;
INSERT INTO `WEB_USER` VALUES (1001,'onkar15','Pune','Maharashtra','India','onkarbhujbal95@gmail.com','8446320691',NULL),(1002,'chaitanya07','Pune','Maharashtra','India','bchaitanya@gmail.com','9552586390',NULL),(1003,'snehal16','Ahmadnagar','Maharashtra','India','snehalchaudhari@gmail.com','9881035311',NULL),(1004,'sakshi08','Aurangabad','Maharashtra','India','sakshibihani@gmail.com','9420378369',NULL),(1005,'sanved18','Aurangabad','Maharashtra','India','sanved007@gmail.com','9011011060',NULL),(1014,'bchaitanya15@gmail.com','','','','bchaitanya15@gmail.com','9552565839','chaitanya');
/*!40000 ALTER TABLE `WEB_USER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-05 18:36:37
