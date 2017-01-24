-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.48 - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица october.backend_access_log
CREATE TABLE IF NOT EXISTS `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.backend_access_log: ~1 rows (приблизительно)
DELETE FROM `backend_access_log`;
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;
INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
	(1, 1, '127.0.0.1', '2017-01-23 03:56:49', '2017-01-23 03:56:49');
/*!40000 ALTER TABLE `backend_access_log` ENABLE KEYS */;


-- Дамп структуры для таблица october.backend_users
CREATE TABLE IF NOT EXISTS `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.backend_users: ~1 rows (приблизительно)
DELETE FROM `backend_users`;
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;
INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `activated_at`, `last_login`, `created_at`, `updated_at`, `is_superuser`) VALUES
	(1, 'Admin', 'Admin', 'admin', 'adilbek.tumenbayev@gmail.com', '$2y$10$EoNKg.wsH.0cwfzLw5ehJeKgmnm8nnugnDCNPRRZ/n8lvTVadKW2y', NULL, '$2y$10$N0WViwqHblXWE86sQfGfOuBl1M9kb01Ty1qhAJF.MqXFH5f.UJEAO', NULL, '', 1, NULL, '2017-01-23 03:56:48', '2017-01-23 03:56:16', '2017-01-23 03:56:48', 1);
/*!40000 ALTER TABLE `backend_users` ENABLE KEYS */;


