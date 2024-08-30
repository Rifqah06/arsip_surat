-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2024 at 03:22 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_arsipsurat`
--

-- --------------------------------------------------------

--
-- Table structure for table `file_surat`
--

CREATE TABLE `file_surat` (
  `id_file` int(11) NOT NULL,
  `id_sm` int(11) DEFAULT NULL,
  `nama_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `file_surat`
--

INSERT INTO `file_surat` (`id_file`, `id_sm`, `nama_file`) VALUES
(45, 49, 'Kwitansi UKT_Rifqah azzah.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `file_surat_k`
--

CREATE TABLE `file_surat_k` (
  `id_file` int(11) NOT NULL,
  `id_sk` int(11) DEFAULT NULL,
  `nama_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `file_surat_k`
--

INSERT INTO `file_surat_k` (`id_file`, `id_sk`, `nama_file`) VALUES
(27, 39, 'Frs_Rifqah azzah.pdf'),
(28, 40, 'Transkip Nilai Akademik_Rifqah azzah.pdf'),
(29, 41, 'KTP rifqah.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tb_arsip_surat`
--

CREATE TABLE `tb_arsip_surat` (
  `id_arsip` int(11) NOT NULL,
  `id_sm` int(11) DEFAULT NULL,
  `id_sk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_arsip_surat`
--

INSERT INTO `tb_arsip_surat` (`id_arsip`, `id_sm`, `id_sk`) VALUES
(77, NULL, 39),
(79, NULL, 40),
(80, NULL, 41),
(91, 49, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_histori`
--

CREATE TABLE `tb_histori` (
  `id_histori` int(11) NOT NULL,
  `id_sm` int(11) DEFAULT NULL,
  `id_sk` int(11) DEFAULT NULL,
  `jenis_surat` enum('Surat Masuk','Surat Keluar') NOT NULL,
  `nomor_surat` varchar(50) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `aksi` enum('Ditambahkan','Diedit','Dihapus') NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_histori`
--

INSERT INTO `tb_histori` (`id_histori`, `id_sm`, `id_sk`, `jenis_surat`, `nomor_surat`, `perihal`, `aksi`, `timestamp`) VALUES
(16, NULL, NULL, 'Surat Masuk', 'SM-0987632', 'Surat izin peminjaman', 'Ditambahkan', '2024-08-19 23:43:22'),
(17, NULL, NULL, 'Surat Masuk', 'SM-0987632', 'Surat izin peminjaman', 'Diedit', '2024-08-19 23:43:58'),
(18, NULL, NULL, 'Surat Masuk', 'SM-0987619138', 'Surat untuk kegiatan Upcara Di Dinas', 'Dihapus', '2024-08-19 23:44:17'),
(19, NULL, NULL, 'Surat Masuk', 'SM-0987632', 'Surat izin peminjaman', 'Dihapus', '2024-08-19 23:44:34'),
(20, NULL, 41, 'Surat Keluar', 'SK-0987687875', 'Surat izin peminjaman', 'Diedit', '2024-08-19 23:54:52'),
(21, NULL, 41, 'Surat Keluar', 'SK-0987687875', 'Surat izin peminjaman', 'Diedit', '2024-08-19 23:55:02'),
(22, 49, NULL, 'Surat Masuk', 'SM-0987634', 'Surat izin peminjaman', 'Ditambahkan', '2024-08-19 23:57:13'),
(23, 49, NULL, 'Surat Masuk', 'SM-0987634', 'Surat izin peminjaman', 'Diedit', '2024-08-20 00:02:40');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pg` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(80) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `izin_akses` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pg`, `username`, `password`, `nama_lengkap`, `jabatan`, `izin_akses`, `foto`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Bakhtiar, S.Kom', 'ADMIN', 'Admin', 'man.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_sk`
--

CREATE TABLE `tb_sk` (
  `id_sk` int(11) NOT NULL,
  `tgl_sk` date DEFAULT NULL,
  `nomor_sk` varchar(100) DEFAULT NULL,
  `penerima` varchar(255) DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `perihal` varchar(255) DEFAULT NULL,
  `arsip_digital` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_sk`
--

INSERT INTO `tb_sk` (`id_sk`, `tgl_sk`, `nomor_sk`, `penerima`, `kategori`, `perihal`, `arsip_digital`, `keterangan`) VALUES
(39, '2024-08-19', 'SM-09876', 'SDN 001 Balikpapan Barat', 'Surat Berita', 'Surat izin peminjaman', 'TU-SMPIT As\'adiyah Manuntung Balikpapan', 'tidak ada'),
(40, '2024-08-19', 'SK-0987687', 'SDN 001 Balikpapan Barat', 'Surat Resmi Pemerintah', 'Surat untuk kegiatan Upcara Di Dinas', 'TU-SMPIT As\'adiyah Manuntung Balikpapan', 'tidak ada'),
(41, '2024-08-20', 'SK-0987687875', 'SDN 001 Balikpapan Barat', 'Surat Izin atau Permohonan', 'Surat izin peminjaman', 'TU-SMPIT As\'adiyah Manuntung Balikpapan', 'tidak ada');

-- --------------------------------------------------------

--
-- Table structure for table `tb_sm`
--

CREATE TABLE `tb_sm` (
  `id_sm` int(11) NOT NULL,
  `tgl_sm` date DEFAULT NULL,
  `nomor_sm` varchar(100) NOT NULL,
  `pengirim` varchar(255) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `arsip_digital` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_sm`
--

INSERT INTO `tb_sm` (`id_sm`, `tgl_sm`, `nomor_sm`, `pengirim`, `kategori`, `perihal`, `arsip_digital`, `keterangan`) VALUES
(49, '2024-08-21', 'SM-0987634', 'SDN 009 Balikpapan', 'Surat Pengaduan', 'Surat izin peminjaman', 'TU-SMPIT As\'adiyah Manuntung Balikpapan', 'Telah diberikan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `file_surat`
--
ALTER TABLE `file_surat`
  ADD PRIMARY KEY (`id_file`),
  ADD KEY `fk_id_sm` (`id_sm`);

--
-- Indexes for table `file_surat_k`
--
ALTER TABLE `file_surat_k`
  ADD PRIMARY KEY (`id_file`),
  ADD KEY `fk_id_sk` (`id_sk`);

--
-- Indexes for table `tb_arsip_surat`
--
ALTER TABLE `tb_arsip_surat`
  ADD PRIMARY KEY (`id_arsip`),
  ADD KEY `fk_id_sm_arsip` (`id_sm`),
  ADD KEY `fk_id_sk_arsip` (`id_sk`);

--
-- Indexes for table `tb_histori`
--
ALTER TABLE `tb_histori`
  ADD PRIMARY KEY (`id_histori`),
  ADD KEY `id_sm` (`id_sm`),
  ADD KEY `id_sk` (`id_sk`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pg`);

--
-- Indexes for table `tb_sk`
--
ALTER TABLE `tb_sk`
  ADD PRIMARY KEY (`id_sk`);

--
-- Indexes for table `tb_sm`
--
ALTER TABLE `tb_sm`
  ADD PRIMARY KEY (`id_sm`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `file_surat`
--
ALTER TABLE `file_surat`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `file_surat_k`
--
ALTER TABLE `file_surat_k`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tb_arsip_surat`
--
ALTER TABLE `tb_arsip_surat`
  MODIFY `id_arsip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `tb_histori`
--
ALTER TABLE `tb_histori`
  MODIFY `id_histori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_sk`
--
ALTER TABLE `tb_sk`
  MODIFY `id_sk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tb_sm`
--
ALTER TABLE `tb_sm`
  MODIFY `id_sm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `file_surat`
--
ALTER TABLE `file_surat`
  ADD CONSTRAINT `fk_id_sm` FOREIGN KEY (`id_sm`) REFERENCES `tb_sm` (`id_sm`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `file_surat_k`
--
ALTER TABLE `file_surat_k`
  ADD CONSTRAINT `fk_id_sk` FOREIGN KEY (`id_sk`) REFERENCES `tb_sk` (`id_sk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_arsip_surat`
--
ALTER TABLE `tb_arsip_surat`
  ADD CONSTRAINT `fk_id_sk_arsip` FOREIGN KEY (`id_sk`) REFERENCES `tb_sk` (`id_sk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_sm_arsip` FOREIGN KEY (`id_sm`) REFERENCES `tb_sm` (`id_sm`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_histori`
--
ALTER TABLE `tb_histori`
  ADD CONSTRAINT `tb_histori_ibfk_1` FOREIGN KEY (`id_sm`) REFERENCES `tb_sm` (`id_sm`) ON DELETE SET NULL,
  ADD CONSTRAINT `tb_histori_ibfk_2` FOREIGN KEY (`id_sk`) REFERENCES `tb_sk` (`id_sk`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
