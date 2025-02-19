-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 29, 2018 at 06:40 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MINIPROJECT`
--

-- --------------------------------------------------------

--
-- Table structure for table `ENTRY_FOR_EVENT`
--

CREATE TABLE `ENTRY_FOR_EVENT` (
  `ID` int(5) NOT NULL,
  `USER_ID` int(5) NOT NULL,
  `EVENT_ID` int(5) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `REGISTERED_EVENT` varchar(50) NOT NULL,
  `ALLOCATED_SEATS` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ENTRY_FOR_EVENT`
--

INSERT INTO `ENTRY_FOR_EVENT` (`ID`, `USER_ID`, `EVENT_ID`, `CREATED_DATE`, `REGISTERED_EVENT`, `ALLOCATED_SEATS`) VALUES
(1001, 1001, 1001, '2018-08-29 16:14:09', 'Enthusia', 91),
(1002, 1002, 1002, '2018-08-29 16:15:54', 'Blockchain Workshop', 180),
(1003, 1003, 1003, '2018-08-29 16:16:19', 'C Session', 45),
(1004, 1004, 1004, '2018-08-29 16:16:50', 'Android Workshop', 144),
(1005, 1005, 1005, '2018-08-29 16:17:26', 'Python Workshop', 172);

-- --------------------------------------------------------

--
-- Table structure for table `EVENT`
--

CREATE TABLE `EVENT` (
  `ID` int(5) NOT NULL,
  `EVENT_NAME` varchar(50) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AVAILABLE_COUNT` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EVENT`
--

INSERT INTO `EVENT` (`ID`, `EVENT_NAME`, `CREATED_DATE`, `AVAILABLE_COUNT`) VALUES
(1001, 'Enthusia', '2018-08-29 16:09:35', 100),
(1002, 'Blockchain Workshop', '2018-08-29 16:11:32', 200),
(1003, 'C Session', '2018-08-29 16:11:52', 50),
(1004, 'Android Workshop', '2018-08-29 16:12:12', 150),
(1005, 'Python Workshop', '2018-08-29 16:12:32', 180);

-- --------------------------------------------------------

--
-- Table structure for table `WEB_USER`
--

CREATE TABLE `WEB_USER` (
  `ID` int(5) NOT NULL,
  `USER_NAME` varchar(20) NOT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `STATE` varchar(20) DEFAULT NULL,
  `COUNTRY` varchar(20) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `MOBILE` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `WEB_USER`
--

INSERT INTO `WEB_USER` (`ID`, `USER_NAME`, `CITY`, `STATE`, `COUNTRY`, `EMAIL`, `MOBILE`) VALUES
(1001, 'onkar15', 'Pune', 'Maharashtra', 'India', 'onkarbhujbal95@gmail.com', '8446320691'),
(1002, 'chaitanya07', 'Pune', 'Maharashtra', 'India', 'bchaitanya@gmail.com', '9552586390'),
(1003, 'snehal16', 'Ahmadnagar', 'Maharashtra', 'India', 'snehalchaudhari@gmail.com', '9881035311'),
(1004, 'sakshi08', 'Aurangabad', 'Maharashtra', 'India', 'sakshibihani@gmail.com', '9420378369'),
(1005, 'sanved18', 'Aurangabad', 'Maharashtra', 'India', 'sanved007@gmail.com', '9011011060');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ENTRY_FOR_EVENT`
--
ALTER TABLE `ENTRY_FOR_EVENT`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `USER_ID` (`USER_ID`),
  ADD KEY `EVENT_ID` (`EVENT_ID`);

--
-- Indexes for table `EVENT`
--
ALTER TABLE `EVENT`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `WEB_USER`
--
ALTER TABLE `WEB_USER`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD UNIQUE KEY `MOBILE` (`MOBILE`),
  ADD UNIQUE KEY `USER_NAME` (`USER_NAME`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ENTRY_FOR_EVENT`
--
ALTER TABLE `ENTRY_FOR_EVENT`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT for table `EVENT`
--
ALTER TABLE `EVENT`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT for table `WEB_USER`
--
ALTER TABLE `WEB_USER`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ENTRY_FOR_EVENT`
--
ALTER TABLE `ENTRY_FOR_EVENT`
  ADD CONSTRAINT `ENTRY_FOR_EVENT_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `WEB_USER` (`ID`),
  ADD CONSTRAINT `ENTRY_FOR_EVENT_ibfk_2` FOREIGN KEY (`EVENT_ID`) REFERENCES `EVENT` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



CREATE TABLE EVENT_REG (
  R_ID int(5) NOT NULL AUTO_INCREMENT ,
  USER_NAME varchar(50) NOT NULL,
  COLLEGE varchar(50) NOT NULL,
  EVENT varchar(50) NOT NULL,
  EMAIL varchar(35) NOT NULL,
MOBILE_NO varchar(20) NOT NULL,
  GROUP_T varchar(10) NOT NULL,
  CATEGORY varchar(10) NOT NULL,
  PRIMARY KEY (R_ID)
);


