-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 12 Okt 2018 pada 16.08
-- Versi Server: 5.7.23-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coba`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `crypto`
--

CREATE TABLE `crypto` (
  `id` int(5) NOT NULL,
  `data_0` varchar(200) NOT NULL,
  `data_1` varchar(250) NOT NULL,
  `data_2` varchar(250) NOT NULL,
  `data_3` varchar(250) NOT NULL,
  `data_4` varchar(250) NOT NULL,
  `data_5` varchar(250) NOT NULL,
  `data_6` varchar(250) NOT NULL,
  `data_7` varchar(250) NOT NULL,
  `data_8` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `currencies`
--

CREATE TABLE `currencies` (
  `id` int(5) NOT NULL,
  `data_0` varchar(200) NOT NULL,
  `data_1` varchar(250) NOT NULL,
  `data_2` varchar(250) NOT NULL,
  `data_3` varchar(250) NOT NULL,
  `data_4` varchar(250) NOT NULL,
  `data_5` varchar(250) NOT NULL,
  `data_6` varchar(250) NOT NULL,
  `data_7` varchar(250) NOT NULL,
  `data_8` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `currencies`
--

INSERT INTO `currencies` (`id`, `data_0`, `data_1`, `data_2`, `data_3`, `data_4`, `data_5`, `data_6`, `data_7`, `data_8`) VALUES
(1, '1', 'BTCBitcoin', '656699', '073', '11371 B', '1731 MBTC', '376 B', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(2, '2', 'ETHEthereum', '22601', '039', '2316 B', '10248 METH', '136 B', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(3, '3', 'XRPXRP', '0466942', '170', '1865 B', '3994 BXRP', '39888 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(4, '4', 'BCHBitcoin Cash', '51072', '075', '888 B', '1739 MBCH', '35013 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(5, '5', 'EOSEOS', '587', '023', '532 B', '90625 MEOS', '52952 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(6, '6', 'XLMStellar', '0242363', '079', '458 B', '1889 BXLM', '3727 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe '),
(7, '7', 'LTCLitecoin', '5771', '136', '339 B', '5866 MLTC', '32786 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(8, '8', 'ADACardano', '0084358', '077', '219 B', '2593 BADA', '3620 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(9, '9', 'XMRMonero', '11238', '073', '185 B', '1648 MXMR', '11494 M', '', ' Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(10, '10', 'TRXTRON', '0025071', '188', '165 B', '6575 BTRX', '17212 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(11, '11', 'MIOTAIOTA', '0577060', '155', '160 B', '278 BMIOTA', '2155 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(12, '12', 'DASHDash', '17759', '120', '149 B', '837 MDASH', '22867 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(13, '13', 'NEONEO', '1806', '039', '117 B', '6500 MNEO', '16516 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(14, '14', 'ETCEthereum Classic', '1078', '071', '113 B', '10517 METC', '18359 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(15, '15', 'XEMNEM', '0105377', '080', '94840 M', '900 BXEM', '836 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(16, '16', 'XTZTezos', '135', '173', '81950 M', '60749 MXTZ', '178 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(17, '17', 'VETVeChain', '0013265', '133', '73563 M', '5545 BVET', '1016 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(18, '18', 'DOGEDogecoin', '0005588', '021', '65097 M', '11650 BDOGE', '924 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(19, '19', 'ZECZcash', '12558', '075', '62568 M', '498 MZEC', '17065 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(20, '20', 'BTGBitcoin Gold', '2631', '019', '45461 M', '1728 MBTG', '323 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(21, '21', 'ONTOntology', '205', '080', '42480 M', '20702 MONT', '2654 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(22, '22', 'LSKLisk', '340', '155', '37704 M', '11101 MLSK', '514 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(23, '23', 'DCRDecred', '4115', '127', '35452 M', '862 MDCR', '121 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(24, '24', 'QTUMQtum', '393', '333', '34989 M', '8895 MQTUM', '13183 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(25, '25', 'BCNBytecoin', '0001715', '211', '31568 M', '18407 BBCN', '896 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(26, '26', 'BTSBitShares', '0109965', '026', '29294 M', '266 BBTS', '413 M', '', 'Add to WatchlistRemove from Watchlist Watchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(27, '27', 'BCDBitcoin Diamond', '189', '207', '29003 M', '15376 MBCD', '223 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(28, '28', 'NANONano', '218', '060', '28984 M', '13325 MNANO', '283 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(29, '29', 'DGBDigiByte', '0025190', '047', '27468 M', '1090 BDGB', '379 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(30, '30', 'ICXICON', '0693334', '116', '26862 M', '38743 MICX', '1158 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(31, '31', 'SCSiacoin', '0007190', '198', '26824 M', '3731 BSC', '509 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(32, '32', 'XVGVerge', '0016010', '171', '24290 M', '1517 BXVG', '464 M', '', 'Add to Watchlist Remove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(33, '33', 'STEEMSteem', '0843840', '141', '23577 M', '27940 MSTEEM', '177 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(34, '34', 'WAVESWaves', '210', '170', '20983 M', '10000 MWAVES ', '668 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(35, '35', 'BTMBytom', '0200376', '839', '20088 M', '100 BBTM', '2742 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(36, '36', 'ETNElectroneum', '0024559', '595', '19853 M', '808 BETN', '285 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(37, '37', ' ETPMetaverse ETP', '327', '119', '17202 M', '5253 METP', '797 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView Markets View Historical DataKeep your crypto safe'),
(38, '38', 'STRATStratis', '149', '145', '14754 M', '9905 MSTRAT', '65924 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(39, '39', 'KMDKomodo', '117', '467', '12851 M', '11005 MKMD', '145 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(40, '40', 'CNXCryptonex', '213', '024', '11845 M', '5550 MCNX', '755 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(41, '41', 'ARDRArdor', '0115724', '112', '11561 M', '99900 MARDR', '478 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(42, '42', 'WANWanchain', '109', '107', '11521 M', '10615 MWAN ', '170 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(43, '43', 'RDDReddCoin', '0003534', '019', '10180 M', '2881 BRDD', '161 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(44, '44', 'HCHyperCash', '228', '218', '9941 M', '4353 MHC', '58756 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(45, '45', 'MOACMOAC', '155', '035', '9693 M', '6246 MMOAC', '11168 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView Markets View Historical DataKeep your crypto safe'),
(46, '46', 'GXSGXChain', '151', '705', '9067 M', '6000 MGXS', '566 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(47, '47', 'NASNebulas', '197', '042', '8982 M', '4550 MNAS', '1061 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(48, '48', 'HTHuobi Token', '177', '101', '8841 M', ' 5000 MHT', '1112 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(49, '49', 'ARKArk', '0759610', '106', '8026 M', '10566 MARK', '84920 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(50, '50', 'MONAMonaCoin', '124', '001', '7780 M', '6286 MMONA', '79270 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(51, ' 51', 'ZENHorizen', '1565', '077', '7672 M', '490 MZEN', '46095 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(52, '52', 'ELAElastos', '869', '780', '6709 M', '772 MELA', '618 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(53, '53', 'NXTNxt', '0065655', '183', '6559 M', '99900 MNXT', '100 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(54, '54', 'PIVXPIVX', '114', '442', '6448 M', '5678 MPIVX', '59667 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(55, '55', 'XZCZCoin', '1022', '261', '5885 M', '576 MXZC', '1052 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(56, '56', 'BTCPBitcoin Private', '272', '088', '5585 M', '2052 MBTCP', '11556 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(57, '57', 'SYSSyscoin', '0093790', '020', '5079 M', '54148 MSYS', '36324 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(58, '58', 'NXSNexus', '0779300', '205', '4555 M', '5845 MNXS', '107 M', '', ' Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(59, '59', 'SKYSkycoin', '426', '377', '4256 M', '1000 MSKY', '66554 K', ' ', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(60, '60', 'BCOBridgeCoin', '153', '745', '4140 M', '2700 MBCO', '516 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(61, '61', 'EMCEmercoin', '0973068', '415', '4098 M', '4212 MEMC', '37237 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(62, '62', 'GRSGroestlcoin', '0575636', '182', '4090 M', '7106 MGRS', '1227 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe '),
(63, '63', 'FCTFactom', '443', '310', '3872 M', '875 MFCT', '24698 K', '', 'Add to WatchlistRemove from WatchlistWatchlist full View ChartView MarketsView Historical DataKeep your crypto safe'),
(64, '64', 'WICCWaykiChain', '0226699', '127', '3851 M', '16989 MWICC', '162 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(65, '65', 'GBYTEByteball Bytes', '4982', '157', '3302 M', '66281 KGBYTE', '3441 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(66, '66', 'VTCVertcoin', '0677821', '046', '3141 M', '4635 MVTC', '41104 K ', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(67, '67', 'RVNRavencoin', '0014987', '163', '2984 M', '199 BRVN', '26143 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(68, '68', 'NEBLNeblio', '210', '283', '2863 M', '1361 MNEBL', '23160 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(69, '69', 'NMCNamecoin', '190', '2946', '2798 M', '1474 MNMC', '3735 K', '', 'Add to WatchlistRemove from Watchlist Watchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(70, '70', 'GCRGlobal Curren', '0230589', '445', '2417 M', '10481 MGCR', '5071 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(71, '71', 'SMARTSmartCash', '0022318', '171', '2352 M', '105 BSMART', '29726 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(72, '72', 'XDNDigitalNote', '0003367', '020', '2333 M', '693 BXDN', '81657 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(73, '73', 'PPCPeercoin', '0925778', '192', '2314 M', '2499 MPPC', '23516 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(74, ' 74', 'APLApollo Currency', '0001549', '097', '2275 M', '1469 BAPL', '3330 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(75, '75', 'BLOCKBlocknet', '413', '839', '2219 M', '537 MBLOCK', '3271 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(76, '76', 'TPAYTokenPay', '141', '186', '2205 M', '1560 MTPAY', '21776 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(77, '77', 'ACTAchain', '0031246', '349', '2187 M', '69977 MACT', '112 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(78, '78', 'NAVNavCoin', '0340048', '166', '2158 M', '6346 MNAV', '56174 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(79, '79', 'GOGoChain', '0034083', '261', '2126 M', '62376 MGO', '118 M', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(80, '80', 'UBQUbiq', '0487212', '178', '2076 M', '4261 MUBQ', '1028 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(81, '81', 'PARTParticl', '257', '059', '2070 M', '807 MPART', '16216 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(82, '82', 'XWCWhiteCoin', '0081462', '601', '2035 M', '24984 MXWC', '14125 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(83, '83', 'BCIBitcoin Interest', '110', '817', '2013 M', '1833 MBCI', '1988 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(84, '84', 'POAPOA Network', '0090341', '466', '1985 M', '21972 MPOA ', '92482 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(85, '85', 'BOSBOScoin', '0043444', '023', '1941 M', '44684 MBOS', '1074 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(86, '86', 'BURSTBurst', '0009637', '081', '1917 M', '199 BBURST', '5625 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(87, '87', 'BAYBitBay', '0018184', '208', '1841 M', '101 BBAY', '5275 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(88, '88', 'SLSSaluS', '1739', '298', '1759 M', '101 MSLS', '4042 K', '', 'Add to Watchlist Remove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(89, '89', 'EMC2Einsteinium', '0079944', '679', '1740 M', '21771 MEMC2', '56466 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(90, '90', 'ZCLZClassic', '342', '231', '1720 M', '503 MZCL ', '24721 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(91, '91', 'NTYNexty', '0000112', '263', '1656 M', '14812 BNTY', '11110 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(92, '92', 'XASAsch', '0175723', '529', '1640 M', '9336 MXAS', '45022 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(93, '93', ' LCCLitecoin Cash', '0026015', '291', '1535 M', '58999 MLCC', '10301 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(94, '94', 'SBDSteem Dollars', '0996751', '205', '1498 M', '1502 MSBD', '81604 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(95, '95', 'VIAViacoin', '0642031', '442', '1483 M', '2309 MVIA', '49911 K', ' ', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(96, '96', 'XPMPrimecoin', '0584512', '145', '1472 M', ' 2518 MXPM', '18120 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(97, '97', 'BTXBitcore', '0849964', '656', '1387 M', '1632 MBTX', '6384 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(98, '98', 'ECAElectra', '0000490', '172', '1387 M', '2830 BECA', '5618 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(99, '99', 'IONION', '0636817', '029', '1374 M', '2157 MION', '2006 K', '', 'Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe'),
(100, '100', 'TMCTimicoin', '0044463', '004', '1369 M', '30789 MTMC', '1636 K', '', ' Add to WatchlistRemove from WatchlistWatchlist fullView ChartView MarketsView Historical DataKeep your crypto safe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crypto`
--
ALTER TABLE `crypto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `crypto`
--
ALTER TABLE `crypto`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
