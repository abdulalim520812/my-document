-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 27, 2025 at 05:47 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `HRMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `Attendance`
--

CREATE TABLE `Attendance` (
  `AttendanceID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `AttendanceDate` date DEFAULT NULL,
  `Status` enum('Present','Absent','Leave') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Attendance`
--

INSERT INTO `Attendance` (`AttendanceID`, `EmployeeID`, `AttendanceDate`, `Status`) VALUES
(1, 1, '2023-01-24', 'Present'),
(2, 2, '2023-01-04', 'Absent'),
(3, 3, '2023-01-12', 'Leave'),
(4, 4, '2023-01-30', 'Absent'),
(5, 5, '2023-01-08', 'Leave'),
(6, 8, '2023-01-28', 'Leave'),
(7, 6, '2023-01-13', 'Absent'),
(8, 9, '2023-01-14', 'Leave'),
(9, 7, '2023-01-30', 'Leave'),
(10, 10, '2023-01-12', 'Present'),
(16, 1, '2025-01-01', 'Present'),
(17, 2, '2025-01-02', 'Present'),
(18, 3, '2025-01-03', 'Absent'),
(19, 4, '2025-01-04', 'Leave'),
(20, 5, '2025-01-05', 'Present'),
(21, 6, '2025-01-06', 'Absent'),
(22, 7, '2025-01-07', 'Present'),
(23, 8, '2025-01-08', 'Present'),
(24, 9, '2025-01-09', 'Leave'),
(25, 10, '2025-01-10', 'Present'),
(26, 1, '2025-01-01', 'Present'),
(27, 2, '2025-01-02', 'Present'),
(28, 3, '2025-01-03', 'Absent'),
(29, 4, '2025-01-04', 'Leave'),
(30, 5, '2025-01-05', 'Present'),
(31, 6, '2025-01-06', 'Absent'),
(32, 7, '2025-01-07', 'Present'),
(33, 8, '2025-01-08', 'Present'),
(34, 9, '2025-01-09', 'Leave'),
(35, 10, '2025-01-10', 'Present'),
(36, 1, '2025-01-01', 'Present'),
(37, 2, '2025-01-02', 'Present'),
(38, 3, '2025-01-03', 'Absent'),
(39, 4, '2025-01-04', 'Leave'),
(40, 5, '2025-01-05', 'Present'),
(41, 6, '2025-01-06', 'Absent'),
(42, 7, '2025-01-07', 'Present'),
(43, 8, '2025-01-08', 'Present'),
(44, 9, '2025-01-09', 'Leave'),
(45, 10, '2025-01-10', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(100) DEFAULT NULL,
  `Dept_Location` varchar(100) DEFAULT NULL,
  `Dept_Head` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`DepartmentID`, `DepartmentName`, `Dept_Location`, `Dept_Head`) VALUES
(1, 'Human Resources', 'Dhaka', 'Rahim Ahmed'),
(2, 'Finance', 'Chittagong', 'Karim Chowdhury'),
(3, 'IT', 'Sylhet', 'Sumaiya Begum'),
(4, 'Operations', 'Khulna', 'Tania Sultana'),
(5, 'Sales', 'Barisal', 'Faruk Hossain'),
(6, 'Procurement', 'Rangpur', 'Nazmul Islam'),
(7, 'Logistics', 'Mymensingh', 'Sadia Rahman'),
(8, 'Customer Service', 'Comilla', 'Rokeya Begum'),
(9, 'Quality Control', 'Gazipur', 'Abdul Matin'),
(10, 'Marketing', 'Rajshahi', 'Shamim Reza'),
(11, 'Research and Development', 'Dhaka', 'Tanvir Alam'),
(12, 'Legal', 'Chittagong', 'Sufia Khatun'),
(13, 'Public Relations', 'Sylhet', 'Nargis Akter'),
(14, 'Training and Development', 'Khulna', 'Hasan Mahmud'),
(15, 'Security', 'Barisal', 'Imran Khan'),
(16, 'Audit', 'Rangpur', 'Shahin Alam'),
(17, 'Strategy', 'Mymensingh', 'Rehena Parvin'),
(18, 'Business Development', 'Comilla', 'Mehedi Hasan'),
(19, 'Environmental Health', 'Gazipur', 'Parvez Rahman'),
(20, 'Supply Chain', 'Rajshahi', 'Sharmin Akter'),
(21, 'Event Management', 'Dhaka', 'Afsana Parvin'),
(22, 'Corporate Affairs', 'Chittagong', 'Raihan Mahmud'),
(23, 'Product Development', 'Sylhet', 'Zarin Hossain'),
(24, 'IT Security', 'Khulna', 'Saiful Alam'),
(25, 'Supply Chain Management', 'Rajshahi', 'Nazrul Islam'),
(26, 'E-Commerce', 'Barisal', 'Sadia Anjum'),
(27, 'Social Media', 'Rangpur', 'Rokibul Haque'),
(28, 'Compliance', 'Mymensingh', 'Salma Begum'),
(29, 'Data Science', 'Comilla', 'Tanvir Khan'),
(30, 'Facility Management', 'Gazipur', 'Fahim Rahman'),
(31, 'Event Management', 'Dhaka', 'Afsana Parvin'),
(32, 'Corporate Affairs', 'Chittagong', 'Raihan Mahmud'),
(33, 'Product Development', 'Sylhet', 'Zarin Hossain'),
(34, 'IT Security', 'Khulna', 'Saiful Alam'),
(35, 'Supply Chain Management', 'Rajshahi', 'Nazrul Islam'),
(36, 'E-Commerce', 'Barisal', 'Sadia Anjum'),
(37, 'Social Media', 'Rangpur', 'Rokibul Haque'),
(38, 'Compliance', 'Mymensingh', 'Salma Begum'),
(39, 'Data Science', 'Comilla', 'Tanvir Khan'),
(40, 'Facility Management', 'Gazipur', 'Fahim Rahman'),
(41, 'Event Management', 'Dhaka', 'Afsana Parvin'),
(42, 'Corporate Affairs', 'Chittagong', 'Raihan Mahmud'),
(43, 'Product Development', 'Sylhet', 'Zarin Hossain'),
(44, 'IT Security', 'Khulna', 'Saiful Alam'),
(45, 'Supply Chain Management', 'Rajshahi', 'Nazrul Islam'),
(46, 'E-Commerce', 'Barisal', 'Sadia Anjum'),
(47, 'Social Media', 'Rangpur', 'Rokibul Haque'),
(48, 'Compliance', 'Mymensingh', 'Salma Begum'),
(49, 'Data Science', 'Comilla', 'Tanvir Khan'),
(50, 'Facility Management', 'Gazipur', 'Fahim Rahman');

-- --------------------------------------------------------

--
-- Table structure for table `Designation`
--

CREATE TABLE `Designation` (
  `DesignationID` int(11) NOT NULL,
  `DesignationName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Designation`
--

INSERT INTO `Designation` (`DesignationID`, `DesignationName`) VALUES
(1, 'HR Manager'),
(2, 'HR Executive'),
(3, 'Accountant'),
(4, 'Finance Manager'),
(5, 'Software Engineer'),
(6, 'IT Support Specialist'),
(7, 'Operations Manager'),
(8, 'Sales Executive'),
(9, 'Logistics Coordinator'),
(10, 'Quality Analyst'),
(11, 'Customer Support Specialist'),
(12, 'Marketing Manager'),
(13, 'Procurement Officer'),
(14, 'Product Manager'),
(15, 'Team Leader'),
(16, 'Training Specialist'),
(17, 'Audit Officer'),
(18, 'Business Analyst'),
(19, 'Legal Advisor'),
(20, 'Security Supervisor'),
(21, 'Digital Marketing Specialist'),
(22, 'Chief Data Officer'),
(23, 'AI Researcher'),
(24, 'Mobile App Developer'),
(25, 'System Architect'),
(26, 'Field Officer'),
(27, 'Procurement Manager'),
(28, 'Training Coordinator'),
(29, 'Network Administrator'),
(30, 'Content Writer'),
(31, 'Digital Marketing Specialist'),
(32, 'Chief Data Officer'),
(33, 'AI Researcher'),
(34, 'Mobile App Developer'),
(35, 'System Architect'),
(36, 'Field Officer'),
(37, 'Procurement Manager'),
(38, 'Training Coordinator'),
(39, 'Network Administrator'),
(40, 'Content Writer'),
(41, 'Digital Marketing Specialist'),
(42, 'Chief Data Officer'),
(43, 'AI Researcher'),
(44, 'Mobile App Developer'),
(45, 'System Architect'),
(46, 'Field Officer'),
(47, 'Procurement Manager'),
(48, 'Training Coordinator'),
(49, 'Network Administrator'),
(50, 'Content Writer');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `EmployeeID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `JoiningDate` date DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  `DesignationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`EmployeeID`, `Name`, `Gender`, `DateOfBirth`, `PhoneNumber`, `Email`, `Address`, `JoiningDate`, `DepartmentID`, `DesignationID`) VALUES
(1, 'Rahim Ahmed', 'Male', '1985-02-15', '01712345678', 'rahim.ahmed@hrms.com', 'Dhaka', '2015-01-10', 1, 1),
(2, 'Sumaiya Begum', 'Female', '1990-05-22', '01823456789', 'sumaiya.begum@hrms.com', 'Sylhet', '2017-03-15', 2, 3),
(3, 'Karim Chowdhury', 'Male', '1988-09-10', '01698765432', 'karim.chowdhury@hrms.com', 'Chittagong', '2016-06-01', 3, 4),
(4, 'Tania Sultana', 'Female', '1995-01-01', '01987654321', 'tania.sultana@hrms.com', 'Khulna', '2018-04-20', 4, 6),
(5, 'Faruk Hossain', 'Male', '1992-08-18', '01787654321', 'faruk.hossain@hrms.com', 'Barisal', '2019-08-10', 5, 7),
(6, 'Employee_732', 'Female', '2016-12-03', '01366008', 'employee_485@hrms.com', 'City_3', '2011-11-24', 8, 6),
(7, 'Employee_95', 'Female', '1987-10-04', '018600543', 'employee_733@hrms.com', 'City_0', '2013-04-10', 10, 19),
(8, 'Employee_909', 'Female', '2016-06-27', '012730545', 'employee_699@hrms.com', 'City_6', '2014-01-30', 5, 8),
(9, 'Employee_476', 'Male', '2020-06-27', '01800548', 'employee_442@hrms.com', 'City_9', '2017-05-03', 8, 4),
(10, 'Employee_703', 'Female', '2001-01-09', '017870134', 'employee_399@hrms.com', 'City_6', '2023-05-10', 10, 19),
(13, 'Afsana Parvin', 'Female', '1991-03-11', '01712123456', 'afsana.parvin@hrms.com', 'Dhaka', '2020-01-01', 1, 21),
(14, 'Raihan Mahmud', 'Male', '1986-11-23', '01812123457', 'raihan.mahmud@hrms.com', 'Chittagong', '2019-07-15', 2, 22),
(15, 'Zarin Hossain', 'Female', '1993-06-19', '01912123458', 'zarin.hossain@hrms.com', 'Sylhet', '2021-04-10', 3, 23),
(16, 'Saiful Alam', 'Male', '1987-02-14', '01612123459', 'saiful.alam@hrms.com', 'Khulna', '2020-08-01', 4, 24),
(17, 'Nazrul Islam', 'Male', '1990-09-30', '01512123460', 'nazrul.islam@hrms.com', 'Rajshahi', '2018-05-20', 5, 25),
(18, 'Sadia Anjum', 'Female', '1994-07-07', '01712123461', 'sadia.anjum@hrms.com', 'Barisal', '2022-02-15', 6, 26),
(19, 'Rokibul Haque', 'Male', '1988-10-12', '01812123462', 'rokibul.haque@hrms.com', 'Rangpur', '2017-11-05', 7, 27),
(20, 'Salma Begum', 'Female', '1992-12-25', '01912123463', 'salma.begum@hrms.com', 'Mymensingh', '2016-06-18', 8, 28),
(21, 'Tanvir Khan', 'Male', '1985-05-15', '01612123464', 'tanvir.khan@hrms.com', 'Comilla', '2015-03-30', 9, 29),
(22, 'Fahim Rahman', 'Male', '1996-01-20', '01512123465', 'fahim.rahman@hrms.com', 'Gazipur', '2023-01-10', 10, 30),
(23, 'Afsana Parvin', 'Female', '1991-03-11', '01712123456', 'afsana.parvin@hrms.com', 'Dhaka', '2020-01-01', 1, 21),
(24, 'Raihan Mahmud', 'Male', '1986-11-23', '01812123457', 'raihan.mahmud@hrms.com', 'Chittagong', '2019-07-15', 2, 22),
(25, 'Zarin Hossain', 'Female', '1993-06-19', '01912123458', 'zarin.hossain@hrms.com', 'Sylhet', '2021-04-10', 3, 23),
(26, 'Saiful Alam', 'Male', '1987-02-14', '01612123459', 'saiful.alam@hrms.com', 'Khulna', '2020-08-01', 4, 24),
(27, 'Nazrul Islam', 'Male', '1990-09-30', '01512123460', 'nazrul.islam@hrms.com', 'Rajshahi', '2018-05-20', 5, 25),
(28, 'Sadia Anjum', 'Female', '1994-07-07', '01712123461', 'sadia.anjum@hrms.com', 'Barisal', '2022-02-15', 6, 26),
(29, 'Rokibul Haque', 'Male', '1988-10-12', '01812123462', 'rokibul.haque@hrms.com', 'Rangpur', '2017-11-05', 7, 27),
(30, 'Salma Begum', 'Female', '1992-12-25', '01912123463', 'salma.begum@hrms.com', 'Mymensingh', '2016-06-18', 8, 28),
(31, 'Tanvir Khan', 'Male', '1985-05-15', '01612123464', 'tanvir.khan@hrms.com', 'Comilla', '2015-03-30', 9, 29),
(32, 'Fahim Rahman', 'Male', '1996-01-20', '01512123465', 'fahim.rahman@hrms.com', 'Gazipur', '2023-01-10', 10, 30),
(33, 'Afsana Parvin', 'Female', '1991-03-11', '01712123456', 'afsana.parvin@hrms.com', 'Dhaka', '2020-01-01', 1, 21),
(34, 'Raihan Mahmud', 'Male', '1986-11-23', '01812123457', 'raihan.mahmud@hrms.com', 'Chittagong', '2019-07-15', 2, 22),
(35, 'Zarin Hossain', 'Female', '1993-06-19', '01912123458', 'zarin.hossain@hrms.com', 'Sylhet', '2021-04-10', 3, 23),
(36, 'Saiful Alam', 'Male', '1987-02-14', '01612123459', 'saiful.alam@hrms.com', 'Khulna', '2020-08-01', 4, 24),
(37, 'Nazrul Islam', 'Male', '1990-09-30', '01512123460', 'nazrul.islam@hrms.com', 'Rajshahi', '2018-05-20', 5, 25),
(38, 'Sadia Anjum', 'Female', '1994-07-07', '01712123461', 'sadia.anjum@hrms.com', 'Barisal', '2022-02-15', 6, 26),
(39, 'Rokibul Haque', 'Male', '1988-10-12', '01812123462', 'rokibul.haque@hrms.com', 'Rangpur', '2017-11-05', 7, 27),
(40, 'Salma Begum', 'Female', '1992-12-25', '01912123463', 'salma.begum@hrms.com', 'Mymensingh', '2016-06-18', 8, 28),
(41, 'Tanvir Khan', 'Male', '1985-05-15', '01612123464', 'tanvir.khan@hrms.com', 'Comilla', '2015-03-30', 9, 29),
(42, 'Fahim Rahman', 'Male', '1996-01-20', '01512123465', 'fahim.rahman@hrms.com', 'Gazipur', '2023-01-10', 10, 30);

-- --------------------------------------------------------

--
-- Table structure for table `LeaveApplication`
--

CREATE TABLE `LeaveApplication` (
  `LeaveID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `LeaveStartDate` date DEFAULT NULL,
  `LeaveEndDate` date DEFAULT NULL,
  `Reason` text DEFAULT NULL,
  `Status` enum('Pending','Approved','Rejected') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `LeaveApplication`
