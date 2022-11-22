-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2022 at 08:30 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpos`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `tgl_dibuat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `nama_kategori`, `tgl_dibuat`) VALUES
(1, 'Susu', '2022-11-10 03:24:52'),
(3, 'Sabun', '2022-11-10 03:23:32'),
(5, 'Shampo', '2022-11-10 03:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `idcart` int(11) NOT NULL,
  `no_nota` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `idlaporan` int(11) NOT NULL,
  `no_nota` varchar(50) NOT NULL,
  `idpelanggan` int(11) NOT NULL,
  `catatan` text NOT NULL,
  `totalbeli` int(11) NOT NULL,
  `pembayaran` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `tgl_sub` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`idlaporan`, `no_nota`, `idpelanggan`, `catatan`, `totalbeli`, `pembayaran`, `kembalian`, `tgl_sub`) VALUES
(2, 'AD1611221948001', 1, '', 90000, 100000, 10000, '2022-11-16 12:48:43');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `nama_toko` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `nama_toko`, `username`, `password`, `alamat`, `telepon`) VALUES
(1, 'minimarket place 1', 'suci', '$2y$10$hlkhSQWwVpq/CiDfLmw3Le8csUetDXciqQyrPlNaPfs5TsBhsf6M6', 'jalan haji anif', '081236789003'),
(3, 'Toserba', 'tasya', '$2y$10$56qBoR3tjnMHhLiAUuvEy.w0ONAuaaQ7Iu9SwaZ87qM.JjkAHNL3W', 'jalan mawar', '234354677'),
(4, 'ConvenienceStrore', 'wahyu', '$2y$10$KXXCX53zc4VbnRVWWhc8gua0CYAas0n.i7uILduLSnsdHmZ/hra0m', 'sdgdffdh', '4575687'),
(5, 'minimarket instan', 'rafiqi12', '$2y$10$H1/ts2uno2DkTAuSe3CSWO/opdTXHlAS7p7xvAZRH3K1L24Pnl5bO', 'jalan mawar', '45565676');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idpelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `telepon_pelanggan` varchar(15) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`idpelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'sarah', '3254365476', 'jalan mawar'),
(2, 'wahyu', '3454776', 'jalan sisingamaraja');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(150) NOT NULL,
  `harga_modal` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `kode_produk`, `nama_produk`, `harga_modal`, `harga_jual`, `stock`, `tgl_input`) VALUES
(4, 1, 'ASU12344E', 'DANCOW VANILLA', 40000, 45000, 51, '2022-11-16 12:48:13'),
(6, 3, 'BRG124', 'Detol', 10000, 15000, 48, '2022-11-16 12:48:29');

-- --------------------------------------------------------

--
-- Table structure for table `tb_nota`
--

CREATE TABLE `tb_nota` (
  `idnota` int(11) NOT NULL,
  `no_nota` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_nota`
--

INSERT INTO `tb_nota` (`idnota`, `no_nota`, `idproduk`, `quantity`) VALUES
(1, 'AD1011221026001', 4, 1),
(2, 'AD1011221026001', 6, 2),
(3, 'AD1611221948001', 4, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`idcart`),
  ADD KEY `idproduk` (`idproduk`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`idlaporan`),
  ADD KEY `idpelanggan` (`idpelanggan`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idpelanggan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `idkategori` (`idkategori`);

--
-- Indexes for table `tb_nota`
--
ALTER TABLE `tb_nota`
  ADD PRIMARY KEY (`idnota`),
  ADD KEY `idproduk` (`idproduk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `idlaporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idpelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_nota`
--
ALTER TABLE `tb_nota`
  MODIFY `idnota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_nota`
--
ALTER TABLE `tb_nota`
  ADD CONSTRAINT `tb_nota_ibfk_1` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
