-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2022 at 08:42 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `Id` int(4) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Price` int(8) DEFAULT NULL,
  `Author` varchar(128) DEFAULT NULL,
  `ReferenceId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`Id`, `Name`, `Price`, `Author`, `ReferenceId`) VALUES
(1, 'Over Lord', 2500, 'A', '9142138058fd41309ef67c79be1a840a'),
(2, 'Attack on Titan', 3500, 'SS', '03c3ea0ed38442a1ae83239d10f7c249'),
(3, 'Legend of Galactic Heroes', 2800, 'AA', '26577687295244faab56963931d8736e'),
(4, 'Black Rock Shooter Dawn Fall', 2300, 'AAA', '94714726bd764a63985543707404971b'),
(6, 'Spy x Family', 3250, 'SS', '29ecdde0d78647b4ad0e5e7e53711f29'),
(7, 'Sword Art Online', 3500, 'SS', 'fee54d82d9fe441bb41c5a44c9531b77'),
(8, 'Mahoutsukai Reimeiki', 2500, 'B', '591815901f6547e48b003b8717eff320');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
