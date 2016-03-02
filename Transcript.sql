-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 16, 2016 at 02:58 AM
-- Server version: 5.5.41-log
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `transcript`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `Course_Title` text NOT NULL,
  `Course_ID` varchar(255) NOT NULL,
  `Instructor_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_Title`, `Course_ID`, `Instructor_Name`) VALUES
('Band ', '101', 'Professor Wonder'),
('Yoga', '11', 'Professor Katie'),
('Health Science', '162', 'Professor Bene'),
('Psychology ', '170', 'Professor Godfrey '),
('Dancing ', '189', 'Professor Chris'),
('Advanced Drawing', '203', 'Professor Yellow'),
('Introduction to Programming I', '23', 'Professor Shan'),
('Film', '230', 'Professor Pink'),
('Database Management', '24', 'Professor Shin'),
('Monologue Class', '330', 'Professor Cool'),
('Weight Lifting', '45', 'Professor King'),
('Drawing ', '67', 'Professor McDonald'),
('Digital Design', '68', 'Professor Mitch'),
('Acting ', '78', 'Professor Swift'),
('Karate', '89', 'Professor Sheeran ');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE IF NOT EXISTS `grade` (
  `Student_ID` int(11) NOT NULL,
  `Course_ID` varchar(255) NOT NULL,
  `Grade` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`Student_ID`, `Course_ID`, `Grade`) VALUES
(1, '67', 'A'),
(2, '78', 'B+'),
(3, '68', 'C-'),
(4, '189', 'A'),
(5, '203', 'A'),
(6, '45', 'B-'),
(7, '162', 'A-'),
(8, '24', 'D'),
(9, '23', 'A'),
(10, '170', 'B+'),
(11, '230', 'A'),
(12, '330', 'A'),
(13, '11', 'B'),
(14, '45', 'A'),
(15, '89', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE IF NOT EXISTS `instructor` (
  `Instructor_Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `PhoneNumber` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`Instructor_Name`, `Location`, `PhoneNumber`) VALUES
('Professor Bene', '1 Pace Plaza', '(201)327-8920'),
('Professor Chris', '41 Park Row', '(201)387-2907'),
('Professor Cool', '1 Pace Plaza', '(201)327-5748'),
('Professor Godfrey ', '41 Park Row', '(201)333-3167'),
('Professor Katie', '163 William Street', '(201)327-3782'),
('Professor King', '41 Park Row', '(201)309-2897'),
('Professor McDonald', '41 Park Row', '(201)435-2374\r\n'),
('Professor Mitch', '41 Park Row', '(201)327-4547'),
('Professor Pink', '1 Pace Plaza', '(201)564-2738\r\n'),
('Professor Shan', '163 William Street', '(201)373-2647'),
('Professor Sheeran ', '41 Park Row', '(201)789-4674\r\n'),
('Professor Shin', '163 William Street', '(201)327-2167\r\n'),
('Professor Swift', '41 Park Row', '(201)327-7839'),
('Professor Wonder', '1 Pace Plaza', '(201)392-9203'),
('Professor Yellow', '41 Park Row', '(201)327-2839');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `Student_ID` int(11) NOT NULL,
  `Student_Name` text NOT NULL,
  `Major` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_ID`, `Student_Name`, `Major`) VALUES
(1, 'Rose Greene', 'Undecided '),
(2, 'Ann Hill', 'Computer Science'),
(3, 'Jessica Joe', 'Math'),
(4, 'Matt Perry', 'Computer Science'),
(5, 'Joe Rizzi', 'Science'),
(6, 'Jen Grey', 'Science'),
(7, 'Jodi Greene', 'Film'),
(8, 'Ashley Defeo', 'Finance'),
(9, 'Angelica Fabian', 'Marketing'),
(10, 'Christine Harry', 'Math'),
(11, 'Mike Bob', 'Computer Science'),
(12, 'Jerry Windman', 'Computer Science'),
(13, 'Mick Jagger', 'Theater'),
(14, 'Ellen DeGeneres', 'Communications '),
(15, 'Harry Styles', 'Theater');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
 ADD PRIMARY KEY (`Course_ID`), ADD UNIQUE KEY `Instructor_Name` (`Instructor_Name`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
 ADD PRIMARY KEY (`Student_ID`,`Course_ID`), ADD KEY `CourseRI` (`Course_ID`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
 ADD PRIMARY KEY (`Instructor_Name`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
 ADD PRIMARY KEY (`Student_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Instructor_Name`) REFERENCES `instructor` (`Instructor_Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
ADD CONSTRAINT `CourseRI` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `StudentRI` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
