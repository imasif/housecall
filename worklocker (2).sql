-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 13, 2019 at 03:05 AM
-- Server version: 5.7.19
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `worklocker`
--

-- --------------------------------------------------------

--
-- Table structure for table `AccessToken`
--

CREATE TABLE `AccessToken` (
  `id` varchar(255) NOT NULL,
  `ttl` int(11) DEFAULT NULL,
  `scopes` text,
  `created` datetime DEFAULT NULL,
  `userId` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AccessToken`
--

INSERT INTO `AccessToken` (`id`, `ttl`, `scopes`, `created`, `userId`) VALUES
('AsPVMR4hrUVR0LdsKVXNsSD3SSsQxs2JEN0I7Tiu0QADKC6XK5tuKVbO2tYTBrep', 1209600, NULL, '2019-07-13 02:40:29', '1'),
('fSboyFcrxysU6gWnL8OXqoAdMyC7hzbjwPwZId0ZPZDsQwfAq6aWiKBSHwN7DqK9', 1209600, NULL, '2019-07-12 17:07:23', '1'),
('IiqugpNyxmDF594FUJQ8bAejt4c16glwuI7FCNItJlbTHJMd6utYy0BgpYBXZqNu', 1209600, NULL, '2019-07-13 02:32:44', '1'),
('OgAfiruemL8xRt8I8pxPHCHC5tYq3RaAeVn0Grv7QLSN6gSwKUDZwH3KsaGKrQGJ', 1209600, NULL, '2019-07-12 17:05:33', '1'),
('PF8oHDKQiHZBNcDCsUFSgyIdnuFDbCHx4dKhu02y2QbUvCC7AtDpjnrOAmblS9mj', 1209600, NULL, '2019-07-12 17:04:12', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ACL`
--

CREATE TABLE `ACL` (
  `id` int(11) NOT NULL,
  `model` varchar(512) DEFAULT NULL,
  `property` varchar(512) DEFAULT NULL,
  `accessType` varchar(512) DEFAULT NULL,
  `permission` varchar(512) DEFAULT NULL,
  `principalType` varchar(512) DEFAULT NULL,
  `principalId` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `id` varchar(255) NOT NULL,
  `first_name` varchar(512) NOT NULL,
  `last_name` varchar(512) NOT NULL,
  `home_phone` varchar(512) NOT NULL,
  `mobile_phone` varchar(512) NOT NULL,
  `work_phone` varchar(512) NOT NULL,
  `company` varchar(512) NOT NULL,
  `job_title` varchar(512) NOT NULL,
  `addresses` text,
  `emails` text,
  `phones` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`id`, `first_name`, `last_name`, `home_phone`, `mobile_phone`, `work_phone`, `company`, `job_title`, `addresses`, `emails`, `phones`) VALUES
('8b52b012-a4c7-11e9-9bab-ebc718699de8', 'string', 'string', 'string', 'string', 'string', 'string', 'string', '[{\"id\":\"8b528900-a4c7-11e9-9bab-ebc718699de8\",\"street\":\"string\",\"city\":\"string\",\"state\":\"string\",\"zip\":\"string\",\"country\":\"string\"}]', '[{\"id\":\"8b52b010-a4c7-11e9-9bab-ebc718699de8\",\"email\":\"string\"}]', '[{\"id\":\"8b52b011-a4c7-11e9-9bab-ebc718699de8\",\"type\":\"string\",\"phone_no\":\"string\",\"note\":\"string\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `Estimate`
--

CREATE TABLE `Estimate` (
  `id` varchar(255) NOT NULL,
  `type` varchar(512) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `notes` varchar(512) NOT NULL,
  `denied` tinyint(1) DEFAULT NULL,
  `customerId` varchar(512) DEFAULT NULL,
  `groupingId` varchar(512) DEFAULT NULL,
  `servicelists` text,
  `materiallists` text,
  `userId` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Estimate`
--

INSERT INTO `Estimate` (`id`, `type`, `sub_total`, `total`, `notes`, `denied`, `customerId`, `groupingId`, `servicelists`, `materiallists`, `userId`) VALUES
('e6070e21-a4c7-11e9-9bab-ebc718699de8', 'material', 100, 20, 'string', 1, '8b52b012-a4c7-11e9-9bab-ebc718699de8', 'b9665790-a4c7-11e9-9bab-ebc718699de8', '[]', '[{\"id\":\"e6070e20-a4c7-11e9-9bab-ebc718699de8\",\"item_name\":\"string\",\"quantity\":4,\"unit_price\":5,\"taxable\":true,\"amount\":30}]', '1'),
('e6075c41-a4c7-11e9-9bab-ebc718699de8', 'service', 30, 50, 'string', 1, '8b52b012-a4c7-11e9-9bab-ebc718699de8', 'b9665790-a4c7-11e9-9bab-ebc718699de8', '[{\"id\":\"e6075c40-a4c7-11e9-9bab-ebc718699de8\",\"item_name\":\"string\",\"quantity\":2,\"unit_price\":15,\"taxable\":true,\"amount\":45}]', '[]', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Grouping`
--

CREATE TABLE `Grouping` (
  `id` varchar(255) NOT NULL,
  `name` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Grouping`
--

INSERT INTO `Grouping` (`id`, `name`) VALUES
('b9665790-a4c7-11e9-9bab-ebc718699de8', 'Working needed');

-- --------------------------------------------------------

--
-- Table structure for table `Invoice`
--

CREATE TABLE `Invoice` (
  `id` varchar(255) NOT NULL,
  `type` varchar(512) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `notes` varchar(512) NOT NULL,
  `customerId` varchar(512) DEFAULT NULL,
  `groupingId` varchar(512) DEFAULT NULL,
  `servicelists` text,
  `materiallists` text,
  `userId` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Job`
--

CREATE TABLE `Job` (
  `id` varchar(255) NOT NULL,
  `type` varchar(512) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `notes` varchar(512) NOT NULL,
  `start` datetime DEFAULT NULL,
  `finish` datetime DEFAULT NULL,
  `onmyway` datetime DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  `customerId` varchar(512) DEFAULT NULL,
  `groupingId` varchar(512) DEFAULT NULL,
  `servicelists` text,
  `materiallists` text,
  `userId` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

CREATE TABLE `Role` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Role`
--

INSERT INTO `Role` (`id`, `name`, `description`, `created`, `modified`) VALUES
(1, 'admin', NULL, '2019-07-13 02:07:15', '2019-07-13 02:07:15'),
(2, 'employee', NULL, '2019-07-13 02:07:15', '2019-07-13 02:07:15');

-- --------------------------------------------------------

--
-- Table structure for table `RoleMapping`
--

CREATE TABLE `RoleMapping` (
  `id` int(11) NOT NULL,
  `principalType` varchar(512) DEFAULT NULL,
  `principalId` varchar(255) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RoleMapping`
--

INSERT INTO `RoleMapping` (`id`, `principalType`, `principalId`, `roleId`) VALUES
(1, 'USER', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Schedule`
--

CREATE TABLE `Schedule` (
  `id` varchar(255) NOT NULL,
  `start_date_time` datetime NOT NULL,
  `end_date_time` datetime NOT NULL,
  `jobId` varchar(512) DEFAULT NULL,
  `customerId` varchar(512) DEFAULT NULL,
  `userId` varchar(512) DEFAULT NULL,
  `scheduleId` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` varchar(255) NOT NULL,
  `email` varchar(512) NOT NULL,
  `password` varchar(512) NOT NULL,
  `first_name` varchar(512) NOT NULL,
  `last_name` varchar(512) NOT NULL,
  `realm` varchar(512) DEFAULT NULL,
  `username` varchar(512) DEFAULT NULL,
  `emailVerified` tinyint(1) DEFAULT NULL,
  `verificationToken` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id`, `email`, `password`, `first_name`, `last_name`, `realm`, `username`, `emailVerified`, `verificationToken`) VALUES
('1', 'imasifkhan1010@gmail.com', '$2a$10$DKhLc7MBJzdhB0CIEVLOk.PzRktiPMZJRlp5NRusP2F.7VRN5kVqy', 'Asif', 'Khan', 'admin', '', 1, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AccessToken`
--
ALTER TABLE `AccessToken`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ACL`
--
ALTER TABLE `ACL`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Estimate`
--
ALTER TABLE `Estimate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Grouping`
--
ALTER TABLE `Grouping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Invoice`
--
ALTER TABLE `Invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Job`
--
ALTER TABLE `Job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `RoleMapping`
--
ALTER TABLE `RoleMapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `principalId` (`principalId`);

--
-- Indexes for table `Schedule`
--
ALTER TABLE `Schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ACL`
--
ALTER TABLE `ACL`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Role`
--
ALTER TABLE `Role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `RoleMapping`
--
ALTER TABLE `RoleMapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
