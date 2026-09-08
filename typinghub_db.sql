-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 06, 2026 at 10:30 PM
-- Server version: 10.11.18-MariaDB-cll-lve
-- PHP Version: 8.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `typinghub_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmark_categories`
--

CREATE TABLE `bookmark_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL DEFAULT 'GLOBAL',
  `code` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `type` enum('GOV','UTILITY','BANK','EMBASSY','INTERNAL','OTHER') NOT NULL DEFAULT 'GOV',
  `icon` varchar(50) DEFAULT 'fa-folder-bookmark',
  `badge_color` varchar(50) DEFAULT 'blue',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookmark_categories`
--

INSERT INTO `bookmark_categories` (`id`, `tenant_id`, `code`, `name`, `type`, `icon`, `badge_color`, `sort_order`, `is_active`, `created_at`) VALUES
(1, 'GLOBAL', 'MOI_TRAFFIC', 'MOI & Police / Traffic / Licenses', 'GOV', 'fa-car-side', 'amber', 0, 1, '2026-08-31 18:17:12'),
(2, 'GLOBAL', 'ICP_AMER', 'ICP & GDRFA / Residency & Passports', 'GOV', 'fa-id-card', 'blue', 0, 1, '2026-08-31 18:17:12'),
(3, 'GLOBAL', 'MOHRE', 'MOHRE & Labour / Work Permits', 'GOV', 'fa-briefcase', 'emerald', 0, 1, '2026-08-31 18:17:12'),
(4, 'GLOBAL', 'COURTS_MOJ', 'Courts & Notary / Legal', 'GOV', 'fa-scale-balanced', 'purple', 0, 1, '2026-08-31 18:17:12'),
(5, 'GLOBAL', 'DED_ECONOMY', 'Economic Departments / DED', 'GOV', 'fa-building-columns', 'cyan', 0, 1, '2026-08-31 18:17:12'),
(6, 'GLOBAL', 'TAX_FTA', 'Federal Tax Authority (VAT / CT)', 'GOV', 'fa-receipt', 'rose', 0, 1, '2026-08-31 18:17:12'),
(7, 'GLOBAL', 'HEALTH_MED', 'Medical Fitness & DHA / MOHAP', 'GOV', 'fa-heart-pulse', 'teal', 0, 1, '2026-08-31 18:17:12'),
(8, 'GLOBAL', 'UTILITIES', 'PDF Tools, Converters & Translation', 'UTILITY', 'fa-screwdriver-wrench', 'indigo', 0, 1, '2026-08-31 18:17:12'),
(9, 'GLOBAL', 'COURIERS', 'Emirates Post, Aramex & Tracking', 'UTILITY', 'fa-truck-fast', 'orange', 0, 1, '2026-08-31 18:17:12'),
(10, 'GLOBAL', 'INSURANCE', 'Health & Workmen Compensation', 'UTILITY', 'fa-shield-halved', 'green', 0, 1, '2026-08-31 18:17:12'),
(11, 'GLOBAL', 'EMBASSIES', 'Embassies & Consulates (VFS / BLS)', 'EMBASSY', 'fa-passport', 'yellow', 0, 1, '2026-08-31 18:17:12'),
(12, 'GLOBAL', 'GENERAL', 'Other Useful Web Shortcuts', 'OTHER', 'fa-globe', 'slate', 0, 1, '2026-08-31 18:17:12');

-- --------------------------------------------------------

--
-- Table structure for table `bookmark_clicks`
--

CREATE TABLE `bookmark_clicks` (
  `id` int(10) UNSIGNED NOT NULL,
  `bookmark_id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `clicked_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookmark_clicks`
--

INSERT INTO `bookmark_clicks` (`id`, `bookmark_id`, `tenant_id`, `user_id`, `clicked_at`) VALUES
(1, 1, 'GLOBAL', 'USR-001', '2026-08-31 18:17:58'),
(2, 1, 'GLOBAL', 'USR-001', '2026-08-31 18:18:02'),
(3, 1, 'GLOBAL', 'USR-001', '2026-08-31 18:18:09');

-- --------------------------------------------------------

--
-- Table structure for table `bookmark_items`
--

CREATE TABLE `bookmark_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL DEFAULT 'GLOBAL',
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `category_code` varchar(50) NOT NULL DEFAULT 'GENERAL',
  `link_type` enum('GOV_SERVICE','PORTAL','TOOL','INTERNAL','EXTERNAL') NOT NULL DEFAULT 'GOV_SERVICE',
  `auth_type` enum('NONE','UAE_PASS_CORP','UAE_PASS_IND','SMART_CARD','PORTAL_CREDENTIALS') NOT NULL DEFAULT 'NONE',
  `emirate_scope` varchar(50) NOT NULL DEFAULT 'ALL',
  `title` varchar(200) NOT NULL,
  `service_name` varchar(200) DEFAULT NULL,
  `url` varchar(1000) NOT NULL,
  `favicon_url` varchar(500) DEFAULT NULL,
  `portal_domain` varchar(150) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `is_pinned` tinyint(1) NOT NULL DEFAULT 0,
  `clicks_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_ping_status` int(11) DEFAULT 200,
  `last_ping_at` datetime DEFAULT NULL,
  `created_by_staff` varchar(100) DEFAULT 'ADMIN',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookmark_items`
--

INSERT INTO `bookmark_items` (`id`, `tenant_id`, `is_public`, `category_code`, `link_type`, `auth_type`, `emirate_scope`, `title`, `service_name`, `url`, `favicon_url`, `portal_domain`, `notes`, `tags`, `is_pinned`, `clicks_count`, `last_ping_status`, `last_ping_at`, `created_by_staff`, `created_at`, `updated_at`) VALUES
(1, 'GLOBAL', 1, 'COURIERS', 'GOV_SERVICE', 'UAE_PASS_CORP', 'ALL', 'typinghub', 'hub', 'http://app.typinghub.ae/index.php?page=bookmarks', 'https://www.google.com/s2/favicons?domain=app.typinghub.ae&sz=128', 'app.typinghub.ae', '', '', 1, 3, 200, NULL, 'admin', '2026-08-31 18:17:49', '2026-08-31 18:22:23'),
(2, 'GLOBAL', 1, 'DED_ECONOMY', 'GOV_SERVICE', 'NONE', 'ALL', 'moi', '', 'https://moi.gov.ae/home', 'https://www.google.com/s2/favicons?domain=moi.gov.ae&sz=128', 'moi.gov.ae', '', '', 0, 0, 200, NULL, 'admin', '2026-08-31 19:01:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cheques`
--

CREATE TABLE `cheques` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `branch_id` varchar(50) NOT NULL DEFAULT 'MAIN',
  `cheque_type` enum('INWARD','OUTWARD') NOT NULL DEFAULT 'INWARD' COMMENT 'INWARD = Received from Client, OUTWARD = Issued to Payee',
  `cheque_no` varchar(50) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `payee_name` varchar(150) NOT NULL COMMENT 'Client Name or Supplier/Payee Name',
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `issue_date` date DEFAULT NULL,
  `due_date` date NOT NULL,
  `status` enum('PDC_PENDING','CLEARED','BOUNCED','CANCELLED') NOT NULL DEFAULT 'PDC_PENDING',
  `cleared_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by_staff` varchar(50) NOT NULL DEFAULT 'ADMIN',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` varchar(50) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `name_ar` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `type` enum('Corporate','Individual','VIP') DEFAULT 'Corporate',
  `trn_no` varchar(50) DEFAULT NULL,
  `establishment_no` varchar(50) DEFAULT NULL,
  `license_no` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `portal_enabled` tinyint(1) DEFAULT 1,
  `password_hash` varchar(255) DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `tenant_id`, `name`, `name_ar`, `phone`, `email`, `type`, `trn_no`, `establishment_no`, `license_no`, `notes`, `created_at`, `portal_enabled`, `password_hash`, `last_login_at`) VALUES
('DEM-C-1001', 'DEM-0CD4', 'MUHSINA PADVUIL', '', '05555555555555555', '', 'Corporate', '', '', '', '', '2026-09-01 08:51:08', 1, NULL, NULL),
('GLO-C-1001', 'GLOBAL', 'ABU THAMEEM', 'ABU THAMEEM', '0582689099', 'abu.thameem1221@gmail.com', 'Corporate', '', '', '', '', '2026-09-02 05:38:56', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_employees`
--

CREATE TABLE `customer_employees` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `customer_id` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `emirates_id` varchar(50) DEFAULT NULL,
  `passport_no` varchar(50) DEFAULT NULL,
  `labor_card_no` varchar(50) DEFAULT NULL,
  `residence_expiry` date DEFAULT NULL,
  `passport_expiry` date DEFAULT NULL,
  `insurance_expiry` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_employees`
--

INSERT INTO `customer_employees` (`id`, `tenant_id`, `customer_id`, `name`, `name_ar`, `emirates_id`, `passport_no`, `labor_card_no`, `residence_expiry`, `passport_expiry`, `insurance_expiry`, `created_at`) VALUES
(1, 'GLOBAL', 'GLO-C-1001', 'IMAAN ZAYED KALIPPADATH AYYOOB KALIPPADATH_Additional Attachment No 1', NULL, '784565555555555', 'sfdsfds', NULL, '2026-09-02', NULL, NULL, '2026-09-01 08:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `day_closings`
--

CREATE TABLE `day_closings` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `branch_id` varchar(50) DEFAULT 'MAIN',
  `closing_date` date NOT NULL,
  `closed_by_staff` varchar(50) NOT NULL,
  `system_cash` decimal(12,2) NOT NULL DEFAULT 0.00,
  `system_card` decimal(12,2) NOT NULL DEFAULT 0.00,
  `system_transfer` decimal(12,2) NOT NULL DEFAULT 0.00,
  `system_total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `actual_cash` decimal(12,2) NOT NULL DEFAULT 0.00,
  `actual_card` decimal(12,2) NOT NULL DEFAULT 0.00,
  `actual_transfer` decimal(12,2) NOT NULL DEFAULT 0.00,
  `actual_total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `shortage_overage` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` varchar(50) NOT NULL DEFAULT 'CLOSED_BALANCED',
  `remarks` text DEFAULT NULL,
  `closed_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `day_closings`
--

INSERT INTO `day_closings` (`id`, `tenant_id`, `branch_id`, `closing_date`, `closed_by_staff`, `system_cash`, `system_card`, `system_transfer`, `system_total`, `actual_cash`, `actual_card`, `actual_transfer`, `actual_total`, `shortage_overage`, `status`, `remarks`, `closed_at`) VALUES
(1, 'DEM-0CD4', 'DEM-0CD4', '2026-09-01', 'admin', 1000.00, 0.00, 0.00, 1000.00, 1000.00, 0.00, 0.00, 1000.00, 0.00, 'CLOSED_BALANCED', '', '2026-09-01 13:47:36'),
(6, 'GLOBAL', 'GLOBAL', '2026-09-02', 'admin', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'CLOSED_BALANCED', '', '2026-09-02 08:39:08');

-- --------------------------------------------------------

--
-- Table structure for table `document_audit_logs`
--

CREATE TABLE `document_audit_logs` (
  `id` bigint(20) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `staff_id` varchar(50) NOT NULL,
  `action` enum('VIEW','DOWNLOAD','CREATE','UPDATE','RENEW','DELETE','RESTORE') NOT NULL,
  `description` varchar(255) NOT NULL,
  `changes_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`changes_json`)),
  `ip_address` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_audit_logs`
--

INSERT INTO `document_audit_logs` (`id`, `tenant_id`, `document_id`, `staff_id`, `action`, `description`, `changes_json`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, 'GLOBAL', 1, 'admin', 'CREATE', 'Registered new Emirates ID Card (EID) (#11321)', NULL, '5.31.231.163', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-01 08:59:10'),
(2, 'GLOBAL', 1, 'admin', 'RENEW', 'Renewed Emirates ID Card (EID) (#11321). New Expiry: 2027-09-02', NULL, '5.31.231.163', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-01 09:02:05'),
(3, 'GLOBAL', 1, 'admin', 'UPDATE', 'Updated details of Emirates ID Card (EID) (#11321)', NULL, '5.31.231.163', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-01 09:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `document_files`
--

CREATE TABLE `document_files` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `document_id` int(11) NOT NULL,
  `version_no` int(11) NOT NULL DEFAULT 1,
  `is_current` tinyint(1) NOT NULL DEFAULT 1,
  `file_title` varchar(200) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_name_original` varchar(255) NOT NULL,
  `file_extension` varchar(10) NOT NULL,
  `file_size_kb` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mime_type` varchar(100) NOT NULL,
  `file_hash_sha256` varchar(64) DEFAULT NULL,
  `uploaded_by_staff_id` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_followups`
--

CREATE TABLE `document_followups` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `document_id` int(11) NOT NULL,
  `customer_id` varchar(50) NOT NULL,
  `staff_id` varchar(50) NOT NULL,
  `channel` enum('WHATSAPP','PHONE_CALL','EMAIL','IN_PERSON','SMS') NOT NULL DEFAULT 'WHATSAPP',
  `contact_person` varchar(150) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `quoted_renewal_fee` decimal(10,2) DEFAULT 0.00,
  `quoted_gov_fee` decimal(10,2) DEFAULT 0.00,
  `customer_response` enum('INTERESTED','DOCUMENTS_PROMISED','PRICE_NEGOTIATION','RENEWING_SELF','RENEWED_COMPETITOR','NO_ANSWER') NOT NULL DEFAULT 'INTERESTED',
  `remarks` text NOT NULL,
  `next_followup_date` date DEFAULT NULL,
  `status` enum('PENDING','FOLLOW_UP_SCHEDULED','CONVERTED_TO_INVOICE','CLOSED_LOST') NOT NULL DEFAULT 'PENDING',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_followups`
--

INSERT INTO `document_followups` (`id`, `tenant_id`, `document_id`, `customer_id`, `staff_id`, `channel`, `contact_person`, `contact_phone`, `quoted_renewal_fee`, `quoted_gov_fee`, `customer_response`, `remarks`, `next_followup_date`, `status`, `created_at`) VALUES
(1, 'GLOBAL', 1, 'GLO-C-1001', 'admin', 'WHATSAPP', NULL, NULL, 50.00, 0.00, 'NO_ANSWER', 'sddsfdsfdsf', NULL, 'PENDING', '2026-09-01 09:02:46'),
(2, 'GLOBAL', 1, 'GLO-C-1001', 'admin', 'WHATSAPP', NULL, NULL, 50.00, 0.00, 'INTERESTED', 'No resp', NULL, 'PENDING', '2026-09-01 15:33:31');

-- --------------------------------------------------------

--
-- Table structure for table `document_records`
--

CREATE TABLE `document_records` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `branch_id` varchar(50) NOT NULL DEFAULT 'MAIN',
  `customer_id` varchar(50) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `doc_type_id` int(11) NOT NULL,
  `doc_type_name` varchar(150) NOT NULL,
  `emirate` enum('ABU_DHABI','DUBAI','SHARJAH','AJMAN','UMM_AL_QUWAIN','RAS_AL_KHAIMAH','FUJAIRAH','FEDERAL') NOT NULL DEFAULT 'DUBAI',
  `doc_number` varchar(100) NOT NULL,
  `unified_number` varchar(50) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `grace_expiry_date` date DEFAULT NULL,
  `status` enum('ACTIVE','EXPIRING_SOON','IN_GRACE_PERIOD','EXPIRED','RENEWAL_IN_PROGRESS','ARCHIVED') NOT NULL DEFAULT 'ACTIVE',
  `estimated_fine_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_fine_applicable` tinyint(1) NOT NULL DEFAULT 0,
  `last_renewed_invoice_id` int(11) DEFAULT NULL,
  `renewal_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_by_staff_id` varchar(50) NOT NULL,
  `updated_by_staff_id` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_records`
--

