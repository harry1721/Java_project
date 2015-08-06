-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2015 at 06:07 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `java_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `cus_details_table`
--

CREATE TABLE IF NOT EXISTS `cus_details_table` (
  `cus_Id` int(10) NOT NULL,
  `cus_name` varchar(20) NOT NULL,
  `cus_pass` varchar(10) NOT NULL,
  `cus_con` varchar(12) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cus_details_table`
--

INSERT INTO `cus_details_table` (`cus_Id`, `cus_name`, `cus_pass`, `cus_con`) VALUES
(1, 'muthu', 'mmm', '123456789'),
(2, 'hardik', 'hardik', '111111111'),
(3, 'hardikk', 'hardikk', '123456987'),
(4, 'ram', '', ''),
(5, '', '', ''),
(6, '', '', ''),
(7, '', '', ''),
(8, 'hardik', 'hardik', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `c_table`
--

CREATE TABLE IF NOT EXISTS `c_table` (
  `c_name` varchar(50) DEFAULT NULL,
  `c_address` varchar(50) DEFAULT NULL,
  `c_contact` varchar(12) DEFAULT NULL,
  `c_email` varchar(40) DEFAULT NULL,
  `c_code` int(10) NOT NULL,
  `c_hire_rem` varchar(60) DEFAULT NULL,
  `c_hire_status` int(1) DEFAULT NULL,
  `c_v_code` varchar(10) DEFAULT NULL,
  `c_hire_date` date DEFAULT '0000-00-00',
  `c_hire_time` varchar(20) DEFAULT '00:00:00',
  `c_order_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_table`
--

INSERT INTO `c_table` (`c_name`, `c_address`, `c_contact`, `c_email`, `c_code`, `c_hire_rem`, `c_hire_status`, `c_v_code`, `c_hire_date`, `c_hire_time`, `c_order_no`) VALUES
('Ganesh', 'Toronto', '2263494785', 'gan@rediffmail.com', 1, 'Picnic', 2, 'veh1', '2015-05-26', '02:30:00', 'VHIS902938292'),
('Muthu', 'Sarnia', '8888888888', 'mut@yamil.com', 2, 'tour', 1, 'MN01-2345', '2015-05-13', '02:30:00', 'VHIS--364074697'),
('Monal', 'London', '98673938', 'monal@yamil.com', 3, 'tour', 1, 'MN01-2345', '2013-05-13', '02:30:00', 'VHIS1576089978'),
('Mark', 'port huron', '5555555555', 'mark@gmail.com', 4, 'tour', 0, 'MN01-2345', '2013-05-13', '02:30:00', 'VHIS442195070'),
('Garry', 'berry', '9867393854', 'garry@yamil.com', 5, 'tour', 2, 'MN01-2345', '2013-05-13', '02:30:00', 'VHIS694175740'),
('John', 'Bramton', '92263494858', 'cust@yamil.com', 6, 'tour', 1, 'MN01-2345', '2013-05-13', '02:30:00', 'VHIS1365078865'),
('Balbir', 'Moirang Kampu', '9436258756', 'balbir.s@gmail.com', 7, 'survey', 2, 'MN01-2345', '2013-05-11', '02:30:00', 'VHIS1749643553'),
('Broendro', 'Athokpam', '8745868399', 'brojen@gmail.com', 8, 'TOur', 2, 'MN01-2345', '2013-02-05', '22:07:12', 'VHIS1124398144'),
('kamal', '233 Capel StreetUnit No. 12', '999293993939', 'harryk1721@gmail.com', 9, 'anything', 0, 'MN01-2345', '2015-11-08', '11:35:05 PM', 'VHIS347574281'),
('hardik', '233 Capel StreetUnit No. 212', '123456789', 'harryk1721@gmail.com', 10, 'fun', 0, 'MN01-2345', '2015-11-08', '11:38:14 PM', 'VHIS-1125231836');

-- --------------------------------------------------------

--
-- Stand-in structure for view `c_v_view`
--
CREATE TABLE IF NOT EXISTS `c_v_view` (
`c_name` varchar(50)
,`c_address` varchar(50)
,`c_contact` varchar(12)
,`c_email` varchar(40)
,`c_code` int(10)
,`c_hire_rem` varchar(60)
,`c_hire_status` int(1)
,`c_v_code` varchar(10)
,`c_hire_date` date
,`c_hire_time` varchar(20)
,`c_order_no` varchar(20)
,`v_name` varchar(50)
,`v_code` varchar(10)
,`v_owner` varchar(50)
,`v_owner_contact` varchar(12)
,`v_owner_email` varchar(40)
,`v_owner_address` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `new table`
--

CREATE TABLE IF NOT EXISTS `new table` (
  `a` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `u_table`
--

CREATE TABLE IF NOT EXISTS `u_table` (
  `u_name` varchar(20) NOT NULL,
  `u_passwd` varchar(60) DEFAULT NULL,
  `u_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `u_table`
--

INSERT INTO `u_table` (`u_name`, `u_passwd`, `u_type`) VALUES
('admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `v_table`
--

CREATE TABLE IF NOT EXISTS `v_table` (
  `v_name` varchar(50) DEFAULT NULL,
  `v_code` varchar(10) NOT NULL,
  `v_owner` varchar(50) DEFAULT NULL,
  `v_owner_contact` varchar(12) DEFAULT NULL,
  `v_owner_email` varchar(40) DEFAULT NULL,
  `v_owner_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `v_table`
--

INSERT INTO `v_table` (`v_name`, `v_code`, `v_owner`, `v_owner_contact`, `v_owner_email`, `v_owner_address`) VALUES
('Kia Forte', 'kia123', 'Abhinav Kohal', '5193129', 'abhi.kh@ymail.com', 'Sarnia'),
('Camry', 'MN01-2345', 'Hrdik', '2263498825', 'harry@ymail.com', 'Sarnia'),
('Mini-Bus', 'MN01-2349', 'Hardik Kulkarni', '9612789666', 'har@ymail.com', 'Sarnia'),
('WINGER', 'veh1', 'Harry', '4567891233', 'amu@gmail.com', 'Sarnia');

-- --------------------------------------------------------

--
-- Structure for view `c_v_view`
--
DROP TABLE IF EXISTS `c_v_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `c_v_view` AS select `c_table`.`c_name` AS `c_name`,`c_table`.`c_address` AS `c_address`,`c_table`.`c_contact` AS `c_contact`,`c_table`.`c_email` AS `c_email`,`c_table`.`c_code` AS `c_code`,`c_table`.`c_hire_rem` AS `c_hire_rem`,`c_table`.`c_hire_status` AS `c_hire_status`,`c_table`.`c_v_code` AS `c_v_code`,`c_table`.`c_hire_date` AS `c_hire_date`,`c_table`.`c_hire_time` AS `c_hire_time`,`c_table`.`c_order_no` AS `c_order_no`,`v_table`.`v_name` AS `v_name`,`v_table`.`v_code` AS `v_code`,`v_table`.`v_owner` AS `v_owner`,`v_table`.`v_owner_contact` AS `v_owner_contact`,`v_table`.`v_owner_email` AS `v_owner_email`,`v_table`.`v_owner_address` AS `v_owner_address` from (`c_table` join `v_table` on((`c_table`.`c_v_code` = `v_table`.`v_code`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cus_details_table`
--
ALTER TABLE `cus_details_table`
  ADD PRIMARY KEY (`cus_Id`);

--
-- Indexes for table `c_table`
--
ALTER TABLE `c_table`
  ADD KEY `c_v_code` (`c_v_code`);

--
-- Indexes for table `new table`
--
ALTER TABLE `new table`
  ADD PRIMARY KEY (`a`);

--
-- Indexes for table `u_table`
--
ALTER TABLE `u_table`
  ADD PRIMARY KEY (`u_name`);

--
-- Indexes for table `v_table`
--
ALTER TABLE `v_table`
  ADD PRIMARY KEY (`v_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cus_details_table`
--
ALTER TABLE `cus_details_table`
  MODIFY `cus_Id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `new table`
--
ALTER TABLE `new table`
  MODIFY `a` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `c_table`
--
ALTER TABLE `c_table`
ADD CONSTRAINT `c_table_ibfk_1` FOREIGN KEY (`c_v_code`) REFERENCES `v_table` (`v_code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
