-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 06 Des 2021 pada 11.13
-- Versi server: 8.0.19
-- Versi PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_herca`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_city`
--

CREATE TABLE `tb_city` (
  `id` int NOT NULL,
  `province_id` int NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `tb_city`
--

INSERT INTO `tb_city` (`id`, `province_id`, `Name`) VALUES
(1, 1, 'Lebak'),
(2, 3, 'Jakarta'),
(3, 3, 'Garut'),
(4, 4, 'Kalianda'),
(5, 1, 'Serang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id` int NOT NULL,
  `namacustomer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `provinsi_id` int NOT NULL,
  `city_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `tb_customer`
--

INSERT INTO `tb_customer` (`id`, `namacustomer`, `provinsi_id`, `city_id`) VALUES
(1, 'Aldhi', 1, 1),
(2, 'Jhon', 3, 3),
(3, 'Eka', 3, 2),
(4, 'Ari', 1, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_province`
--

CREATE TABLE `tb_province` (
  `id` int NOT NULL,
  `name_province` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `tb_province`
--

INSERT INTO `tb_province` (`id`, `name_province`) VALUES
(1, 'Banten'),
(3, 'Jawa Barat'),
(4, 'Lampung');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_city`
--
ALTER TABLE `tb_city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province_id` (`province_id`);

--
-- Indeks untuk tabel `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provinsi_id` (`provinsi_id`),
  ADD KEY `provinsi_id_2` (`provinsi_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indeks untuk tabel `tb_province`
--
ALTER TABLE `tb_province`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_city`
--
ALTER TABLE `tb_city`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_province`
--
ALTER TABLE `tb_province`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_city`
--
ALTER TABLE `tb_city`
  ADD CONSTRAINT `tb_city_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `tb_province` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD CONSTRAINT `tb_customer_ibfk_1` FOREIGN KEY (`provinsi_id`) REFERENCES `tb_province` (`id`),
  ADD CONSTRAINT `tb_customer_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `tb_city` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
