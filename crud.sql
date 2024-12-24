-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th12 24, 2024 lúc 10:33 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `crud`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_user`
--

CREATE TABLE `app_user` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `app_user`
--

INSERT INTO `app_user` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Mai', 'mai@gmail.com', '$2y$10$fRwP9Pgt7MEVFlpYiTH9KuSSQRrxDOxr2kUjt.V30Yz2erOCgKgsG', '2024-12-21 15:28:44', '2024-12-21 15:28:44'),
(2, 'Mai2', 'mai2@gmail.com', '$2y$10$Drpb2NA7ElWqATMem8r3S.RHInPXHV49AJVrW3IbgIvrZ3dPBSV76', '2024-12-21 16:03:49', '2024-12-21 16:03:49'),
(3, 'trang', 'trang@gmail.com', '$2y$10$oYhz6hqH1CoYRS/.hMYlEeBEMPJo1.nHSdhoKM7TpmgNuJgl.wihK', '2024-12-22 15:41:00', '2024-12-22 15:41:00'),
(4, 'dung', 'dung@gmail.com', '$2y$10$W/8..gG9VTgL/CXQfC0VtueYe0btVN/omd/qiAkqOEKrR2cvJZkri', '2024-12-23 01:45:42', '2024-12-23 01:45:42'),
(26, 'test', 'test@gmail.com', '$2y$10$aRnSccy3jAu8YnKRLkJVg.OHyLcFzJiukN42UQvLIyMizCM3SXD5u', '2024-12-24 03:21:55', '2024-12-24 03:21:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `destinations`
--

CREATE TABLE `destinations` (
  `destination_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `description` text,
  `category` enum('City','Beach','Mountain','Nature','Island') NOT NULL,
  `average_temperature` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `destinations`
--

INSERT INTO `destinations` (`destination_id`, `name`, `country`, `city`, `description`, `category`, `average_temperature`, `created_at`, `updated_at`) VALUES
(4, 'Ho Chi Minh ', 'Viet Nam ', 'Ho Chi Minh ', 'A rich city in Viet Nam ', 'City', 30.00, '2024-12-18 16:04:47', '2024-12-18 16:04:47'),
(5, 'Da Nang ', 'Viet Nam ', 'Da Nang ', 'The most developed tourist city in Vietnam', 'City', 30.00, '2024-12-18 16:05:54', '2024-12-18 16:05:54'),
(6, 'Hoi An ', 'Viet Nam ', 'Da Nang ', 'The most developed tourist ancient city in Vietnam', 'City', 30.00, '2024-12-18 16:06:36', '2024-12-18 16:06:36'),
(7, 'Hue ', 'Viet Nam ', 'Hue ', 'The city has cheap culinary prices', 'City', 30.00, '2024-12-18 16:07:20', '2024-12-18 16:07:20'),
(8, 'Ba Na Hill ', 'Viet Nam ', 'Da Nang ', 'Cloud resort', 'City', 30.00, '2024-12-18 16:08:01', '2024-12-18 16:08:01'),
(9, 'Ha Long Bay ', 'Viet Nam ', 'Quang Ninh ', 'UNESSCO ', 'Nature', 30.00, '2024-12-18 16:08:55', '2024-12-18 16:08:55'),
(10, 'Ha Noi', 'Viet Nam', 'Ha Noi ', 'Thu do Viet Nam ', 'City', 30.00, '2024-12-18 21:13:55', '2024-12-18 21:13:55'),
(11, 'Phu Quoc Island', 'Viet Nam', 'Kien Giang ', 'Beauty Island', 'Island', 25.00, '2024-12-18 21:16:04', '2024-12-18 21:16:04'),
(12, 'Sa Pa ', 'Viet Nam ', 'Lao Cai ', 'Noi duy nhat co the co tuyet tai Viet Nam ', 'Nature', 20.00, '2024-12-18 21:17:04', '2024-12-18 21:17:04'),
(13, 'Dong Phong Nha', 'Viet Nam', 'Quang Binh ', 'Hang dong tu nhien ', 'Nature', 20.00, '2024-12-18 21:28:16', '2024-12-18 21:28:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `destination_id` int DEFAULT NULL,
  `tour_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comments` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `user_id`, `destination_id`, `tour_id`, `rating`, `comments`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 5, 'Amazing experience at Ha Long Bay!', '2024-11-09 03:40:35', '2024-11-09 03:40:35'),