--

INSERT INTO `LeaveApplication` (`LeaveID`, `EmployeeID`, `LeaveStartDate`, `LeaveEndDate`, `Reason`, `Status`) VALUES
(1, 1, '2023-01-08', '2023-01-29', 'Personal Leave', 'Approved'),
(2, 2, '2023-01-20', '2023-01-30', 'Personal Leave', 'Approved'),
(3, 3, '2023-01-09', '2023-02-08', 'Personal Leave', 'Pending'),
(4, 4, '2023-01-20', '2023-02-06', 'Personal Leave', 'Approved'),
(5, 5, '2023-01-14', '2023-01-17', 'Personal Leave', 'Rejected'),
(6, 8, '2023-01-25', '2023-01-22', 'Personal Leave', 'Approved'),
(7, 6, '2023-01-18', '2023-01-16', 'Personal Leave', 'Approved'),
(8, 9, '2023-01-04', '2023-01-25', 'Personal Leave', 'Pending'),
(9, 7, '2023-01-19', '2023-01-19', 'Personal Leave', 'Rejected'),
(10, 10, '2023-01-04', '2023-01-14', 'Personal Leave', 'Approved'),
(16, 1, '2025-01-10', '2025-01-15', 'Medical', 'Approved'),
(17, 2, '2025-02-01', '2025-02-05', 'Vacation', 'Pending'),
(18, 3, '2025-03-05', '2025-03-07', 'Family Emergency', 'Rejected'),
(19, 4, '2025-04-01', '2025-04-03', 'Training', 'Approved'),
(20, 5, '2025-05-10', '2025-05-12', 'Personal', 'Pending'),
(21, 6, '2025-06-20', '2025-06-25', 'Medical', 'Approved'),
(22, 7, '2025-07-15', '2025-07-17', 'Vacation', 'Rejected'),
(23, 8, '2025-08-01', '2025-08-05', 'Family Emergency', 'Pending'),
(24, 9, '2025-09-10', '2025-09-15', 'Training', 'Approved'),
(25, 10, '2025-10-20', '2025-10-22', 'Medical', 'Rejected'),
(26, 1, '2025-01-10', '2025-01-15', 'Medical', 'Approved'),
(27, 2, '2025-02-01', '2025-02-05', 'Vacation', 'Pending'),
(28, 3, '2025-03-05', '2025-03-07', 'Family Emergency', 'Rejected'),
(29, 4, '2025-04-01', '2025-04-03', 'Training', 'Approved'),
(30, 5, '2025-05-10', '2025-05-12', 'Personal', 'Pending'),
(31, 6, '2025-06-20', '2025-06-25', 'Medical', 'Approved'),
(32, 7, '2025-07-15', '2025-07-17', 'Vacation', 'Rejected'),
(33, 8, '2025-08-01', '2025-08-05', 'Family Emergency', 'Pending'),
(34, 9, '2025-09-10', '2025-09-15', 'Training', 'Approved'),
(35, 10, '2025-10-20', '2025-10-22', 'Medical', 'Rejected'),
(36, 1, '2025-01-10', '2025-01-15', 'Medical', 'Approved'),
(37, 2, '2025-02-01', '2025-02-05', 'Vacation', 'Pending'),
(38, 3, '2025-03-05', '2025-03-07', 'Family Emergency', 'Rejected'),
(39, 4, '2025-04-01', '2025-04-03', 'Training', 'Approved'),
(40, 5, '2025-05-10', '2025-05-12', 'Personal', 'Pending'),
(41, 6, '2025-06-20', '2025-06-25', 'Medical', 'Approved'),
(42, 7, '2025-07-15', '2025-07-17', 'Vacation', 'Rejected'),
(43, 8, '2025-08-01', '2025-08-05', 'Family Emergency', 'Pending'),
(44, 9, '2025-09-10', '2025-09-15', 'Training', 'Approved'),
(45, 10, '2025-10-20', '2025-10-22', 'Medical', 'Rejected');

