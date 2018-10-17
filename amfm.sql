-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2018 at 03:30 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amfm`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(255) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `acct_type` tinyint(1) NOT NULL DEFAULT '0',
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `hash_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `pass`, `acct_type`, `activated`, `hash_id`) VALUES
(63, 'llupRisingll', 'mnycnajrad', 0, 0, '4048dda5ab392192924f3f2864bc08ca1539696121');

-- --------------------------------------------------------

--
-- Table structure for table `account_info`
--

CREATE TABLE `account_info` (
  `id` int(255) UNSIGNED NOT NULL,
  `fn` varchar(255) NOT NULL,
  `ln` varchar(255) NOT NULL,
  `ad` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `cn` varchar(255) NOT NULL,
  `accnt_id` int(255) UNSIGNED NOT NULL,
  `bdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_info`
--

INSERT INTO `account_info` (`id`, `fn`, `ln`, `ad`, `email`, `photo`, `cn`, `accnt_id`, `bdate`) VALUES
(13, 'Luis Edward', 'Miranda', 'Sipocot, Camarines Sur', 'luisedward.miranda@gmail.com', NULL, '09292709026', 63, '2018-10-15');

-- --------------------------------------------------------

--
-- Table structure for table `binary_level`
--

CREATE TABLE `binary_level` (
  `id` int(255) NOT NULL,
  `activated` tinyint(1) DEFAULT '0',
  `indirect_ref_id` int(255) UNSIGNED NOT NULL,
  `direct_ref_id` int(255) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` int(255) UNSIGNED NOT NULL,
  `monthly` date NOT NULL,
  `total_earn` int(255) UNSIGNED NOT NULL,
  `ref_id` int(255) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uni_level`
--

CREATE TABLE `uni_level` (
  `id` int(255) NOT NULL,
  `package_type` enum('b','s','g','d','v','p') DEFAULT NULL,
  `activated` tinyint(1) DEFAULT '0',
  `refferal_id` int(255) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `account_info`
--
ALTER TABLE `account_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accnt_id` (`accnt_id`);

--
-- Indexes for table `binary_level`
--
ALTER TABLE `binary_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indirect_ref_id` (`indirect_ref_id`),
  ADD KEY `direct_ref_id` (`direct_ref_id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `uni_level`
--
ALTER TABLE `uni_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refferal_id` (`refferal_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `account_info`
--
ALTER TABLE `account_info`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `binary_level`
--
ALTER TABLE `binary_level`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni_level`
--
ALTER TABLE `uni_level`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_info`
--
ALTER TABLE `account_info`
  ADD CONSTRAINT `account_info_ibfk_1` FOREIGN KEY (`accnt_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `binary_level`
--
ALTER TABLE `binary_level`
  ADD CONSTRAINT `binary_level_ibfk_1` FOREIGN KEY (`indirect_ref_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `binary_level_ibfk_2` FOREIGN KEY (`direct_ref_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `earnings`
--
ALTER TABLE `earnings`
  ADD CONSTRAINT `earnings_ibfk_1` FOREIGN KEY (`ref_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `uni_level`
--
ALTER TABLE `uni_level`
  ADD CONSTRAINT `uni_level_ibfk_1` FOREIGN KEY (`refferal_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
