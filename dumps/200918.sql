-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: pictcsi
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `ENTRY_FOR_EVENT`
--

DROP TABLE IF EXISTS `ENTRY_FOR_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `ENTRY_FOR_EVENT` (`ID`, `USER_ID`, `EVENT_ID`, `CREATED_DATE`, `REGISTERED_EVENT`, `ALLOCATED_SEATS`) VALUES (1001,1001,1001,'2018-08-29 16:14:09','Enthusia',91),(1002,1002,1002,'2018-08-29 16:15:54','Blockchain Workshop',180),(1003,1003,1003,'2018-08-29 16:16:19','C Session',45),(1004,1004,1004,'2018-08-29 16:16:50','Android Workshop',144),(1005,1005,1005,'2018-08-29 16:17:26','Python Workshop',172);
/*!40000 ALTER TABLE `ENTRY_FOR_EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT`
--

DROP TABLE IF EXISTS `EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `EVENT` (`ID`, `EVENT_NAME`, `CREATED_DATE`, `AVAILABLE_COUNT`) VALUES (1001,'Enthusia','2018-08-29 16:09:35',100),(1002,'Blockchain Workshop','2018-08-29 16:11:32',200),(1003,'C Session','2018-08-29 16:11:52',50),(1004,'Android Workshop','2018-08-29 16:12:12',150),(1005,'Python Workshop','2018-08-29 16:12:32',180);
/*!40000 ALTER TABLE `EVENT` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_event_added
  AFTER INSERT ON EVENT
  FOR EACH ROW
  BEGIN
    INSERT INTO NEWS_FEED VALUES(NULL,new.EVENT_NAME,"UPCOMING EVENT",new.CREATED_DATE,new.CREATED_DATE);

  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `NEWS_FEED`
--

DROP TABLE IF EXISTS `NEWS_FEED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NEWS_FEED` (
  `N_ID` int(5) NOT NULL AUTO_INCREMENT,
  `N_TITLE` varchar(32) NOT NULL,
  `N_DESCIPRTION` varchar(200) NOT NULL,
  `N_START_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `N_END_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `N_ID` (`N_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NEWS_FEED`
--

LOCK TABLES `NEWS_FEED` WRITE;
/*!40000 ALTER TABLE `NEWS_FEED` DISABLE KEYS */;
INSERT INTO `NEWS_FEED` (`N_ID`, `N_TITLE`, `N_DESCIPRTION`, `N_START_DATE`, `N_END_DATE`) VALUES (1,'CSI WEBINAR','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sit amet massa non ipsum viverra pharetra. Nunc eu volutpat eros.','2018-08-29 10:39:35','2018-09-17 12:25:40'),(2,'BLOCKCHAIN SIG','Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Nunc eu volutpat eros.','2018-03-12 10:39:35','2018-09-17 12:29:48'),(3,'ANDROID WORKSHOP SESSION 2','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sit amet massa non ipsum viverra pharetra.','2018-06-10 10:39:35','2018-07-01 10:39:35'),(4,'GITHUB WORKSHOP','Aliquam sit amet massa non ipsum viverra pharetra. Nunc eu volutpat eros.','2018-08-01 10:39:35','2018-09-17 12:30:15'),(5,'DevOps','Aliquam sit amet massa non ipsum viverra pharetra. Nunc eu volutpat eros.','2018-02-26 10:39:35','2018-08-01 10:39:35');
/*!40000 ALTER TABLE `NEWS_FEED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `STATS`
--

DROP TABLE IF EXISTS `STATS`;
/*!50001 DROP VIEW IF EXISTS `STATS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `STATS` AS SELECT 
 1 AS `type`,
 1 AS `count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `WEB_USER`
--

DROP TABLE IF EXISTS `WEB_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1019 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_USER`
--

LOCK TABLES `WEB_USER` WRITE;
/*!40000 ALTER TABLE `WEB_USER` DISABLE KEYS */;
INSERT INTO `WEB_USER` (`ID`, `USER_NAME`, `CITY`, `STATE`, `COUNTRY`, `EMAIL`, `MOBILE`, user_password) VALUES (1001,'onkar15','Pune','Maharashtra','India','onkarbhujbal95@gmail.com','8446320691',NULL),(1002,'chaitanya07','Pune','Maharashtra','India','bchaitanya@gmail.com','9552586390',NULL),(1003,'snehal16','Ahmadnagar','Maharashtra','India','snehalchaudhari@gmail.com','9881035311',NULL),(1004,'sakshi08','Aurangabad','Maharashtra','India','sakshibihani@gmail.com','9420378369',NULL),(1005,'sanved18','Aurangabad','Maharashtra','India','sanved007@gmail.com','9011011060',NULL),(1016,'bchaitanya15@gmail.com','','','','bchaitanya15@gmail.com','9552565839','chaitanya'),(1018,'abc@gmail.com','','','','abc@gmail.com','8888888888','123');
/*!40000 ALTER TABLE `WEB_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `STATS`
--

/*!50001 DROP VIEW IF EXISTS `STATS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `STATS` AS select 'user_count' AS `type`,count(0) AS `count` from `WEB_USER` union select 'event_count' AS `type`,count(0) AS `count` from `EVENT` union select 'entries_count' AS `type`,count(0) AS `count` from `ENTRY_FOR_EVENT` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-20  0:47:21
