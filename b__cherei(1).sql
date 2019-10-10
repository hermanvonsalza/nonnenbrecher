-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Okt 2019 um 14:31
-- Server-Version: 10.4.6-MariaDB
-- PHP-Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `bücherei`
--

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `ausgeliehen`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `ausgeliehen` (
`kundenID` int(11)
,`Beginn` date
,`Rückgabe` date
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `ausleih`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `ausleih` (
`kundenID` int(11)
,`Beginn` date
,`Rückgabe` date
,`kunde` bigint(21)
,`nachname` varchar(255)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `ausleihe`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `ausleihe` (
`kundenID` int(11)
,`Beginn` date
,`Rückgabe` date
,`kunde` bigint(21)
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `autor`
--

CREATE TABLE `autor` (
  `AutorID` int(11) NOT NULL,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL,
  `buchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `autor`
--

INSERT INTO `autor` (`AutorID`, `vorname`, `nachname`, `buchID`) VALUES
(1, 'Jens', 'Hut', 1064),
(2, 'Inge', 'Sessel', 1065),
(3, 'Horst ', 'Müller', 1066),
(4, 'Ewin', 'Lindemann', 1067),
(5, 'Paula', 'Muss', 1068),
(6, 'Helmut ', 'Hut', 1069);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buch`
--

CREATE TABLE `buch` (
  `buchID` int(11) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `Titel` varchar(50) NOT NULL,
  `autorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `buch`
--

INSERT INTO `buch` (`buchID`, `isbn`, `Titel`, `autorID`) VALUES
(1064, '1235-261-36269', 'Schön', 1),
(1065, '1235-261-36270', 'Gut', 2),
(1066, '1235-261-36271', 'Weniger', 3),
(1067, '1235-261-36272', 'Mehr', 4),
(1068, '1235-261-36273', 'Sehr', 5),
(1069, '1235-261-36274', 'Schlecht', 6),
(1070, '1235-261-36275', 'Hoch', 4),
(1071, '1235-261-36276', 'Tief', 3),
(1072, '1235-261-36277', 'Weit', 6),
(1073, '1235-261-36278', 'Kurz', 1),
(1074, '1235-261-36279', 'Lang', 3),
(1075, '1235-261-36280', 'Tief', 4),
(1076, '1235-261-36281', 'Flach', 2),
(1077, '1235-261-36282', 'Hoch', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunden`
--

CREATE TABLE `kunden` (
  `kundenId` int(11) NOT NULL,
  `vorname` varchar(255) NOT NULL,
  `nachname` varchar(255) NOT NULL,
  `wohnort` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `kunden`
--

INSERT INTO `kunden` (`kundenId`, `vorname`, `nachname`, `wohnort`) VALUES
(1, 'Thorsten', 'Bernhardt', 'Berlin'),
(2, 'Sabine', 'Toren', 'Dresden'),
(3, 'Carolin', 'Schreiber', 'Dresden'),
(4, 'Antonio', 'Kunze', 'Chemnitz'),
(5, 'Marcel', 'Tischer', 'Meißen'),
(7, 'Marco', 'Ötztürk', 'Leipzig'),
(8, 'Simone', 'Grosser', 'Radebeul'),
(9, 'Dieter', 'Dobrisch', 'Dresden'),
(10, 'Angelo', 'Bauer', 'Leipzig'),
(11, 'Fabiana', 'Förster', 'Dresden'),
(12, 'Giuseppe', 'Stenzel', 'Leipzig'),
(13, 'Karsten', 'Standhaft', 'Chemnitz'),
(14, 'Tina', 'Mayer', 'Großenhain'),
(15, 'Jasmin', 'Müller', 'Berlin');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `verleih`
--

CREATE TABLE `verleih` (
  `kundenId` int(11) NOT NULL,
  `buchId` int(11) NOT NULL,
  `aDatum` date NOT NULL DEFAULT current_timestamp(),
  `rDatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `verleih`
--

INSERT INTO `verleih` (`kundenId`, `buchId`, `aDatum`, `rDatum`) VALUES
(1, 1065, '2019-10-10', '2019-10-25'),
(1, 1066, '2019-10-10', '2019-10-24'),
(3, 1068, '2019-10-10', '2019-10-22'),
(5, 1065, '2019-10-10', '2019-10-21'),
(6, 1065, '2019-10-10', '2019-10-16'),
(7, 1065, '2019-10-10', '2019-10-07'),
(9, 1065, '2019-10-10', '2019-10-29');

-- --------------------------------------------------------

--
-- Struktur des Views `ausgeliehen`
--
DROP TABLE IF EXISTS `ausgeliehen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ausgeliehen`  AS  select `verleih`.`kundenId` AS `kundenID`,`verleih`.`aDatum` AS `Beginn`,`verleih`.`rDatum` AS `Rückgabe` from `verleih` ;

-- --------------------------------------------------------

--
-- Struktur des Views `ausleih`
--
DROP TABLE IF EXISTS `ausleih`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ausleih`  AS  select `verleih`.`kundenId` AS `kundenID`,`verleih`.`aDatum` AS `Beginn`,`verleih`.`rDatum` AS `Rückgabe`,count(`verleih`.`kundenId`) AS `kunde`,`kunden`.`nachname` AS `nachname` from (`verleih` join `kunden` on(`verleih`.`kundenId` = `kunden`.`kundenId`)) group by `verleih`.`kundenId` ;

-- --------------------------------------------------------

--
-- Struktur des Views `ausleihe`
--
DROP TABLE IF EXISTS `ausleihe`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ausleihe`  AS  select `verleih`.`kundenId` AS `kundenID`,`verleih`.`aDatum` AS `Beginn`,`verleih`.`rDatum` AS `Rückgabe`,count(`verleih`.`kundenId`) AS `kunde` from `verleih` group by `verleih`.`kundenId` ;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`AutorID`),
  ADD UNIQUE KEY `AutorID` (`AutorID`);

--
-- Indizes für die Tabelle `buch`
--
ALTER TABLE `buch`
  ADD PRIMARY KEY (`buchID`),
  ADD UNIQUE KEY `autorID` (`buchID`);

--
-- Indizes für die Tabelle `kunden`
--
ALTER TABLE `kunden`
  ADD PRIMARY KEY (`kundenId`);

--
-- Indizes für die Tabelle `verleih`
--
ALTER TABLE `verleih`
  ADD PRIMARY KEY (`kundenId`,`buchId`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `autor`
--
ALTER TABLE `autor`
  MODIFY `AutorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `buch`
--
ALTER TABLE `buch`
  MODIFY `buchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1078;

--
-- AUTO_INCREMENT für Tabelle `kunden`
--
ALTER TABLE `kunden`
  MODIFY `kundenId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201698;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
