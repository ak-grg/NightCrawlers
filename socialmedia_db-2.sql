-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 09, 2021 at 06:11 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socialmedia_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` varchar(100) NOT NULL,
  `posted_to` varchar(100) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(1, 'anyone there', 'ak_grg', 'ak_grg', '2021-12-09 10:35:12', 'no', 1),
(2, 'hello', 'akshit_garg', 'ak_grg', '2021-12-09 10:37:16', 'no', 1),
(3, 'yo', 'amitabh_mishra', 'akshit_garg', '2021-12-09 10:40:24', 'no', 2),
(4, 'gg', 'ak_grg', 'amitabh_mishra_1', '2021-12-09 10:41:11', 'no', 3);

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `username`, `post_id`) VALUES
(1, 'ak_grg', 1),
(2, 'akshit_garg', 2),
(3, 'akshit_garg', 1),
(4, 'amitabh_mishra_1', 3),
(5, 'amitabh_mishra', 2),
(6, 'amitabh_mishra', 1),
(7, 'ak_grg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_to` varchar(64) NOT NULL,
  `user_from` varchar(64) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_to`, `user_from`, `body`, `date`, `opened`, `viewed`, `deleted`) VALUES
(1, 'amitabh_mishra', 'akshit_garg', 'hi', '2021-12-09 10:38:20', 'yes', 'yes', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_to` varchar(64) NOT NULL,
  `user_from` varchar(64) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_to`, `user_from`, `message`, `link`, `datetime`, `opened`, `viewed`) VALUES
(1, 'ak_grg', 'akshit_garg', 'Akshit Garg commented on your post', 'post.php?id=1', '2021-12-09 10:37:16', 'no', 'no'),
(2, 'akshit_garg', 'amitabh_mishra', 'Amitabh Mishra commented on your post', 'post.php?id=2', '2021-12-09 10:40:24', 'no', 'yes'),
(3, 'amitabh_mishra_1', 'ak_grg', 'Ak Grg commented on your post', 'post.php?id=3', '2021-12-09 10:41:11', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` varchar(100) NOT NULL,
  `user_to` varchar(100) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`) VALUES
(1, 'hello', 'ak_grg', 'none', '2021-12-09 10:35:01', 'no', 'no', 3),
(2, 'yo boy', 'akshit_garg', 'none', '2021-12-09 10:36:55', 'no', 'no', 2),
(3, 'hello', 'amitabh_mishra_1', 'none', '2021-12-09 10:39:21', 'no', 'no', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_name`, `email`, `password`, `signup_date`, `profile_pic`, `num_posts`, `num_likes`, `user_closed`, `friend_array`) VALUES
(1, 'Akshit', 'Garg', 'akshit_garg', 'Akshit@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-12-09', 'assets/images/profile_pics/default/7.png', 1, 2, 'no', ',ak_grg,amitabh_mishra,amitabh_mishra_1,'),
(2, 'Amitabh', 'Mishra', 'amitabh_mishra', 'Amit@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-12-09', 'assets/images/profile_pics/default/13.png', 0, 0, 'no', ',ak_grg,akshit_garg,'),
(3, 'Ak', 'Grg', 'ak_grg', 'Ak@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-12-09', 'assets/images/profile_pics/default/10.png', 1, 3, 'no', ',akshit_garg,amitabh_mishra,amitabh_mishra_1,'),
(4, 'Amitabh', 'Mishra', 'amitabh_mishra_1', 'Amitabh@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-12-09', 'assets/images/profile_pics/default/4.png', 1, 2, 'no', ',akshit_garg,ak_grg,');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
