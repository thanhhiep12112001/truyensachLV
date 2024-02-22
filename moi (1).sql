-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 11, 2024 lúc 03:21 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `moi`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(10) UNSIGNED NOT NULL,
  `chuong_id` int(11) NOT NULL,
  `noidung` longtext NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `chuong_id`, `noidung`, `user_id`, `created_at`, `updated_at`) VALUES
(9, 5, 'Xin chào', 5, '2023-05-13 06:29:40', '2023-05-13 17:56:59'),
(10, 7, 'xin chào mn. Mình là Lại Đăng Tình', 5, '2023-05-13 08:00:03', '2023-05-13 08:00:35'),
(12, 7, 'khi nào có chương mới vậy bạn', 4, '2023-05-13 08:03:29', '2023-05-13 08:03:29'),
(13, 8, 'hello các bạn', 5, '2023-05-13 12:25:02', '2023-05-13 12:25:02'),
(15, 7, 'alo alo', 5, '2023-12-24 10:31:45', '2023-12-24 10:31:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuong`
--

CREATE TABLE `chuong` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `truyen_id` int(10) UNSIGNED NOT NULL,
  `tieude` varchar(255) NOT NULL,
  `slug_chuong` varchar(255) NOT NULL,
  `noidung` longtext NOT NULL,
  `kichhoat` int(11) NOT NULL,
  `is_vip` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chuong`
--

INSERT INTO `chuong` (`id`, `truyen_id`, `tieude`, `slug_chuong`, `noidung`, `kichhoat`, `is_vip`) VALUES
(4, 18, 'Chương 1: Sơn biên tiểu thôn', 'chuong-1-son-bien-tieu-thon', '<p><em><em><em><em><em>&quot;Anh ngố&quot;</em></em></em></em></em>&nbsp;trợn trừng hai mắt, nh&igrave;n chằm chằm v&agrave;o n&oacute;c nh&agrave; được tạo th&agrave;nh từ cỏ dại v&agrave; b&ugrave;n trộn lẫn. To&agrave;n th&acirc;n hắn được tr&ugrave;m bởi một c&aacute;i &aacute;o b&ocirc;ng đ&atilde; cũ, ố v&agrave;ng, nh&igrave;n kh&ocirc;ng c&ograve;n ra h&igrave;nh dạng ban đ&acirc;u, phảng phất t&aacute;n ph&aacute;t ra một &iacute;t m&ugrave;i ẩm mốc.<br />\r\n<br />\r\nB&ecirc;n cạnh hắn c&ograve;n c&oacute; một người nữa, l&agrave; nhị ca H&agrave;n Ch&uacute;, đang ngủ rất say sưa. Thỉnh thoảng c&oacute; tiếng ng&aacute;y nh&egrave; nhẹ ph&aacute;t ra từ đ&oacute;.<br />\r\n<br />\r\nC&aacute;ch giường chừng nửa trượng, l&agrave; một v&aacute;ch tường đất đổ n&aacute;t, v&igrave; thời gian đ&atilde; qu&aacute; l&acirc;u, tr&ecirc;n v&aacute;ch tường đ&atilde; xuất hiện v&agrave;i vết nứt d&agrave;i. Từ những vết nứt đ&oacute;, lo&aacute;ng tho&aacute;ng truyền đến thanh &acirc;m o&aacute;n th&aacute;n của H&agrave;n mẫu, ngo&agrave;i ra c&ograve;n c&oacute; thanh &acirc;m H&agrave;n phụ đang h&uacute;t thuốc rất l&agrave; hấp dẫn.</p>\r\n\r\n<p>&#39;Anh ngố&#39; từ từ nhắm đ&ocirc;i mắt c&oacute; ch&uacute;t bức bối lại. Muốn thật nhanh ch&igrave;m v&agrave;o giấc ngủ s&acirc;u. Trong l&ograve;ng hắn biết r&otilde; r&agrave;ng, nếu b&acirc;y giờ m&agrave; c&ograve;n kh&ocirc;ng ngủ ngay, ng&agrave;y mai kh&ocirc;ng thể n&agrave;o dậy sớm được, cũng kh&ocirc;ng thể c&ugrave;ng đ&aacute;m bạn c&ugrave;ng đi đốn củi được.<br />\r\n<br />\r\n<em><em><em><em><em>&quot;Anh ngố&quot;</em></em></em></em></em>&nbsp;họ H&agrave;n t&ecirc;n Lập, loại danh tự c&oacute; &yacute; nghĩa như thế n&agrave;y cha mẹ hắn kh&ocirc;ng c&oacute; khả năng đưa ra. C&aacute;i n&agrave;y l&agrave; do phụ th&acirc;n hắn d&ugrave;ng rượu oa đầu chế bởi th&ocirc; lương, cầu l&atilde;o Trương trong th&ocirc;n đặt cho.<br />\r\n<br />\r\nL&atilde;o Trương khi c&ograve;n trẻ, đ&atilde; từng l&agrave;m thư đồng mấy năm cho một nh&agrave; c&oacute; tiền trong th&agrave;nh. L&agrave; người duy nhất trong th&ocirc;n nhận biết được v&agrave;i chữ. T&ecirc;n gọi của hầu hết tiểu h&agrave;i tử trong th&ocirc;n, đều l&agrave; do l&atilde;o Trương đặt cho.</p>\r\n\r\n<p>H&agrave;n Lập bị người trong th&ocirc;n gọi l&agrave;&nbsp;<em><em><em><em><em>&quot;Anh ngố&quot;</em></em></em></em></em>&nbsp;kh&ocirc;ng phải l&agrave; do hắn ngố hay đần thật sự, ngược lại, hắn c&ograve;n l&agrave; đứa trẻ th&ocirc;ng minh nhất l&agrave;ng, ngo&agrave;i ra tr&ocirc;ng hắn so với những đứa trẻ kh&aacute;c trong l&agrave;ng kh&ocirc;ng c&oacute; g&igrave; kh&aacute;c biệt. Trừ những người trong nh&agrave; ra, hắn rất &iacute;t khi nghe thấy nguời ta gọi t&ecirc;n ch&iacute;nh thức H&agrave;n Lập của hắn, m&agrave; hầu như chỉ l&agrave;&nbsp;<em><em><em><em><em>&quot;Anh ngố&quot;</em></em></em></em></em>, v&agrave; c&aacute;i t&ecirc;n&nbsp;<em><em><em><em><em>&quot;Anh ngố&quot;</em></em></em></em></em>&nbsp;n&agrave;y vẫn được sử dụng cho đến tận b&acirc;y giờ.<br />\r\n<br />\r\nSở dĩ H&agrave;n Lập bị mọi người ban cho hỗn danh&nbsp;<em><em>&quot;anh ngố&quot;</em></em>&nbsp;l&agrave; v&igrave; trong th&ocirc;n vốn đ&atilde; c&oacute; một&nbsp;<em>&quot;anh ngốc&quot;</em>&nbsp;rồi.<br />\r\n<br />\r\nĐiều n&agrave;y cũng kh&ocirc;ng c&oacute; g&igrave; to t&aacute;t cả, tất cả những đứa trẻ kh&aacute;c trong th&ocirc;n đều c&oacute; hỗn danh như&nbsp;<em>&quot;cẩu oa&quot;</em>&nbsp;hay&nbsp;<em>&quot;nhị đản&quot;</em>, so với danh tự&nbsp;<em><em>&quot;anh ngố&quot;</em></em>&nbsp;th&igrave; c&ograve;n kh&oacute; nghe hơn.</p>\r\n\r\n<p>Cũng bởi vậy, H&agrave;n Lập mặc d&ugrave; kh&ocirc;ng th&iacute;ch c&aacute;ch xưng h&ocirc; n&agrave;y nhưng cũng chỉ c&oacute; thể tự an ủi m&igrave;nh m&agrave; th&ocirc;i.<br />\r\n<br />\r\nH&agrave;n Lập bề ngo&agrave;i tr&ocirc;ng kh&ocirc;ng được vừa mắt, da tay th&igrave; đen đ&uacute;a, đ&iacute;ch thực l&agrave; một đứa trẻ b&igrave;nh thường chốn l&agrave;ng qu&ecirc;. Tuy nhi&ecirc;n, nội t&acirc;m của cậu b&eacute; th&igrave; kh&ocirc;ng hề n&ocirc;ng nổi, so với những đứa b&eacute; c&ugrave;ng lứa tuổi th&igrave; ch&iacute;n chắn hơn nhiều. Hắn từ nhỏ đ&atilde; hướng tới thế giới phồn hoa b&ecirc;n ngo&agrave;i, mơ rằng c&oacute; một ng&agrave;y, hắn c&oacute; thể ra khỏi th&ocirc;n l&agrave;ng, đi xem xem c&aacute;i thế giới ph&ugrave; hoa m&agrave; l&atilde;o Trương thường n&oacute;i đến.<br />\r\n<br />\r\nKhi H&agrave;n Lập nghĩ đến &yacute; tưởng n&agrave;y, hắn kh&ocirc;ng d&aacute;m đề cập ra cho người kh&aacute;c biết. Nếu kh&ocirc;ng, nhất định l&agrave;m cho mọi người trong th&ocirc;n cảm thấy ngạc nhi&ecirc;n, một tiểu h&agrave;i tử miệng c&ograve;n chưa kh&ocirc; m&ugrave;i sữa, thế m&agrave; d&aacute;m mơ tưởng đến những &yacute; nghĩ xa vời m&agrave; ngay cả một người lớn cũng chưa d&aacute;m nghĩ đến. Cần phải biết rằng, những đưa trẻ kh&aacute;c c&ugrave;ng tuổi với H&agrave;n Lập th&igrave; tầm tuổi n&agrave;y chỉ biết đuổi g&agrave;, bắt ch&oacute;, tất nhi&ecirc;n l&agrave; ở đ&acirc;y sẽ kh&ocirc;ng n&oacute;i đến những kẻ c&oacute; &yacute; nghĩ tha huơng cầu thực.<br />\r\n<br />\r\nGia đ&igrave;nh H&agrave;n Lập c&oacute; bảy miệng ăn, tr&ecirc;n hắn c&oacute; hai vị huynh trưởng, một tỷ tỷ, hắn trong nh&agrave; đứng thứ tư, ngo&agrave;i ra hắn c&ograve;n c&oacute; một tiểu muội muội nữa. Năm nay hắn vừa mới mười tuổi, gia cảnh bần h&agrave;n, cả năm cũng kh&ocirc;ng c&oacute; mấy bữa được ăn no. Mọi người trong nh&agrave; đều chỉ mong được ăn đủ no, mặc đủ ấm.<br />\r\n<br />\r\nH&agrave;n Lập l&uacute;c n&agrave;y, đang mơ mơ m&agrave;ng m&agrave;ng, tuy ngủ m&agrave; chưa ngủ, trong đầu vẫn c&ograve;n phảng phất &yacute; niệm: Ng&agrave;y mai l&ecirc;n n&uacute;i, nhất định sẽ mang về cho tiểu muội muội m&agrave; hắn y&ecirc;u thương nhất thật nhiều hồng tương quả*, loại quả m&agrave; muội muội hắn th&iacute;ch nhất.<br />\r\n<br />\r\nV&agrave;o giữa trưa ng&agrave;y thứ hai, H&agrave;n Lập dưới &aacute;nh nắng ch&oacute;i trang, lưng g&ugrave;i b&oacute; củi cao bằng nửa người hắn, trước ngực th&igrave; &ocirc;m một nắm đầy hồng tương quả, đang từ ngọn n&uacute;i trở về nh&agrave;. L&uacute;c n&agrave;y, hắn kh&ocirc;ng hề biết rằng trong nh&agrave; đang c&oacute; một vị kh&aacute;ch đến chơi, m&agrave; vị kh&aacute;ch n&agrave;y, ch&iacute;nh l&agrave; người cải biến vận mệnh của hắn.<br />\r\nVị qu&iacute; kh&aacute;ch n&agrave;y, c&ugrave;ng hắn c&oacute; mối quan hệ huyết thống rất gần, &ocirc;ng ta ch&iacute;nh l&agrave; tam th&uacute;c ruột của hắn.<br />\r\n<br />\r\nNghe n&oacute;i, trong v&ugrave;ng, tại tửu l&acirc;u ở tiểu th&agrave;nh phụ cận, được nguời ta t&iacute;n nhiệm đề bạt l&agrave;m đại chưởng quĩ, ch&iacute;nh l&agrave; người m&agrave; cha mẹ hắn thường n&oacute;i. H&agrave;n gia trong v&ograve;ng trăm năm trở lại đ&acirc;y, mới lại c&oacute; thể xuất hiện một người như tam th&uacute;c của H&agrave;n Lập.<br />\r\n<br />\r\n&nbsp;</p>', 0, 0),
(5, 18, 'Chương 2: Thanh ngưu trấn', 'chuong-2-thanh-nguu-tran', '<p>Đ&acirc;y l&agrave; một thị th&agrave;nh nhỏ, tuy n&oacute;i l&agrave; một t&ograve;a tiểu th&agrave;nh, nhưng thực ra n&oacute; chỉ to hơn thị trấn b&igrave;nh thường một &iacute;t th&ocirc;i, m&agrave; t&ecirc;n của n&oacute; cũng được gọi l&agrave; Thanh Ngưu trấn, chỉ những kẻ sơn d&atilde; phụ cận &iacute;t kiến thức mới gọi Thanh Ngưu trấn th&agrave;nh Thanh Ngưu thanh m&agrave; th&ocirc;i. C&aacute;ch gọi n&agrave;y cũng đ&atilde; th&agrave;nh th&oacute;i quen mấy chục năm ở đ&acirc;y mất rồi.<br />\r\n<br />\r\nThanh ngưu trấn đ&iacute;ch x&aacute;c kh&ocirc;ng lớn lắm, con đường chủ đạo Thanh ngưu chạy dọc trấn theo hướng Đ&ocirc;ng-T&acirc;y. M&agrave; kh&aacute;ch sạn ở đ&acirc;y th&igrave; cũng chỉ c&oacute; đ&uacute;ng một c&aacute;i Thanh ngưu kh&aacute;ch sạn. Kh&aacute;ch sạn nằm t&iacute;t cuối trấn về ph&iacute;a t&acirc;y. Kh&aacute;ch v&atilde;ng lai qua đ&acirc;y, nếu kh&ocirc;ng muốn phải nằm ngo&agrave;i đường th&igrave; kh&ocirc;ng c&ograve;n c&aacute;ch n&agrave;o kh&aacute;c l&agrave; phải l&agrave;m kh&aacute;ch tại kh&aacute;ch sạn n&agrave;y.<br />\r\n<br />\r\nV&agrave;o l&uacute;c n&agrave;y, nếu ch&uacute; &yacute; ra ngo&agrave;i, từ ph&iacute;a T&acirc;y thị trấn c&oacute; một đo&agrave;n xe ngựa đang tiến v&agrave;o Thanh ngưu trấn. Rất nhanh đo&agrave;n xe đi tới trước cửa Thanh ngưu kh&aacute;ch sạn, đo&agrave;n xe cũng kh&ocirc;ng dừng lại m&agrave; tiếp tục đi sau v&agrave;o trong trấn, đến khi đi tới trước cửa Xu&acirc;n Hương tửu l&acirc;u th&igrave; mới dừng lại.<br />\r\n<br />\r\nXu&acirc;n Hương tửu l&acirc;u cũng kh&ocirc;ng t&iacute;nh l&agrave; lớn, thậm ch&iacute; n&oacute; c&ograve;n c&oacute; d&aacute;ng vẻ hơi cũ cũ, tuy vậy người ta vẫn cảm nhận được từ n&oacute; n&eacute;t g&igrave; đ&oacute; cổ k&iacute;nh. Cũng bởi v&igrave; b&acirc;y giờ đang l&agrave; ch&iacute;nh ngọ, kh&aacute;ch nh&acirc;n d&ugrave;ng bữa tại tửu lầu vẫn c&ograve;n kh&aacute; đ&ocirc;ng đ&uacute;c, cho n&ecirc;n b&ecirc;n trong tửu l&acirc;u hầu như kh&ocirc;ng c&ograve;n chỗ trống nữa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Từ tr&ecirc;n xe xuống l&agrave; một l&atilde;o b&eacute;o mặt tr&ograve;n c&oacute; bộ r&acirc;u quai n&oacute;n dắt theo một đứa trẻ đen đ&uacute;a tầm mười tuổi. Người đ&agrave;n &ocirc;ng n&agrave;y khệnh khạng dẫn tiểu h&agrave;i tử trực tiếp bước v&agrave;o tửu l&acirc;u. Kh&aacute;ch h&agrave;ng trong tửu l&acirc;u cũng c&oacute; người nhận ra l&atilde;o b&eacute;o, biết rằng l&atilde;o l&agrave; chưởng quĩ&nbsp;<em>&quot;H&agrave;n b&eacute;o mập&quot;</em>&nbsp;của tửu l&acirc;u, c&ograve;n tiểu h&agrave;i tử kia th&igrave; kh&ocirc;ng một ai nhận biết ra.<br />\r\n<br />\r\n<em>&quot;L&atilde;o H&agrave;n, t&ecirc;n hắc tiểu tử n&agrave;y m&agrave; lớn l&ecirc;n th&igrave; tr&ocirc;ng giống l&atilde;o lắm đ&acirc;y, kh&ocirc;ng phải l&agrave; l&atilde;o l&eacute;n sau lưng vợ ra ngo&agrave;i trăng gi&oacute; đấy chứ?&quot;</em>&nbsp;Đột nhi&ecirc;n c&oacute; người tr&ecirc;u ghẹo n&oacute;i.</p>\r\n\r\n<p>Một lời vừa n&oacute;i ra, ch&uacute;ng nh&acirc;n b&ecirc;n cạnh lập tức cười to một trận.<br />\r\n<br />\r\n<em>&quot;Phi (Ta nhổ)! Hắn l&agrave; ch&aacute;u ruột của ta, đương nhi&ecirc;n l&agrave; phải c&oacute; v&agrave;i phần giống ta rồi.&quot;</em>&nbsp;L&atilde;o b&eacute;o chẳng những kh&ocirc;ng tức giận, m&agrave; c&ograve;n c&oacute; v&agrave;i phần đắc &yacute;.<br />\r\n<br />\r\nHai người n&agrave;y ch&iacute;nh l&agrave; nh&acirc;n vật ch&iacute;nh H&agrave;n Lập của ch&uacute;ng ta v&agrave; tam th&uacute;c của hắn, được mọi người trong trấn gọi l&agrave;&nbsp;<em>&quot;l&atilde;o H&agrave;n b&eacute;o&quot;</em>&nbsp;vừa đi li&ecirc;n tục ba ng&agrave;y đường mới tới được Thanh ngưu trấn.</p>\r\n\r\n<p>L&atilde;o H&agrave;n mập sau khi n&oacute;i chuyện phiếm dăm ba c&acirc;u với đ&aacute;m kh&aacute;ch nh&acirc;n liền dẫn H&agrave;n Lập đi v&agrave;o ph&iacute;a sau tửu l&acirc;u, tới một t&ograve;a tiểu viện vắng vẻ.<br />\r\n<br />\r\n<em>&quot;Tiểu Lập, ch&aacute;u ở trong ph&ograve;ng n&agrave;y nghỉ ngơi ch&uacute;t đi nh&eacute;, đợi đến khi quản sự nội m&ocirc;n tới, ta sẽ gọi ch&aacute;u tới. Ta b&acirc;y giờ phải đi tiếp đ&atilde;i mấy vị kh&aacute;ch kia một ch&uacute;t&quot;</em>&nbsp;L&atilde;o H&agrave;n mập chỉ v&agrave;o một căn ph&ograve;ng trong nội viện, n&oacute;i một c&aacute;ch h&ograve;a &aacute;i với hắn.<br />\r\n<br />\r\nN&oacute;i xong, liền quay người đi ra ngo&agrave;i.<br />\r\n<br />\r\nVừa ra tới cửa, l&atilde;o cảm thấy c&oacute; ch&uacute;t g&igrave; đ&oacute; kh&ocirc;ng được y&ecirc;n t&acirc;m, liền dặn d&ograve; th&ecirc;m v&agrave;i c&acirc;u.<br />\r\n<br />\r\n<em>&quot;Đừng nghịch ngợm đấy, trong trấn c&oacute; rất nhiều người, tốt nhất l&agrave; đừng ra khỏi tiểu viện.&quot;</em><br />\r\n<br />\r\n<em>&quot;V&acirc;ng!&quot;</em><br />\r\n<br />\r\nNh&igrave;n thấy H&agrave;n Lập ngoan ngo&atilde;n đ&aacute;p ứng, l&atilde;o mới y&ecirc;n t&acirc;m đi ra.</p>\r\n\r\n<p>H&agrave;n Lập nh&igrave;n tam th&uacute;c đi ra khỏi ngo&agrave;i, cảm thấy mệt mỏi, liền nằm lăn ra giường đ&aacute;nh lu&ocirc;n một giấc, cư nhi&ecirc;n kh&ocirc;ng c&oacute; lấy một điểm sợ h&atilde;i thường thấy của một đứa trẻ phải xa nh&agrave;.<br />\r\n<br />\r\nCho đến tận buổi tối th&igrave; c&oacute; một người phục vụ mang cơm đến, tuy kh&ocirc;ng phải l&agrave; thịt ngon c&aacute; b&eacute;o g&igrave; cả, nhưng cũng t&iacute;nh l&agrave; vừa miệng. Sau khi ăn xong th&igrave; người phục vụ lại đến bưng ch&eacute;n b&aacute;t ra ngo&agrave;i. L&uacute;c n&agrave;y tam th&uacute;c của hắn mới đỉnh đương đi đến.<br />\r\n<br />\r\n<em>&quot;Thế n&agrave;o? Thức ăn c&oacute; vừa miệng hay kh&ocirc;ng? Ch&aacute;u c&oacute; nhớ nh&agrave; kh&ocirc;ng?&quot;</em><br />\r\n<br />\r\n<em>&quot;Dạ, c&oacute; ch&uacute;t ch&uacute;t ạ&quot;</em>&nbsp;H&agrave;n Lập ngoan ngo&atilde;n trả lời.<br />\r\n<br />\r\nL&atilde;o H&agrave;n nghe H&agrave;n Lập trả lời xong cảm thấy rất vừa l&ograve;ng, sau đ&oacute; liền c&ugrave;ng hắn n&oacute;i ch&uacute;t chuyện phiếm, rồi h&atilde;nh diện kể lại những kinh nghiệm của l&atilde;o đ&atilde; trải qua cho H&agrave;n Lập nghe. Dần dần, H&agrave;n Lập kh&ocirc;ng c&ograve;n cảm thấy g&ograve; b&oacute;, hắn bắt đầu c&ugrave;ng tam th&uacute;c cười n&oacute;i với nhau đủ chuyện.<br />\r\n<br />\r\nCứ như vậy, hai ng&agrave;y tiếp theo từ từ tr&ocirc;i qua.<br />\r\n<br />\r\nĐến ng&agrave;y thứ ba, ngay l&uacute;c H&agrave;n Lập vừa ăn cơm chiều xong, đang đợi tam th&uacute;c đến n&oacute;i chuyện về giang hồ cố sự th&igrave; lại c&oacute; một cỗ xe ngựa dừng lại trước cửa tửu l&acirc;u.<br />\r\n<br />\r\nChiếc xe ngựa n&agrave;y to&agrave;n th&acirc;n đen tuyền, loại xe như thế n&agrave;y kh&ocirc;ng phải l&agrave; thường thấy, đặc biệt, g&acirc;y ch&uacute; &yacute; nhất ch&iacute;nh l&agrave; trước xe c&oacute; gắn một l&aacute; cờ nhỏ m&agrave;u đen. Tr&ecirc;n l&aacute; cờ c&oacute; th&ecirc;u chữ&nbsp;<em>&quot;Huyền&quot;</em>&nbsp;m&agrave;u trắng, viền hồng. N&oacute; mang lại cho người ta một cảm gi&aacute;c thần b&iacute; kh&oacute; n&oacute;i.<br />\r\n&nbsp;</p>\r\n\r\n<p><iframe height=\"0\" id=\"ads-place-2027505\" sandbox=\"\" scrolling=\"no\" src=\"javascript:if(typeof(admSspPageRg)!=\'undefined\'){admSspPageRg.draw(2027505);}else{parent.admSspPageRg.draw(2027505);}\" width=\"0\"></iframe></p>\r\n\r\n<p>Nh&igrave;n thấy l&aacute; cờ nhỏ n&agrave;y, ph&agrave;m l&agrave; c&aacute;c tay giang hồ trong phương vi&ecirc;n trăm dặm th&igrave; đều biết, tại địa phương n&agrave;y c&oacute; nh&acirc;n vật trọng yếu của m&ocirc;n ph&aacute;i đứng nhất nh&igrave; trong v&ugrave;ng&nbsp;<em><em>&quot;Thất huyền m&ocirc;n&quot;</em></em>&nbsp;gi&aacute; l&acirc;m.<br />\r\n<br />\r\n<em><em>&quot;Thất huyền m&ocirc;n&quot;</em></em>&nbsp;c&ograve;n được gọi l&agrave;&nbsp;<em>&quot;Thất tuyệt m&ocirc;n&quot;</em>, m&ocirc;n ph&aacute;i n&agrave;y được&nbsp;<em>&quot;thất tuyệt thượng nh&acirc;n&quot;</em>&nbsp;danh tiếng lẫy lừng s&aacute;ng lập ra c&aacute;ch đ&acirc;y hơn hai trăm năm. M&ocirc;n ph&aacute;i n&agrave;y đ&atilde; từng đứng đầu K&iacute;nh Ch&acirc;u hơn mười năm, thậm ch&iacute; c&ograve;n lan tới Sổ Ch&acirc;u b&ecirc;n cạnh, thanh danh trong nước cũng l&ecirc;n cao ch&oacute;t v&oacute;t. Tuy nhi&ecirc;n, từ khi&nbsp;<em>&quot;Thất tuyệt ch&acirc;n nh&acirc;n&quot;</em>&nbsp;bệnh chết, thế lực&nbsp;<em><em>&quot;thất huyền m&ocirc;n&quot;</em></em>&nbsp;tựa như rớt xuống ng&agrave;n trượng, bị mấy m&ocirc;n ph&aacute;i kh&aacute;c li&ecirc;n thủ đẩy ra khỏi thủ phủ K&iacute;nh Ch&acirc;u th&agrave;nh. Hơn trăm năm trước, t&ocirc;ng m&ocirc;n đ&atilde; bị bức b&aacute;ch di chuyển đến địa điểm vắng vẻ ti&ecirc;u điều nhất của K&iacute;nh Ch&acirc;u &ndash; Th&aacute;i H&agrave; sơn, từ đ&oacute; về sau&nbsp;<em><em>&quot;thất huyền m&ocirc;n&quot;</em></em>&nbsp;đ&atilde; b&aacute;m rễ tại chỗ n&agrave;y, rớt xuống tam lưu tiểu thế lực ở địa phương.<br />\r\n<br />\r\nC&oacute; một c&acirc;u n&oacute;i rất đ&uacute;ng, lạc đ&agrave; gầy th&igrave; vẫn c&ograve;n hơn con ngựa to b&eacute;o, Thất huyền m&ocirc;n d&ugrave; sao th&igrave; cũng đ&atilde; từng l&agrave; một đại m&ocirc;n ph&aacute;i, tiềm lực b&ecirc;n trong th&igrave; kh&ocirc;ng thể xem nhỏ được. Ngay lập tức đ&atilde; kh&ocirc;ng chế hơn chục tiểu trấn xung quanh Thanh ngưu trấn, c&oacute; hơn ba bốn ng&agrave;n đệ tử, l&agrave; một trong những b&aacute; chủ ở đ&acirc;y.<br />\r\n<br />\r\nTại đ&acirc;y, bang ph&aacute;i duy nhất c&oacute; khả năng đối kh&aacute;ng lại Thất huyền m&ocirc;n l&agrave; D&atilde; lang bang.<br />\r\n<br />\r\nD&atilde; lang bang tiền th&acirc;n vốn l&agrave; đ&aacute;m m&atilde; tặc chuy&ecirc;n đốt ph&aacute;, cướp b&oacute;c trong địa phận K&iacute;nh ch&acirc;u, sau n&agrave;y do bị quan binh đuổi giết, một bộ phận theo h&agrave;ng quan phủ, bộ phận c&ograve;n lại h&igrave;nh th&agrave;nh l&ecirc;n D&atilde; lang bang ng&agrave;y nay. Nhưng, sự hung hăng t&agrave;n &aacute;c của m&atilde; tặc đ&atilde; thấm v&agrave;o m&aacute;u, bọn ch&uacute;ng liều lĩnh cướp ph&aacute;, giết người kh&ocirc;ng g&igrave; l&agrave; kh&ocirc;ng d&aacute;m. Cho n&ecirc;n, khi Thất huyền m&ocirc;n v&agrave; D&atilde; lang bang c&oacute; xung đột th&igrave; Thất huyền m&ocirc;n cũng chỉ nằm ở thế hạ phong m&agrave; th&ocirc;i.</p>\r\n\r\n<p>D&atilde; lang bang khống chế hương trấn nhiều hơn hẳn, nhưng những trấn n&agrave;y lại kh&ocirc;ng thể kinh doanh, cho n&ecirc;n khi luận về ph&uacute; t&uacute;c th&igrave; c&ograve;n xa mới theo kịp những th&agrave;nh trấn thuộc về Thất huyền m&ocirc;n. D&atilde; lang bang thập phần th&egrave;m muốn địa b&agrave;n mầu mỡ của Thất huyền m&ocirc;n, cho n&ecirc;n thương xuy&ecirc;n khơi m&agrave;o cuộc chiến giữa hai b&ecirc;n. Việc n&agrave;y đ&atilde; l&agrave;m cho Thất huyền m&ocirc;n m&ocirc;n chủ hiện h&agrave;nh đau đầu kh&ocirc;ng &iacute;t, v&agrave; n&oacute; cũng ch&iacute;nh l&agrave; nguy&ecirc;n nh&acirc;n khiến cho gần mười năm nay, Thất huyền m&ocirc;n li&ecirc;n tục chi&ecirc;u thu nội đệ tử.<br />\r\n<br />\r\nTừ tr&ecirc;n xe ngựa nhảy xuống một h&aacute;n tử cao gầy tầm bốn mươi tuổi, động t&aacute;c của h&aacute;n tử n&agrave;y rất nhanh nhẹn, thể hiện bản lĩnh kh&ocirc;ng hề yếu k&eacute;m, tựa hồ đối với chỗ n&agrave;y rất quen thuộc. Trực tiếp đi thẳng v&agrave;o căn ph&ograve;ng b&ecirc;n trong.<br />\r\n<br />\r\nH&agrave;n Lập tam th&uacute;c vừa nh&igrave;n thấy người mới đến, lập tức cung k&iacute;nh l&agrave;m lễ.<br />\r\n<br />\r\n<em>&quot;Vương hộ ph&aacute;p, l&atilde;o nh&acirc;n gia ng&agrave;i thế n&agrave;o lại tự th&acirc;n dẫn người tới vậy?&quot;</em><br />\r\n<br />\r\n<em>&quot;Hừ!&quot;</em>&nbsp;Vương hộ ph&aacute;p hừ lạnh một tiếng, vẻ mặt rất ngạo mạn.<br />\r\n<br />\r\n<em>&quot;Trong khoảng thời gian kh&ocirc;ng y&ecirc;n ổn n&agrave;y, cần phải gia tăng ph&ograve;ng vệ, trưởng l&atilde;o lệnh cho ta tự th&acirc;n thống lĩnh nh&acirc;n lực, bớt n&oacute;i linh tinh đi, tiểu h&agrave;i tử n&agrave;y c&oacute; phải l&agrave; người m&agrave; ngươi tiến cử?&quot;</em><br />\r\n<br />\r\n<em>&quot;Đ&uacute;ng vậy, đ&uacute;ng vậy, hắn vốn l&agrave; ch&aacute;u ruột của ta, mong rằng tr&ecirc;n đường đi Vương hộ ph&aacute;p chiếu cố tới hắn một ch&uacute;t.&quot;</em><br />\r\n<br />\r\nL&atilde;o H&agrave;n mập thấy thần sắc h&aacute;n tử c&oacute; vẻ bất m&atilde;n, liền nhanh nhẹn lấy từ trong người ra một c&aacute;i t&uacute;i nặng nặng, k&iacute;n đ&aacute;o đặt v&agrave;o tay.<br />\r\n<br />\r\nVương hộ ph&aacute;p n&acirc;ng n&acirc;ng c&aacute;i t&uacute;i, thần sắc c&oacute; ch&uacute;t h&ograve;a ho&atilde;n xuống.<br />\r\n<br />\r\n<em>&quot;L&atilde;o H&agrave;n mập, ngươi biết c&aacute;ch l&agrave;m người đấy! Ta nhất định sẽ chiếu cố ch&aacute;u ngươi tr&ecirc;n đường rồi. Thời gian kh&ocirc;ng c&ograve;n sớm nữa, khẩn trương l&ecirc;n đường th&ocirc;i.&quot;</em></p>', 0, 0),
(6, 18, 'Chương 3: Thất huyền môn', 'chuong-3-that-huyen-mon', '<p>Kh&ocirc;ng kh&iacute; trong xe kh&ocirc;ng được trong l&agrave;nh cho lắm, điều n&agrave;y cũng phải th&ocirc;i, hơn ba chục tiểu h&agrave;i tử chen ch&uacute;c trong một chiếc xe. Tuy n&oacute;i l&agrave; tiểu h&agrave;i tử nhỏ hơn nhiều so với người trưởng th&agrave;nh, nhưng với số lương thế n&agrave;y, cũng đủ để l&agrave;m bầu kh&ocirc;ng kh&iacute; trong xe trở n&ecirc;n kh&oacute; thở.<br />\r\n<br />\r\nH&agrave;n Lập tinh ranh đ&atilde; chui ngay v&agrave;o một g&oacute;c nằm s&acirc;u trong xe, len l&eacute;n đ&aacute;nh gi&aacute; mấy tiểu h&agrave;i đồng c&ograve;n lại trong xe.<br />\r\nTới tham gia kỳ khảo th&iacute; nhập m&ocirc;n lần n&agrave;y, từ c&aacute;ch ăn mặc, ăn n&oacute;i dễ d&agrave;ng nhận thấy c&oacute; ba dạng người.<br />\r\n<br />\r\nLoại người thứ nhất ngồi ở giữa xe, đang bị đ&aacute;m trẻ con v&acirc;y quanh ủng hộ. Thiếu ni&ecirc;n mặc cẩm y ch&iacute;nh l&agrave; thuộc dạng người thứ nhất n&agrave;y.</p>\r\n\r\n<p>Thiếu ni&ecirc;n n&agrave;y t&ecirc;n gọi l&agrave; Vũ Nham, năm nay mới mười ba tuổi, l&agrave; đứa trẻ lớn tuổi nhất ở trong xe l&uacute;c n&agrave;y. Vốn tuổi của hắn đ&atilde; vượt qu&aacute; qui định, nhưng hắn c&oacute; một vị biểu tỷ được gả cho một nh&acirc;n vật c&oacute; đại quyền trong Thất huyền m&ocirc;n, n&ecirc;n cho d&ugrave; vượt qu&aacute; tuổi qui định th&igrave; cũng kh&ocirc;ng phải l&agrave; vấn đề g&igrave; to t&aacute;t. Gia đ&igrave;nh Vũ Nham mở một v&otilde; qu&aacute;n, gia trung c&oacute; ch&uacute;t gi&agrave;u c&oacute;, tuổi tuy c&ograve;n nhỏ nhưng cũng đ&atilde; c&oacute; tập v&otilde; qua. C&ocirc;ng phu tuy kh&ocirc;ng lấy l&agrave;m cao minh cho lắm, nhưng để đối ph&oacute; lại với những đứa b&eacute; một điểm kh&iacute; lực cũng kh&ocirc;ng c&oacute; như H&agrave;n Lập th&igrave; c&oacute; lẽ l&agrave; dư sức.<br />\r\n<br />\r\nRất hiển nhi&ecirc;n, loại người như Vũ Nham c&oacute; tiền, c&oacute; thế, tự nhi&ecirc;n sẽ trở th&agrave;nh&nbsp;<em>&quot;đại ca&quot;</em>&nbsp;của đại bộ phận đ&aacute;m tiểu h&agrave;i tử trong xe.</p>\r\n\r\n<p>Một loại người kh&aacute;c tựu l&agrave; những h&agrave;i đồng ủng hộ Vũ Nham. Những h&agrave;i đồng n&agrave;y xuất th&acirc;n từ đủ loại gia cảnh như c&oacute; người trong nh&agrave; c&oacute; cửa h&agrave;ng, c&oacute; người th&igrave; phải đi l&agrave;m c&ocirc;ng&hellip; n&oacute;i chung những h&agrave;i tử n&agrave;y đều c&oacute; điểm chung: đều lớn l&ecirc;n trong th&agrave;nh trấn, c&oacute; cơ hội &iacute;t nhiều quan s&aacute;t c&aacute;ch xử sự những người c&oacute; học vấn, trục lợi nhi h&agrave;nh (c&oacute; lợi th&igrave; l&agrave;m) đ&atilde; th&agrave;nh bản sự rồi. Do đ&oacute; m&agrave; những đứa trẻ n&agrave;y dốc sức ủng hộ Vũ Nham, cứ một điều&nbsp;<em><em>&quot;Vũ thiếu gia&quot;</em></em>&nbsp;hai điều&nbsp;<em><em>&quot;Vũ thiếu gia&quot;</em></em>&nbsp;m&agrave; gọi. Vũ Nham trước sự t&ocirc;n vinh của bọn trẻ như vậy cũng coi như b&igrave;nh thường, hắn c&ograve;n c&oacute; cảm gi&aacute;c hưởng thụ sự t&ocirc;n vinh đ&oacute;.<br />\r\n<br />\r\nC&ograve;n loại người cuối c&ugrave;ng, tất nhi&ecirc;n l&agrave; dạng người giống như H&agrave;n Lập. Loại người n&agrave;y đến từ v&ugrave;ng đất hoang vu hẻo l&aacute;nh, gia cảnh hầu như đều bần h&agrave;n, c&oacute; g&igrave; ăn đ&oacute;. Loại người như vậy trong xe rất l&agrave; &iacute;t, chỉ c&oacute; tầm năm s&aacute;u đứa trẻ m&agrave; th&ocirc;i. Thần th&aacute;i của bọn ch&uacute;ng đa phần l&agrave; e d&egrave;, kh&ocirc;ng d&aacute;m n&oacute;i năng với ai c&aacute;i g&igrave;, chỉ ngồi m&agrave; nh&igrave;n người kh&aacute;c n&oacute;i cười m&agrave; th&ocirc;i. Những tiểu h&agrave;i tử n&agrave;y c&ugrave;ng với những đứa trẻ đang huy&ecirc;n n&aacute;o c&ograve;n lại tạo th&agrave;nh một khung cảnh đối lập.<br />\r\n<br />\r\nXe ngựa xuất ph&aacute;t từ Thanh ngưu trấn theo hướng T&acirc;y m&agrave; thẳng tiến, tr&ecirc;n lộ tr&igrave;nh c&ograve;n đi qua th&ecirc;m v&agrave;i địa phương nữa, cũng tiếp th&ecirc;m v&agrave;i tiểu h&agrave;i đồng nữa. Cuối c&ugrave;ng đến chiều ng&agrave;y thứ năm th&igrave; cũng đi tới được Th&aacute;i H&agrave; sơn &ndash; tổng m&ocirc;n của Thất huyền m&ocirc;n.<br />\r\n<br />\r\nHầu hết tiểu h&agrave;i tử khi xuống xe đều bị cảnh quan tươi đẹp của Th&aacute;i H&agrave; sơn l&agrave;m cho m&ecirc; mẩn. Chỉ đến khi Vương hộ ph&aacute;p l&ecirc;n tiếng th&uacute;c giục, mọi người mới thanh tỉnh trở lại rồi tiếp tục đi tới.<br />\r\n<br />\r\nTh&aacute;i H&agrave; sơn nguy&ecirc;n danh gọi l&agrave; Lạc Phượng sơn, tương truyền rằng nơi đ&acirc;y từng c&oacute; một con phượng ho&agrave;ng ngũ sắc rớt xuống đ&acirc;y rồi h&oacute;a th&agrave;nh ngọn n&uacute;i n&agrave;y. Sau n&agrave;y, người ta ph&aacute;t hiện cảnh sắc ngọn n&uacute;i n&agrave;y v&agrave;o l&uacute;c mặt trời xuống th&igrave; tr&ocirc;ng đẹp v&ocirc; c&ugrave;ng, như l&agrave; c&oacute; đ&aacute;m m&acirc;y hồng bao phủ tr&ecirc;n đỉnh n&uacute;i, do vậy m&agrave; ngọn n&uacute;i bị người ta đổi t&ecirc;n th&agrave;nh Th&aacute;i H&agrave; sơn. Đương nhi&ecirc;n, ngọn n&uacute;i n&agrave;y từ sau khi bị Thất huyền m&ocirc;n chiếm cứ, người ngo&agrave;i đ&atilde; kh&ocirc;ng c&ograve;n cơ hội thưởng ngoạn cảnh đẹp ở đ&acirc;y.<br />\r\n<br />\r\nTh&aacute;i H&agrave; sơn l&agrave; một trong những ngọn n&uacute;i lớn của K&iacute;nh ch&acirc;u, ngo&agrave;i trừ t&ograve;a B&aacute;ch m&atilde;ng sơn, th&igrave; ngọn n&uacute;i n&agrave;y chiếm diện t&iacute;ch lớn nhất, phương vi&ecirc;n mười dặm quanh ngọn n&uacute;i n&agrave;y đều l&agrave; n&uacute;i non chập tr&ugrave;ng. T&iacute;nh ra tr&ecirc;n n&uacute;i n&agrave;y c&oacute; hơn mười sơn phong (đỉnh n&uacute;i) to nhỏ. Hầu hết ch&uacute;ng đều chiếm vị tr&iacute; v&ocirc; c&ugrave;ng hiểm yếu, do đ&oacute; đều bị người của c&aacute;c ph&acirc;n đường Thất huyền m&ocirc;n chiếm cứ. Đỉnh n&uacute;i ch&iacute;nh của Th&aacute;i H&agrave; sơn l&agrave;&nbsp;<em>&quot;Lạc Nhật phong&quot;</em>&nbsp;c&agrave;ng hiểm &aacute;c v&ocirc; c&ugrave;ng, chẳng những n&oacute; l&agrave; đỉnh cao nhất, m&agrave; ở đ&oacute; cũng chỉ c&oacute; duy nhất một con đường độc dạo dẫn l&ecirc;n n&uacute;i, do vậy m&agrave; Thất huyền m&ocirc;n đem tổng đ&agrave;n đặt l&ecirc;n đỉnh n&uacute;i n&agrave;y. C&ograve;n đường n&agrave;y kh&ocirc;ng những hiểm trở, m&agrave; dọc theo con đường Thất huyền m&ocirc;n c&ograve;n thiết lập mười ba trạm g&aacute;c cả minh cả &aacute;m, c&oacute; thể n&oacute;i l&agrave; vạn v&ocirc; nhất thất (ng&agrave;n vạn c&aacute;i cũng kh&ocirc;ng để lọt mất c&aacute;i n&agrave;o), kh&ocirc;ng c&oacute; g&igrave; để phải lo lắng.<br />\r\n<br />\r\nH&agrave;n Lập đang nh&igrave;n ng&oacute; bốn xung quanh, bỗng nhi&ecirc;n thấy ph&iacute;a trước mọi người đều dừng lại, tiếp đ&oacute; một &acirc;m thanh h&agrave;o sảng truyền đến.<br />\r\n<br />\r\n<em>&quot;Vương l&atilde;o đệ, c&oacute; chuyện g&igrave; m&agrave; đến b&acirc;y giờ mới đến nơi? So với dự định th&igrave; trễ mất hai ng&agrave;y thời gian rồi.&quot;</em><br />\r\n<br />\r\n<em>&quot;Nhạc đường chủ, tr&ecirc;n đường đi c&oacute; ch&uacute;t chậm trễ, phiền ng&agrave;i để t&acirc;m rồi.&quot;</em>&nbsp;Vương hộ ph&aacute;p đứng đầu đ&aacute;m người, cung k&iacute;nh hướng tới một vị l&atilde;o giả mặt mũi hồng h&agrave;o thi lễ. Bộ mặt ngang t&agrave;ng khi đi đường của hắn đ&atilde; được thay bằng một bộ mặt tr&ocirc;ng rất siểm nịnh.<br />\r\n<br />\r\n<em>&quot;Đ&acirc;y l&agrave; nh&oacute;m đệ tử thứ mấy được đưa đến vậy?&quot;</em><br />\r\n<br />\r\n<em>&quot;L&agrave; nh&oacute;m thứ mười bảy.&quot;</em><br />\r\n<br />\r\n<em>&quot;&Acirc;n!&quot;</em>&nbsp;vị Nhạc đường chủ n&agrave;y khinh khỉnh nh&igrave;n xuống đ&aacute;m tiểu h&agrave;i tử H&agrave;n Lập.<br />\r\n<br />\r\n<em>&quot;Đưa đến Thanh kh&aacute;ch viện, để bọn ch&uacute;ng nghỉ ngơi một đ&ecirc;m cho tốt, s&aacute;ng mai bắt đầu chọn lựa đệ tử rồi. Một khi bị loại, phải sớm đưa bọn ch&uacute;ng xuống n&uacute;i, đừng để phạm v&agrave;o qui định của bản m&ocirc;n.</em></p>\r\n\r\n<p><em>&quot;</em>Tu&acirc;n mệnh, Nhạc đường chủ!&quot;<br />\r\n<br />\r\nĐược đi tr&ecirc;n con đường đ&aacute; dẫn l&ecirc;n n&uacute;i, đ&aacute;m tiểu h&agrave;i tử đều hưng phấn m&atilde;i kh&ocirc;ng th&ocirc;i, nhưng cũng chưa c&oacute; ai d&aacute;m lớn tiếng n&oacute;i chuyện. Tuy bọn ch&uacute;ng đều chưa trưởng th&agrave;nh, nhưng cũng nhận biết được nơi n&agrave;y sẽ quyết định vận mệnh tương lai của m&igrave;nh.<br />\r\n<br />\r\nVương hộ ph&aacute;p vừa đi trước dẫn đường, vừa tươi cười ch&agrave;o hỏi những người gặp tr&ecirc;n đường. C&oacute; thể nh&igrave;n ra hắn tại m&ocirc;n nội quen biết kh&aacute; nhiều người, cho n&ecirc;n con đường sau n&agrave;y của hắn cũng kh&aacute; lạc quan.<br />\r\n<br />\r\nDọc đường chỉ thấy mọi người ở đ&acirc;y đều mặc &aacute;o b&oacute; ngắn m&agrave;u xanh, tr&ecirc;n th&acirc;n hoặc đeo đao, hoặc dắt kiếm, cũng thỉnh thoảng c&oacute; người đi tay kh&ocirc;ng nhưng ở thắt lưng phồng phồng l&ecirc;n, kh&oacute; m&agrave; đo&aacute;n biết được ở đ&oacute; l&agrave; c&aacute;i g&igrave;. Từ cử chỉ h&agrave;nh vi, c&oacute; thể nh&igrave;n ra người đ&oacute; th&acirc;n thủ mạnh mẽ, chắc hẳn phải mang trong m&igrave;nh một th&acirc;n c&ocirc;ng phu kh&ocirc;ng sai.<br />\r\n<br />\r\nH&agrave;n Lập được người ta dẫn đến một đỉnh n&uacute;i thấp nhỏ, tr&ecirc;n đỉnh n&uacute;i c&oacute; sẵn một căn thổ ph&ograve;ng. H&agrave;n Lập được cho ngủ qua đ&ecirc;m ở đ&acirc;y để đến ng&agrave;y mai chờ người dẫn đi. Trong giấc mộng, H&agrave;n Lập mơ thấy m&igrave;nh mặc cẩm y, tay cầm kim kiếm, th&acirc;n ho&agrave;i tuyệt kỹ v&otilde; c&ocirc;ng, đ&aacute;nh cho con l&atilde;o thợ r&egrave;n trong l&agrave;ng m&agrave; ng&agrave;y trước hắn kh&ocirc;ng đ&aacute;nh nổi một trận no n&ecirc;, hết cả uy phong, đến tận ng&agrave;y thứ hai vẫn chưa đứng l&ecirc;n nổi.<br />\r\n<br />\r\nKhi trời vừa s&aacute;ng, Vương hộ ph&aacute;p cũng kh&ocirc;ng để mọi người được ăn bữa s&aacute;ng, trực tiếp đem ch&uacute;ng nh&acirc;n dẫn xuống n&uacute;i, tới trước một khu rừng tr&uacute;c rậm rạp. Tại đ&acirc;y, ngo&agrave;i vị đường chủ họ Nhạc đ&atilde; gặp ng&agrave;y h&ocirc;m qua c&ograve;n c&oacute; mấy người thanh ni&ecirc;n lạ kh&aacute;c đ&atilde; đứng chờ s&atilde;n.</p>', 0, 0),
(7, 17, 'Chương 1: Đại Hoang', 'chuong-1-dai-hoang', '<p>Đ&ecirc;m đ&atilde; về khuya, b&oacute;ng tối phủ k&iacute;n khắp nơi, bao tr&ugrave;m l&ecirc;n cảnh vật. Thế nhưng trong n&uacute;i lại chẳng hề y&ecirc;n tĩnh, tiếng m&atilde;nh th&uacute; r&iacute;t g&agrave;o rung động cả non s&ocirc;ng, c&acirc;y cối rung l&ecirc;n, l&aacute; bay t&aacute;n loạn.</p>\r\n\r\n<p>Chốn rừng n&uacute;i m&ecirc;nh mang l&agrave; nơi hoạt động của v&ocirc; số m&atilde;nh th&uacute; hồng hoang c&ugrave;ng những chủng tộc s&oacute;t lại từ thời Th&aacute;i Cổ. Tiếng k&ecirc;u đ&aacute;ng sợ của mu&ocirc;n lo&agrave;i rống l&ecirc;n trong b&oacute;ng tối, khiến mặt đất như muốn nứt to&aacute;c ra.</p>\r\n\r\n<p>Từ trong d&atilde;y n&uacute;i tr&ocirc;ng xa thấy c&oacute; thấp tho&aacute;ng một quầng s&aacute;ng nhu h&ograve;a, tựa như một ngọn nến lập l&ograve;e dưới m&agrave;n đ&ecirc;m đen v&ocirc; tận, lẩn khuất giữa mu&ocirc;n tr&ugrave;ng n&uacute;i, &aacute;nh s&aacute;ng dường như c&oacute; thể vụt tắt bất cứ l&uacute;c n&agrave;o.</p>\r\n\r\n<p>Đến gần hơn, c&oacute; thể thấy r&otilde; ở đ&oacute; c&oacute; một nửa th&acirc;n c&acirc;y kh&ocirc; khổng lồ, đường k&iacute;nh th&acirc;n c&acirc;y ước chừng hơn chục m&eacute;t, to&agrave;n th&acirc;n ch&aacute;y đen, ngoại trừ một nửa th&acirc;n c&acirc;y n&agrave;y, chỉ c&ograve;n lại một c&agrave;nh c&acirc;y yếu ớt nhưng lại tỏa ra sức sống. L&aacute; c&acirc;y lung linh như được khắc từ lục ngọc, t&aacute;n ph&aacute;t từng đốm s&aacute;ng nhu h&ograve;a bao tr&ugrave;m lấy cả một th&ocirc;n l&agrave;ng.</p>\r\n\r\n<p>N&oacute;i một c&aacute;ch ch&iacute;nh x&aacute;c th&igrave; đ&acirc;y l&agrave; một th&acirc;n c&acirc;y s&eacute;t đ&aacute;nh, rất nhiều năm về trước n&oacute; từng gặp phải một trận s&eacute;t th&ocirc;ng thi&ecirc;n, v&ograve;m c&acirc;y um t&ugrave;m c&ugrave;ng sức sống tr&agrave;n trề của gốc liễu gi&agrave; đ&atilde; bị sấm s&eacute;t ph&aacute; hủy. Nay chỉ c&ograve;n lại một đoạn gốc cao chừng t&aacute;m ch&iacute;n m&eacute;t trồi l&ecirc;n mặt đất, đường k&iacute;nh rộng kinh người, c&agrave;nh liễu duy nhất s&oacute;t lại kia tr&ocirc;ng như sợi x&iacute;ch thần bằng m&acirc;y lục b&iacute;ch, h&agrave;o quang ngập tr&agrave;n bao tr&ugrave;m che chở cho cả th&ocirc;n l&agrave;ng, khiến mảnh đất n&agrave;y trở n&ecirc;n m&ocirc;ng lung như một v&ugrave;ng ti&ecirc;n thổ, trong chốn đại hoang cảm gi&aacute;c v&ocirc; c&ugrave;ng thần b&iacute;.</p>\r\n\r\n<p>Nh&agrave; nh&agrave; trong th&ocirc;n đều x&acirc;y bằng đ&aacute;. Đ&ecirc;m khuya thanh vắng, vẻ an l&agrave;nh y&ecirc;n ả của chốn n&agrave;y dường như t&aacute;ch biệt hẳn với b&oacute;ng tối c&ugrave;ng tiếng m&atilde;nh th&uacute; g&agrave;o th&eacute;t b&ecirc;n ngo&agrave;i.</p>\r\n\r\n<p>&quot;H&uacute; uuuuu&hellip;.&quot;</p>\r\n\r\n<p>Một trận cuồng phong thổi qua, c&oacute; đ&aacute;m m&acirc;y đen khổng lồ vắt ngang trời, che k&iacute;n cả m&agrave;n đ&ecirc;m, chắn nốt ch&uacute;t x&iacute;u &aacute;nh sao yếu ớt khiến d&atilde;y n&uacute;i c&agrave;ng th&ecirc;m tăm tối.</p>\r\n\r\n<p>Một tiếng chim k&ecirc;u hung tợn từ tr&ecirc;n cao vọng xuống, tiếng k&ecirc;u sắc lẻm c&oacute; sức xuy&ecirc;n thấu mạnh, kh&ocirc;ng ngờ lại bắt nguồn từ đ&aacute;m m&acirc;y đen kia. Nh&igrave;n kỹ, th&igrave; ra đ&oacute; l&agrave; một con chim khổng lồ to đến kh&ocirc;ng tưởng, che lấp trăng sao, d&agrave;i kh&ocirc;ng biết bao nhi&ecirc;u dặm.</p>\r\n\r\n<p>Đi qua Thạch Th&ocirc;n, n&oacute; c&uacute;i đầu nh&igrave;n xuống, hai con mắt tựa như hai vầng trăng m&aacute;u, hung kh&iacute; ng&uacute;t trời. N&oacute; nh&igrave;n chằm chằm gốc liễu gi&agrave; trong chốc l&aacute;t, cuối c&ugrave;ng bay về ph&iacute;a s&acirc;u nhất trong d&atilde;y n&uacute;i.</p>\r\n\r\n<p>Y&ecirc;n ắng một l&uacute;c l&acirc;u m&atilde;i cho đến tận nửa đ&ecirc;m, mặt đất bắt đầu rung chuyển. Một b&oacute;ng d&aacute;ng mơ hồ từ phương xa bước tới, cao ngang đỉnh n&uacute;i!</p>\r\n\r\n<p>Một hơi thở k&igrave; lạ lan tỏa, n&uacute;i rừng lặng ngắt một c&aacute;ch chết ch&oacute;c, hung cầm m&atilde;nh th&uacute; c&uacute;i rạp m&igrave;nh kh&ocirc;ng d&aacute;m ph&aacute;t ra một ch&uacute;t x&iacute;u &acirc;m thanh.</p>\r\n\r\n<p>Lại gần, đ&acirc;y l&agrave; một sinh vật c&oacute; h&igrave;nh người, d&aacute;ng đứng thẳng, n&oacute; cao lớn v&ocirc; c&ugrave;ng, s&aacute;nh ngang đỉnh n&uacute;i, to&agrave;n th&acirc;n n&oacute; kh&ocirc;ng c&oacute; l&ocirc;ng t&oacute;c g&igrave; m&agrave; d&agrave;y đặc một lớp vảy v&agrave;ng kim lấp l&aacute;nh. Mặt n&oacute; phẳng l&igrave;, chỉ c&oacute; một con mắt thẳng, mỗi lần chớp mở như c&oacute; &aacute;nh s&eacute;t v&agrave;ng kim rạch qua, sắc b&eacute;n gh&ecirc; người. To&agrave;n th&acirc;n n&oacute; huyết kh&iacute; m&ecirc;nh m&ocirc;ng, tựa như một vị thần ma!</p>\r\n\r\n<p>N&oacute; đi ngang qua chốn n&agrave;y, liếc nh&igrave;n gốc liễu, tho&aacute;ng dừng ch&acirc;n rồi dường như đang vội v&atilde; l&ecirc;n đường, cuối c&ugrave;ng nhanh ch&oacute;ng bỏ đi. V&ocirc; v&agrave;n ngọn n&uacute;i như đang r&ecirc;n rỉ dưới từng bước ch&acirc;n của n&oacute;, cả chốn n&uacute;i rừng cũng bị uy thế ấy l&agrave;m cho run rẩy.</p>\r\n\r\n<p>B&igrave;nh minh l&ecirc;n, một con rết d&agrave;i mười m&eacute;t, th&acirc;n to như th&ugrave;ng nước, tỏa &aacute;nh s&aacute;ng bạc lấp l&aacute;nh b&ograve; ngoằn ngo&egrave;o trong n&uacute;i. Con rết như được đ&uacute;c từ bạc trắng, mỗi một đốt đều s&aacute;ng b&oacute;ng dữ dằn, đập v&agrave;o đ&aacute; n&uacute;i rầm rầm, tia lửa bắn tung t&oacute;e. Nhưng cuối c&ugrave;ng n&oacute; lại tr&aacute;nh qua Thạch Th&ocirc;n m&agrave; kh&ocirc;ng hề x&acirc;m nhập, nơi n&oacute; đi qua sương đen mịt m&ugrave;, mu&ocirc;ng th&uacute; đều lẩn tr&aacute;nh.</p>\r\n\r\n<p>Một c&agrave;nh liễu mảnh mai tỏa &aacute;nh s&aacute;ng b&iacute;ch h&agrave; &oacute;ng &aacute;nh khẽ đung đưa trong gi&oacute;&hellip;.</p>\r\n\r\n<p>&nbsp;</p>', 0, 0),
(8, 16, 'Chương 1: Nhân phẩm có vấn đề (1)', 'chuong-1-nhan-pham-co-van-de-1', '<p>- Ưm, ta đang ở nơi n&agrave;o thế n&agrave;y?<br />\r\n<br />\r\nLắc lư c&aacute;i đầu vừa tỉnh lại sau khi ch&igrave;m v&agrave;o h&ocirc;n m&ecirc;, Lục Thiếu Du cảm thấy xung quanh m&igrave;nh rất ẩm ướt, hơn nữa to&agrave;n th&acirc;n đau nhức như muốn t&ecirc; liệt, gi&oacute; từ bốn ph&iacute;a thổi qua, tạt v&agrave;o người hắn khiến hắn kh&ocirc;ng nhịn được m&agrave; r&ugrave;ng m&igrave;nh một c&aacute;i.<br />\r\n<br />\r\nĐầu Lục Thiếu Du to&aacute;t mồ h&ocirc;i lạnh, hắn vội v&agrave;ng mở cho&agrave;ng mắt. Kh&ocirc;ng gian xung quanh chỉ l&agrave; một mảnh đen kịt, tr&ecirc;n kh&ocirc;ng trung, một vầng trăng lưỡi liềm đang treo lơ lửng. Sau một l&aacute;t, mượn &aacute;nh s&aacute;ng yếu ớt ph&aacute;t ra từ mặt trăng hắn mới nh&igrave;n được cảnh vật r&otilde; r&agrave;ng hơn một ch&uacute;t. Hiện tại hắn đang ở trong một đầm nước, l&uacute;c n&agrave;y hẳn l&agrave; ban đ&ecirc;m.</p>\r\n\r\n<p>- A...<br />\r\n<br />\r\nCơn đau điếng từ đại n&atilde;o truyền đến khiến hắn phải k&ecirc;u l&ecirc;n một tiếng thảm thiết. Lục Thiếu Du cảm nhận được c&oacute; một lực lượng kỳ lạ đ&aacute;nh v&agrave;o đầu m&igrave;nh khiến hắn lập tức ngất đi một lần nữa.</p>\r\n\r\n<p>Khi trời gần s&aacute;ng Lục Thiếu Du mới từ từ tỉnh lại, nhưng khi nhận được tin tức mới từ đại n&atilde;o Lục Thiếu Du thiếu ch&uacute;t nữa lại ngất đi.<br />\r\n<br />\r\n- Nh&acirc;n phẩm của ta bạo ph&aacute;t sao, xuy&ecirc;n việt rồi, đ&acirc;y l&agrave; kh&ocirc;ng phải l&agrave; nằm mơ chứ?<br />\r\n<br />\r\nLục Thiếu Du mở to hai mắt chăm ch&uacute; nh&igrave;n bốn ph&iacute;a, theo những tin tức nhận được từ đại n&atilde;o, c&ugrave;ng với việc đ&atilde; từng xem qua mấy tiểu thuyết xuy&ecirc;n việt, Lục Thiếu Du khẳng định rằng m&igrave;nh đ&atilde; bị xuy&ecirc;n việt rồi. T&igrave;nh huống n&agrave;y tưởng chừng như kh&ocirc;ng c&oacute; thật, thậm ch&iacute; trong trăm triệu ho&agrave;n cảnh cũng chưa chắc t&igrave;m được một, vậy m&agrave; lại xảy ra tr&ecirc;n người hắn.</p>', 0, 0),
(9, 15, 'CHƯƠNG 1: TÔI KHÔNG HỐI HẬN', 'chuong-1-toi-khong-hoi-han', '<p>CHƯƠNG 1: T&Ocirc;I KH&Ocirc;NG HỐI HẬN Độ ấm từ sau lưng chậm r&atilde;i v&acirc;y quanh, h&ocirc; hấp n&oacute;ng bỏng ở b&ecirc;n tai: &ldquo;Sợ kh&ocirc;ng?&rdquo;<br />\r\n<br />\r\nHơi thở xa lạ quanh quẩn b&ecirc;n tai khiển người ta lạnh lẽo đến kh&ocirc;ng d&aacute;m l&ecirc;n tiếng.<br />\r\n<br />\r\nL&acirc;m Tử Lạp như cảm gi&aacute;c được người đ&agrave;n &ocirc;ng hơi khựng lại, sau đ&oacute; lại vang l&ecirc;n giọng n&oacute;i của anh: &ldquo;B&acirc;y giờ hối hận vẫn c&ograve;n kịp.&rdquo;<br />\r\n<br />\r\nC&ocirc; căng thẳng siết chặt hai tay, lắc đầu: &ldquo;T&ocirc;i kh&ocirc;ng hổi hận&hellip;&rdquo; C&ocirc; đang ở trong thời kỳ xinh đẹp nhất, nhưng&hellip;<br />\r\n&nbsp;</p>', 0, 0),
(10, 18, 'Chương 4: Luyện cốt nhai', 'luyen-cot-nhai', 'Chính tại đang suy nghĩ vẩn vơ, Hàn Lập phát hiện các hài đồng khác đều đã chạy ào về phía rừng trúc, nhìn thấy vậy, hắn liền khẩn trương chạy theo.\r\n\r\nTrúc lâm hiển nhiên vô cùng to lớn, hơn ba mươi hài đồng, ngay vừa khi tiến vào trúc lâm tựu tản ra. Đi sát sau Hàn Lập là vị sư huynh cao gầy, người này mặt mũi lạnh lùng, nhất ngôn bất phát. Hàn Lập có điểm sợ hãi, không dám cùng vị sư huỳnh này lên tiếng, chỉ từ từ nhấc chân cắm đầu đi về phía trước.\r\n\r\nPhiến trúc lâm này nhìn thì không có gì, nhưng đến khi đi một thời gian dài mới cảm thấy khó khăn, bước chân càng lúc càng nặng, Hàn Lập phải với tay vào thân trúc phía trước để tranh thủ tiến lên, cũng giảm bớt được ít nhiều sức lực.', 0, 1),
(11, 16, 'Chương 2: Nhân phẩm có vấn đề (2)', 'chuong-2-nhan-pham-co-van-de-2', '<p>Ngay tại l&uacute;c Lục Thiếu Du đang suy nghĩ xem c&oacute; phải y&ecirc;u th&uacute; đang tiến về ph&iacute;a m&igrave;nh hay kh&ocirc;ng th&igrave; từ tr&ecirc;n kh&ocirc;ng một chuỗi &acirc;m thanh r&iacute;t g&agrave;o truyền đến. Ngay lập tức trước mắt hắn như bị m&acirc;y đen bao phủ. Một con chim khổng lồ d&agrave;i hơn trăm thước xuất hiện tr&ecirc;n kh&ocirc;ng trung.<br />\r\n<br />\r\nC&aacute;ch chim mở rộng, bay lượn ngay khoảng kh&ocirc;ng tr&ecirc;n đầu Lục Thiếu Du. Con chim n&agrave;y c&oacute; điểm giống chim ưng nhưng phủ b&ecirc;n ngo&agrave;i bộ l&ocirc;ng m&agrave;u xanh, dưới bụng c&oacute; l&ocirc;ng tơ m&agrave;u trắng. Hai ch&acirc;n c&oacute; m&oacute;ng vuốt sắc nhọn uốn cong, thoạt nh&igrave;n như lưỡi dao sắc b&eacute;n, hai mắt Cự Ưng chăm ch&uacute; nh&igrave;n xuống ph&iacute;a hắn.<br />\r\n<br />\r\n- Y&ecirc;u th&uacute;, chẳng lẽ ta vừa mới xuy&ecirc;n qua đ&atilde; phải trở th&agrave;nh m&oacute;n ăn trong bụng y&ecirc;u th&uacute; sao?<br />\r\nLục Thiếu Du v&ocirc; c&ugrave;ng kinh ngạc, ở kiếp trước lấy đ&acirc;u ra một con chim ưng lớn như vậy. Lập tức, Lục Thiếu Du bất đắc dĩ m&agrave; nở nụ cười khổ, b&acirc;y giờ m&igrave;nh kh&ocirc;ng thể di chuyển, y&ecirc;u th&uacute; m&agrave; muốn ăn thịt m&igrave;nh th&igrave; cũng chỉ c&oacute; thể trơ mắt nh&igrave;n.<br />\r\n<br />\r\n- V&egrave;o v&egrave;o...<br />\r\n<br />\r\nLục Thiếu Du cảm gi&aacute;c được ph&iacute;a sau m&igrave;nh tựa hồ đang c&oacute; con vật g&igrave; đ&oacute; bay đến, hai c&aacute;nh n&oacute; vuốt tr&ecirc;n mặt nước l&agrave;m mặt nước cuộn s&oacute;ng, m&agrave; hắn cũng bị s&oacute;ng cuộn ra ph&iacute;a ngo&agrave;i.</p>', 0, 0),
(12, 16, 'Chương 3: Băng hỏa lưỡng trọng thiên', 'chuong-3-bang-hoa-luong-trong-thien', '<p>Hai tiếng, Lục Thiếu Du ho&agrave;n kh&ocirc;ng kịp phản ứng, trong miệng đ&atilde; c&oacute; hai vi&ecirc;n y&ecirc;u đan, ngay sau đ&oacute; hai d&ograve;ng chất lỏng n&oacute;ng v&agrave; lạnh trong xuất hiện trong cổ họng hắn. Một chất lỏng n&oacute;ng như lửa đốt ch&aacute;y trong th&acirc;n thể hắn, trong khoảnh khắc trong cơ thể Lục Thiếu Du giống như l&ograve; thi&ecirc;u. Chất lỏng c&ograve;n lại th&igrave; lạnh lẽo như băng, ngay lập tức l&agrave;m th&acirc;n h&igrave;nh hắn kết th&agrave;nh một khối băng.<br />\r\n<br />\r\n- Chi Chi...</p>\r\n\r\n<p>Lần thứ hai, y&ecirc;u th&uacute; dơi k&ecirc;u l&ecirc;n, đ&ocirc;i mắt n&oacute; nh&igrave;n uể oải đi kh&ocirc;ng &iacute;t, sau đ&oacute; c&aacute;nh b&ecirc;n phải rung l&ecirc;n, từ c&aacute;nh dưới c&aacute;nh chim c&oacute; một con rắn nhỏ m&agrave;u v&agrave;ng d&agrave;i tầm 10 tấc bị giũ ra.</p>\r\n\r\n<p>- Chi chi!<br />\r\n<br />\r\nY&ecirc;u th&uacute; dơi k&ecirc;u l&ecirc;n chi chi lần nữa, con rắn m&agrave;u v&agrave;ng dường như hiểu &yacute; n&oacute;, ngay sau đ&oacute; con rắn b&ograve; l&ecirc;n tr&ecirc;n người Lục Thiếu Du, từ tr&ecirc;n cổ chui v&agrave;o quần &aacute;o của hắn.<br />\r\n<br />\r\nNh&igrave;n thấy con rắn m&agrave;u v&agrave;ng nhỏ b&ograve; v&agrave;o quần &aacute;o Lục Thiếu Du, con y&ecirc;u th&uacute; dơi nh&igrave;n chăm ch&uacute; v&agrave;o Lục Thiếu Du, trong &aacute;nh mắt mang theo khẩn cầu.</p>', 0, 1),
(13, 16, 'Chương 4: Lục gia', 'chuong-4-luc-gia', '<p>Mẫu th&acirc;n, con kh&ocirc;ng sao.<br />\r\n<br />\r\nNh&igrave;n phu nh&acirc;n hiền l&agrave;nh trước mắt, trong l&ograve;ng Lục Thiếu Du khẽ giật m&igrave;nh, con của n&agrave;ng, đ&atilde; chết, nhưng m&igrave;nh kh&ocirc;ng thể đem sự thật n&oacute;i ra, về sau, m&igrave;nh sẽ l&agrave; con của người.<br />\r\n<br />\r\n- Thiếu Du, nhanh n&oacute;i cho mẫu th&acirc;n biết, mấy ng&agrave;y nay con đi đ&acirc;u, v&igrave; sao đi m&agrave; kh&ocirc;ng n&oacute;i tiếng n&agrave;o?<br />\r\n<br />\r\nNh&igrave;n Lục Thiếu Du c&ograve;n nguy&ecirc;n vẹn trở về mẫu th&acirc;n của hắn mới thở d&agrave;i một hơi, l&ocirc;i k&eacute;o hai tay của hắn hỏi.<br />\r\n<br />\r\n- Con c&oacute; ch&uacute;t việc phải l&agrave;m, xin lỗi v&igrave; đ&atilde; l&agrave;m người lo lắng.<br />\r\n<br />\r\nLục Thiếu Du đ&aacute;p lời, tất nhi&ecirc;n hắn kh&ocirc;ng thể n&oacute;i rằng con của người đ&atilde; bị đ&aacute;nh chết n&eacute;m xuống v&aacute;ch n&uacute;i.<br />\r\n<br />\r\n- Con đ&oacute;i chưa? Mẫu th&acirc;n đi lấy đồ ăn ngon lại cho con.</p>\r\n\r\n<p>Mỹ phụ nh&acirc;n hiền l&agrave;nh vội v&agrave;ng lấy ra mấy c&aacute;i b&aacute;nh bao v&agrave; một m&oacute;n ăn mặn. Lục Thiếu Du nh&igrave;n xem, vừa nh&igrave;n cũng c&oacute; thể nhận ra m&oacute;n ăn n&agrave;y kh&aacute; ngon nhưng đ&acirc;y chỉ l&agrave; canh thừa m&agrave; th&ocirc;i.<br />\r\n<br />\r\n- Đồ ăn n&agrave;y rất sạch sẽ, Nam th&uacute;c phải trộm từ ph&ograve;ng bếp đ&oacute;, nhanh ăn đi, đ&acirc;y ch&iacute;nh l&agrave; m&oacute;n con th&iacute;ch ăn nhất.<br />\r\n<br />\r\nMỹ phụ nh&acirc;n nh&igrave;n Lục Thiếu Du n&oacute;i, &aacute;nh mắt dịu d&agrave;ng, ngữ điệu to&aacute;t ra sự &aacute;y n&aacute;y, thấp giọng n&oacute;i:</p>', 0, 1),
(14, 17, 'Chương 2: Triều khí bừng bừng', 'chuong-2-trieu-khi-bung-bung', '<p>hạch Th&ocirc;n nằm trong d&atilde;y n&uacute;i Thương M&atilde;ng, bốn bề n&uacute;i cao khe lớn, quần thể n&uacute;i non nguy nga kỳ vĩ trải ng&uacute;t tầm nh&igrave;n.</p>\r\n\r\n<p>S&aacute;ng sớm, từng l&agrave;n m&acirc;y sớm trải xuống lấp l&aacute;nh &aacute;nh v&agrave;ng, khiến người ta cảm thấy ấm &aacute;p khi đắm m&igrave;nh trong đ&oacute;/</p>\r\n\r\n<p>Một đ&aacute;m mấy chục đứa trẻ lớn nhỏ kh&ocirc;ng đồng đều, khoảng từ bốn năm tuổi cho đến mười mấy tuổi đang đứng tr&ecirc;n khoảng đất trống trước th&ocirc;n, ngẩng mặt đ&oacute;n l&agrave;n m&acirc;y sớm, h&igrave; hục r&egrave;n luyện th&acirc;n thể. Từng khu&ocirc;n mặt non nớt lộ vẻ nghi&ecirc;m t&uacute;c, mấy đứa lớn hơn một ch&uacute;t th&igrave; h&ugrave;ng hổ lắm, tụi nhỏ hơn cũng đang khua khoắng kh&aacute; l&agrave; ra d&aacute;ng.</p>\r\n\r\n<p>Một người đ&agrave;n &ocirc;ng trung ni&ecirc;n tr&aacute;ng kiện như hổ b&aacute;o, mặc &aacute;o da th&uacute;, nước da m&agrave;u đồng, t&oacute;c đen bu&ocirc;ng x&otilde;a, &aacute;nh mắt lấp l&aacute;nh quan s&aacute;t từng đứa trẻ, cẩn thận chỉ điểm cho ch&uacute;ng.</p>\r\n\r\n<p>&quot;L&uacute;c mặt trời mới mọc l&agrave; l&uacute;c vạn vật khởi đầu, sinh kh&iacute; mạnh nhất, tuy kh&ocirc;ng thể nuốt m&acirc;y ngậm kh&iacute; như trong truyền thuyết, nhưng r&egrave;n luyện th&acirc;n thể dưới l&agrave;n m&acirc;y sớm cũng c&oacute; &iacute;ch lợi rất lớn. C&oacute; thể bồi đắp sinh cơ cho cơ thể. Trong một ng&agrave;y chỉ c&oacute; thời khắc s&aacute;ng sớm n&agrave;y th&ocirc;i, chịu kh&oacute; dậy sớm chăm chỉ r&egrave;n luyện, cường g&acirc;n tr&aacute;ng cốt, hoạt huyết luyện g&acirc;n, về sau mới c&oacute; vốn m&agrave; sinh tồn trong chốn m&atilde;ng sơn n&agrave;y.&quot; Người trung ni&ecirc;n đứng ph&iacute;a trước chỉ điểm đ&aacute;m trẻ nghi&ecirc;m mặt nhắc nhở, sau đ&oacute; qu&aacute;t: &quot;C&aacute;c ngươi c&oacute; hiểu kh&ocirc;ng?&quot;</p>\r\n\r\n<p>&quot;Hiểu!&quot; Đ&aacute;m trẻ hăng h&aacute;i cất giọng đ&aacute;p lời.</p>\r\n\r\n<p>Trong n&uacute;i hay c&oacute; những sinh vật tiền sử xuất hiện. C&oacute; lo&agrave;i c&aacute;nh lớn che trời bay ngang in b&oacute;ng trải đầy mặt đất, cũng c&oacute; những con hoang th&uacute; đứng tr&ecirc;n đỉnh n&uacute;i tru trăng, c&agrave;ng kh&ocirc;ng thể thiếu những lo&agrave;i độc tr&ugrave;ng b&ograve; lổn ngổn, v&ocirc; c&ugrave;ng đ&aacute;ng sợ.</p>\r\n\r\n<p>&quot;Hiểu ạ.&quot; Một nh&oacute;c t&igrave; r&otilde; r&agrave;ng đ&atilde; lơ đ&atilde;ng, chậm hẳn nửa nhịp thỏ thẻ l&ecirc;n tiếng.</p>', 0, 0),
(15, 17, 'Chương 3: Cốt văn', 'chuong-3-cot-van', '<p>Trong khi tộc trưởng v&agrave; c&aacute;c vị b&ocirc; l&atilde;o cầu khấn, tất cả thanh ni&ecirc;n trai tr&aacute;ng ai cũng lộ vẻ trịnh trọng, tiến h&agrave;nh lễ b&aacute;i. Kh&ocirc;ng &iacute;t phụ nữ cũng đến lặng lẽ cầu nguyện, cầu cho người th&acirc;n của m&igrave;nh được trở về an to&agrave;n sau chuyến đi săn.</p>\r\n\r\n<p>Trong n&uacute;i qu&aacute; nguy hiểm, rời khỏi th&ocirc;n l&agrave;ng được c&acirc;y liễu gi&agrave; bảo hộ, b&ecirc;n ngo&agrave;i sẽ l&agrave; một thế giới ho&agrave;n to&agrave;n kh&aacute;c, ở đ&oacute; đầy rẫy những con m&atilde;nh cầm v&agrave; cự th&uacute; v&ocirc; c&ugrave;ng đ&aacute;ng sợ.</p>\r\n\r\n<p>V&agrave; rồi cứ thế, một to&aacute;n người khỏe mạnh nhất th&ocirc;n v&aacute;c cung t&ecirc;n lớn tr&ecirc;n vai, mang theo đại kiếm l&ecirc;n đường tiến v&agrave;o trong chốn n&uacute;i s&acirc;u rừng rậm, một luồng hơi thở của đại hoang tức th&igrave; ập tới.</p>\r\n\r\n<p>D&otilde;i mắt tiễn đội săn ra đi, l&atilde;o tộc trưởng Thạch V&acirc;n Phong dẫn lũ trẻ về lại b&atilde;i cỏ đầu th&ocirc;n, khoanh ch&acirc;n ngồi xuống n&oacute;i: &quot;Được rồi, đ&aacute;m khỉ con c&aacute;c ch&aacute;u cũng cần chăm chỉ học tập đ&oacute;.&quot;</p>\r\n\r\n<p>Đ&aacute;m trẻ lập tức xị mặt, đứa n&agrave;o đứa nấy kh&ocirc;ng c&ograve;n hứng th&uacute; g&igrave; hết, miễn cưỡng ngồi quanh l&atilde;o, ỉu x&igrave;u như một mớ l&aacute; c&acirc;y phơi h&eacute;o.</p>\r\n\r\n<p>&quot;Tộc trưởng gia gia, mấy chữ k&igrave; cục đ&oacute; phức tạp như b&ugrave;a bắt ma ấy, kh&oacute; học lắm, phải dụng t&acirc;m ghi nhớ l&agrave;m g&igrave; ạ?&quot;</p>\r\n\r\n<p>&quot;Đ&uacute;ng thế, c&ograve;n chẳng hữu &iacute;ch bằng tiễn ph&aacute;p cha dạy ch&aacute;u!&quot;</p>\r\n\r\n<p>Đ&aacute;m trẻ to&agrave;n bộ đều xịu mặt, c&oacute; vẻ rất ch&aacute;n gh&eacute;t.</p>', 0, 1);
INSERT INTO `chuong` (`id`, `truyen_id`, `tieude`, `slug_chuong`, `noidung`, `kichhoat`, `is_vip`) VALUES
(16, 17, 'Chương 4: Tế Linh', 'chuong-4-te-linh', '<p>Đ&agrave;n tế được cắt ra từ đ&aacute; tảng, rất rộng r&atilde;i, dựng ngay s&aacute;t cạnh gốc liễu gi&agrave;. L&uacute;c n&agrave;y tr&ecirc;n mặt đ&agrave;n tế chất đầy m&atilde;nh th&uacute;, chồng đống l&ecirc;n nhau như một ngọn n&uacute;i nhỏ.</p>\r\n\r\n<p>M&aacute;u th&uacute; đỏ tươi nhuộm hồng bục đ&aacute;, chảy theo những đường hoa văn đi&ecirc;u khắc tr&ecirc;n bề mặt đ&aacute;, m&agrave;u m&aacute;u, l&ocirc;ng th&uacute; th&ocirc; d&agrave;i, vảy th&uacute; loang lo&aacute;ng h&agrave;n quang c&ugrave;ng với những c&aacute;i sừng to dữ tợn, tất cả kết hợp với nhau khiến ai nh&igrave;n v&agrave;o cũng thấy rợn cả người, c&oacute; một thứ hơi thở hồng hoang thảm khốc như tấp v&agrave;o khu&ocirc;n mặt.</p>\r\n\r\n<p>Dưới sự dẫn dắt của l&atilde;o tộc trưởng, tr&agrave; trẻ g&aacute;i trai của Thạch Th&ocirc;n c&ugrave;ng bước l&ecirc;n cầu khấn, mong c&acirc;y liễu ph&ugrave; hộ d&acirc;n l&agrave;ng. Đ&acirc;y l&agrave; một qu&aacute; tr&igrave;nh c&uacute;ng tế hết sức trang nghi&ecirc;m, nhưng cũng l&agrave; một thứ tập qu&aacute;n, mỗi lần săn bắn trở về đều phải tiến h&agrave;nh.</p>\r\n\r\n<p>C&acirc;y liễu ch&aacute;y đen vẫn tĩnh lặng như xưa, kh&ocirc;ng hề c&oacute; phản ứng g&igrave;, cũng chưa từng lấy đồ c&uacute;ng tế. Nhưng rất nhiều người d&acirc;n trong th&ocirc;n biết, n&oacute; rất thi&ecirc;ng!</p>', 0, 1),
(17, 16, 'Chương 5: Thiếu gia mệnh khổ', 'chuong-5-thieu-gia-menh-kho', '<p>&nbsp;Y&ecirc;u th&uacute; huynh đệ, huynh đ&atilde; cứu ta, hẳn l&agrave; v&igrave; muốn để cho ta gi&uacute;p huynh chăm s&oacute;c con Tiểu Kim X&agrave; n&agrave;y phải kh&ocirc;ng? Ta nợ huynh một &acirc;n huệ, con Tiểu Kim X&agrave; n&agrave;y, ta sẽ thay huynh chăm s&oacute;c thật tốt.<br />\r\n<br />\r\nLục Thiếu Du n&oacute;i, nếu dưới v&aacute;ch n&uacute;i kh&ocirc;ng c&oacute; con Y&ecirc;u th&uacute; dơi cho m&igrave;nh hai vi&ecirc;n y&ecirc;u đan, chắc hẳn m&igrave;nh đ&atilde; chết c&oacute;ng ở trong đầm nước rồi.<br />\r\n<br />\r\nSau khi đưa quần &aacute;o cho mẫu th&acirc;n, Lục Thiếu Du quay lại ph&ograve;ng của m&igrave;nh, th&acirc;n l&agrave; Lục thiếu gia, Lục Thiếu Du chỉ c&oacute; duy nhất một đặc quyền, đ&oacute; ch&iacute;nh l&agrave; được c&ugrave;ng mẫu th&acirc;n ở trong một căn ph&ograve;ng ri&ecirc;ng biệt, kh&ocirc;ng phải ở chung với những người hầu kh&aacute;c.<br />\r\n<br />\r\nMột đ&ecirc;m ngủ thật say để b&ugrave; lại mấy ng&agrave;y kh&ocirc;ng được ngủ, Lục Thiếu Du ngủ rất ngon, trong mộng c&ograve;n mơ về mấy mỹ nữ, thiếu ch&uacute;t nữa m&aacute;u mũi đ&atilde; chảy ra rồi.<br />\r\n<br />\r\n- Du thiếu gia, tỉnh dậy đi, Du thiếu gia.<br />\r\n<br />\r\nLục Thiếu Du đang ngủ ngon đ&acirc;y, th&igrave; c&oacute; một giọng n&oacute;i th&igrave; thầm b&ecirc;n tai hắn.<br />\r\n<br />\r\n- Lục Tiểu Bạch, ta đang c&oacute; nằm mơ đấy.<br />\r\n<br />\r\nLục Thiếu Du nghe thanh &acirc;m cũng biết đ&oacute; l&agrave; Lục Tiểu Bạch, trong số những người hầu của Lục gia, cũng chỉ c&oacute; Lục Tiểu Bạch c&oacute; quan hệ tốt với hắn nhất.</p>\r\n\r\n<p>Mở hai mắt ra, Lục Thiếu Du thấy một thiếu ni&ecirc;n mười s&aacute;u mười bảy tuổi xuất hiện ở trước mắt m&igrave;nh. Thiếu ni&ecirc;n n&agrave;y mặc trang phục người hầu, kỳ thật trang phục của m&igrave;nh cũng kh&ocirc;ng kh&aacute;c hắn l&agrave; bao, thiếu ni&ecirc;n n&agrave;y mắt s&aacute;ng m&agrave;y rậm, d&ugrave;ng lời ca ngợi để h&igrave;nh dung hắn ch&iacute;nh l&agrave; tr&ocirc;ng rất th&ocirc;ng minh s&aacute;ng sủa.<br />\r\n<br />\r\n- Du thiếu gia, mấy ng&agrave;y n&agrave;y người đ&atilde; đi đ&acirc;u? Người kh&ocirc;ng sao chớ?<br />\r\n<br />\r\nLục Tiểu Bạch nh&igrave;n Lục Thiếu Du, sau đ&oacute; &aacute;nh mắt cẩn thận quan s&aacute;t Lục Thiếu Du, nhỏ giọng m&agrave; n&oacute;i:</p>', 0, 1),
(18, 16, 'Chương 6: Mật thất trong kho củi', 'chuong-6-mat-that-trong-kho-cui', '<p>B&acirc;y giờ, b&ecirc;n cạnh đống h&agrave;ng h&oacute;a c&oacute; khoảng mười người hầu đang c&ugrave;ng nhau khu&acirc;n v&aacute;c. Những người hầu n&agrave;y nh&igrave;n tho&aacute;ng qua Lục Thiếu Du cũng kh&ocirc;ng c&oacute; ch&uacute; &yacute; nhiều, quả thực l&agrave; coi Lục Thiếu Du như kh&ocirc;ng tồn tại. Cũng chẳng ai muốn để &yacute; tới Lục Thiếu Du, m&agrave; nếu để &yacute; tới Lục Thiếu Du th&igrave; chắc sẽ bị Triệu tổng quản để &yacute;.<br />\r\n<br />\r\n- Đ&oacute; l&agrave; ch&uacute;ng ta vận kh&iacute; tốt.<br />\r\n<br />\r\nLục Thiếu Du n&oacute;i, thầm nghĩ trong l&ograve;ng, phỏng chừng ba người n&agrave;y thấy m&igrave;nh chết đi sống lại n&ecirc;n sợ chết khiếp.<br />\r\n<br />\r\nN&acirc;ng một bao h&agrave;ng l&ecirc;n, Lục Thiếu Du cảm gi&aacute;c được dường như b&ecirc;n trong t&uacute;i h&agrave;ng n&agrave;y l&agrave; muối, hắn quay đầu lại nh&igrave;n Lục Tiểu Bạch chỉ khi&ecirc;ng một bao m&agrave; eo cũng kh&ocirc;ng thể duỗi thẳng:<br />\r\n<br />\r\n- Thiếu gia, &agrave; kh&ocirc;ng, c&ocirc;ng tử, sao ngươi đột nhi&ecirc;n khỏe như vậy? Bao muối n&agrave;y phải một trăm hai mươi c&acirc;n a, trước kia người cũng kh&ocirc;ng thể khi&ecirc;ng nổi.</p>\r\n\r\n<p>Nh&igrave;n Lục Thiếu Du nhẹ nh&otilde;m khi&ecirc;ng một bao muối Lục Tiểu Bạch kinh ngạc n&oacute;i.<br />\r\n<br />\r\n- Thật sao, tại sao ta kh&ocirc;ng cảm thấy nặng như vậy?<br />\r\n<br />\r\nBản th&acirc;n Lục Thiếu Du cũng nghi ngờ, hắn cũng nhớ r&otilde; trước đ&acirc;y m&igrave;nh kh&ocirc;ng thể khi&ecirc;ng nổi vật qu&aacute; nặng, nhưng b&acirc;y giờ t&uacute;i muối như thế n&agrave;y m&igrave;nh c&oacute; thể khi&ecirc;ng tr&ecirc;n vai m&agrave; cảm gi&aacute;c như c&oacute; ba mươi, bốn mươi c&acirc;n, cũng kh&ocirc;ng tốn bao nhi&ecirc;u sức.</p>', 0, 1),
(19, 16, 'Chương 7: Âm dương Linh - Vũ quyết (1)', 'chuong-7-am-duong-linh-vu-quyet-1', '<p>Lục Thiếu Du cả gan tiến v&agrave;o cửa kho chứa củi, trong đ&ecirc;m tối lờ mờ kh&ocirc;ng ngờ lại nh&igrave;n thấy được một th&acirc;n ảnh quen thuộc:<br />\r\n<br />\r\n- Nam th&uacute;c, sao lại l&agrave; th&uacute;c?<br />\r\n<br />\r\nL&uacute;c n&agrave;y, Lục Thiếu Du đ&aacute;nh gi&aacute; Nam th&uacute;c, bộ dạng của &ocirc;ng l&uacute;c n&agrave;y ho&agrave;n to&agrave;n kh&aacute;c với bộ dạng tuổi gi&agrave; sức yếu ban ng&agrave;y, hai mắt hữu thần, cả người như như ph&aacute;t ra một kh&iacute; thế v&ocirc; h&igrave;nh, chỉ l&agrave; sắc mặt c&oacute; ch&uacute;t t&aacute;i nhợt.<br />\r\n<br />\r\n- Rất kỳ lạ sao? Nếu kh&ocirc;ng phải l&agrave; nh&igrave;n ngươi lớn l&ecirc;n từ nhỏ, t&acirc;m địa cũng thiện lương, ta cũng kh&ocirc;ng th&egrave;m tới cứu ngươi.<br />\r\n<br />\r\nNam th&uacute;c chăm ch&uacute; nh&igrave;n Lục Thiếu Du n&oacute;i.</p>\r\n\r\n<p>&nbsp;Nam th&uacute;c, cứu ta c&aacute;i g&igrave;, sao ta lại c&oacute; cảm gi&aacute;c ngươi kh&aacute;c với l&uacute;c trước?<br />\r\n<br />\r\nLục Thiếu Du kh&ocirc;ng nhịn được hỏi.<br />\r\n<br />\r\n- Ngươi sắp chết đến nơi rồi m&agrave; c&ograve;n kh&ocirc;ng biết.<br />\r\n<br />\r\nL&atilde;o bộc nh&igrave;n Lục Thiếu Du n&oacute;i.</p>', 0, 1),
(20, 20, 'chương 1.a', 'chuong-1a', '<p><em>Chương n&agrave;y c&oacute; nội dung ảnh, nếu bạn kh&ocirc;ng thấy nội dung chương, vui l&ograve;ng bật chế độ hiện h&igrave;nh ảnh của tr&igrave;nh duyệt để đọc.</em><br />\r\n<br />\r\nTrong suốt qu&atilde;ng đời tuổi thơ đầy ắp tiếng cười trong veo tinh nghịch, L&acirc;m Kỳ Nhạc đ&atilde; từng đối mặt với &lsquo;vực s&acirc;u vạn trượng&rsquo; tưởng chừng như &lsquo;kh&ocirc;ng thể quay đầu&rsquo; kh&ocirc;ng biết bao nhi&ecirc;u lần.<br />\r\n<br />\r\nNhưng lần n&agrave;o c&ocirc; g&aacute;i nhỏ cũng đều vượt qua tr&oacute;t lọt.&nbsp;<br />\r\n<br />\r\nĐến ch&iacute;n tuổi năm đ&oacute;, đ&atilde; xảy ra một lần ngo&agrave;i &yacute; muốn.<br />\r\n<br />\r\n&ldquo;Hết đường rồi.&rdquo; Dư Tiều v&oacute;c d&aacute;ng cao lớn, đứng b&ecirc;n r&igrave;a m&eacute;p n&uacute;i n&oacute;i. Đ&aacute; sỏi v&agrave; c&aacute;t mịn dưới đế gi&agrave;y của hắn rơi xuống sườn n&uacute;i lạo xạo.<br />\r\n<br />\r\nĐ&atilde; rất l&acirc;u m&agrave; tiếng vọng vẫn kh&ocirc;ng ngừng dội lại, kh&ocirc;ng biết s&acirc;u cỡ n&agrave;o.<br />\r\n<br />\r\nĐỗ Thượng gầy tong teo, đeo cặp s&aacute;ch đứng b&ecirc;n cạnh, hai đầu gối va v&agrave;o nhau lập cập. Cậu ch&agrave;ng rướn cổ th&ograve; người d&ograve;m xuống v&aacute;ch đ&aacute;, vừa liếc mắt một c&aacute;i lập tức l&iacute;u lưỡi lắp bắp: &ldquo;Kh&ocirc;ng được&hellip; kh&ocirc;ng được&hellip; kh&ocirc;ng được&hellip;&rdquo; Đỗ Thượng lui về sau mấy bước, mặt mũi trắng bệch cắt kh&ocirc;ng c&ograve;n một giọt m&aacute;u: &ldquo;Đ&aacute;ng sợ qu&aacute;, đi về đi.&rdquo;<br />\r\n<br />\r\nTh&aacute;i Phương Nguy&ecirc;n, một &ocirc;ng tướng b&eacute;o m&uacute;p, đứng thật xa ở tuốt đằng sau. R&otilde; r&agrave;ng l&agrave; c&ugrave;ng tuổi với c&aacute;c bạn đồng trang lứa, cũng chỉ mới ch&iacute;n tuổi, nhưng cơ thể đ&atilde; nặng l&ugrave; l&ugrave;, đ&iacute;ch x&aacute;c l&agrave; một quả cầu đặt tr&ecirc;n hai c&aacute;i ch&acirc;n khẳng khiu đang r&aacute;ng hết sức chống đỡ. Vẫn c&ograve;n c&aacute;ch v&aacute;ch n&uacute;i hơn một chục m&eacute;t, Th&aacute;i Phương Nguy&ecirc;n đ&atilde; đứng bất động, chống hai tay l&ecirc;n đầu gối thở hồng hộc, rống: &ldquo;L&acirc;m Kỳ Nhạc, cậu dẫn mọi người đi c&aacute;i chỗ ngu ngốc đi&ecirc;n kh&ugrave;ng g&igrave; vậy hả!&rdquo;<br />\r\n<br />\r\nL&acirc;m Kỳ Nhạc &mdash; nữ sinh duy nhất trong bốn người. C&ocirc; đứng b&ecirc;n r&igrave;a v&aacute;ch đ&aacute;, d&otilde;i mắt nh&igrave;n chăm ch&uacute; thung lũng s&acirc;u hun h&uacute;t tĩnh mịch b&ecirc;n dưới.<br />\r\n<br />\r\nSau đ&oacute; ngẩng đầu l&ecirc;n, d&ograve;m chằm chằm con đường nhỏ chạy xuy&ecirc;n qua khu rừng thăm thẳm ph&iacute;a đối diện, c&aacute;ch v&aacute;ch đ&aacute; hơn chục m&eacute;t kia.&nbsp;</p>', 0, 0),
(21, 20, 'Chương 2b', 'chuong-2b', '<p><em>Chương n&agrave;y c&oacute; nội dung ảnh, nếu bạn kh&ocirc;ng thấy nội dung chương, vui l&ograve;ng bật chế độ hiện h&igrave;nh ảnh của tr&igrave;nh duyệt để đọc.</em><br />\r\n<br />\r\nL&acirc;m Kỳ Nhạc ngồi chồm hổm ở sau vườn, nương theo &aacute;nh s&aacute;ng mờ nhạt từ h&agrave;ng hi&ecirc;n rọi tới, c&ocirc; lấy cỏ kh&ocirc; trong b&aacute;t đ&uacute;t cho con thỏ trắng nhỏ đang nằm sấp trong chuồng ăn.<br />\r\n<br />\r\n&ldquo;Quy&ecirc;n Tử!&rdquo; Thợ điện L&acirc;m trở về sau giờ tăng ca, cả người bụi bặm: &ldquo;Em chuẩn bị một &iacute;t thức ăn, gi&aacute;m s&aacute;t Tưởng v&agrave; tổ trưởng Dư đến chơi, gi&aacute;m s&aacute;t Tưởng vẫn chưa ăn cơm!&rdquo;<br />\r\n<br />\r\nTi vi trong ph&ograve;ng kh&aacute;ch đang ph&aacute;t ca kh&uacute;c kết th&uacute;c của một bộ phim truyền h&igrave;nh. Sau khi bộ phim ph&aacute;t được mấy h&ocirc;m, L&acirc;m Kỳ Nhạc cũng bắt đầu ng&acirc;m nga,<br />\r\n<br />\r\n<em>&lsquo;Kh&oacute; c&oacute; được một bản lĩnh cao cường, cũng kh&ocirc;ng thể vượt qua được ải t&igrave;nh.&rsquo;&nbsp;(*B&agrave;i h&aacute;t trong Tiểu l&yacute; phi đao.)</em><br />\r\n<br />\r\n&ldquo;Anh Đ&agrave;o,&rdquo; mẹ L&acirc;m vội v&atilde; đi v&agrave;o bếp, đẩy c&aacute;nh cửa lưới th&ocirc;ng ra sau vườn: &ldquo;Trong nh&agrave; c&oacute; mấy ch&uacute; đến chơi, con mau v&agrave;o gi&uacute;p mẹ rửa đậu phộng.&rdquo;<br />\r\n<br />\r\nL&acirc;m Kỳ Nhạc đặt b&aacute;t cỏ tr&ecirc;n tay xuống đi v&agrave;o nh&agrave; bếp, đ&uacute;ng l&uacute;c nghe thấy ba đang n&oacute;i chuyện trong ph&ograve;ng kh&aacute;ch: &ldquo;Đến đ&acirc;y n&agrave;o, Kiều T&acirc;y, con cũng mau ngồi xuống đi. Nh&igrave;n khu&ocirc;n mặt nhỏ nhắn t&aacute;i nhợt thế n&agrave;y, chắc l&agrave; đ&oacute;i bụng lắm rồi phải kh&ocirc;ng!&rdquo;<br />\r\n<br />\r\nTiếp theo l&agrave; giọng n&oacute;i rất trầm của một người đ&agrave;n &ocirc;ng, kh&ocirc;ng giống giọng của ch&uacute; Dư, cũng kh&ocirc;ng phải giọng của ba, L&acirc;m Kỳ Nhạc nghĩ, người đ&oacute; hẳn l&agrave; gi&aacute;m s&aacute;t Tưởng.<br />\r\n<br />\r\n&ldquo;H&ocirc;m qua ra khỏi đường cao tốc,&rdquo; chỉ nghe gi&aacute;m s&aacute;t Tưởng n&oacute;i: &ldquo;Đ&uacute;ng l&uacute;c đến giờ cơm, gần đ&oacute; kh&ocirc;ng c&oacute; h&agrave;ng qu&aacute;n g&igrave;, t&ocirc;i v&agrave; t&agrave;i xế nh&igrave;n thấy c&oacute; một tiệm m&igrave; gia đ&igrave;nh b&ecirc;n đường, b&egrave;n dẫn thằng nh&oacute;c v&agrave;o ăn b&aacute;t m&igrave; thịt b&ograve;.&rdquo; &nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n<br />\r\n&ldquo;Ăn kh&ocirc;ng no sao?&rdquo; Ba L&acirc;m hỏi.</p>', 0, 0),
(22, 20, 'chương 3.c', 'chuong-3c', '<p><em>Chương n&agrave;y c&oacute; nội dung ảnh, nếu bạn kh&ocirc;ng thấy nội dung chương, vui l&ograve;ng bật chế độ hiện h&igrave;nh ảnh của tr&igrave;nh duyệt để đọc.</em><br />\r\n<br />\r\nSớm tinh mơ, L&acirc;m Kỳ Nhạc ngồi trước gương, đeo tai nghe Walkman nghe nhạc nhưng trong đầu kh&ocirc;ng ngừng văng vẳng lời người lớn đ&atilde; n&oacute;i đ&ecirc;m qua.<br />\r\n<br />\r\n<em>&lsquo;Hiện tại mấy cậu xem, đứa nhỏ n&agrave;y đ&atilde; ch&iacute;n tuổi, kh&ocirc;ng ngừng nỗ lực gắng sức học h&agrave;nh như vậy, kết quả hai vợ chồng mạnh ai nấy bỏ mặc chẳng hề quan t&acirc;m &hellip;&rsquo;</em><br />\r\n<br />\r\nMẹ L&acirc;m cầm d&acirc;y thun buộc t&oacute;c cho L&acirc;m Kỳ Nhạc, hỏi chồng: &ldquo;S&aacute;ng nay, b&ecirc;n ngo&agrave;i c&oacute; chuyện g&igrave; vậy anh?&rdquo;<br />\r\n<br />\r\nThợ điện L&acirc;m đeo thẻ t&ecirc;n v&agrave;o cổ, trả lời vợ: &ldquo;L&agrave; t&agrave;i xế của gi&aacute;m s&aacute;t Tưởng đến đ&oacute;n thằng b&eacute; đi học.&rdquo;<br />\r\n<br />\r\n&ldquo;Phải đưa đi ạ? Gần như vậy, để bọn trẻ tự đi l&agrave; được m&agrave;.&rdquo;<br />\r\n<br />\r\n&ldquo;Chẳng phải vừa mới chuyển đến sao,&rdquo; ba L&acirc;m vừa n&oacute;i vừa ngẩng đầu nh&igrave;n v&agrave;o gương: &ldquo;Anh Đ&agrave;o.&rdquo;<br />\r\n<br />\r\n&ldquo;Dạ?&rdquo; L&acirc;m Kỳ Nhạc vội v&agrave;ng th&aacute;o tai nghe ra.<br />\r\n<br />\r\n&ldquo;H&ocirc;m nay l&agrave; ng&agrave;y đầu ti&ecirc;n con trai của ch&uacute; Tưởng đi học, nếu ở trường bạn ấy c&oacute; g&igrave; bỡ ngỡ, con nhớ để &yacute; gi&uacute;p đỡ bạn, biết kh&ocirc;ng.&rdquo;<br />\r\n<br />\r\n&ldquo;Dạ, con biết rồiiii&hellip;&rdquo; L&acirc;m Kỳ Nhạc k&eacute;o d&agrave;i giọng nũng nịu.<br />\r\n<br />\r\nC&ocirc; tắt Walkman, lấy cuộn băng cassette &lsquo;Tự xoay quanh em&rsquo; ra cho v&agrave;o cặp.<em>(*&lsquo;Tự xoay quanh em&rsquo; của Vương Lực Ho&agrave;nh)</em><br />\r\n<br />\r\nMẹ L&acirc;m d&ugrave;ng &aacute;nh mắt tr&ecirc;u chọc nh&igrave;n L&acirc;m Kỳ Nhạc trong gương, đồng thời cười ba L&acirc;m l&agrave;m chuyện dư thừa: &ldquo;C&ograve;n cần phải đợi anh nhắc sao?&rdquo;<br />\r\n<br />\r\n*<br />\r\n<br />\r\nS&aacute;ng sớm, Dư Tiều v&agrave; ba chiến hữu của m&igrave;nh c&ugrave;ng nhau đưa em họ Dư Cẩm của hắn đi nh&agrave; trẻ.<br />\r\n<br />\r\nKh&aacute;c với v&oacute;c d&aacute;ng cao to vạm vỡ của hai cha con Dư Chấn Phong, Dư Tiều. Dư Cẩm vừa mềm vừa mịn, t&oacute;c mỏng lại mượt như tơ, giọng n&oacute;i bập bẹ chưa r&otilde; chữ tr&ograve;n v&agrave;nh giống như ngậm một khối mật ong trong miệng đ&aacute;ng y&ecirc;u kh&ocirc;ng để đ&acirc;u cho hết. L&acirc;m Kỳ Nhạc đứng ở cửa nh&agrave; trẻ, trong l&ograve;ng buồn bực kh&ocirc;ng &iacute;t lần, đứa trẻ n&agrave;y sao c&oacute; thể họ Dư chứ.<br />\r\n<br />\r\n&ldquo;Ba tớ bảo tớ rủ Tưởng Kiều T&acirc;y đi học,&rdquo; Dư Tiều ngậm sữa trong miệng, vừa đi vừa khụt khịt mũi n&oacute;i: &ldquo;Kết quả vừa qua tới nh&agrave; cậu ấy đ&atilde; thấy c&oacute; xe đưa đi!&rdquo;<br />\r\n<br />\r\nĐỗ Thượng mon men lại gần hỏi L&acirc;m Kỳ Nhạc: &ldquo;Cậu thật sự cho cậu ấy xem thỏ trắng rồi sao?&rdquo;<br />\r\n<br />\r\n&ldquo;Đ&uacute;ng vậy.&rdquo; L&acirc;m Kỳ Nhạc cắn ống h&uacute;t uống sữa trong hộp.<br />\r\n<br />\r\nGương mặt đang bị thương của Đỗ Thượng nhăn t&iacute;t lại, đến c&aacute;i băng c&aacute; nh&acirc;n tr&ecirc;n tr&aacute;n cũng vểnh l&ecirc;n: &ldquo;Tớ v&agrave; Dư Tiều, Th&aacute;i Phương Nguy&ecirc;n, mấy đứa bọn tớ c&ograve;n chưa c&oacute; nh&igrave;n thấy n&oacute; nữa đ&oacute;!&rdquo;<br />\r\n<br />\r\nDư Tiều n&eacute;m hộp sữa đ&atilde; uống xong v&agrave;o th&ugrave;ng r&aacute;c, đ&uacute;t hai tay v&ocirc; t&uacute;i quần: &ldquo;Đừng c&oacute; l&ocirc;i tớ v&agrave;o đ&oacute;.&rdquo;</p>', 0, 1),
(23, 20, 'Chương 4.c', 'chuong-4c', '<p>S&aacute;ng sớm, Tưởng Kiều T&acirc;y nhận lấy ống nghe từ tay ba m&igrave;nh, nghe hai cuộc điện thoại.<br />\r\n<br />\r\nĐầu ti&ecirc;n l&agrave; anh họ từ Hồng K&ocirc;ng gọi sang, Tưởng Kiều T&acirc;y đang mặc &aacute;o, nghe anh họ giọng đầy quan t&acirc;m hỏi: &ldquo;Anh nghe n&oacute;i em c&aacute;u kỉnh với ba mẹ, b&agrave;i kiểm tra xếp lớp nộp giấy trắng phải kh&ocirc;ng?&rdquo;&nbsp;<br />\r\n<br />\r\nTưởng Kiều T&acirc;y kh&ocirc;ng n&oacute;i g&igrave;, c&uacute;i đầu c&agrave;i c&uacute;c &aacute;o tr&ecirc;n cổ.<br />\r\n<br />\r\n&ldquo;H&ocirc;m nay nếu c&oacute; l&agrave;m b&agrave;i lại lần nữa, em h&atilde;y cố gắng l&agrave;m thật tốt,&rdquo; anh họ n&oacute;i với ngữ điệu v&ocirc; c&ugrave;ng nghi&ecirc;m t&uacute;c: &ldquo;D&ugrave;ng khả năng thực sự của m&igrave;nh, sao em biết ở Quần Sơn kh&ocirc;ng c&oacute; gi&aacute;o vi&ecirc;n giỏi.&rdquo;<br />\r\n<br />\r\nC&oacute; tiếng ch&oacute; con k&ecirc;u ẳng ẳng từ b&ecirc;n cạnh anh họ xuy&ecirc;n qua ống nghe rơi v&agrave;o trong tai Tưởng Kiều T&acirc;y.<br />\r\n<br />\r\nTưởng Kiều T&acirc;y bỗng cảm thấy rất c&ocirc; độc buồn b&atilde;.<br />\r\n<br />\r\n&ldquo;Lassie nhớ em.&rdquo; Anh họ n&oacute;i.<br />\r\n<br />\r\n&ldquo;Em cũng nhớ n&oacute;.&rdquo; Tưởng Kiều T&acirc;y đ&aacute;p lại.<br />\r\n<br />\r\n&ldquo;Ở b&ecirc;n đ&oacute; r&aacute;ng chăm chỉ học tập,&rdquo; anh họ khuy&ecirc;n nhủ: &ldquo;Chỉ c&oacute; như vậy, sau n&agrave;y em mới c&oacute; thể l&agrave;m được những g&igrave; m&igrave;nh muốn.&rdquo;<br />\r\n<br />\r\nC&oacute; lẽ do Tưởng Kiều T&acirc;y m&atilde;i im lặng, anh họ thử thăm d&ograve;: &ldquo;Quần Sơn b&ecirc;n đ&oacute; thế n&agrave;o?&rdquo;<br />\r\n<br />\r\n&ldquo;Chẳng ra sao cả.&rdquo; Tưởng Kiều T&acirc;y thẳng thừng.<br />\r\n<br />\r\nAnh họ sửng sốt: &ldquo;Vậy&hellip; c&oacute; quen người bạn mới n&agrave;o kh&ocirc;ng.&rdquo;<br />\r\n<br />\r\nTưởng Kiều T&acirc;y tho&aacute;ng ngập ngừng: &ldquo;Kh&ocirc;ng c&oacute;.&rdquo;<br />\r\n<br />\r\nCuộc gọi thứ hai đến từ văn ph&ograve;ng của trường chuy&ecirc;n thực nghiệm th&agrave;nh phố. Tưởng Kiều T&acirc;y đeo cặp l&ecirc;n lưng, chuẩn bị bước ra khỏi nh&agrave; đi học th&igrave; ba gọi lại hỏi c&oacute; cần t&agrave;i xế đưa đi kh&ocirc;ng.<br />\r\n<br />\r\nĐ&uacute;ng l&uacute;c đ&oacute; điện thoại b&agrave;n ở ph&iacute;a sau vang l&ecirc;n.</p>', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `ten_danhmuc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug_danhmuc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mo_ta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kichhoat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `ten_danhmuc`, `slug_danhmuc`, `mo_ta`, `kichhoat`) VALUES
(1, 'Truyện hay', 'truyen-hay', 'Truyện hay', 0),
(2, 'Truyện hot', 'truyen-hot', 'Truyện hot', 0),
(3, 'Truyện 18+', 'truyen-18', 'Truyện 18+', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL,
  `truyen_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `likes`
--

INSERT INTO `likes` (`id`, `id_user`, `truyen_id`, `created_at`, `updated_at`) VALUES
(7, 5, 18, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 2),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(11, '2023_12_27_054628_create_transactions_table', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('vanhuynh272001@gmail.com', '$2y$10$GfOfav5oZnq3.jDR3XRegudcFQWz9LsIpOjpm002pjIczfY4ehy8K', '2023-12-26 22:13:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloai`
--

CREATE TABLE `theloai` (
  `id` int(10) UNSIGNED NOT NULL,
  `tentheloai` varchar(255) NOT NULL,
  `slug_theloai` varchar(255) NOT NULL,
  `kichhoat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `theloai`
--

INSERT INTO `theloai` (`id`, `tentheloai`, `slug_theloai`, `kichhoat`) VALUES
(12, 'Tiên hiệp', 'tien-hiep', 0),
(13, 'Trọng sinh', 'trong-sinh', 0),
(14, 'Xuyên không', 'xuyen-khong', 0),
(15, 'Ngôn tình', 'ngon-tinh', 0),
(17, 'Cổ đại', 'co-dai', 0),
(18, 'Trùng Sinh', 'trung-sinh', 0),
(19, 'Đô thị', 'do-thi', 0),
(20, 'Sủng', 'sung', 0),
(21, 'Huyễn', 'huyen', 0),
(22, 'Kiếm Hiêp', 'kiem-hiep', 0),
(23, 'Thám hiểm', 'tham-hiem', 0),
(24, 'Hài hước', 'hai-huoc', 0),
(25, 'Linh Dị', 'linh-di', 0),
(26, 'Đông phương', 'dong-phuong', 0),
(27, 'Hệ thống', 'he-thong', 0),
(28, 'Cung đấu', 'cung-dau', 0),
(29, 'Nữ cường', 'nu-cuong', 0),
(30, 'Quân sự', 'quan-su', 0),
(31, 'Mạt thế', 'mat-the', 0),
(32, 'Phương tây', 'phuong-tay', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloai_truyen`
--

CREATE TABLE `theloai_truyen` (
  `id` int(11) NOT NULL,
  `truyen_id` int(11) NOT NULL,
  `theloai_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `theloai_truyen`
--

INSERT INTO `theloai_truyen` (`id`, `truyen_id`, `theloai_id`) VALUES
(1, 18, 15),
(2, 18, 14),
(3, 18, 13),
(4, 20, 32),
(5, 20, 19),
(6, 20, 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL,
  `trans_no` varchar(255) NOT NULL,
  `trans_des` varchar(255) DEFAULT NULL,
  `trans_amount` decimal(12,2) DEFAULT NULL,
  `trans_type` varchar(255) DEFAULT NULL,
  `bank_code` varchar(255) DEFAULT NULL,
  `trans_info` varchar(255) DEFAULT NULL,
  `status` enum('thanh toán thành công','thanh toán thất bại','chưa thanh toán') NOT NULL DEFAULT 'chưa thanh toán',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transactions`
--

INSERT INTO `transactions` (`id`, `id_user`, `trans_no`, `trans_des`, `trans_amount`, `trans_type`, `bank_code`, `trans_info`, `status`, `created_at`, `updated_at`) VALUES
(9, 5, '14278034', NULL, 99000.00, 'ATM', 'NCB', 'Thanh toán mua gói nâng cấp tài khoản TRUYENHAY24H', 'thanh toán thành công', '2024-01-10 08:59:08', '2024-01-10 08:59:08'),
(10, 5, '14278205', NULL, 99000.00, 'ATM', 'NCB', 'Thanh toán mua gói nâng cấp tài khoản TRUYENHAY24H', 'thanh toán thành công', '2024-01-10 19:10:13', '2024-01-10 19:10:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `truyen`
--

CREATE TABLE `truyen` (
  `id` int(10) UNSIGNED NOT NULL,
  `tentruyen` varchar(255) NOT NULL,
  `tukhoa` varchar(255) NOT NULL,
  `tacgia` varchar(255) NOT NULL,
  `slug_tacgia` varchar(255) NOT NULL,
  `danhmuc_id` int(11) NOT NULL,
  `theloai_id` int(11) UNSIGNED NOT NULL,
  `tomtat` text NOT NULL,
  `hinhanh` varchar(255) NOT NULL,
  `slug_truyen` varchar(255) NOT NULL,
  `kichhoat` int(11) NOT NULL,
  `luotxem` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `truyen`
--

INSERT INTO `truyen` (`id`, `tentruyen`, `tukhoa`, `tacgia`, `slug_tacgia`, `danhmuc_id`, `theloai_id`, `tomtat`, `hinhanh`, `slug_truyen`, `kichhoat`, `luotxem`, `created_at`, `updated_at`) VALUES
(7, 'ĐẤU LA ĐẠI LỤC', 'đấu la đại lục, dau la dai luc', 'Đường Gia Tam Thiếu', 'duong-gia-tam-thieu', 3, 12, 'Một đại lục không hề yên bình, một cuộc sống đầy hiểm nguy, phiêu lưu nhưng cũng không kém phần lãng mạn. tình yêu, thù hận, trách nhiệm… Tiếp bước những tiền bối đi trước, Hoắc Vũ Hạo và đời sau sử lai khắc thất quái, bằng niềm tin nhiệt huyết tuổi trẻ đã gây dựng lại đường môn tái lập những huy hoàng xưa kia của các tiền bối đi trước…\r\nKiếp trước là thiên tài sau khi chế tạo ám khí cao nhất của đường môn: Phật Nộ Liên Hoa. Xuyên việt mang theo võ công cùng với ám khí Đường Môn đến thế giới không có võ công cùng ám khí siêu đẳng như thế, chuyện gì sẽ xảy ra tiếp theo? Hãy cùng nhau theo dõi Đấu La Đại Lục để biết rõ bạn nhé.', 'dau-la-dai-luc-23042045.jpg', 'dau-la-dai-luc', 0, 15, NULL, '2024-01-10 09:36:45'),
(8, '[ĐẤU LA ĐẠI LỤC 5] TRÙNG SINH ĐƯỜNG TAM', 'đấu la đại lục 5 , dau la dai luc 5', 'Đường Gia Tam Thiếu', 'duong-gia-tam-thieu', 2, 12, 'Trong vũ trụ bao la rộng lớn, một quang điểm nho nhỏ lướt qua.\r\n\r\nĐó là một quang điểm căn bản không làm cho người khác chú ý, dường như là thật lại giống như hư vô.\r\n\r\nChỉ là bên trong quang điểm đó có ý thức tồn tại, hay nói chính xác là thần thức.\r\n\r\nBởi vì chỉ có thần thức mới có thể phiêu du trong vũ trụ mà không biến mất. Thậm chí, nó còn đang đuổi theo một hướng để tìm kiếm.\r\n\r\nThời khắc khi thê tử chết đi, thần thức dật tán, chỉ có chuyển thế trùng sinh, mới có khả năng tái nhập nhân gian.\r\n\r\nTrên thế giới này không có cái gì hoàn toàn chắc chắn, coi như hắn là Thần Vương, có thể nghịch chuyển thời gian nhưng cũng không thể nghịch chuyển hết thảy.\r\n\r\nHắn không có lựa chọn khác, hắn chỉ có thể lựa chọn đi tìm nàng. Dù là bỏ đi vài vạn năm tu vi, bỏ đi thân phận một đời Thần Vương.\r\n\r\nBởi vì là, không có điều gì có thể so với nàng. Nàng không có ở đây, coi như là Vũ Trụ chi vương thì như thế nào? Không có nàng, hết thảy đều không có ý nghĩa.\r\n\r\nHắn biết rõ mình chọn tự tử, chỉ lưu lại một điểm thần thức để đi tìm kiếm thê tử. Hắn tin tưởng, mình nhất định có thể tìm được thế giới mà nàng chuyển thế trùng sinh.\r\n\r\nTrong đầu không ngừng hiện ra những kỉ niệm, từ lần đầu tiên bọn họ gặp mặt, đến thời khắc cuối cùng nàng rời đi.\r\n\r\nTất cả đều là khắc cốt ghi tâm, dù là vạn năm qua đi cũng không thể phai mờ.\r\n\r\nTiểu Vũ, chờ ta!\r\n\r\nTa đến rồi.', 'daula547.jpg', '[dau-la-dai-luc-5]-trung-sinh-duong-tam', 0, 5, NULL, '2023-12-26 07:42:35'),
(9, 'VÌ EM LÀ DUY NHẤT! NÊN NHẤT ĐỊNH PHẢI LÀ EM', 'vì em là duy nhất, vi em la duy nhat', 'Rick bn', 'rick-bn', 2, 15, '“ Hạ Bắc Sâm! anh đừng thách em chúng ta ngay từ đầu chỉ là bản hôn nhân hợp đồng vốn dĩ không liên quan gì nhau cả ” Doãn Từ Ân cầm chiếc nhẫn cưới trên tay ném thẳng vào người anh một cái mạnh, chiếc nhẫn rơi xuống nền nhà kêu leng keng.\r\n\r\nHạ Bắc Sâm trợn tròn mắt không giữ được bình tĩnh, anh bóp chặt lấy cằm của cô hét lớn.“ Em nói lại xem? Doãn Từ Ân em nói lại một lần nữa xem ”', 'vi-em-la-duy-nhat-nen-nhat-dinh-phai-la-em92.jpg', 'vi-em-la-duy-nhat-nen-nhat-dinh-phai-la-em', 1, 10, NULL, NULL),
(10, 'KHI HOÀNG ĐẾ XUYÊN TỚI: CÔ DÂU THỨ CHÍN CỦA TỊCH GIA!', 'khi hoàng đế xuyên không, khi hoang de xuyen khong', 'Nguyệt Y Y', 'nguyet-y-y', 3, 14, 'Nàng là Hoàng Đế nữ giả nam, tên Tử Sở Tuyên, tay dính đầy máu bước lên hoàng vị\r\n\r\nCô là Minh Nhạc Y, một cô con gái nuôi trong một gia đình sắp bị phá sản, bị cha mẹ nuôi bán cho Tịch Gia làm thiếu phu nhân, tính cách yếu đuối\r\n\r\nHai con người, hai tính cách, hai số phận. Vị Hoàng Đế trên vạn người khi trở thành một thiếu nữ chân yếu tay mềm sẽ có bao nhiêu chuyện xảy ra?', 'khi-hoang-de-xuyen-toi-co-dau-thu-chin-cua-tich-gia2.jpg', 'khi-hoang-de-xuyen-toi-co-dau-thu-chin-cua-tich-gia', 0, 23, NULL, '2024-01-10 09:52:03'),
(11, 'Y TIÊN - VÂN MẠC', 'y tiên, y tien', 'Một miếng ngói xanh', 'mot-mieng-ngoi-xanh', 1, 15, 'Vân Mạc tuy không thể tu hành, nhưng vẫn bồi dưỡng ra một Thần đế chiến lực phi phàm, vậy mà lại bị chính đồ đệ Thần đế của mình cướp đi đan Tái Thế, khiến hắn không thể tiếp tục trường sinh. Mở mắt, Vân Mạc phát hiện mình không những trùng sinh, mà còn có cơ địa tu luyện. Kiếp này, hắn quyết trấn áp nghiệt đồ, phá tan mọi gông cuồng xiềng xích, đứng sừng sững trên đỉnh võ đạo!', 'y-tien-van-mac77.jpg', 'y-tien-van-mac', 0, 32, NULL, '2023-12-26 12:08:14'),
(12, 'ĐẤU PHÁ THƯƠNG KHUNG', 'dau pha thuong khung, đấu phá thương khung', 'Thiên Tàm Thổ Đậu', 'thien-tam-to-dau', 3, 12, '- Đấu Phá Thương Khung là một câu chuyện huyền huyễn đặc sắc kể về Tiêu Viêm, một thiên chi kiêu tử với thiên phú tu luyện mà ai ai cũng hâm mộ, bỗng một ngày người mẹ mất đi đễ lại di vật là một chiếc giới chỉ màu đen nhưng từ khi đó Tiêu Viêm đã mất đi thiên phú tu luyện của mình.\r\n\r\n- Từ thiên tài rớt xuống làm phế vật trong 3 năm, rồi bị vị hôn thê thẳng thừng từ hôn, làm dấy lên ý chí nam nhi của mình, Tiêu Viêm nhờ di vật của mẫu thân để lại là 1 chiếc hắc giới chỉ (nhẫn màu đen)Tiêu Viêm gặp được hồn của Dược Lão (Dược Trần – Dược tôn giả) 1 đại luyện dược tông sư của đấu khí đại lục…\r\n\r\n- Từ đó cuộc đời của Tiêu Viêm có những biến hóa gì? Gặp được các đại ngộ gì? Thân phận thật sự của Huân Nhi (thanh mai trúc mã lúc nhỏ của Tiêu Viêm) ra sao? Bí mật của gia tộc hắn là gì? Cùng theo dõi bộ truyện Đấu Phá Thương Khung để có thể giải đáp các thắc mắc này các bạn nhé!', 'truyen-dau-pha-thuong-khung22.jpg', 'dau-pha-thuong-khung', 0, 85, NULL, '2024-01-10 18:09:47'),
(13, 'THÔN PHỆ TINH KHÔNG', 'la phong, thon phe tinh khong, thôn phệ tinh không', 'Ngã Cật Tây Hồng Thị', 'nga-cat-tay-hong-thi', 3, 14, 'Đây là 1 bộ truyện mới của cà chua thuộc thể loại Khoa Ảo mới mẻ. Nhân vật chính là La Phong luôn muốn cố gắng trở thành 1 võ giả trong thế giới hiện đại tương lai đầy lạ lẫm, loại người đứng trước nguy cơ quái thú. Mở đầu câu chuyện rất hấp dẫn lôi cuốn, qua từng câu văn người đọc sẽ tự nhận biết được bối cảnh của câu chuyện.Nỗ lực, khát khao, có tình có nghĩa, lối hành văn vững chắc sẽ làm bạn nếu đã đọc liền k thể rời mắt, vẫn là cà chua, hãy theo La Phong của chúng ta khám phá ra thế giới vô tận trong vũ trụ tinh không nhé', 'thon-phe-tinh-khong10.jpg', 'thon-phe-tinh-khong', 0, 220, NULL, '2024-01-10 18:04:24'),
(14, 'THẦN ĐẠO ĐAN TÔN', 'than dao dan ton, thần đạo đan tôn', 'Cô Đơn Địa Phi', 'co-don-dia-phi', 1, 12, 'Lăng Hàn - Một Đan Đế đại danh đỉnh định mang trong thân mình tuyệt thế công pháp vì truy cầu bước cuối, xé bỏ tấm màn thành thần nhưng thất bại đã phải bỏ mình. Thế nhưng ông trời dường như không muốn tuyệt dường người, Lăng Hàn đã được trọng sinh vào một thiếu niên cùng tên và điều may mắn nhất là \"Bất Diệt Thiên Kinh\" ấn ký vẫn còn nằm nguyên trong tâm thức hắn.\r\n\r\nTừ nay về sau sóng gió cuộn trào nổi lên, Đan Đế ngày xưa bây giờ phải cùng tranh phong với vô số thiên tài trẻ tuổi, lại bắt đầu một truyền thuyết mới như để chứng minh với trời đất: Ta, là người mạnh nhất!\r\nPhân chia cảnh giới: Luyện Thể, Tụ Nguyên, Dũng Tuyền, Linh Hải, Thần Thai, Sinh Hoa, Linh Anh, Hóa Thần cùng Thiên Nhân Cảnh.....\r\nMỗi cảnh giới chia làm chín tầng: tầng một đến ba là tiền kỳ, tầng bốn đến sáu gọi là trung kỳ và tầng bảy đến chín gọi là hậu kỳ và đỉnh\r\nCảnh giới Đan Sư: Hoàng cấp,Huyền cấp, Địa cấp, Thiên cấp...\r\nThần Cảnh: Nhật Nguyệt Cảnh, Sơn Hà Cảnh, Tinh Thần Cảnh, Hằng Hà Cảnh, Sáng Thế Cảnh\r\nMỗi cảnh giới chia làm: Tiểu Cực Vị, Trung Cực Vị, Đại Cực Vi, Đại Viên Mãn trong một Cực Vị lại chia làm: Tiền kỳ, Trung kỳ, Hậu kỳ, Viên mãn\r\nCảnh giới Tiên Vực:Trảm Trần Cảnh (Nhất Trảm-Nhị Trảm-Tam Trảm-Tứ Trảm-Ngũ Trảm),Phân Hồn Cảnh (Dương Hồn-Âm Hồn-Thiên Hồn-Địa Hồn), Tiên Phủ Cảnh, Thăng Nguyên Cảnh, Tiên Vương có 9 tầng từ 1 đến 9, bên trên Tiên Vương là Thiên Tôn\r\nCảnh giới Đan Sư ở Tiên Vực: Nhất Tinh, Nhị Tinh, Tam Tinh, Tứ Tinh,Ngũ Tinh Đan Sư', 'than-dao-dan-ton-6060286.jpg', 'than-dao-dan-ton', 0, 109, NULL, '2024-01-10 09:15:37'),
(15, 'MÊ VỢ KHÔNG LỐI VỀ', 'mê vợ không lối về, me vo khong loi ve', 'Chiêu Tài Tiến Bảo', 'chieu-tai-tien-bao', 2, 15, 'Một cuộc giao dịch, cô mang thai con của người lạ, mang bụng bầu gả cho người đàn ông đã đính ước từ nhỏ. Vốn cho rằng chỉ là một cuộc giao dịch, lại dây dưa thứ tình cảm không nên có trong cuộc hôn nhân này. Mười tháng hoài thai sắp sinh, một tờ đơn ly hôn trên đất, cô mới hoàn toàn tình ngộ. Sau này anh ta nói \"Bà xã về đi, người anh yêu luôn là em\"', 'me-vo-khong-loi-ve-98289193.jpg', 'me-vo-khong-loi-ve', 0, 41, NULL, '2024-01-10 18:04:37'),
(16, 'LINH VŨ THIÊN HẠ', 'linh vũ thiên hạ, linh vu thien ha', 'Vũ Phong', 'vu-phong', 1, 12, 'Nhóm dịch: Sói Già\r\nĐả tự: Bựa Thập Ngũ BLH\r\n\r\nLục Thiếu Du, linh hồn bị xuyên qua đến thế giới khác, nhập vào thân thể của một thiếu gia không có địa vị phải trải qua cuộc sống không khác gì nô bộc.\r\nThế giới này lấy Vũ vi cường, lấy Linh vi tôn, nghe đồn khi võ đạo đỉnh phong, linh đạo đạt đến cực hạn có thể phá toái hư không.\r\nLục Thiếu Du mang theo ký ức từ kiếp trước tái sinh, không cam lòng làm một thiếu gia chẳng khác gì củi mục.\r\n\r\nTrong thế giới xa lạ,\r\nSay - nằm trên gối mỹ nhân,\r\nTỉnh - nắm quyền thiên hạ.\r\nĐây mới là cuộc sống đáng mơ ước.\r\nLinh - Vũ song tu\r\nBá chủ kiêu hùng\r\nĐã đến, ta sẽ lưu lại một huyền thoại......\r\n\r\nHệ Thống Tu Luyện:\r\n\r\n- Vũ giả: Vũ khí, Vũ đồ, Vũ sĩ, Vũ sư, Vũ phách, Vũ tướng, Vũ suất, Vũ vương, Vũ tôn, Vũ đế.\r\n- Linh giả: Linh khí, Linh đồ, Linh sĩ, Linh sư, Linh phách, Linh tướng, Linh suất, Linh vương, Linh tôn, Linh đế.\r\n\r\nMỗi cấp được chia làm cửu trọng (chín tầng). Ngoài ra còn có Yêu thú, Linh thú các thể loại, chia làm nhất giai, nhị giai,... mỗi giai chia làm sơ kỳ, trung kỳ, hậu kỳ.\r\n\r\n- Công pháp: chia làm sáu loại, từ cao đến thấp: Thiên, Địa, Huyền, Hoàng, Tinh, Thần\r\n\r\nTất nhiên là vẫn tồn tại một số công pháp đặc biệt bí ẩn khác.\r\n\r\n- Ngũ hệ: Vũ giả, Vũ kỹ (công pháp cho vũ giả) được chia thành năm loại Mộc, Thủy, Hỏa, Thổ, Phong.', 'linh-vu-thien-ha27.jpg', 'linh-vu-thien-ha', 0, 65, NULL, '2024-01-10 18:41:06'),
(17, 'THẾ GIỚI HOÀN MỸ', 'the gioi hoan my, thế giới hoàn mỹ, thạch hạo', 'Thần Đông', 'than-dong', 1, 12, 'Dịch giả: Ronkute, Yencute, Ryuken, kukhoai, bokinhvan, Kensin_Kaoru, Big Bang, Luciferht, Độc Nhân\r\n\r\nMột hạt bụi có thể lấp biển, một cọng cỏ chém hết mặt trời mặt trăng và ngôi sao, trong nháy mắt ở giữa long trời lỡ đất. Quần hùng cùng nổi lên, vạn tộc mọc lên san sát như rừng, chư thánh tranh bá, loạn khắp đất trời. Hỏi mặt đất bao la, cuộc đời thăng trầm? Một thiếu niên theo trong đất hoang đi ra, tất cả bắt đầu từ nơi này...', 'the-gioi-hoan-my79.jpg', 'the-gioi-hoan-my', 0, 47, NULL, '2024-01-10 19:02:12'),
(18, 'PHÀM NHÂN TU TIÊN', 'hàn lập, phàm nhân tu tiên, pham nhan tu tien', 'Vong Ngữ', 'vong-ngu', 3, 1, '<p>Ph&agrave;m Nh&acirc;n Tu Ti&ecirc;n l&agrave; một c&acirc;u chuyện Ti&ecirc;n Hiệp kể về H&agrave;n Lập - Một người b&igrave;nh thường nhưng lại gặp v&ocirc; v&agrave;n cơ duy&ecirc;n để bước đi tr&ecirc;n con đường tu ti&ecirc;n, kh&ocirc;ng phải anh h&ugrave;ng - cũng chẳng phải tiểu nh&acirc;n, H&agrave;n Lập từng bước khẳng định m&igrave;nh... Liệu H&agrave;n Lập v&agrave; người y&ecirc;u c&oacute; thể c&ugrave;ng bước tr&ecirc;n con đường tu ti&ecirc;n v&agrave; c&oacute; một c&aacute;i kết ho&agrave;n mỹ? Những thử th&aacute;ch n&agrave;o đang chờ đợi bọn họ? - Truyện kết cấu kh&aacute; hợp l&yacute;, t&igrave;nh tiết kh&ocirc;ng qu&aacute; chậm, kh&ocirc;ng qu&aacute; nhanh, diễn tả kh&aacute; đặc biệt, lời văn tr&ocirc;i chảy, nh&acirc;n vật t&iacute;nh c&aacute;ch đặc th&ugrave;. Nh&acirc;n vật ch&iacute;nh, H&agrave;n Lập, mang hơi hướng kh&aacute; c&ocirc; độc. Bạn n&agrave;o th&iacute;ch đọc Tru Ti&ecirc;n hoặc Thương Thi&ecirc;n chắc sẽ th&iacute;ch Ph&agrave;m Nh&acirc;n Tu Ti&ecirc;n Truyện. Mời bạn đọc c&ugrave;ng thưởng thức v&agrave; d&otilde;i theo bước ch&acirc;n của H&agrave;n Lập!</p>', 'pham-nhan-tu-tien91.jpg', 'pham-nhan-tu-tien', 0, 175, NULL, '2024-01-10 19:02:02'),
(20, 'ANH ĐÀO HỔ PHÁCH', 'Anh đào,hổ phách,vân trụ', 'Vân Trụ', 'van-tru', 2, 1, '<p>L&acirc;m Kỳ Nhạc l&agrave; một thiếu nữ ở thị trấn nhỏ. C&ocirc; tự thấy hai mươi năm của m&igrave;nh thật sự rất y&ecirc;n b&igrave;nh, mọi việc thuận lợi, xu&ocirc;i ch&egrave;o m&aacute;t m&aacute;i. Chỉ tiếc nuối duy nhất một điều, ch&iacute;nh l&agrave; chưa trải qua cảm gi&aacute;c y&ecirc;u đương thuở mới lớn bao giờ.<br />\r\n<br />\r\nCon cưng của trời Tưởng Kiều T&acirc;y, niềm vui nỗi buồn lẫn lộn hai mươi năm, gặp gỡ L&acirc;m Kỳ Nhạc năm ấy, anh tự nhận m&igrave;nh bước v&agrave;o một hồi đại vận.<br />\r\n<br />\r\nTr&ecirc;n b&aacute;o n&oacute;i rằng, năm 1990 số trẻ em mới sinh ra ở Trung Quốc l&agrave; hai mươi s&aacute;u triệu hai trăm mười ng&agrave;n người. Trong số đ&oacute; c&oacute; L&acirc;m Kỳ Nhạc, c&oacute; Dư Tiều, Đỗ Thượng, c&oacute; Th&aacute;i Phương Nguy&ecirc;n, c&oacute; v&ocirc; số bạn b&egrave; c&ugrave;ng lớp, bạn thời để chỏm, cố nhi&ecirc;n cũng c&oacute; Tưởng Kiều T&acirc;y</p>', 'anh_dao_ho_phach45.jpg', 'anh-dao-ho-phach', 0, 2, '2024-01-10 19:04:48', '2024-01-10 19:10:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_admin` int(11) DEFAULT NULL,
  `is_vip` tinyint(1) NOT NULL DEFAULT 0,
  `vip_expire_at` datetime DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `is_admin`, `is_vip`, `vip_expire_at`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'testuser1', NULL, 0, NULL, 'testuser1@gmail.com', NULL, '$2y$10$cPivwUGtoJdUbs.oRI/HG.zoD0Gd/nxtFmz3qNQTXOLnest6mUHJ2', NULL, '2023-05-04 03:30:37', '2023-05-04 03:30:37'),
(5, 'admin', 1, 1, '2024-01-13 02:10:13', 'admin@gmail.com', NULL, '$2y$10$oCH8G1zzWNVAl2PSFmMPD.zDc5jT7B3SBxj3ZrO3jfqOitR/o7wv2', '8kD1d1ZaIjNWoe7gTLP8ZCD7SkSCPN9b07XOXpKQ394guc88Cs9qFGnwqZOo', '2023-05-04 03:31:46', '2023-05-04 08:51:03'),
(6, 'test1', NULL, 0, NULL, 'test1@gmail.com', NULL, '$2y$10$vdKXI.CWDkNARp6ggZMht.yV.QZt1g3LU53nam94H28cEDZPRqOqC', NULL, '2023-05-04 07:12:18', '2023-05-04 08:51:25'),
(7, 'hiep', NULL, 0, NULL, 'hiep123@gmail.com', NULL, '$2y$10$zAUejAjh9nZcWcV8WfJlx.WR6eMB78NOS1cB68yyPI35T25NHnLe6', NULL, '2023-11-22 09:14:40', '2023-11-22 09:14:40'),
(9, 'test', NULL, 0, NULL, 'test1111@gmail.com', NULL, '$2y$10$yKc77dU29O3ioPh0w1ZPF.Fl9Dhfuggq/Bdwu3TKfEWk1RYuKFG2G', NULL, '2023-12-26 12:14:44', '2023-12-26 12:14:44');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `chuong_id` (`chuong_id`);

--
-- Chỉ mục cho bảng `chuong`
--
ALTER TABLE `chuong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `truyen_id` (`truyen_id`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_id_user_foreign` (`id_user`),
  ADD KEY `truyen` (`truyen_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `theloai`
--
ALTER TABLE `theloai`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `theloai_truyen`
--
ALTER TABLE `theloai_truyen`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_id_user_foreign` (`id_user`);

--
-- Chỉ mục cho bảng `truyen`
--
ALTER TABLE `truyen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `danhmuc_id` (`theloai_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `chuong`
--
ALTER TABLE `chuong`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `theloai`
--
ALTER TABLE `theloai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `theloai_truyen`
--
ALTER TABLE `theloai_truyen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `truyen`
--
ALTER TABLE `truyen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chuong`
--
ALTER TABLE `chuong`
  ADD CONSTRAINT `chuong_ibfk_1` FOREIGN KEY (`truyen_id`) REFERENCES `truyen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `truyen` FOREIGN KEY (`truyen_id`) REFERENCES `truyen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
