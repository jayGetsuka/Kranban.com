-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3333
-- Generation Time: Aug 29, 2021 at 06:13 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kranban`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `AnswerID` int(5) NOT NULL,
  `TextAnswer` text NOT NULL,
  `Datetime` date NOT NULL DEFAULT current_timestamp(),
  `answerUserID` int(3) DEFAULT NULL,
  `questID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`AnswerID`, `TextAnswer`, `Datetime`, `answerUserID`, `questID`) VALUES
(30, '2', '2021-08-29', 14, 41),
(31, 'เขียนเว็บ', '2021-08-29', 14, 35),
(32, 'ไข่', '2021-08-29', 18, 45),
(33, 'คุณทำอะไีร', '2021-08-29', 18, 36);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `QtID` int(5) NOT NULL,
  `QtText` text NOT NULL,
  `QtType` varchar(100) NOT NULL,
  `Datetime` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `questUserID` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`QtID`, `QtText`, `QtType`, `Datetime`, `questUserID`) VALUES
(33, 'จะจบเมื่อไหร่', 'general', '2021-08-28 19:38:22', 10),
(35, 'python programming ใช้ทำอะไรได้บ้าง', 'technology', '2021-08-29 09:54:58', 16),
(36, 'What do you do? แปลว่าอะไร', 'english', '2021-08-29 09:55:33', 16),
(37, 'ไดโนเสาร์สูญพันธุ์ ', 'science', '2021-08-29 09:57:56', 15),
(40, 'คนที่เดินทางรอบโลกตรงไหนถึงตรงไหนถึงเรียกว่ารอบโลกคะ', 'general', '2021-08-29 10:03:08', 15),
(41, '1+1เท่ากับเท่าไหร่คะ', 'math', '2021-08-29 10:03:43', 15),
(42, 'เสียงเกิดจากอะไร\r\n', 'science', '2021-08-29 10:05:23', 15),
(43, 'มนุษย์เกิดจากอะไร', 'science', '2021-08-29 10:28:44', 14),
(45, 'ไก่กับไข่อะไรเกิดก่อนกัน', 'science', '2021-08-29 10:36:12', 18);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(3) NOT NULL,
  `Username` varchar(35) NOT NULL,
  `password` varchar(200) NOT NULL,
  `Firstname` varchar(50) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Birthday` date NOT NULL,
  `DateRegister` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `Username`, `password`, `Firstname`, `Lastname`, `Email`, `Birthday`, `DateRegister`) VALUES
(10, 'admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 'khajornsak', 'krongyut', 'khajornsak.kr.63@ubu.ac.th', '2001-08-06', '2021-07-15'),
(11, 'khajornsak', '86f5b79907df68753af514e4ebb0bd27b6f5d1d82f0780bda655a43e45f2c1ee2af671fb6aaa6540b6ff0f9fef5463853dd81cb65cbeffa2c4059a6ef66bb568', 'khajornsak', 'krongyud', 'jenoey20099@gmail.com', '2001-08-06', '2021-07-16'),
(14, 'khajornsak2544', 'e391c6266334b61a9aa6847df95dc53ce7c662528fd6b7d8074156fd5a7d81005e68973b9572aa5392f581237d5cc92024da2d63b355778569cf77a72180819a', 'khajornsak', 'krongyud', 'khajornsak.jay.01@gmail.com', '2021-08-06', '2021-08-24'),
(15, 'jxmza', 'ebe0f7e372a3d93082c1722268d4e4d7b1a6b01f900c00234f93062f892ae5796e6f7bf4f000175c28325e15a91523645034b540c64f8cb1749a7a1ce766b47c', 'Sirikanya', 'sukhum', 'sirikanya.su.63@ubu.ac.th', '2002-12-12', '2021-08-24'),
(16, 'jay2001', 'e391c6266334b61a9aa6847df95dc53ce7c662528fd6b7d8074156fd5a7d81005e68973b9572aa5392f581237d5cc92024da2d63b355778569cf77a72180819a', 'khajornsak', 'krongyud', 'jay2001@gmail.com', '2021-08-06', '2021-08-29'),
(17, 'khajornsak2544', 'e391c6266334b61a9aa6847df95dc53ce7c662528fd6b7d8074156fd5a7d81005e68973b9572aa5392f581237d5cc92024da2d63b355778569cf77a72180819a', 'khajornsak', 'krongyud', 'khajornsak@gmail.com', '2001-08-06', '2021-08-29'),
(18, 'jayjay', '3627909a29c31381a071ec27f7c9ca97726182aed29a7ddd2e54353322cfb30abb9e3a6df2ac2c20fe23436311d678564d0c8d305930575f60e2d3d048184d79', 'khajornsak', 'krongyut', 'jay@gmail.com', '2001-08-06', '2021-08-29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`AnswerID`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`QtID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `AnswerID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `QtID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
