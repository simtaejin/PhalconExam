-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 18-03-28 16:49
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

-- --------------------------------------------------------

--
-- 테이블 구조 `board_test`
--

CREATE TABLE `board_test` (
  `idx` int(11) NOT NULL,
  `ref_group` int(11) NOT NULL DEFAULT '0',
  `ref_level` int(11) NOT NULL DEFAULT '0',
  `ref_order` int(11) NOT NULL DEFAULT '0',
  `member` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `hits` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `board_test`
--

INSERT INTO `board_test` (`idx`, `ref_group`, `ref_level`, `ref_order`, `member`, `title`, `content`, `hits`, `created`, `updated`) VALUES
(1, 1, 0, 0, 'stj', 'fdsfdsf', 'fdsfssfs', 1, '2018-03-24 16:53:45', '0000-00-00 00:00:00'),
(2, 2, 0, 0, 'stj', 'fasdfasf', 'aaaaaaaaaaa', 0, '2018-03-28 10:56:54', '0000-00-00 00:00:00'),
(3, 3, 0, 0, 'stj', 'aaaaaaaaaaaaa', 'fasdfasdf', 0, '2018-03-28 10:57:02', '0000-00-00 00:00:00'),
(4, 4, 0, 0, 'stj', 'bbbbbbbbbbbbbbb', 'fasdfadsfasdf', 0, '2018-03-28 10:57:09', '0000-00-00 00:00:00'),
(5, 5, 0, 0, 'stj', 'rrrrrrrrrrrrrrr', 'fasdfasdfsf', 0, '2018-03-28 10:57:16', '0000-00-00 00:00:00'),
(6, 6, 0, 0, 'stj', 'wwwwwwwwwwwww', 'fasfsdfsadfasf', 1, '2018-03-28 10:57:25', '0000-00-00 00:00:00');

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
(4, 'board_test', 2, '', '', 'origina_name22', 'artifical_name22', '0000-00-00 00:00:00');

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
(6, 'stj', '$2y$08$NGZJYkRiNDVuNk5NY0FWdOMVe7q6ZY46pvtSCV.U1bG/u9cSWvQHm', 'stj53@nate.com', 'guest', '2017-12-07 10:21:03', '2018-02-28 16:25:34', '2018-03-28 10:52:24'),
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
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `setup_board`
--

INSERT INTO `setup_board` (`idx`, `id`, `name`, `created`) VALUES
(5, 'test', 'test', '2018-03-24 16:35:24');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `board_test`
--
ALTER TABLE `board_test`
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
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 테이블의 AUTO_INCREMENT `file_boards`
--
ALTER TABLE `file_boards`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
