-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 14, 2024 at 01:57 AM
-- Server version: 8.0.39
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rfid_attendance_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `rfid` bigint NOT NULL,
  `day` int NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `time` varchar(32) NOT NULL,
  `type` int NOT NULL,
  KEY `rfid` (`rfid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`rfid`, `day`, `month`, `year`, `time`, `type`) VALUES
(172210482, 13, 9, 2024, '21:55', 1),
(1792045114, 13, 9, 2024, '21:55', 1),
(172210482, 13, 9, 2024, '22:20', 0),
(1792045114, 13, 9, 2024, '22:30', 0),
(172210482, 14, 9, 2024, '08:30', 1),
(1792045114, 14, 9, 2024, '08:38', 1),
(172210482, 14, 9, 2024, '18:36', 0),
(1792045114, 14, 9, 2024, '18:37', 0),
(172210482, 15, 9, 2024, '07:19', 1),
(1792045114, 15, 9, 2024, '07:19', 1),
(172210482, 15, 9, 2024, '16:44', 0),
(1792045114, 15, 9, 2024, '20:17', 0),
(1792045114, 16, 9, 2024, '22:50', 1),
(1792045114, 16, 9, 2024, '22:51', 0),
(172210482, 16, 9, 2024, '22:51', 1),
(172210482, 16, 9, 2024, '22:51', 0);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `abbr` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`, `abbr`) VALUES
(1, 'Bachelor of Science In Computer Science', 'BSCS'),
(2, 'Bachelor of Science In Information Technology', 'BSIT'),
(3, 'Bachelor of Science in Information Security', 'BSIS');

-- --------------------------------------------------------

--
-- Table structure for table `nstp_course`
--

DROP TABLE IF EXISTS `nstp_course`;
CREATE TABLE IF NOT EXISTS `nstp_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `abbr` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nstp_course`
--

INSERT INTO `nstp_course` (`id`, `name`, `abbr`) VALUES
(1, 'Reserve Officers Training Corps', 'ROTC'),
(2, 'Civic Welfare Training Service', 'CWTS'),
(3, 'Literacy Training Service', 'LTS');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `rfid` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `fname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bday` int NOT NULL,
  `bmonth` int NOT NULL,
  `byear` int NOT NULL,
  `gender` int NOT NULL,
  `courseID` int NOT NULL,
  `nstpID` int UNSIGNED NOT NULL,
  PRIMARY KEY (`rfid`),
  KEY `courseID` (`courseID`),
  KEY `nstpID` (`nstpID`)
) ENGINE=MyISAM AUTO_INCREMENT=4292717312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`rfid`, `fname`, `mname`, `lname`, `bday`, `bmonth`, `byear`, `gender`, `courseID`, `nstpID`) VALUES
(255, 'Juan', 'Monexus', 'Dela Cruz', 1, 1, 1969, 1, 0, 1),
(2899456002, 'Lloyd Jay', 'Arpilleda', 'Edradan', 20, 2, 2002, 1, 1, 1),
(3016504078, 'Honey Lynn', 'Arpilleda', 'Edradan', 4, 7, 2003, 0, 1, 1),
(4292717311, 'Vladimir', 'Dofensmirt', 'Putin', 17, 7, 1986, 0, 3, 1),
(2863311615, 'Lydian', 'Cubillan', 'Arpilleda', 20, 2, 2002, 1, 1, 1),
(1, 'Sam Mckimley', 'Monexus', 'Juanite', 16, 9, 1999, 1, 3, 1),
(30165078, 'Nexus', 'Gaming', 'Test', 1, 1, 1969, 1, 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
