-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2021 at 05:57 AM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flypapyrus`
--

-- --------------------------------------------------------

--
-- Table structure for table `notification_infos`
--

CREATE TABLE `notification_infos` (
  `notification_id` int(11) NOT NULL,
  `notification_date` varchar(20) NOT NULL,
  `notification_note` varchar(150) NOT NULL,
  `notification_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-unread,2-read',
  `company_id` int(11) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-live, 2-delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification_infos`
--

INSERT INTO `notification_infos` (`notification_id`, `notification_date`, `notification_note`, `notification_status`, `company_id`, `user_id`, `status`) VALUES
(0, '2021-01-13', 'Your estimate has been accepted by ', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been declined by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been declined by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been declined by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been declined by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-13', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-14', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-14', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-15', 'Your estimate has been accepted by softAmar', 1, 1, 1, 1),
(0, '2021-01-15', 'Your estimate has been declined by softAmar', 1, 1, 1, 1),
(0, '2021-01-15', 'Your estimate has been declined by softAmar', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attachments`
--

CREATE TABLE `tbl_attachments` (
  `id` bigint(12) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_attachments`
--

INSERT INTO `tbl_attachments` (`id`, `title`, `file`, `user_id`, `company_id`, `del_status`) VALUES
(2, 'Terms of Service', 'f06de681e1f6cf4a0580d02119a4bcad.pdf', 1, 1, 'Deleted'),
(3, 'Test 1', 'b6015d8ad93f5fb9efb4a63697a4e38e.pdf', 1, 1, 'Live'),
(4, 'Test 2', '0d65497f3e0f88869b66fbb1114fea67.pdf', 1, 1, 'Live'),
(5, 'tram', 'c4f6378ffc72f55df832425902b42466.pdf', 1, 1, 'Deleted'),
(6, 'tram', '24805df219ac8f256987da4f67e9fc55.pdf', 1, 1, 'Live'),
(7, 'condition', '0fa77d4542d5b13096ab5f58f61f910c.pdf', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_companies`
--

CREATE TABLE `tbl_companies` (
  `id` int(10) NOT NULL,
  `name_company_name` varchar(50) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `currency_position` varchar(50) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) DEFAULT NULL,
  `tax_setting` text,
  `email_setting` text,
  `smtp_enable_status` text,
  `precision` int(11) NOT NULL DEFAULT '2',
  `logo` varchar(50) DEFAULT NULL,
  `proposal_body` text NOT NULL,
  `invoice_email` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_companies`
--

INSERT INTO `tbl_companies` (`id`, `name_company_name`, `contact_person`, `phone`, `email`, `website`, `address`, `currency`, `currency_position`, `timezone`, `date_format`, `tax_setting`, `email_setting`, `smtp_enable_status`, `precision`, `logo`, `proposal_body`, `invoice_email`) VALUES
(1, 'Door Soft', 'Sahabir_hasan', '01812391633', 'flyperdemo@gmail.com', 'http://doorsoft.xyz', '458/A, Senpara Parbata, Kafrul', '$', 'Left', 'Asia/Dhaka', 'm/d/Y', NULL, '{\"company\":{\"id\":\"1\",\"name_company_name\":\"Door Soft\",\"contact_person\":\"Sahabir_hasan\",\"phone\":\"01812391633\",\"email\":\"flyperdemo@gmail.com\",\"website\":\"http:\\/\\/doorsoft.xyz\",\"address\":\"458\\/A, Senpara Parbata, Kafrul\",\"currency\":\"$\",\"currency_position\":\"Left\",\"timezone\":\"Asia\\/Dhaka\",\"date_format\":\"m\\/d\\/Y\",\"tax_setting\":null,\"email_setting\":\"{\\\"company\\\":{\\\"id\\\":\\\"1\\\",\\\"name_company_name\\\":\\\"Door Soft\\\",\\\"contact_person\\\":\\\"Sahabir_hasan\\\",\\\"phone\\\":\\\"01812391633\\\",\\\"email\\\":\\\"saimsahabir12it@gmail.com\\\",\\\"website\\\":\\\"http:\\\\\\/\\\\\\/doorsoft.xyz\\\",\\\"address\\\":\\\"458\\\\\\/A, Senpara Parbata, Kafrul\\\",\\\"currency\\\":\\\"$\\\",\\\"currency_position\\\":\\\"Left\\\",\\\"timezone\\\":\\\"Asia\\\\\\/Dhaka\\\",\\\"date_format\\\":\\\"m\\\\\\/d\\\\\\/Y\\\",\\\"tax_setting\\\":null,\\\"email_setting\\\":\\\"{\\\\\\\"company\\\\\\\":{\\\\\\\"id\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"name_company_name\\\\\\\":\\\\\\\"Door Soft\\\\\\\",\\\\\\\"contact_person\\\\\\\":\\\\\\\"Sahabir_hasan\\\\\\\",\\\\\\\"phone\\\\\\\":\\\\\\\"01812391633\\\\\\\",\\\\\\\"email\\\\\\\":\\\\\\\"ad.mdnazmul@gmail.com\\\\\\\",\\\\\\\"website\\\\\\\":\\\\\\\"http:\\\\\\\\\\\\\\/\\\\\\\\\\\\\\/doorsoft.xyz\\\\\\\",\\\\\\\"address\\\\\\\":\\\\\\\"458\\\\\\\\\\\\\\/A, Senpara Parbata, Kafrul\\\\\\\",\\\\\\\"currency\\\\\\\":\\\\\\\"$\\\\\\\",\\\\\\\"currency_position\\\\\\\":\\\\\\\"Left\\\\\\\",\\\\\\\"timezone\\\\\\\":\\\\\\\"Asia\\\\\\\\\\\\\\/Dhaka\\\\\\\",\\\\\\\"date_format\\\\\\\":\\\\\\\"m\\\\\\\\\\\\\\/d\\\\\\\\\\\\\\/Y\\\\\\\",\\\\\\\"tax_setting\\\\\\\":null,\\\\\\\"email_setting\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"smtp_enable_status\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"precision\\\\\\\":\\\\\\\"3\\\\\\\",\\\\\\\"logo\\\\\\\":\\\\\\\"2afd0c8c436d02b74239532db0282325.png\\\\\\\",\\\\\\\"proposal_body\\\\\\\":\\\\\\\"<p>We have a proposed pricing for [CUSTOMER_FULL_NAME]. Products\\\\\\\\\\\\\\/Services and price are enlisted below. If you have any question regarding this proposal, please let us know.<br>\\\\\\\\r\\\\\\\\nThank you!<\\\\\\\\\\\\\\/p>\\\\\\\",\\\\\\\"invoice_email\\\\\\\":\\\\\\\"<p>Dear [CUSTOMER_CONTACT_PERSON],<br>\\\\\\\\r\\\\\\\\nThank you for the opportunity to provide Products\\\\\\\\\\\\\\/Services to you.<br>\\\\\\\\r\\\\\\\\nWe have attached an invoice for you in the amount of [CURRENCY][AMOUNT] Please remit payment within [DUE_DATE].<\\\\\\\\\\\\\\/p>\\\\\\\\r\\\\\\\\n\\\\\\\\r\\\\\\\\n<p>Thanks you so much and we will see at your next service!<\\\\\\\\\\\\\\/p>\\\\\\\\r\\\\\\\\n\\\\\\\\r\\\\\\\\n<p>[COMPANY_NAME]<br>\\\\\\\\r\\\\\\\\n[COMPANY_ADDRESS]<br>\\\\\\\\r\\\\\\\\n[COMPANY_PHONE]<br>\\\\\\\\r\\\\\\\\n[COMPANY_EMAIL]<br>\\\\\\\\r\\\\\\\\n[COMPANY_WEBSITE]<\\\\\\\\\\\\\\/p>\\\\\\\"},\\\\\\\"host_name\\\\\\\":\\\\\\\"smtp.gmail.com\\\\\\\",\\\\\\\"port_address\\\\\\\":\\\\\\\"587\\\\\\\",\\\\\\\"user_name\\\\\\\":\\\\\\\"saimsahabir12it@gmail.com\\\\\\\",\\\\\\\"password\\\\\\\":\\\\\\\"cmt3sahabir\\\\\\\"}\\\",\\\"smtp_enable_status\\\":\\\"1\\\",\\\"precision\\\":\\\"3\\\",\\\"logo\\\":\\\"2afd0c8c436d02b74239532db0282325.png\\\",\\\"proposal_body\\\":\\\"<p>We have a proposed pricing for [CUSTOMER_FULL_NAME]. Products\\\\\\/Services and price are enlisted below. If you have any question regarding this proposal, please let us know.<br>\\\\r\\\\nThank you!<\\\\\\/p>\\\",\\\"invoice_email\\\":\\\"<p>Dear [CUSTOMER_CONTACT_PERSON],<br>\\\\r\\\\nThank you for the opportunity to provide Products\\\\\\/Services to you.<br>\\\\r\\\\nWe have attached an invoice for you in the amount of [CURRENCY][AMOUNT] Please remit payment within [DUE_DATE].<\\\\\\/p>\\\\r\\\\n\\\\r\\\\n<p>Thanks you so much and we will see at your next service!<\\\\\\/p>\\\\r\\\\n\\\\r\\\\n<p>[COMPANY_NAME]<br>\\\\r\\\\n[COMPANY_ADDRESS]<br>\\\\r\\\\n[COMPANY_PHONE]<br>\\\\r\\\\n[COMPANY_EMAIL]<br>\\\\r\\\\n[COMPANY_WEBSITE]<\\\\\\/p>\\\"},\\\"host_name\\\":\\\"smtp.gmail.com\\\",\\\"port_address\\\":\\\"587\\\",\\\"user_name\\\":\\\"flyperdemo@gmail.com\\\",\\\"password\\\":\\\"flyper@demo12\\\"}\",\"smtp_enable_status\":\"1\",\"precision\":\"3\",\"logo\":\"2afd0c8c436d02b74239532db0282325.png\",\"proposal_body\":\"<p>We have a proposed pricing for [CUSTOMER_FULL_NAME]. Products\\/Services and price are enlisted below. If you have any question regarding this proposal, please let us know.<br>\\r\\nThank you!<\\/p>\",\"invoice_email\":\"<p>Dear [CUSTOMER_CONTACT_PERSON],<br>\\r\\nThank you for the opportunity to provide Products\\/Services to you.<br>\\r\\nWe have attached an invoice for you in the amount of [CURRENCY][AMOUNT] Please remit payment within [DUE_DATE].<\\/p>\\r\\n\\r\\n<p>Thanks you so much and we will see at your next service!<\\/p>\\r\\n\\r\\n<p>[COMPANY_NAME]<br>\\r\\n[COMPANY_ADDRESS]<br>\\r\\n[COMPANY_PHONE]<br>\\r\\n[COMPANY_EMAIL]<br>\\r\\n[COMPANY_WEBSITE]<\\/p>\"},\"host_name\":\"smtp.gmail.com\",\"port_address\":\"587\",\"user_name\":\"flyperdemo@gmail.com\",\"password\":\"flyper@demo12\"}', '1', 3, '2afd0c8c436d02b74239532db0282325.png', '<p>We have a proposed pricing for [CUSTOMER_FULL_NAME]. Products/Services and price are enlisted below. If you have any question regarding this proposal, please let us know.<br>\r\nThank you!</p>', '<p>Dear [CUSTOMER_CONTACT_PERSON],<br>\r\nThank you for the opportunity to provide Products/Services to you.<br>\r\nWe have attached an invoice for you in the amount of [CURRENCY][AMOUNT] Please remit payment within [DUE_DATE].</p>\r\n\r\n<p>Thanks you so much and we will see at your next service!</p>\r\n\r\n<p>[COMPANY_NAME]<br>\r\n[COMPANY_ADDRESS]<br>\r\n[COMPANY_PHONE]<br>\r\n[COMPANY_EMAIL]<br>\r\n[COMPANY_WEBSITE]</p>');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `id` int(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `c_person` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `billing_address` text NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `gst_number` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_customers`
--

INSERT INTO `tbl_customers` (`id`, `name`, `c_person`, `phone`, `email`, `billing_address`, `website`, `address`, `gst_number`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'Jeremy', '', '', 'jeremy239@gmail.com', '', NULL, '422/A, Park Avenue, Kanakati, UK', NULL, 1, 1, 'Live'),
(2, 'Alan K. Beach', '', '013948393489', 'alankbeach@gmail.com', '', NULL, '422/A, Park Avenue, Kanakati, UK', NULL, 1, 1, 'Live'),
(3, 'Mark Winnan', '', '013948393489', 'markmwinnan@gmail.com', '', NULL, '422/A, Park Avenue, Kanakati, UK', NULL, 1, 1, 'Live'),
(4, 'John Doe ', '', '013948393489', 'john.doe@gmail.com', '', NULL, '422/A, Park Avenue, Kanakati, UK', NULL, 1, 1, 'Live'),
(5, 'Glenn J. Fisher', '', '013948393489', 'glennjfisher@gmail.com', '', NULL, '422/A, Park Avenue, Kanakati, UK', NULL, 1, 1, 'Live'),
(14, 'Everett S. Jones', '', '013948393489', 'everettsjones@gmail.com', '', NULL, '422/A, Park Avenue, Kanakati, UK', NULL, 1, 1, 'Live'),
(17, 'Allen J. Horton', '', '013948393489', 'allenjhorton@gmail.com', '', NULL, 'Test Delivery address for habibur rahman', NULL, 1, 1, 'Live'),
(18, 'RJ Fashoin', '', '013948393489', 'info@rjfashoin.com', '', 'http://rjfashoin.com', '422/A, Park Avenue, Kanakati, UK', NULL, 1, 1, 'Live'),
(19, 'Gary P. Wilkerson', '', '013948393489', 'garypwilkerson@gmail.com', '', NULL, '422/A, Park Avenue, Kanakati, UK', NULL, 1, 1, 'Live'),
(20, 'Link Technology Solution', '', '013948393489', 'mail@linktechnologysolution.com', '', 'http://linktechnologysolution.com', '422/A, Park Avenue, Kanakati, UK', '09', 1, 1, 'Live'),
(21, 'Ransay Corporation', '', '013948393489', 'contact@ransaycorporation.com', '', 'http://ransaycorporation.com', '422/A, Park Avenue, Kanakati, UK', '03', 1, 1, 'Live'),
(22, 'Chris L. Ramsey', '', '013948393489', 'chrislramsey@gmail.com', '', '', '422/A, Park Avenue, Kanakati, UK', '', 1, 1, 'Live'),
(23, 'MD NAZMUL HOSAN', '', '1566666666', 'ad.mdnazmul@gmail.com', '', NULL, '458/A, Senpara Parbata, Kafrul', NULL, 1, 1, 'Live'),
(24, 'MD NAZMUL HOSAN 1', '', '01812391633', 'ad.mdnazmul@gmail.com', '', NULL, '458/A, Senpara Parbata, Kafrul', NULL, 1, 1, 'Live'),
(25, 'MD NAZMUL HOSAN 2', '', '01812391633', 'ad.mdnazmul@gmail.com', '', 'www.test.com', '458/A, Senpara Parbata, Kafrul', NULL, 1, 1, 'Live'),
(26, 'Aloo Protha', '', '1566666666', 'ad.mdnazmul@gmail.com', '', 'www.test.comssss', '458/A, Senpara Parbata, Kafrul', NULL, 1, 1, 'Live'),
(27, 'test food', '', '01621532677', '', '', '', '', NULL, 1, 1, 'Live'),
(28, 'MD NAZMUL HOSAN 4', '', '9647901234567', 'ad.mdnazmul@gmail.com', '', 'http://doorsoft.xyz', '458/A, Senpara Parbata, Kafrul', NULL, 1, 1, 'Live'),
(29, 'MD NAZMUL HOSAN', '', '01812391633', 'ad.mdnazmul@gmail.com', '', '', '458/A, Senpara Parbata, Kafrul', NULL, 1, 1, 'Live'),
(30, 'webprogrammarsahabir', '', '01755193757', 'saimsahabir12it@gmail.com', '', 'http://sahabirit.com', 'Rungpur,kurigram\nrangpur', NULL, 1, 1, 'Deleted'),
(31, 'sahabirit', '', '01755193757', 'saimsahabir12it@gmail.com', '', 'http://sahabirit.com', 'Rungpur,kurigram\nrangpur', NULL, 1, 1, 'Live'),
(32, 'webprogrammarsahabir', '', '01755193757', 'saimsahabir12it@gmail.com', '', 'http://sahabirit.com', 'Rungpur,kurigram\r\nrangpur', NULL, 1, 1, 'Live'),
(33, 'webprogrammarsahabir', '', '01755193757', 'saimsahabir12it@gmail.com', '', 'http://sahabirit.com', 'Rungpur,kurigram\nrangpur', NULL, 1, 1, 'Live'),
(34, 'webprogrammarsahabir', 'jjjj', '01755193757', 'saimsahabir12it@gmail.com', 'Rungpur,kurigram', 'http://sahabirit.com', 'Rungpur,kurigram\r\nrangpur', NULL, 1, 1, 'Deleted'),
(35, 'sahabirit', 'sahabir', '1555', 'sreal6661@gmail.com', 'hhhhhh', 'sahabirit.com', 'hhh', NULL, 1, 1, 'Live'),
(36, 'index.html', 'sahabir', '1555', 'sreal6661@gmail.com', 'hhhhhh', 'sahabirit.com', 'hhh', NULL, 1, 1, 'Live'),
(37, 'sahabirit', 'sahabir', '1555', 'sreal6661@gmail.com', 'sahabir', 'sahabirit.com', 'sahabir', NULL, 1, 1, 'Live'),
(38, 'saim', 'sahabir', '01755193757', 'sahabirit1@gmail.com', 'Rangpur, Kurigram', 'sahabirit.com', '', NULL, 1, 1, 'Deleted'),
(39, 'sahabirit', 'sahabir', '1555', 'sreal6661@gmail.com', 'Rangpur', '', 'sahabir', NULL, 1, 1, 'Live'),
(40, 'softAmar', 'sahabir', '1555', 'sahabirit1@gmail.com', 'dddddddddd', 'sahabirit.com', 'dd', NULL, 1, 1, 'Live'),
(41, 'mirza jalal', 'sahabir', '01755193757', 'mirzajalalboss50@gmail.com', 'eiojedu9wed', 'sahabirit.com', 'wsjidwid', NULL, 1, 1, 'Live'),
(42, 'sahariful', 'sahabir', '01755193757', 'sahabirit1@gmail.com', 'kamal jsjd', 'sahabirit.com', 'sbhdsucs', NULL, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customize`
--

CREATE TABLE `tbl_customize` (
  `id` int(11) NOT NULL,
  `proposal_body` text NOT NULL,
  `proposal_email` text NOT NULL,
  `invoice_email` text NOT NULL,
  `company_id` int(10) NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customize`
--

INSERT INTO `tbl_customize` (`id`, `proposal_body`, `proposal_email`, `invoice_email`, `company_id`, `del_status`) VALUES
(1, '<p>We have a proposed pricing for [CUSTOMER_FULL_NAME]. Products/Services and price are enlisted below. If you have any question regarding this proposal, please let us know.<br>\r\nThank you! </p>', '<p></p><p>Dear [CUSTOMER_CONTACT_PERSON],<br><br>We have created an estimate for [CUSTOMER_FULL_NAME]  on [DATE]. Please check the attached file for pricing.<br><br>If you have any questions regarding this pricing, please contact us over the phone at [COMPANY_PHONE] or over email at [COMPANY_EMAIL].<br><br>We will feel lucky to do business with you.<br><br>Thank you for your time and consideration.</p><p>[COMPANY_NAME]<br><br>[COMPANY_ADDRESS]<br><br>[COMPANY_PHONE]<br><br>[COMPANY_EMAIL]<br></p><p>[DATE]<br></p><p></p>', '<p>Dear [CUSTOMER_CONTACT_PERSON],<br>\r\nWe have created Invoice for [CUSTOMER_FULL_NAME]  on [DATE]. Please check the attached file for pricing.<br>\r\n<br>\r\nIf you have any questions regarding this pricing, please contact us over phone at [COMPANY_PHONE] or over email at: [COMPANY_EMAIL].<br>\r\n<br>\r\nWe will feel lucky to do business with you.<br>\r\n<br>\r\nThank you for your time and consideration.</p>\r\n\r\n<p>[COMPANY_NAME]<br>\r\n[COMPANY_ADDRESS]<br>\r\n[COMPANY_PHONE]<br>\r\n[COMPANY_EMAIL]<br>\r\n[COMPANY_WEBSITE]</p>', 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expenses`
--

CREATE TABLE `tbl_expenses` (
  `id` int(10) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_expenses`
--

INSERT INTO `tbl_expenses` (`id`, `date`, `amount`, `category_id`, `note`, `user_id`, `company_id`, `del_status`) VALUES
(1, '2019-12-06', 30.00, 6, 'test', 1, 1, 'Live'),
(2, '2020-12-15', 200.00, 3, 'rtinj', 1, 1, 'Live'),
(3, '2020-12-02', 200.00, 1, 'test', 1, 1, 'Deleted'),
(4, '2020-12-31', 400.00, 7, '', 1, 1, 'Live'),
(5, '2020-12-31', 400.00, 5, '', 1, 1, 'Live'),
(6, '2021-01-14', 400.00, 5, 'sssss', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense_items`
--

CREATE TABLE `tbl_expense_items` (
  `id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_expense_items`
--

INSERT INTO `tbl_expense_items` (`id`, `name`, `description`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'Salary', 'Monthly Salary', 1, 1, 'Live'),
(2, 'Rent', 'Rent', 1, 1, 'Live'),
(3, 'Electric Bill', 'Electric Bill', 1, 1, 'Live'),
(4, 'Water Bill', 'Water Bill', 1, 1, 'Live'),
(5, 'Gas Bill', 'Gas Bill', 1, 1, 'Live'),
(6, 'Entertainment', 'Entertainment', 1, 1, 'Deleted'),
(7, 'sahabirit', 'hello', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_api`
--

CREATE TABLE `tbl_payment_api` (
  `id` int(11) NOT NULL,
  `api_name` varchar(250) DEFAULT NULL,
  `api_secret_key` text,
  `publishable_key` text,
  `api_clinet_id` text,
  `company_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_payment_api`
--

INSERT INTO `tbl_payment_api` (`id`, `api_name`, `api_secret_key`, `publishable_key`, `api_clinet_id`, `company_id`, `user_id`, `status`) VALUES
(28, 'Stripe', 'Stripe System Secret key12344', 'sssss', NULL, '1', '1', 'Live'),
(29, 'Paypal', 'hello all12h', NULL, 'hello pypal', '1', '1', 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products_services`
--

CREATE TABLE `tbl_products_services` (
  `id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `company_id` varchar(50) DEFAULT 'Veg No',
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_products_services`
--

INSERT INTO `tbl_products_services` (`id`, `name`, `price`, `description`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'Test product', 20, 'test description', 1, '1', 'Live'),
(2, 'TTTT', 33, 'asdfsdf sdf sfds', 1, '1', 'Live'),
(3, 'dsasd', 44, 'aeaew', 1, '1', 'Live'),
(4, 'demo 3', 1000, 'rrrr', 1, '1', 'Live'),
(5, 'COMPUTER', 19, 'this There is no table', 1, '1', 'Live'),
(6, 'mobile ram', 100, 'daerr', 1, '1', 'Live'),
(7, 'demo ', 100, 'daerr', 1, '1', 'Live'),
(8, 'Asus leptop', 43000, 'hello', 1, '1', 'Live'),
(9, 'Phone ', 20000, '', 1, '1', 'Live'),
(10, 'sahabirit', 567, 'hello', 1, '1', 'Live'),
(11, 'sahabirit', 66, 'hello', 1, '1', 'Live'),
(12, 'hello', 344, '', 1, '1', 'Live'),
(13, 'fff', 355, 'ygg', 1, '1', 'Live'),
(14, 'teff', 44, '', 1, '1', 'Live'),
(15, 'dd', 4, '5', 1, '1', 'Live'),
(16, 'hhhh', 34, 'tt', 1, '1', 'Live'),
(17, 'ffffffffff', 444, '', 1, '1', 'Live'),
(18, 'jjjj', 66, '', 1, '1', 'Live'),
(19, 'ff', 55, 'dd', 1, '1', 'Live'),
(20, 'hh', 55, '', 1, '1', 'Live'),
(21, 'yy', 55, '', 1, '1', 'Live'),
(22, 'dd', 44, '', 1, '1', 'Live'),
(23, 'hh', 66, '', 1, '1', 'Live'),
(24, 'fff', 33, '', 1, '1', 'Live'),
(25, 'dekk', 22, '', 1, '1', 'Live'),
(26, 'yyyt', 22, '', 1, '1', 'Live'),
(27, 'ddd', 12, '', 1, '1', 'Live'),
(28, 'dddd', 33, '', 1, '1', 'Live'),
(29, 'hhhh', 44, '', 1, '1', 'Live'),
(30, 'ggggg', 33, '', 1, '1', 'Live'),
(31, 'sssss', 333, '', 1, '1', 'Live'),
(32, 'New ', 55, '', 1, '1', 'Live'),
(33, 'New Products', 300, '', 1, '1', 'Deleted'),
(34, 'aaa', 22, 'hhh', 1, '1', 'Deleted'),
(35, 'hello', 300, 'saim', 1, '1', 'Live'),
(36, 'sss', 444.555, 'ssss', 1, '1', 'Live'),
(37, 'hhhh', 333.78, '3333', 1, '1', 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proposal_invoice`
--

CREATE TABLE `tbl_proposal_invoice` (
  `id` bigint(20) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'Proposal/Invoice',
  `date` date NOT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `subtotal` float UNSIGNED NOT NULL,
  `discount_type` varchar(50) NOT NULL COMMENT 'Fixed/Percentage',
  `discount_value` float DEFAULT NULL,
  `actual_discount` float UNSIGNED DEFAULT NULL,
  `after_discount` float UNSIGNED NOT NULL,
  `tax` varchar(500) NOT NULL COMMENT 'total tax',
  `shipping_other` float NOT NULL,
  `grand_total` float NOT NULL,
  `proposal_no` varchar(20) DEFAULT NULL,
  `proposal_status` varchar(20) NOT NULL DEFAULT 'N/A' COMMENT 'Accepted, Declined, N/A',
  `template_bg_color` varchar(50) NOT NULL DEFAULT '#45818E',
  `template_text_color` varchar(50) NOT NULL DEFAULT '#FFFFFF',
  `proposal_user_id` int(11) NOT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `proposal_id` bigint(20) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `term_condition` text,
  `note` text,
  `payment_status` varchar(20) DEFAULT NULL COMMENT 'Paid/Unpaid',
  `state` varchar(255) NOT NULL DEFAULT 'DRAFT',
  `created_at` date NOT NULL,
  `invoice_user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_proposal_invoice`
--

INSERT INTO `tbl_proposal_invoice` (`id`, `type`, `date`, `customer_id`, `title`, `subtotal`, `discount_type`, `discount_value`, `actual_discount`, `after_discount`, `tax`, `shipping_other`, `grand_total`, `proposal_no`, `proposal_status`, `template_bg_color`, `template_text_color`, `proposal_user_id`, `invoice_no`, `proposal_id`, `invoice_date`, `due_date`, `payment_method`, `term_condition`, `note`, `payment_status`, `state`, `created_at`, `invoice_user_id`, `company_id`, `del_status`) VALUES
(395, 'Proposal', '2021-01-12', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000096', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-12', '2021-01-12', '', '', '', '', 'EMAILED', '2021-01-12', 1, 1, 'Live'),
(396, 'Proposal', '2021-01-12', 40, 'saim sahabir', 43019, 'Percentage', NULL, 0, 43019, '3011.33', 0, 46030.3, 'Proposal-000096', 'Declined', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-12', '2021-01-12', '', '', '', '', 'EMAILED', '2021-01-12', 1, 1, 'Live'),
(397, 'Proposal', '2021-01-12', 40, 'condition', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000098', 'Accepted', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-12', '2021-01-12', '', '', '', '', 'EMAILED', '2021-01-12', 1, 1, 'Live'),
(398, 'Proposal', '2021-01-13', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000099', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-13', '2021-01-13', '', '', '', '', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(399, 'Proposal', '2021-01-13', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000100', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-13', '2021-01-13', '', '', '', '', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(400, 'Proposal', '2021-01-13', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000101', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-13', '2021-01-13', '', '', '', '', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(401, 'Proposal', '2021-01-13', 40, 'saim sahabir', 33, 'Percentage', NULL, 0, 33, '2.31', 0, 35.31, 'Proposal-000102', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-13', '2021-01-13', '', '', '', '', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(402, 'Proposal', '2021-01-13', 40, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000103', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-13', '2021-01-13', '', '', '', '', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(403, 'Proposal', '2021-01-13', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000104', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-13', '2021-01-13', '', '', '', '', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(404, 'Proposal', '2021-01-13', 40, 'saim sahabir', 4, 'Percentage', NULL, 0, 4, '0.28', 0, 4.28, 'Proposal-000105', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-13', '2021-01-13', '', '', '', '', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(405, 'Proposal', '2021-01-13', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000106', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-13', '2021-01-13', '', '', '', '', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(406, 'Proposal', '2021-01-13', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000107', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-13', '2021-01-13', '', '', '', '', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(407, 'Proposal', '2021-01-13', 40, 'ffff', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000108', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-13', '2021-01-13', '', '', '', '', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(408, 'Proposal', '2021-01-13', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000109', 'Accepted', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-13', '2021-01-13', '', '', '', '', 'EMAILED', '2021-01-13', 1, 1, 'Live'),
(409, 'Proposal', '2021-01-13', 40, 'condition', 57, 'Percentage', NULL, 0, 57, '3.99', 0, 60.99, 'Proposal-000110', 'Accepted', '#00ff00', '#ffffff', 1, NULL, NULL, '2021-01-13', '2021-01-13', '', 'dfkdjfdig', 'kzksjdkjfnidnf', '', 'EMAILED', '2021-01-13', 1, 1, 'Live'),
(410, 'Proposal', '2021-01-14', 40, 'saim sahabir', 38, 'Percentage', NULL, 0, 38, '2.66', 0, 40.66, 'Proposal-000111', 'N/A', '#00ff00', '#ffffff', 1, NULL, NULL, '2021-01-14', '2021-01-14', '', 'tt', 'ddd', '', 'preview', '2021-01-14', 1, 1, 'Live'),
(411, 'Invoice', '2021-01-14', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000006', NULL, '2021-01-14', '2021-01-14', NULL, '', '', '', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(412, 'Invoice', '2021-01-14', 2, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000007', NULL, '2021-01-14', '2021-01-14', NULL, '', '', '', 'preview', '2021-01-14', 1, 1, 'Live'),
(385, 'Proposal', '2021-01-11', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000086', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(386, 'Proposal', '2021-01-11', 2, 'saim sahabir', 20, 'Percentage', NULL, 0, 20, '1.4', 0, 21.4, 'Proposal-000087', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(387, 'Proposal', '2021-01-11', 22, 'saim sahabir', 4, 'Percentage', NULL, 0, 4, '0.28', 0, 4.28, 'Proposal-000088', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(388, 'Proposal', '2021-01-11', 17, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000089', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(389, 'Proposal', '2021-01-11', 23, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000090', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(390, 'Proposal', '2021-01-11', 22, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000091', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(391, 'Proposal', '2021-01-12', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000092', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-12', '2021-01-12', '', '', '', '', 'EMAILED', '2021-01-12', 1, 1, 'Live'),
(392, 'Proposal', '2021-01-12', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000093', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-12', '2021-01-12', '', '', '', '', 'EMAILED', '2021-01-12', 1, 1, 'Live'),
(393, 'Proposal', '2021-01-12', 40, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000094', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-12', '2021-01-12', '', '', '', '', 'EMAILED', '2021-01-12', 1, 1, 'Live'),
(394, 'Proposal', '2021-01-12', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000095', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-12', '2021-01-12', '', '', '', '', 'EMAILED', '2021-01-12', 1, 1, 'Live'),
(426, 'Invoice', '2021-01-14', 40, 'saim sahabir', 38, 'Percentage', NULL, 0, 38, '2.66', 0, 40.66, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000019', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', '', '', 'Paid', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(368, 'Proposal', '2021-01-11', 40, 'hhhh', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000070', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(369, 'Proposal', '2021-01-11', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000071', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(370, 'Proposal', '2021-01-11', 40, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000072', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(371, 'Proposal', '2021-01-11', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000073', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(372, 'Proposal', '2021-01-11', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000074', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(373, 'Proposal', '2021-01-11', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000075', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(374, 'Proposal', '2021-01-11', 40, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000076', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(375, 'Proposal', '2021-01-11', 3, 'jksdiuhsuf', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000077', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'preview', '2021-01-11', 1, 1, 'Live'),
(376, 'Proposal', '2021-01-11', 40, 'mjduehyfgyegyf', 43038, 'Percentage', NULL, 24101.3, 18936.7, '1325.5704', 2, 20264.3, 'Proposal-000078', 'N/A', '#00ffff', '#000000', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '3keenr', 'weweuhuehuy', '', 'download', '2021-01-11', 1, 1, 'Live'),
(425, 'Invoice', '2021-01-14', 40, 'condition', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000018', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', '', '', 'Paid', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(419, 'Invoice', '2021-01-14', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#ffffff', '#000000', 1, 'Invoice-000013', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', 'h', 'hhh', 'Paid', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(420, 'Invoice', '2021-01-14', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000014', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', 'hhhhh', 'jhhh', 'Paid', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(413, 'Invoice', '2021-01-14', 17, 'eCommerce site product management system in custom PHP  ', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000008', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', '', '', NULL, 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(424, 'Proposal', '2021-01-14', 40, 'condition', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000113', 'Accepted', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-14', '2021-01-14', NULL, '', '', '', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(415, 'Proposal', '2021-01-14', 36, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000112', 'N/A', '#00ffff', '#000000', 1, NULL, NULL, '2021-01-14', '2021-01-14', NULL, 'hh', 'nn', '', 'download', '2021-01-14', 1, 1, 'Live'),
(416, 'Invoice', '2021-01-14', 22, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000010', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', '', '', 'Paid', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(417, 'Invoice', '2021-01-14', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000011', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', '', '', 'Paid', 'download', '2021-01-14', 1, 1, 'Live'),
(418, 'Invoice', '2021-01-14', 26, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#ffffff', '#000000', 1, 'Invoice-000012', NULL, '2021-01-14', '2021-01-14', NULL, 'hhhhh', 'bbbbb', 'Unpaid', 'preview', '2021-01-14', 1, 1, 'Live'),
(377, 'Invoice', '2021-01-11', 26, 'sddd', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000005', NULL, '2021-01-11', '2021-01-11', 'Paid', '', '', 'Paid', 'preview', '2021-01-11', 1, 1, 'Live'),
(378, 'Proposal', '2021-01-11', 40, 'nbb', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000079', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(379, 'Proposal', '2021-01-11', 40, 'nbb', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000079', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(380, 'Proposal', '2021-01-11', 40, 'nbb', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000079', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(381, 'Proposal', '2021-01-11', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000082', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(382, 'Proposal', '2021-01-11', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000083', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(383, 'Proposal', '2021-01-11', 40, 'saim sahabir', 100, 'Percentage', NULL, 0, 100, '7', 0, 107, 'Proposal-000084', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(384, 'Proposal', '2021-01-11', 26, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000085', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(423, 'Invoice', '2021-01-14', 40, 'saim sahabir', 43138, 'Percentage', NULL, 0, 43138, '3019.66', 0, 46157.7, NULL, 'N/A', '#ffffff', '#000000', 1, 'Invoice-000016', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', '', '', 'Paid', 'download', '2021-01-14', 1, 1, 'Live'),
(422, 'Invoice', '2021-01-14', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000016', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', '', '', 'Paid', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(421, 'Invoice', '2021-01-14', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000015', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', '', '', 'Paid', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(414, 'Invoice', '2021-01-14', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000009', NULL, '2021-01-14', '2021-01-14', NULL, '', '', '', 'download', '2021-01-14', 1, 1, 'Live'),
(364, 'Invoice', '2021-01-11', 40, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000004', NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(365, 'Proposal', '2021-01-11', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000067', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(366, 'Proposal', '2021-01-11', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000068', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(367, 'Proposal', '2021-01-11', 40, 'saim sahabir', 43019, 'Percentage', NULL, 0, 43019, '3011.33', 0, 46030.3, 'Proposal-000069', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', 'ddd', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(328, 'Proposal', '2021-01-10', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000032', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(329, 'Proposal', '2021-01-10', 17, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000033', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(330, 'Proposal', '2021-01-10', 17, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000034', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(331, 'Proposal', '2021-01-10', 26, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000035', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(332, 'Proposal', '2021-01-10', 26, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000035', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(333, 'Proposal', '2021-01-10', 17, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000037', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(334, 'Proposal', '2021-01-10', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000038', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(335, 'Proposal', '2021-01-10', 26, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000039', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(336, 'Proposal', '2021-01-10', 17, 'ffff', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000040', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(337, 'Proposal', '2021-01-10', 17, 'ffff', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000040', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(338, 'Proposal', '2021-01-10', 26, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000042', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(339, 'Proposal', '2021-01-10', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000043', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(340, 'Proposal', '2021-01-10', 26, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000044', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(341, 'Proposal', '2021-01-10', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000045', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(342, 'Proposal', '2021-01-10', 2, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000046', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(343, 'Proposal', '2021-01-10', 2, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000047', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(344, 'Proposal', '2021-01-10', 2, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000048', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(345, 'Proposal', '2021-01-10', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000049', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(346, 'Invoice', '2021-01-10', 26, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000003', NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(347, 'Proposal', '2021-01-10', 2, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000050', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(348, 'Proposal', '2021-01-10', 2, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000050', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(349, 'Proposal', '2021-01-10', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000052', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(350, 'Proposal', '2021-01-10', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000053', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(351, 'Proposal', '2021-01-10', 22, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000054', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(352, 'Proposal', '2021-01-10', 2, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000055', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(353, 'Proposal', '2021-01-10', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000056', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(354, 'Proposal', '2021-01-10', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000057', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(355, 'Proposal', '2021-01-10', 17, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000058', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(356, 'Proposal', '2021-01-10', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000059', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(357, 'Proposal', '2021-01-11', 2, 'saim sahabir', 38, 'Percentage', NULL, 0, 38, '2.66', 0, 40.66, 'Proposal-000060', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(358, 'Proposal', '2021-01-11', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000061', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(359, 'Proposal', '2021-01-11', 17, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000062', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(360, 'Proposal', '2021-01-11', 17, 'saim sahabir', 43019, 'Percentage', NULL, 0, 43019, '3011.33', 0, 46030.3, 'Proposal-000063', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(361, 'Proposal', '2021-01-11', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000064', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(362, 'Proposal', '2021-01-11', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000065', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(363, 'Proposal', '2021-01-11', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000066', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-11', '2021-01-11', '', '', '', '', 'EMAILED', '2021-01-11', 1, 1, 'Live'),
(295, 'Proposal', '2020-12-27', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000001', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-27', '2020-12-27', '', 'hhvgc', 'hhh', '', 'download', '2020-12-27', 1, 1, 'Live'),
(296, 'Proposal', '2020-12-27', 31, 'saim sahabir', 119, 'Percentage', NULL, 0, 119, '8.33', 0, 127.33, 'Proposal-000002', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-27', '2020-12-27', '', '', '', '', 'preview', '2020-12-27', 1, 1, 'Live'),
(297, 'Proposal', '2020-12-27', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000003', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-27', '2020-12-27', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(298, 'Proposal', '2020-12-27', 2, 'ffff', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000004', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-27', '2020-12-27', '', '', '', '', 'preview', '2020-12-27', 1, 1, 'Live'),
(299, 'Proposal', '2020-12-27', 17, 'demo test', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000005', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-27', '2020-12-27', '', 'rrr', 'ttt', '', 'preview', '2020-12-27', 1, 1, 'Live'),
(300, 'Proposal', '2020-12-27', 2, 'demo test', 38, 'Percentage', NULL, 0, 38, '2.66', 0, 40.66, 'Proposal-000006', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-27', '2020-12-27', '', 'ffff', 'gfgg', '', '', '0000-00-00', 1, 1, 'Live'),
(301, 'Proposal', '2020-12-27', 2, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000007', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-27', '2020-12-27', '', 'rrrr', 'rr', '', 'download', '2020-12-27', 1, 1, 'Live'),
(302, 'Proposal', '2020-12-27', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000008', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-27', '2020-12-27', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(303, 'Proposal', '2020-12-27', 2, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000009', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-27', '2020-12-27', '', '', '', '', 'preview', '2020-12-27', 1, 1, 'Live'),
(304, 'Proposal', '2020-12-27', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000010', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-27', '2020-12-27', '', '', '', '', 'download', '2020-12-27', 1, 1, 'Live'),
(305, 'Proposal', '2020-12-27', 17, 'saim sahabir', 43000, 'Percentage', NULL, 23650, 19350, '1354.5', 0, 20704.5, 'Proposal-000011', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-27', '2020-12-27', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(306, 'Proposal', '2020-12-27', 17, 'saim sahabir', 43000, 'Percentage', NULL, 23650, 19350, '1354.5', 0, 20704.5, 'Proposal-000011', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-27', '2020-12-27', '', '', '', '', 'preview', '2020-12-27', 1, 1, 'Live'),
(307, 'Proposal', '2020-12-28', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000013', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-28', '2020-12-28', '', '', '', '', 'preview', '2020-12-28', 1, 1, 'Live'),
(308, 'Proposal', '2020-12-29', 26, 'saim sahabir', 19, 'Percentage', NULL, 18.81, 0.19, '0.01330000000000009', 0, 0.2, 'Proposal-000014', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-29', '2020-12-29', '', '', '', '', 'download', '2020-12-29', 1, 1, 'Live'),
(309, 'Proposal', '2020-12-31', 17, 'saim sahabir', 19, 'Fixed', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000015', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-31', '2020-12-31', '', '', '', '', 'download', '2020-12-31', 1, 1, 'Live'),
(310, 'Proposal', '2020-12-31', 2, 'condition', 19, 'Percentage', NULL, 12.35, 6.65, '0.4655', 0, 7.116, 'Proposal-000016', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-31', '2020-12-31', '', 'fff', 'fff', '', '', '0000-00-00', 1, 1, 'Live'),
(311, 'Proposal', '2020-12-31', 2, 'condition', 19, 'Percentage', NULL, 12.35, 6.65, '0.4655', 0, 7.116, 'Proposal-000016', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-31', '2020-12-31', '', 'fff', 'fff', '', '', '0000-00-00', 1, 1, 'Live'),
(312, 'Proposal', '2020-12-31', 22, 'condition', 119, 'Percentage', NULL, 0, 119, '8.33', 0, 127.33, 'Proposal-000018', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-31', '2020-12-31', '', '', '', '', 'download', '2020-12-31', 1, 1, 'Live'),
(313, 'Proposal', '2020-12-31', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000019', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-31', '2020-12-31', '', '', '', '', 'download', '2020-12-31', 1, 1, 'Live'),
(314, 'Proposal', '2020-12-31', 17, 'condition', 38, 'Percentage', NULL, 0, 38, '2.66', 6, 46.66, 'Proposal-000020', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-31', '2020-12-31', '', 'hh', 'hhh', '', 'download', '2020-12-31', 1, 1, 'Live'),
(315, 'Proposal', '2020-12-31', 17, 'saim sahabir', 38, 'Percentage', NULL, 0, 38, '2.66', 0, 40.66, 'Proposal-000021', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2020-12-31', '2020-12-31', '', 'jjjjjj', 'hh', '', 'preview', '2020-12-31', 1, 1, 'Live'),
(316, 'Proposal', '2021-01-01', 26, 'condition', 586, 'Percentage', NULL, 0, 586, '41.02', 0, 627.02, 'Proposal-000022', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-01', '2021-01-01', '', '', '', '', 'preview', '2021-01-01', 1, 1, 'Live'),
(317, 'Proposal', '2021-01-04', 17, 'condition', 19, 'Percentage', NULL, 0, 19, '1.33', 5, 25.33, 'Proposal-000023', 'N/A', '#00ffff', '#000000', 1, NULL, NULL, '2021-01-04', '2021-01-04', '', 'ddd', 'dddd', '', 'download', '2021-01-04', 1, 1, 'Live'),
(318, 'Proposal', '2021-01-04', 17, 'saim sahabir', 38, 'Percentage', NULL, 0, 38, '2.66', 0, 40.66, 'Proposal-000024', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-04', '2021-01-04', '', 'jhhh', 'hhh', '', 'preview', '2021-01-04', 1, 1, 'Live'),
(319, 'Proposal', '2021-01-04', 26, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000025', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-04', '2021-01-04', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(320, 'Proposal', '2021-01-06', 2, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000026', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-06', '2021-01-06', '', 'ujjj', 'hhh', '', '', '0000-00-00', 1, 1, 'Live'),
(321, 'Proposal', '2021-01-07', 17, 'saim sahabir', 43019, 'Percentage', NULL, 0, 43019, '3011.33', 0, 46030.3, 'Proposal-000027', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-07', '2021-01-07', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(322, 'Proposal', '2021-01-06', 17, 'ffff', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000028', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-06', '2021-01-06', '', '', '', '', 'download', '2021-01-06', 1, 1, 'Live'),
(323, 'Proposal', '2021-01-06', 17, 'saim sahabir', 43000, 'Percentage', NULL, 0, 43000, '3010', 0, 46010, 'Proposal-000029', 'N/A', '#00ffff', '#000000', 1, NULL, NULL, '2021-01-06', '2021-01-06', '', 'nnn', 'hhhhhh', '', 'preview', '2021-01-06', 1, 1, 'Live'),
(324, 'Proposal', '2021-01-06', 23, 'saim sahabir', 23, 'Percentage', NULL, 0, 23, '1.6099999999999999', 0, 24.61, 'Proposal-000030', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-06', '2021-01-06', '', 'kdo nekowdid  iedijedm kedied dkedoijsd iiedd', 'ksajdijsdi kjdijeid jnniewdsdnijed ', '', 'download', '2021-01-06', 1, 1, 'Live'),
(325, 'Invoice', '2021-01-09', 2, 'ffff', 38, 'Percentage', NULL, 0, 38, '2.66', 0, 40.66, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000001', NULL, '2021-01-09', '2021-01-09', 'Paid', '', '', 'Paid', '', '0000-00-00', 1, 1, 'Live'),
(326, 'Invoice', '2021-01-09', 2, 'ffff', 38, 'Percentage', NULL, 0, 38, '2.66', 0, 40.66, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000001', NULL, '2021-01-09', '2021-01-09', 'Paid', '', '', 'Paid', 'preview', '2021-01-09', 1, 1, 'Live'),
(327, 'Proposal', '2021-01-10', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000031', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-10', '2021-01-10', '', '', '', '', '', '0000-00-00', 1, 1, 'Live'),
(427, 'Proposal', '2021-01-14', 40, 'saim sahabir', 22, 'Percentage', NULL, 0, 22, '1.54', 0, 23.54, 'Proposal-000114', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-14', '2021-01-14', NULL, '', '', '', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(428, 'Proposal', '2021-01-14', 40, 'saim sahabir', 4, 'Percentage', NULL, 0, 4, '0.28', 0, 4.28, 'Proposal-000115', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-14', '2021-01-14', NULL, '', '', '', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(429, 'Invoice', '2021-01-14', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000020', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', '', '', 'Paid', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(430, 'Invoice', '2021-01-14', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000021', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', '', '', 'Paid', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(431, 'Proposal', '2021-01-14', 40, 'condition', 4, 'Percentage', NULL, 0, 4, '0.28', 0, 4.28, 'Proposal-000116', 'N/A', '#ffffff', '#000000', 1, NULL, NULL, '2021-01-14', '2021-01-14', NULL, 'mjj', 'jhjj', '', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(432, 'Proposal', '2021-01-14', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000117', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-14', '2021-01-14', NULL, '', '', '', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(433, 'Proposal', '2021-01-14', 40, 'saim sahabir', 4, 'Percentage', NULL, 0, 4, '0.28', 0, 4.28, 'Proposal-000118', 'N/A', '#ffffff', '#000000', 1, NULL, NULL, '2021-01-14', '2021-01-14', NULL, 'sdeee', 'dfff', '', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(434, 'Proposal', '2021-01-14', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000119', 'Declined', '#ffffff', '#000000', 1, NULL, NULL, '2021-01-14', '2021-01-14', NULL, 'rreee', 'gtfff', '', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(435, 'Proposal', '2021-01-14', 17, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000120', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-14', '2021-01-14', NULL, '', '', '', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(436, 'Invoice', '2021-01-14', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000022', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', '', '', 'Paid', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(437, 'Invoice', '2021-01-14', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000022', NULL, '2021-01-14', '2021-01-14', 'Cash On Delivery', '', '', 'Paid', 'EMAILED', '2021-01-14', 1, 1, 'Live'),
(438, 'Invoice', '2021-01-14', 26, 'saim sahabir', 43019, 'Percentage', NULL, 0, 43019, '3011.33', 0, 46030.3, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000024', NULL, '2021-01-14', '2021-01-14', NULL, '', '', 'Unpaid', 'download', '2021-01-14', 1, 1, 'Live'),
(439, 'Invoice', '2021-01-15', 40, 'saim sahabir', 43020, 'Percentage', NULL, 0, 43020, '3011.4', 0, 46031.4, NULL, 'N/A', '#067eeb', '#ffffff', 1, 'Invoice-000025', NULL, '2021-01-15', '2021-01-15', 'Cash On Delivery', 'hhggggggggggg', 'bbbbbbbb', 'Paid', 'EMAILED', '2021-01-15', 1, 1, 'Live'),
(440, 'Invoice', '2021-01-15', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000026', NULL, '2021-01-15', '2021-01-15', NULL, '', '', 'Paid', 'EMAILED', '2021-01-15', 1, 1, 'Live'),
(441, 'Invoice', '2021-01-15', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000026', NULL, '2021-01-15', '2021-01-15', NULL, '', '', 'Paid', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(442, 'Invoice', '2021-01-15', 40, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#ffffff', 1, 'Invoice-000026', NULL, '2021-01-15', '2021-01-15', NULL, '', '', 'Paid', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(443, 'Proposal', '2021-01-19', 37, 'saim sahabir', 43019, 'Percentage', NULL, 0, 43019, '3011.33', 0, 46030.3, 'Proposal-000121', 'N/A', '#00ff00', '#ffffff', 1, NULL, NULL, '2021-01-19', '2021-01-19', NULL, 'gfff', 'gfffff', '', 'download', '2021-01-19', 1, 1, 'Live'),
(444, 'Proposal', '2021-01-28', 23, 'saim sahabir', 38, 'Percentage', NULL, 0, 38, '2.66', 0, 40.66, 'Proposal-000122', 'N/A', '#ffffff', '#000000', 1, NULL, NULL, '2021-01-28', '2021-01-28', NULL, 'jjj', 'hyy', '', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(445, 'Proposal', '2021-01-28', 23, 'saim sahabir', 38, 'Percentage', NULL, 0, 38, '2.66', 0, 40.66, 'Proposal-000122', 'N/A', '#ffffff', '#000000', 1, NULL, NULL, '2021-01-28', '2021-01-28', NULL, 'jjj', 'hyy', '', 'download', '2021-01-28', 1, 1, 'Live'),
(446, 'Proposal', '2021-01-28', 26, 'saim sahabir', 43038, 'Percentage', NULL, 0, 43038, '3012.66', 0, 46050.7, 'Proposal-000124', 'N/A', '#6fa8dc', '#ffffff', 1, NULL, NULL, '2021-01-28', '2021-01-28', NULL, 'jhh', 'hhh', '', 'preview', '2021-01-28', 1, 1, 'Live'),
(447, 'Proposal', '2021-02-08', 41, 'test', 43019, 'Percentage', NULL, 21509.5, 21509.5, '1505.665', 0, 23015.2, 'Proposal-000125', 'N/A', '#ffffff', '#000000', 1, NULL, NULL, '2021-02-08', '2021-02-08', NULL, 'iijed', 'jshuhus', '', 'EMAILED', '2021-02-08', 1, 1, 'Live'),
(448, 'Proposal', '2021-02-08', 2, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000126', 'N/A', '#6fa8dc', '#000000', 1, NULL, NULL, '2021-02-08', '2021-02-08', NULL, 'dd', 'dd', '', 'DRAFT', '0000-00-00', 1, 1, 'delete'),
(449, 'Proposal', '2021-02-08', 2, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, 'Proposal-000126', 'N/A', '#6fa8dc', '#000000', 1, NULL, NULL, '2021-02-08', '2021-02-08', NULL, 'dd', 'dd', '', 'download', '2021-02-08', 1, 1, 'Live'),
(450, 'Invoice', '2021-02-08', 39, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#000000', 1, 'Invoice-000029', NULL, '2021-02-08', '2021-02-08', 'Cash On Delivery', 'jjj', 'jjjj', 'Paid', 'DRAFT', '0000-00-00', 1, 1, 'delete'),
(451, 'Invoice', '2021-02-08', 39, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#000000', 1, 'Invoice-000029', NULL, '2021-02-08', '2021-02-08', 'Cash On Delivery', 'jjj', 'jjjj', 'Paid', 'DRAFT', '0000-00-00', 1, 1, 'Live'),
(452, 'Invoice', '2021-02-08', 39, 'saim sahabir', 19, 'Percentage', NULL, 0, 19, '1.33', 0, 20.33, NULL, 'N/A', '#6fa8dc', '#000000', 1, 'Invoice-000029', NULL, '2021-02-08', '2021-02-08', 'Cash On Delivery', 'jjj', 'jjjj', 'Paid', 'download', '2021-02-08', 1, 1, 'Live'),
(453, 'Invoice', '2021-02-09', 42, 'kena kata ', 43019, 'Percentage', NULL, 6452.85, 36566.1, '2559.6304999999998', 0, 39125.8, NULL, 'N/A', '#ffffff', '#000000', 1, 'Invoice-000032', NULL, '2021-02-09', '2021-02-09', 'Cash On Delivery', 'jkedjhweuf', 'wejkhuhefuae', 'Paid', 'DRAFT', '0000-00-00', 1, 1, 'delete'),
(454, 'Invoice', '2021-02-09', 42, 'kena kata ', 43019, 'Percentage', NULL, 6452.85, 36566.1, '2559.6304999999998', 0, 39125.8, NULL, 'N/A', '#ffffff', '#000000', 1, 'Invoice-000032', NULL, '2021-02-09', '2021-02-09', 'Cash On Delivery', 'jkedjhweuf', 'wejkhuhefuae', 'Paid', 'EMAILED', '2021-02-09', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proposal_invoice_products_services`
--

CREATE TABLE `tbl_proposal_invoice_products_services` (
  `id` bigint(12) NOT NULL,
  `product_service_id` int(10) DEFAULT NULL,
  `quantity_amount` float DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `total` float NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `proposal_invoice_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live',
  `tax_rate` varchar(255) DEFAULT '0.00',
  `tax_amount` varchar(255) DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_proposal_invoice_products_services`
--

INSERT INTO `tbl_proposal_invoice_products_services` (`id`, `product_service_id`, `quantity_amount`, `rate`, `total`, `description`, `proposal_invoice_id`, `user_id`, `company_id`, `del_status`, `tax_rate`, `tax_amount`) VALUES
(487, 15, 1, 4, 4, '', 428, 1, 1, 'Live', '2', '0.080'),
(486, 25, 1, 22, 22, '', 427, 1, 1, 'Live', '2', '0.440'),
(485, 5, 1, 19, 19, '', 426, 1, 1, 'Live', '2', '0.760'),
(484, 5, 1, 19, 19, '', 426, 1, 1, 'Live', '2', '0.760'),
(483, 5, 1, 19, 19, '', 425, 1, 1, 'Live', '2', '0.380'),
(482, 5, 1, 19, 19, '', 424, 1, 1, 'Live', '2', '0.380'),
(481, 7, 1, 100, 100, '', 423, 1, 1, 'Live', '2', '862.760'),
(480, 8, 1, 43000, 43000, '', 423, 1, 1, 'Live', '2', '862.760'),
(479, 5, 1, 19, 19, '', 423, 1, 1, 'Live', '2', '862.760'),
(478, 5, 1, 19, 19, '', 423, 1, 1, 'Live', '2', '862.760'),
(477, 5, 1, 19, 19, '', 422, 1, 1, 'Live', '2', '0.380'),
(476, 5, 1, 19, 19, '', 421, 1, 1, 'Live', '2', '0.380'),
(475, 5, 1, 19, 19, '', 420, 1, 1, 'Live', '2', '0.380'),
(474, 5, 1, 19, 19, '', 419, 1, 1, 'Live', '2', '0.380'),
(473, 5, 1, 19, 19, '', 418, 1, 1, 'Live', '2', '0.380'),
(472, 5, 1, 19, 19, '', 417, 1, 1, 'Live', '2', '0.380'),
(471, 5, 1, 19, 19, '', 416, 1, 1, 'Live', '2', '0.380'),
(470, 5, 1, 19, 19, '', 415, 1, 1, 'Live', '2', '0.380'),
(469, 5, 1, 19, 19, '', 414, 1, 1, 'Live', '2', '0.380'),
(468, 5, 1, 19, 19, '', 413, 1, 1, 'Live', '2', '0.380'),
(467, 5, 1, 19, 19, '', 412, 1, 1, 'Live', '2', '0.380'),
(466, 5, 1, 19, 19, '', 411, 1, 1, 'Live', '2', '0.380'),
(465, 5, 1, 19, 19, '', 410, 1, 1, 'Live', '2', '0.760'),
(464, 5, 1, 19, 19, '', 410, 1, 1, 'Live', '2', '0.760'),
(463, 5, 1, 19, 19, '', 409, 1, 1, 'Live', '2', '1.140'),
(462, 5, 1, 19, 19, '', 409, 1, 1, 'Live', '2', '1.140'),
(461, 5, 1, 19, 19, '', 409, 1, 1, 'Live', '2', '1.140'),
(460, 5, 1, 19, 19, '', 408, 1, 1, 'Live', '2', '0.380'),
(459, 5, 1, 19, 19, '', 407, 1, 1, 'Live', '2', '0.380'),
(458, 5, 1, 19, 19, '', 406, 1, 1, 'Live', '2', '0.380'),
(457, 5, 1, 19, 19, '', 405, 1, 1, 'Live', '2', '0.380'),
(456, 15, 1, 4, 4, '', 404, 1, 1, 'Live', '2', '0.080'),
(455, 5, 1, 19, 19, '', 403, 1, 1, 'Live', '2', '0.380'),
(454, 8, 1, 43000, 43000, '', 402, 1, 1, 'Live', '2', '860.000'),
(453, 28, 1, 33, 33, '', 401, 1, 1, 'Live', '2', '0.660'),
(452, 5, 1, 19, 19, '', 400, 1, 1, 'Live', '2', '0.380'),
(451, 5, 1, 19, 19, '', 399, 1, 1, 'Live', '2', '0.380'),
(450, 5, 1, 19, 19, '', 398, 1, 1, 'Live', '2', '0.380'),
(449, 5, 1, 19, 19, '', 397, 1, 1, 'Live', '2', '0.380'),
(448, 8, 1, 43000, 43000, '', 396, 1, 1, 'Live', '2', '860.380'),
(447, 5, 1, 19, 19, '', 396, 1, 1, 'Live', '2', '860.380'),
(446, 5, 1, 19, 19, '', 395, 1, 1, 'Live', '2', '0.380'),
(445, 5, 1, 19, 19, '', 394, 1, 1, 'Live', '2', '0.380'),
(444, 8, 1, 43000, 43000, '', 393, 1, 1, 'Live', '2', '860.000'),
(443, 5, 1, 19, 19, '', 392, 1, 1, 'Live', '2', '0.380'),
(442, 5, 1, 19, 19, '', 391, 1, 1, 'Live', '2', '0.380'),
(441, 5, 1, 19, 19, '', 390, 1, 1, 'Live', '2', '0.380'),
(440, 8, 1, 43000, 43000, '', 389, 1, 1, 'Live', '2', '860.000'),
(439, 8, 1, 43000, 43000, '', 388, 1, 1, 'Live', '2', '860.000'),
(438, 15, 1, 4, 4, '', 387, 1, 1, 'Live', '2', '0.080'),
(437, 1, 1, 20, 20, '', 386, 1, 1, 'Live', '2', '0.400'),
(436, 5, 1, 19, 19, '', 385, 1, 1, 'Live', '2', '0.380'),
(435, 8, 1, 43000, 43000, '', 384, 1, 1, 'Live', '2', '860.000'),
(434, 6, 1, 100, 100, '', 383, 1, 1, 'Live', '2', '2.000'),
(433, 5, 1, 19, 19, '', 382, 1, 1, 'Live', '2', '0.380'),
(432, 5, 1, 19, 19, '', 381, 1, 1, 'Live', '2', '0.380'),
(431, 5, 1, 19, 19, '', 380, 1, 1, 'Live', '2', '0.380'),
(430, 5, 1, 19, 19, '', 379, 1, 1, 'Live', '2', '0.380'),
(429, 5, 1, 19, 19, '', 378, 1, 1, 'Live', '2', '0.380'),
(428, 5, 1, 19, 19, '', 377, 1, 1, 'Live', '2', '0.380'),
(427, 5, 1, 19, 19, '', 376, 1, 1, 'Live', '2', '378.734'),
(426, 8, 1, 43000, 43000, '', 376, 1, 1, 'Live', '2', '378.734'),
(425, 5, 1, 19, 19, '', 376, 1, 1, 'Live', '2', '378.734'),
(424, 5, 1, 19, 19, '', 375, 1, 1, 'Live', '2', '0.380'),
(423, 8, 1, 43000, 43000, '', 374, 1, 1, 'Live', '2', '860.000'),
(422, 5, 1, 19, 19, '', 373, 1, 1, 'Live', '2', '0.380'),
(421, 5, 1, 19, 19, '', 372, 1, 1, 'Live', '2', '0.380'),
(420, 5, 1, 19, 19, '', 371, 1, 1, 'Live', '2', '0.380'),
(419, 8, 1, 43000, 43000, '', 370, 1, 1, 'Live', '2', '860.000'),
(418, 5, 1, 19, 19, '', 369, 1, 1, 'Live', '2', '0.380'),
(417, 5, 1, 19, 19, '', 368, 1, 1, 'Live', '2', '0.380'),
(416, 5, 1, 19, 19, '', 367, 1, 1, 'Live', '2', '860.380'),
(415, 8, 1, 43000, 43000, '', 367, 1, 1, 'Live', '2', '860.380'),
(414, 5, 1, 19, 19, '', 366, 1, 1, 'Live', '2', '0.380'),
(413, 5, 1, 19, 19, '', 365, 1, 1, 'Live', '2', '0.380'),
(412, 8, 1, 43000, 43000, '', 364, 1, 1, 'Live', '2', '860.000'),
(411, 5, 1, 19, 19, '', 363, 1, 1, 'Live', '2', '0.380'),
(410, 5, 1, 19, 19, '', 362, 1, 1, 'Live', '2', '0.380'),
(409, 5, 1, 19, 19, '', 361, 1, 1, 'Live', '2', '0.380'),
(408, 8, 1, 43000, 43000, '', 360, 1, 1, 'Live', '2', '860.380'),
(407, 5, 1, 19, 19, '', 360, 1, 1, 'Live', '2', '860.380'),
(406, 8, 1, 43000, 43000, '', 359, 1, 1, 'Live', '2', '860.000'),
(405, 5, 1, 19, 19, '', 358, 1, 1, 'Live', '2', '0.380'),
(403, 5, 1, 19, 19, '', 357, 1, 1, 'Live', '2', '0.760'),
(404, 5, 1, 19, 19, '', 357, 1, 1, 'Live', '2', '0.760'),
(402, 5, 1, 19, 19, '', 356, 1, 1, 'Live', '2', '0.380'),
(401, 8, 1, 43000, 43000, '', 355, 1, 1, 'Live', '2', '860.000'),
(400, 5, 1, 19, 19, '', 354, 1, 1, 'Live', '2', '0.380'),
(398, 5, 1, 19, 19, '', 352, 1, 1, 'Live', '2', '0.380'),
(399, 5, 1, 19, 19, '', 353, 1, 1, 'Live', '2', '0.380'),
(397, 5, 1, 19, 19, '', 351, 1, 1, 'Live', '2', '0.380'),
(395, 5, 1, 19, 19, '', 349, 1, 1, 'Live', '2', '0.380'),
(396, 5, 1, 19, 19, '', 350, 1, 1, 'Live', '2', '0.380'),
(394, 5, 1, 19, 19, '', 348, 1, 1, 'Live', '2', '0.380'),
(392, 5, 1, 19, 19, '', 346, 1, 1, 'Live', '2', '0.380'),
(393, 5, 1, 19, 19, '', 347, 1, 1, 'Live', '2', '0.380'),
(391, 5, 1, 19, 19, '', 345, 1, 1, 'Live', '2', '0.380'),
(390, 5, 1, 19, 19, '', 344, 1, 1, 'Live', '2', '0.380'),
(389, 8, 1, 43000, 43000, '', 343, 1, 1, 'Live', '2', '860.000'),
(388, 5, 1, 19, 19, '', 342, 1, 1, 'Live', '2', '0.380'),
(387, 5, 1, 19, 19, '', 341, 1, 1, 'Live', '2', '0.380'),
(386, 5, 1, 19, 19, '', 340, 1, 1, 'Live', '2', '0.380'),
(385, 5, 1, 19, 19, '', 339, 1, 1, 'Live', '2', '0.380'),
(384, 8, 1, 43000, 43000, '', 338, 1, 1, 'Live', '2', '860.000'),
(383, 5, 1, 19, 19, '', 337, 1, 1, 'Live', '2', '0.380'),
(382, 8, 1, 43000, 43000, '', 336, 1, 1, 'Live', '2', '860.000'),
(381, 5, 1, 19, 19, '', 335, 1, 1, 'Live', '2', '0.380'),
(380, 5, 1, 19, 19, '', 334, 1, 1, 'Live', '2', '0.380'),
(379, 8, 1, 43000, 43000, '', 333, 1, 1, 'Live', '2', '860.000'),
(378, 5, 1, 19, 19, '', 332, 1, 1, 'Live', '2', '0.380'),
(376, 8, 1, 43000, 43000, '', 330, 1, 1, 'Live', '2', '860.000'),
(377, 5, 1, 19, 19, '', 331, 1, 1, 'Live', '2', '0.380'),
(375, 8, 1, 43000, 43000, '', 329, 1, 1, 'Live', '2', '860.000'),
(374, 5, 1, 19, 19, '', 328, 1, 1, 'Live', '2', '0.380'),
(373, 5, 1, 19, 19, '', 327, 1, 1, 'Live', '2', '0.380'),
(372, 5, 1, 19, 19, '', 326, 1, 1, 'Live', '2', '0.760'),
(371, 5, 1, 19, 19, '', 326, 1, 1, 'Live', '2', '0.760'),
(370, 5, 1, 19, 19, '', 325, 1, 1, 'Live', '2', '0.760'),
(369, 5, 1, 19, 19, '', 325, 1, 1, 'Live', '2', '0.760'),
(368, 15, 1, 4, 4, '', 324, 1, 1, 'Live', '2', '0.460'),
(367, 5, 1, 19, 19, '', 324, 1, 1, 'Live', '2', '0.460'),
(366, 8, 1, 43000, 43000, 'bgg', 323, 1, 1, 'Live', '2', '860.000'),
(365, 5, 1, 19, 19, '', 322, 1, 1, 'Live', '2', '0.380'),
(364, 8, 1, 43000, 43000, '', 321, 1, 1, 'Live', '2', '860.380'),
(363, 5, 1, 19, 19, '', 321, 1, 1, 'Live', '2', '860.380'),
(362, 5, 1, 19, 19, '44', 320, 1, 1, 'Live', '2', '0.380'),
(361, 5, 1, 19, 19, '', 319, 1, 1, 'Live', '2', '0.380'),
(360, 5, 1, 19, 19, '', 318, 1, 1, 'Live', '2', '0.760'),
(359, 5, 1, 19, 19, '', 318, 1, 1, 'Live', '2', '0.760'),
(358, 5, 1, 19, 19, '', 317, 1, 1, 'Live', '2', '0.380'),
(357, 10, 1, 567, 567, '', 316, 1, 1, 'Live', '2', '11.720'),
(356, 5, 1, 19, 19, '', 316, 1, 1, 'Live', '2', '11.720'),
(355, 5, 1, 19, 19, '', 315, 1, 1, 'Live', '2', '0.760'),
(354, 5, 1, 19, 19, '', 315, 1, 1, 'Live', '2', '0.760'),
(353, 5, 1, 19, 19, '', 314, 1, 1, 'Live', '2', '0.760'),
(352, 5, 1, 19, 19, '', 314, 1, 1, 'Live', '2', '0.760'),
(351, 5, 1, 19, 19, '', 313, 1, 1, 'Live', '2', '0.380'),
(350, 7, 1, 100, 100, '', 312, 1, 1, 'Live', '2', '2.380'),
(349, 5, 1, 19, 19, '', 312, 1, 1, 'Live', '2', '2.380'),
(348, 5, 1, 19, 19, '', 311, 1, 1, 'Live', NULL, NULL),
(347, 5, 1, 19, 19, '', 310, 1, 1, 'Live', NULL, NULL),
(346, 5, 1, 19, 19, '', 309, 1, 1, 'Live', '2', '0.380'),
(345, 5, 1, 19, 19, '', 308, 1, 1, 'Live', '2', '0.00'),
(344, 5, 1, 19, 19, '', 307, 1, 1, 'Live', '2', '0.38'),
(343, 8, 1, 43000, 43000, '', 306, 1, 1, 'Live', '2', '387.00'),
(342, 8, 1, 43000, 43000, '', 305, 1, 1, 'Live', '2', '387.00'),
(341, 5, 1, 19, 19, '', 304, 1, 1, 'Live', '2', '0.38'),
(340, 5, 1, 19, 19, '', 303, 1, 1, 'Live', '2', '0.38'),
(339, 5, 1, 19, 19, '', 302, 1, 1, 'Live', '2', '0.38'),
(338, 5, 1, 19, 19, '', 301, 1, 1, 'Live', '2', '0.38'),
(337, 5, 1, 19, 19, '', 300, 1, 1, 'Live', '2', '0.76'),
(336, 5, 1, 19, 19, '', 300, 1, 1, 'Live', '2', '0.76'),
(335, 5, 1, 19, 19, '', 299, 1, 1, 'Live', '2', '0.38'),
(334, 5, 1, 19, 19, '', 298, 1, 1, 'Live', '2', '0.38'),
(333, 5, 1, 19, 19, '', 297, 1, 1, 'Live', '2', '0.38'),
(332, 6, 1, 100, 100, '', 296, 1, 1, 'Live', '2', '2.38'),
(331, 5, 1, 19, 19, '', 296, 1, 1, 'Live', '2', '2.38'),
(330, 5, 1, 19, 19, '', 295, 1, 1, 'Live', '2', '0.38'),
(488, 5, 1, 19, 19, '', 429, 1, 1, 'Live', '2', '0.380'),
(489, 5, 1, 19, 19, '', 430, 1, 1, 'Live', '2', '0.380'),
(490, 15, 1, 4, 4, '', 431, 1, 1, 'Live', '2', '0.080'),
(491, 5, 1, 19, 19, '', 432, 1, 1, 'Live', '2', '0.380'),
(492, 15, 1, 4, 4, '', 433, 1, 1, 'Live', '2', '0.080'),
(493, 5, 1, 19, 19, '', 434, 1, 1, 'Live', '2', '0.380'),
(494, 5, 1, 19, 19, '', 435, 1, 1, 'Live', '2', '0.380'),
(495, 5, 1, 19, 19, '', 436, 1, 1, 'Live', '2', '0.380'),
(496, 5, 1, 19, 19, '', 437, 1, 1, 'Live', '2', '0.380'),
(497, 5, 1, 19, 19, '', 438, 1, 1, 'Live', '2', '860.380'),
(498, 8, 1, 43000, 43000, '', 438, 1, 1, 'Live', '2', '860.380'),
(499, 1, 1, 20, 20, '', 439, 1, 1, 'Live', '2', '860.400'),
(500, 8, 1, 43000, 43000, '', 439, 1, 1, 'Live', '2', '860.400'),
(501, 5, 1, 19, 19, '', 440, 1, 1, 'Live', '2', '0.380'),
(502, 5, 1, 19, 19, '', 441, 1, 1, 'Live', '2', '0.380'),
(503, 5, 1, 19, 19, '', 442, 1, 1, 'Live', '2', '0.380'),
(504, 8, 1, 43000, 43000, '', 443, 1, 1, 'Live', '2', '860.380'),
(505, 5, 1, 19, 19, '', 443, 1, 1, 'Live', '2', '860.380'),
(506, 5, 1, 19, 19, '', 444, 1, 1, 'Live', '2', '0.760'),
(507, 5, 1, 19, 19, '', 444, 1, 1, 'Live', '2', '0.760'),
(508, 5, 1, 19, 19, '', 445, 1, 1, 'Live', '2', '0.760'),
(509, 5, 1, 19, 19, '', 445, 1, 1, 'Live', '2', '0.760'),
(510, 5, 1, 19, 19, '', 446, 1, 1, 'Live', '2', '860.760'),
(511, 5, 1, 19, 19, '', 446, 1, 1, 'Live', '2', '860.760'),
(512, 8, 1, 43000, 43000, '', 446, 1, 1, 'Live', '2', '860.760'),
(513, 8, 1, 43000, 43000, '', 447, 1, 1, 'Live', '2', '430.190'),
(514, 5, 1, 19, 19, '', 447, 1, 1, 'Live', '2', '430.190'),
(515, 5, 1, 19, 19, '', 448, 1, 1, 'Live', '2', '0.380'),
(516, 5, 1, 19, 19, '', 449, 1, 1, 'Live', '2', '0.380'),
(517, 5, 1, 19, 19, '', 450, 1, 1, 'Live', '2', '0.380'),
(518, 5, 1, 19, 19, '', 451, 1, 1, 'Live', '2', '0.380'),
(519, 5, 1, 19, 19, '', 452, 1, 1, 'Live', '2', '0.380'),
(520, 8, 1, 43000, 43000, '', 453, 1, 1, 'Live', '2', '731.323'),
(521, 5, 1, 19, 19, '', 453, 1, 1, 'Live', '2', '731.323'),
(522, 8, 1, 43000, 43000, '', 454, 1, 1, 'Live', '2', '731.323'),
(523, 5, 1, 19, 19, '', 454, 1, 1, 'Live', '2', '731.323');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proposal_pdf`
--

CREATE TABLE `tbl_proposal_pdf` (
  `id` bigint(12) NOT NULL,
  `proposal_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_proposal_pdf`
--

INSERT INTO `tbl_proposal_pdf` (`id`, `proposal_id`, `attachment_id`, `user_id`, `company_id`, `del_status`) VALUES
(252, 447, 7, 1, 1, 'Live'),
(251, 446, 3, 1, 1, 'Live'),
(250, 445, 4, 1, 1, 'Live'),
(249, 445, 3, 1, 1, 'Live'),
(248, 444, 4, 1, 1, 'Live'),
(247, 444, 3, 1, 1, 'Live'),
(246, 443, 7, 1, 1, 'Live'),
(245, 443, 6, 1, 1, 'Live'),
(244, 434, 6, 1, 1, 'Live'),
(243, 434, 3, 1, 1, 'Live'),
(242, 433, 6, 1, 1, 'Live'),
(241, 431, 4, 1, 1, 'Live'),
(240, 431, 3, 1, 1, 'Live'),
(239, 415, 6, 1, 1, 'Live'),
(238, 415, 4, 1, 1, 'Live'),
(237, 415, 3, 1, 1, 'Live'),
(236, 410, 4, 1, 1, 'Live'),
(235, 410, 3, 1, 1, 'Live'),
(234, 409, 4, 1, 1, 'Live'),
(233, 409, 3, 1, 1, 'Live'),
(232, 376, 6, 1, 1, 'Live'),
(231, 376, 4, 1, 1, 'Live'),
(230, 376, 3, 1, 1, 'Live'),
(229, 351, 4, 1, 1, 'Live'),
(228, 351, 3, 1, 1, 'Live'),
(227, 324, 4, 1, 1, 'Live'),
(226, 324, 3, 1, 1, 'Live'),
(225, 323, 4, 1, 1, 'Live'),
(224, 323, 3, 1, 1, 'Live'),
(223, 320, 4, 1, 1, 'Live'),
(222, 320, 3, 1, 1, 'Live'),
(221, 318, 6, 1, 1, 'Live'),
(220, 318, 4, 1, 1, 'Live'),
(219, 318, 3, 1, 1, 'Live'),
(218, 317, 6, 1, 1, 'Live'),
(217, 317, 4, 1, 1, 'Live'),
(216, 317, 3, 1, 1, 'Live'),
(215, 315, 4, 1, 1, 'Live'),
(214, 315, 3, 1, 1, 'Live'),
(213, 314, 7, 1, 1, 'Live'),
(212, 314, 6, 1, 1, 'Live'),
(211, 314, 4, 1, 1, 'Live'),
(210, 314, 3, 1, 1, 'Live'),
(209, 311, 4, 1, 1, 'Live'),
(208, 311, 3, 1, 1, 'Live'),
(207, 310, 4, 1, 1, 'Live'),
(206, 310, 3, 1, 1, 'Live'),
(205, 301, 4, 1, 1, 'Live'),
(204, 301, 3, 1, 1, 'Live'),
(203, 301, 2, 1, 1, 'Live'),
(202, 300, 3, 1, 1, 'Live'),
(201, 300, 2, 1, 1, 'Live'),
(200, 299, 4, 1, 1, 'Live'),
(199, 299, 3, 1, 1, 'Live'),
(198, 299, 2, 1, 1, 'Live'),
(197, 297, 4, 1, 1, 'Live'),
(196, 297, 3, 1, 1, 'Live'),
(195, 297, 2, 1, 1, 'Live'),
(194, 296, 3, 1, 1, 'Live'),
(193, 296, 2, 1, 1, 'Live'),
(192, 295, 4, 1, 1, 'Live'),
(191, 295, 3, 1, 1, 'Live'),
(190, 295, 2, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proposal_photo`
--

CREATE TABLE `tbl_proposal_photo` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file` varchar(150) DEFAULT NULL,
  `proposal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_proposal_photo`
--

INSERT INTO `tbl_proposal_photo` (`id`, `title`, `file`, `proposal_id`, `user_id`, `company_id`, `del_status`) VALUES
(62, 'Next Photo', ' 3333_PHOTO_1609922755.jpg', 324, 1, 1, 'Live'),
(61, 'Computer Photo', ' 3333_PHOTO_1609922708.png', 324, 1, 1, 'Live'),
(60, 'eee', ' 3333_PHOTO_1609870563.png', 323, 1, 1, 'Live'),
(59, 'ffaa', ' 3333_PHOTO_1609870544.png', 323, 1, 1, 'Live'),
(57, 'hhh', ' 3333_PHOTO_1609870352.jpg', 322, 1, 1, 'Live'),
(58, 'hhh', ' 3333_PHOTO_1609870352.jpg', 323, 1, 1, 'Live'),
(56, 'eee', ' 3333_PHOTO_1609870095.jpg', 321, 1, 1, 'Live'),
(55, 'hhhh', ' 3333_PHOTO_1609870081.png', 321, 1, 1, 'Live'),
(54, 'eee', ' 3333_PHOTO_1609870095.jpg', 320, 1, 1, 'Live'),
(52, 'eee', ' 3333_PHOTO_1609772739.png', 318, 1, 1, 'Live'),
(53, 'hhhh', ' 3333_PHOTO_1609870081.png', 320, 1, 1, 'Live'),
(51, 'eee', ' 3333_PHOTO_1609772739.png', 317, 1, 1, 'Live'),
(50, 'eee', ' 3333_PHOTO_1609431919.png', 315, 1, 1, 'Live'),
(49, 'eee', ' 3333_PHOTO_1609398256.jpg', 314, 1, 1, 'Live'),
(48, 'eee', ' 3333_PHOTO_1609397018.jpg', 311, 1, 1, 'Live'),
(47, 'eee', ' 3333_PHOTO_1609397018.jpg', 310, 1, 1, 'Live'),
(46, 'eee', ' 3333_PHOTO_1609072089.jpg', 301, 1, 1, 'Live'),
(45, 'nnn', ' 3333_PHOTO_1609071939.jpg', 300, 1, 1, 'Live'),
(44, 'nnn', ' 3333_PHOTO_1609071939.jpg', 299, 1, 1, 'Live'),
(43, 'eee', ' 3333_PHOTO_1609055771.jpg', 296, 1, 1, 'Live'),
(42, 'eee', ' 3333_PHOTO_1609055771.jpg', 295, 1, 1, 'Live'),
(63, 'soujsd', ' 3333_PHOTO_1610353666.png', 376, 1, 1, 'Live'),
(64, 'eee', ' 3333_PHOTO_1610353678.jpg', 376, 1, 1, 'Live'),
(65, 'soujsd', ' 3333_PHOTO_1610353666.png', 377, 1, 1, 'Live'),
(66, 'eee', ' 3333_PHOTO_1610353678.jpg', 377, 1, 1, 'Live'),
(67, 'eee', ' 3333_PHOTO_1610556557.png', 409, 1, 1, 'Live'),
(68, 'eee', ' 3333_PHOTO_1610563117.jpg', 410, 1, 1, 'Live'),
(69, 'eee', ' 3333_PHOTO_1610570076.png', 415, 1, 1, 'Live'),
(70, 'eee', ' 3333_PHOTO_1610611997.jpg', 431, 1, 1, 'Live'),
(71, 'eee', ' 3333_PHOTO_1610616105.png', 433, 1, 1, 'Live'),
(72, 'eee', ' 3333_PHOTO_1610617542.jpg', 434, 1, 1, 'Live'),
(73, 'eee', ' 3333_PHOTO_1611067186.png', 443, 1, 1, 'Live'),
(74, 'eee', ' 3333_PHOTO_1611847966.png', 444, 1, 1, 'Live'),
(75, 'eee', ' 3333_PHOTO_1611847966.png', 445, 1, 1, 'Live'),
(76, 'eee', ' 3333_PHOTO_1611847966.png', 446, 1, 1, 'Live'),
(77, 'eee', ' 3333_PHOTO_1611853283.png', 446, 1, 1, 'Live'),
(78, 'eee', ' 3333_PHOTO_1612757872.png', 447, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sessions`
--

CREATE TABLE `tbl_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sessions`
--

INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('s5pnq9vi64gd8pmcdq798rhivijcc1is', '::1', 1610307759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303330373735393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('30bm8fgvra6mifgeaee81a1nrgrtsm26', '::1', 1610308148, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303330383134383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('aom94evu552vb9a8sju92t16u0fkrg8p', '::1', 1610308712, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303330383731323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('lpqlls3ihh38vm2us90mbm79psqhth55', '::1', 1610309850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303330393835303b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('g51j3o7f9l535l2h264ose5am3c81ao2', '::1', 1610311059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303331313035393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('ic3hrgk15vd3doq0j5f37c5ni4ceunle', '::1', 1610313166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303331333136363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('tgfl40lvg6vg4m1h70l6vdnvki7vb6s2', '::1', 1610313574, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303331333537343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('h59rvmpetajlabdfksqhafqm5kl89f92', '::1', 1610314995, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303331343939353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('t6r786re39gumqm46tm12cc169c4esom', '::1', 1610316089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303331363038393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('cpet483hr5v3o6bch9eqdgkbiamu2rd9', '::1', 1610318612, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303331383631323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('uj4ottbl43t67hq1dua8kn47nvk6sv7p', '::1', 1610318838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303331383631323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('s4s0h6s7qu7tnb0epp8asv0nv24l39g1', '::1', 1610353838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303335333833383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('q62av8nds1timdjk1enn6qupu2evgkgt', '::1', 1610353943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303335333833383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('egf7jnacou36bdcu6ctrjt0tf8q2rasn', '::1', 1610365710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303336353731303b),
('jddoah680sq65ikrdm2n7k56lk0qkrrb', '::1', 1610367597, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303336373539373b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('aqtlr1i2sq88k4fpsg5mjsvqkcc7p4c0', '::1', 1610369723, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303336393732333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('e8dp4vtfpi1622dcj71dntcbf43u9pol', '::1', 1610371973, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303337313937333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('rvra7msmperljmui4bov1li972h8h1gr', '::1', 1610372282, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303337323238323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('rngndpd8brg5138jprj2bm8n34v87548', '::1', 1610373162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303337333136323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('7ih9trhcecuf2f3cn38gt7m7aeaq5833', '::1', 1610373994, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303337333939343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('cqoqjm8qkcb5slo6tthjeitv38ukrqg2', '::1', 1610375772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303337353737323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('vnmkm9pmaojrllcph7fgi7cd462u2p7s', '::1', 1610377293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303337373239333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('6nos30pt72uo2gkdnn3bc4bhl94b3r8k', '::1', 1610379674, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303337393637343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('581ceqhij266rdhtnpva7f680pc78aaa', '::1', 1610381502, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303338313530323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('mqv5u08u4chi04k022err9dcq3pq4crc', '::1', 1610381923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303338313932333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('26h6okvjd2v4gdarvfom4n6c245qoanp', '::1', 1610383157, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303338333135373b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('3ol74blj89q04ersmpigbdks4phidp4h', '::1', 1610383505, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303338333530353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('qfivacgn2qgocpjn9rioa923s0d3e8mp', '::1', 1610384179, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303338343137393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('6c1jeimvdiou2ms2cnc5hr5lv1ee1k1v', '::1', 1610384544, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303338343534343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('8sp5ibqen363am4iado5omaa1asg2j77', '::1', 1610385762, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303338353736323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('74dljlvsjsn3t94eet31c16q7stea3u1', '::1', 1610389058, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303338393035383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('f70ot3eu07cnfp3jgpprn2e8o0f7sivp', '::1', 1610394872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303339343837323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('4jiek7mre1qtt3k5ikgbb8fs22bk00ui', '::1', 1610396210, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303339363231303b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b),
('25257nt9e08d2jjhnth3aehj80gpj92k', '::1', 1610396515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303339363531353b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('eibepm4vg8n5q20cbmdmc6bvar7m86tr', '::1', 1610397204, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303339373230343b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('9qjs2v6k9ipj8ojsdk9fcl6fiuitf5gs', '::1', 1610397925, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303339373932353b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a33343a2250726f706f73616c20686173206265656e2073656e742073756363657366756c6c79223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('76qjd2r0kiqrc5a786ccigstskqn50me', '::1', 1610401998, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303430313939383b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('7afd19jqcs030f8p4b275abd2buiu85q', '::1', 1610398548, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303339383534373b),
('rj5rg7oqegbubsin551sp6hvg42tt4h2', '::1', 1610402412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303430323431323b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('vbqpei687233f0g6honvgcsanprid66h', '::1', 1610402899, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303430323431323b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32353a227361696d736168616269723132697440676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('7btcqllcfpo8ugnek9cdkbgceuodegpn', '::1', 1610403194, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303430333139343b),
('f6rb3gug772mekfc1nsvkmpgjult1fqc', '::1', 1610434827, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303433343832373b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('0q84ir7tbl2p8ul3did1p9stkp5minlg', '::1', 1610433628, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303433333632383b),
('j7aomu93r11kov3vjemjg7sth0hlmbim', '::1', 1610442269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303434323236393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('tq44jdvrqcqjlluvkdu9vl8etoa0ec4o', '::1', 1610442172, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303434323137323b),
('q5ij9m87sa1148tmq34fo42erhumcjft', '::1', 1610445224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303434353232343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('t3k3v6u92oeqa0hd159c1v3hurpi8i6r', '::1', 1610445225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303434353232343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('n5hasne5qghafjdga9an85kvp9ej6k2n', '::1', 1610456550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303435363535303b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('1035ogmd12t8901ff14u9kkqf45ic6pp', '::1', 1610456550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303435363535303b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('s7ktjhfbqrp5c1lf4c70dlmeb67bqn0a', '::1', 1610473134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303437333133343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('qaueel5mla5d9m3cd61km93rfnfo4oo1', '::1', 1610471888, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303437313838383b),
('1jj3gr8et3qgd43a1nk5h7vitok11jkr', '::1', 1610473136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303437333133343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('mtjnsfct8sbsbvagf816tg8hjj9ua22b', '::1', 1610511517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303531313531373b),
('fchodm8rld7rfo6fqh1369u091uacr1k', '::1', 1610512359, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303531323335393b),
('0e0n8c3c5b4r5626fr8f1ubgpild8nk2', '::1', 1610511894, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303531313839343b),
('7j3pi3rluillim68rp86vtfla9ugjovj', '::1', 1610512234, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303531323233343b),
('vift0m9ih44q1v89d2b7c8tq6mor10m0', '::1', 1610512355, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303531323233343b),
('rvc0ccj9e9bbpij52nu0r2mnq5v261qt', '::1', 1610512883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303531323838333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('mc1n9lpcgjlrmt8jda4kogdkotuhphfp', '::1', 1610514292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303531343239323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('ig6n8o8t8oi1vro7a4trcibdu0mkn1de', '::1', 1610514402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303531343239323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('0g0t86il0tegeaf2dhe1qjqdd959mrh5', '::1', 1610528616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303532383631363b),
('cp2iiko2k1fpuol6no8vavbnsb3d6up8', '::1', 1610528152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303532383135323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('oo0vh9qudokpkhfntkhb9bjbhor9egco', '::1', 1610528636, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303532383633363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('aupo3gpf3pgtu33t44c8ns4r0dt6hlis', '::1', 1610529975, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303532393937353b),
('u30m3925tbempb4uatnvk9f5j7simi1l', '::1', 1610535176, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303533353137363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('3u52mfbpf91uuk0ia4ok1o30jgn4oapj', '::1', 1610529975, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303532393937353b),
('32ndlvt7builpoau3ef4crkkcb1uh0gf', '::1', 1610537088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303533373038383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('den4cqpnlqsuvcqh0skc4e2ot0i1f9f1', '::1', 1610537454, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303533373435343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('ceq6c4mbmq2dmc43j9ngih56qfj5vn52', '::1', 1610540227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303534303232373b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('fnc0c8nm3r3c306ul7qfqmtdpapbokrb', '::1', 1610541904, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303534313930343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('o4vi9th59t3fgbo22s4svlneno78t5lj', '::1', 1610542312, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303534323331323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('7fof1b5uovvhbj2v6pp70im4d85c1c3t', '::1', 1610542613, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303534323631333b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('hlcefu028amir5q697f9tt0b9nm51tut', '::1', 1610542613, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303534323631333b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('tknqaauupj2n8132hsipt1740mqoe2ns', '::1', 1610544080, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303534343038303b),
('vhlu5orf5dklpob5o1mdgqg4qcipnk7b', '::1', 1610546072, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303534363037323b),
('521kuqv1e7b4tq95id76k2ou69or8u2v', '::1', 1610546073, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303534363037323b),
('l84ufgsscnvh8260vvfta3ojp3eecj6l', '::1', 1610554175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535343137353b),
('6m6p0fq4knlqu8nsflotcjte8vkn4pjd', '::1', 1610554561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535343536313b),
('0vd5r3qcqso5d29slee1kav0686id03s', '::1', 1610554882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535343838323b),
('kagve9nan5i7812vqusc1a88cj6c0hh5', '::1', 1610555192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535353139323b),
('api2hfe8tt9klvjq5c544lrp9f3tc28r', '::1', 1610555516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535353531363b),
('7465d9eu3rhsu5u64hrlm8p59vitnco9', '::1', 1610555878, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535353837383b),
('a98ipj7e9629t5oeb6qbldu8psbteeml', '::1', 1610556422, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535363432323b),
('u2157g1sgofijldhknhd6bckt5nvm1gk', '::1', 1610556761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535363736313b),
('bf9gu49cc0e22v56ik6m1le77ht5tnrh', '::1', 1610560864, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536303836343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('q1f9ti74sgaah5er91i9fqbhahkfklhb', '::1', 1610557062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535373036323b),
('391740b1m7a19k4pqtl8u2455usn2jk6', '::1', 1610557398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535373339383b),
('p4spilf84vvud9hgu5d0ggt0pahbka1g', '::1', 1610557702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535373730323b),
('t5p09mbc6n7pod3115pq8ts9rf6aif35', '::1', 1610558045, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535383034353b),
('ijf5c5tmt2u7felofe9d2sk1ebgdm6bs', '::1', 1610558446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535383434363b),
('vka7dro5gqflisvgq2qio5i9o327mdk0', '127.0.0.1', 1610558132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535383133323b),
('44lhpn8uoo1onismcdp8g1450i68ub1o', '127.0.0.1', 1610558132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535383133323b),
('re7dimg74m1trgrnm9om373t4j0hfj49', '127.0.0.1', 1610558135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535383133353b),
('pn25i4n7e276h7hl0mvpdicgfshlj9r1', '::1', 1610558732, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303535383434363b),
('sqpail7jt7aj7ej6t9lnhtkcin4las9e', '::1', 1610563049, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536333034393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('dt1pugfic3ppunreoijk5gn8a17bmn74', '::1', 1610563638, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536333633383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('ri352up0og5scp3gunlr0jlk1hqt1stv', '::1', 1610563945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536333934353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('5l9ji4h1l2134gugb8v4ehv07srcpdol', '::1', 1610564538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536343533383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('o1cdl1fe8ec95f4jbl8dof6br0trf98s', '::1', 1610565044, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536353034343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('p39mmfkduq37hso8tku4g0htamb3dc70', '::1', 1610565648, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536353634383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('7q2o1h4k96f9vvn7c6bmsbfkm6kiljrr', '::1', 1610566040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536363034303b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('4d1u214efsemno12foh9r9gifa2pbh9m', '::1', 1610566503, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536363530333b657863657074696f6e5f317c733a32343a22496e636f727265637420456d61696c2f50617373776f7264223b5f5f63695f766172737c613a313a7b733a31313a22657863657074696f6e5f31223b733a333a226f6c64223b7d),
('fhas5pl25imsdsob8tg69k4acad90srg', '::1', 1610566471, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536363437313b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('3jmho61tc2rguiv29bj4esjgtkd0cjnf', '::1', 1610567657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536373635373b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('tgo8etcd3pm8ahp09je38e7oqigk6oos', '::1', 1610567074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536373037343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('s7u8fjtg4c801saddrtut65r081451pf', '::1', 1610567153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536373037343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('17d35ag245767umo5h52skkjv2rgeja9', '::1', 1610567960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536373936303b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('4jc9ho4l7poet3mpgu49gmdj9ga08jr4', '::1', 1610568350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536383335303b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('lod0638tkrd972bk7ml2if0a12amns31', '::1', 1610568836, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303536383833363b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('kjdr9r5u86vk036c4c2k6crm69kqmj1f', '::1', 1610570039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303537303033393b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('ievri5ldqo61ahngupc1vhbffvc47a5h', '::1', 1610572629, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303537323632393b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('ihd1h0766htivn1fdct7p1hdn4cdv08k', '::1', 1610572943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303537323934333b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('i8jlj9am36lh7hpr6l8id8n32s87sfkt', '::1', 1610574856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303537343835363b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('rp5o0ea311g7m8gene1rnec9a9pf6r5o', '::1', 1610575192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303537353139323b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('cpv6urhjf0s36h7labklplf8062bu1fm', '::1', 1610575682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303537353638323b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('upieum6p2gg9d0nv4pjft7sev9r3v42u', '::1', 1610576147, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303537363134373b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('gb684pkv6cahvmqkn5k20qo68t87jth0', '::1', 1610576517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303537363134373b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('l26llbg96mj9knifbfp2behm5hlubk98', '::1', 1610607653, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303630373635333b),
('movrdk7rmtfobhh462hcf0e88esvqd2h', '::1', 1610608935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303630383933353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('cvv5cuto32lli5e1ov999n53l1fltb2b', '::1', 1610607654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303630373635333b),
('rbbup7h2e5pcbgssutv8j7ht4es31ats', '::1', 1610610141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303631303134313b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('iv6a6s5k1blpq4a4a83n3dn8h1au9mp1', '::1', 1610610829, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303631303832393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('5mq94f17mmh1t6gnhmi1iu1kir9mnond', '::1', 1610611364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303631313336343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('u90ks6tr35fumuntb3sucuidcu6f1so7', '::1', 1610611678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303631313637383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('ql2o94lc9dmoa575rhf1mjkrjrb0vhb0', '::1', 1610612911, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303631323931313b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('j6ppe5vk2hdflb8d5eh32mflva2hip3p', '::1', 1610615960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303631353936303b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('s7dbpvgl2q40nk72jm5s3mgas13unra5', '::1', 1610617482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303631373438323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('2c33obrm10kkb4m9d7ur7gud1kg3hk78', '::1', 1610621143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303632313134333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('7mutk8v4rl905tinuel4bmo58o09kanp', '::1', 1610617759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303631373735383b),
('r9k5mo6qamod6875eg7e497a46pbh8jv', '::1', 1610622460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303632323436303b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('q1s1s5hba7mg45mcbuqjsl4tuu6n3e8u', '::1', 1610622761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303632323736313b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('8aoo41u6n3cn68co67p3l26kheahnt2h', '::1', 1610623293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303632333239333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('1at54r6citjeftrj72d2r4d6q09squub', '::1', 1610628046, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303632383034363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('u73u1s5seok7vreo7bcsksnoo94mimf8', '::1', 1610628055, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303632383034363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('615v8d3ibtsgidj04nfhod6qduq9tff2', '::1', 1610638833, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303633383833333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('9th2f9g508saauak4e0dq4o9khip86o5', '::1', 1610639396, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303633393339363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('u31i7ooo0kelck13io369mvinsfrt0eh', '::1', 1610643907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303634333930373b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('cli2td0vhh4ae2udah40l1vveo2fd9vq', '::1', 1610640941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303634303933383b),
('cmvbcea3lkbdvt4tkssa3m66obtr3amv', '::1', 1610649606, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303634393630363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('oddi9kc75joo96h2g013rrvi5pq6h633', '::1', 1610649732, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303634393630363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('hkpccbajrrrvgednaerq0dvnfuor02id', '::1', 1610684489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303638343438393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('ko16v6qvk7l0eg5oslkan0bjqmk6c8fe', '::1', 1610685121, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303638353132313b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('q524659l7paqkhufqudl2f98pdvpdntq', '::1', 1610685833, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303638353833333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('coi1aq1nmfsro4hqf17rkjt8vlbsi2fg', '::1', 1610685833, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303638353833333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('862riqdcmc6q8eckqps9vm7p0912dapm', '::1', 1610699090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303639393038303b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('sfg7do6of2f91cvpaj1ei4tn532q5u4f', '::1', 1610708795, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303730383739353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('hb744l68l39s5jbtrpibl5rv8mhgucsn', '::1', 1610709487, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303730393438373b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('bkf88kvajjr25no74r9cgubctf8555ml', '::1', 1610710012, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303731303031323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('hvp2ucl60342tuiv8tltpi1cf7lou4qs', '::1', 1610715592, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303731353539323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('qjhltrke8huvtueil2fjlh3vbbr3c6gt', '::1', 1610716146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303731363134363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('v2h4k5t55euure2bm6rpsfhbjopmunoh', '::1', 1610716167, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303731363134363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('7ls95ojue581o4gpru6mj1p9rb9oavb3', '::1', 1610725284, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303732353238343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('ra9ojl26escik7a4j553cv342j71a6uu', '::1', 1610725765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303732353736353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('nktlri251h88k0ql7fkiug1ahavlsdub', '::1', 1610726722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303732363732323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('hsrto8a1fh94c50j12tpahdngeff1v0f', '::1', 1610728009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303732383030393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('qbutreoaa0o6m9ptqiu983urfeaop9op', '::1', 1610728415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303732383431353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('kmi4008uvv2vgit0dspqsksnt8ico9vl', '::1', 1610728208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303732383136333b),
('pog723j70h48fgi1ne6vlhe2s6b8kqbe', '::1', 1610732329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303733323332393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('o32t2aqilvr0ggj749fsgv2j6hhotqbp', '::1', 1610732330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303733323332393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('dgtl4h652gqfm09alr8pal4t4o78v2if', '::1', 1610735561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303733353432383b),
('4og26ehsetocigsi2222ie14fke28fde', '::1', 1610958486, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303935383237313b),
('dq750ummdu7n1eqp5ml64ktcl709ugtr', '::1', 1611067303, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313036373034323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('9om8bjkd08l3vc86n2mutl586ons60ik', '::1', 1611853288, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313834373538353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('sm03di1nh7egfl62tld0cjtuthsv6e76', '::1', 1612079069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323037383939303b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('pvjtji5r88444g5omtmecclp5dho8vuk', '::1', 1612090326, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323039303332363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('upqn5u3fa2oss6j4gajq325no5imvglr', '::1', 1612090326, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323039303332363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('r5mim2mml308vah54udqmam8kgmm7hgc', '::1', 1612176986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323137363938363b),
('40p35oj2r4v7rl5h7ei183vri5vq811v', '::1', 1612501119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323530303939363b657863657074696f6e5f317c733a32343a22496e636f727265637420456d61696c2f50617373776f7264223b5f5f63695f766172737c613a313a7b733a31313a22657863657074696f6e5f31223b733a333a226f6c64223b7d),
('5oq026dn74hmt0modolbtc5mod8qdrr7', '::1', 1612538155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323533383135353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('usak8hkl4lqi3rigsl8drjcpovfvjele', '::1', 1612538156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323533383135353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('se38mg3enql1ljn3io7q0ckqkl0gf3k2', '::1', 1612717996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323731373939363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('hpncqj7bo3q4bb593tuh11kfoqcpkgd9', '::1', 1612718449, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323731383434393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('tcct4jj5cqhrh6e68949392vif4657vh', '::1', 1612720826, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323732303832363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('21jdmgr1krdl4sa0m881rpga70tjjt6l', '::1', 1612720827, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323732303832363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('rtv1rv0ug6bsi1b38tse01e9a99jk4uj', '::1', 1612749916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323734393931363b),
('95hq468qsa3e4jbccq262jpu0q2s802r', '::1', 1612756364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323735363336343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('c37m4un761m2dag66bphv56i63pj3vqb', '::1', 1612757456, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323735373435363b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('ogn22oar8omona41eet4frtctv6tra07', '::1', 1612757765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323735373736353b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('dbp2icbou6mbc9d1ok42b9nc62qd8c66', '::1', 1612758033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323735373736353b6c616e67756167657c733a373a22656e676c697368223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b757365725f69647c733a313a2231223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b),
('8s08cok1spsr4i4df7hsmdlnmskq0qm2', '::1', 1612767490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323736373439303b),
('pcebvudesktgk5hquvtogub4jl4j2ahb', '::1', 1612789976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323738393937363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('096oep0gk99sf0442lc6hke3ngeen4iv', '::1', 1612790846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323739303834363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('8o1rbg83gfsefml19csjme001ps16jsa', '::1', 1612791289, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323739313238393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('3sn1oler2tlhfmcpctk9o1frbjf80pe1', '::1', 1612794420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323739343432303b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('i99srbsois08rph126qttha8g2eqhi28', '::1', 1612795005, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323739353030353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('hq798oa0r7l7bbv24h2mt5b3v17fdqci', '::1', 1612795415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323739353431353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('vg9009nnf6r89t25vja8mkf2a5o0a1ij', '::1', 1612795717, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323739353731373b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('fofqsnc5sk89n5s4dlgs12rjd83sv5if', '::1', 1612796091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323739363039313b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('ee71838l5apbojbdebg9al6plunfbo04', '::1', 1612796400, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323739363430303b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('nt457dfrq24bd7k68dpblai9f46srb62', '::1', 1612797254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323739373235343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('9j2hm9qqvupvn771kdlds8g4ur4mcs8a', '::1', 1612797562, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323739373536323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('05pm941oi26p74v2bcjdmu55oapbutcm', '::1', 1612797764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323739373536323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('5amhqlt0m0o54c2p6e9r5n01pijf2lif', '::1', 1612807338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323830373333383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('nhbve9h94qau9g01m85pqnvrgpn8jvbl', '::1', 1612807999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323830373939393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('f6du8dbhfd1l0pku4kj22vn5ci78v2fq', '::1', 1612808426, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323830383432363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('pr7n0gplp4vm5tpsfbh19do4ovcs2qri', '::1', 1612808806, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323830383830363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('jh5ps4m67bvnp89g99ihk0cr5c6jj2kb', '::1', 1612809538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323830393533383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('m1r42pvs6bhb3uofq4kj9ckhorp7b1p8', '::1', 1612809584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323830393533383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('uf285d6bkckjev4u9badlvkur9cbub1g', '::1', 1612870839, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323837303833393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('uh6nd61426939o1reope4r9qbkikcs6q', '::1', 1612873826, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323837333832363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('538chudsmg52l5i0t4sdut9dg2437mdk', '::1', 1612874882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323837343838323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('s4ufg4cgeu4h390i1dsbeij0ssr0cmqj', '::1', 1612875223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323837353232333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('gcu2huchuc48sm097a7f8tbkhjlp8cju', '::1', 1612875793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323837353739333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('b1bbegcpkveu24tng2jdtbijap6toovk', '::1', 1612875869, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323837353739333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('q1vdjlb6s5s33mf6pjrl4v6ca3c4cavi', '::1', 1612892093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323839323039323b),
('nc2ik75jh26rohfqpakmva5i35dd7v5b', '::1', 1612919401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323931393233303b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32303a22666c7970657264656d6f40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('tdp1r6fgmqv5gu7i4kai487uqipo9p7f', '::1', 1610301963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303330313936333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('iicno3gddj508811hn9oq7p7oo183on3', '::1', 1610298854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303239383835343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('ghg4u4625gp9ntd0dn92frd697brs646', '::1', 1610298156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303239383135363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('ddteo49jo6qhrqjm9n6c8m0sssm5da8m', '::1', 1610294846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303239343834363b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('df8e880bg8mmn96a1lgbrcvkg570pakd', '::1', 1610294233, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303239343233333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('j4lkg7i1ko6gqe4uk0uurl2itao3rnqe', '::1', 1610302279, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303330323237393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('1dic01ke1btdf5kksaubu9e86cchkqf0', '::1', 1610303917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303330333931373b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('rtrjhui9v8m9ct0kuehn0f0dtmlcfr9c', '::1', 1610304521, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303330343532313b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b),
('qsba59q1lpihrn1uv0b3aecsfcbok915', '::1', 1610305493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303330353439333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b657863657074696f6e7c733a34323a22496e666f726d6174696f6e20686173206265656e2075706461746564207375636365737366756c6c7921223b5f5f63695f766172737c613a313a7b733a393a22657863657074696f6e223b733a333a226f6c64223b7d),
('vumbq3c6nhl3qdjquj2b55npl3ekhma0', '::1', 1610306153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303330363135333b757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b66756c6c5f6e616d657c733a31303a2244656d6f2041646d696e223b70686f6e657c733a31313a223031383132333931363333223b656d61696c5f616464726573737c733a31373a2261646d696e40646f6f72736f66742e636f223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b63757272656e63795f706f736974696f6e7c733a343a224c656674223b63757272656e63797c733a313a2224223b74696d655f7a6f6e657c4e3b646174655f666f726d61747c733a353a226d2f642f59223b6e616d655f636f6d70616e795f6e616d657c733a393a22446f6f7220536f6674223b616464726573737c733a33303a223435382f412c2053656e7061726120506172626174612c204b616672756c223b656d61696c7c733a32313a2261642e6d646e617a6d756c40676d61696c2e636f6d223b6370686f6e657c733a31313a223031383132333931363333223b6c6f676f7c733a33363a2232616664306338633433366430326237343233393533326462303238323332352e706e67223b);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tax_fields`
--

CREATE TABLE `tbl_tax_fields` (
  `id` int(15) NOT NULL,
  `tax` varchar(50) NOT NULL,
  `percentage` float NOT NULL,
  `company_id` int(15) NOT NULL,
  `del_status` varchar(100) NOT NULL DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_tax_fields`
--

INSERT INTO `tbl_tax_fields` (`id`, `tax`, `percentage`, `company_id`, `del_status`) VALUES
(51, 'Additional Tax', 2, 1, 'Live'),
(50, 'Sales Tax', 5, 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tax_settings`
--

CREATE TABLE `tbl_tax_settings` (
  `id` int(10) NOT NULL,
  `collect_tax` varchar(10) DEFAULT NULL,
  `tax_registration_no` varchar(30) DEFAULT NULL,
  `tax_is_gst` varchar(10) NOT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_tax_settings`
--

INSERT INTO `tbl_tax_settings` (`id`, `collect_tax`, `tax_registration_no`, `tax_is_gst`, `state_code`, `company_id`, `del_status`) VALUES
(1, 'Yes', 'Yes', 'No', '09', 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_time_zone`
--

CREATE TABLE `tbl_time_zone` (
  `id` int(10) NOT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `zone_name` varchar(35) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tbl_time_zone`
--

INSERT INTO `tbl_time_zone` (`id`, `country_code`, `zone_name`, `del_status`) VALUES
(1, 'AD', 'Europe/Andorra', 'Live'),
(2, 'AE', 'Asia/Dubai', 'Live'),
(3, 'AF', 'Asia/Kabul', 'Live'),
(4, 'AG', 'America/Antigua', 'Live'),
(5, 'AI', 'America/Anguilla', 'Live'),
(6, 'AL', 'Europe/Tirane', 'Live'),
(7, 'AM', 'Asia/Yerevan', 'Live'),
(8, 'AO', 'Africa/Luanda', 'Live'),
(9, 'AQ', 'Antarctica/McMurdo', 'Live'),
(10, 'AQ', 'Antarctica/Casey', 'Live'),
(11, 'AQ', 'Antarctica/Davis', 'Live'),
(12, 'AQ', 'Antarctica/DumontDUrville', 'Live'),
(13, 'AQ', 'Antarctica/Mawson', 'Live'),
(14, 'AQ', 'Antarctica/Palmer', 'Live'),
(15, 'AQ', 'Antarctica/Rothera', 'Live'),
(16, 'AQ', 'Antarctica/Syowa', 'Live'),
(17, 'AQ', 'Antarctica/Troll', 'Live'),
(18, 'AQ', 'Antarctica/Vostok', 'Live'),
(19, 'AR', 'America/Argentina/Buenos_Aires', 'Live'),
(20, 'AR', 'America/Argentina/Cordoba', 'Live'),
(21, 'AR', 'America/Argentina/Salta', 'Live'),
(22, 'AR', 'America/Argentina/Jujuy', 'Live'),
(23, 'AR', 'America/Argentina/Tucuman', 'Live'),
(24, 'AR', 'America/Argentina/Catamarca', 'Live'),
(25, 'AR', 'America/Argentina/La_Rioja', 'Live'),
(26, 'AR', 'America/Argentina/San_Juan', 'Live'),
(27, 'AR', 'America/Argentina/Mendoza', 'Live'),
(28, 'AR', 'America/Argentina/San_Luis', 'Live'),
(29, 'AR', 'America/Argentina/Rio_Gallegos', 'Live'),
(30, 'AR', 'America/Argentina/Ushuaia', 'Live'),
(31, 'AS', 'Pacific/Pago_Pago', 'Live'),
(32, 'AT', 'Europe/Vienna', 'Live'),
(33, 'AU', 'Australia/Lord_Howe', 'Live'),
(34, 'AU', 'Antarctica/Macquarie', 'Live'),
(35, 'AU', 'Australia/Hobart', 'Live'),
(36, 'AU', 'Australia/Currie', 'Live'),
(37, 'AU', 'Australia/Melbourne', 'Live'),
(38, 'AU', 'Australia/Sydney', 'Live'),
(39, 'AU', 'Australia/Broken_Hill', 'Live'),
(40, 'AU', 'Australia/Brisbane', 'Live'),
(41, 'AU', 'Australia/Lindeman', 'Live'),
(42, 'AU', 'Australia/Adelaide', 'Live'),
(43, 'AU', 'Australia/Darwin', 'Live'),
(44, 'AU', 'Australia/Perth', 'Live'),
(45, 'AU', 'Australia/Eucla', 'Live'),
(46, 'AW', 'America/Aruba', 'Live'),
(47, 'AX', 'Europe/Mariehamn', 'Live'),
(48, 'AZ', 'Asia/Baku', 'Live'),
(49, 'BA', 'Europe/Sarajevo', 'Live'),
(50, 'BB', 'America/Barbados', 'Live'),
(51, 'BD', 'Asia/Dhaka', 'Live'),
(52, 'BE', 'Europe/Brussels', 'Live'),
(53, 'BF', 'Africa/Ouagadougou', 'Live'),
(54, 'BG', 'Europe/Sofia', 'Live'),
(55, 'BH', 'Asia/Bahrain', 'Live'),
(56, 'BI', 'Africa/Bujumbura', 'Live'),
(57, 'BJ', 'Africa/Porto-Novo', 'Live'),
(58, 'BL', 'America/St_Barthelemy', 'Live'),
(59, 'BM', 'Atlantic/Bermuda', 'Live'),
(60, 'BN', 'Asia/Brunei', 'Live'),
(61, 'BO', 'America/La_Paz', 'Live'),
(62, 'BQ', 'America/Kralendijk', 'Live'),
(63, 'BR', 'America/Noronha', 'Live'),
(64, 'BR', 'America/Belem', 'Live'),
(65, 'BR', 'America/Fortaleza', 'Live'),
(66, 'BR', 'America/Recife', 'Live'),
(67, 'BR', 'America/Araguaina', 'Live'),
(68, 'BR', 'America/Maceio', 'Live'),
(69, 'BR', 'America/Bahia', 'Live'),
(70, 'BR', 'America/Sao_Paulo', 'Live'),
(71, 'BR', 'America/Campo_Grande', 'Live'),
(72, 'BR', 'America/Cuiaba', 'Live'),
(73, 'BR', 'America/Santarem', 'Live'),
(74, 'BR', 'America/Porto_Velho', 'Live'),
(75, 'BR', 'America/Boa_Vista', 'Live'),
(76, 'BR', 'America/Manaus', 'Live'),
(77, 'BR', 'America/Eirunepe', 'Live'),
(78, 'BR', 'America/Rio_Branco', 'Live'),
(79, 'BS', 'America/Nassau', 'Live'),
(80, 'BT', 'Asia/Thimphu', 'Live'),
(81, 'BW', 'Africa/Gaborone', 'Live'),
(82, 'BY', 'Europe/Minsk', 'Live'),
(83, 'BZ', 'America/Belize', 'Live'),
(84, 'CA', 'America/St_Johns', 'Live'),
(85, 'CA', 'America/Halifax', 'Live'),
(86, 'CA', 'America/Glace_Bay', 'Live'),
(87, 'CA', 'America/Moncton', 'Live'),
(88, 'CA', 'America/Goose_Bay', 'Live'),
(89, 'CA', 'America/Blanc-Sablon', 'Live'),
(90, 'CA', 'America/Toronto', 'Live'),
(91, 'CA', 'America/Nipigon', 'Live'),
(92, 'CA', 'America/Thunder_Bay', 'Live'),
(93, 'CA', 'America/Iqaluit', 'Live'),
(94, 'CA', 'America/Pangnirtung', 'Live'),
(95, 'CA', 'America/Atikokan', 'Live'),
(96, 'CA', 'America/Winnipeg', 'Live'),
(97, 'CA', 'America/Rainy_River', 'Live'),
(98, 'CA', 'America/Resolute', 'Live'),
(99, 'CA', 'America/Rankin_Inlet', 'Live'),
(100, 'CA', 'America/Regina', 'Live'),
(101, 'CA', 'America/Swift_Current', 'Live'),
(102, 'CA', 'America/Edmonton', 'Live'),
(103, 'CA', 'America/Cambridge_Bay', 'Live'),
(104, 'CA', 'America/Yellowknife', 'Live'),
(105, 'CA', 'America/Inuvik', 'Live'),
(106, 'CA', 'America/Creston', 'Live'),
(107, 'CA', 'America/Dawson_Creek', 'Live'),
(108, 'CA', 'America/Fort_Nelson', 'Live'),
(109, 'CA', 'America/Vancouver', 'Live'),
(110, 'CA', 'America/Whitehorse', 'Live'),
(111, 'CA', 'America/Dawson', 'Live'),
(112, 'CC', 'Indian/Cocos', 'Live'),
(113, 'CD', 'Africa/Kinshasa', 'Live'),
(114, 'CD', 'Africa/Lubumbashi', 'Live'),
(115, 'CF', 'Africa/Bangui', 'Live'),
(116, 'CG', 'Africa/Brazzaville', 'Live'),
(117, 'CH', 'Europe/Zurich', 'Live'),
(118, 'CI', 'Africa/Abidjan', 'Live'),
(119, 'CK', 'Pacific/Rarotonga', 'Live'),
(120, 'CL', 'America/Santiago', 'Live'),
(121, 'CL', 'America/Punta_Arenas', 'Live'),
(122, 'CL', 'Pacific/Easter', 'Live'),
(123, 'CM', 'Africa/Douala', 'Live'),
(124, 'CN', 'Asia/Shanghai', 'Live'),
(125, 'CN', 'Asia/Urumqi', 'Live'),
(126, 'CO', 'America/Bogota', 'Live'),
(127, 'CR', 'America/Costa_Rica', 'Live'),
(128, 'CU', 'America/Havana', 'Live'),
(129, 'CV', 'Atlantic/Cape_Verde', 'Live'),
(130, 'CW', 'America/Curacao', 'Live'),
(131, 'CX', 'Indian/Christmas', 'Live'),
(132, 'CY', 'Asia/Nicosia', 'Live'),
(133, 'CY', 'Asia/Famagusta', 'Live'),
(134, 'CZ', 'Europe/Prague', 'Live'),
(135, 'DE', 'Europe/Berlin', 'Live'),
(136, 'DE', 'Europe/Busingen', 'Live'),
(137, 'DJ', 'Africa/Djibouti', 'Live'),
(138, 'DK', 'Europe/Copenhagen', 'Live'),
(139, 'DM', 'America/Dominica', 'Live'),
(140, 'DO', 'America/Santo_Domingo', 'Live'),
(141, 'DZ', 'Africa/Algiers', 'Live'),
(142, 'EC', 'America/Guayaquil', 'Live'),
(143, 'EC', 'Pacific/Galapagos', 'Live'),
(144, 'EE', 'Europe/Tallinn', 'Live'),
(145, 'EG', 'Africa/Cairo', 'Live'),
(146, 'EH', 'Africa/El_Aaiun', 'Live'),
(147, 'ER', 'Africa/Asmara', 'Live'),
(148, 'ES', 'Europe/Madrid', 'Live'),
(149, 'ES', 'Africa/Ceuta', 'Live'),
(150, 'ES', 'Atlantic/Canary', 'Live'),
(151, 'ET', 'Africa/Addis_Ababa', 'Live'),
(152, 'FI', 'Europe/Helsinki', 'Live'),
(153, 'FJ', 'Pacific/Fiji', 'Live'),
(154, 'FK', 'Atlantic/Stanley', 'Live'),
(155, 'FM', 'Pacific/Chuuk', 'Live'),
(156, 'FM', 'Pacific/Pohnpei', 'Live'),
(157, 'FM', 'Pacific/Kosrae', 'Live'),
(158, 'FO', 'Atlantic/Faroe', 'Live'),
(159, 'FR', 'Europe/Paris', 'Live'),
(160, 'GA', 'Africa/Libreville', 'Live'),
(161, 'GB', 'Europe/London', 'Live'),
(162, 'GD', 'America/Grenada', 'Live'),
(163, 'GE', 'Asia/Tbilisi', 'Live'),
(164, 'GF', 'America/Cayenne', 'Live'),
(165, 'GG', 'Europe/Guernsey', 'Live'),
(166, 'GH', 'Africa/Accra', 'Live'),
(167, 'GI', 'Europe/Gibraltar', 'Live'),
(168, 'GL', 'America/Godthab', 'Live'),
(169, 'GL', 'America/Danmarkshavn', 'Live'),
(170, 'GL', 'America/Scoresbysund', 'Live'),
(171, 'GL', 'America/Thule', 'Live'),
(172, 'GM', 'Africa/Banjul', 'Live'),
(173, 'GN', 'Africa/Conakry', 'Live'),
(174, 'GP', 'America/Guadeloupe', 'Live'),
(175, 'GQ', 'Africa/Malabo', 'Live'),
(176, 'GR', 'Europe/Athens', 'Live'),
(177, 'GS', 'Atlantic/South_Georgia', 'Live'),
(178, 'GT', 'America/Guatemala', 'Live'),
(179, 'GU', 'Pacific/Guam', 'Live'),
(180, 'GW', 'Africa/Bissau', 'Live'),
(181, 'GY', 'America/Guyana', 'Live'),
(182, 'HK', 'Asia/Hong_Kong', 'Live'),
(183, 'HN', 'America/Tegucigalpa', 'Live'),
(184, 'HR', 'Europe/Zagreb', 'Live'),
(185, 'HT', 'America/Port-au-Prince', 'Live'),
(186, 'HU', 'Europe/Budapest', 'Live'),
(187, 'ID', 'Asia/Jakarta', 'Live'),
(188, 'ID', 'Asia/Pontianak', 'Live'),
(189, 'ID', 'Asia/Makassar', 'Live'),
(190, 'ID', 'Asia/Jayapura', 'Live'),
(191, 'IE', 'Europe/Dublin', 'Live'),
(192, 'IL', 'Asia/Jerusalem', 'Live'),
(193, 'IM', 'Europe/Isle_of_Man', 'Live'),
(194, 'IN', 'Asia/Kolkata', 'Live'),
(195, 'IO', 'Indian/Chagos', 'Live'),
(196, 'IQ', 'Asia/Baghdad', 'Live'),
(197, 'IR', 'Asia/Tehran', 'Live'),
(198, 'IS', 'Atlantic/Reykjavik', 'Live'),
(199, 'IT', 'Europe/Rome', 'Live'),
(200, 'JE', 'Europe/Jersey', 'Live'),
(201, 'JM', 'America/Jamaica', 'Live'),
(202, 'JO', 'Asia/Amman', 'Live'),
(203, 'JP', 'Asia/Tokyo', 'Live'),
(204, 'KE', 'Africa/Nairobi', 'Live'),
(205, 'KG', 'Asia/Bishkek', 'Live'),
(206, 'KH', 'Asia/Phnom_Penh', 'Live'),
(207, 'KI', 'Pacific/Tarawa', 'Live'),
(208, 'KI', 'Pacific/Enderbury', 'Live'),
(209, 'KI', 'Pacific/Kiritimati', 'Live'),
(210, 'KM', 'Indian/Comoro', 'Live'),
(211, 'KN', 'America/St_Kitts', 'Live'),
(212, 'KP', 'Asia/Pyongyang', 'Live'),
(213, 'KR', 'Asia/Seoul', 'Live'),
(214, 'KW', 'Asia/Kuwait', 'Live'),
(215, 'KY', 'America/Cayman', 'Live'),
(216, 'KZ', 'Asia/Almaty', 'Live'),
(217, 'KZ', 'Asia/Qyzylorda', 'Live'),
(218, 'KZ', 'Asia/Aqtobe', 'Live'),
(219, 'KZ', 'Asia/Aqtau', 'Live'),
(220, 'KZ', 'Asia/Atyrau', 'Live'),
(221, 'KZ', 'Asia/Oral', 'Live'),
(222, 'LA', 'Asia/Vientiane', 'Live'),
(223, 'LB', 'Asia/Beirut', 'Live'),
(224, 'LC', 'America/St_Lucia', 'Live'),
(225, 'LI', 'Europe/Vaduz', 'Live'),
(226, 'LK', 'Asia/Colombo', 'Live'),
(227, 'LR', 'Africa/Monrovia', 'Live'),
(228, 'LS', 'Africa/Maseru', 'Live'),
(229, 'LT', 'Europe/Vilnius', 'Live'),
(230, 'LU', 'Europe/Luxembourg', 'Live'),
(231, 'LV', 'Europe/Riga', 'Live'),
(232, 'LY', 'Africa/Tripoli', 'Live'),
(233, 'MA', 'Africa/Casablanca', 'Live'),
(234, 'MC', 'Europe/Monaco', 'Live'),
(235, 'MD', 'Europe/Chisinau', 'Live'),
(236, 'ME', 'Europe/Podgorica', 'Live'),
(237, 'MF', 'America/Marigot', 'Live'),
(238, 'MG', 'Indian/Antananarivo', 'Live'),
(239, 'MH', 'Pacific/Majuro', 'Live'),
(240, 'MH', 'Pacific/Kwajalein', 'Live'),
(241, 'MK', 'Europe/Skopje', 'Live'),
(242, 'ML', 'Africa/Bamako', 'Live'),
(243, 'MM', 'Asia/Yangon', 'Live'),
(244, 'MN', 'Asia/Ulaanbaatar', 'Live'),
(245, 'MN', 'Asia/Hovd', 'Live'),
(246, 'MN', 'Asia/Choibalsan', 'Live'),
(247, 'MO', 'Asia/Macau', 'Live'),
(248, 'MP', 'Pacific/Saipan', 'Live'),
(249, 'MQ', 'America/Martinique', 'Live'),
(250, 'MR', 'Africa/Nouakchott', 'Live'),
(251, 'MS', 'America/Montserrat', 'Live'),
(252, 'MT', 'Europe/Malta', 'Live'),
(253, 'MU', 'Indian/Mauritius', 'Live'),
(254, 'MV', 'Indian/Maldives', 'Live'),
(255, 'MW', 'Africa/Blantyre', 'Live'),
(256, 'MX', 'America/Mexico_City', 'Live'),
(257, 'MX', 'America/Cancun', 'Live'),
(258, 'MX', 'America/Merida', 'Live'),
(259, 'MX', 'America/Monterrey', 'Live'),
(260, 'MX', 'America/Matamoros', 'Live'),
(261, 'MX', 'America/Mazatlan', 'Live'),
(262, 'MX', 'America/Chihuahua', 'Live'),
(263, 'MX', 'America/Ojinaga', 'Live'),
(264, 'MX', 'America/Hermosillo', 'Live'),
(265, 'MX', 'America/Tijuana', 'Live'),
(266, 'MX', 'America/Bahia_Banderas', 'Live'),
(267, 'MY', 'Asia/Kuala_Lumpur', 'Live'),
(268, 'MY', 'Asia/Kuching', 'Live'),
(269, 'MZ', 'Africa/Maputo', 'Live'),
(270, 'NA', 'Africa/Windhoek', 'Live'),
(271, 'NC', 'Pacific/Noumea', 'Live'),
(272, 'NE', 'Africa/Niamey', 'Live'),
(273, 'NF', 'Pacific/Norfolk', 'Live'),
(274, 'NG', 'Africa/Lagos', 'Live'),
(275, 'NI', 'America/Managua', 'Live'),
(276, 'NL', 'Europe/Amsterdam', 'Live'),
(277, 'NO', 'Europe/Oslo', 'Live'),
(278, 'NP', 'Asia/Kathmandu', 'Live'),
(279, 'NR', 'Pacific/Nauru', 'Live'),
(280, 'NU', 'Pacific/Niue', 'Live'),
(281, 'NZ', 'Pacific/Auckland', 'Live'),
(282, 'NZ', 'Pacific/Chatham', 'Live'),
(283, 'OM', 'Asia/Muscat', 'Live'),
(284, 'PA', 'America/Panama', 'Live'),
(285, 'PE', 'America/Lima', 'Live'),
(286, 'PF', 'Pacific/Tahiti', 'Live'),
(287, 'PF', 'Pacific/Marquesas', 'Live'),
(288, 'PF', 'Pacific/Gambier', 'Live'),
(289, 'PG', 'Pacific/Port_Moresby', 'Live'),
(290, 'PG', 'Pacific/Bougainville', 'Live'),
(291, 'PH', 'Asia/Manila', 'Live'),
(292, 'PK', 'Asia/Karachi', 'Live'),
(293, 'PL', 'Europe/Warsaw', 'Live'),
(294, 'PM', 'America/Miquelon', 'Live'),
(295, 'PN', 'Pacific/Pitcairn', 'Live'),
(296, 'PR', 'America/Puerto_Rico', 'Live'),
(297, 'PS', 'Asia/Gaza', 'Live'),
(298, 'PS', 'Asia/Hebron', 'Live'),
(299, 'PT', 'Europe/Lisbon', 'Live'),
(300, 'PT', 'Atlantic/Madeira', 'Live'),
(301, 'PT', 'Atlantic/Azores', 'Live'),
(302, 'PW', 'Pacific/Palau', 'Live'),
(303, 'PY', 'America/Asuncion', 'Live'),
(304, 'QA', 'Asia/Qatar', 'Live'),
(305, 'RE', 'Indian/Reunion', 'Live'),
(306, 'RO', 'Europe/Bucharest', 'Live'),
(307, 'RS', 'Europe/Belgrade', 'Live'),
(308, 'RU', 'Europe/Kaliningrad', 'Live'),
(309, 'RU', 'Europe/Moscow', 'Live'),
(310, 'RU', 'Europe/Simferopol', 'Live'),
(311, 'RU', 'Europe/Volgograd', 'Live'),
(312, 'RU', 'Europe/Kirov', 'Live'),
(313, 'RU', 'Europe/Astrakhan', 'Live'),
(314, 'RU', 'Europe/Saratov', 'Live'),
(315, 'RU', 'Europe/Ulyanovsk', 'Live'),
(316, 'RU', 'Europe/Samara', 'Live'),
(317, 'RU', 'Asia/Yekaterinburg', 'Live'),
(318, 'RU', 'Asia/Omsk', 'Live'),
(319, 'RU', 'Asia/Novosibirsk', 'Live'),
(320, 'RU', 'Asia/Barnaul', 'Live'),
(321, 'RU', 'Asia/Tomsk', 'Live'),
(322, 'RU', 'Asia/Novokuznetsk', 'Live'),
(323, 'RU', 'Asia/Krasnoyarsk', 'Live'),
(324, 'RU', 'Asia/Irkutsk', 'Live'),
(325, 'RU', 'Asia/Chita', 'Live'),
(326, 'RU', 'Asia/Yakutsk', 'Live'),
(327, 'RU', 'Asia/Khandyga', 'Live'),
(328, 'RU', 'Asia/Vladivostok', 'Live'),
(329, 'RU', 'Asia/Ust-Nera', 'Live'),
(330, 'RU', 'Asia/Magadan', 'Live'),
(331, 'RU', 'Asia/Sakhalin', 'Live'),
(332, 'RU', 'Asia/Srednekolymsk', 'Live'),
(333, 'RU', 'Asia/Kamchatka', 'Live'),
(334, 'RU', 'Asia/Anadyr', 'Live'),
(335, 'RW', 'Africa/Kigali', 'Live'),
(336, 'SA', 'Asia/Riyadh', 'Live'),
(337, 'SB', 'Pacific/Guadalcanal', 'Live'),
(338, 'SC', 'Indian/Mahe', 'Live'),
(339, 'SD', 'Africa/Khartoum', 'Live'),
(340, 'SE', 'Europe/Stockholm', 'Live'),
(341, 'SG', 'Asia/Singapore', 'Live'),
(342, 'SH', 'Atlantic/St_Helena', 'Live'),
(343, 'SI', 'Europe/Ljubljana', 'Live'),
(344, 'SJ', 'Arctic/Longyearbyen', 'Live'),
(345, 'SK', 'Europe/Bratislava', 'Live'),
(346, 'SL', 'Africa/Freetown', 'Live'),
(347, 'SM', 'Europe/San_Marino', 'Live'),
(348, 'SN', 'Africa/Dakar', 'Live'),
(349, 'SO', 'Africa/Mogadishu', 'Live'),
(350, 'SR', 'America/Paramaribo', 'Live'),
(351, 'SS', 'Africa/Juba', 'Live'),
(352, 'ST', 'Africa/Sao_Tome', 'Live'),
(353, 'SV', 'America/El_Salvador', 'Live'),
(354, 'SX', 'America/Lower_Princes', 'Live'),
(355, 'SY', 'Asia/Damascus', 'Live'),
(356, 'SZ', 'Africa/Mbabane', 'Live'),
(357, 'TC', 'America/Grand_Turk', 'Live'),
(358, 'TD', 'Africa/Ndjamena', 'Live'),
(359, 'TF', 'Indian/Kerguelen', 'Live'),
(360, 'TG', 'Africa/Lome', 'Live'),
(361, 'TH', 'Asia/Bangkok', 'Live'),
(362, 'TJ', 'Asia/Dushanbe', 'Live'),
(363, 'TK', 'Pacific/Fakaofo', 'Live'),
(364, 'TL', 'Asia/Dili', 'Live'),
(365, 'TM', 'Asia/Ashgabat', 'Live'),
(366, 'TN', 'Africa/Tunis', 'Live'),
(367, 'TO', 'Pacific/Tongatapu', 'Live'),
(368, 'TR', 'Europe/Istanbul', 'Live'),
(369, 'TT', 'America/Port_of_Spain', 'Live'),
(370, 'TV', 'Pacific/Funafuti', 'Live'),
(371, 'TW', 'Asia/Taipei', 'Live'),
(372, 'TZ', 'Africa/Dar_es_Salaam', 'Live'),
(373, 'UA', 'Europe/Kiev', 'Live'),
(374, 'UA', 'Europe/Uzhgorod', 'Live'),
(375, 'UA', 'Europe/Zaporozhye', 'Live'),
(376, 'UG', 'Africa/Kampala', 'Live'),
(377, 'UM', 'Pacific/Midway', 'Live'),
(378, 'UM', 'Pacific/Wake', 'Live'),
(379, 'US', 'America/New_York', 'Live'),
(380, 'US', 'America/Detroit', 'Live'),
(381, 'US', 'America/Kentucky/Louisville', 'Live'),
(382, 'US', 'America/Kentucky/Monticello', 'Live'),
(383, 'US', 'America/Indiana/Indianapolis', 'Live'),
(384, 'US', 'America/Indiana/Vincennes', 'Live'),
(385, 'US', 'America/Indiana/Winamac', 'Live'),
(386, 'US', 'America/Indiana/Marengo', 'Live'),
(387, 'US', 'America/Indiana/Petersburg', 'Live'),
(388, 'US', 'America/Indiana/Vevay', 'Live'),
(389, 'US', 'America/Chicago', 'Live'),
(390, 'US', 'America/Indiana/Tell_City', 'Live'),
(391, 'US', 'America/Indiana/Knox', 'Live'),
(392, 'US', 'America/Menominee', 'Live'),
(393, 'US', 'America/North_Dakota/Center', 'Live'),
(394, 'US', 'America/North_Dakota/New_Salem', 'Live'),
(395, 'US', 'America/North_Dakota/Beulah', 'Live'),
(396, 'US', 'America/Denver', 'Live'),
(397, 'US', 'America/Boise', 'Live'),
(398, 'US', 'America/Phoenix', 'Live'),
(399, 'US', 'America/Los_Angeles', 'Live'),
(400, 'US', 'America/Anchorage', 'Live'),
(401, 'US', 'America/Juneau', 'Live'),
(402, 'US', 'America/Sitka', 'Live'),
(403, 'US', 'America/Metlakatla', 'Live'),
(404, 'US', 'America/Yakutat', 'Live'),
(405, 'US', 'America/Nome', 'Live'),
(406, 'US', 'America/Adak', 'Live'),
(407, 'US', 'Pacific/Honolulu', 'Live'),
(408, 'UY', 'America/Montevideo', 'Live'),
(409, 'UZ', 'Asia/Samarkand', 'Live'),
(410, 'UZ', 'Asia/Tashkent', 'Live'),
(411, 'VA', 'Europe/Vatican', 'Live'),
(412, 'VC', 'America/St_Vincent', 'Live'),
(413, 'VE', 'America/Caracas', 'Live'),
(414, 'VG', 'America/Tortola', 'Live'),
(415, 'VI', 'America/St_Thomas', 'Live'),
(416, 'VN', 'Asia/Ho_Chi_Minh', 'Live'),
(417, 'VU', 'Pacific/Efate', 'Live'),
(418, 'WF', 'Pacific/Wallis', 'Live'),
(419, 'WS', 'Pacific/Apia', 'Live'),
(420, 'YE', 'Asia/Aden', 'Live'),
(421, 'YT', 'Indian/Mayotte', 'Live'),
(422, 'ZA', 'Africa/Johannesburg', 'Live'),
(423, 'ZM', 'Africa/Lusaka', 'Live'),
(424, 'ZW', 'Africa/Harare', 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_units`
--

CREATE TABLE `tbl_units` (
  `id` int(10) NOT NULL,
  `unit_name` varchar(10) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `company_id` int(1) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_units`
--

INSERT INTO `tbl_units` (`id`, `unit_name`, `description`, `company_id`, `del_status`) VALUES
(1, 'Kg', 'Kilo Gram', 1, 'Live'),
(2, 'L', 'Liter', 1, 'Live'),
(3, 'Pcs', 'Piece', 1, 'Live'),
(4, 'g', 'gram', 1, 'Live'),
(5, 'ml', 'Mili Liter', 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(10) NOT NULL,
  `full_name` varchar(25) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `will_login` varchar(20) NOT NULL DEFAULT 'No',
  `role` varchar(25) NOT NULL,
  `company_id` int(10) NOT NULL,
  `account_creation_date` datetime NOT NULL,
  `language` varchar(100) NOT NULL DEFAULT 'english',
  `last_login` datetime NOT NULL,
  `active_status` varchar(25) NOT NULL DEFAULT 'Active',
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `full_name`, `phone`, `email_address`, `password`, `designation`, `will_login`, `role`, `company_id`, `account_creation_date`, `language`, `last_login`, `active_status`, `del_status`) VALUES
(1, 'Demo Admin', '01812391633', 'admin@doorsoft.co', 'e10adc3949ba59abbe56e057f20f883e', 'Admin', 'No', 'Admin', 1, '2019-12-04 07:28:32', 'english', '2019-12-04 00:00:00', 'Active', 'Live');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_attachments`
--
ALTER TABLE `tbl_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_companies`
--
ALTER TABLE `tbl_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customize`
--
ALTER TABLE `tbl_customize`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_expense_items`
--
ALTER TABLE `tbl_expense_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payment_api`
--
ALTER TABLE `tbl_payment_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_products_services`
--
ALTER TABLE `tbl_products_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_proposal_invoice`
--
ALTER TABLE `tbl_proposal_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_proposal_invoice_products_services`
--
ALTER TABLE `tbl_proposal_invoice_products_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_proposal_pdf`
--
ALTER TABLE `tbl_proposal_pdf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_proposal_photo`
--
ALTER TABLE `tbl_proposal_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sessions`
--
ALTER TABLE `tbl_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `tbl_tax_fields`
--
ALTER TABLE `tbl_tax_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tax_settings`
--
ALTER TABLE `tbl_tax_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_time_zone`
--
ALTER TABLE `tbl_time_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_units`
--
ALTER TABLE `tbl_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_attachments`
--
ALTER TABLE `tbl_attachments`
  MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_companies`
--
ALTER TABLE `tbl_companies`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_customize`
--
ALTER TABLE `tbl_customize`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_expense_items`
--
ALTER TABLE `tbl_expense_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_payment_api`
--
ALTER TABLE `tbl_payment_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_products_services`
--
ALTER TABLE `tbl_products_services`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tbl_proposal_invoice`
--
ALTER TABLE `tbl_proposal_invoice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=455;

--
-- AUTO_INCREMENT for table `tbl_proposal_invoice_products_services`
--
ALTER TABLE `tbl_proposal_invoice_products_services`
  MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=524;

--
-- AUTO_INCREMENT for table `tbl_proposal_pdf`
--
ALTER TABLE `tbl_proposal_pdf`
  MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `tbl_proposal_photo`
--
ALTER TABLE `tbl_proposal_photo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `tbl_tax_fields`
--
ALTER TABLE `tbl_tax_fields`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tbl_tax_settings`
--
ALTER TABLE `tbl_tax_settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_time_zone`
--
ALTER TABLE `tbl_time_zone`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT for table `tbl_units`
--
ALTER TABLE `tbl_units`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
