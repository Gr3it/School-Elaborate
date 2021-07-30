-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 27, 2021 alle 14:09
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
  `Nome_Camera` varchar(7) NOT NULL,
  `Numero_Posti` int(11) DEFAULT NULL,
  `Categoria` varchar(5) DEFAULT NULL,
  `Costo_A_Notte` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `camera`
--

INSERT INTO `camera` (`Nome_Camera`, `Numero_Posti`, `Categoria`, `Costo_A_Notte`) VALUES
('basic1', 2, 'basic', 84.99),
('basic10', 2, 'basic', 84.99),
('basic11', 2, 'basic', 84.99),
('basic12', 2, 'basic', 84.99),
('basic13', 2, 'basic', 84.99),
('basic14', 2, 'basic', 84.99),
('basic15', 2, 'basic', 84.99),
('basic16', 2, 'basic', 84.99),
('basic17', 2, 'basic', 84.99),
('basic18', 2, 'basic', 84.99),
('basic19', 2, 'basic', 84.99),
('basic2', 2, 'basic', 84.99),
('basic3', 2, 'basic', 84.99),
('basic4', 2, 'basic', 84.99),
('basic5', 2, 'basic', 84.99),
('basic6', 2, 'basic', 84.99),
('basic7', 2, 'basic', 84.99),
('basic8', 2, 'basic', 84.99),
('basic9', 2, 'basic', 84.99),
('lusso1', 2, 'lusso', 104.99),
('lusso10', 2, 'lusso', 104.99),
('lusso11', 2, 'lusso', 104.99),
('lusso12', 2, 'lusso', 104.99),
('lusso13', 3, 'lusso', 104.99),
('lusso2', 2, 'lusso', 104.99),
('lusso3', 2, 'lusso', 104.99),
('lusso4', 3, 'lusso', 104.99),
('lusso5', 2, 'lusso', 104.99),
('lusso6', 2, 'lusso', 104.99),
('lusso7', 2, 'lusso', 104.99),
('lusso8', 2, 'lusso', 104.99),
('lusso9', 2, 'lusso', 104.99),
('suite1', 3, 'suite', 149.99),
('suite2', 3, 'suite', 149.99),
('suite3', 3, 'suite', 149.99),
('suite4', 2, 'suite', 149.99),
('suite5', 2, 'suite', 149.99),
('suite6', 2, 'suite', 149.99),
('suite7', 2, 'suite', 149.99);

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `Codice_Fiscale` varchar(16) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Cognome` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Data_Di_Nascita` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`Codice_Fiscale`, `Nome`, `Cognome`, `Email`, `Data_Di_Nascita`) VALUES
('ZNIMNL02L09L378O', 'Emanuele', 'Zini', 'emanuele.zini11@gmail.com', '2002-07-09');

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione`
--

CREATE TABLE `prenotazione` (
  `Id_Prenotazione` int(11) NOT NULL,
  `Codice_Fiscale_Cliente` varchar(16) DEFAULT NULL,
  `Data_Inizio_Prenotazione` date DEFAULT NULL,
  `Data_Fine_Prenotazione` date DEFAULT NULL,
  `Pagamento_Caparra` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `prenotazione`
--

INSERT INTO `prenotazione` (`Id_Prenotazione`, `Codice_Fiscale_Cliente`, `Data_Inizio_Prenotazione`, `Data_Fine_Prenotazione`, `Pagamento_Caparra`) VALUES
(2, 'ZNIMNL02L09L378O', '2021-01-01', '2022-01-01', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione_comprende_camera`
--

CREATE TABLE `prenotazione_comprende_camera` (
  `Nome_Camera` varchar(7) NOT NULL,
  `Id_Prenotazione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `prenotazione_comprende_camera`
--

INSERT INTO `prenotazione_comprende_camera` (`Nome_Camera`, `Id_Prenotazione`) VALUES
('basic14', 2),
('basic2', 2),
('lusso3', 2),
('suite5', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `spese_extra`
--

CREATE TABLE `spese_extra` (
  `Id_Spesa` int(11) NOT NULL,
  `Id_Prenotazione` int(11) DEFAULT NULL,
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
  ADD PRIMARY KEY (`Nome_Camera`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Codice_Fiscale`);

--
-- Indici per le tabelle `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD PRIMARY KEY (`Id_Prenotazione`),
  ADD KEY `Codice Fiscale Cliente` (`Codice_Fiscale_Cliente`);

--
-- Indici per le tabelle `prenotazione_comprende_camera`
--
ALTER TABLE `prenotazione_comprende_camera`
  ADD PRIMARY KEY (`Nome_Camera`,`Id_Prenotazione`),
  ADD KEY `Id Prenotazione` (`Id_Prenotazione`);

--
-- Indici per le tabelle `spese_extra`
--
ALTER TABLE `spese_extra`
  ADD PRIMARY KEY (`Id_Spesa`),
  ADD KEY `Id Prenotazione` (`Id_Prenotazione`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  MODIFY `Id_Prenotazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `spese_extra`
--
ALTER TABLE `spese_extra`
  MODIFY `Id_Spesa` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD CONSTRAINT `prenotazione_ibfk_1` FOREIGN KEY (`Codice_Fiscale_Cliente`) REFERENCES `cliente` (`Codice_Fiscale`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `prenotazione_comprende_camera`
--
ALTER TABLE `prenotazione_comprende_camera`
  ADD CONSTRAINT `prenotazione_comprende_camera_ibfk_2` FOREIGN KEY (`Nome_Camera`) REFERENCES `camera` (`Nome_Camera`) ON UPDATE CASCADE,
  ADD CONSTRAINT `prenotazione_comprende_camera_ibfk_3` FOREIGN KEY (`Id_Prenotazione`) REFERENCES `prenotazione` (`Id_Prenotazione`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `spese_extra`
--
ALTER TABLE `spese_extra`
  ADD CONSTRAINT `spese_extra_ibfk_1` FOREIGN KEY (`Id_Prenotazione`) REFERENCES `prenotazione` (`Id_Prenotazione`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
