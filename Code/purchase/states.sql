-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2022 at 08:07 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cyrusproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `State Name` varchar(255) DEFAULT NULL,
  `ShortCode` varchar(5) DEFAULT NULL,
  `StateCode` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`State Name`, `ShortCode`, `StateCode`) VALUES
('Jammu and Kashmir', 'JK', 1),
('Himachal Pradesh', 'HP', 2),
('Punjab', 'PB', 3),
('Chandigarh', 'CH', 4),
('Uttarakhand', 'UT', 5),
('Haryana', 'HR', 6),
('Delhi', 'DL', 7),
('Rajasthan', 'RJ', 8),
('Uttar Pradesh', 'UP', 9),
('Bihar', 'BH', 10),
('Sikkim', 'SK', 11),
('Arunachal Pradesh', 'AR', 12),
('Nagaland', 'NL', 13),
('Manipur', 'MN', 14),
('Mizoram', 'MI', 15),
('Tripura', 'TR', 16),
('Meghalaya', 'ME', 17),
('Assam', 'AS', 18),
('West Bengal', 'WB', 19),
('Jharkhand', 'JH', 20),
('Odisha', 'OR', 21),
('Chattisgarh', 'CT', 22),
('Madhya Pradesh', 'MP', 23),
('Gujarat', 'GJ', 24),
('Daman and Diu', 'DD', 25),
('Dadra and Nagar Haveli', 'DN', 26),
('Maharashtra', 'MH', 27),
('Andhra Pradesh', 'AP', 28),
('Karnataka', 'KA', 29),
('Goa', 'GA', 30),
('Lakshadweep Islands', 'LD', 31),
('Kerala', 'KL', 32),
('Tamil Nadu', 'TN', 33),
('Pondicherry', 'PY', 34),
('Andaman and Nicobar Islands', 'AN', 35),
('Telangana', 'TS', 36),
('Andhra Pradesh (New)', 'AD', 37);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`StateCode`),
  ADD KEY `ShortCode` (`ShortCode`),
  ADD KEY `StateCode` (`StateCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
