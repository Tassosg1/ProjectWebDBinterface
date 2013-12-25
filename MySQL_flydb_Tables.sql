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
INSERT INTO `bookings` VALUES (3,'Tassosg_1',100);
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
  `country_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('Afghanistan',1),('Albania',2),('Algeria',3),('American Samoa',4),('Andorra',5),('Angola',6),('Anguilla',7),('Antarctica',8),('Antigua and Barbuda',9),('Argentina',10),('Armenia',11),('Aruba',13),('Australia',14),('Austria',15),('Azerbaijan',16),('Bahamas',18),('Bahrain',19),('Bangladesh',20),('Barbados',21),('Belarus',22),('Belgium',23),('Belize',24),('Benin',25),('Bermuda',26),('Bhutan',27),('Bolivia',28),('Bosnia and Herzegovina',29),('Botswana',30),('Bouvet Island',31),('Brazil',32),('Brunei Darussalam',34),('Bulgaria',35),('Burkina Faso',36),('Burundi',37),('Cambodia',38),('Cameroon',39),('Canada',40),('Cape Verde',41),('Cayman Islands',42),('Central African Republic',43),('Chad',44),('Chile',45),('China',46),('Christmas Island',47),('Cocos (Keeling) Islands',48),('Colombia',49),('Comoros',50),('Congo',51),('Cook Islands',53),('Costa Rica',54),('Cote D\'ivoire',55),('Croatia',56),('Cuba',57),('Cyprus',58),('Czech Republic',60),('Denmark',61),('Djibouti',62),('Dominica',63),('Dominican Republic',64),('Easter Island',65),('Ecuador',66),('Egypt',67),('El Salvador',68),('Equatorial Guinea',69),('Eritrea',70),('Estonia',71),('Ethiopia',72),('Faroe Islands',74),('Fiji',75),('Finland',76),('France',77),('French Guiana',78),('French Polynesia',79),('Gabon',81),('Gambia',82),('Georgia',83),('Germany',85),('Ghana',86),('Gibraltar',87),('Greece',88),('Greenland',89),('Grenada',91),('Guadeloupe',92),('Guam',93),('Guatemala',94),('Guinea',95),('Guinea-bissau',96),('Guyana',97),('Haiti',98),('Honduras',100),('Hong Kong',101),('Hungary',102),('Iceland',103),('India',104),('Indonesia',105),('Iran',107),('Iraq',108),('Ireland',109),('Israel',110),('Italy',111),('Jamaica',112),('Japan',113),('Jordan',114),('Kazakhstan',115),('Kenya',117),('Kiribati',118),('Korea, North',119),('Korea, South',120),('Kosovo',121),('Kuwait',122),('Kyrgyzstan',123),('Laos',124),('Latvia',125),('Lebanon',126),('Lesotho',127),('Liberia',128),('Libyan Arab Jamahiriya',129),('Liechtenstein',130),('Lithuania',131),('Luxembourg',132),('Macau',133),('Macedonia',134),('Madagascar',135),('Malawi',136),('Malaysia',137),('Maldives',138),('Mali',139),('Malta',140),('Marshall Islands',141),('Martinique',142),('Mauritania',143),('Mauritius',144),('Mayotte',145),('Mexico',146),('Moldova, Republic of',148),('Monaco',149),('Mongolia',150),('Montenegro',151),('Montserrat',152),('Morocco',153),('Mozambique',154),('Myanmar',155),('Namibia',156),('Nauru',157),('Nepal',158),('Netherlands',159),('Netherlands Antilles',160),('New Caledonia',161),('New Zealand',162),('Nicaragua',163),('Niger',164),('Nigeria',165),('Niue',166),('Norfolk Island',167),('Northern Mariana Islands',168),('Norway',169),('Oman',170),('Pakistan',171),('Palau',172),('Palestinian Territory',173),('Panama',174),('Papua New Guinea',175),('Paraguay',176),('Peru',177),('Philippines',178),('Pitcairn',179),('Poland',180),('Portugal',181),('Puerto Rico',182),('Qatar',183),('Reunion',184),('Romania',185),('Russia',186),('Rwanda',188),('Saint Helena',189),('Saint Kitts and Nevis',190),('Saint Lucia',191),('Samoa',194),('San Marino',195),('Sao Tome and Principe',196),('Saudi Arabia',197),('Senegal',198),('Serbia and Montenegro',199),('Seychelles',200),('Sierra Leone',201),('Singapore',202),('Slovakia',203),('Slovenia',204),('Solomon Islands',205),('Somalia',206),('South Africa',207),('Spain',209),('Sri Lanka',210),('Sudan',211),('Suriname',212),('Svalbard and Jan Mayen',213),('Swaziland',214),('Sweden',215),('Switzerland',216),('Syria',217),('Taiwan',218),('Tajikistan',219),('Thailand',221),('Timor-leste',222),('Togo',223),('Tokelau',224),('Tonga',225),('Trinidad and Tobago',226),('Tunisia',227),('Turkey',228),('Turkmenistan',230),('Tuvalu',232),('Uganda',233),('Ukraine',234),('United Arab Emirates',235),('United Kingdom',236),('United States',237),('Uruguay',239),('Uzbekistan',240),('Vanuatu',241),('Vatican City',242),('Venezuela',243),('Vietnam',244),('Virgin Islands, British',245),('Virgin Islands, U.S.',246),('Wallis and Futuna',247),('Western Sahara',248),('Yemen',249),('Zambia',251),('Zimbabwe',252);
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
  `datetime` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,'Eleftherios Venizelos','Istanbul','2013-12-25 21:00:00',6,100,1200),(2,'Eleftherios Venizelos','Vienna','2013-12-25 22:00:00',5,100,1200),(3,'Eleftherios Venizelos','Amsterdam','2013-12-25 22:30:00',5,100,1200),(4,'Eleftherios Venizelos','Barcelona','2013-12-25 23:30:00',1,100,1200),(5,'Eleftherios Venizelos','Paris','2013-12-25 12:30:00',3,100,1600),(6,'Eleftherios Venizelos','Thessaloniki','2013-12-25 14:45:00',1,100,100),(7,'Thessaloniki','Eleftherios Venizelos','2013-12-25 16:45:00',1,100,150),(8,'Thessaloniki','Paris','2013-12-25 17:45:00',3,100,150),(9,'Thessaloniki','Berlin','2013-12-26 17:45:00',4,100,150),(10,'Thessaloniki','Amsterdam','2013-12-26 17:00:00',5,100,1150),(11,'Eleftherios Venizelos','Vienna','2013-12-27 22:00:00',5,100,1200),(12,'Eleftherios Venizelos','Vienna','2013-12-25 13:00:00',1,100,1200);
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
INSERT INTO `flightcom` VALUES (1,'Olympic Air','Greece',2101234567),(2,'Alitalia','Italy',2107654321),(3,'Paris International','France',2106754321),(4,'Berlin International','Germany',2106723321),(5,'Etheria Travels','United Kingdom',2112723321),(6,'SpyroTravels','Turkey',411272331);
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
INSERT INTO `port` VALUES ('Vienna','Austria'),('Brussels','Belgium'),('Zagreb','Croatia'),('Paris','France'),('Berlin','Germany'),('Eleftherios Venizelos','Greece'),('Heraklion','Greece'),('Rhodes','Greece'),('Thessaloniki','Greece'),('Dublin','Ireland'),('Riga','Latvia'),('Amsterdam','Netherlands'),('Oslo','Norway'),('Lisbon','Portugal'),('Barcelona','Spain'),('Istanbul','Turkey'),('London','United Kingdom'),('Florida','United States');
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
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Tassosg_1','2513','Anastasios',2109628424,NULL,NULL);
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

-- Dump completed on 2013-12-25  3:33:09
