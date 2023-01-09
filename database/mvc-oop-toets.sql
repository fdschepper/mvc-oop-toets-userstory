-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 14 nov 2022 om 10:49
-- Serverversie: 5.7.36
-- PHP-versie: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvc-oop-toets`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `instructeur`
--

DROP TABLE IF EXISTS `instructeur`;
CREATE TABLE IF NOT EXISTS `instructeur` (
  `Id` int(6) NOT NULL AUTO_INCREMENT,
  `Email` varchar(30) NOT NULL,
  `Naam` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `instructeur`
--

INSERT INTO `instructeur` (`Id`, `Email`, `Naam`) VALUES
(1, 'groen@mail.com', 'Groen'),
(2, 'konijn@google.com', 'Konijn'),
(3, 'frasi@google.sp', 'Frasi');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leerling`
--

DROP TABLE IF EXISTS `leerling`;
CREATE TABLE IF NOT EXISTS `leerling` (
  `Id` int(6) NOT NULL AUTO_INCREMENT,
  `Naam` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `leerling`
--

INSERT INTO `leerling` (`Id`, `Naam`) VALUES
(3, 'Konijn'),
(4, 'Slavink'),
(5, 'Otto');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `les`
--

DROP TABLE IF EXISTS `les`;
CREATE TABLE IF NOT EXISTS `les` (
  `Id` int(6) NOT NULL AUTO_INCREMENT,
  `Datum` date NOT NULL,
  `LeerlingId` int(6) NOT NULL,
  `InstructeurId` int(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_les_InstructeurId_instructeur_Id` (`InstructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `les`
--

INSERT INTO `les` (`Id`, `Datum`, `LeerlingId`, `InstructeurId`) VALUES
(45, '2022-05-20', 3, 1),
(46, '2022-05-20', 6, 3),
(47, '2022-05-21', 4, 2),
(48, '2022-05-21', 6, 3),
(49, '2022-05-22', 3, 1),
(50, '2022-05-28', 4, 2),
(51, '2022-06-01', 3, 2),
(52, '2022-06-12', 3, 1),
(53, '2022-06-22', 3, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderwerp`
--

DROP TABLE IF EXISTS `onderwerp`;
CREATE TABLE IF NOT EXISTS `onderwerp` (
  `Id` int(6) NOT NULL AUTO_INCREMENT,
  `LesId` int(6) NOT NULL,
  `Onderwerp` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2351 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `onderwerp`
--

INSERT INTO `onderwerp` (`Id`, `LesId`, `Onderwerp`) VALUES
(2343, 45, 'File parkeren'),
(2344, 46, 'Achteruit rijden'),
(2345, 49, 'File parkeren'),
(2346, 49, 'Invoegen snelweg'),
(2347, 50, 'Achteruit rijden'),
(2348, 52, 'Achteruit rijden'),
(2349, 52, 'Invoegen snelweg'),
(2350, 52, 'File parkeren');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `opmerking`
--

DROP TABLE IF EXISTS `opmerking`;
CREATE TABLE IF NOT EXISTS `opmerking` (
  `Id` int(6) NOT NULL AUTO_INCREMENT,
  `LesId` int(6) NOT NULL,
  `Opmerking` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1130 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `opmerking`
--

INSERT INTO `opmerking` (`Id`, `LesId`, `Opmerking`) VALUES
(1123, 45, 'File parkeren kan beter'),
(1124, 46, 'Beter in spiegel kijken'),
(1125, 49, 'Opletten op aankomend verkeer'),
(1126, 49, 'Langer doorrijden bij invoegen'),
(1127, 50, 'Langzaam aan'),
(1128, 52, 'Beter in spiegels kijken'),
(1129, 52, 'Richtingaanwijzer aan');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `richestpeople`
--

DROP TABLE IF EXISTS `richestpeople`;
CREATE TABLE IF NOT EXISTS `richestpeople` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Nettoworth` varchar(200) NOT NULL,
  `Age` tinyint(4) NOT NULL,
  `Company` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `richestpeople`
--

INSERT INTO `richestpeople` (`Id`, `Name`, `Nettoworth`, `Age`, `Company`) VALUES
(102, 'Bernard Arnault', '14200000000', 73, 'Louis Vuitton'),
(103, 'Bill Gates', '130000000000', 66, 'Microsoft');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `les`
--
ALTER TABLE `les`
  ADD CONSTRAINT `FK_les_InstructeurId_instructeur_Id` FOREIGN KEY (`InstructeurId`) REFERENCES `instructeur` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
