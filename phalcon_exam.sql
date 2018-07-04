-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 18-07-04 18:02
-- 서버 버전: 10.1.25-MariaDB
-- PHP 버전: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `phalcon_exam`
--
CREATE DATABASE IF NOT EXISTS `phalcon_exam` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `phalcon_exam`;

-- --------------------------------------------------------

--
-- 테이블 구조 `board_test`
--

CREATE TABLE `board_test` (
  `idx` int(11) NOT NULL,
  `ref_group` int(11) NOT NULL DEFAULT '0',
  `ref_level` int(11) NOT NULL DEFAULT '0',
  `ref_order` int(11) NOT NULL DEFAULT '0',
  `member` varchar(50) CHARACTER SET utf8 NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8,
  `hits` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `board_test`
--

INSERT INTO `board_test` (`idx`, `ref_group`, `ref_level`, `ref_order`, `member`, `title`, `content`, `hits`, `created`, `updated`) VALUES
(1, 1, 0, 0, 'stj', 'fdsfdsf', 'fdsfssfs', 1, '2018-03-24 16:53:45', '0000-00-00 00:00:00'),
(2, 2, 0, 0, 'stj', 'fasdfasf', 'aaaaaaaaaaa', 1, '2018-03-28 10:56:54', '0000-00-00 00:00:00'),
(3, 3, 0, 0, 'stj', 'aaaaaaaaaaaaa', 'fasdfasdf', 1, '2018-03-28 10:57:02', '0000-00-00 00:00:00'),
(4, 4, 0, 0, 'stj', 'bbbbbbbbbbbbbbb', 'fasdfadsfasdf', 1, '2018-03-28 10:57:09', '0000-00-00 00:00:00'),
(5, 5, 0, 0, 'stj', 'rrrrrrrrrrrrrrr', 'fasdfasdfsf', 2, '2018-03-28 10:57:16', '0000-00-00 00:00:00'),
(6, 6, 0, 0, 'stj', 'wwwwwwwwwwwww', 'fasfsdfsadfasf', 2, '2018-03-28 10:57:25', '0000-00-00 00:00:00'),
(7, 7, 0, 0, 'stj', 'aaaaaaaaaa', 'afsdfasaf', 1, '2018-04-05 17:36:35', '0000-00-00 00:00:00'),
(8, 8, 0, 0, 'stj', 'rrrrrrrrrrrr', 'rfasdfsadf', 1, '2018-04-05 17:38:11', '0000-00-00 00:00:00'),
(9, 9, 0, 0, 'stj', 'afsdfdasf', 'fasdfasf', 3, '2018-04-05 17:39:19', '0000-00-00 00:00:00'),
(10, 10, 0, 0, 'stj', 'fasdf', 'fasdf', 1, '2018-04-05 17:41:13', '0000-00-00 00:00:00'),
(11, 11, 0, 0, 'stj', 'fasdf', 'fasdf', 2, '2018-04-05 17:41:48', '0000-00-00 00:00:00'),
(12, 12, 0, 0, 'stj', 'fasdf', 'fasdf', 2, '2018-04-05 17:41:55', '0000-00-00 00:00:00'),
(13, 13, 0, 0, 'stj', 'fasdf', 'fasdf???????\r\nfads???????\r\n????????????\r\nsf\r\ndsf\r\nsdaaaaaaaaaaaaaaaaaaa', 13, '2018-04-05 17:42:39', '0000-00-00 00:00:00'),
(14, 13, 1, 4, 'stj', 'aaaaaaaafasdf', 'fasdfaaaaaaaa', 3, '2018-04-06 15:11:30', '0000-00-00 00:00:00'),
(15, 13, 1, 1, 'stj', '리플____fasdf', '리플____fasdf???????fads???????????????????sfdsfsdaaaaaaaaaaaaaaaaaaa', 2, '2018-06-29 14:20:51', '0000-00-00 00:00:00'),
(16, 13, 2, 3, 'stj', '리플____11111111_fasdf', '리플____11111111_fasdf???????fads???????????????????sfdsfsdaaaaaaaaaaaaaaaaaaa', 0, '2018-06-29 14:21:35', '0000-00-00 00:00:00'),
(17, 13, 2, 2, 'stj', '리플____2222222_fasdf', '리플____fasdf???????fads???????????????????sfdsfsdaaaaaaaaaaaaaaaaaaa', 0, '2018-06-29 14:21:51', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 테이블 구조 `comment_boards`
--

CREATE TABLE `comment_boards` (
  `idx` int(11) NOT NULL,
  `board_id` varchar(255) NOT NULL,
  `board_idx` int(11) DEFAULT NULL,
  `memo` text,
  `member` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `comment_boards`
--

INSERT INTO `comment_boards` (`idx`, `board_id`, `board_idx`, `memo`, `member`, `created`) VALUES
(6, 'board_test', 13, 'ㅈㅈㅈㅈㅈㅈㅈㅈㅈㄷㄷㄷㄷㄷㄷㄷ', 'stj', '2018-05-02 11:23:28'),
(10, 'board_test', 13, 'fasdfsaf', 'stj', '2018-05-02 11:24:17'),
(11, 'board_test', 13, 'wwwwwwwww', 'stj', '2018-05-02 11:25:42'),
(12, 'board_test', 13, 'aaaaaaaaa', 'stj', '2018-05-21 15:08:37'),
(13, 'board_test', 13, 'rrrrrrr', 'stj', '2018-05-21 15:09:00'),
(14, 'board_test', 13, 'eeeeeeee', 'stj', '2018-05-21 15:32:21'),
(15, 'board_test', 13, 'wwwwww', 'stj', '2018-05-21 15:32:46'),
(16, 'board_test', 13, 'rrrrr', 'stj', '2018-05-21 15:33:16'),
(17, 'board_test', 14, '', 'stj', '2018-06-22 17:42:59'),
(18, 'board_test', 14, 'afsfsfsdfsdf', 'stj', '2018-06-22 17:43:04'),
(19, 'board_test', 14, 'fasdf\r\nfasdf\r\nsf\r\nsadf\r\n', 'stj', '2018-06-22 17:43:20'),
(20, 'board_test', 14, 'aaaaaaa', 'stj', '2018-06-22 17:44:03'),
(21, 'board_test', 14, 'aaaaaaaaaaaarrrrrrrrr', 'stj', '2018-06-22 17:45:40'),
(22, 'board_test', 14, 'aaaaaa\r\nrrrrr', 'stj', '2018-06-22 17:47:10'),
(23, 'board_test', 14, 'aaaaaa\r\nrrrrr', 'stj', '2018-06-22 17:47:15'),
(24, 'board_test', 14, 'aaaaaa\r\nrrrrr', 'stj', '2018-06-22 17:47:16'),
(25, 'board_test', 14, 'rrrrrrrrraaaa', 'stj', '2018-06-22 17:47:29'),
(26, 'board_test', 14, 'eeeeee', 'stj', '2018-06-22 17:47:46'),
(27, 'board_test', 14, 'fadsf', 'stj', '2018-06-22 17:48:42'),
(28, 'board_test', 14, 'aaaaaaa\r\nbbbbb', 'stj', '2018-06-22 17:49:55'),
(29, 'board_test', 14, 'wwwww', 'stj', '2018-06-22 17:50:15'),
(30, 'board_test', 14, 'aaaaa', 'stj', '2018-06-22 17:51:08'),
(31, 'board_test', 14, 'aa', 'stj', '2018-06-22 17:51:35'),
(32, 'board_test', 14, 'rrr', 'stj', '2018-06-22 17:52:09'),
(33, 'board_test', 14, '222', 'stj', '2018-06-22 17:52:39'),
(34, 'board_test', 14, 'rr', 'stj', '2018-06-22 17:52:53'),
(35, 'board_test', 11, 'gdfgdsfg', 'stj', '2018-06-25 10:44:19'),
(36, 'board_test', 11, 'fasdfsf', 'stj', '2018-06-25 10:51:50'),
(37, 'board_test', 11, 'fasdfsd', 'stj', '2018-06-25 10:54:15'),
(38, 'board_test', 11, 'wwwwww', 'stj', '2018-06-25 10:56:47'),
(39, 'board_test', 11, 'rrrrrr', 'stj', '2018-06-25 10:58:06'),
(40, 'board_test', 11, 'www', 'stj', '2018-06-25 10:59:42'),
(41, 'board_test', 11, 'aaaa', 'stj', '2018-06-25 11:02:31'),
(42, 'board_test', 11, 'fsadfsa\r\nfsdf\r\nsf\r\nsdf\r\n', 'stj', '2018-06-25 11:09:38'),
(43, 'board_test', 11, 'aaaaaa', 'stj', '2018-06-25 11:11:10'),
(44, 'board_test', 11, 'aaaaaaaaa', 'stj', '2018-06-25 11:12:33'),
(45, 'board_test', 11, 'aaaaaaaaa', 'stj', '2018-06-25 11:15:27'),
(46, 'board_test', 11, 'aaaaaaa', 'stj', '2018-06-25 11:15:47'),
(47, 'board_test', 11, 'rrrrrrrrrr', 'stj', '2018-06-25 11:19:54'),
(48, 'board_test', 11, 'ㅁㅁㅁㅁㅁㅁㅁㅁ', 'stj', '2018-06-25 11:21:00'),
(49, 'board_test', 11, 'ㄹㄴㅇㄹㄹ', 'stj', '2018-06-25 11:21:36'),
(50, 'board_test', 11, 'ㄻㄴㅇㄹㄴㅇ\r\nㄻㄴㅇ\r\nㄹㄴ\r\nㅇㄻㄴ', 'stj', '2018-06-25 11:21:59'),
(54, 'board_test', 9, 'ㅈㅈㅈㅈㅈㅈ', 'stj', '2018-06-25 16:50:56'),
(58, 'board_test', 15, 'rrrrrrrrrrr', 'stj', '2018-07-02 16:55:14');

-- --------------------------------------------------------

--
-- 테이블 구조 `file_boards`
--

CREATE TABLE `file_boards` (
  `idx` int(11) NOT NULL,
  `board_id` varchar(255) NOT NULL,
  `board_idx` int(11) DEFAULT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` varchar(255) NOT NULL,
  `origina_name` varchar(255) NOT NULL,
  `artifical_name` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `file_boards`
--

INSERT INTO `file_boards` (`idx`, `board_id`, `board_idx`, `file_type`, `file_size`, `origina_name`, `artifical_name`, `created`) VALUES
(2, 'board_test', 3, '', '', 'origina_name1', 'artifical_name1', '0000-00-00 00:00:00'),
(3, 'board_test', 3, '', '', 'origina_name2', 'artifical_name2', '0000-00-00 00:00:00'),
(4, 'board_test', 2, '', '', 'origina_name22', 'artifical_name22', '0000-00-00 00:00:00'),
(5, 'test', 7, 'image/jpeg', '96752', '1506_sq_01.jpg', 'visR2eDk.jpg', '2018-04-05 17:36:35'),
(6, 'board_test', 8, 'image/jpeg', '96752', '1506_sq_01.jpg', '466Ac2cM.jpg', '2018-04-05 17:38:11'),
(7, 'board_test', 9, 'image/jpeg', '96752', '1506_sq_01.jpg', 'MK7SETm1.jpg', '2018-04-05 17:39:19'),
(8, 'board_test', 13, 'image/jpeg', '96752', '1506_sq_01.jpg', '77BIdNCG.jpg', '2018-04-05 17:42:39'),
(9, 'board_test', 13, 'image/jpeg', '216326', '20160828_160339936_81627.jpg', 'aJ1dQJlf.jpg', '2018-04-05 17:42:39');

-- --------------------------------------------------------

--
-- 테이블 구조 `member`
--

CREATE TABLE `member` (
  `idx` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('admin','user','guest') NOT NULL DEFAULT 'guest',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `member`
--

INSERT INTO `member` (`idx`, `id`, `password`, `email`, `role`, `created`, `updated`, `login`) VALUES
(1, 'fsdf', '$2y$08$UVIxQkpGLzVZNDU3WmFlM.j8TkRGx7hdtWq2KZgZKrlt.iLsxyZrW', 'fsdf', 'guest', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'fasdfdsf', '$2y$08$TUJ6dXhkVUJ4YXZ6MlJxLuj3v.JL0gQG3v0OZk5yZtyOrJ/NR4VW6', 'fasdfdsf@nate.com', 'guest', '0000-00-00 00:00:00', '2018-01-16 16:53:20', '0000-00-00 00:00:00'),
(6, 'stj', '$2y$08$NGZJYkRiNDVuNk5NY0FWdOMVe7q6ZY46pvtSCV.U1bG/u9cSWvQHm', 'stj53@nate.com', 'guest', '2017-12-07 10:21:03', '2018-02-28 16:25:34', '2018-07-04 13:15:39'),
(33, 'fasdf', '$2y$08$U1VwN0c5WFRPYnB0NTFlYuTYteU3ubwH8pFaE/k6nKV8F3I.CBW6e', 'fasdf@nate.com', 'guest', '2018-01-10 17:54:56', '2018-01-16 16:59:51', '2018-01-16 17:00:07'),
(38, 'stjs', '$2y$08$dWZMbmszMThscHdSbFA2VOmdSC36olkvTNftwaePH1L1HXlvnoFKK', 'stj53@nate.com', 'guest', '2018-01-11 16:20:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'test0', '$2y$08$dWZMbmszMThscHdSbFA2VOmdSC36olkvTNftwaePH1L1HXlvnoFKK', 'test0@nate.com', 'guest', '2018-01-11 16:23:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'stj1', '$2y$08$Y0I4MnZ5RGtobENpTFRQZelxIlZEfEpMWAcIUYzyigV3W0uzlp3d2', 'stj53@nate.com', 'guest', '2018-01-15 17:41:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'stj2', '$2y$08$US9tcVlOeDlIaFFyZDZ3dOJF8jJjpi4WW7ecxoC5w5CsaDEgZb7aO', 'stj53@nate.com', 'guest', '2018-01-15 17:49:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'aaaa', '$2y$08$MXkvQjNKOURHVGUvRFpxW.WxQhD8TJCPqBAtBx4DYhGoSVN.Rc.2u', 'aaaa@co.kr', 'guest', '2018-02-28 16:29:03', '0000-00-00 00:00:00', '2018-02-28 16:29:10');

-- --------------------------------------------------------

--
-- 테이블 구조 `setup_board`
--

CREATE TABLE `setup_board` (
  `idx` int(11) NOT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `skin` varchar(255) NOT NULL,
  `file` enum('Y','N') NOT NULL DEFAULT 'N',
  `reply` enum('Y','N') NOT NULL DEFAULT 'N',
  `comment` enum('Y','N') NOT NULL DEFAULT 'N',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `setup_board`
--

INSERT INTO `setup_board` (`idx`, `id`, `name`, `skin`, `file`, `reply`, `comment`, `created`) VALUES
(5, 'test', 'rrtest', 'skin', 'N', 'N', 'N', '2018-03-24 16:35:24');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `board_test`
--
ALTER TABLE `board_test`
  ADD PRIMARY KEY (`idx`);

--
-- 테이블의 인덱스 `comment_boards`
--
ALTER TABLE `comment_boards`
  ADD PRIMARY KEY (`idx`);

--
-- 테이블의 인덱스 `file_boards`
--
ALTER TABLE `file_boards`
  ADD PRIMARY KEY (`idx`);

--
-- 테이블의 인덱스 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`idx`);

--
-- 테이블의 인덱스 `setup_board`
--
ALTER TABLE `setup_board`
  ADD PRIMARY KEY (`idx`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `board_test`
--
ALTER TABLE `board_test`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 테이블의 AUTO_INCREMENT `comment_boards`
--
ALTER TABLE `comment_boards`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- 테이블의 AUTO_INCREMENT `file_boards`
--
ALTER TABLE `file_boards`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 테이블의 AUTO_INCREMENT `member`
--
ALTER TABLE `member`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- 테이블의 AUTO_INCREMENT `setup_board`
--
ALTER TABLE `setup_board`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
