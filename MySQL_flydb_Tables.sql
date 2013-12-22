CREATE DATABASE  IF NOT EXISTS `flydb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `flydb`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: flydb
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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` int(5) NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `seat` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`username`,`seat`),
  KEY `username` (`username`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`id`) REFERENCES `flight` (`id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carcom`
--

DROP TABLE IF EXISTS `carcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carcom` (
  `vat` int(9) NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL,
  `country` varchar(30) NOT NULL,
  `telephone` int(14) NOT NULL,
  PRIMARY KEY (`vat`),
  KEY `country` (`country`),
  CONSTRAINT `carcom_ibfk_1` FOREIGN KEY (`country`) REFERENCES `country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carcom`
--

LOCK TABLES `carcom` WRITE;
/*!40000 ALTER TABLE `carcom` DISABLE KEYS */;
/*!40000 ALTER TABLE `carcom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `from_port` varchar(30) DEFAULT NULL,
  `to_port` varchar(30) DEFAULT NULL,
  `datetime` date DEFAULT NULL,
  `vat` int(9) DEFAULT NULL,
  `seats` int(4) DEFAULT NULL,
  `cost` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_port` (`from_port`),
  KEY `to_port` (`to_port`),
  KEY `vat` (`vat`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`from_port`) REFERENCES `port` (`airport`),
  CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`to_port`) REFERENCES `port` (`airport`),
  CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`vat`) REFERENCES `flightcom` (`vat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightcom`
--

DROP TABLE IF EXISTS `flightcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightcom` (
  `vat` int(9) NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL,
  `country` varchar(30) NOT NULL,
  `telephone` int(14) NOT NULL,
  PRIMARY KEY (`vat`),
  KEY `country` (`country`),
  CONSTRAINT `flightcom_ibfk_1` FOREIGN KEY (`country`) REFERENCES `country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightcom`
--

LOCK TABLES `flightcom` WRITE;
/*!40000 ALTER TABLE `flightcom` DISABLE KEYS */;
/*!40000 ALTER TABLE `flightcom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port`
--

DROP TABLE IF EXISTS `port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `port` (
  `airport` varchar(30) NOT NULL DEFAULT '',
  `country` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`airport`,`country`),
  KEY `country` (`country`),
  CONSTRAINT `port_ibfk_1` FOREIGN KEY (`country`) REFERENCES `country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
/*!40000 ALTER TABLE `port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentacar`
--

DROP TABLE IF EXISTS `rentacar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentacar` (
  `airport` varchar(30) NOT NULL DEFAULT '',
  `vat` int(9) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `cost` int(4) DEFAULT NULL,
  PRIMARY KEY (`airport`),
  KEY `vat` (`vat`),
  CONSTRAINT `rentacar_ibfk_1` FOREIGN KEY (`airport`) REFERENCES `port` (`airport`),
  CONSTRAINT `rentacar_ibfk_2` FOREIGN KEY (`vat`) REFERENCES `carcom` (`vat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentacar`
--

LOCK TABLES `rentacar` WRITE;
/*!40000 ALTER TABLE `rentacar` DISABLE KEYS */;
/*!40000 ALTER TABLE `rentacar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentaroom`
--

DROP TABLE IF EXISTS `rentaroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentaroom` (
  `airport` varchar(30) NOT NULL DEFAULT '',
  `vat` int(9) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `cost` int(4) DEFAULT NULL,
  PRIMARY KEY (`airport`),
  KEY `vat` (`vat`),
  CONSTRAINT `rentaroom_ibfk_1` FOREIGN KEY (`airport`) REFERENCES `port` (`airport`),
  CONSTRAINT `rentaroom_ibfk_2` FOREIGN KEY (`vat`) REFERENCES `roomcom` (`vat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentaroom`
--

LOCK TABLES `rentaroom` WRITE;
/*!40000 ALTER TABLE `rentaroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `rentaroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomcom`
--

DROP TABLE IF EXISTS `roomcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomcom` (
  `vat` int(9) NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL,
  `country` varchar(30) NOT NULL,
  `telephone` int(14) NOT NULL,
  PRIMARY KEY (`vat`),
  KEY `country` (`country`),
  CONSTRAINT `roomcom_ibfk_1` FOREIGN KEY (`country`) REFERENCES `country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomcom`
--

LOCK TABLES `roomcom` WRITE;
/*!40000 ALTER TABLE `roomcom` DISABLE KEYS */;
/*!40000 ALTER TABLE `roomcom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(16) NOT NULL,
  `name` varchar(40) NOT NULL,
  `telephone` int(30) DEFAULT NULL,
  `ccnum` int(16) DEFAULT NULL,
  `ccver` int(3) DEFAULT NULL,
  `ccaddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'flydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-22  2:22:33
