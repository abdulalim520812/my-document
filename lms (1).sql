-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2025 at 01:56 PM
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
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Author` varchar(255) NOT NULL,
  `Publisher` varchar(255) NOT NULL,
  `Edition` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `Title`, `Author`, `Publisher`, `Edition`) VALUES
('978-0131103627', 'The C Programming Language', 'Brian W. Kernighan, Dennis M. Ritchie', 'Prentice Hall', '2nd'),
('978-0262033848', 'Introduction to Algorithms', 'Thomas H. Cormen', 'MIT Press', '3rd');

-- --------------------------------------------------------

--
-- Table structure for table `book_copy`
--

CREATE TABLE `book_copy` (
  `CopyID` int(11) NOT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `BranchID` int(11) DEFAULT NULL,
  `Status` enum('Available','Borrowed') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_copy`
--

INSERT INTO `book_copy` (`CopyID`, `ISBN`, `BranchID`, `Status`) VALUES
(1, '978-0131103627', 1, 'Available'),
(2, '978-0131103627', 2, 'Borrowed'),
(3, '978-0262033848', 1, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `BorrowerID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Address` text NOT NULL,
  `BorrowingLimit` int(11) DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrower`
--

INSERT INTO `borrower` (`BorrowerID`, `Name`, `Email`, `Phone`, `Address`, `BorrowingLimit`) VALUES
(1, 'Alice Johnson', 'alice@example.com', '1234567890', '10 University St', 5),
(2, 'Bob Smith', 'bob@example.com', '0987654321', '20 University St', 5);

-- --------------------------------------------------------

--
-- Table structure for table `borrowing_transaction`
--

CREATE TABLE `borrowing_transaction` (
  `TransactionID` int(11) NOT NULL,
  `BorrowerID` int(11) DEFAULT NULL,
  `CopyID` int(11) DEFAULT NULL,
  `BorrowDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `ReturnDate` date DEFAULT NULL,
  `Fine` decimal(5,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowing_transaction`
--

INSERT INTO `borrowing_transaction` (`TransactionID`, `BorrowerID`, `CopyID`, `BorrowDate`, `DueDate`, `ReturnDate`, `Fine`) VALUES
(1, 1, 2, '2025-01-10', '2025-01-24', NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `library_branch`
--

CREATE TABLE `library_branch` (
  `BranchID` int(11) NOT NULL,
  `BranchName` varchar(255) NOT NULL,
  `Address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_branch`
--

INSERT INTO `library_branch` (`BranchID`, `BranchName`, `Address`) VALUES
(1, 'Central Library', '123 University St'),
(2, 'Science Library', '456 Science Ave');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `ReservationID` int(11) NOT NULL,
  `BorrowerID` int(11) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `ReservationDate` date NOT NULL,
  `NotificationStatus` enum('Pending','Notified') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`ReservationID`, `BorrowerID`, `ISBN`, `ReservationDate`, `NotificationStatus`) VALUES
(1, 2, '978-0131103627', '2025-01-12', 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD PRIMARY KEY (`CopyID`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `BranchID` (`BranchID`);

--
-- Indexes for table `borrower`
--
ALTER TABLE `borrower`
  ADD PRIMARY KEY (`BorrowerID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Phone` (`Phone`);

--
-- Indexes for table `borrowing_transaction`
--
ALTER TABLE `borrowing_transaction`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `BorrowerID` (`BorrowerID`),
  ADD KEY `CopyID` (`CopyID`);

--
-- Indexes for table `library_branch`
--
ALTER TABLE `library_branch`
  ADD PRIMARY KEY (`BranchID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `BorrowerID` (`BorrowerID`),
  ADD KEY `ISBN` (`ISBN`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_copy`
--
ALTER TABLE `book_copy`
  MODIFY `CopyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `borrower`
--
ALTER TABLE `borrower`
  MODIFY `BorrowerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `borrowing_transaction`
--
ALTER TABLE `borrowing_transaction`
  MODIFY `TransactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `library_branch`
--
ALTER TABLE `library_branch`
  MODIFY `BranchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ReservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD CONSTRAINT `book_copy_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_copy_ibfk_2` FOREIGN KEY (`BranchID`) REFERENCES `library_branch` (`BranchID`) ON DELETE CASCADE;

--
-- Constraints for table `borrowing_transaction`
--
ALTER TABLE `borrowing_transaction`
  ADD CONSTRAINT `borrowing_transaction_ibfk_1` FOREIGN KEY (`BorrowerID`) REFERENCES `borrower` (`BorrowerID`) ON DELETE CASCADE,
  ADD CONSTRAINT `borrowing_transaction_ibfk_2` FOREIGN KEY (`CopyID`) REFERENCES `book_copy` (`CopyID`) ON DELETE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`BorrowerID`) REFERENCES `borrower` (`BorrowerID`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
