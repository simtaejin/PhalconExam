-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 18-03-14 17:21
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
-- 테이블 구조 `board`
--

CREATE TABLE `board` (
  `idx` int(11) NOT NULL,
  `member` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `hits` int(11) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `board`
--

INSERT INTO `board` (`idx`, `member`, `title`, `content`, `hits`, `created`, `updated`) VALUES
(4, 'stj', 'a1111111111', 'b22222222222', 0, '2018-02-09 17:38:19', '0000-00-00 00:00:00'),
(5, 'stj', 'bbbbbbbbb', '            ccccccccccc', 0, '2018-02-12 17:40:38', '0000-00-00 00:00:00'),
(6, 'stj', 'fads', '           fsdf ', 0, '2018-03-13 17:33:12', '0000-00-00 00:00:00'),
(7, 'stj', 'fadsf', '            fasdf', 0, '2018-03-13 17:33:20', '0000-00-00 00:00:00'),
(8, 'stj', 'aaaaaaa', '        aafasdfsf    ', 0, '2018-03-13 17:33:23', '0000-00-00 00:00:00'),
(9, 'stj', 'rrrrrrrrr', '         fadsfsf   ', 0, '2018-03-13 17:33:27', '0000-00-00 00:00:00'),
(10, 'stj', 'vzxcvxv', '           vxcvzxv ', 0, '2018-03-13 17:33:37', '0000-00-00 00:00:00'),
(11, 'stj', 'rwerw', 'rwerw            ', 0, '2018-03-13 17:33:40', '0000-00-00 00:00:00'),
(12, 'stj', 'hfghfgh', '     fhdfghdf       ', 0, '2018-03-13 17:33:44', '0000-00-00 00:00:00'),
(13, 'stj', 'erter', '   tertertw         ', 0, '2018-03-13 17:33:48', '0000-00-00 00:00:00'),
(14, 'stj', 'vxcvxc', '      vvcxvvbcb      ', 0, '2018-03-13 17:33:53', '0000-00-00 00:00:00'),
(15, 'stj', 'khjkhj', '   khjkhjkh         ', 0, '2018-03-13 17:33:57', '0000-00-00 00:00:00'),
(16, 'stj', 'iyuiy', '            iyuiyui', 0, '2018-03-13 17:34:01', '0000-00-00 00:00:00'),
(17, 'stj', 'aaaa', '          rrrrrrr  ', 0, '2018-03-14 14:25:02', '0000-00-00 00:00:00');

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
(6, 'stj', '$2y$08$NGZJYkRiNDVuNk5NY0FWdOMVe7q6ZY46pvtSCV.U1bG/u9cSWvQHm', 'stj53@nate.com', 'guest', '2017-12-07 10:21:03', '2018-02-28 16:25:34', '2018-03-14 11:10:12'),
(33, 'fasdf', '$2y$08$U1VwN0c5WFRPYnB0NTFlYuTYteU3ubwH8pFaE/k6nKV8F3I.CBW6e', 'fasdf@nate.com', 'guest', '2018-01-10 17:54:56', '2018-01-16 16:59:51', '2018-01-16 17:00:07'),
(38, 'stjs', '$2y$08$dWZMbmszMThscHdSbFA2VOmdSC36olkvTNftwaePH1L1HXlvnoFKK', 'stj53@nate.com', 'guest', '2018-01-11 16:20:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'test0', '$2y$08$dWZMbmszMThscHdSbFA2VOmdSC36olkvTNftwaePH1L1HXlvnoFKK', 'test0@nate.com', 'guest', '2018-01-11 16:23:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'stj1', '$2y$08$Y0I4MnZ5RGtobENpTFRQZelxIlZEfEpMWAcIUYzyigV3W0uzlp3d2', 'stj53@nate.com', 'guest', '2018-01-15 17:41:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'stj2', '$2y$08$US9tcVlOeDlIaFFyZDZ3dOJF8jJjpi4WW7ecxoC5w5CsaDEgZb7aO', 'stj53@nate.com', 'guest', '2018-01-15 17:49:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'aaaa', '$2y$08$MXkvQjNKOURHVGUvRFpxW.WxQhD8TJCPqBAtBx4DYhGoSVN.Rc.2u', 'aaaa@co.kr', 'guest', '2018-02-28 16:29:03', '0000-00-00 00:00:00', '2018-02-28 16:29:10');

-- --------------------------------------------------------

--
-- 테이블 구조 `project`
--

CREATE TABLE `project` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `robots`
--

CREATE TABLE `robots` (
  `id` int(10) NOT NULL,
  `name` varchar(70) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'aaaaaaaaaa', 'aaaaaaaaa', '2018-03-14 16:06:46'),
(2, 'a1', 'a2', '2018-03-14 16:07:00'),
(3, 'aaaa', 'rrrr', '2018-03-14 17:09:12'),
(4, 'aaaa', 'rrrr', '2018-03-14 17:10:04');

-- --------------------------------------------------------

--
-- 테이블 구조 `tj_admin`
--

CREATE TABLE `tj_admin` (
  `idx` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role` enum('guest','user','admin') NOT NULL DEFAULT 'user',
  `deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `role`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'admin@admin.com', 'test', '', 0, '2013-10-14 16:57:16', '2013-10-14 17:04:23'),
(7, 'user3332@user.com', '$2y$08$Q2dSMm9ORXNrbDN1clpTMOeMceNxvGJlTbwsN8vkAV83PstHieAUS', 'guest', 0, '2013-10-14 16:59:10', '0000-00-00 00:00:00'),
(12, 'simtj53@nate.com', '$2y$08$cElHSHpHOVR1VGVPVkMzYeZrst10.ev/hSnc20qa6v59mMyM00Bkm', 'user', NULL, '2017-10-16 17:24:14', NULL),
(14, 'test@test.com', '$2y$08$SGkwN0RFblIxclpaRzl1KuvpxYTTKvW7Y7O0DGk3abAMvVbuCM8M2', 'guest', NULL, '2017-11-09 17:31:51', NULL),
(15, 'fsadfsf', 'fasdfasf', 'user', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`idx`);

--
-- 테이블의 인덱스 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`idx`);

--
-- 테이블의 인덱스 `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__user` (`user_id`);

--
-- 테이블의 인덱스 `robots`
--
ALTER TABLE `robots`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `setup_board`
--
ALTER TABLE `setup_board`
  ADD PRIMARY KEY (`idx`);

--
-- 테이블의 인덱스 `tj_admin`
--
ALTER TABLE `tj_admin`
  ADD PRIMARY KEY (`idx`);

--
-- 테이블의 인덱스 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `board`
--
ALTER TABLE `board`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 테이블의 AUTO_INCREMENT `member`
--
ALTER TABLE `member`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- 테이블의 AUTO_INCREMENT `project`
--
ALTER TABLE `project`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 테이블의 AUTO_INCREMENT `robots`
--
ALTER TABLE `robots`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 테이블의 AUTO_INCREMENT `setup_board`
--
ALTER TABLE `setup_board`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 테이블의 AUTO_INCREMENT `tj_admin`
--
ALTER TABLE `tj_admin`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT;
--
-- 테이블의 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `FK__user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
