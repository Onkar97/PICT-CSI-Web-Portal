-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: pictcsi
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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
-- Table structure for table `NEWS_FEED`
--

DELIMITER //
CREATE TRIGGER after_event_added
  AFTER INSERT ON EVENT
  FOR EACH ROW
  BEGIN
    INSERT INTO NEWS_FEED VALUES(NULL,new.EVENT_NAME,"UPCOMING EVENT",new.CREATED_DATE,new.CREATED_DATE);
  END//

DELIMITER ;

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
INSERT INTO `NEWS_FEED` VALUES (1,'CSI WEBINAR','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sit amet massa non ipsum viverra pharetra. Nunc eu volutpat eros.','2018-08-29 10:39:35','2018-09-17 12:25:40'),(2,'BLOCKCHAIN SIG','Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Nunc eu volutpat eros.','2018-03-12 10:39:35','2018-09-17 12:29:48'),(3,'ANDROID WORKSHOP SESSION 2','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sit amet massa non ipsum viverra pharetra.','2018-06-10 10:39:35','2018-07-01 10:39:35'),(4,'GITHUB WORKSHOP','Aliquam sit amet massa non ipsum viverra pharetra. Nunc eu volutpat eros.','2018-08-01 10:39:35','2018-09-17 12:30:15'),(5,'DevOps','Aliquam sit amet massa non ipsum viverra pharetra. Nunc eu volutpat eros.','2018-02-26 10:39:35','2018-08-01 10:39:35');
/*!40000 ALTER TABLE `NEWS_FEED` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-18 16:35:16
