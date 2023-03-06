-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2022 at 05:52 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diagnosis`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `gettest` (IN `id` INT)  select * from test WHERE t_id=id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `password`) VALUES
('bhuvika', 'bhuvi123'),
('deeksha', 'deek123');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `b_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phonenumber` bigint(10) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `tname` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` time(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`b_id`, `name`, `phonenumber`, `cname`, `tname`, `date`, `time`) VALUES
(1, 'roy', 8904273163, 'asian', 'complete blood count', '2022-02-05', '23:45:00.000'),
(8, 'raj', 8904273153, 'prima', 'complete blood count', '2022-02-04', '15:30:00.000'),
(9, 'Shilpa', 8105046826, 'lucid', 'covid-19 RTPCP', '2022-02-05', '13:22:00.000');

-- --------------------------------------------------------

--
-- Table structure for table `clinic`
--

CREATE TABLE `clinic` (
  `id` int(20) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phonenumber` bigint(10) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clinic`
--

INSERT INTO `clinic` (`id`, `cname`, `address`, `phonenumber`, `password`) VALUES
(1, 'asian', 'bangalore', 8904273569, 'asian123'),
(2, 'prima', 'RR Nagar Bangalore', 8904273569, 'prima123'),
(3, 'lucid', 'bangalore', 8904273153, 'lucid123');

-- --------------------------------------------------------

--
-- Table structure for table `example`
--

CREATE TABLE `example` (
  `id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `cdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `example`
--

INSERT INTO `example` (`id`, `t_id`, `action`, `cdate`) VALUES
(1, 6, 'Inserted', '2022-02-03 21:33:10'),
(2, 5, 'Updated', '2022-02-03 21:40:11'),
(3, 3, 'Deleted', '2022-02-03 21:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `feedback` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`username`, `email`, `feedback`) VALUES
('roy', 'roy@gmail.com', 'good going');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `t_id` int(10) NOT NULL,
  `tname` varchar(50) NOT NULL,
  `sample` varchar(50) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`t_id`, `tname`, `sample`, `duration`, `amount`) VALUES
(1, 'complete blood count', 'blood', '30', 250),
(2, 'covid-19 RTPCP', 'nasal swabs', '10', 500),
(4, 'Triglycerides', 'blood', '1', 1500),
(5, 'Blood Pressure', 'NA', '20', 300),
(6, 'cholestrol', 'blood', '30min', 700);

--
-- Triggers `test`
--
DELIMITER $$
CREATE TRIGGER `INSERTEXAMPLE` AFTER INSERT ON `test` FOR EACH ROW INSERT INTO example values(null, NEW.t_id, 'Inserted', NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deleteexample` BEFORE DELETE ON `test` FOR EACH ROW INSERT INTO example VALUES(null, OLD.t_id, "Deleted", NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateexample` AFTER UPDATE ON `test` FOR EACH ROW INSERT INTO example VALUES(null, NEW.t_id, 'Updated', NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phonenumber` bigint(10) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `phonenumber`, `password`) VALUES
(1, 'mahesh', '', 0, 'mahesh123'),
(3, 'sam', '', 0, 'sam123'),
(4, 'jack', '', 0, 'jack123'),
(12, 'ramya', 'ramya@gmail.com', 8904273153, 'ramya123'),
(13, 'ram', 'ram@gmail.com', 8904273153, 'ram123'),
(15, 'raj', 'raj@gmail.com', 8904273153, 'raj123'),
(16, 'roy', 'roy@gmail.com', 8904273163, 'roy123'),
(21, 'jyo', 'jyo@gmail.com', 8904273163, 'jyo123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `clinic`
--
ALTER TABLE `clinic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `example`
--
ALTER TABLE `example`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `b_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `example`
--
ALTER TABLE `example`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `t_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