INSERT INTO `document_records` (`id`, `tenant_id`, `branch_id`, `customer_id`, `employee_id`, `doc_type_id`, `doc_type_name`, `emirate`, `doc_number`, `unified_number`, `issue_date`, `expiry_date`, `grace_expiry_date`, `status`, `estimated_fine_amount`, `is_fine_applicable`, `last_renewed_invoice_id`, `renewal_count`, `notes`, `is_locked`, `created_by_staff_id`, `updated_by_staff_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'GLOBAL', 'GLOBAL', 'GLO-C-1001', 1, 12, 'Emirates ID Card (EID)', 'DUBAI', '11321', '', NULL, '2028-09-02', '2028-10-02', 'ACTIVE', 0.00, 0, NULL, 1, '', 0, 'admin', 'admin', '2026-09-01 08:59:10', '2026-09-01 09:54:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `document_reminders_log`
--

CREATE TABLE `document_reminders_log` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `document_id` int(11) NOT NULL,
  `customer_id` varchar(50) NOT NULL,
  `recipient_name` varchar(150) NOT NULL,
  `recipient_contact` varchar(100) NOT NULL,
  `channel` enum('WHATSAPP','EMAIL','SMS') NOT NULL DEFAULT 'WHATSAPP',
  `days_before_expiry` int(11) NOT NULL DEFAULT 30,
  `message_body` text NOT NULL,
  `dispatch_status` enum('DELIVERED','SENT','FAILED','QUEUED') NOT NULL DEFAULT 'SENT',
  `api_response_code` varchar(50) DEFAULT NULL,
  `sent_by_staff_id` varchar(50) NOT NULL DEFAULT 'SYSTEM_CRON',
  `sent_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(50) NOT NULL DEFAULT 'GLOBAL',
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `name_ar` varchar(150) DEFAULT NULL,
  `category` enum('COMPANY','EMPLOYEE','VEHICLE','PROPERTY','GENERAL') NOT NULL DEFAULT 'COMPANY',
  `issuing_authority` varchar(100) DEFAULT NULL,
  `default_validity_months` int(11) NOT NULL DEFAULT 12,
  `grace_period_days` int(11) NOT NULL DEFAULT 0,
  `fine_first_day` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fine_per_day` decimal(10,2) NOT NULL DEFAULT 0.00,
  `alert_before_days` int(11) NOT NULL DEFAULT 30,
  `is_mandatory` tinyint(1) NOT NULL DEFAULT 0,
  `is_system_preset` tinyint(1) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`id`, `tenant_id`, `code`, `name`, `name_ar`, `category`, `issuing_authority`, `default_validity_months`, `grace_period_days`, `fine_first_day`, `fine_per_day`, `alert_before_days`, `is_mandatory`, `is_system_preset`, `is_active`, `created_at`) VALUES
(1, 'GLOBAL', 'DED_LICENSE', 'Commercial Trade License', 'الرخصة التجارية', 'COMPANY', 'DED / Freezone Authority', 12, 30, 250.00, 10.00, 60, 1, 1, 1, '2026-08-31 21:48:30'),
(2, 'GLOBAL', 'ICP_EST_CARD', 'Immigration Establishment Card', 'بطاقة المنشأة - الهيئة الاتحادية', 'COMPANY', 'ICP / GDRFA', 36, 30, 100.00, 100.00, 30, 1, 1, 1, '2026-08-31 21:48:30'),
(3, 'GLOBAL', 'MOHRE_EST_FILE', 'MOHRE Labor Establishment File', 'ملف المنشأة - وزارة العمل', 'COMPANY', 'MOHRE', 12, 30, 0.00, 50.00, 30, 1, 1, 1, '2026-08-31 21:48:30'),
(4, 'GLOBAL', 'EJARI_LEASE', 'Ejari / Commercial Tenancy Lease', 'عقد الإيجار التجاري - إيجاري', 'COMPANY', 'Land Department / Municipality', 12, 30, 0.00, 0.00, 45, 1, 1, 1, '2026-08-31 21:48:30'),
(5, 'GLOBAL', 'CIVIL_DEFENSE', 'Civil Defense Fire & Safety Certificate', 'شهادة استيفاء السلامة والدفاع المدني', 'COMPANY', 'Civil Defense', 12, 0, 500.00, 50.00, 30, 0, 1, 1, '2026-08-31 21:48:30'),
(6, 'GLOBAL', 'CHAMBER_CERT', 'Chamber of Commerce Membership', 'شهادة عضوية غرفة التجارة والصناعة', 'COMPANY', 'Chamber of Commerce', 12, 30, 0.00, 0.00, 30, 0, 1, 1, '2026-08-31 21:48:30'),
(7, 'GLOBAL', 'MUNI_SIGNBOARD', 'Municipality Signboard & Advertisement Permit', 'تصريح اللوحة الإعلانية والبلدية', 'COMPANY', 'City Municipality', 12, 15, 200.00, 20.00, 30, 0, 1, 1, '2026-08-31 21:48:30'),
(8, 'GLOBAL', 'CORP_TAX_TRN', 'Corporate Tax & VAT TRN Certificate', 'شهادة التسجيل في ضريبة الشركات والقيمة المضافة', 'COMPANY', 'Federal Tax Authority (FTA)', 0, 0, 0.00, 0.00, 0, 0, 1, 1, '2026-08-31 21:48:30'),
(9, 'GLOBAL', 'E_CHANNEL', 'ICP E-Channel / GDRFA Portal Account', 'حساب المنظومة الذكية والقناة الإلكترونية', 'COMPANY', 'ICP / GDRFA', 12, 0, 0.00, 0.00, 30, 0, 1, 1, '2026-08-31 21:48:30'),
(10, 'GLOBAL', 'POWER_ATTORNEY', 'Power of Attorney (POA) / Signature Authorization', 'الوكالة القانونية واعتماد التوقيع', 'COMPANY', 'Dubai Courts / Ministry of Justice', 24, 0, 0.00, 0.00, 60, 0, 1, 1, '2026-08-31 21:48:30'),
(11, 'GLOBAL', 'RESIDENCE_VISA', 'UAE Residence Visa', 'تأشيرة الإقامة الإماراتية', 'EMPLOYEE', 'ICP / GDRFA', 24, 60, 50.00, 50.00, 60, 1, 1, 1, '2026-08-31 21:48:30'),
(12, 'GLOBAL', 'EMIRATES_ID', 'Emirates ID Card (EID)', 'بطاقة الهوية الإماراتية', 'EMPLOYEE', 'ICP', 24, 30, 20.00, 20.00, 30, 1, 1, 1, '2026-08-31 21:48:30'),
(13, 'GLOBAL', 'PASSPORT', 'Original Passport', 'جواز السفر الأصلي', 'EMPLOYEE', 'Embassies / Consulates', 60, 0, 0.00, 0.00, 180, 1, 1, 1, '2026-08-31 21:48:30'),
(14, 'GLOBAL', 'MOHRE_WORK_PERMIT', 'MOHRE Labor Card / Work Permit', 'تصريح وبطاقة العمل - الموارد البشرية', 'EMPLOYEE', 'MOHRE', 24, 60, 0.00, 100.00, 30, 1, 1, 1, '2026-08-31 21:48:30'),
(15, 'GLOBAL', 'HEALTH_INSURANCE', 'Health / Medical Insurance Policy', 'وثيقة التأمين الصحي الإلزامي', 'EMPLOYEE', 'DHA / DOH / SANID', 12, 30, 500.00, 50.00, 30, 1, 1, 1, '2026-08-31 21:48:30'),
(16, 'GLOBAL', 'OCCUPATIONAL_CARD', 'Occupational Health Card (OHC)', 'بطاقة الصحة المهنية - فحص الأغذية والبلدية', 'EMPLOYEE', 'Municipality / Public Health', 12, 0, 300.00, 30.00, 30, 0, 1, 1, '2026-08-31 21:48:30'),
(17, 'GLOBAL', 'DRIVING_LICENSE', 'UAE Driving License', 'رخصة القيادة الإماراتية', 'EMPLOYEE', 'RTA / Police Traffic Dept', 24, 30, 10.00, 10.00, 30, 0, 1, 1, '2026-08-31 21:48:30'),
(18, 'GLOBAL', 'ENTRY_PERMIT', 'New Entry Permit / Visa Status Change', 'إذن الدخول وتعديل الوضع', 'EMPLOYEE', 'ICP / GDRFA', 2, 0, 100.00, 50.00, 10, 0, 1, 1, '2026-08-31 21:48:30'),
(19, 'GLOBAL', 'VEHICLE_MULKIYA', 'Vehicle Registration Card (Mulkiya)', 'ملكية المركبة - فحص المرور', 'VEHICLE', 'RTA / Traffic Dept', 12, 30, 0.00, 20.00, 30, 0, 1, 1, '2026-08-31 21:48:30'),
(20, 'GLOBAL', 'VEHICLE_INSURANCE', 'Comprehensive Vehicle Insurance', 'تأمين المركبة الشامل / ضد الغير', 'VEHICLE', 'Insurance Authority', 13, 0, 0.00, 0.00, 30, 0, 1, 1, '2026-08-31 21:48:30');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(64) NOT NULL,
  `branch_id` varchar(64) NOT NULL DEFAULT 'MAIN',
  `voucher_no` varchar(32) NOT NULL,
  `category` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(32) NOT NULL DEFAULT 'Cash',
  `recipient_vendor` varchar(128) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `staff_id` varchar(64) NOT NULL DEFAULT 'ADMIN',
  `expense_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL DEFAULT 'GLOBAL',
  `name` varchar(100) NOT NULL,
  `name_ar` varchar(150) DEFAULT NULL,
  `account_code` varchar(20) NOT NULL DEFAULT '5010',
  `is_portal_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `is_global` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `tenant_id`, `name`, `name_ar`, `account_code`, `is_portal_deposit`, `is_global`, `created_at`) VALUES
(1, 'GLOBAL', 'MOHRE Tasheel E-Wallet Top-up', 'شحن محفظة وزارة الموارد البشرية والتوطين (تسهيل)', '1020', 1, 1, '2026-08-26 00:10:17'),
(2, 'GLOBAL', 'ICP Smart Services Deposit', 'شحن رصيد الهيئة الاتحادية للهوية والجنسية', '1020', 1, 1, '2026-08-26 00:10:17'),
(3, 'GLOBAL', 'Amer GDRFA Dubai Deposit', 'شحن رصيد الإدارة العامة للإقامة وشؤون الأجانب (آمر)', '1020', 1, 1, '2026-08-26 00:10:17'),
(4, 'GLOBAL', 'TAMM Abu Dhabi E-Wallet', 'شحن محفظة تم أبوظبي الحكومية', '1020', 1, 1, '2026-08-26 00:10:17'),
(5, 'GLOBAL', 'Printing Paper & Toners', 'أوراق الطباعة وأحبار الطابعات والقرطاسية', '5010', 0, 1, '2026-08-26 00:10:17'),
(6, 'GLOBAL', 'Office Rent & Commercial Lease', 'إيجار المحل التجاري والدفعات الإيجارية', '5020', 0, 1, '2026-08-26 00:10:17'),
(7, 'GLOBAL', 'DEWA / Electricity & Water', 'فواتير هيئة كهرباء ومياه دبي والخدمات', '5030', 0, 1, '2026-08-26 00:10:17'),
(8, 'GLOBAL', 'Internet & Commercial Telecom', 'فواتير الإنترنت التجاري والاتصالات (اتصالات / دو)', '5040', 0, 1, '2026-08-26 00:10:17'),
(9, 'GLOBAL', 'Staff Visa, Medical & Labour Fees', 'رسوم إقامات الموظفين والفحص الطبي والبطاقات', '5050', 0, 1, '2026-08-26 00:10:17'),
(10, 'GLOBAL', 'Tea, Coffee & Pantry Supplies', 'مستلزمات الضيافة والشاي ومياه الشرب', '5060', 0, 1, '2026-08-26 00:10:17'),
(11, 'GLOBAL', 'IT & Computer Maintenance', 'صيانة أجهزة الكمبيوتر والبرمجيات والطابعات', '5070', 0, 1, '2026-08-26 00:10:17'),
(12, 'GLOBAL', 'General Petty Cash & Outflows', 'المصروفات النثرية العامة', '5090', 0, 1, '2026-08-26 00:10:17');

-- --------------------------------------------------------

--
-- Table structure for table `financial_ledger`
--

CREATE TABLE `financial_ledger` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `branch_id` varchar(50) DEFAULT 'MAIN',
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_date` date NOT NULL DEFAULT curdate(),
  `transaction_type` varchar(50) NOT NULL DEFAULT 'INV_CREATE',
  `account_code` varchar(20) NOT NULL COMMENT '1010-Cash, 1200-AR, 2010-GovFee, 2200-VAT, 4010-Revenue',
  `debit` decimal(12,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payment_mode` varchar(20) DEFAULT 'Cash',
  `staff_id` varchar(50) NOT NULL DEFAULT 'SYSTEM',
  `closing_id` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `financial_ledger`
--

INSERT INTO `financial_ledger` (`id`, `tenant_id`, `branch_id`, `invoice_id`, `invoice_no`, `payment_id`, `transaction_date`, `transaction_type`, `account_code`, `debit`, `credit`, `payment_mode`, `staff_id`, `closing_id`, `description`, `created_at`) VALUES
(1, 'DEM-0CD4', 'DEM-0CD4', 16, 'INV-2026-1001', NULL, '2026-09-01', 'INV_CREATE', '1200', 3030.00, 0.00, 'Cash', 'demo', NULL, 'Invoice Issued: INV-2026-1001', '2026-09-01 12:58:25'),
(2, 'DEM-0CD4', 'DEM-0CD4', 16, 'INV-2026-1001', NULL, '2026-09-01', 'INV_CREATE', '4010', 0.00, 268.05, 'Cash', 'demo', NULL, 'Typing Income: INV-2026-1001', '2026-09-01 12:58:25'),
(3, 'DEM-0CD4', 'DEM-0CD4', 16, 'INV-2026-1001', NULL, '2026-09-01', 'INV_CREATE', '2010', 0.00, 2761.95, 'Cash', 'demo', NULL, 'Gov Pass-Through: INV-2026-1001', '2026-09-01 12:58:25'),
(4, 'DEM-0CD4', 'DEM-0CD4', 16, 'INV-2026-1001', NULL, '2026-09-01', 'PAYMENT_RECEIVED', '1010', 1000.00, 0.00, 'Cash', 'demo', NULL, 'Extra Payment Collected for INV-2026-1001', '2026-09-01 13:09:11'),
(5, 'DEM-0CD4', 'DEM-0CD4', 16, 'INV-2026-1001', NULL, '2026-09-01', 'PAYMENT_RECEIVED', '1200', 0.00, 1000.00, 'Cash', 'demo', NULL, 'Receivable Settled: INV-2026-1001', '2026-09-01 13:09:11'),
(6, 'GLOBAL', 'GLOBAL', 17, 'INV-2026-1002', NULL, '2026-09-02', 'INV_CREATE', '1200', 1900.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: INV-2026-1002', '2026-09-02 09:36:18'),
(7, 'GLOBAL', 'GLOBAL', 17, 'INV-2026-1002', NULL, '2026-09-02', 'INV_CREATE', '4010', 0.00, 1393.53, 'Cash', 'admin', NULL, 'Typing Income: INV-2026-1002', '2026-09-02 09:36:18'),
(8, 'GLOBAL', 'GLOBAL', 17, 'INV-2026-1002', NULL, '2026-09-02', 'INV_CREATE', '2010', 0.00, 506.47, 'Cash', 'admin', NULL, 'Gov Pass-Through: INV-2026-1002', '2026-09-02 09:36:18'),
(9, 'GLOBAL', 'GLOBAL', 17, 'INV-2026-1002', NULL, '2026-09-02', 'PAYMENT_RECEIVED', '1010', 1900.00, 0.00, 'Cash', 'admin', NULL, 'Payment Received: INV-2026-1002', '2026-09-02 09:36:18'),
(10, 'GLOBAL', 'GLOBAL', 17, 'INV-2026-1002', NULL, '2026-09-02', 'PAYMENT_RECEIVED', '1200', 0.00, 1900.00, 'Cash', 'admin', NULL, 'Settlement Offset: INV-2026-1002', '2026-09-02 09:36:18'),
(11, 'GLOBAL', 'GLOBAL', 18, 'INV-2026-1001', NULL, '2026-09-02', 'INV_CREATE', '1200', 537.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: INV-2026-1001', '2026-09-02 09:39:45'),
(12, 'GLOBAL', 'GLOBAL', 18, 'INV-2026-1001', NULL, '2026-09-02', 'INV_CREATE', '4010', 0.00, 204.00, 'Cash', 'admin', NULL, 'Typing Income: INV-2026-1001', '2026-09-02 09:39:45'),
(13, 'GLOBAL', 'GLOBAL', 18, 'INV-2026-1001', NULL, '2026-09-02', 'INV_CREATE', '2010', 0.00, 333.00, 'Cash', 'admin', NULL, 'Gov Pass-Through: INV-2026-1001', '2026-09-02 09:39:45'),
(14, 'GLOBAL', 'GLOBAL', 18, 'INV-2026-1001', NULL, '2026-09-02', 'PAYMENT_RECEIVED', '1010', 537.00, 0.00, 'Cash', 'admin', NULL, 'Payment Received: INV-2026-1001', '2026-09-02 09:39:45'),
(15, 'GLOBAL', 'GLOBAL', 18, 'INV-2026-1001', NULL, '2026-09-02', 'PAYMENT_RECEIVED', '1200', 0.00, 537.00, 'Cash', 'admin', NULL, 'Settlement Offset: INV-2026-1001', '2026-09-02 09:39:45'),
(16, 'GLOBAL', 'GLOBAL', 19, 'INV-2026-1002', NULL, '2026-09-02', 'INV_CREATE', '1200', 3055.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: INV-2026-1002', '2026-09-02 09:40:59'),
(17, 'GLOBAL', 'GLOBAL', 19, 'INV-2026-1002', NULL, '2026-09-02', 'INV_CREATE', '4010', 0.00, 561.75, 'Cash', 'admin', NULL, 'Typing Income: INV-2026-1002', '2026-09-02 09:40:59'),
(18, 'GLOBAL', 'GLOBAL', 19, 'INV-2026-1002', NULL, '2026-09-02', 'INV_CREATE', '2010', 0.00, 2493.25, 'Cash', 'admin', NULL, 'Gov Pass-Through: INV-2026-1002', '2026-09-02 09:40:59'),
(19, 'GLOBAL', 'GLOBAL', 19, 'INV-2026-1002', NULL, '2026-09-02', 'PAYMENT_RECEIVED', '1010', 3055.00, 0.00, 'Cash', 'admin', NULL, 'Payment Received: INV-2026-1002', '2026-09-02 09:40:59'),
(20, 'GLOBAL', 'GLOBAL', 19, 'INV-2026-1002', NULL, '2026-09-02', 'PAYMENT_RECEIVED', '1200', 0.00, 3055.00, 'Cash', 'admin', NULL, 'Settlement Offset: INV-2026-1002', '2026-09-02 09:40:59'),
(21, 'GLOBAL', 'GLOBAL', 20, 'INV-2026-1003', NULL, '2026-09-02', 'INV_CREATE', '1200', 5109.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: INV-2026-1003', '2026-09-02 09:57:46'),
(22, 'GLOBAL', 'GLOBAL', 20, 'INV-2026-1003', NULL, '2026-09-02', 'INV_CREATE', '4010', 0.00, 303.51, 'Cash', 'admin', NULL, 'Typing Income: INV-2026-1003', '2026-09-02 09:57:46'),
(23, 'GLOBAL', 'GLOBAL', 20, 'INV-2026-1003', NULL, '2026-09-02', 'INV_CREATE', '2010', 0.00, 4805.49, 'Cash', 'admin', NULL, 'Gov Pass-Through: INV-2026-1003', '2026-09-02 09:57:46'),
(24, 'GLOBAL', 'GLOBAL', 20, 'INV-2026-1003', NULL, '2026-09-02', 'PAYMENT_RECEIVED', '1010', 5109.00, 0.00, 'Cash', 'admin', NULL, 'Payment Received: INV-2026-1003', '2026-09-02 09:57:46'),
(25, 'GLOBAL', 'GLOBAL', 20, 'INV-2026-1003', NULL, '2026-09-02', 'PAYMENT_RECEIVED', '1200', 0.00, 5109.00, 'Cash', 'admin', NULL, 'Settlement Offset: INV-2026-1003', '2026-09-02 09:57:46'),
(26, 'GLOBAL', 'GLOBAL', 21, 'INV-2026-1004', NULL, '2026-09-02', 'INV_CREATE', '1200', 6590.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: INV-2026-1004', '2026-09-02 10:04:35'),
(27, 'GLOBAL', 'GLOBAL', 21, 'INV-2026-1004', NULL, '2026-09-02', 'INV_CREATE', '4010', 0.00, 1263.44, 'Cash', 'admin', NULL, 'Typing Income: INV-2026-1004', '2026-09-02 10:04:35'),
(28, 'GLOBAL', 'GLOBAL', 21, 'INV-2026-1004', NULL, '2026-09-02', 'INV_CREATE', '2010', 0.00, 5326.56, 'Cash', 'admin', NULL, 'Gov Pass-Through: INV-2026-1004', '2026-09-02 10:04:35'),
(29, 'GLOBAL', 'GLOBAL', 21, 'INV-2026-1004', NULL, '2026-09-02', 'PAYMENT_RECEIVED', '1010', 6590.00, 0.00, 'Cash', 'admin', NULL, 'Payment Received: INV-2026-1004', '2026-09-02 10:04:35'),
(30, 'GLOBAL', 'GLOBAL', 21, 'INV-2026-1004', NULL, '2026-09-02', 'PAYMENT_RECEIVED', '1200', 0.00, 6590.00, 'Cash', 'admin', NULL, 'Settlement Offset: INV-2026-1004', '2026-09-02 10:04:35'),
(31, 'GLOBAL', 'GLOBAL', 23, 'BIL-2026-1001', NULL, '2026-09-02', 'INV_CREATE', '1200', 3879.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: BIL-2026-1001', '2026-09-02 13:15:46'),
(32, 'GLOBAL', 'GLOBAL', 23, 'BIL-2026-1001', NULL, '2026-09-02', 'INV_CREATE', '4010', 0.00, 215.37, 'Cash', 'admin', NULL, 'Typing Income: BIL-2026-1001', '2026-09-02 13:15:46'),
(33, 'GLOBAL', 'GLOBAL', 23, 'BIL-2026-1001', NULL, '2026-09-02', 'INV_CREATE', '2010', 0.00, 3663.63, 'Cash', 'admin', NULL, 'Gov Pass-Through: BIL-2026-1001', '2026-09-02 13:15:46'),
(34, 'GLOBAL', 'GLOBAL', 24, 'BIL-2026-1002', NULL, '2026-09-03', 'INV_CREATE', '1200', 570.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: BIL-2026-1002', '2026-09-03 08:50:46'),
(35, 'GLOBAL', 'GLOBAL', 24, 'BIL-2026-1002', NULL, '2026-09-03', 'INV_CREATE', '4010', 0.00, 116.00, 'Cash', 'admin', NULL, 'Typing Income: BIL-2026-1002', '2026-09-03 08:50:46'),
(36, 'GLOBAL', 'GLOBAL', 24, 'BIL-2026-1002', NULL, '2026-09-03', 'INV_CREATE', '2010', 0.00, 454.00, 'Cash', 'admin', NULL, 'Gov Pass-Through: BIL-2026-1002', '2026-09-03 08:50:46'),
(37, 'GLOBAL', 'GLOBAL', 25, 'BIL-2026-1003', NULL, '2026-09-03', 'INV_CREATE', '1200', 10.00, 0.00, 'Card', 'admin', NULL, 'Invoice Issued: BIL-2026-1003', '2026-09-03 11:34:25'),
(38, 'GLOBAL', 'GLOBAL', 25, 'BIL-2026-1003', NULL, '2026-09-03', 'INV_CREATE', '4010', 0.00, 5.00, 'Card', 'admin', NULL, 'Typing Income: BIL-2026-1003', '2026-09-03 11:34:25'),
(39, 'GLOBAL', 'GLOBAL', 25, 'BIL-2026-1003', NULL, '2026-09-03', 'INV_CREATE', '2010', 0.00, 5.00, 'Card', 'admin', NULL, 'Gov Pass-Through: BIL-2026-1003', '2026-09-03 11:34:25'),
(40, 'GLOBAL', 'GLOBAL', 25, 'BIL-2026-1003', NULL, '2026-09-03', 'PAYMENT_RECEIVED', '1011', 10.00, 0.00, 'Card', 'admin', NULL, 'Payment (Card): BIL-2026-1003', '2026-09-03 11:34:25'),
(41, 'GLOBAL', 'GLOBAL', 25, 'BIL-2026-1003', NULL, '2026-09-03', 'PAYMENT_RECEIVED', '1200', 0.00, 10.00, 'Card', 'admin', NULL, 'Receivable Settled (Card): BIL-2026-1003', '2026-09-03 11:34:25'),
(42, 'GLOBAL', 'GLOBAL', 26, 'BIL-2026-1004', NULL, '2026-09-03', 'INV_CREATE', '1200', 6900.00, 0.00, 'Transfer', 'admin', NULL, 'Invoice Issued: BIL-2026-1004', '2026-09-03 11:35:03'),
(43, 'GLOBAL', 'GLOBAL', 26, 'BIL-2026-1004', NULL, '2026-09-03', 'INV_CREATE', '4010', 0.00, 654.60, 'Transfer', 'admin', NULL, 'Typing Income: BIL-2026-1004', '2026-09-03 11:35:03'),
(44, 'GLOBAL', 'GLOBAL', 26, 'BIL-2026-1004', NULL, '2026-09-03', 'INV_CREATE', '2010', 0.00, 6245.40, 'Transfer', 'admin', NULL, 'Gov Pass-Through: BIL-2026-1004', '2026-09-03 11:35:03'),
(45, 'GLOBAL', 'GLOBAL', 26, 'BIL-2026-1004', NULL, '2026-09-03', 'PAYMENT_RECEIVED', '1012', 6900.00, 0.00, 'Transfer', 'admin', NULL, 'Payment (Transfer): BIL-2026-1004', '2026-09-03 11:35:03'),
(46, 'GLOBAL', 'GLOBAL', 26, 'BIL-2026-1004', NULL, '2026-09-03', 'PAYMENT_RECEIVED', '1200', 0.00, 6900.00, 'Transfer', 'admin', NULL, 'Receivable Settled (Transfer): BIL-2026-1004', '2026-09-03 11:35:03'),
(47, 'GLOBAL', 'GLOBAL', 27, 'BIL-2026-1005', NULL, '2026-09-03', 'INV_CREATE', '1200', 6900.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: BIL-2026-1005', '2026-09-03 11:50:03'),
(48, 'GLOBAL', 'GLOBAL', 27, 'BIL-2026-1005', NULL, '2026-09-03', 'INV_CREATE', '4010', 0.00, 654.60, 'Cash', 'admin', NULL, 'Typing Income: BIL-2026-1005', '2026-09-03 11:50:03'),
(49, 'GLOBAL', 'GLOBAL', 27, 'BIL-2026-1005', NULL, '2026-09-03', 'INV_CREATE', '2010', 0.00, 6245.40, 'Cash', 'admin', NULL, 'Gov Pass-Through: BIL-2026-1005', '2026-09-03 11:50:03'),
(50, 'GLOBAL', 'GLOBAL', 27, 'BIL-2026-1005', NULL, '2026-09-03', 'INV_VOID', '1200', 0.00, 6900.00, 'Cash', 'admin', NULL, 'VOID Invoice: BIL-2026-1005', '2026-09-03 12:45:59'),
(51, 'GLOBAL', 'GLOBAL', 27, 'BIL-2026-1005', NULL, '2026-09-03', 'INV_VOID', '4010', 654.60, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Typing: BIL-2026-1005', '2026-09-03 12:45:59'),
(52, 'GLOBAL', 'GLOBAL', 27, 'BIL-2026-1005', NULL, '2026-09-03', 'INV_VOID', '2010', 6245.40, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Gov: BIL-2026-1005', '2026-09-03 12:45:59'),
(53, 'GLOBAL', 'GLOBAL', 26, 'BIL-2026-1004', NULL, '2026-09-03', 'INV_VOID', '1200', 0.00, 6900.00, 'Transfer', 'admin', NULL, 'VOID Invoice: BIL-2026-1004', '2026-09-03 12:46:05'),
(54, 'GLOBAL', 'GLOBAL', 26, 'BIL-2026-1004', NULL, '2026-09-03', 'INV_VOID', '4010', 654.60, 0.00, 'Transfer', 'admin', NULL, 'VOID Rev Typing: BIL-2026-1004', '2026-09-03 12:46:05'),
(55, 'GLOBAL', 'GLOBAL', 26, 'BIL-2026-1004', NULL, '2026-09-03', 'INV_VOID', '2010', 6245.40, 0.00, 'Transfer', 'admin', NULL, 'VOID Rev Gov: BIL-2026-1004', '2026-09-03 12:46:05'),
(56, 'GLOBAL', 'GLOBAL', 26, 'BIL-2026-1004', NULL, '2026-09-03', 'INV_VOID', '1012', 0.00, 6900.00, 'Transfer', 'admin', NULL, 'VOID Refund: BIL-2026-1004', '2026-09-03 12:46:05'),
(57, 'GLOBAL', 'GLOBAL', 25, 'BIL-2026-1003', NULL, '2026-09-03', 'INV_VOID', '1200', 0.00, 10.00, 'Card', 'admin', NULL, 'VOID Invoice: BIL-2026-1003', '2026-09-03 12:46:08'),
(58, 'GLOBAL', 'GLOBAL', 25, 'BIL-2026-1003', NULL, '2026-09-03', 'INV_VOID', '4010', 5.00, 0.00, 'Card', 'admin', NULL, 'VOID Rev Typing: BIL-2026-1003', '2026-09-03 12:46:08'),
(59, 'GLOBAL', 'GLOBAL', 25, 'BIL-2026-1003', NULL, '2026-09-03', 'INV_VOID', '2010', 5.00, 0.00, 'Card', 'admin', NULL, 'VOID Rev Gov: BIL-2026-1003', '2026-09-03 12:46:08'),
(60, 'GLOBAL', 'GLOBAL', 25, 'BIL-2026-1003', NULL, '2026-09-03', 'INV_VOID', '1011', 0.00, 10.00, 'Card', 'admin', NULL, 'VOID Refund: BIL-2026-1003', '2026-09-03 12:46:08'),
(61, 'GLOBAL', 'GLOBAL', 24, 'BIL-2026-1002', NULL, '2026-09-03', 'INV_VOID', '1200', 0.00, 570.00, 'Cash', 'admin', NULL, 'VOID Invoice: BIL-2026-1002', '2026-09-03 12:46:11'),
(62, 'GLOBAL', 'GLOBAL', 24, 'BIL-2026-1002', NULL, '2026-09-03', 'INV_VOID', '4010', 116.00, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Typing: BIL-2026-1002', '2026-09-03 12:46:11'),
(63, 'GLOBAL', 'GLOBAL', 24, 'BIL-2026-1002', NULL, '2026-09-03', 'INV_VOID', '2010', 454.00, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Gov: BIL-2026-1002', '2026-09-03 12:46:11'),
(64, 'GLOBAL', 'GLOBAL', 23, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '1200', 0.00, 3879.00, 'Cash', 'admin', NULL, 'VOID Invoice: BIL-2026-1001', '2026-09-03 12:46:15'),
(65, 'GLOBAL', 'GLOBAL', 23, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '4010', 215.37, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Typing: BIL-2026-1001', '2026-09-03 12:46:15'),
(66, 'GLOBAL', 'GLOBAL', 23, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '2010', 3663.63, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Gov: BIL-2026-1001', '2026-09-03 12:46:15'),
(67, 'GLOBAL', 'GLOBAL', 22, 'INV-2026-1001', NULL, '2026-09-03', 'INV_VOID', '1200', 0.00, 1400.00, 'Cash', 'admin', NULL, 'VOID Invoice: INV-2026-1001', '2026-09-03 12:47:09'),
(68, 'GLOBAL', 'GLOBAL', 22, 'INV-2026-1001', NULL, '2026-09-03', 'INV_VOID', '4010', 1100.00, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Typing: INV-2026-1001', '2026-09-03 12:47:09'),
(69, 'GLOBAL', 'GLOBAL', 22, 'INV-2026-1001', NULL, '2026-09-03', 'INV_VOID', '2010', 300.00, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Gov: INV-2026-1001', '2026-09-03 12:47:09'),
(70, 'GLOBAL', 'GLOBAL', 22, 'INV-2026-1001', NULL, '2026-09-03', 'INV_VOID', '1010', 0.00, 1400.00, 'Cash', 'admin', NULL, 'VOID Refund: INV-2026-1001', '2026-09-03 12:47:09'),
(71, 'GLOBAL', 'GLOBAL', 28, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '1200', 1580.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: BIL-2026-1001', '2026-09-03 12:58:48'),
(72, 'GLOBAL', 'GLOBAL', 28, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '4010', 0.00, 252.20, 'Cash', 'admin', NULL, 'Typing Income: BIL-2026-1001', '2026-09-03 12:58:48'),
(73, 'GLOBAL', 'GLOBAL', 28, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '2010', 0.00, 1327.80, 'Cash', 'admin', NULL, 'Gov Pass-Through: BIL-2026-1001', '2026-09-03 12:58:48'),
(74, 'GLOBAL', 'GLOBAL', 28, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '1200', 0.00, 1580.00, 'Cash', 'admin', NULL, 'VOID Invoice: BIL-2026-1001', '2026-09-03 13:28:10'),
(75, 'GLOBAL', 'GLOBAL', 28, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '4010', 252.20, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Typing: BIL-2026-1001', '2026-09-03 13:28:10'),
(76, 'GLOBAL', 'GLOBAL', 28, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '2010', 1327.80, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Gov: BIL-2026-1001', '2026-09-03 13:28:10'),
(77, 'GLOBAL', 'GLOBAL', 29, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '1200', 6900.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: BIL-2026-1001', '2026-09-03 13:28:24'),
(78, 'GLOBAL', 'GLOBAL', 29, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '4010', 0.00, 654.60, 'Cash', 'admin', NULL, 'Typing Income: BIL-2026-1001', '2026-09-03 13:28:24'),
(79, 'GLOBAL', 'GLOBAL', 29, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '2010', 0.00, 6245.40, 'Cash', 'admin', NULL, 'Gov Pass-Through: BIL-2026-1001', '2026-09-03 13:28:24'),
(80, 'GLOBAL', 'GLOBAL', 29, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '1200', 0.00, 6900.00, 'Cash', 'admin', NULL, 'VOID Invoice: BIL-2026-1001', '2026-09-03 13:36:34'),
(81, 'GLOBAL', 'GLOBAL', 29, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '4010', 654.60, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Typing: BIL-2026-1001', '2026-09-03 13:36:34'),
(82, 'GLOBAL', 'GLOBAL', 29, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '2010', 6245.40, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Gov: BIL-2026-1001', '2026-09-03 13:36:34'),
(83, 'GLOBAL', 'GLOBAL', 30, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '1200', 6900.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: BIL-2026-1001', '2026-09-03 13:37:01'),
(84, 'GLOBAL', 'GLOBAL', 30, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '4010', 0.00, 654.60, 'Cash', 'admin', NULL, 'Typing Income: BIL-2026-1001', '2026-09-03 13:37:01'),
(85, 'GLOBAL', 'GLOBAL', 30, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '2010', 0.00, 6245.40, 'Cash', 'admin', NULL, 'Gov Pass-Through: BIL-2026-1001', '2026-09-03 13:37:01'),
(86, 'GLOBAL', 'GLOBAL', 30, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '1200', 0.00, 6900.00, 'Cash', 'admin', NULL, 'VOID Invoice: BIL-2026-1001', '2026-09-03 13:40:02'),
(87, 'GLOBAL', 'GLOBAL', 30, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '4010', 654.60, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Typing: BIL-2026-1001', '2026-09-03 13:40:02'),
(88, 'GLOBAL', 'GLOBAL', 30, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '2010', 6245.40, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Gov: BIL-2026-1001', '2026-09-03 13:40:02'),
(89, 'GLOBAL', 'GLOBAL', 31, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '1200', 6900.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: BIL-2026-1001', '2026-09-03 13:40:37'),
(90, 'GLOBAL', 'GLOBAL', 31, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '4010', 0.00, 654.60, 'Cash', 'admin', NULL, 'Typing Income: BIL-2026-1001', '2026-09-03 13:40:37'),
(91, 'GLOBAL', 'GLOBAL', 31, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '2010', 0.00, 6245.40, 'Cash', 'admin', NULL, 'Gov Pass-Through: BIL-2026-1001', '2026-09-03 13:40:37'),
(92, 'GLOBAL', 'GLOBAL', 31, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '1200', 0.00, 6900.00, 'Cash', 'admin', NULL, 'VOID Invoice: BIL-2026-1001', '2026-09-03 13:45:07'),
(93, 'GLOBAL', 'GLOBAL', 31, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '4010', 654.60, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Typing: BIL-2026-1001', '2026-09-03 13:45:07'),
(94, 'GLOBAL', 'GLOBAL', 31, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_VOID', '2010', 6245.40, 0.00, 'Cash', 'admin', NULL, 'VOID Rev Gov: BIL-2026-1001', '2026-09-03 13:45:07'),
(95, 'GLOBAL', 'GLOBAL', 32, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '1200', 3879.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: BIL-2026-1001', '2026-09-03 13:45:45'),
(96, 'GLOBAL', 'GLOBAL', 32, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '4010', 0.00, 215.37, 'Cash', 'admin', NULL, 'Typing Income: BIL-2026-1001', '2026-09-03 13:45:45'),
(97, 'GLOBAL', 'GLOBAL', 32, 'BIL-2026-1001', NULL, '2026-09-03', 'INV_CREATE', '2010', 0.00, 3663.63, 'Cash', 'admin', NULL, 'Gov Pass-Through: BIL-2026-1001', '2026-09-03 13:45:45'),
(98, 'GLOBAL', 'GLOBAL', 33, 'BIL-2026-1002', NULL, '2026-09-05', 'INV_CREATE', '1200', 5109.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: BIL-2026-1002', '2026-09-05 23:40:15'),
(99, 'GLOBAL', 'GLOBAL', 33, 'BIL-2026-1002', NULL, '2026-09-05', 'INV_CREATE', '4010', 0.00, 303.51, 'Cash', 'admin', NULL, 'Typing Income: BIL-2026-1002', '2026-09-05 23:40:15'),
(100, 'GLOBAL', 'GLOBAL', 33, 'BIL-2026-1002', NULL, '2026-09-05', 'INV_CREATE', '2010', 0.00, 4805.49, 'Cash', 'admin', NULL, 'Gov Pass-Through: BIL-2026-1002', '2026-09-05 23:40:15'),
(101, 'GLOBAL', 'GLOBAL', 34, 'BIL-2026-1003', NULL, '2026-09-06', 'INV_CREATE', '1200', 5599.00, 0.00, 'Cash', 'admin', NULL, 'Invoice Issued: BIL-2026-1003', '2026-09-06 20:01:46'),
(102, 'GLOBAL', 'GLOBAL', 34, 'BIL-2026-1003', NULL, '2026-09-06', 'INV_CREATE', '4010', 0.00, 482.23, 'Cash', 'admin', NULL, 'Typing Income: BIL-2026-1003', '2026-09-06 20:01:46'),
(103, 'GLOBAL', 'GLOBAL', 34, 'BIL-2026-1003', NULL, '2026-09-06', 'INV_CREATE', '2010', 0.00, 5116.77, 'Cash', 'admin', NULL, 'Gov Pass-Through: BIL-2026-1003', '2026-09-06 20:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `gov_emirates_scopes`
--

CREATE TABLE `gov_emirates_scopes` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gov_emirates_scopes`
--

INSERT INTO `gov_emirates_scopes` (`id`, `code`, `name`, `is_active`, `created_at`) VALUES
(1, 'ALL', 'Federal / All Emirates (UAE Wide)', 1, '2026-08-24 19:27:34'),
(2, 'DUBAI', 'Dubai Only (GDRFA / Amer / DED)', 1, '2026-08-24 19:27:34'),
(3, 'ABU_DHABI', 'Abu Dhabi Only (TAMM / DoH)', 1, '2026-08-24 19:27:34'),
(4, 'SHARJAH', 'Sharjah Only (SEDD / Tas-heel)', 1, '2026-08-24 19:27:34'),
(5, 'NORTHERN_EMIRATES', 'Northern Emirates (SHJ, AJM, RAK, UAQ, FUJ)', 1, '2026-08-24 19:27:34'),
(6, 'EXCEPT_DUBAI', 'Federal Portals (Except Dubai GDRFA)', 1, '2026-08-24 19:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `gov_portals`
--

CREATE TABLE `gov_portals` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `icon` varchar(50) DEFAULT 'fa-building-columns',
  `portal_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gov_portals`
--

INSERT INTO `gov_portals` (`id`, `code`, `name`, `icon`, `portal_url`, `is_active`, `created_at`) VALUES
(1, 'ICP', 'ICP Federal Authority for Identity & Citizenship', 'fa-id-card', 'https://smartservices.icp.gov.ae', 1, '2026-08-24 19:27:34'),
(2, 'MOHRE', 'MOHRE Ministry of Human Resources & Emiratisation', 'fa-briefcase', 'https://www.mohre.gov.ae', 1, '2026-08-24 19:27:34'),
(3, 'AMER', 'Amer / GDRFA Dubai Residency & Foreigners Affairs', 'fa-passport', 'https://gdrfad.gov.ae', 1, '2026-08-24 19:27:34'),
(4, 'TAMM', 'TAMM Abu Dhabi Integrated Government Services', 'fa-building-flag', 'https://www.tamm.abudhabi', 1, '2026-08-24 19:27:34'),
(5, 'DED', 'DED Economic Development & Commercial Licensing', 'fa-store', 'https://eservices.dubaided.gov.ae', 1, '2026-08-24 19:27:34'),
(6, 'EHS', 'EHS / DHA Medical Fitness & Occupational Health', 'fa-heart-pulse', 'https://www.ehs.gov.ae', 1, '2026-08-24 19:27:34'),
(7, 'MOFA', 'MOFA Ministry of Foreign Affairs (Attestations)', 'fa-certificate', 'https://www.mofa.gov.ae', 1, '2026-08-24 19:27:34'),
(8, 'TASJEEL', 'Traffic, Vehicles & RTA Licensing Portals', 'fa-car-side', 'https://www.rta.ae', 1, '2026-08-24 19:27:34'),
(9, 'MOJ', 'Ministry of Justice UAE Legal & Notary Services', 'fa-scale-balanced', 'https://www.moj.gov.ae', 1, '2026-08-24 19:27:34'),
(10, 'FTA', 'Federal Tax Authority (Corporate Tax & VAT)', 'fa-receipt', 'https://tax.gov.ae', 1, '2026-08-24 19:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `gov_services_directory`
--

CREATE TABLE `gov_services_directory` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(64) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `portal` varchar(32) NOT NULL DEFAULT 'ICP',
  `emirate_scope` varchar(32) NOT NULL DEFAULT 'ALL',
  `service_name` varchar(255) NOT NULL,
  `service_name_ar` varchar(255) DEFAULT NULL,
  `gov_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `typing_fee` decimal(10,2) NOT NULL DEFAULT 50.00,
  `processing_time` varchar(64) DEFAULT '1-2 Working Days',
  `required_documents` text DEFAULT NULL,
  `execution_steps` text DEFAULT NULL,
  `pro_tips_tricks` text DEFAULT NULL,
  `portal_url` varchar(255) DEFAULT NULL,
  `created_by_staff` varchar(64) DEFAULT 'ADMIN',
  `likes_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gov_services_directory`
--

INSERT INTO `gov_services_directory` (`id`, `tenant_id`, `is_public`, `portal`, `emirate_scope`, `service_name`, `service_name_ar`, `gov_fee`, `typing_fee`, `processing_time`, `required_documents`, `execution_steps`, `pro_tips_tricks`, `portal_url`, `created_by_staff`, `likes_count`, `created_at`, `updated_at`) VALUES
(1, 'GLOBAL', 1, 'ICP', 'ALL', 'New Residence Visa Stamping & Emirates ID (2 Years)', 'تثبيت الإقامة الجديدة وبطاقة الهوية (سنتين)', 750.00, 150.00, '1-2 Working Days', '1. Original Passport + Copy\n2. Approved Entry Permit\n3. Fit Medical Certificate (MOH/EHS/DHA)\n4. Tenancy Contract (Ejari/Tawtheeq)\n5. Passport Size Photo (White Background)', 'Step 1: Open ICP Smart Services portal.\nStep 2: Log in using Typing Center Establishment credentials.\nStep 3: Issue Medical Fitness Application.\nStep 4: Issue Emirates ID biometric form.\nStep 5: Submit Residency Stamping application with e-Visa attachment.', '💡 Pro-Tip: For Golden Visa nominees, select \'Priority Channel\' to bypass standard queue. Ensure passport has minimum 6 months validity.', 'https://smartservices.icp.gov.ae', 'shamil', 0, '2026-08-17 07:32:45', '2026-08-17 07:32:45'),
(2, 'GLOBAL', 1, 'AMER', 'DUBAI', 'Golden Visa 10-Year Investor / Executive Nomination', 'ترشيح الإقامة الذهبية 10 سنوات (مستثمر / مدير تنفيذي)', 1200.00, 350.00, '24-48 Hours', '1. 6 Months Bank Statement (Min 30k AED Monthly Salary)\n2. Equivalency Certificate from MOE\n3. Labor Contract (MOHRE)\n4. Passport & Valid Dubai Visa Copy', 'Step 1: Submit Nomination Request via GDRFA Dubai.\nStep 2: Upload attested degree and bank statement.\nStep 3: Await security approval SMS.\nStep 4: Cancel current visa and issue 10-Year Residence Permit.', '⚠️ Rejection Warning: Bank statement must clearly state \'Salary Transfer\' under WPS code. Stamped digital PDFs are accepted.', 'https://www.gdrfad.gov.ae', 'shamil', 0, '2026-08-17 07:32:45', '2026-08-18 10:51:35'),
(3, 'GLOBAL', 1, 'MOHRE', 'ALL', 'Electronic Work Permit (Offer Letter & Contract)', 'تصريح عمل إلكتروني وعقد العمل المعتمد', 350.00, 80.00, 'Same Day (2-4 Hours)', '1. Employee Passport Copy\n2. Clear Passport Photo\n3. Attested Educational Certificate (Skill Levels 1-3)\n4. Company Trade License Copy', 'Step 1: Log in to MOHRE Tasheel E-Services.\nStep 2: Select \'Issue Initial Work Permit Approval\'.\nStep 3: Enter Establishment Code.\nStep 4: Print generated standard contract for signature.\nStep 5: Upload signed contract and pay quota fee.', '💡 Hidden Trick: Check company quota balance prior to typing to avoid deposit hold up.', 'https://www.mohre.gov.ae', 'shamil', 1, '2026-08-17 07:32:45', '2026-08-18 08:07:25'),
(4, 'GLOBAL', 1, 'TAMM', 'ABU_DHABI', 'Tawtheeq Lease Registration & Attestation', 'تسجيل وتوثيق عقود الإيجار السكنية والتجارية', 100.00, 50.00, 'Instant Automated', '1. Property Title Deed / Onwani Code\n2. Tenant Emirates ID Copy\n3. Landlord Emirates ID Copy\n4. Signed Standard Tenancy Contract', 'Step 1: Open TAMM Abu Dhabi portal.\nStep 2: Sign in with UAE Pass or Center Corporate account.\nStep 3: Input Premise ID number.\nStep 4: Confirm utility integration and pay attestation fee.', '💡 Note: Abu Dhabi residency stamping strictly requires an active Tawtheeq number matching the employee or sponsor name.', 'https://www.tamm.abudhabi', 'shamil', 1, '2026-08-17 07:32:45', '2026-08-18 08:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `gov_service_comments`
--

CREATE TABLE `gov_service_comments` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `tenant_id` varchar(64) NOT NULL,
  `tenant_name` varchar(128) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `staff_name` varchar(128) NOT NULL,
  `staff_role` varchar(64) DEFAULT 'TYPIST',
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gov_service_likes`
--

CREATE TABLE `gov_service_likes` (
  `service_id` int(11) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `tenant_id` varchar(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_insurance_applications`
--

CREATE TABLE `health_insurance_applications` (
  `id` int(11) NOT NULL,
  `app_no` varchar(50) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `processor_tenant_id` varchar(50) DEFAULT NULL,
  `created_by_user` int(11) NOT NULL,
  `assigned_user_id` int(11) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `sponsor_name` varchar(255) DEFAULT NULL,
  `insured_member_id` int(11) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `insurer_name` varchar(150) NOT NULL,
  `emirates_id_no` varchar(30) DEFAULT NULL,
  `uid_no` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ref_no` varchar(100) DEFAULT NULL,
  `policy_no` varchar(100) DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT 0.00,
  `payment_link` text DEFAULT NULL,
  `payment_expiry` datetime DEFAULT NULL,
  `status` enum('NEW','UNDER_PROCESS','ACTION_REQUIRED','PAYMENT_PENDING','PAYMENT_COMPLETED','POLICY_ISSUED','COMPLETED','CANCELLED') DEFAULT 'NEW',
  `icp_status` enum('PENDING','LINKED','FAILED') DEFAULT 'PENDING',
  `icp_linked_at` datetime DEFAULT NULL,
  `last_status_change_at` datetime DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  `processor_notes` text DEFAULT NULL,
  `action_requested_note` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_insurance_companies`
--

CREATE TABLE `health_insurance_companies` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `name_ar` varchar(100) DEFAULT NULL,
  `portal_url` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') DEFAULT 'ACTIVE',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_insurance_documents`
--

CREATE TABLE `health_insurance_documents` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `doc_type` enum('COMBINED_PDF','PASSPORT','EMIRATES_ID','VISA','TRADE_LICENSE','OWNER_EID','RECEIPT','POLICY_CERTIFICATE','TABLE_OF_BENEFITS','OTHER') NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_size` int(11) DEFAULT 0,
  `uploaded_by` varchar(50) DEFAULT 'SYSTEM',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_insurance_history`
--

CREATE TABLE `health_insurance_history` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `old_status` varchar(50) DEFAULT NULL,
  `new_status` varchar(50) NOT NULL,
  `action_by` varchar(100) NOT NULL,
  `comments` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_insurance_members`
--

CREATE TABLE `health_insurance_members` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `sponsor_name` varchar(255) DEFAULT NULL,
  `member_name` varchar(255) NOT NULL,
  `emirates_id_no` varchar(50) DEFAULT NULL,
  `uid_no` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_insurance_plans`
--

CREATE TABLE `health_insurance_plans` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `plan_code` varchar(50) NOT NULL,
  `plan_name` varchar(100) NOT NULL,
  `plan_name_ar` varchar(100) DEFAULT NULL,
  `coverage_limit` decimal(12,2) DEFAULT 150000.00,
  `premium_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') DEFAULT 'ACTIVE',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `health_insurance_plans`
--

INSERT INTO `health_insurance_plans` (`id`, `company_id`, `plan_code`, `plan_name`, `plan_name_ar`, `coverage_limit`, `premium_amount`, `description`, `status`, `created_at`) VALUES
(1, 1, 'ORIENT-EBP', 'Essential Benefit Plan (EBP)', 'خطة المزايا الأساسية', 150000.00, 361.21, 'Standard Dubai & Northern Emirates EBP health coverage', 'ACTIVE', '2026-08-14 22:04:46'),
(2, 1, 'ORIENT-SILVER', 'Silver Family & Corporate Health', 'الرعاية الصحية الفضية', 250000.00, 750.00, 'Comprehensive outpatient and inpatient care with standard co-pay', 'ACTIVE', '2026-08-14 22:04:46'),
(3, 1, 'ORIENT-GOLD', 'Gold VIP Executive Health', 'الخطة الذهبية الشاملة', 1000000.00, 1850.00, 'Worldwide coverage with zero deductible for executives', 'ACTIVE', '2026-08-14 22:04:46'),
(4, 2, 'SUKOON-EBP', 'Sukoon Essential Health Care', 'سكون الرعاية الأساسية', 150000.00, 380.00, 'Mandatory residency compliance health insurance', 'ACTIVE', '2026-08-14 22:04:46'),
(5, 2, 'SUKOON-PLUS', 'Sukoon Regional Care Plus', 'سكون بلس الصحية الإقليمية', 500000.00, 920.00, 'GCC-wide inpatient and network clinic coverage', 'ACTIVE', '2026-08-14 22:04:46'),
(6, 2, 'SUKOON-CORP', 'Sukoon Corporate Group Health', 'رعاية المجموعات للشركات', 2000000.00, 2400.00, 'Custom network coverage for enterprise business owners', 'ACTIVE', '2026-08-14 22:04:46'),
(7, 3, 'DAMAN-EBP', 'Daman Basic Abu Dhabi Plan', 'ضمان الأساسي صحي', 150000.00, 340.00, 'Abu Dhabi & Northern Emirates mandatory visa health plan', 'ACTIVE', '2026-08-14 22:04:46'),
(8, 3, 'DAMAN-SILVER', 'Daman Silver Regional Health', 'ضمان الفضي الإقليمي', 300000.00, 810.00, 'Enhanced hospital network access across all 7 Emirates', 'ACTIVE', '2026-08-14 22:04:46'),
(9, 3, 'DAMAN-GOLD', 'Daman Global Network Plan', 'ضمان الشبكة العالمية', 1500000.00, 2100.00, 'International medical coverage with zero co-payment', 'ACTIVE', '2026-08-14 22:04:46');

-- --------------------------------------------------------

--
-- Table structure for table `icp_inquiry_logs`
--

CREATE TABLE `icp_inquiry_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL DEFAULT 'GLOBAL',
  `user_id` varchar(50) DEFAULT NULL,
  `username` varchar(100) NOT NULL DEFAULT 'Typist',
  `customer_id` varchar(50) DEFAULT NULL,
  `applicant_name` varchar(255) DEFAULT NULL,
  `search_type` varchar(50) NOT NULL DEFAULT 'PASSPORT',
  `identifier_value` varchar(100) NOT NULL,
  `nationality_code` varchar(10) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `icp_inquiry_logs`
--

INSERT INTO `icp_inquiry_logs` (`id`, `tenant_id`, `user_id`, `username`, `customer_id`, `applicant_name`, `search_type`, `identifier_value`, `nationality_code`, `created_at`) VALUES
(1, 'GLOBAL', 'USR-001', 'admin', '', '', 'PASSPORT', '', '205', '2026-08-29 18:03:31'),
(2, 'GLOBAL', 'USR-001', 'admin', '', '', 'PASSPORT', '', '205', '2026-08-29 18:03:39'),
(3, 'GLOBAL', 'USR-001', 'admin', '', '', 'PASSPORT', '', '205', '2026-08-29 18:04:17'),
(4, 'GLOBAL', 'USR-001', 'admin', '', '', 'PASSPORT', '', '205', '2026-08-29 18:04:21');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `parent_invoice_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Original invoice ID if this is a Credit Note',
  `tenant_id` varchar(50) NOT NULL,
  `branch_id` varchar(50) NOT NULL DEFAULT 'MAIN',
  `invoice_no` varchar(50) NOT NULL,
  `invoice_type` enum('TAX_INVOICE','COMMERCIAL_BILL','CREDIT_NOTE') NOT NULL DEFAULT 'TAX_INVOICE',
  `client_name` varchar(150) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `customer_phone` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `gov_fee` decimal(10,2) DEFAULT 0.00,
  `typing_fee` decimal(10,2) DEFAULT 0.00,
  `subtotal` decimal(10,2) DEFAULT 0.00,
  `discount` decimal(10,2) DEFAULT 0.00,
  `vat_amount` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) DEFAULT 0.00,
  `received_amount` decimal(10,2) DEFAULT 0.00,
  `refunded_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `balance_amount` decimal(10,2) DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `staff_id` varchar(50) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `qr_payload` text DEFAULT NULL COMMENT 'Base64 TLV/QR payload for UAE E-Invoicing',
  `payment_mode` varchar(50) DEFAULT 'Cash',
  `payment_split_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Stores multi-payment breakdown e.g. {"Cash": 500, "Card": 300}' CHECK (json_valid(`payment_split_json`)),
  `payment_status` enum('PAID','PARTIAL','PENDING','REFUNDED','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `parent_invoice_id`, `tenant_id`, `branch_id`, `invoice_no`, `invoice_type`, `client_name`, `customer_id`, `employee_id`, `customer_phone`, `subject`, `gov_fee`, `typing_fee`, `subtotal`, `discount`, `vat_amount`, `total_amount`, `received_amount`, `refunded_amount`, `balance_amount`, `notes`, `staff_id`, `attachment`, `qr_payload`, `payment_mode`, `payment_split_json`, `payment_status`, `created_at`, `updated_at`) VALUES
(32, NULL, 'GLOBAL', 'GLOBAL', 'BIL-2026-1001', 'COMMERCIAL_BILL', 'ABU THAMEEM', 'GLO-C-1001', 1, '0582689099', 'MOHRE Labour Card Renewal Only', 3663.63, 215.37, 3879.00, 0.00, 0.00, 3879.00, 0.00, 0.00, -3879.00, '', 'admin', NULL, 'ARtUeXBpbmdIdWIgU2FhUyBIZWFkcXVhcnRlcnMCDzEwMDAwMDAwMDAwMDAwMwMUMjAyNi0wOS0wM1QxMzo0NTo0NVoEBzM4NzkuMDAFBDAuMDA=', 'Cash', NULL, 'PENDING', '2026-09-03 09:45:45', NULL),
(33, NULL, 'GLOBAL', 'GLOBAL', 'BIL-2026-1002', 'COMMERCIAL_BILL', 'MUHSINA PADVUIL', 'DEM-C-1001', NULL, '05555555555555555', 'Work Permit to Change of Status Package', 4805.49, 303.51, 5109.00, 0.00, 0.00, 5109.00, 0.00, 0.00, -5109.00, '', 'admin', NULL, 'ARtUeXBpbmdIdWIgU2FhUyBIZWFkcXVhcnRlcnMCDzEwMDAwMDAwMDAwMDAwMwMUMjAyNi0wOS0wNVQyMzo0MDoxNVoEBzUxMDkuMDAFBDAuMDA=', 'Cash', NULL, 'PENDING', '2026-09-05 19:40:15', NULL),
(34, NULL, 'GLOBAL', 'GLOBAL', 'BIL-2026-1003', 'COMMERCIAL_BILL', 'ABU THAMEEM', 'GLO-C-1001', NULL, '0582689099', 'Employment Visa & Labour Card Renewal Package', 5116.77, 482.23, 5599.00, 0.00, 0.00, 5599.00, 0.00, 0.00, -5599.00, '', 'admin', NULL, 'ARtUeXBpbmdIdWIgU2FhUyBIZWFkcXVhcnRlcnMCDzEwMDAwMDAwMDAwMDAwMwMUMjAyNi0wOS0wNlQyMDowMTo0NloEBzU1OTkuMDAFBDAuMDA=', 'Cash', NULL, 'PENDING', '2026-09-06 16:01:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_audit_logs`
--

CREATE TABLE `invoice_audit_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL DEFAULT 'GLOBAL',
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `invoice_no` varchar(50) NOT NULL,
  `action` varchar(30) NOT NULL,
  `delta_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `delta_gov_fee` decimal(12,2) NOT NULL DEFAULT 0.00,
  `delta_typing_fee` decimal(12,2) NOT NULL DEFAULT 0.00,
  `delta_vat` decimal(12,2) NOT NULL DEFAULT 0.00,
  `staff_id` varchar(50) NOT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`details`)),
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_audit_logs`
--

INSERT INTO `invoice_audit_logs` (`id`, `tenant_id`, `invoice_id`, `invoice_no`, `action`, `delta_amount`, `delta_gov_fee`, `delta_typing_fee`, `delta_vat`, `staff_id`, `details`, `created_at`) VALUES
(1, 'DEM-0CD4', 16, 'INV-2026-1001', 'EDITED', 0.00, 0.00, 0.00, 0.00, 'demo', '{\"old_total\":\"3030.00\",\"new_total\":3030,\"delta_received\":1000}', '2026-09-01 13:09:11'),
(2, 'GLOBAL', 33, 'BIL-2026-1002', 'EDITED', 0.00, 0.00, 0.00, 0.00, 'admin', '{\"old_total\":\"5109.00\",\"new_total\":5109,\"delta_received\":0}', '2026-09-05 23:41:15'),
(3, 'GLOBAL', 33, 'BIL-2026-1002', 'EDITED', 0.00, 0.00, 0.00, 0.00, 'admin', '{\"old_total\":\"5109.00\",\"new_total\":5109,\"delta_received\":0}', '2026-09-06 17:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_credit_notes`
--

CREATE TABLE `invoice_credit_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `branch_id` varchar(50) NOT NULL DEFAULT 'MAIN',
  `credit_note_no` varchar(50) NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `invoice_no` varchar(50) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `refund_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `refund_vat` decimal(12,2) NOT NULL DEFAULT 0.00,
  `reason` text NOT NULL,
  `staff_id` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_credit_notes`
--

INSERT INTO `invoice_credit_notes` (`id`, `tenant_id`, `branch_id`, `credit_note_no`, `invoice_id`, `invoice_no`, `customer_id`, `refund_amount`, `refund_vat`, `reason`, `staff_id`, `created_at`) VALUES
(1, 'GLOBAL', 'GLOBAL', 'CRN-2026-1001', 21, 'INV-2026-1004', 'GLO-C-1001', 1000.00, 0.00, 'fdsfdsfd', 'admin', '2026-09-02 10:18:19');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_drafts`
--

CREATE TABLE `invoice_drafts` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `draft_title` varchar(255) DEFAULT 'Untitled Draft',
  `draft_data` longtext NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_drafts`
--

INSERT INTO `invoice_drafts` (`id`, `tenant_id`, `user_id`, `customer_id`, `draft_title`, `draft_data`, `updated_at`) VALUES
(28, 'GLOBAL', 'USR-001', 'DEM-C-1001', 'Draft for MUHSINA PADVUIL', '{\"draft_id\":null,\"customer_id\":\"DEM-C-1001\",\"client_name\":\"MUHSINA PADVUIL\",\"employee_id\":\"\",\"subject\":\"Family Visa Processing - اقامة عائلية\",\"discount\":\"0.00\",\"received_amount\":\"0.00\",\"payment_split\":{\"Cash\":\"0.00\",\"Card\":\"0.00\",\"Transfer\":\"0.00\",\"Cheque\":\"0.00\"},\"has_valid_items\":true,\"items\":[{\"gov_category\":\"ICP\\/ICA\\/GDRFA\",\"application_no\":\"\",\"applicant_name\":\"\",\"description\":\"Entry permit - تأشيره\",\"amount\":\"400\",\"gov_fee\":\"356.2\",\"qty\":\"1\",\"vat_applicable\":0},{\"gov_category\":\"HEALTHINS\",\"application_no\":\"\",\"applicant_name\":\"\",\"description\":\"Medical Insurance - التأمين الصحي ***\",\"amount\":\"400\",\"gov_fee\":\"361\",\"qty\":\"1\",\"vat_applicable\":0},{\"gov_category\":\"ICP\\/ICA\\/GDRFA\",\"application_no\":\"\",\"applicant_name\":\"\",\"description\":\"File Opening ** فتح ملف جوازات\",\"amount\":\"400\",\"gov_fee\":\"356.2\",\"qty\":\"1\",\"vat_applicable\":0},{\"gov_category\":\"MEDICAL\",\"application_no\":\"\",\"applicant_name\":\"\",\"description\":\"Medical Typing - فحص الطبي\",\"amount\":\"300\",\"gov_fee\":\"266.89\",\"qty\":\"1\",\"vat_applicable\":0},{\"gov_category\":\"ICP\\/ICA\\/GDRFA\",\"application_no\":\"\",\"applicant_name\":\"\",\"description\":\"Residency and Identity - اصدار اقامة وهوية\",\"amount\":\"830\",\"gov_fee\":\"761.66\",\"qty\":\"1\",\"vat_applicable\":0},{\"gov_category\":\"ICP\\/ICA\\/GDRFA\",\"application_no\":\"\",\"applicant_name\":\"\",\"description\":\"Change Status ** تعديل وضع\",\"amount\":\"700\",\"gov_fee\":\"660\",\"qty\":\"1\",\"vat_applicable\":0}]}', '2026-09-06 18:57:02');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `sl_no` int(11) NOT NULL DEFAULT 1,
  `service_code` varchar(50) DEFAULT NULL,
  `gov_category` varchar(50) DEFAULT 'OTHER' COMMENT 'ICP, MOHRE, AMER, TASHEEL, DED, MEDICAL, EID',
  `application_no` varchar(100) DEFAULT NULL COMMENT 'E-Form App # / MB No / Transaction #',
  `applicant_name` varchar(150) DEFAULT NULL COMMENT 'Beneficiary / Worker / Applicant Name',
  `description` varchar(255) NOT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT 1.00,
  `unit_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `gov_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `typing_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `vat_applicable` tinyint(1) DEFAULT 1,
  `is_completed` tinyint(1) DEFAULT 0,
  `vat_rate` decimal(5,2) NOT NULL DEFAULT 5.00,
  `vat_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `line_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `sl_no`, `service_code`, `gov_category`, `application_no`, `applicant_name`, `description`, `qty`, `unit_price`, `gov_fee`, `typing_fee`, `vat_applicable`, `is_completed`, `vat_rate`, `vat_amount`, `line_total`, `remarks`, `created_at`) VALUES
(258, 32, 1, NULL, 'MOHRE', NULL, NULL, 'Renew Labour Contract Typing - طباعة تجديد عقد العمل', 1.00, 70.00, 0.00, 70.00, 0, 0, 0.00, 0.00, 70.00, NULL, '2026-09-03 09:45:45'),
(259, 32, 2, NULL, 'MOHRE', NULL, NULL, 'Labour Card Fee & Tawjeeh (Cat 3) - رسوم بطاقة العمل وتوجيه (الفئة 3)', 1.00, 3620.00, 3474.63, 145.37, 0, 0, 0.00, 0.00, 3620.00, NULL, '2026-09-03 09:45:45'),
(260, 32, 3, NULL, 'DUBINS', NULL, NULL, 'WPP Workers Insurance - برنامج حماية العمال', 1.00, 189.00, 189.00, 0.00, 0, 0, 0.00, 0.00, 189.00, NULL, '2026-09-03 09:45:45'),
(273, 33, 1, NULL, 'ICP', NULL, NULL, 'WPP Worker Protection Insurance - برنامج حماية العمال', 1.00, 189.00, 189.00, 0.00, 0, 0, 0.00, 0.00, 189.00, NULL, '2026-09-06 13:48:57'),
(274, 33, 2, NULL, 'ICP', NULL, NULL, 'MOHRE Labour Card Approval Fee - رسوم الموافقة المبدئية لبطاقة العمل', 1.00, 3530.00, 3474.00, 56.00, 0, 0, 0.00, 0.00, 3530.00, NULL, '2026-09-06 13:48:57'),
(275, 33, 3, NULL, 'ICP', NULL, NULL, 'Entry Permit (Work) - إذن دخول للعمل', 1.00, 400.00, 356.20, 43.80, 0, 0, 0.00, 0.00, 400.00, NULL, '2026-09-06 13:48:57'),
(276, 33, 4, NULL, 'ICP', NULL, NULL, 'Change of Status - تعديل الوضع داخل الدولة', 1.00, 700.00, 660.29, 39.71, 0, 0, 0.00, 0.00, 700.00, NULL, '2026-09-06 13:48:57'),
(277, 33, 5, NULL, 'MOHRE', NULL, NULL, 'Tawjeeh Training & Contract Submission - تدريب توجيه وتسليم العقد', 1.00, 150.00, 0.00, 150.00, 0, 0, 0.00, 0.00, 150.00, NULL, '2026-09-06 13:48:57'),
(278, 33, 6, NULL, 'MOHRE', NULL, NULL, 'ILOE Unemployment Insurance - تأمين التعطل عن العمل', 1.00, 140.00, 126.00, 14.00, 0, 0, 0.00, 0.00, 140.00, NULL, '2026-09-06 13:48:57'),
(279, 34, 1, NULL, 'MOHRE', NULL, NULL, 'MOHRE Contract Renewal Typing - طباعة تجديد عقد العمل', 1.00, 70.00, 0.00, 70.00, 0, 0, 0.00, 0.00, 70.00, NULL, '2026-09-06 16:01:46'),
(280, 34, 2, NULL, 'DUBINS', NULL, NULL, 'WPP Worker Protection Insurance - برنامج حماية العمال', 1.00, 189.00, 189.00, 0.00, 0, 0, 0.00, 0.00, 189.00, NULL, '2026-09-06 16:01:46'),
(281, 34, 3, NULL, 'MOHRE', NULL, NULL, 'MOHRE Labour Card Fee & Tawjeeh Class - رسوم تجديد بطاقة العمل وتوجيه', 1.00, 3620.00, 3474.63, 145.37, 0, 0, 0.00, 0.00, 3620.00, NULL, '2026-09-06 16:01:46'),
(282, 34, 4, NULL, 'OTHER', NULL, NULL, 'ILOE Unemployment Insurance - تأمين التعطل عن العمل', 1.00, 140.00, 126.00, 14.00, 0, 0, 0.00, 0.00, 140.00, NULL, '2026-09-06 16:01:46'),
(283, 34, 5, NULL, 'MEDICAL', NULL, NULL, 'Medical Fitness Examination - فحص اللياقة الطبية', 1.00, 300.00, 266.89, 33.11, 0, 0, 0.00, 0.00, 300.00, NULL, '2026-09-06 16:01:46'),
(284, 34, 6, NULL, 'HEALTHINS', NULL, NULL, 'Health Insurance - التأمين الصحي', 1.00, 450.00, 299.25, 150.75, 0, 0, 0.00, 0.00, 450.00, NULL, '2026-09-06 16:01:46'),
(285, 34, 7, NULL, 'ICP/ICA/GDRFA', NULL, NULL, 'Renew Emirates ID & Residence Visa - تجديد الإقامة وبطاقة الهوية', 1.00, 830.00, 761.00, 69.00, 0, 0, 0.00, 0.00, 830.00, NULL, '2026-09-06 16:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL DEFAULT 'GLOBAL',
  `branch_id` varchar(50) NOT NULL DEFAULT 'MAIN',
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `payment_no` varchar(50) NOT NULL,
  `payment_method` enum('Cash','Card','Transfer','Cheque','Credit') NOT NULL DEFAULT 'Cash',
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payment_date` date NOT NULL,
  `staff_id` varchar(50) NOT NULL DEFAULT 'ADMIN',
  `attachment` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_payments`
--

INSERT INTO `invoice_payments` (`id`, `tenant_id`, `branch_id`, `invoice_id`, `payment_no`, `payment_method`, `amount`, `payment_date`, `staff_id`, `attachment`, `notes`, `created_at`) VALUES
(3, 'GLOBAL', 'GLOBAL', 18, 'PAY-INV-2026-1001-01', 'Cash', 537.00, '2026-09-02', 'admin', NULL, 'Initial Invoice Settlement (Cash)', '2026-09-02 09:39:45'),
(4, 'GLOBAL', 'GLOBAL', 19, 'PAY-INV-2026-1002-01', 'Cash', 3055.00, '2026-09-02', 'admin', NULL, 'Initial Invoice Settlement (Cash)', '2026-09-02 09:40:59'),
(5, 'GLOBAL', 'GLOBAL', 20, 'PAY-INV-2026-1003-01', 'Cash', 5109.00, '2026-09-02', 'admin', NULL, 'Initial Invoice Settlement (Cash)', '2026-09-02 09:57:46'),
(6, 'GLOBAL', 'GLOBAL', 21, 'PAY-INV-2026-1004-01', 'Cash', 6590.00, '2026-09-02', 'admin', NULL, 'Initial Invoice Settlement (Cash)', '2026-09-02 10:04:35'),
(7, 'GLOBAL', 'GLOBAL', 25, 'PAY-BIL-2026-1003-01', 'Card', 10.00, '2026-09-03', 'admin', NULL, 'Initial Settlement (Card)', '2026-09-03 11:34:25'),
(8, 'GLOBAL', 'GLOBAL', 26, 'PAY-BIL-2026-1004-01', 'Transfer', 6900.00, '2026-09-03', 'admin', NULL, 'Initial Settlement (Transfer)', '2026-09-03 11:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL DEFAULT 'GLOBAL',
  `user_id` varchar(50) DEFAULT NULL,
  `category` enum('TASK','BILLING','SHIFT','SYSTEM') NOT NULL DEFAULT 'TASK',
  `title` varchar(150) NOT NULL,
  `message` varchar(255) NOT NULL,
  `link_url` varchar(255) DEFAULT 'index.php?page=dashboard',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `tenant_id`, `user_id`, `category`, `title`, `message`, `link_url`, `is_read`, `created_at`) VALUES
(1, 'GLOBAL', NULL, 'BILLING', 'New Tax Invoice Issued', 'Invoice #INV-2026-1001 for Mohammed Al Zaabi (AED 52.50) has been created.', 'index.php?page=billing&tab=view', 1, '2026-08-25 07:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `email_or_phone` varchar(191) NOT NULL,
  `otp_code` varchar(10) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_used` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preset_service`
--

CREATE TABLE `preset_service` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(50) NOT NULL DEFAULT 'TENANT-DXB-01',
  `is_global` tinyint(1) NOT NULL DEFAULT 0,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `preset_service`
--

INSERT INTO `preset_service` (`id`, `tenant_id`, `is_global`, `code`, `name`, `subject`, `created_at`) VALUES
(1, 'GLOBAL', 1, 'CANCELLATION', 'Residence and Labour Cancellation - الغاء بطاقة عمل والاقامة', 'Residence & Labour Cancellation', '2026-08-25 12:35:56'),
(105, 'GLOBAL', 1, 'FAMILY_VISA', 'Family visa ... اقامة عائلى', 'Family Visa Processing - اقامة عائلية', '2026-08-25 12:38:33'),
(107, 'GLOBAL', 1, 'TL_RENEW', 'Trade License Renewal - تجديد رخصة تجارية', 'Commercial Trade License Renewal Package', '2026-08-25 13:53:58'),
(108, 'GLOBAL', 1, 'WORK_VISA_2YR', 'New Employment Visa 2 Years (Cat 2 & 3) - إقامة عمل جديدة سنتين (الفئة 2 و 3)', 'Full 2-Year Employment Visa Package', '2026-08-25 13:53:58'),
(109, 'GLOBAL', 1, 'POA', 'Power of Attorney (POA) - وكالة قانونية / خاصة', 'Power of Attorney Drafting & Notary Attestation', '2026-08-25 13:53:58'),
(110, 'GLOBAL', 1, 'TL_NEW', 'New Business License Setup - تأسيس وإصدار رخصة تجارية جديدة', 'Complete Company Formation & Commercial License Setup', '2026-08-25 13:53:58'),
(111, 'GLOBAL', 1, 'MAID_VISA', 'Domestic Worker / Housemaid Visa - إقامة العمالة المساعدة (سائق، خادمة، مربية)', 'Domestic Worker Visa Processing Package', '2026-08-25 13:53:58'),
(113, 'GLOBAL', 1, 'RENEW_WORK_VISA', 'Renew Employment Visa & Labour Card - تجديد إقامة العمل وبطاقة العمل', 'Employment Visa & Labour Card Renewal Package', '2026-08-25 13:53:58'),
(114, 'GLOBAL', 1, 'LABOUR_RENEW_ONLY', 'Renew Labour Card Only - تجديد بطاقة العمل فقط', 'MOHRE Labour Card Renewal Only', '2026-08-25 13:53:58'),
(115, 'GLOBAL', 1, 'OFFER_TO_STATUS', 'Offer Letter to Change of Status - من عرض العمل إلى تعديل الوضع', 'Work Permit to Change of Status Package', '2026-08-25 13:53:58'),
(116, 'GLOBAL', 1, 'STATUS_TO_STAMPING', 'Visa Stamping after Status Change - تثبيت الإقامة بعد تعديل الوضع', 'Medical, Insurance & Residence Stamping Package', '2026-08-25 13:53:58'),
(117, 'GLOBAL', 1, 'ABSCONDING', 'Absconding Report (MOHRE & ICP) - تسجيل بلاغ انقطاع عن العمل والهروب', 'MOHRE & Immigration Absconding Case Filing', '2026-08-25 13:53:58'),
(118, 'GLOBAL', 1, 'GENERAL_GOV_SERVICES', 'Suggetion for All General E-Services & Typings - جميع الخدمات والطباعات الحكومية العامة', 'General Government Typing & Clearance Services', '2026-08-25 13:53:58'),
(119, 'GLOBAL', 0, '10', 'IMAAN ZAYED KALIPPADATH AYYOOB KALIPPADATH_Additional Attachment No 1', 'Urgent Complaint Regarding Delay in Emirates ID Application – GCC Citizen', '2026-09-02 08:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `preset_service_items`
--

CREATE TABLE `preset_service_items` (
  `id` int(11) NOT NULL,
  `preset_service_id` int(11) NOT NULL,
  `gov_category` varchar(50) DEFAULT 'OTHER',
  `description` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `gov_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `vat_applicable` tinyint(1) DEFAULT 1,
  `qty` decimal(10,2) NOT NULL DEFAULT 1.00,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `preset_service_items`
--

INSERT INTO `preset_service_items` (`id`, `preset_service_id`, `gov_category`, `description`, `amount`, `gov_fee`, `vat_applicable`, `qty`, `sort_order`) VALUES
(26, 107, 'OTHER', 'Tenancy Agreement Attestation (Ejari/Tawtheeq) - توثيق عقد الإيجار', 0.00, 0.00, 0, 1.00, 0),
(27, 107, 'OTHER', 'Civil Defense Approval - موافقة الدفاع المدني', 0.00, 0.00, 0, 1.00, 0),
(28, 107, 'OTHER', 'Chamber of Commerce Membership - غرفة التجارة والصناعة', 0.00, 0.00, 0, 1.00, 0),
(29, 107, 'OTHER', 'Camera Surveillance Approval (SIRA) - شهادة الكاميرات المراقبة', 400.00, 300.00, 0, 1.00, 0),
(30, 107, 'OTHER', 'Municipality License Renewal Fee - رسوم تجديد البلدية', 0.00, 0.00, 0, 1.00, 0),
(31, 107, 'OTHER', 'Typing, Online Submission & Professional Fee - رسوم تخليص ومتابعة المعاملة', 1000.00, 0.00, 0, 1.00, 0),
(43, 110, 'OTHER', 'Trade Name Reservation - حجز الاسم التجاري', 200.00, 0.00, 0, 1.00, 0),
(44, 110, 'OTHER', 'Immigration Initial Approval - الموافقة المبدئية للجوازات', 200.00, 153.47, 0, 1.00, 0),
(45, 110, 'OTHER', 'Tenancy Agreement Attestation (Ejari 2%) - تصديق عقد الإيجار', 0.00, 0.00, 0, 1.00, 0),
(46, 110, 'OTHER', 'Memorandum of Association (MOA) Typing - صياغة عقد تأسيس الشركة', 0.00, 0.00, 0, 1.00, 0),
(47, 110, 'OTHER', 'MOA Notary Public Attestation - تصديق عقد التأسيس كاتب العدل', 0.00, 0.00, 0, 1.00, 0),
(48, 110, 'OTHER', 'Civil Defense Approval - موافقة الدفاع المدني', 0.00, 0.00, 0, 1.00, 0),
(49, 110, 'OTHER', 'Chamber of Commerce Certificate - شهادة غرفة التجارة', 0.00, 0.00, 0, 1.00, 0),
(50, 110, 'OTHER', 'Municipality License Fee - رسوم إصدار البلدية', 0.00, 0.00, 0, 1.00, 0),
(51, 110, 'OTHER', 'Department of Economy Fee - رسوم دائرة التنمية الاقتصادية', 0.00, 0.00, 0, 1.00, 0),
(52, 110, 'OTHER', 'Camera Surveillance Certificate (SIRA) - شهادة الكاميرات والمراقبة', 400.00, 300.00, 0, 1.00, 0),
(53, 110, 'OTHER', 'Establishment Card (3 Years) - بطاقة المنشأة (3 سنوات)', 0.00, 0.00, 0, 1.00, 0),
(54, 110, 'OTHER', 'E-Channel Subscription - الاشتراك في نظام الجوازات الإلكتروني', 0.00, 0.00, 0, 1.00, 0),
(55, 110, 'OTHER', 'MOHRE Labour File Opening - فتح ملف المنشأة لدى وزارة العمل', 100.00, 53.00, 0, 1.00, 0),
(56, 110, 'OTHER', 'Agency Service & Processing Fee - رسوم تخليص ومتابعة المعاملة', 1000.00, 0.00, 0, 1.00, 0),
(143, 119, 'OTHER', '4554', 10.00, 5.00, 0, 1.00, 0),
(170, 111, 'ICP', 'Entry Permit (Domestic Worker) - إذن دخول عمالة مساعدة', 400.00, 218.00, 0, 1.00, 1),
(171, 111, 'MEDICAL', 'Medical Fitness Examination - فحص اللياقة الطبية', 400.00, 317.25, 0, 1.00, 2),
(172, 111, 'HEALTHINS', 'Health Insurance - التأمين الصحي', 400.00, 361.00, 0, 1.00, 3),
(173, 111, 'DUBINS', 'WPP Worker Protection Insurance - تأمين حماية العمال', 105.00, 105.00, 0, 1.00, 4),
(174, 111, 'ICP', 'Change of Status - تعديل الوضع', 600.00, 518.00, 0, 1.00, 5),
(175, 111, 'ICP', 'Emirates ID Card Typing - طباعة بطاقة الهوية الإماراتية', 400.00, 356.00, 0, 1.00, 6),
(176, 111, 'ICP', 'Residence Visa Issuance - إصدار الإقامة', 350.00, 318.00, 0, 1.00, 7),
(177, 111, 'ICP', 'Sponsor File Opening - فتح ملف كفيل', 400.00, 300.00, 0, 1.00, 8),
(178, 105, 'ICP', 'Entry permit - تأشيره', 400.00, 356.20, 0, 1.00, 1),
(179, 105, 'HEALTHINS', 'Medical Insurance - التأمين الصحي ***', 400.00, 361.00, 0, 1.00, 2),
(180, 105, 'ICP', 'File Opening ** فتح ملف جوازات', 400.00, 356.20, 0, 1.00, 3),
(181, 105, 'MEDICAL', 'Medical Typing - فحص الطبي', 300.00, 266.89, 0, 1.00, 4),
(182, 105, 'ICP', 'Residency and Identity - اصدار اقامة وهوية', 830.00, 761.66, 0, 1.00, 5),
(183, 105, 'ICP', 'Change Status ** تعديل وضع', 700.00, 660.00, 0, 1.00, 6),
(194, 108, 'DUBINS', 'WPP Workers Protection Insurance - تأمين حماية العمال', 200.00, 189.00, 0, 1.00, 1),
(195, 108, 'MOHRE', 'MOHRE Job Offer Letter Typing - طباعة عرض عمل', 250.00, 50.36, 0, 1.00, 2),
(196, 108, 'MOHRE', 'MOHRE Labour Card Fee - رسوم إصدار بطاقة العمل', 3530.00, 3474.00, 0, 1.00, 3),
(197, 108, 'DUBINS', 'ILOE Unemployment Insurance - تأمين التعطل عن العمل', 140.00, 126.00, 0, 1.00, 4),
(198, 108, 'ICP', 'Entry Permit (Employment) - إذن دخول للعمل', 400.00, 356.20, 0, 1.00, 5),
(199, 108, 'ICP', 'Change of Status - تعديل الوضع داخل الدولة', 700.00, 660.29, 0, 1.00, 6),
(200, 108, 'MEDICAL', 'Medical Fitness Examination - فحص اللياقة الطبية', 300.00, 266.89, 0, 1.00, 7),
(201, 108, 'TAWJEEH', 'Tawjeeh Training & Contract Submission - تدريب توجيه وتسليم العقد', 150.00, 0.00, 0, 1.00, 8),
(202, 108, 'HEALTHINS', 'Health Insurance Basic Package - التأمين الصحي الأساسي', 400.00, 361.00, 0, 1.00, 9),
(203, 108, 'ICP', 'Emirates ID & Residence Visa Stamping - إصدار الهوية والإقامة', 830.00, 761.66, 0, 1.00, 10),
(204, 109, 'COURT', 'Power of Attorney Drafting & Notarization - صياغة وتوثيق الوكالة', 250.00, 100.00, 0, 1.00, 1),
(205, 113, 'MOHRE', 'MOHRE Contract Renewal Typing - طباعة تجديد عقد العمل', 70.00, 0.00, 0, 1.00, 1),
(206, 113, 'DUBINS', 'WPP Worker Protection Insurance - برنامج حماية العمال', 189.00, 189.00, 0, 1.00, 2),
(207, 113, 'MOHRE', 'MOHRE Labour Card Fee & Tawjeeh Class - رسوم تجديد بطاقة العمل وتوجيه', 3620.00, 3474.63, 0, 1.00, 3),
(208, 113, 'OTHER', 'ILOE Unemployment Insurance - تأمين التعطل عن العمل', 140.00, 126.00, 0, 1.00, 4),
(209, 113, 'MEDICAL', 'Medical Fitness Examination - فحص اللياقة الطبية', 300.00, 266.89, 0, 1.00, 5),
(210, 113, 'HEALTHINS', 'Health Insurance - التأمين الصحي', 450.00, 299.25, 0, 1.00, 6),
(211, 113, 'ICP', 'Renew Emirates ID & Residence Visa - تجديد الإقامة وبطاقة الهوية', 830.00, 761.00, 0, 1.00, 7),
(212, 115, 'DUBINS', 'WPP Worker Protection Insurance - برنامج حماية العمال', 189.00, 189.00, 0, 1.00, 1),
(213, 115, 'MOHRE', 'MOHRE Labour Card Approval Fee - رسوم الموافقة المبدئية لبطاقة العمل', 3530.00, 3474.00, 0, 1.00, 2),
(214, 115, 'ICP', 'Entry Permit (Work) - إذن دخول للعمل', 400.00, 356.20, 0, 1.00, 3),
(215, 115, 'ICP', 'Change of Status - تعديل الوضع داخل الدولة', 700.00, 660.29, 0, 1.00, 4),
(216, 115, 'TAWJEEH', 'Tawjeeh Training & Contract Submission - تدريب توجيه وتسليم العقد', 150.00, 0.00, 0, 1.00, 5),
(217, 115, 'DUBINS', 'ILOE Unemployment Insurance - تأمين التعطل عن العمل', 140.00, 126.00, 0, 1.00, 6),
(218, 114, 'MOHRE', 'Renew Labour Contract Typing - طباعة تجديد عقد العمل', 70.00, 0.00, 0, 1.00, 1),
(219, 114, 'MOHRE', 'Labour Card Fee & Tawjeeh (Cat 3) - رسوم بطاقة العمل وتوجيه (الفئة 3)', 3620.00, 3474.63, 0, 1.00, 2),
(220, 114, 'DUBINS', 'WPP Workers Insurance - برنامج حماية العمال', 189.00, 189.00, 0, 1.00, 3),
(221, 1, 'ICP', 'visa Cancellation - إلغاء الجوازات', 454.00, 250.00, 0, 1.00, 1),
(222, 1, 'MOHRE', 'Labour Card Cancellation - الغاء بطاقة عمل', 83.00, 83.00, 0, 1.00, 2),
(277, 118, 'OTHER', 'Arabic Official Letter Typing - طباعة رسالة رسمية باللغة العربية', 20.00, 0.00, 0, 1.00, 1),
(278, 118, 'OTHER', 'English Official Letter Typing - طباعة رسالة باللغة الإنجليزية', 20.00, 0.00, 0, 1.00, 2),
(279, 118, 'OTHER', 'Professional CV Typing - صياغة وسيرة ذاتية احترافية', 10.00, 0.00, 0, 1.00, 3),
(280, 118, 'MOHRE', 'Labour Card Cancellation (MOHRE) - إلغاء بطاقة عمل', 130.00, 0.00, 0, 1.00, 4),
(281, 118, 'TAWJEEH', 'Domestic Worker Residence Cancellation - إلغاء إقامة عمالة مساعدة', 225.00, 204.00, 0, 1.00, 5),
(282, 118, 'AAMER', 'Residence Visa Cancellation (GDRFA/ICP) - إلغاء الإقامة', 250.00, 204.00, 0, 1.00, 6),
(283, 118, 'Municipality/DED/Economy', 'Site Plan Renewal (Municipality) - تجديد خارطة ومخطط الموقع', 50.00, 0.00, 0, 1.00, 7),
(284, 118, 'MOI/POLICE/TRAFFIC', 'Mulkiya Vehicle Registration Renewal - تجديد ملكية مركبة', 0.00, 0.00, 0, 1.00, 8),
(285, 118, 'OTHER', 'Vehicle Sale & Purchase Agreement - عقد مبايعة مركبة', 20.00, 0.00, 0, 1.00, 9),
(286, 118, 'MOI/POLICE/TRAFFIC', 'Police Clearance Certificate (CID) - شهادة بحث الحالة الجنائية', 85.00, 50.00, 0, 1.00, 10),
(287, 118, 'MOI/POLICE/TRAFFIC', 'New Driving License Issuance - إصدار رخصة قيادة جديدة', 350.00, 318.00, 0, 1.00, 11),
(288, 118, 'MOI/POLICE/TRAFFIC', 'Driving School File Opening - فتح ملف مروري لتعليم القيادة', 350.00, 203.00, 0, 1.00, 12),
(289, 118, 'UTILIY BILL PAYMENT', 'FEWA / Utility New Connection Request - طلب توصيل كهرباء ومياه', 50.00, 0.00, 0, 1.00, 13),
(290, 118, 'OTHER', 'FEWA New Connection & Security Deposit - توصيل وتأمين مياه وكهرباء', 2050.00, 2000.00, 0, 1.00, 14),
(291, 118, 'OTHER', 'FEWA Ownership Change / Clearance - نقل ملكية / شهادة براءة ذمة كهرباء', 50.00, 0.00, 0, 1.00, 15),
(292, 118, 'OTHER', 'Property Ownership Certificate - إصدار شهادة إفادة أملاك', 75.00, 59.00, 0, 1.00, 16),
(293, 118, 'HEALTHINS', 'New Health Card (EHS/DHA) - إصدار بطاقة صحية جديدة', 65.00, 38.77, 0, 1.00, 17),
(294, 118, 'Municipality/DED/Economy', 'Renew Health Card - تجديد البطاقة الصحية', 65.00, 38.77, 0, 1.00, 18),
(295, 118, 'AAMER', 'E-Channel Subscription Renewal (ICP) - تجديد اشتراك نظام الجوازات تحالف', 1200.00, 1167.00, 0, 1.00, 19),
(296, 118, 'Municipality/DED/Economy', 'Commercial Promotion Campaign Permit - تصريح حملة ترويجية وإعلانية', 200.00, 0.00, 0, 1.00, 20),
(297, 118, 'OTHER', 'Mortgage Registration Request - طلب تسجيل رهن عقاري', 85.00, 58.88, 0, 1.00, 21),
(298, 118, 'ICP/ICA/GDRFA', 'ICP Mobile Number & Personal Info Update - تعديل البيانات الشخصية ورقم الهاتف', 250.00, 153.47, 0, 1.00, 22),
(299, 118, 'OTHER', 'Ejari Tenancy Registration / Add Unit - تسجيل إضافة وحدة إيجارية', 50.00, 28.67, 0, 1.00, 23),
(300, 118, 'COURT', 'Court Fee Payment (MOJ) - سداد رسوم المحاكم وكاتب العدل', 150.00, 100.00, 0, 1.00, 24),
(301, 118, 'UTILIY BILL PAYMENT', 'Telecom / Utility Bill Payment - سداد فاتورة اتصالات أو إنترنت', 500.00, 500.00, 0, 1.00, 25),
(302, 118, 'MOI/POLICE/TRAFFIC', 'Traffic Vehicle Fleet List - إصدار كشف مركبات الشركة', 140.00, 103.00, 0, 1.00, 26),
(303, 118, 'RTA', 'Transport Operating Card - إصدار / تجديد بطاقة تشغيل مركبة', 150.00, 100.00, 0, 1.00, 27),
(304, 116, 'MEDICAL', 'Medical Fitness Examination - فحص اللياقة الطبية', 300.00, 266.89, 0, 1.00, 1),
(305, 116, 'HEALTHINS', 'Health Insurance - التأمين الصحي', 450.00, 299.25, 0, 1.00, 2),
(306, 116, 'ICP/ICA/GDRFA', 'Emirates ID & Residence Visa Stamping - إصدار الهوية والإقامة', 830.00, 761.66, 0, 1.00, 3),
(308, 117, 'AAMER', 'ICP Emigration Absconding Report - بلاغ تعميم الهروب (الجوازات)', 500.00, 454.00, 0, 1.00, 1),
(309, 117, 'MOHRE', 'MOHRE Labour Absconding Report - بلاغ انقطاع عن العمل (وزارة العمل)', 70.00, 0.00, 0, 1.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `push_subscriptions`
--

CREATE TABLE `push_subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `tenant_id` varchar(50) NOT NULL DEFAULT 'GLOBAL',
  `endpoint` text NOT NULL,
  `public_key` varchar(255) NOT NULL,
  `auth_token` varchar(255) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pwd_portal_services`
--

CREATE TABLE `pwd_portal_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `name_ar` varchar(150) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `is_global` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pwd_portal_services`
--

INSERT INTO `pwd_portal_services` (`id`, `tenant_id`, `name`, `name_ar`, `url`, `is_global`, `created_at`) VALUES
(1, NULL, 'ICP Smart Services (Residency & Visas)', 'الهيئة الاتحادية للهوية والجنسية والجمارك وأمن المنافذ', 'https://smartservices.icp.gov.ae/', 0, '2026-08-09 22:22:54'),
(2, NULL, 'MOHRE Tasheel Portal (Labor & Work Permits)', 'وزارة الموارد البشرية والتوطين - تسهيل', 'https://www.mohre.gov.ae/', 0, '2026-08-09 22:22:54'),
(3, NULL, 'GDRFA Dubai / Amer Portal', 'الإدارة العامة للإقامة وشؤون الأجانب - دبي', 'https://smart.gdrfad.gov.ae/', 0, '2026-08-09 22:22:54'),
(4, NULL, 'E-Channel Services (Federal Visa Portal)', 'نظام القناة الإلكترونية للخدمات الجوازات', 'https://echannel.echannelservices.com/', 0, '2026-08-09 22:22:54'),
(5, NULL, 'MOI UAE (Ministry of Interior Services)', 'وزارة الداخلية - الإمارات', 'https://moi.gov.ae/', 0, '2026-08-09 22:22:54'),
(6, NULL, 'MOJ UAE (Ministry of Justice & Legal Attestation)', 'وزارة العدل', 'https://www.moj.gov.ae/', 0, '2026-08-09 22:22:54'),
(7, NULL, 'EmaraTax / FTA Tax Portal', 'الهيئة الاتحادية للضرائب - إمارات كاس', 'https://eservices.tax.gov.ae/', 0, '2026-08-09 22:22:54'),
(8, NULL, 'DED / DET Invest in Dubai Portal', 'دائرة الاقتصاد والسياحة دبي', 'https://invest.dubai.ae/', 0, '2026-08-09 22:22:54'),
(9, NULL, 'TAMM Abu Dhabi E-Services', 'منصة تم - خدمات أبوظبي الحكومية', 'https://www.tamm.abudhabi/', 0, '2026-08-09 22:22:54'),
(10, NULL, 'RTA Dubai Business Services', 'هيئة الطرق والمواصلات - دبي', 'https://www.rta.ae/', 0, '2026-08-09 22:22:54'),
(11, NULL, 'SEDD Sharjah Economic Development', 'دائرة التنمية الاقتصادية - الشارقة', 'https://sedd.ae/', 0, '2026-08-09 22:22:54'),
(12, NULL, 'Ajman DED Commercial Services', 'دائرة التنمية الاقتصادية - عجمان', 'https://ajmanded.ae/', 0, '2026-08-09 22:22:54'),
(13, 'DEM-0CD4', 'AHMED', 'nananan', 'http://.alkdjkdjfkdj.com', 0, '2026-08-26 11:44:01'),
(14, 'GLOBAL', 'MOJ', NULL, 'https://app.typinghub.ae/', 0, '2026-08-27 17:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `pwd_vault_credentials`
--

CREATE TABLE `pwd_vault_credentials` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `customer_id` varchar(50) NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(150) NOT NULL,
  `password_encrypted` text NOT NULL,
  `password_plain` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT 'ADMIN',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `branch_id` varchar(50) DEFAULT 'MAIN',
  `quotation_no` varchar(50) NOT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `client_name` varchar(150) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `customer_phone` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `gov_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `typing_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `vat_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `valid_until` date DEFAULT NULL,
  `staff_id` varchar(50) DEFAULT 'ADMIN',
  `status` enum('DRAFT','SENT','ACCEPTED','REJECTED','CONVERTED') NOT NULL DEFAULT 'SENT',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_items`
--

CREATE TABLE `quotation_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `quotation_id` int(10) UNSIGNED NOT NULL,
  `sl_no` int(11) NOT NULL DEFAULT 1,
  `service_code` varchar(50) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT 1.00,
  `unit_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `gov_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `typing_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `vat_rate` decimal(5,2) NOT NULL DEFAULT 5.00,
  `vat_applicable` tinyint(1) NOT NULL DEFAULT 1,
  `vat_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `line_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rate_limits`
--

CREATE TABLE `rate_limits` (
  `rate_key` varchar(64) NOT NULL,
  `action_name` varchar(50) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `attempts` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saas_audit_logs`
--

CREATE TABLE `saas_audit_logs` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(50) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `performed_by` varchar(100) NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saas_audit_logs`
--

INSERT INTO `saas_audit_logs` (`id`, `tenant_id`, `action`, `performed_by`, `details`, `created_at`) VALUES
(1, 'GLOBAL', 'STAFF_REGISTERED', 'admin (SUPER_ADMIN)', 'Created staff account: jabbar (@jabbar, Role: TYPIST)', '2026-08-24 13:11:13'),
(2, 'GLOBAL', 'STAFF_REGISTERED', 'admin (SUPER_ADMIN)', 'Created staff account: moosi (@moosi, Role: TYPIST)', '2026-08-24 13:24:16'),
(3, 'DEM-0CD4', 'REGISTER_TENANT', 'admin', 'Registered Head Office Center: Demo Typing Center', '2026-08-24 13:36:19'),
(4, 'DEM-0CD4', 'PERMISSIONS_RESET', 'Demo User (TENANT_ADMIN)', 'Reset custom permissions for @demo to base role defaults', '2026-08-25 15:03:51'),
(5, 'DEM-0CD4', 'REGISTER_BRANCH', 'admin', 'Added branch \'Fujairah Branch\' under Head Office DEM-0CD4', '2026-08-25 19:05:33'),
(6, 'DEM-0CD4', 'STAFF_REGISTERED', 'Demo User (TENANT_ADMIN)', 'Created staff account: Demo user (@demouser, Role: TYPIST)', '2026-08-25 19:22:01'),
(7, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_manage_presets\' by @demouser', '2026-08-25 19:39:37'),
(8, 'DEM-0CD4', 'APPROVE_UPGRADE', 'admin', 'Approved plan upgrade payment ID: PAY-08C236', '2026-08-26 07:30:43'),
(9, 'DEM-0CD4', 'APPROVE_UPGRADE', 'admin', 'Approved plan upgrade payment ID: PAY-08C236', '2026-08-26 07:30:50'),
(10, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_edit_invoice\' by @demouser', '2026-08-26 07:55:20'),
(11, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_edit_invoice\' by @demouser', '2026-08-26 07:55:21'),
(12, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_manage_presets\' by @demouser', '2026-08-26 07:55:47'),
(13, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_manage_presets\' by @demouser', '2026-08-26 07:55:56'),
(14, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_expenses\' by @demouser', '2026-08-26 07:56:20'),
(15, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_expenses\' by @demouser', '2026-08-26 07:56:20'),
(16, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 07:56:25'),
(17, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 07:56:25'),
(18, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 07:56:26'),
(19, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_expenses\' by @demouser', '2026-08-26 07:56:27'),
(20, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_expenses\' by @demouser', '2026-08-26 07:56:27'),
(21, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 07:56:30'),
(22, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_passwords\' by @demouser', '2026-08-26 08:06:22'),
(23, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_passwords\' by @demouser', '2026-08-26 08:06:22'),
(24, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:06:24'),
(25, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_passwords\' by @demouser', '2026-08-26 08:06:24'),
(26, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:06:25'),
(27, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:06:25'),
(28, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:06:25'),
(29, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_passwords\' by @demouser', '2026-08-26 08:06:26'),
(30, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_passwords\' by @demouser', '2026-08-26 08:06:27'),
(31, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:06:28'),
(32, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:06:30'),
(33, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:06:49'),
(34, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:07:02'),
(35, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:11:02'),
(36, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_expenses\' by @demouser', '2026-08-26 08:11:18'),
(37, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_passwords\' by @demouser', '2026-08-26 08:11:20'),
(38, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:11:20'),
(39, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_expenses\' by @demouser', '2026-08-26 08:11:37'),
(40, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_expenses\' by @demouser', '2026-08-26 08:11:37'),
(41, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:26:45'),
(42, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:26:46'),
(43, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:26:46'),
(44, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_passwords\' by @demouser', '2026-08-26 08:26:46'),
(45, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:26:56'),
(46, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:26:57'),
(47, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:26:58'),
(48, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:27:00'),
(49, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:27:00'),
(50, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:27:01'),
(51, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:27:05'),
(52, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:27:05'),
(53, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:27:05'),
(54, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:27:07'),
(55, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:27:08'),
(56, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:27:11'),
(57, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:27:11'),
(58, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_quotes\' by @demouser', '2026-08-26 08:27:11'),
(59, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:32:32'),
(60, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:32:32'),
(61, 'DEM-0CD4', 'SECURITY_VIOLATION', 'Demo user (TYPIST)', 'Blocked unauthorized attempt for action \'can_view_accounts\' by @demouser', '2026-08-26 08:34:17'),
(62, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_create_invoice\' to DISABLED for Staff @demouser', '2026-08-26 08:43:07'),
(63, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_create_invoice\' to ENABLED for Staff @demouser', '2026-08-26 08:43:30'),
(64, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_edit_invoice\' to ENABLED for Staff @demouser', '2026-08-26 08:43:37'),
(65, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_delete_invoice\' to ENABLED for Staff @demouser', '2026-08-26 08:43:37'),
(66, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_give_discount\' to ENABLED for Staff @demouser', '2026-08-26 08:43:38'),
(67, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_reassign_staff\' to ENABLED for Staff @demouser', '2026-08-26 08:43:39'),
(68, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_edit_customer\' to ENABLED for Staff @demouser', '2026-08-26 08:43:40'),
(69, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_delete_customer\' to ENABLED for Staff @demouser', '2026-08-26 08:43:41'),
(70, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_delete_quotation\' to ENABLED for Staff @demouser', '2026-08-26 08:43:42'),
(71, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_view_accounts\' to ENABLED for Staff @demouser', '2026-08-26 08:43:42'),
(72, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_manage_accounts\' to ENABLED for Staff @demouser', '2026-08-26 08:43:43'),
(73, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_view_expenses\' to ENABLED for Staff @demouser', '2026-08-26 08:43:44'),
(74, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_manage_expenses\' to ENABLED for Staff @demouser', '2026-08-26 08:43:45'),
(75, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_view_reports\' to ENABLED for Staff @demouser', '2026-08-26 08:43:45'),
(76, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_manage_settings\' to ENABLED for Staff @demouser', '2026-08-26 08:43:51'),
(77, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_manage_payroll\' to ENABLED for Staff @demouser', '2026-08-26 08:43:51'),
(78, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_manage_attendance\' to ENABLED for Staff @demouser', '2026-08-26 08:43:52'),
(79, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_manage_gov_directory\' to ENABLED for Staff @demouser', '2026-08-26 08:43:53'),
(80, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_manage_presets\' to ENABLED for Staff @demouser', '2026-08-26 08:43:53'),
(81, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_manage_password_vault\' to ENABLED for Staff @demouser', '2026-08-26 08:43:54'),
(82, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_access_password_vault\' to ENABLED for Staff @demouser', '2026-08-26 08:43:55'),
(83, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_update_worksheet\' to DISABLED for Staff @demouser', '2026-08-26 09:18:23'),
(84, 'DEM-0CD4', 'PERMISSION_UPDATED', 'Demo User (TENANT_ADMIN)', 'Updated permission \'can_update_worksheet\' to ENABLED for Staff @demouser', '2026-08-26 09:18:29'),
(85, 'DEM-0CD4', 'SALARY_ADVANCE_ISSUED', 'Demo User (TENANT_ADMIN)', 'Issued advance of AED 500 for User ID: USR-29F952 (Month: 2026-08)', '2026-08-26 09:23:26'),
(86, 'DEM-0CD4', 'PAYROLL_GENERATED', 'Demo User (TENANT_ADMIN)', 'Calculated monthly payroll register for Month: 2026-08', '2026-08-26 09:23:40'),
(87, 'DEM-0CD4', 'PAYROLL_DISBURSED', 'Demo User (TENANT_ADMIN)', 'Disbursed and marked PAID for Payroll ID: 2', '2026-08-26 09:23:55'),
(88, 'DEM-0CD4', 'TOGGLE_TENANT_STATUS', 'admin', 'Toggled tenant subscription status', '2026-08-27 07:34:28'),
(89, 'DEM-0CD4', 'TOGGLE_TENANT_STATUS', 'admin', 'Toggled tenant subscription status', '2026-08-27 11:19:48'),
(90, 'DEM-0CD4', 'TOGGLE_TENANT_STATUS', 'admin', 'Toggled tenant subscription status', '2026-08-27 11:19:50'),
(91, 'DEM-0CD4', 'TOGGLE_TENANT_STATUS', 'admin', 'Toggled tenant subscription status', '2026-08-27 11:21:00'),
(92, 'DEM-0CD4', 'TOGGLE_TENANT_STATUS', 'admin', 'Toggled tenant subscription status', '2026-08-27 11:21:01'),
(93, 'DEM-0CD4', 'TOGGLE_TENANT_STATUS', 'admin', 'Toggled tenant subscription status', '2026-08-27 11:21:17'),
(94, 'DEM-0CD4', 'TOGGLE_TENANT_STATUS', 'admin', 'Toggled tenant subscription status', '2026-08-27 11:21:18'),
(95, 'DEM-0CD4', 'TOGGLE_TENANT_STATUS', 'admin', 'Toggled tenant subscription status', '2026-08-27 11:55:25'),
(96, 'GLOBAL', 'STAFF_UPDATED', 'admin (SUPER_ADMIN)', 'Updated profile for Staff ID: USR-7E5A99', '2026-08-27 15:18:57'),
(97, 'GLOBAL', 'STAFF_DELETE_REQUESTED', 'admin (SUPER_ADMIN)', 'Tenant Admin requested deletion for staff: moosi (@moosi). Pending SuperAdmin Approval.', '2026-08-27 15:19:03'),
(98, 'GLOBAL', 'PASSWORD_RESET', 'admin (SUPER_ADMIN)', 'Reset password for Staff User ID: USR-78E38D', '2026-08-27 15:19:30'),
(99, 'GLOBAL', 'SUPERADMIN_STAFF_PURGED', 'admin', 'SuperAdmin directly purged Staff User ID: USR-6634E8', '2026-08-27 15:57:35'),
(100, 'GLOBAL', 'STAFF_RESTORED', 'admin', 'SuperAdmin rejected deletion for staff \'moosi\' (@moosi). Account restored to Active.', '2026-08-27 15:57:52'),
(101, 'GLOBAL', 'SUPERADMIN_STAFF_EDIT', 'admin', 'SuperAdmin updated staff ID: USR-7E5A99 (moosi)', '2026-08-27 15:58:01'),
(102, 'DEM-0CD4', 'DELETE_BRANCH', 'admin', 'Deleted branch ID: BR-9811D5', '2026-08-27 17:10:51'),
(103, 'PRI-0B92', 'REGISTER_TENANT', 'SuperAdmin', 'Registered Head Office Center: prince', '2026-08-29 12:47:46'),
(104, 'AYY-D17B', 'REGISTER_TENANT', 'SuperAdmin', 'Registered Head Office Center: AYYOOB KALIPPADATH', '2026-08-29 13:09:56'),
(105, 'GLOBAL', 'TENANT_PURGED_PERMANENTLY', 'admin', 'SuperAdmin permanently purged customer tenant: AYYOOB KALIPPADATH [IDs: AYY-D17B]', '2026-08-31 11:04:45'),
(106, 'GLOBAL', 'TENANT_PURGED_PERMANENTLY', 'admin', 'SuperAdmin permanently purged customer tenant: prince [IDs: PRI-0B92]', '2026-08-31 11:05:14'),
(107, 'GLOBAL', 'PAYROLL_GENERATED', 'admin (SUPER_ADMIN)', 'Calculated monthly payroll register for Month: 2026-09', '2026-09-02 04:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `saas_payments`
--

CREATE TABLE `saas_payments` (
  `id` varchar(50) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `plan_id` varchar(50) NOT NULL,
  `invoice_no` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `billing_cycle` enum('MONTHLY','YEARLY','CUSTOM') DEFAULT 'YEARLY',
  `billing_months` int(11) DEFAULT 12,
  `payment_method` varchar(50) DEFAULT 'Bank Transfer',
  `payment_status` enum('PAID','PENDING','FAILED') DEFAULT 'PAID',
  `start_date` date NOT NULL,
  `expires_at` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `receipt_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saas_payments`
--

INSERT INTO `saas_payments` (`id`, `tenant_id`, `plan_id`, `invoice_no`, `amount`, `billing_cycle`, `billing_months`, `payment_method`, `payment_status`, `start_date`, `expires_at`, `notes`, `created_at`, `receipt_file`) VALUES
('PAY-08C236', 'DEM-0CD4', 'PLAN-PRO', 'INV-UPG-31884', 29.00, 'MONTHLY', 1, 'Bank Transfer', 'PAID', '2026-08-25', '2026-09-25', NULL, '2026-08-25 19:10:33', 'uploads/receipts/receipt_DEM-0CD4_1787685074_91fb90.jpg'),
('PAY-0F86A4', 'DEM-0CD4', 'PLAN-FREE', 'INV-SAAS-6076', 2990.00, 'YEARLY', 12, 'Bank Transfer', 'PAID', '2026-08-24', '2027-08-24', NULL, '2026-08-24 13:36:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `saas_plans`
--

CREATE TABLE `saas_plans` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price_monthly` decimal(10,2) NOT NULL DEFAULT 0.00,
  `price_yearly` decimal(10,2) NOT NULL DEFAULT 0.00,
  `max_branches` int(11) NOT NULL DEFAULT 1,
  `max_users` int(11) NOT NULL DEFAULT 5,
  `features` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saas_plans`
--

INSERT INTO `saas_plans` (`id`, `name`, `price_monthly`, `price_yearly`, `max_branches`, `max_users`, `features`, `status`, `created_at`) VALUES
('PLAN-ENTERPRISE', 'Multi-Branch Hub', 59.00, 708.00, 9, 50, 'Multi-Branch Enterprise Edition; Centralized HQ Dashboard across all UAE locations; Dedicated Accountant & Auditor Roles; Quarterly FTA Tax Export Reports; Dedicated Account Manager & VIP SLA Support.', 'ACTIVE', '2026-08-19 09:40:44'),
('PLAN-FREE', 'Starter Freemium', 0.00, 0.00, 1, 1, 'Solo Freelancer Edition; Basic Gov E-Services; A4 & POS Thermal VAT Invoices; Daily Cash Register & Basic Reports; Free Forever.', 'ACTIVE', '2026-08-19 09:40:44'),
('PLAN-PRO', 'Growth Typing Center', 29.00, 348.00, 1, 9, 'Small Office Team Edition; Unrestricted Encrypted Portal Passwords; WhatsApp Instant Client Notices; Real-Time GDRFA & MOHRE Wallet Tracker; Automated Typist Commission & Target Reports.', 'ACTIVE', '2026-08-19 09:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `service_entities`
--

CREATE TABLE `service_entities` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenant_id` varchar(50) NOT NULL DEFAULT 'GLOBAL',
  `name` varchar(100) NOT NULL COMMENT 'e.g. ICP, MOHRE, Dubai Courts, RTA',
  `code` varchar(50) DEFAULT NULL,
  `is_global` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_entities`
--

INSERT INTO `service_entities` (`id`, `tenant_id`, `name`, `code`, `is_global`, `sort_order`, `status`, `created_at`) VALUES
(1, 'GLOBAL', 'ICP/ICA/GDRFA', 'ICP/ICA/GDRFA', 1, 1, 'ACTIVE', '2026-09-01 23:56:11'),
(2, 'GLOBAL', 'MOHRE', 'MOHRE', 1, 2, 'ACTIVE', '2026-09-01 23:56:11'),
(4, 'GLOBAL', 'TASHEEL', 'TASHEEL', 1, 4, 'ACTIVE', '2026-09-01 23:56:11'),
(5, 'GLOBAL', 'Municipality/DED/Economy', 'Municipality/DED/Economy', 1, 5, 'ACTIVE', '2026-09-01 23:56:11'),
(6, 'GLOBAL', 'Medical Fitness', 'MEDICAL', 1, 6, 'ACTIVE', '2026-09-01 23:56:11'),
(9, 'GLOBAL', 'RTA Transport', 'RTA', 1, 9, 'ACTIVE', '2026-09-01 23:56:11'),
(10, 'GLOBAL', 'Other Entity', 'OTHER', 1, 10, 'ACTIVE', '2026-09-01 23:56:11'),
(11, 'GLOBAL', 'FUJ MUN', 'FUJMUN', 0, 0, 'ACTIVE', '2026-09-02 11:42:52'),
(12, 'GLOBAL', 'DUBAI INSURANCE', 'DUBINS', 0, 0, 'ACTIVE', '2026-09-03 11:08:55'),
(13, 'GLOBAL', 'HEALTH INSURANCE', 'HEALTHINS', 0, 0, 'ACTIVE', '2026-09-03 11:10:18'),
(14, 'GLOBAL', 'TAWJEEH', 'TAWJEEH', 0, 0, 'ACTIVE', '2026-09-03 11:17:29'),
(15, 'GLOBAL', 'COURT/MOJ', 'COURT', 0, 0, 'ACTIVE', '2026-09-03 11:19:35'),
(16, 'GLOBAL', 'TRANSPORT/RTA', 'TRANSPORT/RTA', 0, 0, 'ACTIVE', '2026-09-03 11:23:31'),
(17, 'GLOBAL', 'MOI/POLICE/TRAFFIC', 'MOI/POLICE/TRAFFIC', 0, 0, 'ACTIVE', '2026-09-03 11:24:42'),
(18, 'GLOBAL', 'AAMER', 'AAMER', 0, 0, 'ACTIVE', '2026-09-03 11:28:51'),
(19, 'GLOBAL', 'UTILIY BILL PAYMENT', 'UTILIY BILL PAYMENT', 0, 0, 'ACTIVE', '2026-09-03 11:31:28');

-- --------------------------------------------------------

--
-- Table structure for table `staff_advances`
--

CREATE TABLE `staff_advances` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(64) NOT NULL,
  `branch_id` varchar(64) NOT NULL DEFAULT 'MAIN',
  `user_id` varchar(64) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `request_date` date NOT NULL,
  `deduction_month` varchar(7) NOT NULL,
  `status` enum('PENDING','APPROVED','DEDUCTED','REJECTED') NOT NULL DEFAULT 'APPROVED',
  `payment_mode` varchar(32) NOT NULL DEFAULT 'Cash',
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff_advances`
--

INSERT INTO `staff_advances` (`id`, `tenant_id`, `branch_id`, `user_id`, `amount`, `request_date`, `deduction_month`, `status`, `payment_mode`, `reason`, `created_at`) VALUES
(2, 'DEM-0CD4', 'MAIN', 'USR-29F952', 500.00, '2026-08-26', '2026-08', 'APPROVED', 'Cash', '', '2026-08-26 09:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(64) NOT NULL,
  `branch_id` varchar(64) NOT NULL DEFAULT 'MAIN',
  `user_id` varchar(64) NOT NULL,
  `attendance_date` date NOT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `status` enum('PRESENT','LATE','HALF_DAY','ABSENT','ON_LEAVE','HOLIDAY') NOT NULL DEFAULT 'PRESENT',
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_deletion_requests`
--

CREATE TABLE `staff_deletion_requests` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `staff_username` varchar(100) NOT NULL,
  `staff_full_name` varchar(150) NOT NULL,
  `staff_role` varchar(50) NOT NULL DEFAULT 'TYPIST',
  `requested_by_id` varchar(50) NOT NULL,
  `requested_by_name` varchar(150) NOT NULL,
  `reason` varchar(255) DEFAULT 'Staff account deletion requested by Tenant Admin',
  `status` enum('PENDING_APPROVAL','APPROVED_DELETED','REJECTED_RESTORED') NOT NULL DEFAULT 'PENDING_APPROVAL',
  `reviewed_by` varchar(100) DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff_deletion_requests`
--

INSERT INTO `staff_deletion_requests` (`id`, `user_id`, `tenant_id`, `staff_username`, `staff_full_name`, `staff_role`, `requested_by_id`, `requested_by_name`, `reason`, `status`, `reviewed_by`, `reviewed_at`, `created_at`) VALUES
(1, 'USR-7E5A99', 'GLOBAL', 'moosi', 'moosi', 'TYPIST', 'USR-001', 'admin', 'Tenant Admin requested deletion', 'REJECTED_RESTORED', 'admin', '2026-08-27 19:57:52', '2026-08-27 15:19:03');

-- --------------------------------------------------------

--
-- Table structure for table `staff_payroll`
--

CREATE TABLE `staff_payroll` (
  `id` int(11) NOT NULL,
  `tenant_id` varchar(64) NOT NULL,
  `branch_id` varchar(64) NOT NULL DEFAULT 'MAIN',
  `user_id` varchar(64) NOT NULL,
  `payroll_month` varchar(7) NOT NULL,
  `basic_salary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `allowances` decimal(10,2) NOT NULL DEFAULT 0.00,
  `commission_earned` decimal(10,2) NOT NULL DEFAULT 0.00,
  `advances_deducted` decimal(10,2) NOT NULL DEFAULT 0.00,
  `penalties_deducted` decimal(10,2) NOT NULL DEFAULT 0.00,
  `net_payable` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_status` enum('DRAFT','PROCESSED','PAID') NOT NULL DEFAULT 'DRAFT',
  `payment_date` date DEFAULT NULL,
  `payment_mode` varchar(32) NOT NULL DEFAULT 'Transfer',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff_payroll`
--

INSERT INTO `staff_payroll` (`id`, `tenant_id`, `branch_id`, `user_id`, `payroll_month`, `basic_salary`, `allowances`, `commission_earned`, `advances_deducted`, `penalties_deducted`, `net_payable`, `payment_status`, `payment_date`, `payment_mode`, `notes`, `created_at`) VALUES
(2, 'DEM-0CD4', 'MAIN', 'USR-29F952', '2026-08', 2500.00, 500.00, 0.00, 500.00, 0.00, 2500.00, 'PAID', '2026-08-26', 'Transfer', NULL, '2026-08-26 09:23:40'),
(3, 'DEM-0CD4', 'MAIN', 'USR-6634E8', '2026-08', 2500.00, 500.00, 139.35, 0.00, 0.00, 3139.35, 'DRAFT', NULL, 'Transfer', NULL, '2026-08-26 09:23:40'),
(4, 'DEM-0CD4', 'MAIN', 'USR-29F952', '2026-09', 2500.00, 500.00, 26.81, 0.00, 0.00, 3026.81, 'DRAFT', NULL, 'Transfer', NULL, '2026-09-02 04:54:50'),
(5, 'GLOBAL', 'MAIN', 'USR-7E5A99', '2026-09', 2500.00, 500.00, 0.00, 0.00, 0.00, 3000.00, 'DRAFT', NULL, 'Transfer', NULL, '2026-09-02 04:54:50'),
(6, 'GLOBAL', 'MAIN', 'USR-78E38D', '2026-09', 2500.00, 500.00, 0.00, 0.00, 0.00, 3000.00, 'DRAFT', NULL, 'Transfer', NULL, '2026-09-02 04:54:50'),
(7, 'GLOBAL', 'MAIN', 'USR-001', '2026-09', 2500.00, 500.00, 0.00, 0.00, 0.00, 3000.00, 'DRAFT', NULL, 'Transfer', NULL, '2026-09-02 04:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` varchar(50) NOT NULL,
  `parent_tenant_id` varchar(50) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `name_ar` varchar(150) DEFAULT NULL,
  `trn_no` varchar(50) DEFAULT NULL,
  `vat_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `trade_license_no` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_ar` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `plan_name` varchar(50) NOT NULL DEFAULT 'Enterprise Pro',
  `subscription_status` varchar(20) NOT NULL DEFAULT 'ACTIVE',
  `can_fulfill_healthins` tinyint(1) NOT NULL DEFAULT 0,
  `subscription_expires_at` date DEFAULT NULL,
  `max_branches` int(11) NOT NULL DEFAULT 5,
  `max_users` int(11) NOT NULL DEFAULT 10,
  `status` enum('ACTIVE','SUSPENDED','INACTIVE') DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `plan_id` varchar(50) DEFAULT 'PLAN-PRO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `parent_tenant_id`, `name`, `name_ar`, `trn_no`, `vat_enabled`, `trade_license_no`, `phone`, `mobile`, `website`, `email`, `location`, `address`, `address_ar`, `logo_url`, `plan_name`, `subscription_status`, `can_fulfill_healthins`, `subscription_expires_at`, `max_branches`, `max_users`, `status`, `created_at`, `plan_id`) VALUES
('DEM-0CD4', NULL, 'Demo Typing Center', '', '10000012456', 0, NULL, '092225220', '050123456', NULL, NULL, 'Dubai, UAE', NULL, NULL, 'uploads/logos/logo_DEM-0CD4_1787725693.jpg', 'Growth Typing Center', 'ACTIVE', 0, '2026-09-25', 1, 9, 'ACTIVE', '2026-08-24 13:36:19', 'PLAN-PRO'),
('GLOBAL', NULL, 'TypingHub SaaS Headquarters', '', '100492019300003', 0, NULL, '+97140000000', '+971500000000', NULL, NULL, 'Dubai, UAE', NULL, NULL, 'uploads/logos/logo_GLOBAL_1788188364.svg', 'Enterprise Pro', 'ACTIVE', 1, '2027-08-06', 3, 3, 'ACTIVE', '2026-08-08 17:12:08', 'PLAN-PRO');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(50) NOT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `branch_id` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `theme` varchar(50) NOT NULL DEFAULT 'light:gold',
  `role` enum('SUPER_ADMIN','TENANT_ADMIN','TYPIST','ACCOUNTANT') DEFAULT 'TYPIST',
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `status` enum('ACTIVE','INACTIVE','PENDING_DELETE') NOT NULL DEFAULT 'ACTIVE',
  `deleted_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `lang` varchar(10) DEFAULT 'EN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `tenant_id`, `branch_id`, `username`, `email`, `phone`, `password_hash`, `full_name`, `profile_pic`, `theme`, `role`, `permissions`, `status`, `deleted_at`, `last_login_at`, `created_at`, `lang`) VALUES
('USR-001', 'GLOBAL', 'BR-GLOBAL', 'admin', NULL, '', '$2y$10$FA7u7lAEMbM00xzH7iCVuuN74SKdkdj9bVPOJ3/wrmFrA2QFKLuqm', 'AYYOOB KP', 'uploads/avatars/avatar_USR-001_1787601556.jpg', 'light:gold', 'SUPER_ADMIN', NULL, 'ACTIVE', NULL, '2026-09-07 09:08:27', '2026-08-08 17:12:08', 'EN'),
('USR-29F952', 'DEM-0CD4', 'DEM-0CD4', 'demo', NULL, '0582689099', '$2y$10$TDhfje6XjjCMWhjMEGEW7.NN6sg4wCyue5mFvY7QbYBL./8XTRbhC', 'Demo User', 'uploads/avatars/avatar_USR-29F952_1787685444.jpg', 'light:gold', 'TENANT_ADMIN', NULL, 'ACTIVE', NULL, '2026-08-26 18:48:26', '2026-08-24 13:36:19', 'EN'),
('USR-78E38D', 'GLOBAL', 'GLOBAL', 'jabbar', NULL, NULL, '$2y$10$yzHoQv1UM3fsqDhWZS3qFODs1nzXhuIU.DIKbDqBeujT5SY8gHayK', 'jabbar', NULL, 'dark:gold', 'TYPIST', NULL, 'ACTIVE', NULL, '2026-08-24 17:11:43', '2026-08-24 13:11:13', 'EN'),
('USR-7E5A99', 'GLOBAL', 'GLOBAL', 'moosi', '', '', '$2y$10$wscw7EIGDPIWujWN3fQXAeSwjPw5k7SIwzqPYI996PlhJYjP5HUjO', 'moosi', NULL, 'light:gold', 'TYPIST', NULL, 'ACTIVE', NULL, '2026-08-24 17:25:21', '2026-08-24 13:24:16', 'EN');

-- --------------------------------------------------------

--
-- Table structure for table `user_biometrics`
--

CREATE TABLE `user_biometrics` (
  `id` int(11) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `credential_id` varchar(255) NOT NULL,
  `public_key` text NOT NULL,
  `device_name` varchar(100) DEFAULT 'Apple / Biometric Device',
  `counter` int(10) UNSIGNED DEFAULT 0,
  `transports` varchar(255) DEFAULT 'internal',
  `created_at` datetime DEFAULT current_timestamp(),
  `last_used_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_biometrics`
--

INSERT INTO `user_biometrics` (`id`, `user_id`, `credential_id`, `public_key`, `device_name`, `counter`, `transports`, `created_at`, `last_used_at`) VALUES
(2, 'USR-001', 'ynfIx1ukCWjGYLBYl3y7PVyFtig', 'o2NmbXRkbm9uZWdhdHRTdG10oGhhdXRoRGF0YViYkE0Waqcgf87pDiUpFHeP8G-5uycW_f102uQoq6XVVutdAAAAAPv8MAcVTk7MjAtuAgVX170AFMp3yMdbpAloxmCwWJd8uz1chbYopQECAyYgASFYIGdg8UFb3esyXABJf6BB0TOcXNshnMF7f4Eq_9JExAyiIlggBCbk-MG3pBPVQFZKLmOj02ysrhN7RaBrqcImpjW1F1U', 'Apple Device', 0, 'internal', '2026-08-25 22:56:18', NULL),
(3, 'USR-001', 'sMSX8lTfg1XVfONEfMSO-ivJFj8', 'o2NmbXRkbm9uZWdhdHRTdG10oGhhdXRoRGF0YViYkE0Waqcgf87pDiUpFHeP8G-5uycW_f102uQoq6XVVutdAAAAAPv8MAcVTk7MjAtuAgVX170AFLDEl_JU34NV1XzjRHzEjvoryRY_pQECAyYgASFYIOZqOiUGzyrrqRkTfz5_GS-X_n_fiNtIYIYy8ZaJ5xg5IlggMb2Uo6XYvPua5q1EFuIf1dFUvtVlZ4JhFfQp6vf-6QQ', 'Apple Device', 1, 'internal', '2026-08-25 22:57:01', '2026-08-27 11:13:08'),
(4, 'USR-29F952', 'VmOc08YmOXhVtkOiKE0rbQBAudc', 'o2NmbXRkbm9uZWdhdHRTdG10oGhhdXRoRGF0YViYkE0Waqcgf87pDiUpFHeP8G-5uycW_f102uQoq6XVVutdAAAAAPv8MAcVTk7MjAtuAgVX170AFFZjnNPGJjl4VbZDoihNK20AQLnXpQECAyYgASFYIBRwx8cibQyHizNNQW5eAxf0KgLY4suh1NIgkszfcNGgIlggW7jl8wTH2XSyhMFBIaCsmyQuOelIAYJsylxj4reBV90', 'Apple Device', 2, 'internal', '2026-08-25 22:58:18', '2026-08-25 23:42:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_id` varchar(50) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `name_ar` varchar(191) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `staff_code` varchar(50) DEFAULT NULL,
  `emirates_id` varchar(30) DEFAULT NULL,
  `monthly_target` decimal(12,2) DEFAULT 10000.00,
  `notes` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `full_name`, `name_ar`, `phone`, `email`, `staff_code`, `emirates_id`, `monthly_target`, `notes`, `created_at`, `updated_at`) VALUES
('USR-001', 'admin', '', '', '', 'admin', '', 10000.00, NULL, '2026-08-18 22:54:06', '2026-08-24 23:59:16'),
('USR-29F952', 'Demo User', '', '0582689099', '', 'demo', '', 15000.00, NULL, '2026-08-24 17:36:19', '2026-08-25 23:17:24'),
('USR-78E38D', 'jabbar', NULL, NULL, NULL, 'jabbar', NULL, 15000.00, NULL, '2026-08-24 17:11:13', '2026-08-24 17:11:13'),
('USR-7E5A99', 'moosi', '', '', '', 'moosi', '', 15000.00, NULL, '2026-08-24 17:24:16', '2026-08-27 19:58:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_remember_tokens`
--

CREATE TABLE `user_remember_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `selector` varchar(32) NOT NULL,
  `validator_hash` varchar(64) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmark_categories`
--
ALTER TABLE `bookmark_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `idx_tenant` (`tenant_id`),
  ADD KEY `idx_type` (`type`);

--
-- Indexes for table `bookmark_clicks`
--
ALTER TABLE `bookmark_clicks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bookmark` (`bookmark_id`);

--
-- Indexes for table `bookmark_items`
--
ALTER TABLE `bookmark_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tenant` (`tenant_id`),
  ADD KEY `idx_category` (`category_code`),
  ADD KEY `idx_auth` (`auth_type`),
  ADD KEY `idx_pinned` (`is_pinned`),
  ADD KEY `idx_clicks` (`clicks_count`);

--
-- Indexes for table `cheques`
--
ALTER TABLE `cheques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tenant_type` (`tenant_id`,`cheque_type`),
  ADD KEY `idx_status_due` (`status`,`due_date`),
  ADD KEY `idx_cheque_no` (`cheque_no`),
  ADD KEY `idx_customer` (`customer_id`),
  ADD KEY `idx_chq_tenant_due` (`tenant_id`,`due_date`),
  ADD KEY `idx_chq_tenant_status` (`tenant_id`,`status`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cust_tenant_phone` (`tenant_id`,`phone`),
  ADD KEY `idx_cust_tenant_name` (`tenant_id`,`name`),
  ADD KEY `idx_cust_tenant_created` (`tenant_id`,`created_at`),
  ADD KEY `idx_cust_tenant_type` (`tenant_id`,`type`),
  ADD KEY `idx_cust_phone` (`phone`),
  ADD KEY `idx_cust_trn` (`trn_no`),
  ADD KEY `idx_cust_est_card` (`establishment_no`),
  ADD KEY `idx_cust_license` (`license_no`);

--
-- Indexes for table `customer_employees`
--
ALTER TABLE `customer_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tenant_id` (`tenant_id`,`customer_id`),
  ADD KEY `idx_ce_emirates_id` (`emirates_id`),
  ADD KEY `idx_ce_passport_no` (`passport_no`);

--
-- Indexes for table `day_closings`
--
ALTER TABLE `day_closings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_tenant_date` (`tenant_id`,`branch_id`,`closing_date`),
  ADD KEY `idx_closing_tenant_date` (`tenant_id`,`closing_date`),
  ADD KEY `idx_closing_status` (`status`);

--
-- Indexes for table `document_audit_logs`
--
ALTER TABLE `document_audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_audit_tenant_doc` (`tenant_id`,`document_id`),
  ADD KEY `idx_audit_created` (`created_at`);

--
-- Indexes for table `document_files`
--
ALTER TABLE `document_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_file_doc_ver` (`document_id`,`version_no`),
  ADD KEY `idx_file_current` (`document_id`,`is_current`);

--
-- Indexes for table `document_followups`
--
ALTER TABLE `document_followups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fol_tenant_doc` (`tenant_id`,`document_id`),
  ADD KEY `idx_fol_next_date` (`next_followup_date`),
  ADD KEY `fk_followup_record` (`document_id`);

--
-- Indexes for table `document_records`
--
ALTER TABLE `document_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rec_tenant_cust` (`tenant_id`,`customer_id`),
  ADD KEY `idx_rec_employee` (`employee_id`),
  ADD KEY `idx_rec_expiry` (`expiry_date`),
  ADD KEY `idx_rec_status` (`status`),
  ADD KEY `idx_rec_doc_num` (`doc_number`),
  ADD KEY `fk_doc_rec_type` (`doc_type_id`);

--
-- Indexes for table `document_reminders_log`
--
ALTER TABLE `document_reminders_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rem_tenant_doc` (`tenant_id`,`document_id`),
  ADD KEY `fk_reminder_record` (`document_id`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_doc_type_tenant` (`tenant_id`,`category`),
  ADD KEY `idx_doc_type_active` (`is_active`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_exp_tenant_date` (`tenant_id`,`expense_date`),
  ADD KEY `idx_exp_tenant_cat` (`tenant_id`,`category`),
  ADD KEY `idx_exp_pay_method` (`payment_method`),
  ADD KEY `idx_tenant_date` (`tenant_id`,`expense_date`),
  ADD KEY `idx_category` (`category`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tenant` (`tenant_id`,`is_global`);

--
-- Indexes for table `financial_ledger`
--
ALTER TABLE `financial_ledger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_invoice_no` (`invoice_no`),
  ADD KEY `idx_closing_id` (`closing_id`),
  ADD KEY `idx_ledger_tenant_date` (`tenant_id`,`created_at`),
  ADD KEY `idx_ledger_account_code` (`tenant_id`,`account_code`),
  ADD KEY `idx_ledger_tx_type` (`transaction_type`),
  ADD KEY `idx_ledger_invoice_id` (`invoice_id`),
  ADD KEY `idx_tenant_txdate` (`tenant_id`,`transaction_date`);

--
-- Indexes for table `gov_emirates_scopes`
--
ALTER TABLE `gov_emirates_scopes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `gov_portals`
--
ALTER TABLE `gov_portals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `gov_services_directory`
--
ALTER TABLE `gov_services_directory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_portal_emirate` (`portal`,`emirate_scope`),
  ADD KEY `idx_tenant_public` (`tenant_id`,`is_public`),
  ADD KEY `idx_gov_public_tenant` (`is_public`,`tenant_id`),
  ADD KEY `idx_gov_likes` (`likes_count`);

--
-- Indexes for table `gov_service_comments`
--
ALTER TABLE `gov_service_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_service_id` (`service_id`);

--
-- Indexes for table `gov_service_likes`
--
ALTER TABLE `gov_service_likes`
  ADD PRIMARY KEY (`service_id`,`user_id`);

--
-- Indexes for table `health_insurance_applications`
--
ALTER TABLE `health_insurance_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_no` (`app_no`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `idx_proc_status` (`processor_tenant_id`,`status`),
  ADD KEY `idx_app_cust` (`customer_id`),
  ADD KEY `idx_health_tenant_status` (`tenant_id`,`status`),
  ADD KEY `idx_health_ref_no` (`ref_no`),
  ADD KEY `idx_health_policy_no` (`policy_no`),
  ADD KEY `idx_health_eid` (`emirates_id_no`),
  ADD KEY `idx_health_uid` (`uid_no`),
  ADD KEY `idx_health_icp_status` (`icp_status`);

--
-- Indexes for table `health_insurance_companies`
--
ALTER TABLE `health_insurance_companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `health_insurance_documents`
--
ALTER TABLE `health_insurance_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_doc_app_id` (`app_id`);

--
-- Indexes for table `health_insurance_history`
--
ALTER TABLE `health_insurance_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_id` (`app_id`);

--
-- Indexes for table `health_insurance_members`
--
ALTER TABLE `health_insurance_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mem_name` (`member_name`),
  ADD KEY `idx_member_tenant_cust` (`tenant_id`,`customer_id`),
  ADD KEY `idx_member_eid` (`emirates_id_no`);

--
-- Indexes for table `health_insurance_plans`
--
ALTER TABLE `health_insurance_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `icp_inquiry_logs`
--
ALTER TABLE `icp_inquiry_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tenant` (`tenant_id`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_no` (`invoice_no`),
  ADD KEY `idx_inv_tenant_branch_date` (`tenant_id`,`branch_id`,`created_at`),
  ADD KEY `idx_inv_tenant_status` (`tenant_id`,`payment_status`),
  ADD KEY `idx_inv_customer` (`tenant_id`,`customer_id`),
  ADD KEY `idx_inv_staff` (`tenant_id`,`staff_id`),
  ADD KEY `idx_inv_tenant_created` (`tenant_id`,`created_at`),
  ADD KEY `idx_inv_payment_mode` (`payment_mode`),
  ADD KEY `idx_invoices_type` (`tenant_id`,`invoice_type`,`created_at`),
  ADD KEY `idx_invoices_parent` (`parent_invoice_id`);

--
-- Indexes for table `invoice_audit_logs`
--
ALTER TABLE `invoice_audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tenant_inv` (`tenant_id`,`invoice_id`);

--
-- Indexes for table `invoice_credit_notes`
--
ALTER TABLE `invoice_credit_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_crn_tenant` (`tenant_id`,`created_at`),
  ADD KEY `idx_crn_invoice` (`invoice_id`);

--
-- Indexes for table `invoice_drafts`
--
ALTER TABLE `invoice_drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tenant_id` (`tenant_id`,`user_id`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `idx_draft_user_cust` (`user_id`,`customer_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_items_created` (`created_at`),
  ADD KEY `idx_item_service_code` (`service_code`),
  ADD KEY `idx_invoice_completed` (`invoice_id`,`is_completed`),
  ADD KEY `idx_app_no` (`application_no`);

--
-- Indexes for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tenant_inv` (`tenant_id`,`invoice_id`),
  ADD KEY `idx_pay_date` (`payment_date`),
  ADD KEY `idx_tenant_method_date` (`tenant_id`,`payment_method`,`payment_date`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_unread_fast` (`tenant_id`,`user_id`,`is_read`,`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_otp` (`otp_code`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `preset_service`
--
ALTER TABLE `preset_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tenant_global` (`tenant_id`,`is_global`);

--
-- Indexes for table `preset_service_items`
--
ALTER TABLE `preset_service_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`preset_service_id`);

--
-- Indexes for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_endpoint_hash` (`endpoint`(255)),
  ADD KEY `idx_tenant_user` (`tenant_id`,`user_id`);

--
-- Indexes for table `pwd_portal_services`
--
ALTER TABLE `pwd_portal_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ps_tenant` (`tenant_id`);

--
-- Indexes for table `pwd_vault_credentials`
--
ALTER TABLE `pwd_vault_credentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vc_tenant_cust` (`tenant_id`,`customer_id`),
  ADD KEY `idx_vc_service` (`service_id`),
  ADD KEY `idx_vault_service` (`tenant_id`,`service_id`),
  ADD KEY `idx_vault_username` (`username`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qtn_tenant_created` (`tenant_id`,`created_at`),
  ADD KEY `idx_qtn_status` (`status`),
  ADD KEY `idx_qtn_no` (`quotation_no`),
  ADD KEY `idx_qtn_tenant_customer` (`tenant_id`,`customer_id`);

--
-- Indexes for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qtn_items_parent` (`quotation_id`);

--
-- Indexes for table `rate_limits`
--
ALTER TABLE `rate_limits`
  ADD PRIMARY KEY (`rate_key`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Indexes for table `saas_audit_logs`
--
ALTER TABLE `saas_audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_audit_tenant` (`tenant_id`),
  ADD KEY `idx_audit_created` (`created_at`);

--
-- Indexes for table `saas_payments`
--
ALTER TABLE `saas_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sp_tenant` (`tenant_id`),
  ADD KEY `idx_sp_status` (`payment_status`);

--
-- Indexes for table `saas_plans`
--
ALTER TABLE `saas_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_entities`
--
ALTER TABLE `service_entities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entity_tenant` (`tenant_id`,`status`);

--
-- Indexes for table `staff_advances`
--
ALTER TABLE `staff_advances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tenant_user_adv` (`tenant_id`,`user_id`,`deduction_month`);

--
-- Indexes for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_user_att_date` (`tenant_id`,`user_id`,`attendance_date`),
  ADD KEY `idx_tenant_att_date` (`tenant_id`,`attendance_date`);

--
-- Indexes for table `staff_deletion_requests`
--
ALTER TABLE `staff_deletion_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_del_req_status` (`status`),
  ADD KEY `idx_del_req_tenant` (`tenant_id`);

--
-- Indexes for table `staff_payroll`
--
ALTER TABLE `staff_payroll`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_tenant_user_month` (`tenant_id`,`user_id`,`payroll_month`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tenant_expires` (`subscription_expires_at`),
  ADD KEY `idx_tenant_parent` (`parent_tenant_id`),
  ADD KEY `idx_tenant_status` (`status`,`subscription_status`),
  ADD KEY `idx_tenant_status_exp` (`subscription_status`,`subscription_expires_at`),
  ADD KEY `idx_tenant_plan` (`plan_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idx_users_login` (`tenant_id`,`username`),
  ADD KEY `idx_users_status` (`status`),
  ADD KEY `idx_users_tenant_role` (`tenant_id`,`role`),
  ADD KEY `idx_users_email` (`email`),
  ADD KEY `idx_users_phone` (`phone`);

--
-- Indexes for table `user_biometrics`
--
ALTER TABLE `user_biometrics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `credential_id` (`credential_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `idx_ud_staff_code` (`staff_code`),
  ADD KEY `idx_ud_emirates_id` (`emirates_id`);

--
-- Indexes for table `user_remember_tokens`
--
ALTER TABLE `user_remember_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selector` (`selector`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmark_categories`
--
ALTER TABLE `bookmark_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bookmark_clicks`
--
ALTER TABLE `bookmark_clicks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bookmark_items`
--
ALTER TABLE `bookmark_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cheques`
--
ALTER TABLE `cheques`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_employees`
--
ALTER TABLE `customer_employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `day_closings`
--
ALTER TABLE `day_closings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `document_audit_logs`
--
ALTER TABLE `document_audit_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `document_files`
--
ALTER TABLE `document_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_followups`
--
ALTER TABLE `document_followups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `document_records`
--
ALTER TABLE `document_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `document_reminders_log`
--
ALTER TABLE `document_reminders_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `financial_ledger`
--
ALTER TABLE `financial_ledger`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `gov_emirates_scopes`
--
ALTER TABLE `gov_emirates_scopes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gov_portals`
--
ALTER TABLE `gov_portals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gov_services_directory`
--
ALTER TABLE `gov_services_directory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gov_service_comments`
--
ALTER TABLE `gov_service_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_insurance_applications`
--
ALTER TABLE `health_insurance_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `health_insurance_companies`
--
ALTER TABLE `health_insurance_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_insurance_documents`
--
ALTER TABLE `health_insurance_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_insurance_history`
--
ALTER TABLE `health_insurance_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_insurance_members`
--
ALTER TABLE `health_insurance_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `health_insurance_plans`
--
ALTER TABLE `health_insurance_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `icp_inquiry_logs`
--
ALTER TABLE `icp_inquiry_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `invoice_audit_logs`
--
ALTER TABLE `invoice_audit_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_credit_notes`
--
ALTER TABLE `invoice_credit_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_drafts`
--
ALTER TABLE `invoice_drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preset_service`
--
ALTER TABLE `preset_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `preset_service_items`
--
ALTER TABLE `preset_service_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pwd_portal_services`
--
ALTER TABLE `pwd_portal_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pwd_vault_credentials`
--
ALTER TABLE `pwd_vault_credentials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quotation_items`
--
ALTER TABLE `quotation_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `saas_audit_logs`
--
ALTER TABLE `saas_audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `service_entities`
--
ALTER TABLE `service_entities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `staff_advances`
--
ALTER TABLE `staff_advances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_deletion_requests`
--
ALTER TABLE `staff_deletion_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_payroll`
--
ALTER TABLE `staff_payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_biometrics`
--
ALTER TABLE `user_biometrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_remember_tokens`
--
ALTER TABLE `user_remember_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_files`
--
ALTER TABLE `document_files`
  ADD CONSTRAINT `fk_file_document` FOREIGN KEY (`document_id`) REFERENCES `document_records` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_followups`
--
ALTER TABLE `document_followups`
  ADD CONSTRAINT `fk_followup_record` FOREIGN KEY (`document_id`) REFERENCES `document_records` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_records`
--
ALTER TABLE `document_records`
  ADD CONSTRAINT `fk_doc_rec_type` FOREIGN KEY (`doc_type_id`) REFERENCES `document_types` (`id`);

--
-- Constraints for table `document_reminders_log`
--
ALTER TABLE `document_reminders_log`
  ADD CONSTRAINT `fk_reminder_record` FOREIGN KEY (`document_id`) REFERENCES `document_records` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `health_insurance_applications`
--
ALTER TABLE `health_insurance_applications`
  ADD CONSTRAINT `health_insurance_applications_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `health_insurance_companies` (`id`),
  ADD CONSTRAINT `health_insurance_applications_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `health_insurance_plans` (`id`);

--
-- Constraints for table `health_insurance_documents`
--
ALTER TABLE `health_insurance_documents`
  ADD CONSTRAINT `health_insurance_documents_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `health_insurance_applications` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `health_insurance_history`
--
ALTER TABLE `health_insurance_history`
  ADD CONSTRAINT `health_insurance_history_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `health_insurance_applications` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `health_insurance_plans`
--
ALTER TABLE `health_insurance_plans`
  ADD CONSTRAINT `health_insurance_plans_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `health_insurance_companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `fk_invoice_items_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `preset_service_items`
--
ALTER TABLE `preset_service_items`
  ADD CONSTRAINT `fk_service_items_service` FOREIGN KEY (`preset_service_id`) REFERENCES `preset_service` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pwd_vault_credentials`
--
ALTER TABLE `pwd_vault_credentials`
  ADD CONSTRAINT `fk_vc_service` FOREIGN KEY (`service_id`) REFERENCES `pwd_portal_services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD CONSTRAINT `fk_qtn_items` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `fk_user_details_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`paciqujt8fea`@`localhost` EVENT `daily_purge_invoice_drafts` ON SCHEDULE EVERY 1 DAY STARTS '2026-08-23 06:58:48' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM `invoice_drafts` 
  WHERE `updated_at` < DATE_SUB(NOW(), INTERVAL 10 DAY)$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
