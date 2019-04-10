-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2019 at 10:51 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

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
(4, '2019_03_26_114726_create_posting_workers_table', 1),
(5, '2019_03_26_114805_create_expertises_table', 1),
(6, '2019_03_27_080653_create_posting_expertises_table', 1),
(7, '2019_04_10_074930_create_products_table', 2);

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

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(10,2) NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1:Active, 0:Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AELO Men\'s Cotton T Shirt-(Amt1072-Pn_White)', 'Fit Type: Regular Fit\r\n100% Cotton premium fabric, Plain white\r\nHalf Sleeves, Round neck\r\nRegular fit, Casual T-Shirt\r\nThis new trendy t shirt has stylish color which will add value to your look whether you are suiting up for a party or going out for gym. This designer t shirt for men from our latest collection is sure to find place in your wardrobe this summer.\r\nCare instruction : Wash separatel', 399.00, '1', '2019-04-10 03:10:56', '2019-04-10 03:10:56'),
(2, 'Katso Men\'s Cotton T-Shirt (Pack Of 1) (Katso-Hood-Full)', 'Katso Men\'s Cotton T-Shirt (Pack Of 1) (Katso-Hood-Full)', 288.00, '1', '2019-04-10 03:11:40', '2019-04-10 03:11:40'),
(3, 'Seven Rocks Regular Fit Men\'s Cotton T-Shirt (T16)', 'Fit Type: Regular Fit\r\nDesigner Waist Coat Style Tshirt with contrasting colors\r\nSoft flow dyed 60% Cotton, 40% Polyester\r\nFabric Gsm Is 190\r\nComfortable Regular Fit\r\nMachine wash Cold', 599.00, '1', '2019-04-10 03:13:25', '2019-04-10 03:13:25'),
(4, 'Urbano Fashion Men\'s Black, Grey, Yellow Round Neck Full Sleeve T-Shirt', 'Care Instructions: Wash with similar colors\r\nFit Type: Slim Fit\r\nMaterial: 100% Cotton; Care Instructions: Wash with similar colors\r\nColor: Black, Yellow, Grey\r\nNeck Type: Round Neck; Sleeve Type: Full Sleeve\r\nPackage Contents: 1 T-Shirt; Occasion: Casual; Other Features: Slim Fit\r\nNote: Imperial Clothing Company is the only manufacturer and authorized retailer of brand Urbano Fashion. Please check seller name before purchase.', 345.00, '1', '2019-04-10 03:14:45', '2019-04-10 03:14:45'),
(5, 'EYEBOGLER Regular Fit Men\'s Cotton T-Shirt', 'EYEBOGLER Regular Fit Men\'s Cotton T-Shirt', 370.00, '1', '2019-04-10 03:18:54', '2019-04-10 03:18:54'),
(6, 'Ezellohub® Valentine Day Apna Time Aayega Printed Round Nec', 'Ezellohub® Valentine Day Apna Time Aayega Printed Round Neck & Half Sleev White T-Shirt for Boys/Men/Brother/Friends/Boy Friend', 299.00, '1', '2019-04-10 03:19:26', '2019-04-10 03:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `postings`
--
ALTER TABLE `postings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posting_expertises`
--
ALTER TABLE `posting_expertises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posting_workers`
--
ALTER TABLE `posting_workers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
