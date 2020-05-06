-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 06, 2020 at 03:19 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `patient_paf`
--

-- --------------------------------------------------------

--
-- Table structure for table `patienttable`
--

DROP TABLE IF EXISTS `patienttable`;
CREATE TABLE IF NOT EXISTS `patienttable` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `cNumber` int(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `nic` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patienttable`
--

INSERT INTO `patienttable` (`patientID`, `firstName`, `lastName`, `fullName`, `address`, `sex`, `cNumber`, `age`, `nic`, `dob`) VALUES
(1, 'Yelani', 'Surige', 'Yelani Surige', 'NO:16/5 ,Athurugiriya.', 'F', 778523549, '21', '754125497v', '1992-12-12'),
(2, 'Anupama', 'Balasooriya', 'Anupama Balasooriya', 'NO:45, Athurupara, Galle', 'F', 754125495, '65', '754125487v', '1980-05-04'),
(3, 'Dananjaya', 'Perera', 'Dananjaya Perera', '147/2B, padukka, Hanwalla.', 'M', 458755450, '52', '4512445875v', '1645-10-02');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
