-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 18-01-23 17:52
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
-- 테이블 구조 `board`
--

CREATE TABLE IF NOT EXISTS `board` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `member` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `hits` int(11) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `board`
--

INSERT INTO `board` VALUES(42, 'stj', 'fasdfa', NULL, 0, '2018-01-23 17:47:49', '0000-00-00 00:00:00');
INSERT INTO `board` VALUES(43, 'stj', 'TITLE', 'Contents', 0, '2018-01-23 17:48:40', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 테이블 구조 `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('admin','user','guest') NOT NULL DEFAULT 'guest',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `member`
--

INSERT INTO `member` VALUES(1, 'fsdf', '$2y$08$UVIxQkpGLzVZNDU3WmFlM.j8TkRGx7hdtWq2KZgZKrlt.iLsxyZrW', 'fsdf', 'guest', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `member` VALUES(4, 'fasdfdsf', '$2y$08$TUJ6dXhkVUJ4YXZ6MlJxLuj3v.JL0gQG3v0OZk5yZtyOrJ/NR4VW6', 'fasdfdsf@nate.com', 'guest', '0000-00-00 00:00:00', '2018-01-16 16:53:20', '0000-00-00 00:00:00');
INSERT INTO `member` VALUES(6, 'stj', '$2y$08$L3FTdU1KWE44a0IvQXdIM.Iez.A/zRVw2h.QQaO2jnjpuY7n7hTSm', 'stj53@nate.com', 'guest', '2017-12-07 10:21:03', '2018-01-13 06:40:49', '2018-01-23 15:15:39');
INSERT INTO `member` VALUES(33, 'fasdf', '$2y$08$U1VwN0c5WFRPYnB0NTFlYuTYteU3ubwH8pFaE/k6nKV8F3I.CBW6e', 'fasdf@nate.com', 'guest', '2018-01-10 17:54:56', '2018-01-16 16:59:51', '2018-01-16 17:00:07');
INSERT INTO `member` VALUES(38, 'stjs', '$2y$08$dWZMbmszMThscHdSbFA2VOmdSC36olkvTNftwaePH1L1HXlvnoFKK', 'stj53@nate.com', 'guest', '2018-01-11 16:20:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `member` VALUES(39, 'test0', '$2y$08$dWZMbmszMThscHdSbFA2VOmdSC36olkvTNftwaePH1L1HXlvnoFKK', 'test0@nate.com', 'guest', '2018-01-11 16:23:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `member` VALUES(40, 'stj1', '$2y$08$Y0I4MnZ5RGtobENpTFRQZelxIlZEfEpMWAcIUYzyigV3W0uzlp3d2', 'stj53@nate.com', 'guest', '2018-01-15 17:41:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `member` VALUES(41, 'stj2', '$2y$08$US9tcVlOeDlIaFFyZDZ3dOJF8jJjpi4WW7ecxoC5w5CsaDEgZb7aO', 'stj53@nate.com', 'guest', '2018-01-15 17:49:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 테이블 구조 `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `tj_admin`
--

CREATE TABLE IF NOT EXISTS `tj_admin` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role` enum('guest','user','admin') NOT NULL DEFAULT 'user',
  `deleted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `user`
--

INSERT INTO `user` VALUES(1, 'admin@admin.com', 'test', '', 0, '2013-10-14 16:57:16', '2013-10-14 17:04:23');
INSERT INTO `user` VALUES(7, 'user3332@user.com', '$2y$08$Q2dSMm9ORXNrbDN1clpTMOeMceNxvGJlTbwsN8vkAV83PstHieAUS', 'guest', 0, '2013-10-14 16:59:10', '0000-00-00 00:00:00');
INSERT INTO `user` VALUES(12, 'simtj53@nate.com', '$2y$08$cElHSHpHOVR1VGVPVkMzYeZrst10.ev/hSnc20qa6v59mMyM00Bkm', 'user', NULL, '2017-10-16 17:24:14', NULL);
INSERT INTO `user` VALUES(14, 'test@test.com', '$2y$08$SGkwN0RFblIxclpaRzl1KuvpxYTTKvW7Y7O0DGk3abAMvVbuCM8M2', 'guest', NULL, '2017-11-09 17:31:51', NULL);
INSERT INTO `user` VALUES(15, 'fsadfsf', 'fasdfasf', 'user', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
