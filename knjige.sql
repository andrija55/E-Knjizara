/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.21-MariaDB : Database - knjige
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`knjige` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `knjige`;

/*Table structure for table `administrator` */

DROP TABLE IF EXISTS `administrator`;

CREATE TABLE `administrator` (
  `AdminID` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `administrator` */

insert  into `administrator`(`AdminID`,`Username`,`Password`) values 
(1,'luka','luka123');

/*Table structure for table `knjiga` */

DROP TABLE IF EXISTS `knjiga`;

CREATE TABLE `knjiga` (
  `KnjigaID` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `Naslov` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Pisac` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Cena` double(50,2) unsigned NOT NULL,
  `Stanje` int(50) unsigned NOT NULL,
  PRIMARY KEY (`KnjigaID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `knjiga` */

insert  into `knjiga`(`KnjigaID`,`Naslov`,`Pisac`,`Cena`,`Stanje`) values 
(1,'Knjiga 1','Pisac 1',150.00,40),
(2,'Knjiga 2','Pisac 1',150.00,135),
(3,'Romeo i Julija','Sekspir',350.00,150),
(4,'Titanik','James Cameron',700.00,150);

/*Table structure for table `kupac` */

DROP TABLE IF EXISTS `kupac`;

CREATE TABLE `kupac` (
  `KupacID` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `Ime` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Prezime` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Adresa` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Poeni` int(50) unsigned NOT NULL,
  `MestoID` int(50) unsigned NOT NULL,
  PRIMARY KEY (`KupacID`),
  KEY `FK_MESTO` (`MestoID`),
  CONSTRAINT `FK_MESTO` FOREIGN KEY (`MestoID`) REFERENCES `mesto` (`MestoID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `kupac` */

insert  into `kupac`(`KupacID`,`Ime`,`Prezime`,`Adresa`,`Poeni`,`MestoID`) values 
(1,'Luka','Kovacevic','Djure Djakovica 32',250,2),
(2,'Ivan','Ivanovic','Ljubice Stanisavljevic 15',10,3),
(3,'Ivica','Jovic','Djure Djakovica 31',10,2);

/*Table structure for table `mesto` */

DROP TABLE IF EXISTS `mesto`;

CREATE TABLE `mesto` (
  `MestoID` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `PTT` int(50) unsigned NOT NULL,
  `Naziv` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MestoID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mesto` */

insert  into `mesto`(`MestoID`,`PTT`,`Naziv`) values 
(1,11000,'Mesto 1'),
(2,22000,'Mesto 2'),
(3,33000,'Mesto 3'),
(4,44000,'Mesto 4'),
(5,55000,'Mesto 5');

/*Table structure for table `narudzbenica` */

DROP TABLE IF EXISTS `narudzbenica`;

CREATE TABLE `narudzbenica` (
  `NarudzbenicaID` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `Datum` datetime NOT NULL,
  `Popust` double(50,2) unsigned NOT NULL,
  `UkupnaCena` double(50,2) unsigned NOT NULL,
  `Status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `KupacID` int(50) unsigned NOT NULL,
  `AdminID` int(50) unsigned NOT NULL,
  PRIMARY KEY (`NarudzbenicaID`),
  KEY `FK_KUPAC` (`KupacID`),
  KEY `FK_ADMIN` (`AdminID`),
  CONSTRAINT `FK_ADMIN` FOREIGN KEY (`AdminID`) REFERENCES `administrator` (`AdminID`),
  CONSTRAINT `FK_KUPAC` FOREIGN KEY (`KupacID`) REFERENCES `kupac` (`KupacID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `narudzbenica` */

insert  into `narudzbenica`(`NarudzbenicaID`,`Datum`,`Popust`,`UkupnaCena`,`Status`,`KupacID`,`AdminID`) values 
(5,'2023-01-24 17:48:12',39.00,2401.88,'KREIRANA',1,1),
(6,'2023-01-24 17:57:01',41.00,9735.00,'KREIRANA',1,1),
(7,'2023-01-24 17:57:19',43.00,3762.00,'KREIRANA',1,1),
(8,'2023-01-24 17:57:34',43.00,3762.00,'KREIRANA',1,1),
(9,'2023-01-24 17:59:03',43.00,3762.00,'KREIRANA',1,1),
(10,'2023-01-24 18:03:43',45.00,31762.50,'KREIRANA',1,1),
(11,'2023-01-24 18:09:46',47.00,8745.00,'KREIRANA',1,1),
(12,'2023-01-24 18:24:22',0.00,1650.00,'ODBIJENA',2,1),
(13,'2023-01-24 19:03:47',0.00,8250.00,'POSLATA_ROBA',3,1);

/*Table structure for table `stavka` */

DROP TABLE IF EXISTS `stavka`;

CREATE TABLE `stavka` (
  `NarudzbenicaID` int(50) unsigned NOT NULL,
  `RedniBroj` int(50) unsigned NOT NULL,
  `Kolicina` int(50) unsigned NOT NULL,
  `PDV` double(50,2) unsigned NOT NULL,
  `KnjigaID` int(50) unsigned NOT NULL,
  `CenaKom` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`NarudzbenicaID`,`RedniBroj`),
  KEY `FK_KNJIGA` (`KnjigaID`),
  CONSTRAINT `FK_KNJIGA` FOREIGN KEY (`KnjigaID`) REFERENCES `knjiga` (`KnjigaID`),
  CONSTRAINT `FK_NARUDZBENICA` FOREIGN KEY (`NarudzbenicaID`) REFERENCES `narudzbenica` (`NarudzbenicaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `stavka` */

insert  into `stavka`(`NarudzbenicaID`,`RedniBroj`,`Kolicina`,`PDV`,`KnjigaID`,`CenaKom`) values 
(5,1,10,5.00,1,0),
(5,2,15,5.00,2,0),
(6,1,100,10.00,1,0),
(7,1,40,10.00,1,0),
(8,1,40,10.00,1,0),
(9,1,40,10.00,1,0),
(10,1,150,10.00,3,0),
(11,1,100,10.00,1,0),
(12,1,10,10.00,1,0),
(13,1,50,10.00,1,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
