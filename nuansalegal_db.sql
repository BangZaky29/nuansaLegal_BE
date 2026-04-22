-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2026 at 03:33 PM
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
-- Database: `nuansalegal_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `category` varchar(100) DEFAULT 'General',
  `sub_category` varchar(100) DEFAULT NULL,
  `order_index` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `category`, `sub_category`, `order_index`, `created_at`) VALUES
(46, 'Apa saja persyaratan nama perseroan (PT/CV/Yayasan/Koperasi/Perkumpulan)?', 'Untuk PT, minimal terdiri dari 3 kata (contoh: PT Nuansa Berkah Sejahtera). Untuk CV, minimal 2 kata namun disarankan 3 kata. Untuk Yayasan, minimal 3 atau 4 kata. Untuk Perkumpulan, minimal 3 kata atau lebih. Nama tidak boleh mengandung unsur SARA atau melanggar norma kesusilaan.', 'Legalitas', 'Pendirian Legalitas', 0, '2026-04-22 12:44:15'),
(47, 'Apa syarat pendirian PT Umum (PMDN)?', '1) Minimal 2 orang pengurus (Direktur dan Komisaris). 2) Memiliki KTP dan NPWP aktif. 3) Mengisi formulir pendirian dari PT Nuansa Berkah Sejahtera. Estimasi proses adalah 3-7 hari kerja setelah penandatanganan minuta Akta.', 'Legalitas', 'Pendirian Legalitas', 1, '2026-04-22 12:44:15'),
(48, 'Bagaimana dengan syarat pendirian PT Perorangan?', '1) Hanya memerlukan 1 orang pengurus (Direktur). 2) Memiliki KTP dan NPWP aktif. 3) Mengisi formulir pendirian. Keuntungan: Dapat membuka rekening perusahaan dan membuat Akta Penegasan. Namun, tidak dapat memproses SBUJK (Konstruksi). Estimasi proses hanya 1 hari kerja.', 'Legalitas', 'Pendirian Legalitas', 2, '2026-04-22 12:44:15'),
(49, 'Apa syarat pendirian CV (Persero Komanditer)?', '1) Minimal 2 orang pengurus (Direktur dan Komisaris). 2) Memiliki KTP dan NPWP aktif. 3) Mengisi formulir pendirian. Estimasi proses adalah 3-7 hari kerja setelah penandatanganan minuta Akta.', 'Legalitas', 'Pendirian Legalitas', 3, '2026-04-22 12:44:15'),
(50, 'Apa syarat pendirian PT PMA (Penanaman Modal Asing)?', '1) Minimal 2 orang pengurus. 2) Dokumen identitas (Paspor untuk WNA, KTP & NPWP untuk WNI). 3) Mengisi formulir pendirian. Modal dasar minimal Rp 10,5 Miliar. Kami juga melayani pengurusan KITAS untuk investor asing. Estimasi proses 7-14 hari kerja.', 'Legalitas', 'Pendirian Legalitas', 4, '2026-04-22 12:44:15'),
(51, 'Apa syarat pendirian Yayasan?', '1) Minimal 5 orang pengurus (Pembina, Pengurus, Sekretaris, Bendahara, dan Pengawas). 2) KTP dan NPWP pengurus. 3) Modal dasar minimal Rp 10 Juta. Estimasi proses 7-21 hari kerja, tergantung pada persetujuan nama oleh Kemenkumham.', 'Legalitas', 'Pendirian Legalitas', 5, '2026-04-22 12:44:15'),
(52, 'Apa syarat pendirian Koperasi?', '1) Minimal 9 orang anggota/pengurus. 2) KTP dan NPWP. 3) Mengisi formulir pendirian. Untuk Koperasi Produsen/Konsumen tidak ada modal minimal. Untuk Koperasi Simpan Pinjam (KSP), modal minimal mulai dari Rp 500 Juta (Skala Kota) hingga Rp 5 Miliar (Skala Nasional). Estimasi proses 7-21 hari kerja.', 'Legalitas', 'Pendirian Legalitas', 6, '2026-04-22 12:44:15'),
(53, 'Apa syarat pendirian Perkumpulan?', '1) Minimal 5 orang pengurus. 2) KTP dan NPWP. 3) Modal dasar minimal Rp 10 Juta. Estimasi proses 14-30 hari kerja, tergantung pada persetujuan nama oleh Kemenkumham.', 'Legalitas', 'Pendirian Legalitas', 7, '2026-04-22 12:44:15'),
(54, 'Apa syarat pendirian Firma?', '1) Minimal 2 orang pengurus (Managing Partner dan Anggota). 2) KTP dan NPWP. 3) Memiliki Surat Keterangan Profesi (seperti Advokat, Akuntan, atau Arsitek). Estimasi proses 3-7 hari kerja.', 'Legalitas', 'Pendirian Legalitas', 8, '2026-04-22 12:44:15'),
(55, 'Apakah PT Perorangan dapat memiliki Akta Notaris?', 'Ya, PT Perorangan dapat membuat Akta Penegasan di Notaris. Proses ini dapat dilakukan setelah legalitas dasar (NIB, NPWP PT, dll) terbit. Estimasi proses 1-3 hari kerja.', 'Legalitas', 'Pembuatan Legalitas', 9, '2026-04-22 12:44:15'),
(56, 'Apakah PT Perorangan dapat membuka Rekening Perusahaan?', 'Tentu saja. PT Perorangan memiliki legalitas yang sah untuk membuka rekening bank atas nama perusahaan. Kami dapat membantu mempercepat proses pembukaan rekening di area Jabodetabek.', 'Legalitas', 'Pembuatan Legalitas', 10, '2026-04-22 12:44:15'),
(57, 'Apakah PT Nuansa Berkah Sejahtera melayani pengurusan Izin Konstruksi (SBUJK)?', 'Ya, kami melayani pengurusan SBUJK secara lengkap, mulai dari pemberkasan, pengadaan tenaga ahli (PJT/PJSK), hingga penerbitan KTA Asosiasi. Biaya mulai dari Rp 2.000.000,-.', 'Legalitas', 'Pembuatan Legalitas', 11, '2026-04-22 12:44:15'),
(58, 'Apakah melayani pengurusan Izin Edar PIRT?', 'Ya, kami membantu proses pemberkasan, pemilihan KBLI, hingga desain kemasan sesuai standar Dinkes. Biaya mulai dari Rp 600.000,-. Cocok untuk produk makanan kering, sambal, atau minuman serbuk.', 'Legalitas', 'Pembuatan Legalitas', 12, '2026-04-22 12:44:15'),
(59, 'Apakah melayani pengurusan BPOM (MD, ML, TR, NA)?', 'Kami melayani pengurusan izin BPOM lengkap termasuk audit CPPOB/CPPKB. Biaya mulai dari Rp 12.000.000,-. Silakan hubungi admin kami di 089644448721 untuk konsultasi lebih lanjut.', 'Legalitas', 'Pembuatan Legalitas', 13, '2026-04-22 12:44:15'),
(60, 'Apakah melayani pengurusan Izin Edar PKRT (Perbekalan Kesehatan Rumah Tangga)?', 'Ya, kami melayani pendaftaran merek, uji lab, hingga penerbitan sertifikat PKRT untuk produk seperti tisu, sabun cuci piring, atau alat kesehatan lainnya. Biaya mulai dari Rp 6.000.000,-.', 'Legalitas', 'Pembuatan Legalitas', 14, '2026-04-22 12:44:15');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(500) NOT NULL,
  `period` varchar(20) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `sub_category` varchar(100) DEFAULT NULL,
  `alt_text` text DEFAULT NULL,
  `original_path` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `name`, `path`, `period`, `category`, `sub_category`, `alt_text`, `original_path`, `created_at`) VALUES
(1, 'CVDESEMBER-AtxypGtu9MwR9UAZnztfkg.jpeg', '1776859983540_CVDESEMBER-AtxypGtu9MwR9UAZnztfkg.jpeg', NULL, 'promo', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2025/Desember/CVDESEMBER-AtxypGtu9MwR9UAZnztfkg.jpeg', '2026-04-22 12:13:03'),
(2, 'IZINOPERASIONALDESEMBER-lATXwsG9MzhfdQoDCcuPZg.jpeg', '1776859983679_IZINOPERASIONALDESEMBER-lATXwsG9MzhfdQoDCcuPZg.jpeg', NULL, 'promo', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2025/Desember/IZINOPERASIONALDESEMBER-lATXwsG9MzhfdQoDCcuPZg.jpeg', '2026-04-22 12:13:03'),
(3, 'KOPERASIDESEMBER-F-AFUikH79gXHtMQJKgvbA.jpeg', '1776859983687_KOPERASIDESEMBER-F-AFUikH79gXHtMQJKgvbA.jpeg', NULL, 'promo', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2025/Desember/KOPERASIDESEMBER-F-AFUikH79gXHtMQJKgvbA.jpeg', '2026-04-22 12:13:03'),
(4, 'KOPERASIDESEMBER-ITr7SNKszj0pr8LFt0ELvg.jpeg', '1776859983696_KOPERASIDESEMBER-ITr7SNKszj0pr8LFt0ELvg.jpeg', NULL, 'promo', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2025/Desember/KOPERASIDESEMBER-ITr7SNKszj0pr8LFt0ELvg.jpeg', '2026-04-22 12:13:03'),
(5, 'PERKUMPULANDESEMBER-EFymUYjUbr7rKOP1Yf3T1Q.jpeg', '1776859983703_PERKUMPULANDESEMBER-EFymUYjUbr7rKOP1Yf3T1Q.jpeg', NULL, 'promo', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2025/Desember/PERKUMPULANDESEMBER-EFymUYjUbr7rKOP1Yf3T1Q.jpeg', '2026-04-22 12:13:03'),
(6, 'PMADESEMBER--oXkqE20rQRKjhzuUV4PMA.jpeg', '1776859983710_PMADESEMBER--oXkqE20rQRKjhzuUV4PMA.jpeg', NULL, 'promo', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2025/Desember/PMADESEMBER--oXkqE20rQRKjhzuUV4PMA.jpeg', '2026-04-22 12:13:03'),
(7, 'PTPERORANGANDESEMBER-kbj9pXjg40sc9QkgpQRDAg.jpeg', '1776859983718_PTPERORANGANDESEMBER-kbj9pXjg40sc9QkgpQRDAg.jpeg', NULL, 'promo', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2025/Desember/PTPERORANGANDESEMBER-kbj9pXjg40sc9QkgpQRDAg.jpeg', '2026-04-22 12:13:03'),
(8, 'YAYASANDESEMBER-D6UrIu6W5eJZf9OJpgVy4g.jpeg', '1776859983727_YAYASANDESEMBER-D6UrIu6W5eJZf9OJpgVy4g.jpeg', NULL, 'promo', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2025/Desember/YAYASANDESEMBER-D6UrIu6W5eJZf9OJpgVy4g.jpeg', '2026-04-22 12:13:03'),
(9, 'YAYASANDESEMBER-T93V8F21usOAMS-KNhPBaw.jpeg', '1776859983737_YAYASANDESEMBER-T93V8F21usOAMS-KNhPBaw.jpeg', NULL, 'promo', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2025/Desember/YAYASANDESEMBER-T93V8F21usOAMS-KNhPBaw.jpeg', '2026-04-22 12:13:03'),
(10, 'PENDIRIANPERKUMPULANNUANSALEGAL.jpeg', '1776859983751_PENDIRIANPERKUMPULANNUANSALEGAL.jpeg', NULL, 'promo', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2025/Juli/PENDIRIANPERKUMPULANNUANSALEGAL.jpeg', '2026-04-22 12:13:03'),
(11, 'WhatsAppImage2024-07-05at15.04.31.jpeg', '1776859983760_WhatsAppImage2024-07-05at15.04.31.jpeg', NULL, 'promo', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2025/Juli/WhatsAppImage2024-07-05at15.04.31.jpeg', '2026-04-22 12:13:03'),
(12, 'WhatsAppImage2024-07-05at16.17.50.jpeg', '1776859983768_WhatsAppImage2024-07-05at16.17.50.jpeg', NULL, 'promo', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2025/Juli/WhatsAppImage2024-07-05at16.17.50.jpeg', '2026-04-22 12:13:03'),
(13, 'WhatsAppImage2024-07-05at16.17.51.jpeg', '1776859983779_WhatsAppImage2024-07-05at16.17.51.jpeg', NULL, 'promo', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2025/Juli/WhatsAppImage2024-07-05at16.17.51.jpeg', '2026-04-22 12:13:03'),
(14, '10_20260418_112225_0009.png', '1776859983791_10_20260418_112225_0009.png', '2026/April', 'promo', 'Pembuatan Legalitas', NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2026/April/Pembuatan_legalitas/10_20260418_112225_0009.png', '2026-04-22 12:13:03'),
(15, '9_20260418_112225_0008.png', '1776859983832_9_20260418_112225_0008.png', '2026/April', 'promo', 'Pembuatan Legalitas', NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2026/April/Pembuatan_legalitas/9_20260418_112225_0008.png', '2026-04-22 12:13:03'),
(16, '1_20260418_112224_0000.png', '1776859983874_1_20260418_112224_0000.png', '2026/April', 'promo', 'Pendirian Legalitas', NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2026/April/Pendirian_legalitas/1_20260418_112224_0000.png', '2026-04-22 12:13:03'),
(17, '2_20260418_112224_0001.png', '1776859983915_2_20260418_112224_0001.png', '2026/April', 'promo', 'Pendirian Legalitas', NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2026/April/Pendirian_legalitas/2_20260418_112224_0001.png', '2026-04-22 12:13:03'),
(18, '3_20260418_112225_0002.png', '1776859983956_3_20260418_112225_0002.png', '2026/April', 'promo', 'Pendirian Legalitas', NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2026/April/Pendirian_legalitas/3_20260418_112225_0002.png', '2026-04-22 12:13:03'),
(19, '4_20260418_112225_0003.png', '1776859983994_4_20260418_112225_0003.png', '2026/April', 'promo', 'Pendirian Legalitas', NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2026/April/Pendirian_legalitas/4_20260418_112225_0003.png', '2026-04-22 12:13:04'),
(20, '5_20260418_112225_0004.png', '1776859984118_5_20260418_112225_0004.png', '2026/April', 'promo', 'Pendirian Legalitas', NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2026/April/Pendirian_legalitas/5_20260418_112225_0004.png', '2026-04-22 12:13:04'),
(21, '6_20260418_112225_0005.png', '1776859984257_6_20260418_112225_0005.png', '2026/April', 'promo', 'Pendirian Legalitas', NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2026/April/Pendirian_legalitas/6_20260418_112225_0005.png', '2026-04-22 12:13:04'),
(22, '7_20260418_112225_0006.png', '1776859984362_7_20260418_112225_0006.png', '2026/April', 'promo', 'Pendirian Legalitas', NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2026/April/Pendirian_legalitas/7_20260418_112225_0006.png', '2026-04-22 12:13:04'),
(23, '8_20260418_112225_0007.png', '1776859984410_8_20260418_112225_0007.png', '2026/April', 'promo', 'Pendirian Legalitas', NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.promo/2026/April/Pendirian_legalitas/8_20260418_112225_0007.png', '2026-04-22 12:13:04'),
(24, 'Arin_as_Kontent_Creator.jpeg', '1776859985437_Arin_as_Kontent_Creator.jpeg', NULL, 'team', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.team-nuansa/Arin_as_Kontent_Creator.jpeg', '2026-04-22 12:13:05'),
(25, 'Ela_as_Marketing.jpeg', '1776859986161_Ela_as_Marketing.jpeg', NULL, 'team', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.team-nuansa/Ela_as_Marketing.jpeg', '2026-04-22 12:13:06'),
(26, 'Vikri_Firdaus_Founder.jpeg', '1776859986953_Vikri_Firdaus_Founder.jpeg', NULL, 'team', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/.team-nuansa/Vikri_Firdaus_Founder.jpeg', '2026-04-22 12:13:07'),
(27, 'VIRTUALOFFICENUANSALEGAL.jpeg', '1776859987250_VIRTUALOFFICENUANSALEGAL.jpeg', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/0/10852787/VIRTUALOFFICENUANSALEGAL.jpeg', '2026-04-22 12:13:07'),
(28, 'office_3_1.jpg', '1776859987259_office_3_1.jpg', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/0/6031498/office_3_1.jpg', '2026-04-22 12:13:07'),
(29, 'how-we-started.jpg', '1776859987292_how-we-started.jpg', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/0/7199740/how-we-started.jpg', '2026-04-22 12:13:07'),
(30, 'LOGO-NUANSA-LEGAL.jpeg', '1776859987318_LOGO-NUANSA-LEGAL.jpeg', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/0/9696670/LOGO-NUANSA-LEGAL.jpeg', '2026-04-22 12:13:07'),
(31, 'LOGO-NUANSA-LEGAL.jpeg', '1776859987326_LOGO-NUANSA-LEGAL.jpeg', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/150/9696670/LOGO-NUANSA-LEGAL.jpeg', '2026-04-22 12:13:07'),
(32, 'LOGONUANSALEGAL.png', '1776859987335_LOGONUANSALEGAL.png', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/152x152/9746242/LOGONUANSALEGAL.png', '2026-04-22 12:13:07'),
(33, 'LOGONUANSALEGAL.png', '1776859987341_LOGONUANSALEGAL.png', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/16x16/9746242/LOGONUANSALEGAL.png', '2026-04-22 12:13:07'),
(34, 'LOGO-NUANSA-LEGAL.jpeg', '1776859987347_LOGO-NUANSA-LEGAL.jpeg', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/300/9696670/LOGO-NUANSA-LEGAL.jpeg', '2026-04-22 12:13:07'),
(35, 'LOGONUANSALEGAL.png', '1776859987354_LOGONUANSALEGAL.png', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/32x32/9746242/LOGONUANSALEGAL.png', '2026-04-22 12:13:07'),
(36, 'SBUJKNUANSALEGALSEPTEMBER.jpeg', '1776859987363_SBUJKNUANSALEGALSEPTEMBER.jpeg', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/576/10852711/SBUJKNUANSALEGALSEPTEMBER.jpeg', '2026-04-22 12:13:07'),
(37, 'PROMO9SEPTEMBERNUANSALEGAL.jpeg', '1776859987369_PROMO9SEPTEMBERNUANSALEGAL.jpeg', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/576/10852782/PROMO9SEPTEMBERNUANSALEGAL.jpeg', '2026-04-22 12:13:07'),
(38, 'our-story.jpg', '1776859987376_our-story.jpg', NULL, 'about', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/576/7199753/our-story.jpg', '2026-04-22 12:13:07'),
(39, 'featured-blog.jpg', '1776859987389_featured-blog.jpg', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/576/7212734/featured-blog.jpg', '2026-04-22 12:13:07'),
(40, 'b1.jpg', '1776859987399_b1.jpg', NULL, 'hero', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/576/7212821/b1.jpg', '2026-04-22 12:13:07'),
(41, 'LOGO-NUANSA-LEGAL.jpeg', '1776859987408_LOGO-NUANSA-LEGAL.jpeg', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/576/9696670/LOGO-NUANSA-LEGAL.jpeg', '2026-04-22 12:13:07'),
(42, 'LOGONUANSALEGAL.png', '1776859987415_LOGONUANSALEGAL.png', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/96x96/9746242/LOGONUANSALEGAL.png', '2026-04-22 12:13:07'),
(43, 'dummy.png', '1776859987422_dummy.png', NULL, 'other', NULL, NULL, 'C:/codingVibes/nuansasolution/.mainweb/nuansa_legal-v2/src/assets/images/dummy.png', '2026-04-22 12:13:07'),
(44, 'LOGO-NUANSA-LEGAL', '1776859987415_LOGONUANSALEGAL.png', NULL, 'other', 'brand', 'Logo PT. Nuansa Berkah Sejahtera', 'src/assets/logo/logo-nuansa-legal.png', '2026-04-22 12:39:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
