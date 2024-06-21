-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 04, 2016 at 01:11 PM
-- Server version: 5.5.49
-- PHP Version: 5.3.10-1ubuntu3.23

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bawcom_union`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` bigint(200) NOT NULL,
  `u_name` varchar(255) NOT NULL DEFAULT '',
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `u_name`, `pwd`) VALUES
(0, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `admin_id` bigint(200) NOT NULL,
  `id` int(11) NOT NULL,
  `cat_type` varchar(255) DEFAULT NULL,
  `i_name` varchar(255) NOT NULL DEFAULT '',
  `i_price` varchar(255) DEFAULT NULL,
  `i_quantity` varchar(255) DEFAULT NULL,
  `i_pic` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`i_name`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`admin_id`, `id`, `cat_type`, `i_name`, `i_price`, `i_quantity`, `i_pic`) VALUES
(0, 0, 'Vegetarian', 'Burger', '20', '4', 'burger.jpg'),
(0, 0, 'Non Vegetarian', 'Sandwitch', '30', '5', '3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE IF NOT EXISTS `contactus` (
  `admin_id` bigint(200) NOT NULL,
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) DEFAULT NULL,
  `c_email` varchar(255) DEFAULT NULL,
  `c_mobile` varchar(255) DEFAULT NULL,
  `c_msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`admin_id`, `c_id`, `c_name`, `c_email`, `c_mobile`, `c_msg`) VALUES
(0, 1, 'sai', 'sai@gmail.com', '222323121212', 'hi'),
(0, 2, 'sai', 'sai@gmail.com', '323232332', 'Hi');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE IF NOT EXISTS `orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Order_id` int(255) DEFAULT NULL,
  `Std_id` int(255) DEFAULT NULL,
  `i_pic` varchar(2000) DEFAULT NULL,
  `i_type` varchar(255) DEFAULT NULL,
  `i_name` varchar(255) DEFAULT NULL,
  `i_price` varchar(255) DEFAULT NULL,
  `i_quantity` varchar(255) DEFAULT NULL,
  `timeanddate` varchar(255) DEFAULT NULL,
  `confirmtime` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `item_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `std_id` (`Std_id`),
  KEY `Order_id` (`Order_id`),
  KEY `orderdetails_ibfk_3` (`i_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `Order_id`, `Std_id`, `i_pic`, `i_type`, `i_name`, `i_price`, `i_quantity`, `timeanddate`, `confirmtime`, `status`, `item_status`) VALUES
(1, 43619, 654321, 'burger.jpg', 'Vegetarian', 'Burger', '20', '1', 'Tue Sep 27 23:04:32 IST 2016', 'Not Ready', 'Pending', 'Clear'),
(2, 87868, 654321, 'burger.jpg', 'Vegetarian', 'Burger', '20', '1', 'Tue Sep 27 23:06:11 IST 2016', 'Not Ready', 'Pending', 'Clear'),
(3, 53484, 654321, '3.jpg', 'Non Vegetarian', 'Sandwitch', '30', '1', 'Tue Sep 27 23:50:30 IST 2016', 'Not Ready', 'Pending', 'Clear'),
(4, 28186, 654321, '3.jpg', 'Non Vegetarian', 'Sandwitch', '30', '1', 'Tue Sep 27 23:53:37 IST 2016', 'Not Ready', 'Pending', 'Clear'),
(5, 77929, 654321, '3.jpg', 'Non Vegetarian', 'Sandwitch', '30', '1', 'Tue Sep 27 23:56:26 IST 2016', 'Not Ready', 'Pending', 'Clear'),
(6, 93355, 654321, 'burger.jpg', 'Vegetarian', 'Burger', '20', '1', 'Wed Sep 28 00:25:45 IST 2016', 'Not Ready', 'Pending', 'Clear'),
(7, 87620, 654321, '3.jpg', 'Non Vegetarian', 'Sandwitch', '30', '1', 'Wed Sep 28 00:30:13 IST 2016', 'Not Ready', 'Pending', 'Clear'),
(8, 2609, 654321, 'burger.jpg', 'Vegetarian', 'Burger', '20', '1', 'Wed Sep 28 00:30:19 IST 2016', 'Not Ready', 'Pending', 'Clear'),
(9, 5622, 12345, '3.jpg', 'Non Vegetarian', 'Sandwitch', '30', '1', 'Wed Sep 28 23:20:25 IST 2016', 'Not Ready', 'Pending', 'Clear');

-- --------------------------------------------------------

--
-- Table structure for table `orderhistory`
--

CREATE TABLE IF NOT EXISTS `orderhistory` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `Order_id` int(255) DEFAULT NULL,
  `Std_id` int(255) DEFAULT NULL,
  `i_pic` varchar(2000) DEFAULT NULL,
  `i_type` varchar(255) DEFAULT NULL,
  `i_name` varchar(255) DEFAULT NULL,
  `i_price` varchar(255) DEFAULT NULL,
  `i_quantity` varchar(255) DEFAULT NULL,
  `timeanddate` varchar(255) DEFAULT NULL,
  `confirmtime` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `item_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  KEY `orderdetails_ibfk_4` (`i_name`),
  KEY `std_id` (`Std_id`),
  KEY `orderdetails_ibfk_2` (`Order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `orderhistory`
--

INSERT INTO `orderhistory` (`o_id`, `Order_id`, `Std_id`, `i_pic`, `i_type`, `i_name`, `i_price`, `i_quantity`, `timeanddate`, `confirmtime`, `status`, `item_status`) VALUES
(1, 43619, 654321, 'burger.jpg', 'Vegetarian', 'Burger', '20', '1', 'Tue Sep 27 23:04:32 IST 2016', 'Wed Sep 28 00:10:47 IST 2016', 'Ready', 'Que'),
(2, 43619, 654321, 'burger.jpg', 'Vegetarian', 'Burger', '20', '1', 'Tue Sep 27 23:04:32 IST 2016', 'Wed Sep 28 00:10:47 IST 2016', 'Ready', 'Clear'),
(3, 87868, 654321, 'burger.jpg', 'Vegetarian', 'Burger', '20', '1', 'Tue Sep 27 23:06:11 IST 2016', 'Wed Sep 28 00:10:53 IST 2016', 'Ready', 'Que'),
(5, 43619, 654321, 'burger.jpg', 'Vegetarian', 'Burger', '20', '1', 'Tue Sep 27 23:04:32 IST 2016', 'Wed Sep 28 00:10:47 IST 2016', 'Ready', 'Clear'),
(6, 87868, 654321, 'burger.jpg', 'Vegetarian', 'Burger', '20', '1', 'Tue Sep 27 23:06:11 IST 2016', 'Wed Sep 28 00:10:53 IST 2016', 'Ready', 'Clear'),
(7, 53484, 654321, '3.jpg', 'Non Vegetarian', 'Sandwitch', '30', '1', 'Tue Sep 27 23:50:30 IST 2016', 'Wed Sep 28 00:10:58 IST 2016', 'Ready', 'Que'),
(8, 28186, 654321, '3.jpg', 'Non Vegetarian', 'Sandwitch', '30', '1', 'Tue Sep 27 23:53:37 IST 2016', 'Wed Sep 28 00:11:05 IST 2016', 'Ready', 'Que'),
(12, 43619, 654321, 'burger.jpg', 'Vegetarian', 'Burger', '20', '1', 'Tue Sep 27 23:04:32 IST 2016', 'Wed Sep 28 00:10:47 IST 2016', 'Ready', 'Clear'),
(13, 87868, 654321, 'burger.jpg', 'Vegetarian', 'Burger', '20', '1', 'Tue Sep 27 23:06:11 IST 2016', 'Wed Sep 28 00:10:53 IST 2016', 'Ready', 'Clear'),
(14, 53484, 654321, '3.jpg', 'Non Vegetarian', 'Sandwitch', '30', '1', 'Tue Sep 27 23:50:30 IST 2016', 'Wed Sep 28 00:10:58 IST 2016', 'Ready', 'Clear'),
(15, 28186, 654321, '3.jpg', 'Non Vegetarian', 'Sandwitch', '30', '1', 'Tue Sep 27 23:53:37 IST 2016', 'Wed Sep 28 00:11:05 IST 2016', 'Ready', 'Clear'),
(16, 77929, 654321, '3.jpg', 'Non Vegetarian', 'Sandwitch', '30', '1', 'Tue Sep 27 23:56:26 IST 2016', 'Wed Sep 28 00:11:11 IST 2016', 'Ready', 'Que'),
(19, 93355, 654321, 'burger.jpg', 'Vegetarian', 'Burger', '20', '1', 'Wed Sep 28 00:25:45 IST 2016', 'Wed Sep 28 00:31:12 IST 2016', 'Ready', 'Que'),
(20, 87620, 654321, '3.jpg', 'Non Vegetarian', 'Sandwitch', '30', '1', 'Wed Sep 28 00:30:13 IST 2016', 'Wed Sep 28 00:31:18 IST 2016', 'Ready', 'Que'),
(21, 2609, 654321, 'burger.jpg', 'Vegetarian', 'Burger', '20', '1', 'Wed Sep 28 00:30:19 IST 2016', 'Wed Sep 28 00:31:24 IST 2016', 'Ready', 'Que'),
(22, 5622, 12345, '3.jpg', 'Non Vegetarian', 'Sandwitch', '30', '1', 'Wed Sep 28 23:20:25 IST 2016', 'Wed Sep 28 23:25:38 IST 2016', 'Ready', 'Que');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `exp` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `std_id` int(11) DEFAULT NULL,
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pay_id`),
  KEY `payment` (`std_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `amount`, `name`, `card`, `exp`, `cvv`, `std_id`, `pay_id`) VALUES
(0, '20', 'Master Card', '2134567', '12/21', '121', 654321, 3),
(0, '20', 'Master Card', '76895432', '3/32', '323', 654321, 4),
(0, '20', 'VISA', '123456789', '2/34', '343', 654321, 5),
(0, '20', 'Master Card', '123456789', '2/34', '343', 654321, 6),
(0, '40', 'Master Card', '576576576', '3/23', '121', 654321, 7),
(0, '40', 'Master Card', '576576576', '3/23', '121', 654321, 8),
(0, '20', 'VISA', '576576765', '4/43', '443', 654321, 9),
(0, '20', 'Master Card', '675849043', '3/43', '234', 654321, 13),
(0, '20', 'Master Card', '1234567890', '4/24', '236', 654321, 14),
(0, '20', 'VISA', '2345678', '2/23', '897', 654321, 15),
(0, '20', 'VISA', '2345678', '2/23', '897', 654321, 16),
(0, '20', 'VISA', '2345678', '2/23', '897', 654321, 17),
(0, '20', 'VISA', '2345678', '2/23', '897', 654321, 18),
(0, '20', 'VISA', '2345678', '2/23', '897', 654321, 19),
(0, '20', 'VISA', '2345678', '2/23', '897', 654321, 20),
(0, '20', 'VISA', '2345678', '2/23', '897', 654321, 21),
(0, '20', 'Master Card', '45678899', '2/32', '987', 654321, 22),
(0, '20', 'Master Card', '765765', '3/32', '987', 654321, 23),
(0, '20', 'Mastro Card', '757865765', '6/18', '222', 654321, 24),
(0, '20', 'Mastro Card', '757865765', '6/18', '222', 654321, 25),
(0, '20', 'American Express', '465465476', '2/23', '232', 654321, 26),
(0, '20', 'American Express', '465465476', '2/23', '232', 654321, 27),
(0, '60', 'Master Card', '757657657', '8/23', '121', 654321, 28),
(0, '30', 'Master Card', '465465465', '7/32', '678', 654321, 29),
(0, '20', 'Master Card', '457657657', '2/23', '898', 654321, 30),
(0, '50', 'Master Card', '76547657', '5/25', '231', 654321, 31),
(0, '30', 'Mastro Card', '1234567', '4/23', '777', 12345, 32);

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE IF NOT EXISTS `receipt` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(255) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `items` varchar(255) DEFAULT NULL,
  `day` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`r_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `receipt`
--

INSERT INTO `receipt` (`r_id`, `student_id`, `amount`, `items`, `day`) VALUES
(2, 654321, '20', '[Burger, 1, 20]', 'Tue Sep 27 16:34:29 IST 2016'),
(3, 654321, '20', '[Burger, 1, 20]', 'Tue Sep 27 16:42:36 IST 2016'),
(4, 654321, '20', '[Burger, 1, 20]', 'Tue Sep 27 16:44:00 IST 2016'),
(6, 654321, '20', '[Burger, 1, 20]', 'Tue Sep 27 16:57:01 IST 2016'),
(7, 654321, '20', '[Burger, 1, 20]', 'Tue Sep 27 21:27:05 IST 2016'),
(8, 654321, '20', '[Burger, 1, 20]', 'Tue Sep 27 23:02:33 IST 2016'),
(9, 654321, '20', '[Burger, 1, 20]', 'Tue Sep 27 23:04:51 IST 2016'),
(10, 654321, '20', '[Burger, 1, 20]', 'Tue Sep 27 23:20:20 IST 2016'),
(11, 654321, '60', '[Sandwitch, 1, 30, Sandwitch, 1, 30]', 'Tue Sep 27 23:53:58 IST 2016'),
(12, 654321, '30', '[Sandwitch, 1, 30]', 'Tue Sep 27 23:56:53 IST 2016'),
(13, 654321, '20', '[Burger, 1, 20]', 'Wed Sep 28 00:28:44 IST 2016'),
(14, 654321, '50', '[Sandwitch, 1, 30, Burger, 1, 20]', 'Wed Sep 28 00:30:41 IST 2016'),
(15, 12345, '30', '[Sandwitch, 1, 30]', 'Wed Sep 28 23:23:02 IST 2016');

-- --------------------------------------------------------

--
-- Table structure for table `student_register`
--

CREATE TABLE IF NOT EXISTS `student_register` (
  `std_id` int(11) NOT NULL,
  `admin_id` bigint(200) NOT NULL,
  `std_pwd` varchar(255) DEFAULT NULL,
  `std_email` varchar(255) DEFAULT NULL,
  `std_number` varchar(255) DEFAULT NULL,
  `std_addrs` varchar(3000) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`std_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_register`
--

INSERT INTO `student_register` (`std_id`, `admin_id`, `std_pwd`, `std_email`, `std_number`, `std_addrs`, `status`) VALUES
(123, 0, '123', 'test@gmail.com', '12323242423', 'UK', 'Student Unlocked'),
(12345, 0, '12345', 'sreekanth.g.574@gmail.com', '9876543210', 'USA', 'Student Unlocked'),
(123456, 0, '123456', 'sreekanth.g.574@gmail.com', '9876543210', 'USA', 'Student Unlocked'),
(654321, 0, '654321', 'sreekanth.g.574@gmail.com', '9876543210', 'UK', 'Student Unlocked');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`);

--
-- Constraints for table `contactus`
--
ALTER TABLE `contactus`
  ADD CONSTRAINT `contactus_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`Std_id`) REFERENCES `student_register` (`std_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_3` FOREIGN KEY (`i_name`) REFERENCES `categories` (`i_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`Order_id`) REFERENCES `orderdetails` (`Order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_4` FOREIGN KEY (`i_name`) REFERENCES `categories` (`i_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment` FOREIGN KEY (`std_id`) REFERENCES `student_register` (`std_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_register` (`std_id`);

--
-- Constraints for table `student_register`
--
ALTER TABLE `student_register`
  ADD CONSTRAINT `student_register_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
