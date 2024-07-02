-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 01, 2024 lúc 03:52 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laravel_project`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `course_id`, `student_id`, `created_at`, `updated_at`) VALUES
(14, 2, 4, '2023-12-31 02:43:49', '2023-12-31 02:43:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `public` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `public`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'Lập trình Mobile', NULL, 1, 1, 1, '2023-12-11 08:18:54', '2023-12-31 02:20:18'),
(7, 'Phân tích thiết kế', NULL, 1, 1, 1, '2023-12-11 08:18:54', '2023-12-31 02:20:00'),
(10, 'Lập trình Backend', NULL, 1, 1, 1, '2023-12-31 02:01:41', '2023-12-31 02:01:41'),
(11, 'Lập trình Front-End', NULL, 1, 1, 1, '2023-12-31 02:19:38', '2023-12-31 02:19:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `childs_menu`
--

CREATE TABLE `childs_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `childs_menu`
--

INSERT INTO `childs_menu` (`id`, `name`, `icon`, `link`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 'Đơn hàng', NULL, 'admin.order.index', 1, '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(2, 'Quản lý khóa học', NULL, 'admin.course.index', 2, '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(3, 'Quản lý danh mục', NULL, 'admin.category.index', 2, '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(4, 'Đánh giá', NULL, 'admin.review.index', 3, '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(5, 'Tin tức', NULL, 'admin.post.index', 3, '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(6, 'Quản lý người dùng', NULL, 'admin.user.index', 4, '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(7, 'Quản lý giảng viên', NULL, 'admin.teacher.index', 4, '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(8, 'Nhóm quyền', NULL, 'admin.role.index', 5, '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(9, 'Quyền hạn', NULL, 'admin.permission.index', 5, '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(10, 'Menu', NULL, 'admin.menu.index', 6, '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(11, 'Khóa học của tôi', NULL, 'admin.gv.myCourses', 7, '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(12, 'Học viên của tôi', NULL, 'admin.gv.myStudents', 8, '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(13, 'Quản lý học viên', NULL, 'admin.student.index', 4, '2024-01-01 13:43:12', '2024-01-01 13:43:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `detail` varchar(500) DEFAULT NULL,
  `price` double(15,2) NOT NULL DEFAULT 0.00,
  `sale_price` double(15,2) NOT NULL DEFAULT 0.00,
  `durations` double(8,2) NOT NULL DEFAULT 0.00,
  `is_document` tinyint(4) NOT NULL DEFAULT 0,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `courses`
--

INSERT INTO `courses` (`id`, `name`, `slug`, `image_path`, `detail`, `price`, `sale_price`, `durations`, `is_document`, `teacher_id`, `category_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'C++ from basic to advanced', NULL, 'img/courses/c.png', 'This course will help you learn the steps to improve argorithm and structure in C++', 1500000.00, 900000.00, 0.00, 0, 3, 7, 0, '2023-12-11 08:18:54', '2023-12-11 08:18:54', NULL),
(6, 'Giải thuật C/C++', NULL, 'img/courses/Ya1sOfffyk8P0xxQ1IkTBSH8CGqGNXmDno2Ewi5U.jpg', 'C++', 1500000.00, 1299999.00, 0.00, 0, 3, 7, 0, '2023-12-31 01:59:30', '2023-12-31 02:42:08', '2023-12-31 02:42:08'),
(8, 'Tìm Hiểu Về Kotlin', NULL, 'img/courses/4ByvWRgwVAwJCofb1s2xVY9Fyay0ZnPMXaOvCM0Y.jpg', 'Kotlin', 2000000.00, 1359999.00, 0.00, 0, 4, 2, 0, '2023-12-31 02:06:00', '2023-12-31 02:06:00', NULL),
(10, 'Tự Học Node.JS Cơ Bản Từ A Đến Z Cho Người Mới Bắt Đầu', NULL, 'img/courses/78bMvChFYVLiCA0KdgBHgVoH0XPLZkk1GTe5atD0.png', 'NodeJs', 2000000.00, 1299999.00, 0.00, 0, 1, 10, 0, '2023-12-31 02:22:16', '2023-12-31 02:22:16', NULL),
(11, 'CORE JAVA TUTORIAL FOR BEGINNERS', NULL, 'img/courses/sA8GjSt9XiTLRybXF7YPBXe44QCClD9onv0PQVmb.jpg', 'Java', 1500000.00, 1299999.00, 0.00, 0, 3, 10, 0, '2023-12-31 02:23:17', '2023-12-31 02:23:38', '2023-12-31 02:23:38'),
(12, 'CORE JAVA TUTORIAL FOR BEGINNERS', NULL, 'img/courses/3Pg9QFBKk9AWsGkB8tVJTH9FkhhqvAXnHN8hJhH1.jpg', 'Java', 1500000.00, 1299999.00, 0.00, 0, 3, 10, 0, '2023-12-31 02:24:02', '2023-12-31 02:24:02', NULL),
(13, 'Khoá học Laravel Framework 8.x', NULL, 'img/courses/TqHyxHqhnqrDvuhrcMbAppM82t5KzeYbhw8uVcb0.png', 'Laravel', 1499999.00, 999999.00, 0.00, 0, 4, 10, 0, '2023-12-31 02:25:40', '2023-12-31 02:25:40', NULL),
(14, 'React Season 1 | Tự Học React Cơ Bản Từ A đến Z Cho Người Mới Bắt Đầu', NULL, 'img/courses/EQI5Lb0aJf4rnMYB2ukmMliCiEHFDJwsTOGmRPp5.jpg', 'ReactJs', 900000.00, 850000.00, 0.00, 0, 3, 11, 0, '2023-12-31 02:26:31', '2023-12-31 02:26:31', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `courses_students`
--

CREATE TABLE `courses_students` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `courses_students`
--

INSERT INTO `courses_students` (`id`, `student_id`, `course_id`, `created_at`, `updated_at`) VALUES
(5, 4, 2, '2023-12-31 03:00:08', '2023-12-31 03:00:08'),
(6, 5, 10, '2024-01-01 12:09:23', '2024-01-01 12:09:23'),
(7, 5, 12, '2024-01-01 12:09:23', '2024-01-01 12:09:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course_reviews`
--

CREATE TABLE `course_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `stars` double(8,2) NOT NULL DEFAULT 0.00,
  `student_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `documentaries`
--

CREATE TABLE `documentaries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `size` double(8,2) NOT NULL DEFAULT 0.00,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `documentaries`
--

INSERT INTO `documentaries` (`id`, `name`, `url`, `size`, `lesson_id`, `created_at`, `updated_at`) VALUES
(2, '1. Xây dựng Chức năng Của Một Website | Backend RESTFul Server Node.JS (SQL/MongoDB) Cho Beginners', '1704112210_Phe.docx', 0.00, 27, '2024-01-01 12:30:10', '2024-01-01 12:30:10');

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
-- Cấu trúc bảng cho bảng `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permission` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `groups`
--

INSERT INTO `groups` (`id`, `name`, `permission`, `created_at`, `updated_at`) VALUES
(1, 'Quản trị viên', NULL, '2023-12-11 08:18:54', '2023-12-11 08:18:54'),
(2, 'Giáo viên', NULL, '2023-12-11 08:18:54', '2023-12-11 08:18:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lessons`
--

CREATE TABLE `lessons` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `durations` double(8,2) NOT NULL DEFAULT 0.00,
  `position` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `course_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lessons`
--

INSERT INTO `lessons` (`id`, `name`, `slug`, `description`, `durations`, `position`, `views`, `course_id`, `status`, `created_at`, `updated_at`) VALUES
(22, '2. Cài đặt Dev - C++', NULL, '2. Cài đặt Dev - C++', 0.00, 0, 0, 2, 0, '2023-12-31 02:36:58', '2023-12-31 02:36:58'),
(23, 'Biến và nhập xuất dữ liệu', NULL, 'Biến và nhập xuất dữ liệu', 0.00, 0, 0, 2, 0, '2023-12-31 02:39:23', '2023-12-31 02:39:23'),
(24, 'Toán tử', NULL, 'Toán tử', 0.00, 0, 0, 2, 0, '2023-12-31 02:40:57', '2023-12-31 02:40:57'),
(25, 'Bài 1: Cài đặt Android Studio Preview', NULL, 'Bài 1: Cài đặt Android Studio Preview', 0.00, 0, 0, 8, 0, '2023-12-31 02:44:31', '2023-12-31 02:44:31'),
(26, 'Bài 2: Khai báo biến và kiểu dữ liệu', NULL, 'Bài 2: Khai báo biến và kiểu dữ liệu', 0.00, 0, 0, 8, 0, '2023-12-31 02:45:20', '2023-12-31 02:45:20'),
(27, '1. Xây dựng Chức năng Của Một Website | Backend RESTFul Server Node.JS (SQL/MongoDB) Cho Beginners', NULL, 'Xây dựng Chức năng Của Một Website | Backend RESTFul Server Node.JS (SQL/MongoDB) Cho Beginners', 0.00, 0, 0, 10, 0, '2023-12-31 02:47:43', '2023-12-31 02:47:43'),
(28, '2. Database | Backend RESTFul Server Node.JS (SQL/MongoDB) Cho Beginners', NULL, 'Database | Backend RESTFul Server Node.JS (SQL/MongoDB) Cho Beginners', 0.00, 0, 0, 10, 0, '2023-12-31 02:49:23', '2023-12-31 02:49:23'),
(29, '1. Cài đặt JDK và Eclipse', NULL, '1. Cài đặt JDK và Eclipse', 0.00, 0, 0, 12, 0, '2023-12-31 02:50:40', '2023-12-31 02:50:40'),
(30, '4. Cách khai báo biến trong Java', NULL, 'Cách khai báo biến trong Java', 0.00, 0, 0, 12, 0, '2023-12-31 02:51:34', '2023-12-31 02:51:34'),
(31, '01: Nhập Môn Lập Trình Laravel Framework', NULL, 'Giới Thiệu Laravel Framework - Cài Đặt Laravel 8.X', 0.00, 0, 0, 13, 0, '2023-12-31 02:52:48', '2023-12-31 02:52:48'),
(32, 'Lập trình Laravel Framework cơ bản', NULL, 'Trong bài học này, tôi sẽ hướng dẫn bạn về Routes trong Laravel 8.x - Phần 1. Đây là thành phần rất quan trọng trong Framework nói chung và Laravel Framework nói riêng.', 0.00, 0, 0, 13, 0, '2023-12-31 02:54:41', '2023-12-31 02:54:41'),
(33, '3: Làm việc với Database Laravel', NULL, '3: Làm việc với Database Laravel', 0.00, 0, 0, 13, 0, '2023-12-31 02:56:22', '2023-12-31 02:56:22'),
(34, '1 Why React ? React Có Gì Hot So Với Vue và Angular', NULL, '1 Why React ? React Có Gì Hot So Với Vue và Angular', 0.00, 0, 0, 14, 0, '2023-12-31 02:57:08', '2023-12-31 02:57:08'),
(35, '3 Cài Đặt Môi Trường và Công Cụ Cho Dự Án React.JS |', NULL, '3 Cài Đặt Môi Trường và Công Cụ Cho Dự Án React.JS |', 0.00, 0, 0, 14, 0, '2023-12-31 02:58:00', '2023-12-31 02:58:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lesson_reviews`
--

CREATE TABLE `lesson_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `stars` double(8,2) NOT NULL DEFAULT 0.00,
  `student_id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `role`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Quản lý đơn hàng', 'admin', 'fa fa-cart-plus', '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(2, 'Khóa học & Danh mục', 'admin', 'fa fa-book', '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(3, 'Nội dung', 'admin', 'fa fa-pencil', '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(4, 'Người dùng hệ thống', 'admin', 'fa fa-user', '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(5, 'Quyền hạn người dùng', 'admin', 'fa fa-lock', '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(6, 'Quản lý chung', 'admin', 'fa fa-bars', '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(7, 'Khóa học', 'teacher', 'fa fa-book', '2023-12-11 08:18:55', '2023-12-11 08:18:55'),
(8, 'Học viên', 'teacher', 'fa fa-user', '2023-12-11 08:18:55', '2023-12-11 08:18:55');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_04_104635_create_table_groups', 1),
(6, '2023_11_06_060857_create_posts_table', 1),
(7, '2023_11_06_061910_create_courses_table', 1),
(8, '2023_11_06_061931_create_teachers_table', 1),
(9, '2023_11_06_062008_create_categories_table', 1),
(10, '2023_11_06_062023_create_lessons_table', 1),
(11, '2023_11_06_062040_create_videos_table', 1),
(12, '2023_11_06_062059_create_documentaries_table', 1),
(13, '2023_11_06_062124_create_students_table', 1),
(14, '2023_11_06_062141_create_orders_table', 1),
(15, '2023_11_06_065206_create_courses_students_table', 1),
(16, '2023_11_06_065530_create_orders_detail_table', 1),
(17, '2023_11_06_070552_create_reviews_table', 1),
(18, '2023_11_06_072909_add_foreign_key_users', 1),
(19, '2023_11_06_074100_add_foreign_key_courses', 1),
(20, '2023_11_06_074457_add_foreign_key_courses_students', 1),
(21, '2023_11_06_074753_add_foreign_key_documentaries', 1),
(22, '2023_11_06_074953_add_foreign_key_orders', 1),
(23, '2023_11_06_075319_add_foreign_key_lessons', 1),
(24, '2023_11_06_075451_add_foreign_key_orders_detail', 1),
(25, '2023_11_06_075628_add_foreign_key_posts', 1),
(26, '2023_11_06_075829_add_foreign_reviews', 1),
(27, '2023_11_06_080409_add_foreign_key_videos', 1),
(28, '2023_11_11_162436_add_foreign_key_categories', 1),
(29, '2023_11_19_144252_create_permission_tables', 1),
(30, '2023_11_21_102940_create_menus_table', 1),
(31, '2023_11_21_103125_create_childs_menu_table', 1),
(32, '2023_11_21_103226_add_foreign_key_childs_menu', 1),
(33, '2023_11_26_203633_create_course_reviews_table', 1),
(34, '2023_11_26_203653_create_lesson_reviews_table', 1),
(35, '2023_11_26_203706_create_teacher_reviews_table', 1),
(36, '2023_11_26_203720_create_post_reviews_table', 1),
(37, '2023_12_04_215546_create_notifications_table', 1),
(38, '2023_12_06_005747_create_cart_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL DEFAULT 'user',
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'user', 1),
(1, 'user', 2),
(1, 'user', 4),
(2, 'user', 3),
(2, 'user', 5),
(2, 'user', 6),
(2, 'user', 7),
(2, 'user', 8),
(2, 'user', 9),
(2, 'user', 10),
(2, 'user', 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `content`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 'Nhat Linh vừa mua HTML and CSS for beginer', 'img/courses/html.png', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(2, 'Hải Đăng vừa mua C++ from basic to advanced', 'img/courses/c.png', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(10, 'Trần Thị Nhật Linh      vừa mua khóa học      C++ from basic to advanced', 'img/courses/c.png', '2023-12-31 02:59:53', '2023-12-31 02:59:53'),
(11, 'Hoàng Nhật Đăng      vừa mua khóa học      Tự Học Node.JS Cơ Bản Từ A Đến Z Cho Người Mới Bắt Đầu', 'img/courses/78bMvChFYVLiCA0KdgBHgVoH0XPLZkk1GTe5atD0.png', '2023-12-31 03:18:47', '2023-12-31 03:18:47'),
(12, 'Hoàng Nhật Đăng      vừa mua khóa học      CORE JAVA TUTORIAL FOR BEGINNERS', 'img/courses/3Pg9QFBKk9AWsGkB8tVJTH9FkhhqvAXnHN8hJhH1.jpg', '2023-12-31 03:18:47', '2023-12-31 03:18:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `total` double(20,2) NOT NULL DEFAULT 0.00,
  `student_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `total`, `student_id`, `status`, `created_at`, `updated_at`) VALUES
(11, 900000.00, 4, 1, '2023-12-31 02:59:53', '2023-12-31 03:00:04'),
(12, 2599998.00, 5, 1, '2023-12-31 03:18:47', '2024-01-01 12:09:18'),
(13, 850000.00, 6, 0, '2024-01-01 14:35:59', '2024-01-01 14:35:59'),
(14, 2599998.00, 4, 0, '2024-01-01 14:36:13', '2024-01-01 14:36:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `price` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `order_id`, `course_id`, `price`, `created_at`, `updated_at`) VALUES
(17, 11, 2, 900000.00, '2023-12-31 02:59:53', '2023-12-31 02:59:53'),
(18, 12, 10, 1299999.00, '2023-12-31 03:18:47', '2023-12-31 03:18:47'),
(19, 12, 12, 1299999.00, '2023-12-31 03:18:47', '2023-12-31 03:18:47'),
(20, 13, 14, 850000.00, '2024-01-01 14:35:59', '2024-01-01 14:35:59'),
(21, 14, 10, 1299999.00, '2024-01-01 14:36:13', '2024-01-01 14:36:13'),
(22, 14, 12, 1299999.00, '2024-01-01 14:36:13', '2024-01-01 14:36:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'create_course', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(2, 'edit_course', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(3, 'delete_course', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(4, 'publish_course', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(5, 'create_lesson', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(6, 'edit_lesson', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(7, 'delete_lesson', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(8, 'upload_video', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(9, 'edit_video', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(10, 'delete_video', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(11, 'upload_documentary', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(12, 'edit_documentary', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(13, 'delete_documentary', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(14, 'create_review', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(15, 'edit_review', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(16, 'delete_review', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(17, 'create_post', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(18, 'edit_post', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(19, 'delete_post', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(20, 'view_orders', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(21, 'manage_orders', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(22, 'manage_users', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(23, 'assign_roles', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(24, 'assign_permissions', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(25, 'enroll_in_course', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56');

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `slug`, `image_path`, `category_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Authentication & Authorization trong ReactJS', '<p>Bảo mật người dùng và dữ liệu là một ưu tiên hàng đầu trong phát triển ứng dụng ReactJS, và để đảm bảo điều này, Authentication (Xác thực) và Authorization (Phân quyền) là hai yếu tố quan trọng không thể thiếu.&nbsp;<br><br>Trong quá trình xác thực, ứng dụng xác định xem người dùng có quyền truy cập hay không thông qua việc xác minh danh tính. Sử dụng các kỹ thuật như JSON Web Tokens (JWT), ReactJS tạo và xác minh token để duy trì trạng thái xác thực. Những thư viện như jsonwebtoken giúp quản lý quá trình này một cách hiệu quả.&nbsp;<br><br>Ngay sau đó, phân quyền đảm bảo rằng người dùng chỉ có quyền truy cập vào những phần của ứng dụng mà họ được phép. Sử dụng các cơ sở dữ liệu hoặc middleware, ReactJS có thể kiểm soát quyền truy cập vào các thành phần hoặc tính năng cụ thể. Higher Order Components (HOCs) hoặc Hooks như useEffect thường được sử dụng để kiểm tra quyền truy cập này.<br><br>React Router là công cụ quan trọng giúp bảo vệ các tuyến đường và trang chỉ được truy cập bởi những người dùng có quyền. Việc lưu trữ thông tin xác thực trong Local Storage hoặc Cookies giúp duy trì trạng thái xác thực qua các phiên làm việc.<br><br>Đối với bảo mật toàn diện, không chỉ là về cách triển khai mà còn về cách chúng ta thực hiện các biện pháp an toàn trong mã nguồn. Việc xử lý các vấn đề như Cross-Site Request Forgery (CSRF) đóng một vai trò quan trọng trong việc tạo ra một ứng dụng ReactJS an toàn và đáng tin cậy.<br><br>Tổng cộng, việc tích hợp Authentication và Authorization không chỉ tạo ra một trải nghiệm an toàn cho người dùng mà còn giúp bảo vệ thông tin quan trọng của họ trong môi trường trực tuyến ngày nay.</p>', 'Authentication-&-uthorization-trong-ReactJS', 'img/post/Ht1RqK5jkXezRT0ZhWV4Sgu04BkbxFuis9tRET2R.webp', 11, 1, 0, '2023-12-31 02:28:55', '2023-12-31 02:30:01'),
(2, 'Ưu điểm của ReactJS trong Phát triển Web', '<p>So với nhiều khung công việc khác, ReactJS là một lựa chọn mạnh mẽ cho việc phát triển ứng dụng web hiện đại. Việc sử dụng các thành phần tái sử dụng giúp tạo ra một cấu trúc mã nguồn dễ bảo trì và mở rộng. ReactJS không chỉ giúp tối ưu hóa hiệu suất của ứng dụng mà còn mang lại trải nghiệm người dùng mượt mà hơn thông qua cơ chế làm mới linh hoạt. Việc sử dụng Virtual DOM giúp giảm tải cho máy chủ và tăng tốc độ render, đặc biệt quan trọng khi xây dựng các ứng dụng phức tạp. Ngoài ra, cộng đồng đông đảo và tính tương thích tốt với nhiều thư viện và công nghệ khác nhau làm cho ReactJS trở thành sự lựa chọn lý tưởng cho các dự án phát triển web đa dạng.</p>', 'uu-diem-reactjs-phat-trien-web', 'img/post/AiE2DH2TVwd9AJsIrZTqUNmDQhlPjogEsONYrBvq.webp', 11, 1, 0, '2023-12-31 02:28:55', '2023-12-31 02:30:30'),
(3, 'Tích hợp Redux trong Ứng dụng ReactJS', '<p>Đối với các ứng dụng ReactJS lớn và phức tạp, việc quản lý trạng thái có thể trở nên khó khăn. Đây là nơi mà Redux đến cứu rỗi, cung cấp một quy trình quản lý trạng thái đơn giản và hiệu quả. Redux giúp tổ chức trạng thái của ứng dụng một cách rõ ràng thông qua việc sử dụng một nguồn dữ liệu duy nhất. Điều này không chỉ làm cho việc theo dõi trạng thái dễ dàng mà còn tạo ra tính dự đoán và nhất quán trong quá trình phát triển. Sự tích hợp giữa ReactJS và Redux mang lại một mô hình kiến trúc mạnh mẽ, giúp phát triển ứng dụng linh hoạt và mở rộng một cách dễ dàng. Nhờ vào việc quản lý trạng thái hiệu quả, Redux trở thành một công cụ quan trọng cho những dự án ReactJS lớn và phức tạp.</p>', 'redux-trong-ung-dung-reactjs', 'img/post/9ZnBufrsjPnTKX1hse6uZl2DUQnIpzEqspOeHUAO.png', 10, 1, 0, '2023-12-31 02:28:55', '2023-12-31 02:31:13'),
(4, 'GraphQL: Tương lai của Giao thức Truy vấn Dữ liệu', '<p>GraphQL đã nhanh chóng trở thành một lựa chọn phổ biến trong cộng đồng phát triển web, thay vì REST API truyền thống. Khả năng truy vấn linh hoạt, tiết kiệm băng thông, và khả năng tự mô tả của GraphQL giúp tối ưu hóa quá trình truyền tải dữ liệu giữa máy khách và máy chủ. Sự mở rộng của GraphQL cho phép người phát triển chỉ lấy những dữ liệu cần thiết, giảm lượng dữ liệu không cần thiết được truyền tải qua mạng. Điều này không chỉ tăng hiệu suất ứng dụng mà còn tạo ra một trải nghiệm người dùng tốt hơn. Với khả năng tương tác mạnh mẽ, GraphQL đang dần trở thành xu hướng quan trọng và có thể là giao thức chủ đạo trong tương lai của phát triển web.</p>', 'graphql-tuong-lai-giao-thuc-truy-van-du-lieu', 'img/post/3cjnAAF8AiVtgO6ivBFQRw54DC97LRQLGfvT7wxQ.webp', 10, 1, 0, '2023-12-31 02:28:55', '2023-12-31 02:31:46'),
(5, 'Sự Ra Đời và Phát Triển của Docker trong Hệ Sinh Thái DevOps', '<p>Docker đã đưa đến một cuộc cách mạng trong quá trình triển khai và quản lý ứng dụng. Việc sử dụng containerization giúp đơn giản hóa quá trình triển khai và đảm bảo rằng môi trường phát triển được giữ nguyên từ máy tính cá nhân đến máy chủ. Với sự linh hoạt và tương thích rộng rãi, Docker trở thành một phần không thể thiếu trong hệ sinh thái DevOps. Khả năng tạo ra môi trường đồng nhất giữa các giai đoạn của quy trình phát triển giúp tăng tốc độ và chất lượng của dự án. DevOps không chỉ là một xu hướng, mà còn là một sự thay đổi cách tiếp cận phát triển phần mềm, và Docker chính là một công cụ quan trọng trong hành trang của các nhà phát triển và quản trị hệ thống.</p>', 'docker-trong-he-sinh-thai-devops', 'img/post/XRWRb2JwrJHJ1pTMdXMWcb9YLuKrLQgy5u0UaC2k.png', 2, 1, 0, '2023-12-31 02:28:55', '2023-12-31 02:32:16'),
(6, 'Sự Tăng Trưởng Của Ngôn Ngữ Lập Trình Python', '<p>Python đã trở thành một trong những ngôn ngữ lập trình phổ biến nhất trên thế giới. Được biết đến với cú pháp đơn giản và dễ đọc, Python không chỉ thuận tiện cho người mới học lập trình mà còn được ưa chuộng trong cộng đồng phát triển chuyên nghiệp. Sự đa nhiệm của Python giúp nó trở thành một công cụ linh hoạt cho nhiều ứng dụng, từ phân tích dữ liệu đến phát triển web và trí tuệ nhân tạo. Cộng đồng lớn và tính tương thích với nhiều thư viện và framework khác nhau giúp Python duy trì sức hút của mình trong cả cộng đồng lập trình viên và doanh nghiệp.</p>', 'tang-truong-python-ngon-ngu-lap-trinh', 'img/post/ImlkIkLyfc5N9T8uVpkdEhravaUTCatXTgnX1tnt.jpg', 11, 3, 0, '2023-12-31 02:28:55', '2023-12-31 02:32:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_reviews`
--

CREATE TABLE `post_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `stars` double(8,2) NOT NULL DEFAULT 0.00,
  `student_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `stars` double(8,2) NOT NULL DEFAULT 0.00,
  `user_id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56'),
(2, 'teacher', 'web', '2023-12-11 08:18:56', '2023-12-11 08:18:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `password`, `address`, `status`, `image_path`, `created_at`, `updated_at`) VALUES
(4, 'Trần Thị Nhật Linh', 'linhnhat@gmail.com', '$2y$10$hnCbbKsCtaikgMjdSdliheN3phonS9o9YupbrDLfhGU6XIfSel.DG', NULL, 1, 'img/users/JGD0zvrSBRKl4DEp4Xbl2KO0DuTQWWcQrC4hb8TP.jpg', '2023-12-31 02:33:37', '2024-01-01 14:03:27'),
(5, 'Hoàng Nhật Đăng', 'nhatdang@gmail.com', '$2y$10$oI/Y4HkXKK7S15okFqJkF.YANiB.TTVvMu2NSdrdtRbgGVoktqs7K', NULL, 1, 'img/users/o1wUPTCwbTxULZ3FKYUU7gT6OSIH1UPcrnbV3MAv.jpg', '2023-12-31 03:17:32', '2024-01-01 14:03:17'),
(6, 'John', 'john@gmail.com', '$2y$10$Ta20hOabmCPB5eOJRjNiQ.JOtGAQMrz/vGerCIx5.O7U.kM1cF59u', NULL, 1, 'img/users/ldOgZmJNJyB3A4QSa7kLK29ntylk8Uxcoerw9IQR.jpg', '2023-12-31 03:18:08', '2024-01-01 14:03:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teachers`
--

CREATE TABLE `teachers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `exp` double(8,2) NOT NULL DEFAULT 0.00,
  `image_path` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `description`, `exp`, `image_path`, `slug`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Teacher 01', 'Kỹ sư Devops. Có nhiều năm kinh nghiệm triển khai các mô hình Devops, CI/CD cho các dự án nước ngoài.  <br><br>\r\n                Thành thạo việc sử dụng các công nghệ IT, Devops như: Linux, Docker, MySQL, ElasticSearch, RabbitMQ, Kafka, Nginx,...  <br><br>\r\n                \r\n                Thành thạo các mô hình CI/CD với Jenkins, GitLab CI  <br><br>\r\n                \r\n                Thành thạo lập trình các ngôn ngữ/framework: Java/Spring, NodeJS/Express, Python,...  <br><br>\r\n                \r\n                Thành thạo mô hình Microservices với việc triển khai trên các công nghệ cụm mới nhất: Kubernetes  <br><br>\r\n                \r\n                Hiểu rõ triết lý phát triển phần mềm theo mô hình Devops, DevSecOps, Agile,...', 1.50, 'img/users/Ts1p5WTD9QKurXX7UEbyt1PMIHHvTHLXAlKXG7Qd.png', NULL, 1, 3, '2023-12-11 08:18:54', '2024-01-01 14:29:28'),
(3, 'Teacher 02', '* Tôi có trên 19 năm kinh nghiệm làm việc tại các vị trí như : Lập trình viên, kỹ sư mạng, kỹ sư quản trị hệ thống, trưởng phòng IT, và giám đốc kỹ thuật cho các công ty IT của Việt Nam, Singapore, Nhật Bản. <br><br>\r\n                * Kinh nghiệm tham gia tư vấn thiết kế, triển khai, quản trị nhiều dự án. Xây dựng hệ thống ứng dụng, mạng, bảo mật, và điện toán đám mây trong và ngoài nước. Đã từng tham gia giảng dạy tại các trung tâm, học viện CNTT . <br><br>\r\n                \r\n                * Có chứng chỉ quốc tế: MCSE Cloud Platform and Infrastructure, MCSE Server Infrastructure, LPIC-2 (Linux Professinal Institute), AWS Certified Solutions Architect, AWS Certified SysOps Administrator, Linux Academy Red Hat Certified Engineer', 1.50, 'img/users/pxRITx9kF7t6pmpGqlDhFpUcCUSvWk6HLBDvCcv0.webp', NULL, 1, 6, '2023-12-11 08:18:54', '2024-01-01 14:29:56'),
(4, 'Teacher 03', '* Tôi có trên 19 năm kinh nghiệm làm việc tại các vị trí như : Lập trình viên, kỹ sư mạng, kỹ sư quản trị hệ thống, trưởng phòng IT, và giám đốc kỹ thuật cho các công ty IT của Việt Nam, Singapore, Nhật Bản. <br><br>\r\n                * Kinh nghiệm tham gia tư vấn thiết kế, triển khai, quản trị nhiều dự án. Xây dựng hệ thống ứng dụng, mạng, bảo mật, và điện toán đám mây trong và ngoài nước. Đã từng tham gia giảng dạy tại các trung tâm, học viện CNTT . <br><br>\r\n                \r\n                * Có chứng chỉ quốc tế: MCSE Cloud Platform and Infrastructure, MCSE Server Infrastructure, LPIC-2 (Linux Professinal Institute), AWS Certified Solutions Architect, AWS Certified SysOps Administrator, Linux Academy Red Hat Certified Engineer', 1.50, 'img/users/Ej36e71HesjJ6bqmOrUofDzdk2YsBlY8fz3Gbc2j.jpg', NULL, 1, 7, '2023-12-11 08:18:54', '2024-01-01 14:31:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teacher_reviews`
--

CREATE TABLE `teacher_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `stars` double(8,2) NOT NULL DEFAULT 0.00,
  `student_id` int(10) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `image_path`, `status`, `group_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$Hw.lONstMgopvw78KanG1uWm.owJh2ZszYtp3BlOUKJ/t.ZVa2keC', 'img/users/N5kOtfKh1iapmWQcc9If0JejMbw63ELeZNJ9RXDu.png', 1, 1, NULL, '2023-12-11 08:18:54', '2024-01-01 08:46:47', NULL),
(3, 'Teacher 01', 'teacher01@gmail.com', NULL, '$2y$10$M02O2ydb6pmo1BjKVof9zecyVRWdLayRVNp82ArYZoFdj6iQ/Ngo6', 'img/users/Ts1p5WTD9QKurXX7UEbyt1PMIHHvTHLXAlKXG7Qd.png', 1, 2, NULL, '2023-12-11 08:18:54', '2024-01-01 14:39:44', NULL),
(6, 'Teacher 02', 'teacher02@gmail.com', NULL, '$2y$10$kkBr1igDA1Cg4ao1mOEV/OhZ0Pgi15nYJUDtCfawiWFpX61PxnYia', 'img/users/pxRITx9kF7t6pmpGqlDhFpUcCUSvWk6HLBDvCcv0.webp', 1, 2, NULL, '2023-12-11 08:18:54', '2024-01-01 14:39:39', NULL),
(7, 'Teacher 03', 'teacher03@gmail.com', NULL, '$2y$10$PNE0xZFIA6jLWeYkTmddPO3lHYR.Q.HCX.OPMwUXTCq4ia8n5qUAS', 'img/users/Ej36e71HesjJ6bqmOrUofDzdk2YsBlY8fz3Gbc2j.jpg', 1, 2, NULL, '2023-12-11 08:18:54', '2024-01-01 14:39:41', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `videos`
--

CREATE TABLE `videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `videos`
--

INSERT INTO `videos` (`id`, `lesson_id`, `name`, `url`, `status`, `created_at`, `updated_at`) VALUES
(103, 22, '2. Cài đặt Dev - C++', 'https://www.youtube.com/embed/9_uoKY0AwqE?si=Ox9d3UjEAWjNMVoL', 0, '2023-12-31 02:37:30', '2023-12-31 02:37:30'),
(104, 22, 'Hướng dẫn sử dụng Dev - C++', 'https://www.youtube.com/embed/vFhKEYRBmVY?si=ZsNGYOpQ9Y2j1U_q', 0, '2023-12-31 02:38:34', '2023-12-31 02:38:34'),
(105, 23, 'Biến và nhập xuất dữ liệu', 'https://www.youtube.com/embed/Z5O6pxQm6II?si=-zBGguLR1MtXl2bs', 0, '2023-12-31 02:39:40', '2023-12-31 02:39:40'),
(106, 23, 'Kiểu dữ liệu thường gặp', 'https://www.youtube.com/embed/qpIautEyv2s?si=0tgsZff2oHoYvYJc', 0, '2023-12-31 02:40:06', '2023-12-31 02:40:06'),
(107, 23, 'Biến cục bộ và biến toàn cục', 'https://www.youtube.com/embed/79mzaFPLEz8?si=Bxw6YIVtrrOxV1Fp', 0, '2023-12-31 02:40:27', '2023-12-31 02:40:27'),
(108, 24, 'Toán tử gán và toán tử số học', 'https://www.youtube.com/embed/THAJMtm53ZQ?si=QyopYfqouOlBenIN', 0, '2023-12-31 02:41:17', '2023-12-31 02:41:17'),
(109, 24, 'Toán tử quan hệ và toán tử logic', 'https://www.youtube.com/embed/RX8tkygyHPU?si=foI1SxsXUxki_IA0', 0, '2023-12-31 02:41:36', '2023-12-31 02:41:36'),
(110, 25, 'Bài 1: Cài đặt Android Studio Preview', 'https://www.youtube.com/embed/2CKuiSp_uOQ?si=9Q5HwwGhIq-VuWHD', 0, '2023-12-31 02:44:46', '2023-12-31 02:44:46'),
(111, 26, 'Bài 2: Khai báo biến và kiểu dữ liệu', 'https://www.youtube.com/embed/edJKQPqyOks?si=L2b3-fb_yH1B2lwW', 0, '2023-12-31 02:45:33', '2023-12-31 02:45:33'),
(112, 26, 'Bài 3: Null Safety', 'https://www.youtube.com/embed/XsRnlRApP5Q?si=Tb8PCeP07eK7KJWV', 0, '2023-12-31 02:46:00', '2023-12-31 02:46:00'),
(113, 26, 'Bài 4: Câu lệnh rẽ nhánh IF ELSE', 'https://www.youtube.com/embed/5Ri0MNU6LFo?si=wN_eGacuGXzCbB1x', 0, '2023-12-31 02:46:55', '2023-12-31 02:46:55'),
(114, 27, '1. Xây dựng Chức năng Của Một Website | Backend RESTFul Server Node.JS (SQL/MongoDB) Cho Beginners', 'https://www.youtube.com/embed/WdqMSB2nttk?si=Ti_tLZdKU4PaodfM', 0, '2023-12-31 02:48:05', '2023-12-31 02:48:05'),
(115, 27, '3. Mô Hình Hoạt Động Client Server', 'https://www.youtube.com/embed/GXjt7PcYd6M?si=ZBTgpGcJer2JF4WN', 0, '2023-12-31 02:48:35', '2023-12-31 02:48:35'),
(116, 27, '4. Vận Hành Một Website', 'https://www.youtube.com/embed/qr9yP3_whrQ?si=19d8M8B865czDhDl', 0, '2023-12-31 02:49:00', '2023-12-31 02:49:00'),
(117, 28, '7. Database', 'https://www.youtube.com/embed/i-kRqMZx5fw?si=XvLgqXkwUamTOPsR', 0, '2023-12-31 02:49:47', '2023-12-31 02:49:47'),
(118, 29, '1. Cài đặt JDK và Eclipse', 'https://www.youtube.com/embed/ayA1Lz2qEZo?si=m4OcCLnWFi9MgxwH', 0, '2023-12-31 02:50:55', '2023-12-31 02:50:55'),
(119, 29, '2. Cấu trúc của một lớp Java', 'https://www.youtube.com/embed/6Gbxt2Sox7k?si=DYKCTPFOY1wc_Wse', 0, '2023-12-31 02:51:16', '2023-12-31 02:51:16'),
(120, 30, '5 . Kiểu dữ liệu trong Java', 'https://www.youtube.com/embed/S29I8oXEXf8?si=6HIDoA7rhGIWL12H', 0, '2023-12-31 02:51:51', '2023-12-31 02:51:51'),
(121, 31, '1.Giới Thiệu Laravel Framework - Cài Đặt Laravel 8.X', 'https://www.youtube.com/embed/sMXkSWFlV28?si=pRJuZr7MtdoiGatF', 0, '2023-12-31 02:53:31', '2023-12-31 02:53:31'),
(122, 31, '2: Cấu trúc thư mục - Vòng đời Request trong Laravel', 'https://www.youtube.com/embed/Cm0YBC8YNtw?si=TbQf14BLfXbkU0Qf', 0, '2023-12-31 02:53:54', '2023-12-31 02:53:54'),
(123, 31, '3: Thiết lập cấu hình cần thiết cho Laravel', 'https://www.youtube.com/embed/FkrCUGRyyh4?si=kdu-KVB10LmC42G-', 0, '2023-12-31 02:54:18', '2023-12-31 02:54:18'),
(124, 32, '4: Routes trong Laravel 8.x (Phần 1)', 'https://www.youtube.com/embed/KobysMt-GoE?si=wmqD090JgJAKVXr0', 0, '2023-12-31 02:54:57', '2023-12-31 02:54:57'),
(125, 32, '5: Routes trong Laravel 8.x (Phần 2)', 'https://www.youtube.com/embed/WgKtxVLd7N0?si=XMNEMJTiC0t0P4F-', 0, '2023-12-31 02:55:14', '2023-12-31 02:55:14'),
(126, 32, '6: Controller trong Laravel 8.x', 'https://www.youtube.com/embed/NDMXavNlPg8?si=qwXqP_jDxwg6HI6X', 0, '2023-12-31 02:55:36', '2023-12-31 02:55:36'),
(127, 32, '7: Middleware trong Laravel 8.x', 'https://www.youtube.com/embed/HExNrYyAswo?si=rxFg9Qcp3N0P2eIS', 0, '2023-12-31 02:55:53', '2023-12-31 02:55:53'),
(128, 33, '3: Làm việc với Database Laravel', 'https://www.youtube.com/embed/Uhn7DPXVr2Y?si=h99uMizZIr7spZPQ', 0, '2023-12-31 02:56:33', '2023-12-31 02:56:33'),
(129, 34, '1 Why React ? React Có Gì Hot So Với Vue và Angular', 'https://www.youtube.com/embed/-GE7xzr7ZKc?si=EIvc3gCrK8Sxrj88', 0, '2023-12-31 02:57:19', '2023-12-31 02:57:19'),
(130, 34, '2 Hook/Context vs Class/Redux - Lựa Chọn Công Nghệ Sử Dụng Với React', 'https://www.youtube.com/embed/rBlQgZnbk3A?si=vQkBoznIRkHs8IdA', 0, '2023-12-31 02:57:45', '2023-12-31 02:57:45'),
(131, 35, '3.1 Hello World với React.JS - Cài đặt Project Local', 'https://www.youtube.com/embed/EDjWoDKDPtQ?si=lRjA3-uodtx7V8ei', 0, '2023-12-31 02:58:25', '2023-12-31 02:58:25'),
(132, 35, '3.2 Cài Đặt Project Từ GitHub - SOS Thì Làm Sao', 'https://www.youtube.com/embed/RC41-LLZhpQ?si=RThw4VE-enfLSamS', 0, '2023-12-31 02:58:46', '2023-12-31 02:58:46'),
(133, 35, '3.3 Cấu Trúc Project React.JS - Files Structure |', 'https://www.youtube.com/embed/JsQfIjzaBNE?si=DUiV9bdkhevX2yZ_', 0, '2023-12-31 02:59:09', '2023-12-31 02:59:09');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_course_id_foreign` (`course_id`),
  ADD KEY `cart_student_id_foreign` (`student_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `childs_menu`
--
ALTER TABLE `childs_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `childs_menu_menu_id_foreign` (`menu_id`);

--
-- Chỉ mục cho bảng `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_category_id_foreign` (`category_id`),
  ADD KEY `courses_teacher_id_foreign` (`teacher_id`);

--
-- Chỉ mục cho bảng `courses_students`
--
ALTER TABLE `courses_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_students_course_id_foreign` (`course_id`),
  ADD KEY `courses_students_student_id_foreign` (`student_id`);

--
-- Chỉ mục cho bảng `course_reviews`
--
ALTER TABLE `course_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_reviews_course_id_foreign` (`course_id`),
  ADD KEY `course_reviews_student_id_foreign` (`student_id`);

--
-- Chỉ mục cho bảng `documentaries`
--
ALTER TABLE `documentaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentaries_lesson_id_foreign` (`lesson_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_course_id_foreign` (`course_id`);

--
-- Chỉ mục cho bảng `lesson_reviews`
--
ALTER TABLE `lesson_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_reviews_lesson_id_foreign` (`lesson_id`),
  ADD KEY `lesson_reviews_student_id_foreign` (`student_id`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_student_id_foreign` (`student_id`);

--
-- Chỉ mục cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_detail_course_id_foreign` (`course_id`),
  ADD KEY `orders_detail_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `post_reviews`
--
ALTER TABLE `post_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_reviews_post_id_foreign` (`post_id`),
  ADD KEY `post_reviews_student_id_foreign` (`student_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_lesson_id_foreign` (`lesson_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`);

--
-- Chỉ mục cho bảng `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teachers_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `teacher_reviews`
--
ALTER TABLE `teacher_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_reviews_teacher_id_foreign` (`teacher_id`),
  ADD KEY `teacher_reviews_student_id_foreign` (`student_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_group_id_foreign` (`group_id`);

--
-- Chỉ mục cho bảng `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_lesson_id_foreign` (`lesson_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `childs_menu`
--
ALTER TABLE `childs_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `courses_students`
--
ALTER TABLE `courses_students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `course_reviews`
--
ALTER TABLE `course_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `documentaries`
--
ALTER TABLE `documentaries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `lesson_reviews`
--
ALTER TABLE `lesson_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `post_reviews`
--
ALTER TABLE `post_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `teacher_reviews`
--
ALTER TABLE `teacher_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `childs_menu`
--
ALTER TABLE `childs_menu`
  ADD CONSTRAINT `childs_menu_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `courses_students`
--
ALTER TABLE `courses_students`
  ADD CONSTRAINT `courses_students_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `course_reviews`
--
ALTER TABLE `course_reviews`
  ADD CONSTRAINT `course_reviews_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `course_reviews_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `documentaries`
--
ALTER TABLE `documentaries`
  ADD CONSTRAINT `documentaries_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `lesson_reviews`
--
ALTER TABLE `lesson_reviews`
  ADD CONSTRAINT `lesson_reviews_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lesson_reviews_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `orders_detail_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_detail_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `post_reviews`
--
ALTER TABLE `post_reviews`
  ADD CONSTRAINT `post_reviews_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_reviews_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `teacher_reviews`
--
ALTER TABLE `teacher_reviews`
  ADD CONSTRAINT `teacher_reviews_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_reviews_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
