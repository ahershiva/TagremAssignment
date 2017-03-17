-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2017 at 11:24 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tagremassignment`
--
CREATE DATABASE IF NOT EXISTS `tagremassignment` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tagremassignment`;

-- --------------------------------------------------------

--
-- Table structure for table `productdetails`
--

CREATE TABLE `productdetails` (
  `productbarcode` varchar(6) NOT NULL,
  `productname` varchar(30) NOT NULL,
  `productdescription` varchar(100) NOT NULL,
  `mrp` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productdetails`
--

INSERT INTO `productdetails` (`productbarcode`, `productname`, `productdescription`, `mrp`) VALUES
('100001', 'Patanjali Ata', 'Kachi ghani ka shudha ata, sehat ke liye upayukt! jarur apanayiye Patanjali Shudha desi ata.', 305),
('100002', 'Patanjali Dantkanti Toothpaste', 'Dantakanti toothpaste makes your teeth stronger and whiter', 60),
('100003', 'GoodKnight Active+', 'Active+ mode for protection against extreme mosquito attack.', 78);

-- --------------------------------------------------------

--
-- Table structure for table `product_survey_details`
--

CREATE TABLE `product_survey_details` (
  `store` varchar(30) NOT NULL,
  `productbarcode` varchar(6) NOT NULL,
  `price` float NOT NULL,
  `notes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_survey_details`
--

INSERT INTO `product_survey_details` (`store`, `productbarcode`, `price`, `notes`) VALUES
('BigBazar', '100001', 500, 'Hadapsar Area'),
('EasyDay', '100001', 400, 'Fursungi Area'),
('Dmart', '100001', 450, 'Kothrud'),
('Dmart', '100001', 350, 'Hadapsar'),
('BigBazar', '100001', 400, 'Deccan'),
('EasyDay', '100001', 300, 'Deccan'),
('EasyDay', '100002', 300, 'Deccan'),
('EasyDay', '100002', 100, 'Hadapsar'),
('BigBazar', '100002', 100, 'Hadapsar'),
('BigBazar', '100002', 60, 'Kothrud'),
('Dmart', '100002', 90, 'Kothrud'),
('Dmart', '100002', 150, 'Undri'),
('BigBazar', '100003', 95, 'KarveNagar'),
('Dmart', '100003', 100, 'Hadapsar'),
('Dmart', '100003', 100, 'KPRoad'),
('MegaStore', '100003', 80, 'Kothrud'),
('MegaStore', '100003', 110, 'Aundh'),
('Dmart', '100003', 70, 'Baner'),
('BigBazar', '100003', 60, 'Baner'),
('SaiSuperMarket', '100003', 50, 'KalyaniNagar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `productdetails`
--
ALTER TABLE `productdetails`
  ADD UNIQUE KEY `productbarcode` (`productbarcode`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
