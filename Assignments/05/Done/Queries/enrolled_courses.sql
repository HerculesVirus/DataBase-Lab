-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 14, 2019 at 09:42 PM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.2.15-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university`
--

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_courses`
--

CREATE TABLE `enrolled_courses` (
  `roll_no` varchar(10) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `course_grade` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolled_courses`
--

INSERT INTO `enrolled_courses` (`roll_no`, `course_code`, `course_grade`) VALUES
('P19-6015', 'cl308', NULL),
('P19-6015', 'cs202', 'A+'),
('P19-6015', 'cs205', NULL),
('P19-6015', 'cs206', NULL),
('P19-6015', 'cs302', NULL),
('P20-6005', 'cl308', NULL),
('P20-6005', 'cs201', NULL),
('P20-6005', 'cs205', NULL),
('P20-6005', 'cs211', NULL),
('P20-6005', 'cs302', NULL),
('P20-6005', 'MG108', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `enrolled_courses`
--
ALTER TABLE `enrolled_courses`
  ADD PRIMARY KEY (`roll_no`,`course_code`),
  ADD KEY `course_code` (`course_code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrolled_courses`
--
ALTER TABLE `enrolled_courses`
  ADD CONSTRAINT `enrolled_courses_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `courses` (`course_code`),
  ADD CONSTRAINT `enrolled_courses_ibfk_2` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
