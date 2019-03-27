-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2019 at 09:12 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assigment`
--

-- --------------------------------------------------------

--
-- Table structure for table `expertises`
--

CREATE TABLE `expertises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expertises`
--

INSERT INTO `expertises` (`id`, `uuid`, `name`, `created_at`, `updated_at`) VALUES
(1, 'f43fdk-333ddf-4545kf-5545', 'Driver', '2019-03-25 13:00:00', NULL),
(2, 'f432sfdk-333ddf-4545kf-5545', 'BarTender', '2019-03-25 13:00:00', NULL),
(3, 'f43fdk-343490fg-4545kf-55343', 'Managment', '2019-03-19 13:00:00', NULL),
(5, 'f43fddfk-34390fg-4545kf-5545', 'Attender', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_03_26_114621_create_postings_table', 1),
(14, '2019_03_26_114726_create_posting_workers_table', 2),
(15, '2019_03_26_114805_create_expertises_table', 2),
(16, '2019_03_27_080653_create_posting_expertises_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postings`
--

CREATE TABLE `postings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('available','started','done','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postings`
--

INSERT INTO `postings` (`id`, `uuid`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'f43fdk-34390fg-4545kf-55451', 'Bentree Hotel', 'done', '2019-03-25 18:30:00', NULL),
(2, 'f43fdk-324390fg-4545kf-5545', 'Big Bar', 'done', '2019-03-25 18:30:00', NULL),
(3, 'f43fdk-34390fg-4545kf-554514', 'Safina', 'available', '2019-03-25 18:30:00', NULL),
(4, 'f43fdk-34390fg-4545kf-554541', 'Silvatsa', 'available', '2019-03-25 18:30:00', NULL),
(5, 'f43fdk-343903fg-4545kf-5545', 'American Tour', 'available', '2019-03-25 18:30:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posting_expertises`
--

CREATE TABLE `posting_expertises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posting_id` bigint(20) UNSIGNED NOT NULL,
  `expertise_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posting_expertises`
--

INSERT INTO `posting_expertises` (`id`, `uuid`, `posting_id`, `expertise_id`, `created_at`, `updated_at`) VALUES
(1, 'f43fdk-343905fdg-4545kf-5545', 1, 3, '2019-03-25 13:00:00', NULL),
(2, 'f43fdek-343904fdg-4545kf-5545', 2, 2, '2019-03-26 13:00:00', NULL),
(3, 'f43fdek-343950fdg-4545kf-5545', 3, 2, '2019-03-17 13:00:00', NULL),
(4, 'f43fdek-343950fdg-4545kf-5545', 3, 3, '2019-03-25 13:00:00', NULL),
(5, 'f43fdek-343950fdg-4545kf-5545', 1, 3, '2019-03-25 13:00:00', NULL),
(6, 'f43fdek-343950fdg-4545kf-55451', 1, 1, '2019-03-26 13:00:00', NULL),
(7, 'f4d3fdk-34390fg-4545kf-5545', 1, 5, '2019-03-25 18:30:00', NULL),
(8, 'f43fde22k-34390fdg-4545kf-5545', 2, 5, '2019-03-24 18:30:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posting_workers`
--

CREATE TABLE `posting_workers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `worker_id` bigint(20) UNSIGNED NOT NULL,
  `posting_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('matched','reject','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'matched',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posting_workers`
--

INSERT INTO `posting_workers` (`id`, `uuid`, `worker_id`, `posting_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'f43fdk-34390fdg-4545kf-5545', 1, 1, 'matched', '2019-03-25 13:00:00', NULL),
(2, 'f43fdk-343903fg-4545kf-55343', 1, 2, 'matched', '2019-03-25 13:00:00', NULL),
(3, 'f43fdk-343903fg-45345kf-55343', 1, 3, 'matched', '2019-03-25 13:00:00', NULL),
(4, 'f43fdk2-343903fg-45345kf-55343', 1, 4, 'matched', '2019-03-25 13:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'f43fdk-34390fg-4545kf-5545', 'john', 'Doe', 'john@gmail.com', '$2y$10$y/NUSC3o.9Vy4zADNi18lehr5FISEQJlOlCMmX4kQ/yYGEFBDisKq', NULL, NULL, NULL),
(2, 'f43fdk-34390fg-4545kf-55343', 'David', 'Luis', 'david@gmail.com', '$2y$10$y/NUSC3o.9Vy4zADNi18lehr5FISEQJlOlCMmX4kQ/yYGEFBDisKq', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expertises`
--
ALTER TABLE `expertises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `postings`
--
ALTER TABLE `postings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posting_expertises`
--
ALTER TABLE `posting_expertises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posting_expertises_posting_id_foreign` (`posting_id`),
  ADD KEY `posting_expertises_expertise_id_foreign` (`expertise_id`);

--
-- Indexes for table `posting_workers`
--
ALTER TABLE `posting_workers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posting_workers_worker_id_foreign` (`worker_id`),
  ADD KEY `posting_workers_posting_id_foreign` (`posting_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expertises`
--
ALTER TABLE `expertises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `postings`
--
ALTER TABLE `postings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posting_expertises`
--
ALTER TABLE `posting_expertises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posting_workers`
--
ALTER TABLE `posting_workers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posting_expertises`
--
ALTER TABLE `posting_expertises`
  ADD CONSTRAINT `posting_expertises_expertise_id_foreign` FOREIGN KEY (`expertise_id`) REFERENCES `expertises` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posting_expertises_posting_id_foreign` FOREIGN KEY (`posting_id`) REFERENCES `postings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posting_workers`
--
ALTER TABLE `posting_workers`
  ADD CONSTRAINT `posting_workers_posting_id_foreign` FOREIGN KEY (`posting_id`) REFERENCES `postings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posting_workers_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