-- --------------------------------------------------------

--
-- Table structure for table `Salary`
--

CREATE TABLE `Salary` (
  `SalaryID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `BasicSalary` decimal(10,2) DEFAULT NULL,
  `Allowance` decimal(10,2) DEFAULT NULL,
  `Deductions` decimal(10,2) DEFAULT NULL,
  `NetSalary` decimal(10,2) GENERATED ALWAYS AS (`BasicSalary` + `Allowance` - `Deductions`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Salary`
--

INSERT INTO `Salary` (`SalaryID`, `EmployeeID`, `BasicSalary`, `Allowance`, `Deductions`) VALUES
(1, 1, 45200.00, 14959.00, 2519.00),
(2, 2, 38432.00, 10348.00, 125.00),
(3, 3, 54165.00, 13955.00, 1995.00),
(4, 4, 55560.00, 6997.00, 244.00),
(5, 5, 62361.00, 13002.00, 1722.00),
(6, 8, 48803.00, 11278.00, 2187.00),
(7, 6, 60475.00, 11221.00, 2475.00),
(8, 9, 40356.00, 13193.00, 960.00),
(9, 7, 35695.00, 12516.00, 993.00),
(10, 10, 46044.00, 5118.00, 2567.00),
(16, 1, 45000.00, 7000.00, 2000.00),
(17, 2, 40000.00, 5000.00, 1500.00),
(18, 3, 55000.00, 10000.00, 2500.00),
(19, 4, 30000.00, 4000.00, 1000.00),
(20, 5, 60000.00, 12000.00, 3000.00),
(21, 6, 35000.00, 5000.00, 1200.00),
(22, 7, 50000.00, 9000.00, 2000.00),
(23, 8, 32000.00, 3500.00, 800.00),
(24, 9, 47000.00, 8000.00, 1900.00),
(25, 10, 38000.00, 6000.00, 1500.00),
(26, 1, 45000.00, 7000.00, 2000.00),
(27, 2, 40000.00, 5000.00, 1500.00),
(28, 3, 55000.00, 10000.00, 2500.00),
(29, 4, 30000.00, 4000.00, 1000.00),
(30, 5, 60000.00, 12000.00, 3000.00),
(31, 6, 35000.00, 5000.00, 1200.00),
(32, 7, 50000.00, 9000.00, 2000.00),
(33, 8, 32000.00, 3500.00, 800.00),
(34, 9, 47000.00, 8000.00, 1900.00),
(35, 10, 38000.00, 6000.00, 1500.00),
(36, 1, 45000.00, 7000.00, 2000.00),
(37, 2, 40000.00, 5000.00, 1500.00),
(38, 3, 55000.00, 10000.00, 2500.00),
(39, 4, 30000.00, 4000.00, 1000.00),
(40, 5, 60000.00, 12000.00, 3000.00),
(41, 6, 35000.00, 5000.00, 1200.00),
(42, 7, 50000.00, 9000.00, 2000.00),
(43, 8, 32000.00, 3500.00, 800.00),
(44, 9, 47000.00, 8000.00, 1900.00),
(45, 10, 38000.00, 6000.00, 1500.00);

-- --------------------------------------------------------

--
-- Table structure for table `Training`
--

CREATE TABLE `Training` (
  `TrainingID` int(11) NOT NULL,
  `TrainingName` varchar(100) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `TrainerName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Training`
--

INSERT INTO `Training` (`TrainingID`, `TrainingName`, `StartDate`, `EndDate`, `TrainerName`) VALUES
(1, 'Leadership Skills', '2023-03-01', '2023-03-10', 'Abdul Matin'),
(2, 'Advanced Excel', '2023-04-01', '2023-04-05', 'Sadia Rahman'),
(3, 'Data Analytics', '2023-05-01', '2023-05-10', 'Nazmul Islam'),
(4, 'Cybersecurity Basics', '2023-06-01', '2023-06-07', 'Rokeya Begum'),
(5, 'Training_38', '2023-05-30', '2023-01-16', 'Trainer_26'),
(6, 'Training_64', '2023-04-24', '2023-02-25', 'Trainer_7'),
(7, 'Training_9', '2023-01-07', '2023-07-14', 'Trainer_20'),
(8, 'Training_33', '2023-03-22', '2023-03-03', 'Trainer_41'),
(12, 'Cloud Computing', '2025-03-01', '2025-03-05', 'Anika Rahman'),
(13, 'Machine Learning', '2025-03-10', '2025-03-15', 'Shakib Khan'),
(14, 'Web Development', '2025-04-01', '2025-04-05', 'Fahim Hasan'),
(15, 'DevOps Practices', '2025-04-10', '2025-04-14', 'Rakibul Islam'),
(16, 'Soft Skills', '2025-05-01', '2025-05-03', 'Nargis Ahmed'),
(17, 'Critical Thinking', '2025-06-01', '2025-06-02', 'Samira Hossain'),
(18, 'Python Advanced', '2025-07-01', '2025-07-07', 'Tanvir Alam'),
(19, 'Data Visualization', '2025-08-01', '2025-08-06', 'Sadia Karim'),
(20, 'AI Ethics', '2025-09-01', '2025-09-03', 'Parvez Rahman'),
(21, 'Blockchain Basics', '2025-10-01', '2025-10-04', 'Farhan Ali'),
(22, 'Cloud Computing', '2025-03-01', '2025-03-05', 'Anika Rahman'),
(23, 'Machine Learning', '2025-03-10', '2025-03-15', 'Shakib Khan'),
(24, 'Web Development', '2025-04-01', '2025-04-05', 'Fahim Hasan'),
(25, 'DevOps Practices', '2025-04-10', '2025-04-14', 'Rakibul Islam'),
(26, 'Soft Skills', '2025-05-01', '2025-05-03', 'Nargis Ahmed'),
(27, 'Critical Thinking', '2025-06-01', '2025-06-02', 'Samira Hossain'),
(28, 'Python Advanced', '2025-07-01', '2025-07-07', 'Tanvir Alam'),
(29, 'Data Visualization', '2025-08-01', '2025-08-06', 'Sadia Karim'),
(30, 'AI Ethics', '2025-09-01', '2025-09-03', 'Parvez Rahman'),
(31, 'Blockchain Basics', '2025-10-01', '2025-10-04', 'Farhan Ali'),
(32, 'Cloud Computing', '2025-03-01', '2025-03-05', 'Anika Rahman'),
(33, 'Machine Learning', '2025-03-10', '2025-03-15', 'Shakib Khan'),
(34, 'Web Development', '2025-04-01', '2025-04-05', 'Fahim Hasan'),
(35, 'DevOps Practices', '2025-04-10', '2025-04-14', 'Rakibul Islam'),
(36, 'Soft Skills', '2025-05-01', '2025-05-03', 'Nargis Ahmed'),
(37, 'Critical Thinking', '2025-06-01', '2025-06-02', 'Samira Hossain'),
(38, 'Python Advanced', '2025-07-01', '2025-07-07', 'Tanvir Alam'),
(39, 'Data Visualization', '2025-08-01', '2025-08-06', 'Sadia Karim'),
(40, 'AI Ethics', '2025-09-01', '2025-09-03', 'Parvez Rahman'),
(41, 'Blockchain Basics', '2025-10-01', '2025-10-04', 'Farhan Ali'),
(42, 'AI Ethics', '2025-09-01', '2025-09-03', 'Parvez Rahman'),
(43, 'Blockchain Basics', '2025-10-01', '2025-10-04', 'Farhan Ali');

-- --------------------------------------------------------

--
-- Table structure for table `TrainingAssignment`
--

CREATE TABLE `TrainingAssignment` (
  `TrainingAssignmentID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `TrainingID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `TrainingAssignment`
--

INSERT INTO `TrainingAssignment` (`TrainingAssignmentID`, `EmployeeID`, `TrainingID`) VALUES
(1, 1, 1),
(2, 1, 6),
(3, 2, 2),
(4, 2, 7),
(5, 3, 3),
(6, 3, 8),
(7, 4, 4),
(8, 5, 5),
(9, 8, 3),
(10, 8, 8),
(11, 6, 1),
(12, 6, 6),
(13, 9, 4),
(14, 7, 2),
(15, 7, 7),
(16, 10, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Attendance`
--
ALTER TABLE `Attendance`
  ADD PRIMARY KEY (`AttendanceID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `Designation`
--
ALTER TABLE `Designation`
  ADD PRIMARY KEY (`DesignationID`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `DepartmentID` (`DepartmentID`),
  ADD KEY `DesignationID` (`DesignationID`);

--
-- Indexes for table `LeaveApplication`
--
ALTER TABLE `LeaveApplication`
  ADD PRIMARY KEY (`LeaveID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `Salary`
--
ALTER TABLE `Salary`
  ADD PRIMARY KEY (`SalaryID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `Training`
--
ALTER TABLE `Training`
  ADD PRIMARY KEY (`TrainingID`);

--
-- Indexes for table `TrainingAssignment`
--
ALTER TABLE `TrainingAssignment`
  ADD PRIMARY KEY (`TrainingAssignmentID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `TrainingID` (`TrainingID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Attendance`
--
ALTER TABLE `Attendance`
  MODIFY `AttendanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `Department`
--
ALTER TABLE `Department`
  MODIFY `DepartmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `Designation`
--
ALTER TABLE `Designation`
  MODIFY `DesignationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `LeaveApplication`
--
ALTER TABLE `LeaveApplication`
  MODIFY `LeaveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `Salary`
--
ALTER TABLE `Salary`
  MODIFY `SalaryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `Training`
--
ALTER TABLE `Training`
  MODIFY `TrainingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `TrainingAssignment`
--
ALTER TABLE `TrainingAssignment`
  MODIFY `TrainingAssignmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Attendance`
--
ALTER TABLE `Attendance`
  ADD CONSTRAINT `Attendance_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`);

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `Department` (`DepartmentID`),
  ADD CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`DesignationID`) REFERENCES `Designation` (`DesignationID`);

--
-- Constraints for table `LeaveApplication`
--
ALTER TABLE `LeaveApplication`
  ADD CONSTRAINT `LeaveApplication_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`);

--
-- Constraints for table `Salary`
--
ALTER TABLE `Salary`
  ADD CONSTRAINT `Salary_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`);

--
-- Constraints for table `TrainingAssignment`
--
ALTER TABLE `TrainingAssignment`
  ADD CONSTRAINT `TrainingAssignment_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`),
  ADD CONSTRAINT `TrainingAssignment_ibfk_2` FOREIGN KEY (`TrainingID`) REFERENCES `Training` (`TrainingID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
