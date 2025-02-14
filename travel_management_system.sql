-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2025 at 12:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_ticket`
--

CREATE TABLE `book_ticket` (
  `t_id` int(11) NOT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `route_id` int(11) NOT NULL,
  `journey_date` date NOT NULL,
  `seat_no` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_ticket`
--

INSERT INTO `book_ticket` (`t_id`, `passenger_id`, `bus_id`, `route_id`, `journey_date`, `seat_no`) VALUES
(1, 1, 3, 1, '2019-11-15', 'A3'),
(2, 2, 3, 2, '2019-11-15', 'A4'),
(3, 3, 3, 1, '2019-11-15', 'A8'),
(4, 4, 3, 1, '2019-11-15', 'B4');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL,
  `bus_name` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`bus_id`, `bus_name`, `model`, `company_id`) VALUES
(1, 'Hanif', 'volvo', 3),
(2, 'Nabil', 'scania', 1),
(3, 'Alam', 'volvo', 1),
(4, 'SR', 'sarkar', 3),
(5, 'Hanif Scania', 'Scania', 3);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `city`, `contact`) VALUES
(1, 'SR Group', 'Dhaka', '80988789'),
(2, 'Karim Group', 'Faridpur', '576577867'),
(3, 'Hanif Travel', 'Dhaka', '57678677');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `license_no` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `bus_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `name`, `phone`, `license_no`, `city`, `bus_id`) VALUES
(1, 'Habib', '198398409', 'A125679', 'Dhaka', 1),
(2, 'Kamal', '1374577567', 'A125622', 'Barishal', 2),
(3, 'Nabab', '1983984409', 'A12534', 'Rajshahi', 5),
(4, 'Jamal', '1374877567', 'BA125679', 'Dhaka', 4);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `p_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`p_id`, `first_name`, `last_name`, `gender`, `email`, `phone`) VALUES
(1, 'nasir', 'Hossain', 'male', 'nasir@gmail.com', '1900987654'),
(2, 'azim', 'Uddin', 'male', 'azim@gmail.com', '9876262636'),
(3, 'bina', 'Kabir', 'female', 'bina@gmail.com', '1933987654'),
(4, 'aslam', 'Khan', 'male', 'aslam@gmail.com', '9876266636');

-- --------------------------------------------------------

--
-- Stand-in structure for view `passenger_contact_details`
-- (See below for the actual view)
--
CREATE TABLE `passenger_contact_details` (
`first_name` varchar(255)
,`last_name` varchar(255)
,`email` varchar(255)
,`phone` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `passenger_id`, `bus_id`, `amount`) VALUES
(1, 1, 4, 500.00),
(2, 2, 2, 500.00);

-- --------------------------------------------------------

--
-- Structure for view `passenger_contact_details`
--
DROP TABLE IF EXISTS `passenger_contact_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `passenger_contact_details`  AS SELECT `passenger`.`first_name` AS `first_name`, `passenger`.`last_name` AS `last_name`, `passenger`.`email` AS `email`, `passenger`.`phone` AS `phone` FROM `passenger` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_ticket`
--
ALTER TABLE `book_ticket`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `passenger_id` (`passenger_id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`bus_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `passenger_id` (`passenger_id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_ticket`
--
ALTER TABLE `book_ticket`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_ticket`
--
ALTER TABLE `book_ticket`
  ADD CONSTRAINT `book_ticket_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`p_id`),
  ADD CONSTRAINT `book_ticket_ibfk_2` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`);

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`p_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
