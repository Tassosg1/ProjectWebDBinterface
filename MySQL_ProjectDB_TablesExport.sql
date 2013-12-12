CREATE DATABASE  IF NOT EXISTS `projectdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `projectdb`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: projectdb
-- ------------------------------------------------------
-- Server version	5.5.31

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `albumid` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `afmprod` int(9) DEFAULT NULL,
  PRIMARY KEY (`albumid`),
  KEY `afmprod` (`afmprod`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`afmprod`) REFERENCES `musician` (`afm`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Our Darkness LP','1984-10-12',123456789),(2,'Mob Rules','1981-11-04',987654321),(4,'Ritchie Blackmore_s Rainbow','1975-08-04',987612345),(72,'Back In Black','2013-06-12',123498765),(73,'Let There Be Rock','2013-06-12',123498765);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger del_mus_alb before delete on album for each row
delete from songs where albumid=old.albumid */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genre` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES ('Acappella'),('Alternative'),('Ballad'),('Blues'),('Chillout'),('Classical'),('Country'),('Dance-Pop '),('Dubstep'),('Electro'),('Greek'),('Hard Rock'),('Hip Hop'),('House'),('Latin'),('Metal (Heavy)'),('New Wave'),('Opera'),('Parody'),('Piano'),('Psychedelic'),('Punk'),('Reggae'),('Rock'),('Rockabilly'),('Soft Rock'),('Soul'),('Soundtrack');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musician`
--

DROP TABLE IF EXISTS `musician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `musician` (
  `afm` int(9) NOT NULL DEFAULT '0',
  `surname` varchar(15) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `road` varchar(15) DEFAULT NULL,
  `addno` int(3) DEFAULT NULL,
  `tcode` int(5) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`afm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musician`
--

LOCK TABLES `musician` WRITE;
/*!40000 ALTER TABLE `musician` DISABLE KEYS */;
INSERT INTO `musician` VALUES (0,'TestName','TestSurname','TestRoad',0,0,'0'),(123456789,'Clark','Anne','Melbourne St.',3,55436,'0'),(123498765,'Young','Angus','Sydney',45,68975,'0'),(987612345,'Blackmore','Ritchie','Rainbow St.',12,12124,'0'),(987654321,'Dio','Ronnie James','Hellroad',6,66126,'0');
/*!40000 ALTER TABLE `musician` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger del_mus before delete on musician for each row
delete from album where album.afmprod=old.afm */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `organs`
--

DROP TABLE IF EXISTS `organs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organs` (
  `orgid` int(3) NOT NULL DEFAULT '0',
  `orgname` varchar(20) DEFAULT NULL,
  `muskey` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`orgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organs`
--

LOCK TABLES `organs` WRITE;
/*!40000 ALTER TABLE `organs` DISABLE KEYS */;
INSERT INTO `organs` VALUES (0,'Producer',NULL),(1,'Lyrics',NULL),(101,'Electric Guitar',NULL),(102,'Acoustic Guitar',NULL),(103,'Balalaika',NULL),(104,'Banjo',NULL),(105,'Bass',NULL),(106,'Mandolin',NULL),(107,'Violin',NULL),(108,'Bouzouki',NULL),(200,'Piano',NULL),(201,'Synth',NULL),(300,'Drums',NULL),(301,'Xylophone',NULL),(800,'Harmonica',NULL),(801,'Bagpipe',NULL),(802,'Clarinet',NULL),(803,'Flute',NULL),(804,'Ocarina',NULL),(805,'Saxophone',NULL),(806,'Trobone',NULL),(807,'Trumpet',NULL),(808,'Tuba',NULL),(900,'Lead Vocals',NULL),(901,'Scream Vocals',NULL);
/*!40000 ALTER TABLE `organs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_mus_org`
--

DROP TABLE IF EXISTS `song_mus_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song_mus_org` (
  `songid` int(5) NOT NULL DEFAULT '0',
  `afm` varchar(20) NOT NULL DEFAULT '0',
  `orgid` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`songid`,`afm`,`orgid`),
  KEY `afm` (`afm`),
  KEY `orgid` (`orgid`),
  CONSTRAINT `song_mus_org_ibfk_1` FOREIGN KEY (`songid`) REFERENCES `songs` (`songid`),
  CONSTRAINT `song_mus_org_ibfk_3` FOREIGN KEY (`orgid`) REFERENCES `organs` (`orgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_mus_org`
--

LOCK TABLES `song_mus_org` WRITE;
/*!40000 ALTER TABLE `song_mus_org` DISABLE KEYS */;
INSERT INTO `song_mus_org` VALUES (1,'Ronnie James Dio',0),(201,'Ronnie James Dio',0),(301,'Anne Clark',0),(412,'Anne Clark',0),(413,'Anne Clark',0),(422,'Angus Young',0),(423,'Angus Young',0),(427,'Angus Young',0),(422,'Bon Scott',1),(423,'Bon Scott',1),(1,'Ritchie Blackmore',102),(422,'Cliff Williams',105),(301,'Anne Clark',201),(422,'Phil Rudd',300),(1,'Ronnie James Dio',900),(201,'Ronnie James Dio',900),(301,'Anne Clark',900),(422,'Brian Johnson',900);
/*!40000 ALTER TABLE `song_mus_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `songid` int(5) NOT NULL AUTO_INCREMENT,
  `albumid` int(3) DEFAULT NULL,
  `title` varchar(40) DEFAULT NULL,
  `genre` varchar(15) DEFAULT NULL,
  `media` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`songid`),
  KEY `albumid` (`albumid`),
  KEY `genre` (`genre`),
  CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`albumid`) REFERENCES `album` (`albumid`),
  CONSTRAINT `songs_ibfk_2` FOREIGN KEY (`genre`) REFERENCES `genres` (`genre`)
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,4,'Catch The Rainbow','Rock','p3VgV31vmUE'),(201,2,'Falling Off the Edge of the World','Rock','WnFKLHXXj-A'),(301,1,'Our Darkness','Electro','4NOJeQlojak'),(412,1,'Poem Without Words','Piano','oHg5SJYRHA0'),(422,72,'You Shook Me All Night Long','Hard Rock','zakKvbIQ28o'),(423,72,'Hells Bells','Hard Rock','EUH38z4KniY'),(427,73,'Let There Be Rock','Hard Rock','98I85ceICRM');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger ins_song AFTER INSERT ON songs FOR EACH ROW insert into song_mus_org values (NEW.songid,(SELECT CONCAT(name, ' ', surname) from musician WHERE afm IN(SELECT afmprod from album where album.albumid=NEW.albumid)),0) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger del_mus_alb_song before delete on songs for each row
delete from song_mus_org where songid=old.songid */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'projectdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-13  1:26:47
