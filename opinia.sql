-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Des 2022 pada 00.25
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opinia`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2022-12-16-062600', 'App\\Database\\Migrations\\Users', 'default', 'App', 1671172115, 1),
(2, '2022-12-16-201901', 'App\\Database\\Migrations\\PostType', 'default', 'App', 1671222137, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `postingans`
--

CREATE TABLE `postingans` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `post_type` varchar(128) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `postingans`
--

INSERT INTO `postingans` (`id`, `user_id`, `title`, `description`, `post_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 1, 'coba-coba', 'coba doang', 'Opini', '2022-12-17 04:11:12', '2022-12-17 04:11:12', NULL),
(3, 1, 'coba-coba', 'coba doang yyy', 'Opini', '2022-12-17 04:55:55', '2022-12-17 04:55:55', NULL),
(4, 1, 'coba-coba', 'coba doang yyy', 'Opini', '2022-12-17 05:09:13', '2022-12-17 05:09:13', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_type`
--

CREATE TABLE `post_type` (
  `id` int(5) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `post_type`
--

INSERT INTO `post_type` (`id`, `jenis`, `type`) VALUES
(1, 'Opini', 'Artikel'),
(2, 'Cerpen', 'Artikel'),
(3, 'Idea', 'Idea'),
(4, 'Esai', 'Artikel');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone` int(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone`, `email`, `password`) VALUES
(1, '', 0, 'akmaldidicky@yahoo.com', '$2y$10$GcDEzGRARMaaflgD805VX.VDscNu219vHwyVctgqiDR3bLwkJX2Pq');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `postingans`
--
ALTER TABLE `postingans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `post_type`
--
ALTER TABLE `post_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `postingans`
--
ALTER TABLE `postingans`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `post_type`
--
ALTER TABLE `post_type`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