-- Дамп структуры для таблица october.backend_users_groups
CREATE TABLE IF NOT EXISTS `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.backend_users_groups: ~1 rows (приблизительно)
DELETE FROM `backend_users_groups`;
/*!40000 ALTER TABLE `backend_users_groups` DISABLE KEYS */;
INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `backend_users_groups` ENABLE KEYS */;


-- Дамп структуры для таблица october.backend_user_groups
CREATE TABLE IF NOT EXISTS `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.backend_user_groups: ~1 rows (приблизительно)
DELETE FROM `backend_user_groups`;
/*!40000 ALTER TABLE `backend_user_groups` DISABLE KEYS */;
INSERT INTO `backend_user_groups` (`id`, `name`, `permissions`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
	(1, 'Owners', NULL, '2017-01-23 03:56:16', '2017-01-23 03:56:16', 'owners', 'Default group for website owners.', 0);
/*!40000 ALTER TABLE `backend_user_groups` ENABLE KEYS */;


-- Дамп структуры для таблица october.backend_user_preferences
CREATE TABLE IF NOT EXISTS `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.backend_user_preferences: ~0 rows (приблизительно)
DELETE FROM `backend_user_preferences`;
/*!40000 ALTER TABLE `backend_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_user_preferences` ENABLE KEYS */;


-- Дамп структуры для таблица october.backend_user_throttle
CREATE TABLE IF NOT EXISTS `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.backend_user_throttle: ~1 rows (приблизительно)
DELETE FROM `backend_user_throttle`;
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;
INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
	(1, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL);
/*!40000 ALTER TABLE `backend_user_throttle` ENABLE KEYS */;


-- Дамп структуры для таблица october.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.cache: ~0 rows (приблизительно)
DELETE FROM `cache`;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;


-- Дамп структуры для таблица october.cms_theme_data
CREATE TABLE IF NOT EXISTS `cms_theme_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.cms_theme_data: ~1 rows (приблизительно)
DELETE FROM `cms_theme_data`;
/*!40000 ALTER TABLE `cms_theme_data` DISABLE KEYS */;
INSERT INTO `cms_theme_data` (`id`, `theme`, `data`, `created_at`, `updated_at`) VALUES
	(1, 'multi', '{"site_name":"Multi"}', '2017-01-23 03:59:27', '2017-01-23 03:59:27');
/*!40000 ALTER TABLE `cms_theme_data` ENABLE KEYS */;


-- Дамп структуры для таблица october.deferred_bindings
CREATE TABLE IF NOT EXISTS `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.deferred_bindings: ~0 rows (приблизительно)
DELETE FROM `deferred_bindings`;
/*!40000 ALTER TABLE `deferred_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `deferred_bindings` ENABLE KEYS */;


-- Дамп структуры для таблица october.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.failed_jobs: ~0 rows (приблизительно)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;


-- Дамп структуры для таблица october.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.jobs: ~0 rows (приблизительно)
DELETE FROM `jobs`;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;


-- Дамп структуры для таблица october.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.migrations: ~31 rows (приблизительно)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2013_10_01_000001_Db_Deferred_Bindings', 1),
	('2013_10_01_000002_Db_System_Files', 1),
	('2013_10_01_000003_Db_System_Plugin_Versions', 1),
	('2013_10_01_000004_Db_System_Plugin_History', 1),
	('2013_10_01_000005_Db_System_Settings', 1),
	('2013_10_01_000006_Db_System_Parameters', 1),
	('2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
	('2013_10_01_000008_Db_System_Mail_Templates', 1),
	('2013_10_01_000009_Db_System_Mail_Layouts', 1),
	('2014_10_01_000010_Db_Jobs', 1),
	('2014_10_01_000011_Db_System_Event_Logs', 1),
	('2014_10_01_000012_Db_System_Request_Logs', 1),
	('2014_10_01_000013_Db_System_Sessions', 1),
	('2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
	('2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
	('2015_10_01_000016_Db_Cache', 1),
	('2015_10_01_000017_Db_System_Revisions', 1),
	('2015_10_01_000018_Db_FailedJobs', 1),
	('2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
	('2016_10_01_000020_Db_System_Timestamp_Fix', 1),
	('2013_10_01_000001_Db_Backend_Users', 2),
	('2013_10_01_000002_Db_Backend_User_Groups', 2),
	('2013_10_01_000003_Db_Backend_Users_Groups', 2),
	('2013_10_01_000004_Db_Backend_User_Throttle', 2),
	('2014_01_04_000005_Db_Backend_User_Preferences', 2),
	('2014_10_01_000006_Db_Backend_Access_Log', 2),
	('2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
	('2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
	('2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
	('2014_10_01_000001_Db_Cms_Theme_Data', 3),
	('2016_10_01_000002_Db_Cms_Timestamp_Fix', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Дамп структуры для таблица october.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.sessions: ~0 rows (приблизительно)
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


-- Дамп структуры для таблица october.system_event_logs
CREATE TABLE IF NOT EXISTS `system_event_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `details` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.system_event_logs: ~0 rows (приблизительно)
DELETE FROM `system_event_logs`;
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_event_logs` ENABLE KEYS */;


-- Дамп структуры для таблица october.system_files
CREATE TABLE IF NOT EXISTS `system_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.system_files: ~0 rows (приблизительно)
DELETE FROM `system_files`;
/*!40000 ALTER TABLE `system_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_files` ENABLE KEYS */;


-- Дамп структуры для таблица october.system_mail_layouts
CREATE TABLE IF NOT EXISTS `system_mail_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_css` text COLLATE utf8_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.system_mail_layouts: ~2 rows (приблизительно)
DELETE FROM `system_mail_layouts`;
/*!40000 ALTER TABLE `system_mail_layouts` DISABLE KEYS */;
INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `created_at`, `updated_at`) VALUES
	(1, 'Default', 'default', '<html>\n    <head>\n        <style type="text/css" media="screen">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n    </body>\n</html>', '{{ content|raw }}', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', 1, '2017-01-23 03:56:16', '2017-01-23 03:56:16'),
	(2, 'System', 'system', '<html>\n    <head>\n        <style type="text/css" media="screen">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n        <hr />\n        <p>This is an automatic message. Please do not reply to it.</p>\n    </body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', 1, '2017-01-23 03:56:16', '2017-01-23 03:56:16');
/*!40000 ALTER TABLE `system_mail_layouts` ENABLE KEYS */;


-- Дамп структуры для таблица october.system_mail_templates
CREATE TABLE IF NOT EXISTS `system_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.system_mail_templates: ~0 rows (приблизительно)
DELETE FROM `system_mail_templates`;
/*!40000 ALTER TABLE `system_mail_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_templates` ENABLE KEYS */;


-- Дамп структуры для таблица october.system_parameters
CREATE TABLE IF NOT EXISTS `system_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.system_parameters: ~3 rows (приблизительно)
DELETE FROM `system_parameters`;
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;
INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
	(1, 'system', 'update', 'count', '0'),
	(2, 'system', 'update', 'retry', '1485230264'),
	(3, 'cms', 'theme', 'active', '"multi"');
/*!40000 ALTER TABLE `system_parameters` ENABLE KEYS */;


-- Дамп структуры для таблица october.system_plugin_history
CREATE TABLE IF NOT EXISTS `system_plugin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.system_plugin_history: ~1 rows (приблизительно)
DELETE FROM `system_plugin_history`;
/*!40000 ALTER TABLE `system_plugin_history` DISABLE KEYS */;
INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
	(1, 'October.Demo', 'comment', '1.0.1', 'First version of Demo', '2017-01-23 03:56:15');
/*!40000 ALTER TABLE `system_plugin_history` ENABLE KEYS */;


-- Дамп структуры для таблица october.system_plugin_versions
CREATE TABLE IF NOT EXISTS `system_plugin_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.system_plugin_versions: ~1 rows (приблизительно)
DELETE FROM `system_plugin_versions`;
/*!40000 ALTER TABLE `system_plugin_versions` DISABLE KEYS */;
INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
	(1, 'October.Demo', '1.0.1', '2017-01-23 03:56:15', 0, 0);
/*!40000 ALTER TABLE `system_plugin_versions` ENABLE KEYS */;


-- Дамп структуры для таблица october.system_request_logs
CREATE TABLE IF NOT EXISTS `system_request_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.system_request_logs: ~1 rows (приблизительно)
DELETE FROM `system_request_logs`;
/*!40000 ALTER TABLE `system_request_logs` DISABLE KEYS */;
INSERT INTO `system_request_logs` (`id`, `status_code`, `url`, `referer`, `count`, `created_at`, `updated_at`) VALUES
	(1, 404, 'http://localhost/october/themes/multi/assets/css/grabbing.png', '["http:\\/\\/localhost\\/october\\/combine\\/8ae37a25bb74cc651245ed5acf8c95be-1485143935"]', 1, '2017-01-23 04:00:14', '2017-01-23 04:00:14');
/*!40000 ALTER TABLE `system_request_logs` ENABLE KEYS */;


-- Дамп структуры для таблица october.system_revisions
CREATE TABLE IF NOT EXISTS `system_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cast` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8_unicode_ci,
  `new_value` text COLLATE utf8_unicode_ci,
  `revisionable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.system_revisions: ~0 rows (приблизительно)
DELETE FROM `system_revisions`;
/*!40000 ALTER TABLE `system_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_revisions` ENABLE KEYS */;


-- Дамп структуры для таблица october.system_settings
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы october.system_settings: ~0 rows (приблизительно)
DELETE FROM `system_settings`;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
