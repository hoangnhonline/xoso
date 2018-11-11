-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2018 at 03:32 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lottery`
--

-- --------------------------------------------------------

--
-- Table structure for table `bet_type`
--

CREATE TABLE `bet_type` (
  `id` tinyint(4) NOT NULL,
  `keyword` varchar(4) NOT NULL,
  `content` varchar(100) NOT NULL,
  `example` varchar(255) NOT NULL,
  `display_order` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bet_type`
--

INSERT INTO `bet_type` (`id`, `keyword`, `content`, `example`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'dd', 'đầu đuôi', '12 dd 100n', 1, '2018-11-11 05:36:14', '2018-11-11 05:36:14'),
(2, 'dau', 'đầu', '12 dau 100n', 2, '2018-11-11 05:36:14', '2018-11-11 05:36:14'),
(3, 'dui', 'đuôi', '12 dui 100n', 3, '2018-11-11 05:36:46', '2018-11-11 05:36:46'),
(4, 'bl', 'bao lô', '12 bl 100n', 4, '2018-11-11 05:43:50', '2018-11-11 05:43:50'),
(5, 'da', 'đá', '12 14 da 100n', 5, '2018-11-11 05:43:50', '2018-11-11 05:43:50'),
(6, 'dv', 'đá vòng', '12 14 16 dv 100n', 6, '2018-11-11 05:43:50', '2018-11-11 05:43:50'),
(7, 'dx', 'đá xiên', '12 14 dx 100n', 7, '2018-11-11 05:43:50', '2018-11-11 05:43:50'),
(8, 'dxv', 'đá xiên vòng', '12 14 16 dxv 100n', 8, '2018-11-11 05:43:50', '2018-11-11 05:43:50'),
(9, 'x', 'xỉu chủ', '123 x 100n', 9, '2018-11-11 05:43:50', '2018-11-11 05:43:50'),
(10, 'dxc', 'đảo xỉu chủ', '123 dxc 100n', 10, '2018-11-11 05:43:50', '2018-11-11 05:43:50'),
(11, 'ddau', 'đảo (xỉu chủ) đầu', '123 dao dau 100n', 11, '2018-11-11 05:43:50', '2018-11-11 05:43:50'),
(12, 'ddui', 'đảo (xỉu chủ) đuôi', '23 dao dui 100n', 12, '2018-11-11 05:43:50', '2018-11-11 05:43:50'),
(13, 'bd', 'bao lô đảo', '123 bd 100n', 13, '2018-11-11 05:43:50', '2018-11-11 05:43:50'),
(14, 'ab', 'đầu đuôi', '12 ab 100n, 21 a 100n b 200n (Cho kiểu đánh ab)', 14, '2018-11-11 05:43:50', '2018-11-11 05:43:50'),
(15, 'k', 'số kéo', 'Kéo 2 số:<br>\r\n19k79: giống hàng đơn vị nên số là 19 29 39 49 59 69 79<br><br>\r\n\r\n\r\nKéo 3 số: (chỉ chấp nhận số kéo sai 1 hàng trăm hoặc hàng chục hoặc hàng đơn vị)<br>\r\n123k173: số là 123 133 143 153 163 173', 15, '2018-11-11 05:43:50', '2018-11-11 05:43:50');

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `id` tinyint(4) NOT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(20) NOT NULL,
  `display_order` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`id`, `code`, `name`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'tg', 'Tiền Giang', 1, '2018-11-11 05:28:12', '2018-11-11 05:28:12'),
(2, 'kg', 'Kiên Giang', 2, '2018-11-11 05:28:12', '2018-11-11 05:28:12'),
(3, 'dl', 'Đà Lạt', 3, '2018-11-11 05:28:45', '2018-11-11 05:28:45'),
(4, 'tp', 'TPHCM', 4, '2018-11-11 05:28:45', '2018-11-11 05:28:45'),
(5, 'dt', 'Đồng Tháp', 5, '2018-11-11 05:29:10', '2018-11-11 05:29:10'),
(6, 'cm', 'Cà Mau', 6, '2018-11-11 05:29:10', '2018-11-11 05:29:10'),
(7, 'bt', 'Bến Tre', 7, '2018-11-11 05:29:32', '2018-11-11 05:29:32'),
(8, 'vt', 'Vũng Tàu', 8, '2018-11-11 05:29:32', '2018-11-11 05:29:32'),
(9, 'bli', 'Bạc Liêu', 9, '2018-11-11 05:29:49', '2018-11-11 05:29:49'),
(10, 'dn', 'Đồng Nai', 10, '2018-11-11 05:29:49', '2018-11-11 05:29:49'),
(11, 'ct', 'Cần Thơ', 11, '2018-11-11 05:30:06', '2018-11-11 05:30:06'),
(12, 'st', 'Sóc Trăng', 12, '2018-11-11 05:30:06', '2018-11-11 05:30:06'),
(13, 'tn', 'Tây Ninh', 13, '2018-11-11 05:30:26', '2018-11-11 05:30:26'),
(14, 'ag', 'An Giang', 14, '2018-11-11 05:30:26', '2018-11-11 05:30:26'),
(17, 'bth', 'Bình Thuận', 15, '2018-11-11 05:30:52', '2018-11-11 05:30:52'),
(18, 'vl', 'Vĩnh Long', 16, '2018-11-11 05:30:52', '2018-11-11 05:30:52'),
(19, 'bd', 'Bình Dương', 17, '2018-11-11 05:31:12', '2018-11-11 05:31:12'),
(20, 'tv', 'Trà Vinh', 18, '2018-11-11 05:31:12', '2018-11-11 05:31:12'),
(21, 'la', 'Long An', 19, '2018-11-11 05:31:32', '2018-11-11 05:31:32'),
(22, 'bp', 'Bình Phước', 20, '2018-11-11 05:31:32', '2018-11-11 05:31:32'),
(23, 'hg', 'Hậu Giang', 21, '2018-11-11 05:31:39', '2018-11-11 05:31:39'),
(24, 'mb', 'Miền Bắc', 22, '2018-11-11 13:13:02', '2018-11-11 13:13:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bet_type`
--
ALTER TABLE `bet_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `keyword` (`keyword`),
  ADD KEY `keyword_2` (`keyword`);

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `code_2` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bet_type`
--
ALTER TABLE `bet_type`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `channel`
--
ALTER TABLE `channel`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