(2, 2, 2, 2, 4, 'Tokyo is beautiful, but the tour felt a bit rushed.', '2024-11-09 03:40:35', '2024-11-09 03:40:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_12_21_213157_create_app_user_table', 2),
(6, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(7, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(8, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(9, '2016_06_01_000004_create_oauth_clients_table', 3),
(10, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3),
(11, '2024_12_24_093128_create_oauth_access_tokens_table', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `token`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'ea21a8aa85eb3f9d0056ec7396fc252103548d01c7121afaddd6366fc8c57c7172cf3d5d31bc6cfe', '2024-12-24 04:33:16', '2024-12-24 02:33:16', '2024-12-24 02:33:16'),
(2, 2, '3887cb066afaedcc5b1e90502d616b47feb595efeb025f87e492722ee40a99d21571e0b1ab24e63b', '2024-12-24 05:04:12', '2024-12-24 03:04:12', '2024-12-24 03:04:12'),
(3, 2, '766c751faf44ca4031fdf1612b490f8c81773b9918b7568122319e38827d17f137cdc9fb2efa4ae0', '2024-12-24 05:05:47', '2024-12-24 03:05:47', '2024-12-24 03:05:47'),
(4, 2, 'dcc37848e40196bbbf25fd5d23209d5fa27a504e814618e1890143949cf0ec73a284597e17a306b1', '2024-12-24 05:08:00', '2024-12-24 03:08:00', '2024-12-24 03:08:00'),
(5, 2, '9b37848d954a3192257d341b9409f667f87ba8ad5ab4c5e2cd7dd71108eec7ee0bb6ea3569d271f1', '2024-12-24 05:08:06', '2024-12-24 03:08:06', '2024-12-24 03:08:06'),
(6, 2, 'f38050a532b49813cb4493cd4912e74c4328bc8bfd5fdd0eb12db186f71dfb5f94bbe97ea55cee41', '2024-12-24 05:09:55', '2024-12-24 03:09:55', '2024-12-24 03:09:55'),
(7, 2, 'f8d7a539958cbb4b7ba5dd88fba586f789618bb49840d24121658651e7edb2bf2410c50ebc86d939', '2024-12-24 05:12:10', '2024-12-24 03:12:10', '2024-12-24 03:12:10'),
(8, 2, '44504a51429bedbd1a330bb97953b418f7d28138a9cfe379d67d85435a9c754bb7588d53b0ade818', '2024-12-24 05:18:42', '2024-12-24 03:18:42', '2024-12-24 03:18:42'),
(9, 2, '71a2b5d9827456cfa4aef4b26ece70b8318da3800a2036570e6f923ed3bced9921197004ceee4fc1', '2024-12-24 05:32:09', '2024-12-24 03:32:09', '2024-12-24 03:32:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '1yc3cxNXhyLWxIJLbFHTWnE352JzJN5HFFCSWNQN', NULL, 'http://localhost', 1, 0, 0, '2024-12-21 15:40:12', '2024-12-21 15:40:12'),
(2, NULL, 'Laravel Password Grant Client', 'xSAV0I2exBhOZFzjfGygflMB6sILVCC6xjYWUIoX', 'users', 'http://localhost', 0, 1, 0, '2024-12-21 15:40:12', '2024-12-21 15:40:12'),
(3, NULL, 'Laravel Personal Access Client', '3FAAlhxqzDyxtnux8GVI5MsN0oyH68gufLT3GfIk', NULL, 'http://localhost', 1, 0, 0, '2024-12-22 14:10:52', '2024-12-22 14:10:52'),
(4, NULL, 'Laravel Password Grant Client', 'vKLVFLPE6orWkDHj49mm9xQRqn7s6VpCE8lvDFRU', 'users', 'http://localhost', 0, 1, 0, '2024-12-22 14:10:52', '2024-12-22 14:10:52'),
(5, NULL, 'mai', 'p4B2rkNOeDuo48E3xNtUfeA1XcgDechMOq4YGX4O', 'app_user', 'http://localhost', 0, 1, 0, '2024-12-22 14:39:33', '2024-12-22 14:39:33'),
(6, NULL, 'Laravel Password Grant Client', 'S0IGqpDe2bNZwKIRqJiI7BLOVgN2uWFkyPcQ72Ij', 'app_user', 'http://localhost', 0, 1, 0, '2024-12-23 09:50:53', '2024-12-23 09:50:53'),
(7, NULL, 'Laravel Personal Access Client', 'vwRuR457p63VbuVELHd8wr4ZESb7Z0naA7o21E7L', NULL, 'http://localhost', 1, 0, 0, '2024-12-24 01:25:40', '2024-12-24 01:25:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-12-21 15:40:12', '2024-12-21 15:40:12'),
(2, 3, '2024-12-22 14:10:52', '2024-12-22 14:10:52'),
(3, 7, '2024-12-24 01:25:40', '2024-12-24 01:25:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('2af28f3de9e07b9a70bdaa52ee7d983151be49287eb2503693a8ed821ce2228f90150098cf692ad4', '113c8120735172751e6d2500212a7c0ba9e05f1c5dd73cc18400b57f3231767de16857e7b96a6c40', 0, '2025-12-23 12:35:48'),
('35097082ae2f52880a1510e7acfbd526698ffcbfe8b4b193f04155d9707028457623c89fa1093fdd', '7fef40df5763e9602cf87e8e80545432969cd85b9bbfc13fa150acbdcebce999de0c9bdd68acc0a0', 0, '2025-12-23 08:23:30'),
('59b7ecfc8ccccbee2606730f243928c795a464c5156312c94eb4903f1346ee006979a0e05e9e2f58', 'ca13f9b6996c4d0e4df41d54da973b01975333ab0f61bfe1a24a9c947765bea6e515754664613b9d', 0, '2025-12-22 21:49:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trip`
--

CREATE TABLE `trip` (
  `trip_id` int NOT NULL,
  `destination_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `duration` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `trip`
--

INSERT INTO `trip` (`trip_id`, `destination_id`, `name`, `description`, `duration`, `price`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ha Long Bay Cruise', 'A cruise through Ha Long Bay', 3, 150.00, '2024-08-25', '2024-08-27', '2024-11-08 20:28:32', '2024-11-08 20:28:32'),
(2, 2, 'Tokyo City Tour', 'A guided tour of Tokyo', 1, 100.00, '2024-01-22', '2024-01-22', '2024-11-08 20:28:32', '2024-11-08 20:28:32'),
(36, 6, 'Central Vietnam Tour Package', 'Da Nang(3N) ’ Hoi An(2N)', 6, 8725000.00, '2024-05-06', '2024-05-11', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(37, 4, '4 Days Vietnam Journey Through Southern Ho Chi Minh Mekong Delta', 'Ho Chi Minh City(3N)', 4, 12475000.00, '2024-07-21', '2024-07-24', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(38, 10, '7 Days Cultural and Scenic Journey Hanoi, Hue - Danang - Hoi An - Ba Na Hills', 'Hanoi(2N) ’ Halong Bay(1N) ’ Hue(1N) ’ Danang(2N)', 7, 10975000.00, '2024-09-23', '2024-09-29', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(39, 4, 'Vietnam Adventure Quest Package for 7 Days', 'Ho Chi Minh City(2N) ’ Danang(2N) ’ Hanoi(2N)', 7, 13075000.00, '2024-12-27', '2025-01-02', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(40, 5, '3 Days Cultural and Scenic Journey to Danang Ba Na Hills', 'Hoi An(2N)', 3, 6725000.00, '2024-10-04', '2024-10-06', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(41, 10, '6 Days Vietnam Journey Across Northern Wonders Package', 'Hanoi(4N) ’ Sapa(1N)', 6, 19075000.00, '2024-10-29', '2024-11-03', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(42, 11, 'Premium Epic Vietnam Tour', 'Hanoi(2N) ’ Halong Bay(1N) ’ Da Nang(2N)Ba Na Hills(1N) ’ Ho Chi Minh City(2N) ’ Phu Quoc Island(2N)', 11, 28650000.00, '2024-11-11', '2024-11-21', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(43, 10, 'Vietnam & Cambodia: A Journey of Timeless Heritage and Unforgettable Adventures', 'Ho Chi Minh City(2N) ’ Da Nang(2N) ’ Hanoi(2N) ’ Halong Bay(1N) ’ Siem Reap(2N)', 10, 27050000.00, '2024-10-30', '2024-11-08', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(44, 5, 'Vietnam Discovery: Unveil the Magic of 3 cities - Hanoi Da Nang & Ho Chi Minh City', 'Hanoi(2N) ’ Da Nang(2N) ’ Ho Chi Minh City(2N)', 5, 11725000.00, '2024-07-24', '2024-07-28', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(45, 11, '10 Days Vietnam Journey Across Northern Wonders', 'Hanoi(4N) ’ Ninh Binh(2N) ’ Halong Bay(1N) ’ Sapa(3N)', 3, 32775000.00, '2024-04-26', '2024-04-28', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(46, 5, '5 Days Cultural and Scenic Journey To Danang - Hoi An - Hue - Ba Na Hills', 'Danang(3N) ’ Hue(1N)', 2, 12400000.00, '2024-11-28', '2024-11-29', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(47, 10, 'Vietnam Tour Package 4 Nights 5 Days', 'Hanoi(1N) ’ Halong Bay(1N) ’ Da Nang(2N)', 5, 11275000.00, '2024-08-07', '2024-08-11', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(48, 4, 'Classic Vietnam Tour Package: Hanoi & Ho Chi Minh', 'Hanoi (3N) ’ Ho Chi Minh City (2N)', 7, 17600000.00, '2024-04-06', '2024-04-12', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(49, 10, 'Essential Vietnam Tour Package: Hanoi, Danang & More', 'Hanoi(2N) ’ Danang(2N) ’ Ho Chi Minh City(2N)', 6, 14675000.00, '2024-07-10', '2024-07-15', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(50, 9, 'Mesmerising Vietnam Honeymoon Tour including Ha Long Bay Cruise', 'Ho Chi Minh City(2N) ’ Hanoi(1N) ’ Halong Bay(1N)', 5, 11125000.00, '2024-10-27', '2024-10-31', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(51, 5, 'Vietnam Highlights Tour Package: Must-See Sights & Experiences', 'Ho Chi Minh(2N) ’ Hoi An(2N) ’ Hanoi(1N) ’ Halong Bay(2N)', 8, 21050000.00, '2024-07-19', '2024-07-26', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(52, 9, 'Best of Vietnam Holiday Package Including Halong Bay Cruise', 'Hanoi(1N) ’ Halong Bay(1N) ’ Ho Chi Minh City(3N)', 6, 17300000.00, '2024-04-11', '2024-04-16', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(53, 7, 'Explore Vietnam Holiday Trip with Ha Long Bay Cruise', 'Hanoi(1N) ’ Halong Bay(1N) ’ Hue(1N) ’ Hoi An(2N) ’ Ho Chi Minh City(3N)', 9, 21950000.00, '2024-09-28', '2024-10-06', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(54, 11, 'Vietnam Tour Package - 8 Nights 9 Days', 'Hanoi(1N) ’ Ha Long Bay(1N) ’ Ho Chi Minh(2N) ’ Phu Quoc(4N)', 9, 22225000.00, '2024-11-16', '2024-11-24', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(55, 7, 'Fabulous Vietnam Tour Package for 7 Days with Private Boat Cruise', 'Ho Chi Minh City(3N) ’ Hanoi(2N) ’ Halong Bay(1N)', 7, 21650000.00, '2024-02-28', '2024-03-05', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(56, 11, 'Ho Chi Minh City and Phu Quoc Island Tour Package', 'Ho Chi Mihn City(3N) ’ Phu Quoc Island(3N)', 7, 16550000.00, '2024-03-02', '2024-03-08', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(57, 10, 'Beautiful Hanoi and Danang Package With Day Trip to Hoi An', 'Hanoi(3N) ’ Danang(2N)', 6, 17925000.00, '2024-05-12', '2024-05-17', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(58, 6, 'Hoi An and Da Nang Holiday Package with Cycle Tour', 'Hoi An(2N) ’ Da Nang(2N)', 5, 11775000.00, '2024-04-23', '2024-04-27', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(59, 9, 'Vietnam Itinerary 5 Days - Including Ha Long Bay Cruise', 'Hanoi(4N) ’ Halong Bay(0N) ’ Ninh Binh(0N)', 5, 9475000.00, '2024-06-19', '2024-06-23', '2024-12-18 21:21:48', '2024-12-18 21:21:48'),
(60, 10, 'Super Saver Vietnam Package in Hanoi & Ho Chi Minh City', 'Hanoi(2N) ’ Ninh Binh(0N) ’ Ho Chi Minh City(3N)', 6, 11875000.00, '2024-05-24', '2024-05-29', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(61, 12, '7 Days Northern Vietnam Adventure: Sapa With Fansipan Mountain Tour', 'Hanoi(2N) ’ Sapa(1N) ’ Hanoi(1N) ’ Halong Bay(1N) ’ Hanoi(1N)', 7, 20450000.00, '2024-07-30', '2024-08-05', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(62, 4, 'Mesmerising Vietnam Tour Package for 4 Nights: Free Cu Chi Tunnels', 'Ho Chi Minh City(2N) ’ Hanoi(1N) ’ Halong Bay(1N)', 5, 13075000.00, '2024-09-17', '2024-09-21', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(63, 8, 'Couple Special Vietnam Honeymoon Package: With Ba Na Hills Tickets', 'Hanoi(2N) ’ Danang(2N) ’ Ho Chi Minh City(2N)', 7, 23100000.00, '2024-10-27', '2024-11-02', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(64, 4, 'Mesmerising Vietnam and Cambodia Honeymoon Tour Package', 'Ho Chi Minh City(3N) ’ Hanoi(3N) ’ Halong Bay Cruise(1N) ’ Siem Reap(3N)', 11, 38825000.00, '2024-12-24', '2025-01-03', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(65, 10, 'Vietnam Adventure: Hanoi, Ha Long, Hoi An, and Phu Quoc 8-Day Itinerary', 'Hanoi(1N) ’ Ha Long Bay(1N) ’ Hanoi(1N) ’ Hoi An(2N) ’ Phu Quoc Island(2N)', 8, 21950000.00, '2024-06-07', '2024-06-14', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(66, NULL, 'Mui Ne Sand Dunes Package', 'Ho Chi Mihn City(0N) ’ Mui Ne Sand Dunes(3N)', 4, 7575000.00, '2024-03-24', '2024-03-27', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(67, 8, 'Treasures of Vietnam Family Package: Ba Na Hills Day Trip', 'Hanoi(2N) ’ Halong Bay(1N) ’ Da Nang(2N) ’ Ba Na Hils(0N) ’ Ho Chi Minh City(2N)', 8, 21050000.00, '2024-11-04', '2024-11-11', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(68, 10, 'Experience the Best of Vietnam and Cambodia in 7 Nights', 'Hanoi(3N) ’ Ho Chi Minh City(2N) ’ Siem Reap(2N)', 8, 22875000.00, '2024-07-12', '2024-07-19', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(69, 4, 'Romantic Royal Vietnam and Cambodia Tour: Complimentary Room Decoration', 'Ho Chi Minh City(3N) ’ Siem Reap(2N)', 6, 18950000.00, '2024-02-15', '2024-02-20', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(70, 10, 'Experience the Best of Vietnam - 11 Nights 12 Days', 'Hanoi(2N) ’ Halong Bay(1N) ’ Hue(1N) ’ Hoi An(2N) ’ Nha Trang(3N) ’ Ho Chi Minh City(2N)', 12, 26475000.00, '2024-01-11', '2024-01-22', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(71, 5, 'Luxury Vietnam Honeymoon: 7 Nights Blissful Package Deal', 'Hanoi(1N) ’ Halong Bay(1N) ’ Da Nang(2N) ’ Ho Chi Minh City(3N)', 8, 19700000.00, '2024-10-07', '2024-10-14', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(72, 10, 'Jewels of Cambodia and Vietnam Tour Package With Cruise', 'Hanoi(3N) ’ Halong Bay(1N) ’ Ho Chi Minh City(1N) ’ Phnom Penh(2N) ’ Siem Reap(2N)', 10, 26325000.00, '2024-10-05', '2024-10-14', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(73, 10, '4 Star Luxury Vietnam Holiday Tour Package for 9 Nights', 'Hanoi(3N) ’ Halong Bay(1N) ’ Phu Quoc Island(3N) ’ Ho Chi Minh City(2N)', 10, 28575000.00, '2024-07-02', '2024-07-11', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(74, 10, 'Historically Amazing Vietnam Tour', 'Hanoi(3N) ’ Halong Bay(1N) ’ Hue(2N) ’ Hoi An(2N) ’ Ho Chi Minh City(2N)', 11, 25575000.00, '2024-03-22', '2024-04-01', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(75, 12, 'Vietnam Itinerary 10 Days', 'Hanoi(2N) ’ Sapa(1N) ’ Halong Bay(1N) ’ Da Nang(2N) ’ Ho Chi Minh City(3N)', 10, 23625000.00, '2024-08-12', '2024-08-21', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(76, 13, 'Vietnam Tour Package With Phong Nha Ke Bang National Park', 'Hanoi(1N) ’ Halong Bay(1N) ’ Hanoi(1N) ’ Dong Hoi(1N) ’ Quang Bing Province(1N) ’ Hoi An(2N)', 8, 23925000.00, '2024-05-24', '2024-05-31', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(77, 9, '7 Nights Vietnam Family Special Tour Package', 'Hanoi(3N) ’ Halong Bay(2N) ’ Ho Chi Minh City(2N)', 8, 22575000.00, '2024-02-22', '2024-02-29', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(78, 11, 'Phu Quoc Island 3 Nights 4 Days Holiday Tour Package', 'Phu Quoc Island(3N)', 4, 11125000.00, '2024-07-12', '2024-07-15', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(79, NULL, 'Discover Vietnam Package: Free Golden Hands Bridge Cable Car Ticket', 'Hanoi(2N) ’ Halong(1N) ’ Da Nang(2N) ’ Ho Chi Minh(2N)', 8, 22650000.00, '2024-03-20', '2024-03-27', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(80, 6, 'Classic Vietnam Tour including Sapa & Mekong Delta', 'Hanoi(0N) ’ Sapa(1N) ’ Halong Bay(2N) ’ Hue(1N) ’ Hoi An(2N) ’ Ho Chi Minh City(2N) ’ Mekong Delta(1N)', 12, 27375000.00, '2024-07-01', '2024-07-12', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(81, 9, 'Magical Vietnam Package With Boat Ride to Tam Coc Caves', 'Hanoi(2N) ’ Halong Bay(1N) ’ Hoa Lu(0N) ’ Ho Chi Minh City(3N)', 7, 23175000.00, '2024-11-05', '2024-11-11', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(82, 4, 'Delightful Vietnam & Cambodia Holiday Package', 'Hanoi(3N) ’ Halong Bay(0N) ’ Ho Chi Minh City(3N) ’ Siem Reap(2N) ’ Phnom Penh(2N)', 11, 29775000.00, '2024-09-27', '2024-10-07', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(83, 9, '7 Days Honeymoon in Vietnam: Couple Special Package', 'Hanoi(2N) ’ Halong(1N) ’ Hanoi(1N) ’ Nha Trang(2N)', 7, 21575000.00, '2024-02-26', '2024-03-03', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(84, 10, 'Rediscover Romance in Vietnam Package for Couples', 'Hanoi(2N) ’ Halong(2N) ’ Ho Chi Minh City(2N)', 7, 24075000.00, '2024-07-20', '2024-07-26', '2024-12-18 21:32:51', '2024-12-18 21:32:51'),
(85, 4, 'Central Vietnam Tour Package', 'Da Nang(3N) → Hoi An(2N)', 6, 8725000.00, '2024-04-17', '2024-04-22', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(86, 4, '4 Days Vietnam Journey Through Southern Ho Chi Minh – Cu Chi – Mekong Delta', 'Ho Chi Minh City(3N)', 4, 12475000.00, '2024-10-24', '2024-10-27', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(87, 10, '7 Days Cultural and Scenic Journey Hanoi – Halong – Hue - Danang – Hoi An – Ba Na Hills', 'Hanoi(2N) → Halong Bay(1N) → Hue(1N) → Danang(2N)', 7, 10975000.00, '2024-03-12', '2024-03-18', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(88, 9, 'Vietnam Odyssey: Discover the Wonders of North and South', 'Hanoi(2N) → Halong Bay(1N) → Ho Chi Minh City(2N)', 6, 10975000.00, '2024-07-11', '2024-07-16', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(89, 4, 'Vietnam Adventure Quest Package for 7 Days', 'Ho Chi Minh City(2N) → Danang(2N) → Hanoi(2N)', 7, 13075000.00, '2024-01-21', '2024-01-27', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(90, 5, '3 Days Cultural and Scenic Journey to Danang – Hoi An – Ba Na Hills', 'Hoi An(2N)', 3, 6725000.00, '2024-09-11', '2024-09-13', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(91, 12, '6 Days Vietnam Journey Across Northern Wonders Package', 'Hanoi(4N) → Sapa(1N)', 6, 19075000.00, '2024-04-27', '2024-05-02', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(92, 11, 'Premium Epic Vietnam Tour', 'Hanoi(2N) → Halong Bay(1N) → Da Nang(2N) → Ba Na Hills(1N) → Ho Chi Minh City(2N) → Phu Quoc Island(2N)', 11, 28650000.00, '2024-07-06', '2024-07-16', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(93, 9, 'Vietnam & Cambodia: A Journey of Timeless Heritage and Unforgettable Adventures', 'Ho Chi Minh City(2N) → Da Nang(2N) → Hanoi(2N) → Halong Bay(1N) → Siem Reap(2N)', 10, 27050000.00, '2024-08-08', '2024-08-17', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(94, 4, 'Vietnam Discovery: Unveil the Magic of 3 cities - Hanoi, Da Nang & Ho Chi Minh City', 'Hanoi(2N) → Da Nang(2N) → Ho Chi Minh City(2N)', 7, 11725000.00, '2024-06-22', '2024-06-28', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(95, 10, '10 Days Vietnam Journey Across Northern Wonders', 'Hanoi(4N) → Ninh Binh(2N) → Halong Bay(1N) → Sapa(3N)', 10, 32775000.00, '2024-07-23', '2024-08-01', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(96, 5, '5 Days Cultural and Scenic Journey To Danang – Hoi An – Hue – Ba Na Hills', 'Danang(3N) → Hue(1N)', 5, 12400000.00, '2024-05-20', '2024-05-24', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(97, 9, 'Vietnam Tour Package 4 Nights 5 Days', 'Hanoi(1N) → Halong Bay(1N) → Da Nang(2N)', 5, 11275000.00, '2024-03-27', '2024-03-31', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(98, 4, 'Classic Vietnam Tour Package: Hanoi & Ho Chi Minh', 'Hanoi(3N) → Ho Chi Minh City(2N)', 6, 17600000.00, '2024-01-12', '2024-01-17', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(99, 10, 'Essential Vietnam Tour Package: Hanoi, Danang & More', 'Hanoi(2N) → Danang(2N) → Ho Chi Minh City(2N)', 7, 14675000.00, '2024-06-13', '2024-06-19', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(100, 9, 'Mesmerising Vietnam Honeymoon Tour including Halong Bay Cruise', 'Ho Chi Minh City(2N) → Hanoi(1N) → Halong Bay(1N)', 5, 11125000.00, '2024-02-28', '2024-03-03', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(101, 4, 'Vietnam Highlights Tour Package: Must-See Sights & Experiences', 'Ho Chi Minh(2N) → Hoi An(2N) → Hanoi(1N) → Halong Bay(2N)', 8, 21050000.00, '2024-06-11', '2024-06-18', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(102, 9, 'Best of Vietnam Holiday Package Including Halong Bay Cruise', 'Hanoi(1N) → Halong Bay(1N) → Ho Chi Minh City(3N)', 6, 17300000.00, '2024-09-28', '2024-10-03', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(103, 9, 'Explore Vietnam Holiday Trip with Halong Bay Cruise', 'Hanoi(1N) → Halong Bay(1N) → Hue(1N) → Hoi An(2N) → Ho Chi Minh City(3N)', 9, 21950000.00, '2024-05-21', '2024-05-29', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(104, 9, 'Vietnam Tour Package - 8 Nights 9 Days', 'Hanoi(1N) → Halong Bay(1N) → Ho Chi Minh(2N) → Phu Quoc(4N)', 9, 22225000.00, '2024-09-15', '2024-09-23', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(105, 4, 'Fabulous Vietnam Tour Package for 7 Days with Private Boat Cruise', 'Ho Chi Minh City(3N) → Hanoi(2N) → Halong Bay(1N)', 7, 21650000.00, '2024-05-16', '2024-05-22', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(106, 4, 'Ho Minh City and Phu Quoc Island Tour Package', 'Ho Chi Minh City(3N) → Phu Quoc Island(3N)', 7, 16550000.00, '2024-09-27', '2024-10-03', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(107, 5, 'Beautiful Hanoi and Danang Package With Day Trip to Hoi An', 'Hanoi(3N) → Danang(2N)', 6, 17925000.00, '2024-08-04', '2024-08-09', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(108, 6, 'Hoi An and Da Nang Holiday Package with Cycle Tour', 'Hoi An(2N) → Da Nang(2N)', 5, 11775000.00, '2024-09-24', '2024-09-28', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(109, 9, 'Vietnam Itinerary 5 Days - Including Halong Bay Cruise', 'Hanoi(4N) → Halong Bay(0N) → Ninh Binh(0N)', 5, 9475000.00, '2024-11-22', '2024-11-26', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(110, 10, 'Rediscover Romance in Vietnam Package for Couples', 'Hanoi(2N) → Halong Bay(2N) → Ho Chi Minh City(2N)', 7, 24075000.00, '2024-04-07', '2024-04-13', '2024-12-19 05:12:10', '2024-12-19 05:12:10'),
(111, 10, 'Super Saver Vietnam Package in Hanoi & Ho Chi Minh City', 'Hanoi(2N) → Ninh Binh(0N) → Ho Chi Minh City(3N)', 6, 11875000.00, '2024-08-27', '2024-09-01', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(112, 12, '7 Days Northern Vietnam Adventure: Sapa With Fansipan Mountain Tour', 'Hanoi(2N) → Sapa(1N) → Hanoi(1N) → Halong Bay(1N) → Hanoi(1N)', 7, 20450000.00, '2024-06-22', '2024-06-28', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(113, 4, 'Mesmerising Vietnam Tour Package for 4 Nights: Free Cu Chi Tunnels', 'Ho Chi Minh City(2N) → Hanoi(1N) → Halong Bay(1N)', 5, 13075000.00, '2024-05-31', '2024-06-04', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(114, 8, 'Couple Special Vietnam Honeymoon Package: With Ba Na Hills Tickets', 'Hanoi(2N) → Danang(2N) → Ho Chi Minh City(2N)', 7, 23100000.00, '2024-08-24', '2024-08-30', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(115, 9, 'Mesmerising Vietnam and Cambodia Honeymoon Tour Package', 'Ho Chi Minh City(3N) → Hanoi(3N) → Halong Bay Cruise(1N) → Siem Reap(3N)', 11, 38825000.00, '2024-12-26', '2025-01-05', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(116, 11, 'Vietnam Adventure: Hanoi, Ha Long, Hoi An, and Phu Quoc 8-Day Itinerary', 'Hanoi(1N) → Ha Long Bay(1N) → Hanoi(1N) → Hoi An(2N) → Phu Quoc Island(2N)', 8, 21950000.00, '2024-12-30', '2025-01-06', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(117, 4, 'Mui Ne Sand Dunes Package', 'Ho Chi Minh City(0N) → Mui Ne Sand Dunes(3N)', 4, 7575000.00, '2024-01-10', '2024-01-13', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(118, 8, 'Treasures of Vietnam Family Package: Ba Na Hills Day Trip', 'Hanoi(2N) → Halong Bay(1N) → Da Nang(2N) → Ba Na Hills(0N) → Ho Chi Minh City(2N)', 8, 21050000.00, '2024-02-19', '2024-02-26', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(119, 10, 'Experience the Best of Vietnam and Cambodia in 7 Nights', 'Hanoi(3N) → Ho Chi Minh City(2N) → Siem Reap(2N)', 8, 22875000.00, '2024-08-07', '2024-08-14', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(120, 4, 'Romantic Royal Vietnam and Cambodia Tour: Complimentary Room Decoration', 'Ho Chi Minh City(3N) → Siem Reap(2N)', 6, 18950000.00, '2024-08-06', '2024-08-11', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(121, 6, 'Experience the Best of Vietnam - 11 Nights 12 Days', 'Hanoi(2N) → Halong Bay(1N) → Hue(1N) → Hoi An(2N) → Nha Trang(3N) → Ho Chi Minh City(2N)', 12, 26475000.00, '2024-03-12', '2024-03-23', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(122, 9, 'Luxury Vietnam Honeymoon: 7 Nights Blissful Package Deal', 'Hanoi(1N) → Halong Bay(1N) → Da Nang(2N) → Ho Chi Minh City(3N)', 8, 19700000.00, '2024-03-04', '2024-03-11', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(123, 10, 'Jewels of Cambodia and Vietnam Tour Package With Cruise', 'Hanoi(3N) → Halong Bay(1N) → Ho Chi Minh City(1N) → Phnom Penh(2N) → Siem Reap(2N)', 10, 26325000.00, '2024-04-16', '2024-04-25', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(124, 11, '4 Star Luxury Vietnam Holiday Tour Package for 9 Nights', 'Hanoi(3N) → Halong Bay(1N) → Phu Quoc Island(3N) → Ho Chi Minh City(2N)', 10, 28575000.00, '2024-12-06', '2024-12-15', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(125, 6, 'Historically Amazing Vietnam Tour', 'Hanoi(3N) → Halong Bay(1N) → Hue(2N) → Hoi An(2N) → Ho Chi Minh City(2N)', 11, 25575000.00, '2024-10-14', '2024-10-24', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(126, 9, 'Vietnam Itinerary 10 Days', 'Hanoi(2N) → Sapa(1N) → Halong Bay(1N) → Da Nang(2N) → Ho Chi Minh City(3N)', 10, 23625000.00, '2024-02-23', '2024-03-03', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(127, 13, 'Vietnam Tour Package With Phong Nha Ke Bang National Park', 'Hanoi(1N) → Halong Bay(1N) → Hanoi(1N) → Dong Hoi(1N) → Quang Binh Province(1N) → Hoi An(2N)', 8, 23925000.00, '2024-05-12', '2024-05-19', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(128, 9, '7 Nights Vietnam Family Special Tour Package', 'Hanoi(3N) → Halong Bay(2N) → Ho Chi Minh City(2N)', 8, 22575000.00, '2024-05-18', '2024-05-25', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(129, 11, 'Phu Quoc Island 3 Nights 4 Days Holiday Tour Package', 'Phu Quoc Island(3N)', 4, 11125000.00, '2024-10-21', '2024-10-24', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(130, 9, 'Discover Vietnam Package: Free Golden Hands Bridge Cable Car Ticket', 'Hanoi(2N) → Halong(1N) → Da Nang(2N) → Ho Chi Minh(2N)', 8, 22650000.00, '2024-11-24', '2024-12-01', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(131, 12, 'Classic Vietnam Tour including Sapa & Mekong Delta', 'Hanoi(0N) → Sapa(1N) → Halong Bay(2N) → Hue(1N) → Hoi An(2N) → Ho Chi Minh City(2N) → Mekong Delta(1N)', 12, 27375000.00, '2024-01-30', '2024-02-10', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(132, 9, 'Magical Vietnam Package With Boat Ride to Tam Coc Caves', 'Hanoi(2N) → Halong Bay(1N) → Hoa Lu(0N) → Ho Chi Minh City(3N)', 7, 23175000.00, '2024-09-11', '2024-09-17', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(133, 10, 'Delightful Vietnam & Cambodia Holiday Package', 'Hanoi(3N) → Halong Bay(0N) → Ho Chi Minh City(3N) → Siem Reap(2N) → Phnom Penh(2N)', 11, 29775000.00, '2024-03-31', '2024-04-10', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(134, 10, '7 Days Honeymoon in Vietnam: Couple Special Package', 'Hanoi(2N) → Halong(1N) → Hanoi(1N) → Nha Trang(2N)', 7, 21575000.00, '2024-02-23', '2024-02-29', '2024-12-19 05:20:41', '2024-12-19 05:20:41'),
(135, 9, 'Rediscover Romance in Vietnam Package for Couples', 'Hanoi(2N) → Halong(2N) → Ho Chi Minh City(2N)', 7, 24075000.00, '2024-12-26', '2025-01-01', '2024-12-19 05:20:41', '2024-12-19 05:20:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$RfgUNqtn8xvtvGDomPD13OhmD.sKefZAXLNM3V4BcFYV16CfAAmES', 'FByppTg6sBNMlMN1OeDe0HeTOIhEJZFvbufzMIGuJQcb3w9MpfCrNhHhQFNZ', '2024-11-02 13:35:13', '2024-11-02 13:35:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_trip`
--

CREATE TABLE `user_trip` (
  `user_trip_id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `trip_id` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `user_trip`
--

INSERT INTO `user_trip` (`user_trip_id`, `user_id`, `trip_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'booked', '2024-11-09 03:40:23', '2024-11-09 03:40:23'),
(2, 2, 2, 'cancelled', '2024-11-09 03:40:23', '2024-11-09 03:40:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `weather`
--

CREATE TABLE `weather` (
  `weather_id` bigint UNSIGNED NOT NULL,
  `destination_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `temperature` decimal(5,2) DEFAULT NULL,
  `humidity` decimal(5,2) DEFAULT NULL,
  `precipitation` decimal(5,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `weather`
--

INSERT INTO `weather` (`weather_id`, `destination_id`, `date`, `temperature`, `humidity`, `precipitation`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-11-10', 24.00, 85.00, 0.00, 'Sunny', '2024-11-09 03:29:00', '2024-11-09 03:29:00'),
(2, 2, '2024-12-01', 10.00, 60.00, 0.50, 'Cloudy with light rain', '2024-11-09 03:29:00', '2024-11-09 03:29:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_user_email_unique` (`email`);

--
-- Chỉ mục cho bảng `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`destination_id`),
  ADD UNIQUE KEY `destination_id` (`destination_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD UNIQUE KEY `feedback_id` (`feedback_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `fk_trip_destination` (`destination_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_trip`
--
ALTER TABLE `user_trip`
  ADD PRIMARY KEY (`user_trip_id`),
  ADD UNIQUE KEY `user_tour_id` (`user_trip_id`),
  ADD KEY `user_trip_id_foreign` (`trip_id`);

--
-- Chỉ mục cho bảng `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`weather_id`),
  ADD UNIQUE KEY `weather_id` (`weather_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `destinations`
--
ALTER TABLE `destinations`
  MODIFY `destination_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `trip`
--
ALTER TABLE `trip`
  MODIFY `trip_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `user_trip`
--
ALTER TABLE `user_trip`
  MODIFY `user_trip_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `weather`
--
ALTER TABLE `weather`
  MODIFY `weather_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `user_trip`
--
ALTER TABLE `user_trip`
  ADD CONSTRAINT `user_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
