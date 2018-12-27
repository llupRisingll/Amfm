-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2018 at 06:41 PM
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
  `acct_type` enum('admin','developer','lending','client') NOT NULL DEFAULT 'client',
  `bin_active` tinyint(1) NOT NULL DEFAULT '0',
  `uni_active` tinyint(1) NOT NULL DEFAULT '0',
  `hash_id` varchar(255) NOT NULL,
  `uniparent` int(255) UNSIGNED NOT NULL DEFAULT '1',
  `binparent` int(255) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `pass`, `acct_type`, `bin_active`, `uni_active`, `hash_id`, `uniparent`, `binparent`) VALUES
(1, 'jimmyallan1', 'monserate12123', 'client', 1, 1, 'primary1', 1, NULL),
(2, 'jimmyallan2', 'monserate12123', 'client', 1, 1, 'primary2', 10, 1),
(3, 'jimmyallan3', 'monserate12123', 'client', 1, 1, 'primary3', 10, 1),
(4, 'jimmyallan4', 'monserate12123', 'client', 1, 1, 'primary4', 10, 1),
(5, 'jimmyallan5', 'monserate12123', 'client', 1, 1, 'primary5', 10, 1),
(6, 'jimmyallan6', 'monserate12123', 'client', 1, 1, 'primary6', 10, 1),
(7, 'jimmyallan7', 'monserate12123', 'client', 1, 1, 'primary7', 10, 1),
(9, 'founders', 'monserate12123', 'client', 0, 1, 'primary8', 1, 1),
(10, 'ernanie', 'monserate12123', 'client', 0, 1, 'primary9', 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_info`
--

CREATE TABLE `account_info` (
  `accnt_id` int(255) UNSIGNED NOT NULL,
  `fn` varchar(255) NOT NULL,
  `ln` varchar(255) NOT NULL,
  `ad` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `cn` varchar(255) NOT NULL,
  `bdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_info`
--

INSERT INTO `account_info` (`accnt_id`, `fn`, `ln`, `ad`, `email`, `photo`, `cn`, `bdate`) VALUES
(1, 'Jimmy Allan', 'Monserate', 'Zone 3, Barangay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', NULL, '0910241241', '2018-12-20'),
(2, 'Jimmy Allan', 'Monserate', 'Zone 3, Barangay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', NULL, '0910241241', '2018-12-20'),
(3, 'Jimmy Allan', 'Monserate', 'Zone 3, Barangay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', NULL, '0910241241', '2018-12-20'),
(4, 'Jimmy Allan', 'Monserate', 'Zone 3, Barangay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', NULL, '0910241241', '2018-12-20'),
(5, 'Jimmy Allan', 'Monserate', 'Zone 3, Barangay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', NULL, '0910241241', '2018-12-20'),
(6, 'Jimmy Allan', 'Monserate', 'Zone 3, Barangay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', NULL, '0910241241', '2018-12-20'),
(7, 'Jimmy Allan', 'Monserate', 'Zone 3, Barangay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', NULL, '0910241241', '2018-12-20'),
(9, 'Administrato', 'Account', '', '', NULL, '', '2018-12-20'),
(10, 'Ernanie', 'Monserate', '', '', NULL, '', '2018-12-20');

-- --------------------------------------------------------

--
-- Table structure for table `binpath`
--

CREATE TABLE `binpath` (
  `anc` int(255) UNSIGNED NOT NULL,
  `desc` int(255) UNSIGNED NOT NULL,
  `lside` tinyint(1) NOT NULL DEFAULT '1',
  `parent` int(255) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `binpath`
--

INSERT INTO `binpath` (`anc`, `desc`, `lside`, `parent`) VALUES
(1, 1, 1, 0),
(1, 2, 1, 1),
(1, 3, 0, 1),
(1, 4, 1, 2),
(1, 5, 0, 2),
(1, 6, 1, 3),
(1, 7, 0, 3),
(2, 2, 1, 1),
(2, 4, 1, 2),
(2, 5, 0, 2),
(3, 3, 1, 1),
(3, 6, 1, 3),
(3, 7, 0, 3),
(4, 4, 1, 2),
(5, 5, 1, 2),
(6, 6, 1, 3),
(7, 7, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `bin_history`
--

CREATE TABLE `bin_history` (
  `id` int(255) UNSIGNED NOT NULL,
  `bwid` int(255) UNSIGNED DEFAULT NULL,
  `amount` int(255) UNSIGNED DEFAULT NULL,
  `earn_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bin_history`
--

INSERT INTO `bin_history` (`id`, `bwid`, `amount`, `earn_date`) VALUES
(1, 6, 1000, '2018-12-27'),
(2, 5, 1000, '2018-12-27'),
(3, 7, 3600, '2018-12-27');

-- --------------------------------------------------------

--
-- Table structure for table `bin_info`
--

CREATE TABLE `bin_info` (
  `bwid` int(255) UNSIGNED NOT NULL,
  `cid` int(255) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bin_info`
--

INSERT INTO `bin_info` (`bwid`, `cid`) VALUES
(7, 1),
(6, 2),
(5, 3),
(4, 4),
(3, 5),
(2, 6),
(1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `bin_wallet`
--

CREATE TABLE `bin_wallet` (
  `id` int(255) UNSIGNED NOT NULL,
  `amount` int(255) UNSIGNED DEFAULT NULL,
  `balance` int(255) UNSIGNED DEFAULT NULL,
  `paid` int(255) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bin_wallet`
--

INSERT INTO `bin_wallet` (`id`, `amount`, `balance`, `paid`) VALUES
(1, 0, 0, 0),
(2, 0, 0, 0),
(3, 0, 0, 0),
(4, 0, 0, 0),
(5, 1000, 1000, 0),
(6, 1000, 1000, 0),
(7, 3600, 3600, 0);

-- --------------------------------------------------------

--
-- Table structure for table `e_wallet`
--

CREATE TABLE `e_wallet` (
  `cid` int(255) UNSIGNED NOT NULL,
  `amount` int(255) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `id` int(255) UNSIGNED NOT NULL,
  `loan_type` enum('b','s','g','d','v','p') DEFAULT 'b',
  `loan_amount` int(255) UNSIGNED NOT NULL,
  `monthly_due` int(255) UNSIGNED NOT NULL,
  `gross_loan` int(255) UNSIGNED NOT NULL,
  `loan_balance` int(255) UNSIGNED NOT NULL,
  `loan_paid` int(255) UNSIGNED NOT NULL,
  `lend_date` date DEFAULT NULL,
  `maturity_date` date DEFAULT NULL,
  `paid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`id`, `loan_type`, `loan_amount`, `monthly_due`, `gross_loan`, `loan_balance`, `loan_paid`, `lend_date`, `maturity_date`, `paid`) VALUES
(1, 'v', 0, 0, 0, 0, 0, NULL, NULL, 0),
(2, 'v', 0, 0, 0, 0, 0, NULL, NULL, 0),
(22, 'v', 0, 0, 0, 0, 0, NULL, NULL, 0),
(23, 'v', 0, 0, 0, 0, 0, NULL, NULL, 0),
(24, 'v', 0, 0, 0, 0, 0, NULL, NULL, 0),
(25, 'v', 0, 0, 0, 0, 0, NULL, NULL, 0),
(26, 'v', 0, 0, 0, 0, 0, NULL, NULL, 0),
(27, 'v', 0, 0, 0, 0, 0, NULL, NULL, 0),
(28, 'v', 0, 0, 0, 0, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `loan_info`
--

CREATE TABLE `loan_info` (
  `lid` int(255) UNSIGNED NOT NULL,
  `cid` int(255) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan_info`
--

INSERT INTO `loan_info` (`lid`, `cid`) VALUES
(1, 1),
(23, 2),
(24, 3),
(25, 4),
(26, 5),
(27, 6),
(28, 7),
(2, 9),
(22, 10);

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `id` tinyint(12) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `id` int(255) UNSIGNED NOT NULL,
  `loan_id` int(255) UNSIGNED NOT NULL,
  `amount` int(255) UNSIGNED NOT NULL,
  `date_paid` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pending_binpath`
--

CREATE TABLE `pending_binpath` (
  `id` int(255) UNSIGNED NOT NULL,
  `invitee_id` int(255) UNSIGNED NOT NULL,
  `invitor_id` int(255) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pending_requests`
--

CREATE TABLE `pending_requests` (
  `id` int(255) UNSIGNED NOT NULL,
  `user_id` int(255) UNSIGNED NOT NULL,
  `parent_id` int(255) UNSIGNED NOT NULL,
  `type` enum('binary','unilevel') DEFAULT 'binary'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `unipath`
--

CREATE TABLE `unipath` (
  `anc` int(255) UNSIGNED NOT NULL,
  `desc` int(255) UNSIGNED NOT NULL,
  `parent` int(255) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unipath`
--

INSERT INTO `unipath` (`anc`, `desc`, `parent`) VALUES
(1, 1, 1),
(1, 2, 10),
(1, 3, 10),
(1, 4, 10),
(1, 5, 10),
(1, 6, 10),
(1, 7, 10),
(1, 9, 1),
(1, 10, 9),
(2, 2, 10),
(3, 3, 10),
(4, 4, 10),
(5, 5, 10),
(6, 6, 10),
(7, 7, 10),
(9, 2, 10),
(9, 3, 10),
(9, 4, 10),
(9, 5, 10),
(9, 6, 10),
(9, 7, 10),
(9, 9, 1),
(9, 10, 9),
(10, 2, 10),
(10, 3, 10),
(10, 4, 10),
(10, 5, 10),
(10, 6, 10),
(10, 7, 10),
(10, 10, 9);

-- --------------------------------------------------------

--
-- Table structure for table `uni_history`
--

CREATE TABLE `uni_history` (
  `id` int(255) UNSIGNED NOT NULL,
  `uwid` int(255) UNSIGNED DEFAULT NULL,
  `amount` int(255) UNSIGNED DEFAULT NULL,
  `earn_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uni_history`
--

INSERT INTO `uni_history` (`id`, `uwid`, `amount`, `earn_date`) VALUES
(107, 1, 240, '2018-12-28'),
(108, 3, 210, '2018-12-28'),
(109, 19, 180, '2018-12-28');

-- --------------------------------------------------------

--
-- Table structure for table `uni_info`
--

CREATE TABLE `uni_info` (
  `uwid` int(255) UNSIGNED NOT NULL,
  `cid` int(255) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uni_info`
--

INSERT INTO `uni_info` (`uwid`, `cid`) VALUES
(1, 1),
(24, 2),
(25, 3),
(26, 4),
(27, 5),
(28, 6),
(29, 7),
(3, 9),
(19, 10);

-- --------------------------------------------------------

--
-- Table structure for table `uni_monthly`
--

CREATE TABLE `uni_monthly` (
  `cid` int(255) UNSIGNED NOT NULL,
  `amount` int(255) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uni_monthly`
--

INSERT INTO `uni_monthly` (`cid`, `amount`) VALUES
(1, 240),
(9, 210),
(10, 180);

-- --------------------------------------------------------

--
-- Table structure for table `uni_packg`
--

CREATE TABLE `uni_packg` (
  `tid` int(255) UNSIGNED NOT NULL,
  `packg_type` enum('b','s','g','d','v','p') DEFAULT 'b'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uni_wallet`
--

CREATE TABLE `uni_wallet` (
  `id` int(255) UNSIGNED NOT NULL,
  `amount` int(255) UNSIGNED DEFAULT NULL,
  `balance` int(255) UNSIGNED DEFAULT NULL,
  `paid` int(255) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uni_wallet`
--

INSERT INTO `uni_wallet` (`id`, `amount`, `balance`, `paid`) VALUES
(1, 240, 240, 0),
(3, 210, 210, 0),
(19, 180, 180, 0),
(24, 0, 0, 0),
(25, 0, 0, 0),
(26, 0, 0, 0),
(27, 0, 0, 0),
(28, 0, 0, 0),
(29, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_history`
--

CREATE TABLE `withdrawal_history` (
  `id` int(255) UNSIGNED NOT NULL,
  `cid` int(255) UNSIGNED NOT NULL,
  `amount` int(255) UNSIGNED DEFAULT NULL,
  `trans_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_request`
--

CREATE TABLE `withdrawal_request` (
  `cid` int(255) UNSIGNED NOT NULL,
  `amount` int(255) UNSIGNED DEFAULT NULL,
  `resq_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `uniparent` (`uniparent`);

--
-- Indexes for table `account_info`
--
ALTER TABLE `account_info`
  ADD PRIMARY KEY (`accnt_id`),
  ADD KEY `accnt_id` (`accnt_id`);

--
-- Indexes for table `binpath`
--
ALTER TABLE `binpath`
  ADD PRIMARY KEY (`anc`,`desc`) USING BTREE,
  ADD KEY `desc` (`desc`);

--
-- Indexes for table `bin_history`
--
ALTER TABLE `bin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bwid` (`bwid`);

--
-- Indexes for table `bin_info`
--
ALTER TABLE `bin_info`
  ADD PRIMARY KEY (`bwid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `bin_wallet`
--
ALTER TABLE `bin_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `e_wallet`
--
ALTER TABLE `e_wallet`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_info`
--
ALTER TABLE `loan_info`
  ADD PRIMARY KEY (`lid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_id` (`loan_id`);

--
-- Indexes for table `pending_binpath`
--
ALTER TABLE `pending_binpath`
  ADD PRIMARY KEY (`id`,`invitee_id`,`invitor_id`) USING BTREE,
  ADD KEY `invitee_id` (`invitee_id`),
  ADD KEY `invitor_id` (`invitor_id`);

--
-- Indexes for table `pending_requests`
--
ALTER TABLE `pending_requests`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_id_2` (`parent_id`);

--
-- Indexes for table `unipath`
--
ALTER TABLE `unipath`
  ADD PRIMARY KEY (`anc`,`desc`),
  ADD KEY `desc` (`desc`);

--
-- Indexes for table `uni_history`
--
ALTER TABLE `uni_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uwid` (`uwid`);

--
-- Indexes for table `uni_info`
--
ALTER TABLE `uni_info`
  ADD PRIMARY KEY (`uwid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `uni_monthly`
--
ALTER TABLE `uni_monthly`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `uni_packg`
--
ALTER TABLE `uni_packg`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `uni_wallet`
--
ALTER TABLE `uni_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_history`
--
ALTER TABLE `withdrawal_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `withdrawal_request`
--
ALTER TABLE `withdrawal_request`
  ADD PRIMARY KEY (`cid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `bin_history`
--
ALTER TABLE `bin_history`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bin_wallet`
--
ALTER TABLE `bin_wallet`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pending_binpath`
--
ALTER TABLE `pending_binpath`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `pending_requests`
--
ALTER TABLE `pending_requests`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `uni_history`
--
ALTER TABLE `uni_history`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT for table `uni_wallet`
--
ALTER TABLE `uni_wallet`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `withdrawal_history`
--
ALTER TABLE `withdrawal_history`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_info`
--
ALTER TABLE `account_info`
  ADD CONSTRAINT `account_info_ibfk_1` FOREIGN KEY (`accnt_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `binpath`
--
ALTER TABLE `binpath`
  ADD CONSTRAINT `binpath_ibfk_1` FOREIGN KEY (`anc`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `binpath_ibfk_2` FOREIGN KEY (`desc`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `bin_history`
--
ALTER TABLE `bin_history`
  ADD CONSTRAINT `bin_history_ibfk_1` FOREIGN KEY (`bwid`) REFERENCES `bin_wallet` (`id`);

--
-- Constraints for table `bin_info`
--
ALTER TABLE `bin_info`
  ADD CONSTRAINT `bin_info_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `bin_info_ibfk_2` FOREIGN KEY (`bwid`) REFERENCES `bin_wallet` (`id`);

--
-- Constraints for table `e_wallet`
--
ALTER TABLE `e_wallet`
  ADD CONSTRAINT `e_wallet_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `accounts` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `loan_info`
--
ALTER TABLE `loan_info`
  ADD CONSTRAINT `loan_info_ibfk_1` FOREIGN KEY (`lid`) REFERENCES `loan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loan_info_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`id`);

--
-- Constraints for table `pending_binpath`
--
ALTER TABLE `pending_binpath`
  ADD CONSTRAINT `pending_binpath_ibfk_1` FOREIGN KEY (`invitee_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `pending_binpath_ibfk_2` FOREIGN KEY (`invitor_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `pending_requests`
--
ALTER TABLE `pending_requests`
  ADD CONSTRAINT `pending_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pending_requests_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unipath`
--
ALTER TABLE `unipath`
  ADD CONSTRAINT `unipath_ibfk_1` FOREIGN KEY (`anc`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `unipath_ibfk_2` FOREIGN KEY (`desc`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `uni_history`
--
ALTER TABLE `uni_history`
  ADD CONSTRAINT `uni_history_ibfk_1` FOREIGN KEY (`uwid`) REFERENCES `uni_wallet` (`id`);

--
-- Constraints for table `uni_info`
--
ALTER TABLE `uni_info`
  ADD CONSTRAINT `uni_info_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `uni_info_ibfk_2` FOREIGN KEY (`uwid`) REFERENCES `uni_wallet` (`id`);

--
-- Constraints for table `uni_monthly`
--
ALTER TABLE `uni_monthly`
  ADD CONSTRAINT `uni_monthly_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `uni_packg`
--
ALTER TABLE `uni_packg`
  ADD CONSTRAINT `uni_packg_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `pending_requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `withdrawal_history`
--
ALTER TABLE `withdrawal_history`
  ADD CONSTRAINT `withdrawal_history_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `withdrawal_request`
--
ALTER TABLE `withdrawal_request`
  ADD CONSTRAINT `withdrawal_request_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
