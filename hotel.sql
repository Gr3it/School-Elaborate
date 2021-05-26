-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 26, 2021 alle 09:12
-- Versione del server: 10.4.14-MariaDB
-- Versione PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `camera`
--

CREATE TABLE `camera` (
  `Numero Camera` int(11) NOT NULL,
  `Numero Posti` int(11) DEFAULT NULL,
  `Categoria` varchar(5) DEFAULT NULL,
  `Costo A Notte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `Codice Fiscale` varchar(16) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Cognome` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Data Di Nascita` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione`
--

CREATE TABLE `prenotazione` (
  `Id Prenotazione` int(11) NOT NULL,
  `Codice Fiscale Cliente` varchar(16) DEFAULT NULL,
  `Data Inizio Prenotazione` date DEFAULT NULL,
  `Data Fine Prenotazione` date DEFAULT NULL,
  `Pagamento Caparra` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione comprende camera`
--

CREATE TABLE `prenotazione comprende camera` (
  `Numero Camera` int(11) NOT NULL,
  `Id Prenotazione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `spese extra`
--

CREATE TABLE `spese extra` (
  `Id Spesa` int(11) NOT NULL,
  `Id Prenotazione` int(11) DEFAULT NULL,
  `Costo` float DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Tipologia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `camera`
--
ALTER TABLE `camera`
  ADD PRIMARY KEY (`Numero Camera`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Codice Fiscale`);

--
-- Indici per le tabelle `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD PRIMARY KEY (`Id Prenotazione`),
  ADD KEY `Codice Fiscale Cliente` (`Codice Fiscale Cliente`);

--
-- Indici per le tabelle `prenotazione comprende camera`
--
ALTER TABLE `prenotazione comprende camera`
  ADD PRIMARY KEY (`Numero Camera`,`Id Prenotazione`),
  ADD KEY `Id Prenotazione` (`Id Prenotazione`);

--
-- Indici per le tabelle `spese extra`
--
ALTER TABLE `spese extra`
  ADD PRIMARY KEY (`Id Spesa`),
  ADD KEY `Id Prenotazione` (`Id Prenotazione`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  MODIFY `Id Prenotazione` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `spese extra`
--
ALTER TABLE `spese extra`
  MODIFY `Id Spesa` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD CONSTRAINT `prenotazione_ibfk_1` FOREIGN KEY (`Codice Fiscale Cliente`) REFERENCES `cliente` (`Codice Fiscale`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `prenotazione comprende camera`
--
ALTER TABLE `prenotazione comprende camera`
  ADD CONSTRAINT `prenotazione comprende camera_ibfk_1` FOREIGN KEY (`Id Prenotazione`) REFERENCES `prenotazione` (`Id Prenotazione`) ON UPDATE CASCADE,
  ADD CONSTRAINT `prenotazione comprende camera_ibfk_2` FOREIGN KEY (`Numero Camera`) REFERENCES `camera` (`Numero Camera`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `spese extra`
--
ALTER TABLE `spese extra`
  ADD CONSTRAINT `spese extra_ibfk_1` FOREIGN KEY (`Id Prenotazione`) REFERENCES `prenotazione` (`Id Prenotazione`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
