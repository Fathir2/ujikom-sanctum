-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Nov 2024 pada 01.17
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inertia-notes`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agendas`
--

CREATE TABLE `agendas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title_agenda` varchar(255) NOT NULL,
  `desc_agenda` text DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `agendas`
--

INSERT INTO `agendas` (`id`, `user_id`, `title_agenda`, `desc_agenda`, `due_date`, `created_at`, `updated_at`) VALUES
(6, 4, 'Trans4krabat', 'Job, EduFair dan Panen Karya', '2024-12-15', '2024-10-28 21:11:02', '2024-10-29 20:47:05'),
(8, 4, 'Agenda Bulan Desember 2024', 'halooo', '2024-10-14', '2024-10-28 23:56:36', '2024-10-28 23:56:36'),
(9, 4, 'Agenda Bulan Januari 2025', 'agenda cuy', '2025-01-01', '2024-10-29 06:51:30', '2024-10-29 06:51:30'),
(10, 4, 'Agenda Bulan Februari 2025', 'AGenda', '2024-10-24', '2024-10-29 07:01:24', '2024-10-29 07:01:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cathegories`
--

CREATE TABLE `cathegories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cathegories`
--

INSERT INTO `cathegories` (`id`, `title`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Event Tahunan', '2024-11-08 05:48:31', '2024-11-08 05:48:31', 2),
(2, 'Mubes', '2024-11-08 05:49:25', '2024-11-10 05:52:15', 2),
(7, 'Trans4Krabat', '2024-11-08 09:17:23', '2024-11-08 09:17:23', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_album` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `galleries`
--

INSERT INTO `galleries` (`id`, `title_album`, `due_date`, `created_at`, `updated_at`, `user_id`, `category_id`) VALUES
(13, 'TRANS4KR4BAT', '2024-12-31', '2024-11-04 04:59:18', '2024-11-04 04:59:18', 2, NULL),
(15, 'EVENT TAHUNAN SMKN 4', '2024-12-31', '2024-11-08 06:03:59', '2024-11-10 20:04:55', 2, NULL),
(18, 'Event Fruit Tea Goes To School 2024', '2024-11-06', '2024-11-12 01:17:29', '2024-11-12 18:56:16', 4, 1),
(19, 'SMKN 4 Eevnt', '2024-11-14', '2024-11-12 03:00:18', '2024-11-12 03:00:18', 4, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gallery_id` bigint(20) UNSIGNED NOT NULL,
  `title_image` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `images`
--

INSERT INTO `images` (`id`, `user_id`, `gallery_id`, `title_image`, `image`, `description`, `created_at`, `updated_at`) VALUES
(29, 4, 15, 'NeosPragma', 'images/nseorO19iP3R6LSjOVmpWzkABcCPutcXxClG5c6i.jpg', 'Ini Event Tahunan SMKN 4 BOGOR', '2024-11-10 20:05:47', '2024-11-10 20:05:47'),
(32, 4, 18, 'Fruit Tea Event  - Mobile Legends', 'images/FZnIRameONrWDB2jQN0gVkbPWbovp7jim5vfbFFm.jpg', 'Lomba Mobile Legends di Eevnt FruitTea Goes to School 2024', '2024-11-12 01:19:23', '2024-11-12 01:19:23'),
(33, 4, 18, 'Fruit Tea Event - Art Challenge', 'images/C0CGwctbVZpzthmvY3iKdgV00gEyh3waUtpsj0xB.jpg', 'pelombaan menggambar di Eevnt Fruit Tea Goes To School', '2024-11-12 01:20:33', '2024-11-12 01:20:33'),
(34, 4, 18, 'Fruit Tea Event - Perfomance', 'images/KpN2Kr1bb4QIohzSmOUkch3Z4ZxjvTFlcsTNoD7L.jpg', 'Lomba Dance', '2024-11-12 18:11:00', '2024-11-12 18:11:00'),
(35, 4, 18, 'Fruit Tea Event - Singing Kontes', 'images/NWTeTF79rOQmRroDAPESlU6oda3QpsBM6mdeTkLP.jpg', 'Singin Kontes Fruit Tea Goes To School', '2024-11-12 18:20:23', '2024-11-12 18:20:23'),
(36, 4, 18, 'UJIKOM', 'images/z8SgGLz7xtXVJyc0smjg8KkO2TFNnWDoX1WeLuam.jpg', 'jjj', '2024-11-13 23:37:34', '2024-11-13 23:37:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `information`
--

CREATE TABLE `information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `information`
--

INSERT INTO `information` (`id`, `user_id`, `title`, `description`, `date`, `created_at`, `updated_at`, `picture`) VALUES
(13, 4, 'Informasi 1', 'nothing', '2024-11-05', '2024-11-08 10:16:01', '2024-11-24 04:38:10', 'pictures/5yXKA2nxVw3n0Pv8udEeaedyvrXmxQb6BjwtBKXt.jpg'),
(15, 4, 'informasi 2', 'ingfo', '2024-11-16', '2024-11-10 18:52:46', '2024-11-24 04:39:23', 'pictures/DgG3Yl1bKDyCAdgJUXQIBcEDBpQT88gbICL3WrTQ.jpg'),
(16, 4, 'informasi 2', 'info', '2024-11-08', '2024-11-10 18:56:23', '2024-11-24 04:40:14', 'pictures/K7LwrL9RJghQurcTj6Bi6beBaw9xEuTfCQ249uNz.jpg'),
(18, 4, 'informasi', 'info', '2024-11-13', '2024-11-12 00:38:06', '2024-11-24 04:41:56', 'pictures/4iEQ0z2a0UtI4ravTBLi8DzgxRyAvO1H0Fayb6Xc.jpg'),
(19, 4, 'informasi', 'info', '2024-11-14', '2024-11-12 00:39:09', '2024-11-24 04:43:23', 'pictures/SH5AP4ha8Yq9hS72znP4dnszOf5TZu00dop9YTEU.jpg'),
(20, 4, 'infomrasi 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit.\r\n\r\nUt velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit', '2024-11-06', '2024-11-12 01:02:04', '2024-11-24 04:44:34', 'pictures/OrW210z5byZtKIaqNX0Pp7HOHT64bxbwakofwCFa.jpg'),
(21, 4, 'informasi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit. Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit', '2023-11-08', '2024-11-12 21:17:40', '2024-11-24 04:45:13', 'pictures/0QxQrwjsykMv71Ub7dnQ4JV5ldPG9A7J9kxAzCle.jpg'),
(22, 4, 'informasi 5', 'info', '2024-11-14', '2024-11-13 23:18:59', '2024-11-24 04:45:59', 'pictures/15IVhqFdmbFHq0yv4fG3PWBQHuVbyXu96j5wHbEk.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_01_040851_create_personal_access_tokens_table', 1),
(5, '2024_10_01_043427_create_information_table', 2),
(6, '2024_10_01_142159_create_agendas_table', 3),
(7, '2024_10_02_002620_create_agendas_table', 4),
(8, '2024_10_02_043622_create_albums_table', 5),
(9, '2024_10_02_043732_create_fotos_table', 6),
(10, '2024_10_03_023607_create_fotos_table', 7),
(11, '2024_10_03_023756_create_albums_table', 8),
(12, '2024_10_02_042610_create_albums_table', 9),
(13, '2024_10_03_033112_creste_fotos_table', 10),
(14, '2024_10_03_044018_create_galleries_table', 11),
(15, '2024_10_03_055105_create_photos_table', 12),
(16, '2024_10_03_061456_add_user_id_to_galleries_table', 13),
(17, '2024_10_03_132817_add_user_id_to_photos_table', 14),
(19, '2024_10_05_130158_update_foreign_key_on_images_table', 16),
(20, '2024_10_07_135503_create_posts_table', 16),
(21, '2024_10_10_010246_create_posts_table', 17),
(22, '2024_10_12_035103_create_pictures_table', 18),
(25, '2024_10_04_065501_create_images_table', 19),
(26, '2024_11_08_040803_create_cathegories_table', 20),
(27, '2024_11_08_043245_add_cathegories_id_to_galleries_table', 21),
(28, '2024_11_08_053431_add_cathegories_id_to_galleries_table', 21),
(29, '2024_11_08_054755_add_image_to_information_table', 22),
(30, '2024_11_08_070730_add_user_id_to_cathegories_table', 23);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'd2dfaf44ca8e33cb4b6f0f886f7f91246d7500479e1015b673382fcb01896c07', '[\"*\"]', NULL, NULL, '2024-09-30 23:31:10', '2024-09-30 23:31:10'),
(3, 'App\\Models\\User', 1, 'auth_token', '1422cebe64adc6465760a19dc2bf2262fe9abc73da821b362153f405b2c0a194', '[\"*\"]', '2024-10-01 07:56:43', NULL, '2024-10-01 05:27:35', '2024-10-01 07:56:43'),
(6, 'App\\Models\\User', 2, 'auth_token', 'e32c9e4d4778a766d9e865437d4c3f2d92c858726ef98588c556830f39ad144c', '[\"*\"]', NULL, NULL, '2024-10-01 18:23:14', '2024-10-01 18:23:14'),
(7, 'App\\Models\\User', 2, 'auth_token', 'e9fd68a99848ce22c92ac97c5b602b8d8b5165600070c0f274bec8f826a751b1', '[\"*\"]', '2024-11-08 08:31:51', NULL, '2024-10-01 18:26:05', '2024-11-08 08:31:51'),
(8, 'App\\Models\\User', 3, 'auth_token', '425ee6001b7f0ee0f25a00014c4caa78b02363eaf8211e61ac55bf977819439d', '[\"*\"]', NULL, NULL, '2024-10-13 22:33:24', '2024-10-13 22:33:24'),
(9, 'App\\Models\\User', 3, 'auth_token', 'ab6921720d646b0b21f5147f316f1ca91bf5ac23de77e29e6a84dbc05252cc23', '[\"*\"]', NULL, NULL, '2024-10-13 22:34:07', '2024-10-13 22:34:07'),
(10, 'App\\Models\\User', 4, 'auth_token', '75deeec7f5daf082ed586fdfdf6d4e5652449a46130f7ac941b427ba2518deed', '[\"*\"]', NULL, NULL, '2024-10-22 07:49:26', '2024-10-22 07:49:26'),
(12, 'App\\Models\\User', 4, 'auth_token', 'f59e806c73d472fea6b3cd82bbfddbcb0f3ec03706e459bc7b8d6c301f7919e9', '[\"*\"]', NULL, NULL, '2024-10-23 08:00:51', '2024-10-23 08:00:51'),
(13, 'App\\Models\\User', 4, 'auth_token', '98e9edca0745d445b08f824927d76c5048141605ac6c48308660e14cba3686fc', '[\"*\"]', NULL, NULL, '2024-10-23 08:01:36', '2024-10-23 08:01:36'),
(14, 'App\\Models\\User', 4, 'auth_token', '12d9e7f1d5cca65c064e853bdd6584bdd5b8b848b3904af9ad7453e6013bc879', '[\"*\"]', NULL, NULL, '2024-10-23 08:06:40', '2024-10-23 08:06:40'),
(15, 'App\\Models\\User', 4, 'auth_token', '63a16a993cb9cb5d88dcbe18509123ccd4460dbb8d9333cb18fd4b6658de0317', '[\"*\"]', NULL, NULL, '2024-10-23 08:20:56', '2024-10-23 08:20:56'),
(16, 'App\\Models\\User', 4, 'auth_token', '50708396059e4e8273d17999ec4ee20432ec6aeb56d0bbbaacff5aad4e2fb887', '[\"*\"]', NULL, NULL, '2024-10-23 09:12:45', '2024-10-23 09:12:45'),
(17, 'App\\Models\\User', 4, 'auth_token', '6b03771aa28f5159657e60e4489664dfa34ad967d45951b95b48d91abc5ddf59', '[\"*\"]', NULL, NULL, '2024-10-23 09:13:34', '2024-10-23 09:13:34'),
(18, 'App\\Models\\User', 4, 'auth_token', '1c9520ae53dfe62bd4b0e7da6b4dea95ed5175d63e672159e2ba5aa2c6a58903', '[\"*\"]', NULL, NULL, '2024-10-23 21:04:05', '2024-10-23 21:04:05'),
(19, 'App\\Models\\User', 4, 'auth_token', '1d09fa07fb8d2ba1dfff1af9ed5a2fb9ea0747478153f93b41732a4772d176da', '[\"*\"]', NULL, NULL, '2024-10-24 06:19:08', '2024-10-24 06:19:08'),
(20, 'App\\Models\\User', 4, 'auth_token', '7cd4490c3417c54723729f47529da8b2d3c790408ecdd58c22b42d4d51d30893', '[\"*\"]', NULL, NULL, '2024-10-24 06:31:06', '2024-10-24 06:31:06'),
(21, 'App\\Models\\User', 4, 'auth_token', '31e0c43be31354579a25c06d86fcbee512897a32d5ec9c4d243c12ae75bb20df', '[\"*\"]', NULL, NULL, '2024-10-24 07:20:18', '2024-10-24 07:20:18'),
(22, 'App\\Models\\User', 4, 'auth_token', 'f947f023820c855899ebf7a1c896fc505da9a7b89087db326a3536c3df195f6f', '[\"*\"]', NULL, NULL, '2024-10-26 04:59:33', '2024-10-26 04:59:33'),
(23, 'App\\Models\\User', 4, 'auth_token', 'cd78cb30ebdfce13f63ed50e7b58d386c523d0273525307ddb073ccd618ec42c', '[\"*\"]', NULL, NULL, '2024-10-27 19:19:30', '2024-10-27 19:19:30'),
(24, 'App\\Models\\User', 4, 'auth_token', 'cadbd720eaa80edff8ae263ca22415d284642560aff1dd9d61a85fb8e2b1c56d', '[\"*\"]', NULL, NULL, '2024-10-27 23:28:39', '2024-10-27 23:28:39'),
(25, 'App\\Models\\User', 4, 'auth_token', '41966f1ed4cde904b2776b5f773a3dd786d1f45b53a1ff16cefe54a260ff61a4', '[\"*\"]', NULL, NULL, '2024-10-27 23:37:31', '2024-10-27 23:37:31'),
(26, 'App\\Models\\User', 4, 'auth_token', '5f68e0abb2cc6766f51166c7c44963c9e94abfed2b2c8e22258ab71f48bde493', '[\"*\"]', NULL, NULL, '2024-10-28 17:24:26', '2024-10-28 17:24:26'),
(27, 'App\\Models\\User', 4, 'auth_token', 'a1db851a0da04813259e21cb22fff238368bb6099620a33685cc0da3af4cf9d6', '[\"*\"]', '2024-10-29 19:49:45', NULL, '2024-10-28 20:08:09', '2024-10-29 19:49:45'),
(28, 'App\\Models\\User', 4, 'auth_token', '8a62c4ae03be55a6d18d16ccec2f638fad7de1eaf5633b0e4c52f2b718e4f36c', '[\"*\"]', NULL, NULL, '2024-10-28 20:10:32', '2024-10-28 20:10:32'),
(29, 'App\\Models\\User', 4, 'auth_token', '30d0618c8b6e52c213cb67b41887b6ebda580abe3c44f75ec20d80ce5b1c341e', '[\"*\"]', NULL, NULL, '2024-10-28 20:55:40', '2024-10-28 20:55:40'),
(30, 'App\\Models\\User', 4, 'auth_token', '35b02981ec475e51efedcc8d127fe3f432fa210ad293222e1da08737261d82a9', '[\"*\"]', NULL, NULL, '2024-10-28 21:40:08', '2024-10-28 21:40:08'),
(31, 'App\\Models\\User', 4, 'auth_token', '37f2ed9d5221ed71aa06fae70e5b085416cbd02eab5cdefe578ec9bffeceef45', '[\"*\"]', NULL, NULL, '2024-10-28 23:12:46', '2024-10-28 23:12:46'),
(32, 'App\\Models\\User', 4, 'auth_token', 'e38e4e1b321a8d09c98488fc2586666e5f67cfbb99a6db12cc3f67b1feb3e54d', '[\"*\"]', NULL, NULL, '2024-10-28 23:13:12', '2024-10-28 23:13:12'),
(33, 'App\\Models\\User', 4, 'auth_token', '321372f4f0a692f5116ee4ea074403c4d22c57eb4741fad978cbb316e3f9670b', '[\"*\"]', NULL, NULL, '2024-10-28 23:19:30', '2024-10-28 23:19:30'),
(34, 'App\\Models\\User', 4, 'auth_token', '586960227eaca94d528c43dc91e47ff626dacb103091fef64e9c23599b69708d', '[\"*\"]', NULL, NULL, '2024-10-28 23:19:44', '2024-10-28 23:19:44'),
(35, 'App\\Models\\User', 4, 'auth_token', 'c892e063dd1192bc790d15548d726d9ed9123a06c728ebb8c6d3c634dd0eecb0', '[\"*\"]', '2024-11-10 05:52:15', NULL, '2024-10-28 23:20:19', '2024-11-10 05:52:15'),
(36, 'App\\Models\\User', 4, 'auth_token', '7b182b4f3fbb969f11f2eaabbcd9de68a4da36942a96aa635dd0180cf224c1cf', '[\"*\"]', '2024-11-10 05:52:30', NULL, '2024-11-10 05:47:02', '2024-11-10 05:52:30'),
(37, 'App\\Models\\User', 4, 'auth_token', '4a185b5f50c1a883a00199558302a300224b3f0b8aa3c07217a864aeb8bcd079', '[\"*\"]', '2024-11-10 06:42:47', NULL, '2024-11-10 06:42:44', '2024-11-10 06:42:47'),
(38, 'App\\Models\\User', 4, 'auth_token', '9d1f2ccdda0f9a67f8d5f2d1541c2da56c41af2872fe74de1aacec977a48d93e', '[\"*\"]', '2024-11-11 06:48:45', NULL, '2024-11-10 17:39:05', '2024-11-11 06:48:45'),
(39, 'App\\Models\\User', 4, 'auth_token', '3ac43adb02ad65811b2881583e2c75bc810dda320acf1fd56ea71045f52750b7', '[\"*\"]', '2024-11-12 20:50:14', NULL, '2024-11-11 06:48:47', '2024-11-12 20:50:14'),
(40, 'App\\Models\\User', 4, 'auth_token', '1eb734a51fa1b8a5d591ebd1de3d8b234611bcd7e3752229c45934c7d9148b32', '[\"*\"]', '2024-11-12 21:17:40', NULL, '2024-11-12 20:51:24', '2024-11-12 21:17:40'),
(41, 'App\\Models\\User', 4, 'auth_token', '422de723e1b6eb37b1223fafd1f757892068cc1253f2122bc3025fab57ac6a79', '[\"*\"]', '2024-11-13 00:48:56', NULL, '2024-11-12 20:58:59', '2024-11-13 00:48:56'),
(42, 'App\\Models\\User', 4, 'auth_token', '1f45845646da2c7d5fd552824cad9fe1ed50b211700bb38f3c0d81bfef80f68c', '[\"*\"]', '2024-11-13 23:54:12', NULL, '2024-11-13 21:30:08', '2024-11-13 23:54:12'),
(44, 'App\\Models\\User', 4, 'auth_token', '8818b0720ec846c17f10e7594a8d9cb6137f78130a97fe59cde561ff90ab4b76', '[\"*\"]', NULL, NULL, '2024-11-23 05:28:26', '2024-11-23 05:28:26'),
(45, 'App\\Models\\User', 4, 'auth_token', 'b396811b73d3a1930c804664b79a60acd98322429f3be8da08d563579e15ed3b', '[\"*\"]', NULL, NULL, '2024-11-23 08:56:04', '2024-11-23 08:56:04'),
(46, 'App\\Models\\User', 4, 'auth_token', '675891159d819a8f0fd96d31d63c9987fba17d85f5f1f57f60de2b07bb91613b', '[\"*\"]', '2024-11-24 09:18:56', NULL, '2024-11-23 09:10:04', '2024-11-24 09:18:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('06nyRCPA4o6P2u9wPcAuoXlZ7j2K7zBdQmsufhMB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVVRRDZXcU0yekxlMkxJUlhuak5Icm1CSVhlekhPT3dndEJHNXdIOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732378204),
('0RMBOMGzF844mEiafsLxYKCMfXKhswimju1vnGRY', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2dYRXdpemFRNlR6d0J3MUlkS0E2ZTNuY1VCSThLZk5LZjNNRno1ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731079842),
('36yQ6gxRJOHjrJyJJcfQdHp7BVvIplyrr8kFLwvg', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFhmc0xTNHRmYXZQbkpKbFJjeGFhdm93czBJbUg4M0ZIMUpIZkRIWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731242819),
('955AKcdI6YkgbAViM5N80VRpDI6kZ0J0ul7aHa7Y', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHRTSTluVkgybXljQWhkaXRkOXBWemVXQ0U2d2xiOUdnc0dZRXU2UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731246151),
('9b0IVeDqvYdVJd8w4ZaXtcd7ebMES9naOaaH57Vo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTMzeXg4dFk3aTFPZmZSRTZvZ05NbEpXRVJPQXoyMXdxdkJOYW01UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732452860),
('bEiup8sjqG55v7VDm5RsfZEoYV2PNaAQUNHS5wfG', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY05aSGpITTFMazJZZWxhZWRXZnBlUHkwdExLY2RRYjNQc0pBV1pycyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731077581),
('ctOvtIIswVSkty4Cl9nLLylkDD60PT8JAlVltcWP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTRpeEhVT2N3NXJNbVR5ZlZWaE1FN04yM1JMeW9oZ3lHY09kR2ZleiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731332926),
('Cx3ozyBBhknasN3VuanucQFaWn5HyzWSaLVMfw5c', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0xPSmp1ZEg1NVJWbTlRZXQ3c0I1aDB3UmhITlA4UEIwTFFzQ2tMViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731074596),
('i3au34WSLygzpwrXOhW27nkh0jAvNwAhhbNJ74SE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2gxdWx2R2k0VnN6MDFjM1ZtYXJGT1pxamhHeGcxVm5UVGNYYXBYeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731469882),
('I9k8Ltzrx9WGBHMZLmUgROkBkCpBCJyF03ShhMgB', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWNKd0tPckN5NGtsOEZoUlVpYlNlYUhOYlJ6eWVabk1VUm55VFhyViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731074928),
('iLgs9M1L2vDA4H6Ivo3nICOY7lljaRX6akiWHfbm', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3d2NVpyd1NGTk9XdXBLcDl0OFIwTkpGM0JXT1lVQmRJODlWcWh0NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731558605),
('izq2DQKxmFufd4hx4nHsl0jZhRh6I4wyXrWZvcJH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEZjNTc3dVVGSEVKZ2VRRXZiTEN3UVNKYlRXNzVvY0E0OWZjamVuRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731246163),
('jnII4lug2PCxAm2bXTkazC5elTJ6qizt6lL2yp6u', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUJPR3N2TGhMSmZjSHNsU3NpWVdyNFFZd3NPRG5MNUt5TERGNHNKZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731285545),
('mFBgRf15ykcXGDEksbiTVOoxqIL62zte2vrm2On9', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkJ6ZDhPVHZzbmdPUU5hZFYwMldlbmFQMzJyTE1XVThjcHZvVUlxeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731075202),
('SngDblkJ4ojyZ6McwSc0qnhw1q3KKfAMB1fQPOK4', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWJqZW1kRENwY1B4MGdURGRONFhtQTVQR1Z0QnoySDU0aXRjWHhFViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731075334),
('YTyhc84qiIR2MvbwKKmkGkt27cIp1jPTUJ2rlRty', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkdEVmNUNXpvaXBBYkpQUTZiUHYxUDI1YzVXdmVBVHFXaTBWbTRmMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1731470338),
('ZSGQCFJ3jRKTZ6UFqd1aepETRkvQqZQfInmRATa9', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUxNSUZ5NGhSQkZCMWhjanFGVkx4YW9iczRGbU1jT2M2cUNVclFqYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731076362);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john@example.com', NULL, '$2y$12$YgXEKkvFdLBSG4EqVQ.INu5cMCBofSt4TMTN3/vJAKpJfJ3vtwUTC', NULL, '2024-09-30 23:31:10', '2024-09-30 23:31:10'),
(2, 'Fathir Sagtiana', 'sagtiana@example.com', NULL, '$2y$12$dBAEe2qMmBJWv7j5T7Vu/eTTmBTIPqvEQQtxUgYqE53jLdROyAWdO', NULL, '2024-10-01 18:23:14', '2024-10-01 18:23:14'),
(3, 'Luka Megurine', 'sag@example.com', NULL, '$2y$12$TZQzNmPvZ6Z/DnZwuyL6cuOL/YHlq9Bz73/3gU.QRMPNM4HA4F8cy', NULL, '2024-10-13 22:33:23', '2024-10-13 22:33:23'),
(4, 'Mas Admin', 'admin@example.com', NULL, '$2y$12$jOpV/zoA0hE.9Hyv.DDvT.Ynmg.nRQirfsS1DQZa9/fv33DlApnS6', NULL, '2024-10-22 07:49:26', '2024-10-22 07:49:26'),
(5, 'admin', 'admin@email.com', NULL, '$2y$12$6SVFjIBWLOuCQoMWtK5eVOkBHOo7fT6GgTkKldKo3/s.JBtVJz6k6', NULL, '2024-11-23 05:00:52', '2024-11-23 05:00:52');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agendas_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cathegories`
--
ALTER TABLE `cathegories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cathegories_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_user_id_foreign` (`user_id`),
  ADD KEY `galleries_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_user_id_foreign` (`user_id`),
  ADD KEY `images_gallery_id_foreign` (`gallery_id`);

--
-- Indeks untuk tabel `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `information_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `agendas`
--
ALTER TABLE `agendas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `cathegories`
--
ALTER TABLE `cathegories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `information`
--
ALTER TABLE `information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `agendas`
--
ALTER TABLE `agendas`
  ADD CONSTRAINT `agendas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `cathegories`
--
ALTER TABLE `cathegories`
  ADD CONSTRAINT `cathegories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `cathegories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `galleries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `information`
--
ALTER TABLE `information`
  ADD CONSTRAINT `information_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
