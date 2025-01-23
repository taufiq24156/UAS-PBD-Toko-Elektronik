-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2025 at 07:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_elektronik`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE `detail` (
  `id_detail` int(11) NOT NULL,
  `id_penjualan` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail`
--

INSERT INTO `detail` (`id_detail`, `id_penjualan`, `id_produk`, `jumlah`, `subtotal`) VALUES
(1, 1, 1, 1, 4000000.00),
(2, 2, 3, 2, 6000000.00),
(3, 3, 5, 1, 2500000.00),
(4, 4, 4, 1, 2500000.00),
(5, 5, 6, 3, 3000000.00),
(6, 6, 8, 1, 1300000.00),
(7, 7, 7, 1, 3000000.00),
(8, 8, 2, 2, 9000000.00),
(9, 9, 10, 1, 2500000.00),
(10, 10, 9, 1, 6000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `pemasok`
--

CREATE TABLE `pemasok` (
  `id_pemasok` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jumlah_pasokan` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemasok`
--

INSERT INTO `pemasok` (`id_pemasok`, `nama`, `jumlah_pasokan`, `tanggal`) VALUES
(1, 'Pemasok A', 20, '2025-01-01'),
(2, 'Pemasok B', 15, '2025-01-06'),
(4, 'Pemasok D', 25, '2025-01-09'),
(5, 'Pemasok E', 40, '2025-01-11'),
(6, 'Pemasok F', 50, '2025-01-13'),
(7, 'Pemasok G', 35, '2025-01-14'),
(8, 'Pemasok H', 45, '2025-01-21'),
(9, 'Pemasok I', 60, '2025-01-22'),
(10, 'Pemasok J', 55, '2025-01-25');

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `id_pembeli` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `no_telepon` bigint(16) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`id_pembeli`, `nama`, `no_telepon`, `alamat`) VALUES
(1, 'Akbar Sudajar', 628398433453, 'Jl. Lektol Subardi No.10, Sleman'),
(2, 'Mulyanto', 628997856785, 'Jl. Anyer Panarukan No.15, Bandung'),
(3, 'Citra Lestari', 628222222222, 'Jl. Patimura No.25, Surabaya'),
(4, 'Hafid Muhtarom', 6282234241345, 'Jl. Dersono No.3, Yogyakarta'),
(5, 'Eka Satrio', 628135679254, 'Jl. Godean No.30, Wates'),
(6, 'Fajar Pramudita', 628163456793, 'Jl. Gito Gati No.7, Sleman'),
(7, 'Gilang Oktavian', 628246278543, 'Jl. Merdeka No.25, Semarang'),
(8, 'Farid Syahputra', 628123497685, 'Jl. Simanjuntak  No.18, Medan'),
(9, 'Sumanto Bekti', 62812346782, 'Jl. Jimbaran No.12, Bali'),
(10, 'Jokowi Dodo', 6281352749768, 'Jl. Kemayoran No.8, Jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `tanggal_penjualan` date DEFAULT NULL,
  `metode_transaksi` varchar(100) DEFAULT NULL CHECK (`metode_transaksi` = 'online' or `metode_transaksi` = 'offline')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `tanggal_penjualan`, `metode_transaksi`) VALUES
(1, '2025-01-01', 'online'),
(2, '2025-01-06', 'offline'),
(3, '2025-01-07', 'online'),
(4, '2025-01-09', 'offline'),
(5, '2025-01-11', 'online'),
(6, '2025-01-13', 'offline'),
(7, '2025-01-14', 'online'),
(8, '2025-01-21', 'offline'),
(9, '2025-01-22', 'offline'),
(10, '2025-01-25', 'online');

-- --------------------------------------------------------

--
-- Table structure for table `penyimpanan`
--

CREATE TABLE `penyimpanan` (
  `id_penyimpanan` int(11) NOT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `id_pemasok` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyimpanan`
--

INSERT INTO `penyimpanan` (`id_penyimpanan`, `id_produk`, `id_pemasok`, `stok`) VALUES
(1, 1, 1, 20),
(2, 2, 2, 15),
(4, 4, 4, 25),
(5, 5, 5, 40),
(6, 6, 6, 50),
(7, 7, 7, 35),
(8, 8, 8, 45),
(9, 9, 9, 60),
(10, 10, 10, 55);

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_pembeli` int(11) DEFAULT NULL,
  `id_penjualan` int(11) DEFAULT NULL,
  `tanggal_penjualan` date DEFAULT NULL,
  `total_harga` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `id_pembeli`, `id_penjualan`, `tanggal_penjualan`, `total_harga`) VALUES
(1, 1, 1, '2025-01-01', 4000000.00),
(2, 2, 2, '2025-01-06', 3000000.00),
(3, 3, 3, '2025-01-07', 2500000.00),
(4, 4, 4, '2025-01-09', 2500000.00),
(5, 5, 5, '2025-01-11', 1000000.00),
(6, 6, 6, '2025-01-13', 1300000.00),
(7, 7, 7, '2025-01-14', 3000000.00),
(8, 8, 8, '2025-01-21', 4500000.00),
(9, 9, 9, '2025-01-22', 2500000.00),
(10, 10, 10, '2025-01-25', 6000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `kategori` varchar(25) DEFAULT NULL,
  `harga` decimal(15,2) DEFAULT NULL,
  `stok` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama`, `kategori`, `harga`, `stok`) VALUES
(1, 'ASUS VivoBook A416KA-FHD522', 'Elektronik', 4000000.00, -1),
(2, 'SAMSUNG 43AU7002', 'Elektronik', 4500000.00, 0),
(3, 'Monitor Acer ED270U', 'Elektronik', 3000000.00, 0),
(4, 'Viewsonic VX2779-HD-PRO', 'Elektronik', 2500000.00, 0),
(5, 'Titan Army 27G1', 'Elektronik', 2500000.00, 0),
(6, 'Realme Smart TV 32 Inci', 'Elektronik', 1000000.00, 0),
(7, 'SPC NoteBook X1 Note', 'Elektronik', 3000000.00, 0),
(8, 'Samsung T4501 32 Inci', 'Elektronik', 1300000.00, 0),
(9, 'ASUS VivoBook 14 M415DAO-FHD324', 'Elektronik', 6000000.00, 0),
(10, 'Axioo HYPE 10', 'Elektronik', 2500000.00, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_penjualan` (`id_penjualan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`id_pemasok`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indexes for table `penyimpanan`
--
ALTER TABLE `penyimpanan`
  ADD PRIMARY KEY (`id_penyimpanan`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `penyimpanan_ibfk_2` (`id_pemasok`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `id_pembeli` (`id_pembeli`),
  ADD KEY `id_penjualan` (`id_penjualan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail`
--
ALTER TABLE `detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pemasok`
--
ALTER TABLE `pemasok`
  MODIFY `id_pemasok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id_pembeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `penyimpanan`
--
ALTER TABLE `penyimpanan`
  MODIFY `id_penyimpanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `detail_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`),
  ADD CONSTRAINT `detail_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `penyimpanan`
--
ALTER TABLE `penyimpanan`
  ADD CONSTRAINT `penyimpanan_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `penyimpanan_ibfk_2` FOREIGN KEY (`id_pemasok`) REFERENCES `pemasok` (`id_pemasok`) ON DELETE CASCADE;

--
-- Constraints for table `pesan`
--
ALTER TABLE `pesan`
  ADD CONSTRAINT `pesan_ibfk_1` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id_pembeli`),
  ADD CONSTRAINT `pesan_ibfk_2` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
