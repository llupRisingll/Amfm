-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2018 at 04:26 PM
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
(1, 'jimboy1', 'snitch1', 'client', 1, 1, 'j1', 0, 1),
(2, 'jimboy2', 'snitch2', 'client', 1, 1, 'j2', 1, 1),
(3, 'jimboy3', 'snitch3', 'client', 1, 1, 'j3', 1, 1),
(4, 'jimboy4', 'snitch4', 'client', 1, 1, 'j4', 1, 1),
(5, 'jimboy5', 'snitch5', 'client', 1, 1, 'j5', 1, 1),
(6, 'jimboy6', 'snitch6', 'client', 1, 1, 'j6', 1, 1),
(7, 'jimboy7', 'snitch7', 'client', 1, 1, 'j7', 1, 1),
(63, 'llupRisingll', 'mnycnajrad', 'client', 1, 1, '4048dda5ab392192924f3f2864bc08ca1539696121', 2, 1),
(64, 'admin', 'admin', 'client', 1, 0, '5048dda5ab392192924f3f2864bc08ca1539696121', 1, 2),
(65, 'test', 'test', 'client', 0, 0, '6048dda5ab392192924f3f2864bc08ca1539696121', 1, NULL),
(66, 'test2', 'test2', 'client', 0, 0, 'test2', 2, NULL),
(67, 'test3', 'test3', 'client', 0, 0, 'test3', 1, NULL),
(68, 'test4', 'test4', 'client', 0, 0, 'test4', 1, NULL),
(69, 'test5', 'test5', 'client', 0, 0, 'test5', 1, NULL),
(70, 'test6', 'test6', 'client', 0, 0, 'test6', 1, NULL),
(71, 'test7', 'test7', 'client', 0, 0, 'test7', 1, NULL),
(72, 'test8', 'test8', 'client', 0, 0, 'test8', 1, NULL),
(73, 'test9', 'test9', 'client', 0, 0, 'test9', 1, NULL),
(74, 'llupRising', 'mnycnajrad', 'client', 0, 0, 'aaed8f1ddec132110333cf4ba231c6af1544213451', 0, NULL),
(76, 'llupRisingll2', 'mnycnajrad', 'client', 0, 0, 'd8f84d02b1ae1b0d0452dfe09e42f9241544213507', 124, NULL),
(77, 'llupRisingll3', 'mnycnajrad', 'client', 0, 0, 'af3e0f07a9fafe6a9e2c3880738fcd411544213862', 3, NULL);

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
(1, '1Jimmy Allan', '1Monserate', '1Zone 3, Baranggay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', '', '1 0999-7995-757/+852-5217-1401', '2018-10-15'),
(2, 'Jimmy Allan', 'Monserate', 'Zone 3, Baranggay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', '', ' 0999-7995-757/+852-5217-1401', '2018-10-15'),
(3, 'Jimmy Allan', 'Monserate', 'Zone 3, Baranggay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', '', ' 0999-7995-757/+852-5217-1401', '2018-10-15'),
(4, 'Jimmy Allan', 'Monserate', 'Zone 3, Baranggay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', '', ' 0999-7995-757/+852-5217-1401', '2018-10-15'),
(5, 'Jimmy Allan', 'Monserate', 'Zone 3, Baranggay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', '', ' 0999-7995-757/+852-5217-1401', '2018-10-15'),
(6, 'Jimmy Allan', 'Monserate', 'Zone 3, Baranggay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', '', ' 0999-7995-757/+852-5217-1401', '2018-10-15'),
(7, 'Jimmy Allan', 'Monserate', 'Zone 3, Baranggay Tambang Tinambac, 4426 Camarines Sur', 'monseratejimmyallan@gmail.com', '', ' 0999-7995-757/+852-5217-1401', '2018-10-15'),
(63, 'Luis Edward', 'Miranda', 'Sipocot, Camarines Sur', 'luisedward.miranda@gmail.com', NULL, '09292709026', '2018-10-15'),
(64, 'Admin', 'Account', '12414', NULL, NULL, '1241', '2018-10-31'),
(65, 'Test', 'Account', 'Sipocot, Camarines Sur', 'asdasd', NULL, '124124124', '2018-10-30'),
(74, 'Luis Edward', 'Miranda', 'Sipocot, Camarines Sur', 'luisedward.miranda@gmail.com', NULL, '09292709026', '2018-12-13'),
(76, 'Luis Edward', 'Miranda', 'Sipocot, Camarines Sur', 'luisedward.miranda@gmail.com', NULL, '09292709026', '2018-12-17'),
(77, 'Luis Edward', 'Miranda', 'Sipocot, Camarines Sur', 'luisedward.miranda@gmail.com', NULL, '09292709026', '2018-12-27');

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
(1, 1, 1, 1),
(1, 2, 1, 1),
(1, 3, 1, 1),
(1, 4, 1, 2),
(1, 5, 1, 2),
(1, 6, 1, 3),
(1, 7, 1, 3),
(1, 63, 1, 4),
(1, 64, 0, 4),
(2, 2, 1, 1),
(2, 4, 1, 2),
(2, 5, 1, 2),
(2, 63, 1, 4),
(2, 64, 0, 4),
(3, 3, 1, 1),
(3, 6, 1, 3),
(3, 7, 1, 3),
(4, 4, 1, 2),
(4, 63, 1, 4),
(4, 64, 0, 4),
(5, 5, 1, 2),
(6, 6, 1, 3),
(7, 7, 1, 3),
(63, 63, 1, 4),
(64, 64, 1, 4);

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
(1, 1, 3600, '2018-12-03'),
(15, 2, 1000, '2018-12-05'),
(16, 1, 1000, '2018-12-06'),
(17, 2, 1100, '2018-12-06'),
(18, 4, 1000, '2018-12-06');

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
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 63),
(9, 64);

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
(1, 4700, 4600, 100),
(2, 2100, 2100, 0),
(3, 0, 0, 0),
(4, 1000, 1000, 0),
(5, 0, 0, 0),
(6, 0, 0, 0),
(7, 0, 0, 0),
(8, 0, 0, 0),
(9, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `e_wallet`
--

CREATE TABLE `e_wallet` (
  `cid` int(255) UNSIGNED NOT NULL,
  `amount` int(255) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `e_wallet`
--

INSERT INTO `e_wallet` (`cid`, `amount`) VALUES
(1, 200);

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
(1, 'v', 0, 0, 0, 0, 0, NULL, NULL, 1),
(2, 'v', 0, 0, 0, 0, 0, NULL, NULL, 1),
(3, 'v', 0, 0, 0, 0, 0, NULL, NULL, 1),
(4, 'v', 0, 0, 0, 0, 0, NULL, NULL, 1),
(5, 'v', 0, 0, 0, 0, 0, NULL, NULL, 1),
(6, 'v', 0, 0, 0, 0, 0, NULL, NULL, 1),
(7, 'v', 0, 0, 0, 0, 0, NULL, NULL, 1),
(9, 'g', 20000, 3500, 28000, 28000, 0, '2018-12-03', '2019-08-03', 0);

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
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(9, 63);

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `id` tinyint(12) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`id`, `name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'Octobber'),
(11, 'November'),
(12, 'December');

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

--
-- Dumping data for table `payment_history`
--

INSERT INTO `payment_history` (`id`, `loan_id`, `amount`, `date_paid`) VALUES
(1, 3, 2000, '2018-11-24');

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
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(1, 5, 1),
(1, 6, 1),
(1, 7, 1),
(1, 63, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(63, 63, 1);

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
(7, 1, 150, '2018-12-02'),
(50, 1, 30, '2018-12-03');

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
(2, 63);

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
(1, 180);

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
(1, 180, 80, 100),
(2, 0, 0, 0);

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
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `bin_history`
--
ALTER TABLE `bin_history`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `bin_wallet`
--
ALTER TABLE `bin_wallet`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pending_binpath`
--
ALTER TABLE `pending_binpath`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pending_requests`
--
ALTER TABLE `pending_requests`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni_history`
--
ALTER TABLE `uni_history`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `uni_wallet`
--
ALTER TABLE `uni_wallet`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
