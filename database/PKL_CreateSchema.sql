-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 26, 2015 at 07:29 PM
-- Server version: 5.5.42-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `PlayRightAnalyticsTcs`
--

-- --------------------------------------------------------

--
-- Table structure for table `list_of_values`
--

CREATE TABLE IF NOT EXISTS `list_of_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_type` varchar(255) NOT NULL,
  `list_name` varchar(255) NOT NULL,
  `list_value` varchar(255) NOT NULL,
  `is_deleted` varchar(8) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `list_of_values`
--

INSERT INTO `list_of_values` (`id`, `list_type`, `list_name`, `list_value`, `is_deleted`) VALUES
(1, 'JOURNALIST_FACTOR', '1', 'Editor', 'N'),
(2, 'JOURNALIST_FACTOR', '2', 'Reporter', 'N'),
(3, 'JOURNALIST_FACTOR', '3', 'Special Correspondent', 'N'),
(4, 'JOURNALIST_FACTOR', '4', 'Bureau', 'N'),
(5, 'JOURNALIST_FACTOR', '5', 'PTI copy', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `pr_cvg_data`
--

CREATE TABLE IF NOT EXISTS `pr_cvg_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `News_Date` date DEFAULT NULL,
  `Newspaper` varchar(255) DEFAULT NULL,
  `Headline` varchar(255) DEFAULT NULL,
  `Edition` varchar(255) DEFAULT NULL,
  `Supplement` varchar(255) DEFAULT NULL,
  `Source` varchar(255) DEFAULT NULL,
  `Page_No` int(11) DEFAULT '0',
  `Height` int(11) DEFAULT '0',
  `Width` int(11) DEFAULT '0',
  `Total_Article_Size` int(11) DEFAULT '0',
  `Circulation_Figure` int(11) DEFAULT '0',
  `Quantitative_AVE` decimal(12,2) DEFAULT NULL,
  `Image_Exists` varchar(5) DEFAULT NULL,
  `Journalist_Factor` int(11) NOT NULL,
  `Language` varchar(255) DEFAULT NULL,
  `Image` mediumblob,
  `image_filename` varchar(255) DEFAULT NULL,
  `image_type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Page_No_index` (`Page_No`),
  KEY `Height_index` (`Height`),
  KEY `Width_index` (`Width`),
  KEY `Total_Article_Size_index` (`Total_Article_Size`),
  KEY `Circulation_Figure_index` (`Circulation_Figure`),
  KEY `Journalist_Factor_index` (`Journalist_Factor`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pr_entity_matrix`
--

CREATE TABLE IF NOT EXISTS `pr_entity_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Commodity` varchar(255) NOT NULL,
  `Headline` int(11) DEFAULT '0',
  `Image` int(11) DEFAULT '0',
  `Article` int(11) DEFAULT '0',
  `Journalist_Factor` int(11) DEFAULT '0',
  `pr_cvg_data_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Headline_index` (`Headline`),
  KEY `Image_index` (`Image`),
  KEY `Article_index` (`Article`),
  KEY `Journalist_Factor_index` (`Journalist_Factor`),
  KEY `FK_COV_DATA_ID_idx` (`pr_cvg_data_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pr_keyword`
--

CREATE TABLE IF NOT EXISTS `pr_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL,
  `is_deleted` varchar(255) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pr_settings`
--

CREATE TABLE IF NOT EXISTS `pr_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `pr_settings`
--

INSERT INTO `pr_settings` (`id`, `name`, `value`, `status`) VALUES
(1, 'FACTOR_HEADLINE', '5', 'A'),
(2, 'FACTOR_IMAGE', '7', 'A'),
(3, 'FACTOR_ARTICLE', '2', 'A'),
(4, 'EMAIL_HOST', 'smtp.gmail.com', 'A'),
(5, 'EMAIL_PORT', '587', 'A'),
(6, 'EMAIL_FROM', 'analytics@playright.in', 'A'),
(7, 'EMAIL_PASSWORD', 'PlayR1ght', 'A'),
(8, 'SYS_CUSTOMER', 'Pro Kabaddi League 2015', 'A'),
(9, 'CHART_COLORS', '#EB7013,#CCCCCC,#24822C', 'A'),
(10, 'SYS_CUSTOMER_CODE', 'PKL', 'A'),
(11, 'RCB_CHART_COLORS', '#e74c3c,#f1c40f,#c0392b', 'I');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `First_Name` varchar(255) DEFAULT NULL,
  `Address1` varchar(255) DEFAULT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `Address3` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `Zip` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `user_id`, `Last_Name`, `First_Name`, `Address1`, `Address2`, `Address3`, `City`, `State`, `Zip`, `Country`, `email`, `phone`, `password`) VALUES
(1, 'playright', 'PlayRight', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'analytics@playright.in', NULL, 'play123');


--
-- Constraints for dumped tables
--

--
-- Constraints for table `pr_entity_matrix`
--
ALTER TABLE `pr_entity_matrix`
  ADD CONSTRAINT `FK_COV_DATA_ID` FOREIGN KEY (`pr_cvg_data_id`) REFERENCES `pr_cvg_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
