# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Värd: localhost (MySQL 5.7.10)
# Databas: AirlineBookingSystem
# Genereringstid: 2016-03-11 12:47:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Tabelldump Airports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Airports`;

CREATE TABLE `Airports` (
  `airportid` varchar(3) NOT NULL DEFAULT '',
  `airportcity` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`airportid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Airports` WRITE;
/*!40000 ALTER TABLE `Airports` DISABLE KEYS */;

INSERT INTO `Airports` (`airportid`, `airportcity`)
VALUES
	('ARN','Stockholm'),
	('CPH','Kopenhamn'),
	('DBX','Dubai'),
	('HKG','Hong Kong'),
	('HND','Tokyo'),
	('KUL','Kuala Lumpur'),
	('PEK','Beijing'),
	('SIN','Singapore');

/*!40000 ALTER TABLE `Airports` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump Bookings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Bookings`;

CREATE TABLE `Bookings` (
  `flight` char(6) NOT NULL DEFAULT '',
  `passenger` varchar(11) NOT NULL DEFAULT '',
  `user` varchar(11) DEFAULT NULL,
  `status` varchar(11) DEFAULT NULL,
  `date` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`flight`,`passenger`,`date`),
  CONSTRAINT `Flight number` FOREIGN KEY (`flight`) REFERENCES `Flights` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;

INSERT INTO `Bookings` (`flight`, `passenger`, `user`, `status`, `date`)
VALUES
	('AX0114','123','Adam','confirmed','2016-03-13'),
	('AX0142','123','Adam','confirmed','2016-03-12');

/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `decrease_free_seats` BEFORE INSERT ON `Bookings` FOR EACH ROW BEGIN
	UPDATE Flights 
	SET freeseats = freeseats - 1
	WHERE date = NEW.`date`
	AND id = NEW.`flight`;
END */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `increase_free_seats` AFTER DELETE ON `Bookings` FOR EACH ROW BEGIN
	UPDATE Flights 
	SET freeseats = freeseats + 1
	WHERE date = OLD.`date`
	AND id = OLD.`flight`;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Tabelldump Flights
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Flights`;

CREATE TABLE `Flights` (
  `id` char(6) NOT NULL DEFAULT '',
  `date` varchar(11) NOT NULL DEFAULT '',
  `departuretime` varchar(11) NOT NULL DEFAULT '',
  `duration` varchar(11) DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `freeseats` int(11) NOT NULL,
  `origin` varchar(3) NOT NULL DEFAULT '',
  `destination` varchar(3) NOT NULL DEFAULT '',
  `price` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`date`),
  KEY `departures from` (`origin`),
  KEY `arrives at` (`destination`),
  CONSTRAINT `arrives at` FOREIGN KEY (`destination`) REFERENCES `Airports` (`airportid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `departures from` FOREIGN KEY (`origin`) REFERENCES `Airports` (`airportid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Flights` WRITE;
/*!40000 ALTER TABLE `Flights` DISABLE KEYS */;

INSERT INTO `Flights` (`id`, `date`, `departuretime`, `duration`, `capacity`, `freeseats`, `origin`, `destination`, `price`)
VALUES
	('AX0001','2016-03-11','10:00','2h10min',200,5,'PEK','DBX','1000'),
	('AX0002','2016-03-11','16:00','2h10min',200,5,'PEK','DBX','1000'),
	('AX0003','2016-03-12','10:00','2h10min',200,5,'PEK','DBX','1000'),
	('AX0004','2016-03-12','16:00','2h10min',200,5,'PEK','DBX','1000'),
	('AX0005','2016-03-13','10:00','2h10min',200,5,'PEK','DBX','1000'),
	('AX0006','2016-03-13','16:00','2h10min',200,5,'PEK','DBX','1000'),
	('AX0007','2016-03-11','10:00','2h10min',200,5,'PEK','HND','1000'),
	('AX0008','2016-03-11','16:00','2h10min',200,5,'PEK','HND','1000'),
	('AX0009','2016-03-12','10:00','2h10min',200,5,'PEK','HND','1000'),
	('AX0010','2016-03-12','16:00','2h10min',200,5,'PEK','HND','1000'),
	('AX0011','2016-03-13','10:00','2h10min',200,5,'PEK','HND','1000'),
	('AX0012','2016-03-13','16:00','2h10min',200,5,'PEK','HND','1000'),
	('AX0013','2016-03-11','10:00','2h10min',200,5,'PEK','HKG','1000'),
	('AX0014','2016-03-11','16:00','2h10min',200,5,'PEK','HKG','1000'),
	('AX0015','2016-03-12','10:00','2h10min',200,5,'PEK','HKG','1000'),
	('AX0016','2016-03-12','16:00','2h10min',200,5,'PEK','HKG','1000'),
	('AX0017','2016-03-13','10:00','2h10min',200,5,'PEK','HKG','1000'),
	('AX0018','2016-03-13','16:00','2h10min',200,5,'PEK','HKG','1000'),
	('AX0019','2016-03-11','10:00','2h10min',200,5,'PEK','SIN','1000'),
	('AX0020','2016-03-11','16:00','2h10min',200,5,'PEK','SIN','1000'),
	('AX0021','2016-03-12','10:00','2h10min',200,5,'PEK','SIN','1000'),
	('AX0022','2016-03-12','16:00','2h10min',200,5,'PEK','SIN','1000'),
	('AX0023','2016-03-13','10:00','2h10min',200,5,'PEK','SIN','1000'),
	('AX0024','2016-03-13','16:00','2h10min',200,5,'PEK','SIN','1000'),
	('AX0025','2016-03-11','10:00','2h10min',200,5,'PEK','KUL','1000'),
	('AX0026','2016-03-11','16:00','2h10min',200,5,'PEK','KUL','1000'),
	('AX0027','2016-03-12','10:00','2h10min',200,5,'PEK','KUL','1000'),
	('AX0028','2016-03-12','16:00','2h10min',200,5,'PEK','KUL','1000'),
	('AX0029','2016-03-13','10:00','2h10min',200,5,'PEK','KUL','1000'),
	('AX0030','2016-03-13','16:00','2h10min',200,5,'PEK','KUL','1000'),
	('AX0031','2016-03-11','10:00','2h10min',200,5,'DBX','PEK','1000'),
	('AX0032','2016-03-11','16:00','2h10min',200,5,'DBX','PEK','1000'),
	('AX0033','2016-03-12','10:00','2h10min',200,5,'DBX','PEK','1000'),
	('AX0034','2016-03-12','16:00','2h10min',200,5,'DBX','PEK','1000'),
	('AX0035','2016-03-13','10:00','2h10min',200,5,'DBX','PEK','1000'),
	('AX0036','2016-03-13','16:00','2h10min',200,5,'DBX','PEK','1000'),
	('AX0037','2016-03-11','10:00','2h10min',200,5,'DBX','HND','1000'),
	('AX0038','2016-03-11','16:00','2h10min',200,5,'DBX','HND','1000'),
	('AX0039','2016-03-12','10:00','2h10min',200,5,'DBX','HND','1000'),
	('AX0040','2016-03-12','16:00','2h10min',200,5,'DBX','HND','1000'),
	('AX0041','2016-03-13','10:00','2h10min',200,5,'DBX','HND','1000'),
	('AX0042','2016-03-13','16:00','2h10min',200,5,'DBX','HND','1000'),
	('AX0043','2016-03-11','10:00','2h10min',200,5,'DBX','HKG','1000'),
	('AX0044','2016-03-11','16:00','2h10min',200,5,'DBX','HKG','1000'),
	('AX0045','2016-03-12','10:00','2h10min',200,5,'DBX','HKG','1000'),
	('AX0046','2016-03-12','16:00','2h10min',200,5,'DBX','HKG','1000'),
	('AX0047','2016-03-13','10:00','2h10min',200,5,'DBX','HKG','1000'),
	('AX0048','2016-03-13','16:00','2h10min',200,5,'DBX','HKG','1000'),
	('AX0049','2016-03-11','10:00','2h10min',200,5,'DBX','SIN','1000'),
	('AX0050','2016-03-11','16:00','2h10min',200,5,'DBX','SIN','1000'),
	('AX0051','2016-03-12','10:00','2h10min',200,5,'DBX','SIN','1000'),
	('AX0052','2016-03-12','16:00','2h10min',200,5,'DBX','SIN','1000'),
	('AX0053','2016-03-13','10:00','2h10min',200,5,'DBX','SIN','1000'),
	('AX0054','2016-03-13','16:00','2h10min',200,5,'DBX','SIN','1000'),
	('AX0055','2016-03-11','10:00','2h10min',200,5,'DBX','KUL','1000'),
	('AX0056','2016-03-11','16:00','2h10min',200,5,'DBX','KUL','1000'),
	('AX0057','2016-03-12','10:00','2h10min',200,5,'DBX','KUL','1000'),
	('AX0058','2016-03-12','16:00','2h10min',200,5,'DBX','KUL','1000'),
	('AX0059','2016-03-13','10:00','2h10min',200,5,'DBX','KUL','1000'),
	('AX0060','2016-03-13','16:00','2h10min',200,5,'DBX','KUL','2000'),
	('AX0061','2016-03-11','10:00','2h10min',200,5,'HND','PEK','1000'),
	('AX0062','2016-03-11','16:00','2h10min',200,5,'HND','PEK','1000'),
	('AX0063','2016-03-12','10:00','2h10min',200,5,'HND','PEK','1000'),
	('AX0064','2016-03-12','16:00','2h10min',200,5,'HND','PEK','1000'),
	('AX0065','2016-03-13','10:00','2h10min',200,5,'HND','PEK','1000'),
	('AX0066','2016-03-13','16:00','2h10min',200,5,'HND','PEK','1000'),
	('AX0067','2016-03-11','10:00','2h10min',200,5,'HND','DBX','1000'),
	('AX0068','2016-03-11','16:00','2h10min',200,5,'HND','DBX','1000'),
	('AX0069','2016-03-12','10:00','2h10min',200,5,'HND','DBX','1000'),
	('AX0070','2016-03-12','16:00','2h10min',200,5,'HND','DBX','1000'),
	('AX0071','2016-03-13','10:00','2h10min',200,5,'HND','DBX','1000'),
	('AX0072','2016-03-13','16:00','2h10min',200,5,'HND','DBX','1000'),
	('AX0073','2016-03-11','10:00','2h10min',200,5,'HND','HKG','1000'),
	('AX0074','2016-03-11','16:00','2h10min',200,5,'HND','HKG','1000'),
	('AX0075','2016-03-12','10:00','2h10min',200,5,'HND','HKG','1000'),
	('AX0076','2016-03-12','16:00','2h10min',200,5,'HND','HKG','1000'),
	('AX0077','2016-03-13','10:00','2h10min',200,5,'HND','HKG','1000'),
	('AX0078','2016-03-13','16:00','2h10min',200,5,'HND','HKG','1000'),
	('AX0079','2016-03-11','10:00','2h10min',200,5,'HND','SIN','1000'),
	('AX0080','2016-03-11','16:00','2h10min',200,5,'HND','SIN','1000'),
	('AX0081','2016-03-12','10:00','2h10min',200,5,'HND','SIN','1000'),
	('AX0082','2016-03-12','16:00','2h10min',200,5,'HND','SIN','1000'),
	('AX0083','2016-03-13','10:00','2h10min',200,5,'HND','SIN','1000'),
	('AX0084','2016-03-13','16:00','2h10min',200,5,'HND','SIN','1000'),
	('AX0085','2016-03-11','10:00','2h10min',200,5,'HND','KUL','1000'),
	('AX0086','2016-03-11','16:00','2h10min',200,5,'HND','KUL','1000'),
	('AX0087','2016-03-12','10:00','2h10min',200,5,'HND','KUL','1000'),
	('AX0088','2016-03-12','16:00','2h10min',200,5,'HND','KUL','1000'),
	('AX0089','2016-03-13','10:00','2h10min',200,5,'HND','KUL','1000'),
	('AX0090','2016-03-13','16:00','2h10min',200,5,'HND','KUL','1000'),
	('AX0091','2016-03-11','10:00','2h10min',200,5,'HKG','PEK','1000'),
	('AX0092','2016-03-11','16:00','2h10min',200,5,'HKG','PEK','1000'),
	('AX0093','2016-03-12','10:00','2h10min',200,5,'HKG','PEK','1000'),
	('AX0094','2016-03-12','16:00','2h10min',200,5,'HKG','PEK','1000'),
	('AX0095','2016-03-13','10:00','2h10min',200,5,'HKG','PEK','1000'),
	('AX0096','2016-03-13','16:00','2h10min',200,5,'HKG','PEK','1000'),
	('AX0097','2016-03-11','10:00','2h10min',200,5,'HKG','DBX','1000'),
	('AX0098','2016-03-11','16:00','2h10min',200,5,'HKG','DBX','1000'),
	('AX0099','2016-03-12','10:00','2h10min',200,5,'HKG','DBX','1000'),
	('AX0100','2016-03-12','16:00','2h10min',200,5,'HKG','DBX','1000'),
	('AX0101','2016-03-13','10:00','2h10min',200,5,'HKG','DBX','1000'),
	('AX0102','2016-03-13','16:00','2h10min',200,5,'HKG','DBX','1000'),
	('AX0103','2016-03-11','10:00','2h10min',200,5,'HKG','HND','1000'),
	('AX0104','2016-03-11','16:00','2h10min',200,5,'HKG','HND','1000'),
	('AX0105','2016-03-12','10:00','2h10min',200,5,'HKG','HND','1000'),
	('AX0106','2016-03-12','16:00','2h10min',200,5,'HKG','HND','1000'),
	('AX0107','2016-03-13','10:00','2h10min',200,5,'HKG','HND','1000'),
	('AX0108','2016-03-13','16:00','2h10min',200,5,'HKG','HND','1000'),
	('AX0109','2016-03-11','10:00','2h10min',200,5,'HKG','SIN','1000'),
	('AX0110','2016-03-11','16:00','2h10min',200,5,'HKG','SIN','1000'),
	('AX0111','2016-03-12','10:00','2h10min',200,5,'HKG','SIN','1000'),
	('AX0112','2016-03-12','16:00','2h10min',200,5,'HKG','SIN','1000'),
	('AX0113','2016-03-13','10:00','2h10min',200,5,'HKG','SIN','1000'),
	('AX0114','2016-03-13','16:00','2h10min',200,4,'HKG','SIN','1000'),
	('AX0115','2016-03-11','10:00','2h10min',200,5,'HKG','KUL','1000'),
	('AX0116','2016-03-11','16:00','2h10min',200,5,'HKG','KUL','1000'),
	('AX0117','2016-03-12','10:00','2h10min',200,5,'HKG','KUL','1000'),
	('AX0118','2016-03-12','16:00','2h10min',200,5,'HKG','KUL','1000'),
	('AX0119','2016-03-13','10:00','2h10min',200,5,'HKG','KUL','1000'),
	('AX0120','2016-03-13','16:00','2h10min',200,5,'HKG','KUL','1000'),
	('AX0121','2016-03-11','10:00','2h10min',200,5,'SIN','PEK','1000'),
	('AX0122','2016-03-11','16:00','2h10min',200,5,'SIN','PEK','1000'),
	('AX0123','2016-03-12','10:00','2h10min',200,5,'SIN','PEK','1000'),
	('AX0124','2016-03-12','16:00','2h10min',200,5,'SIN','PEK','1000'),
	('AX0125','2016-03-13','10:00','2h10min',200,5,'SIN','PEK','1000'),
	('AX0126','2016-03-13','16:00','2h10min',200,5,'SIN','PEK','1000'),
	('AX0127','2016-03-11','10:00','2h10min',200,5,'SIN','DBX','1000'),
	('AX0128','2016-03-11','16:00','2h10min',200,5,'SIN','DBX','1000'),
	('AX0129','2016-03-12','10:00','2h10min',200,5,'SIN','DBX','1000'),
	('AX0130','2016-03-12','16:00','2h10min',200,5,'SIN','DBX','1000'),
	('AX0131','2016-03-13','10:00','2h10min',200,5,'SIN','DBX','1000'),
	('AX0132','2016-03-13','16:00','2h10min',200,5,'SIN','DBX','1000'),
	('AX0133','2016-03-11','10:00','2h10min',200,5,'SIN','HND','1000'),
	('AX0134','2016-03-11','16:00','2h10min',200,5,'SIN','HND','1000'),
	('AX0135','2016-03-12','10:00','2h10min',200,5,'SIN','HND','1000'),
	('AX0136','2016-03-12','16:00','2h10min',200,5,'SIN','HND','1000'),
	('AX0137','2016-03-13','10:00','2h10min',200,5,'SIN','HND','1000'),
	('AX0138','2016-03-13','16:00','2h10min',200,5,'SIN','HND','1000'),
	('AX0139','2016-03-11','10:00','2h10min',200,5,'SIN','HKG','1000'),
	('AX0140','2016-03-11','16:00','2h10min',200,5,'SIN','HKG','1000'),
	('AX0141','2016-03-12','10:00','2h10min',1111,5,'SIN','HKG','1000'),
	('AX0142','2016-03-12','16:00','2h10min',200,4,'SIN','HKG','1000'),
	('AX0143','2016-03-13','10:00','2h10min',200,5,'SIN','HKG','1000'),
	('AX0144','2016-03-13','16:00','2h10min',200,5,'SIN','HKG','1000'),
	('AX0145','2016-03-11','10:00','2h10min',200,5,'SIN','KUL','1000'),
	('AX0146','2016-03-11','16:00','2h10min',200,5,'SIN','KUL','1000'),
	('AX0147','2016-03-12','10:00','2h10min',200,5,'SIN','KUL','1000'),
	('AX0148','2016-03-12','16:00','2h10min',200,5,'SIN','KUL','1000'),
	('AX0149','2016-03-13','10:00','2h10min',200,5,'SIN','KUL','1000'),
	('AX0150','2016-03-13','16:00','2h10min',200,5,'SIN','KUL','1000'),
	('AX0151','2016-03-11','10:00','2h10min',200,5,'KUL','PEK','1000'),
	('AX0152','2016-03-11','16:00','2h10min',200,5,'KUL','PEK','1000'),
	('AX0153','2016-03-12','10:00','2h10min',200,5,'KUL','PEK','1000'),
	('AX0154','2016-03-12','16:00','2h10min',200,5,'KUL','PEK','1000'),
	('AX0155','2016-03-13','10:00','2h10min',200,5,'KUL','PEK','1000'),
	('AX0156','2016-03-13','16:00','2h10min',200,5,'KUL','PEK','1000'),
	('AX0157','2016-03-11','10:00','2h10min',200,5,'KUL','DBX','1000'),
	('AX0158','2016-03-11','16:00','2h10min',200,5,'KUL','DBX','1000'),
	('AX0159','2016-03-12','10:00','2h10min',200,5,'KUL','DBX','1000'),
	('AX0160','2016-03-12','16:00','2h10min',200,5,'KUL','DBX','1000'),
	('AX0161','2016-03-13','10:00','2h10min',200,5,'KUL','DBX','1000'),
	('AX0162','2016-03-13','16:00','2h10min',200,5,'KUL','DBX','1000'),
	('AX0163','2016-03-11','10:00','2h10min',200,5,'KUL','HND','1000'),
	('AX0164','2016-03-11','16:00','2h10min',200,5,'KUL','HND','1000'),
	('AX0165','2016-03-12','10:00','2h10min',200,5,'KUL','HND','1000'),
	('AX0166','2016-03-12','16:00','2h10min',200,5,'KUL','HND','1000'),
	('AX0167','2016-03-13','10:00','2h10min',200,5,'KUL','HND','1000'),
	('AX0168','2016-03-13','16:00','2h10min',200,5,'KUL','HND','1000'),
	('AX0169','2016-03-11','10:00','2h10min',200,5,'KUL','HKG','1000'),
	('AX0170','2016-03-11','16:00','2h10min',200,5,'KUL','HKG','1000'),
	('AX0171','2016-03-12','10:00','2h10min',200,5,'KUL','HKG','1000'),
	('AX0172','2016-03-12','16:00','2h10min',200,5,'KUL','HKG','1000'),
	('AX0173','2016-03-13','10:00','2h10min',200,5,'KUL','HKG','1000'),
	('AX0174','2016-03-13','16:00','2h10min',200,5,'KUL','HKG','1000'),
	('AX0175','2016-03-11','10:00','2h10min',200,5,'KUL','SIN','1000'),
	('AX0176','2016-03-11','16:00','2h10min',200,5,'KUL','SIN','1000'),
	('AX0177','2016-03-12','10:00','2h10min',200,5,'KUL','SIN','1000'),
	('AX0178','2016-03-12','16:00','2h10min',200,5,'KUL','SIN','1000'),
	('AX0179','2016-03-13','10:00','2h10min',200,5,'KUL','SIN','1000'),
	('AX0180','2016-03-13','16:00','2h10min',200,5,'KUL','SIN','1000');

/*!40000 ALTER TABLE `Flights` ENABLE KEYS */;
UNLOCK TABLES;


# Tabelldump Passenger
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Passenger`;

CREATE TABLE `Passenger` (
  `passportnr` varchar(11) NOT NULL DEFAULT '',
  `firstname` varchar(11) NOT NULL DEFAULT '',
  `lastname` varchar(11) NOT NULL DEFAULT '',
  `passportexp` varchar(11) DEFAULT NULL,
  `passportish` varchar(11) DEFAULT NULL,
  `birth` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`passportnr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Tabelldump Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `username` varchar(11) NOT NULL,
  `password` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(40) DEFAULT NULL,
  `admin` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;

INSERT INTO `Users` (`username`, `password`, `email`, `admin`)
VALUES
	('Adam','hej123','adammyren92@gmail.com','false'),
	('admin','admin','admin@airlinebooking.com','true');

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
