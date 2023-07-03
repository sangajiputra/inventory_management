-- MariaDB dump 10.19  Distrib 10.4.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: devkpntwks_inv
-- ------------------------------------------------------
-- Server version	10.4.26-MariaDB-1:10.4.26+maria~ubu1804

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_types_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_types`
--

LOCK TABLES `account_types` WRITE;
/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;
INSERT INTO `account_types` VALUES (1,'Savings');
/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_type_id` int(10) unsigned NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `income_expense_category_id` int(10) unsigned DEFAULT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `bank_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `accounts_account_type_id_foreign_idx` (`account_type_id`),
  KEY `accounts_name_index` (`name`),
  KEY `accounts_account_number_index` (`account_number`),
  KEY `accounts_income_expense_category_id_foreign_idx` (`income_expense_category_id`),
  KEY `accounts_currency_id_foreign_idx` (`currency_id`),
  KEY `accounts_bank_name_index` (`bank_name`),
  KEY `accounts_is_default_index` (`is_default`),
  CONSTRAINT `accounts_account_type_id_foreign` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accounts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accounts_income_expense_category_id_foreign` FOREIGN KEY (`income_expense_category_id`) REFERENCES `income_expense_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,'BCA - Default','323076012',NULL,1,'Bank Central Asia','Bank Central Asia','Bank Central Asia','10028','-',1,0);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `object_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `params` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `activities_user_id_foreign_idx` (`user_id`),
  KEY `activities_customer_id_foreign_idx` (`customer_id`),
  CONSTRAINT `activities_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backups`
--

DROP TABLE IF EXISTS `backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `backups_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backups`
--

LOCK TABLES `backups` WRITE;
/*!40000 ALTER TABLE `backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_events`
--

DROP TABLE IF EXISTS `calendar_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `notification_start` int(11) DEFAULT NULL COMMENT 'notification_start, it means how many days/hour/minutes/weeks before it will remind user about the event.',
  `notification_repeat_every` tinyint(1) DEFAULT NULL COMMENT 'notification_repeat_every, it means what is the unit of ''notification_start'' field.\r\ni.e. : minutes, hours, days, weeks',
  `event_color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL COMMENT 'created by refers the users table id;\r\nit is the id who was logged in at the creation time of the event.',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `calendar_events_title_index` (`title`),
  KEY `calendar_events_start_date_index` (`start_date`),
  KEY `calendar_events_end_date_index` (`end_date`),
  KEY `calendar_events_is_public_index` (`is_public`),
  KEY `calendar_events_created_by_foreign_idx` (`created_by`),
  CONSTRAINT `calendar_events_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_events`
--

LOCK TABLES `calendar_events` WRITE;
/*!40000 ALTER TABLE `calendar_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canned_links`
--

DROP TABLE IF EXISTS `canned_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canned_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `created_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `canned_links_title_index` (`title`),
  KEY `canned_links_link_index` (`link`),
  KEY `canned_links_created_by_foreign_idx` (`created_by`),
  KEY `canned_links_created_type_index` (`created_type`),
  CONSTRAINT `canned_links_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canned_links`
--

LOCK TABLES `canned_links` WRITE;
/*!40000 ALTER TABLE `canned_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `canned_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canned_messages`
--

DROP TABLE IF EXISTS `canned_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canned_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `created_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `canned_messages_title_index` (`title`),
  KEY `canned_messages_created_by_foreign_idx` (`created_by`),
  KEY `canned_messages_created_type_index` (`created_type`),
  CONSTRAINT `canned_messages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canned_messages`
--

LOCK TABLES `canned_messages` WRITE;
/*!40000 ALTER TABLE `canned_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `canned_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_configurations`
--

DROP TABLE IF EXISTS `captcha_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_configurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_verify_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_configurations`
--

LOCK TABLES `captcha_configurations` WRITE;
/*!40000 ALTER TABLE `captcha_configurations` DISABLE KEYS */;
INSERT INTO `captcha_configurations` VALUES (1,'fill with your site key','fill with your secret key','https://www.google.com/recaptcha/api/siteverify','https://www.google.com/recaptcha/api.js');
/*!40000 ALTER TABLE `captcha_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_items`
--

DROP TABLE IF EXISTS `checklist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` int(10) unsigned DEFAULT NULL COMMENT 'task_id refers the task table''s id column.',
  `is_checked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1, 0 and 0 as default;\\n0 for unchecked;\\n1 for checked;',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `checked_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checklist_items_title_index` (`title`),
  KEY `checklist_items_task_id_foreign_idx` (`task_id`),
  KEY `checklist_items_is_checked_index` (`is_checked`),
  KEY `checklist_items_checked_at_index` (`checked_at`),
  CONSTRAINT `checklist_items_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_items`
--

LOCK TABLES `checklist_items` WRITE;
/*!40000 ALTER TABLE `checklist_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `checklist_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `countries_name_index` (`name`),
  KEY `countries_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'United States','US'),(2,'Canada','CA'),(3,'Afghanistan','AF'),(4,'Albania','AL'),(5,'Algeria','DZ'),(6,'American Samoa','AS'),(7,'Andorra','AD'),(8,'Angola','AO'),(9,'Anguilla','AI'),(10,'Antarctica','AQ'),(11,'Antigua and/or Barbuda','AG'),(12,'Argentina','AR'),(13,'Armenia','AM'),(14,'Aruba','AW'),(15,'Australia','AU'),(16,'Austria','AT'),(17,'Azerbaijan','AZ'),(18,'Bahamas','BS'),(19,'Bahrain','BH'),(20,'Bangladesh','BD'),(21,'Barbados','BB'),(22,'Belarus','BY'),(23,'Belgium','BE'),(24,'Belize','BZ'),(25,'Benin','BJ'),(26,'Bermuda','BM'),(27,'Bhutan','BT'),(28,'Bolivia','BO'),(29,'Bosnia and Herzegovina','BA'),(30,'Botswana','BW'),(31,'Bouvet Island','BV'),(32,'Brazil','BR'),(33,'British lndian Ocean Territory','IO'),(34,'Brunei Darussalam','BN'),(35,'Bulgaria','BG'),(36,'Burkina Faso','BF'),(37,'Burundi','BI'),(38,'Cambodia','KH'),(39,'Cameroon','CM'),(40,'Cape Verde','CV'),(41,'Cayman Islands','KY'),(42,'Central African Republic','CF'),(43,'Chad','TD'),(44,'Chile','CL'),(45,'China','CN'),(46,'Christmas Island','CX'),(47,'Cocos (Keeling) Islands','CC'),(48,'Colombia','CO'),(49,'Comoros','KM'),(50,'Congo','CG'),(51,'Cook Islands','CK'),(52,'Costa Rica','CR'),(53,'Croatia (Hrvatska)','HR'),(54,'Cuba','CU'),(55,'Cyprus','CY'),(56,'Czech Republic','CZ'),(57,'Democratic Republic of Congo','CD'),(58,'Denmark','DK'),(59,'Djibouti','DJ'),(60,'Dominica','DM'),(61,'Dominican Republic','DO'),(62,'East Timor','TP'),(63,'Ecudaor','EC'),(64,'Egypt','EG'),(65,'El Salvador','SV'),(66,'Equatorial Guinea','GQ'),(67,'Eritrea','ER'),(68,'Estonia','EE'),(69,'Ethiopia','ET'),(70,'Falkland Islands (Malvinas)','FK'),(71,'Faroe Islands','FO'),(72,'Fiji','FJ'),(73,'Finland','FI'),(74,'France','FR'),(75,'France, Metropolitan','FX'),(76,'French Guiana','GF'),(77,'French Polynesia','PF'),(78,'French Southern Territories','TF'),(79,'Gabon','GA'),(80,'Gambia','GM'),(81,'Georgia','GE'),(82,'Germany','DE'),(83,'Ghana','GH'),(84,'Gibraltar','GI'),(85,'Greece','GR'),(86,'Greenland','GL'),(87,'Grenada','GD'),(88,'Guadeloupe','GP'),(89,'Guam','GU'),(90,'Guatemala','GT'),(91,'Guinea','GN'),(92,'Guinea-Bissau','GW'),(93,'Guyana','GY'),(94,'Haiti','HT'),(95,'Heard and Mc Donald Islands','HM'),(96,'Honduras','HN'),(97,'Hong Kong','HK'),(98,'Hungary','HU'),(99,'Iceland','IS'),(100,'India','IN'),(101,'Indonesia','ID'),(102,'Iran (Islamic Republic of)','IR'),(103,'Iraq','IQ'),(104,'Ireland','IE'),(105,'Israel','IL'),(106,'Italy','IT'),(107,'Ivory Coast','CI'),(108,'Jamaica','JM'),(109,'Japan','JP'),(110,'Jordan','JO'),(111,'Kazakhstan','KZ'),(112,'Kenya','KE'),(113,'Kiribati','KI'),(114,'Korea, Democratic People\'s Republic of','KP'),(115,'Korea, Republic of','KR'),(116,'Kuwait','KW'),(117,'Kyrgyzstan','KG'),(118,'Lao People\'s Democratic Republic','LA'),(119,'Latvia','LV'),(120,'Lebanon','LB'),(121,'Lesotho','LS'),(122,'Liberia','LR'),(123,'Libyan Arab Jamahiriya','LY'),(124,'Liechtenstein','LI'),(125,'Lithuania','LT'),(126,'Luxembourg','LU'),(127,'Macau','MO'),(128,'Macedonia','MK'),(129,'Madagascar','MG'),(130,'Malawi','MW'),(131,'Malaysia','MY'),(132,'Maldives','MV'),(133,'Mali','ML'),(134,'Malta','MT'),(135,'Marshall Islands','MH'),(136,'Martinique','MQ'),(137,'Mauritania','MR'),(138,'Mauritius','MU'),(139,'Mayotte','TY'),(140,'Mexico','MX'),(141,'Micronesia, Federated States of','FM'),(142,'Moldova, Republic of','MD'),(143,'Monaco','MC'),(144,'Mongolia','MN'),(145,'Montserrat','MS'),(146,'Morocco','MA'),(147,'Mozambique','MZ'),(148,'Myanmar','MM'),(149,'Namibia','NA'),(150,'Nauru','NR'),(151,'Nepal','NP'),(152,'Netherlands','NL'),(153,'Netherlands Antilles','AN'),(154,'New Caledonia','NC'),(155,'New Zealand','NZ'),(156,'Nicaragua','NI'),(157,'Niger','NE'),(158,'Nigeria','NG'),(159,'Niue','NU'),(160,'Norfork Island','NF'),(161,'Northern Mariana Islands','MP'),(162,'Norway','NO'),(163,'Oman','OM'),(164,'Pakistan','PK'),(165,'Palau','PW'),(166,'Panama','PA'),(167,'Papua New Guinea','PG'),(168,'Paraguay','PY'),(169,'Peru','PE'),(170,'Philippines','PH'),(171,'Pitcairn','PN'),(172,'Poland','PL'),(173,'Portugal','PT'),(174,'Puerto Rico','PR'),(175,'Qatar','QA'),(176,'Republic of South Sudan','SS'),(177,'Reunion','RE'),(178,'Romania','RO'),(179,'Russian Federation','RU'),(180,'Rwanda','RW'),(181,'Saint Kitts and Nevis','KN'),(182,'Saint Lucia','LC'),(183,'Saint Vincent and the Grenadines','VC'),(184,'Samoa','WS'),(185,'San Marino','SM'),(186,'Sao Tome and Principe','ST'),(187,'Saudi Arabia','SA'),(188,'Senegal','SN'),(189,'Serbia','RS'),(190,'Seychelles','SC'),(191,'Sierra Leone','SL'),(192,'Singapore','SG'),(193,'Slovakia','SK'),(194,'Slovenia','SI'),(195,'Solomon Islands','SB'),(196,'Somalia','SO'),(197,'South Africa','ZA'),(198,'South Georgia South Sandwich Islands','GS'),(199,'Spain','ES'),(200,'Sri Lanka','LK'),(201,'St. Helena','SH'),(202,'St. Pierre and Miquelon','PM'),(203,'Sudan','SD'),(204,'Suriname','SR'),(205,'Svalbarn and Jan Mayen Islands','SJ'),(206,'Swaziland','SZ'),(207,'Sweden','SE'),(208,'Switzerland','CH'),(209,'Syrian Arab Republic','SY'),(210,'Taiwan','TW'),(211,'Tajikistan','TJ'),(212,'Tanzania, United Republic of','TZ'),(213,'Thailand','TH'),(214,'Togo','TG'),(215,'Tokelau','TK'),(216,'Tonga','TO'),(217,'Trinidad and Tobago','TT'),(218,'Tunisia','TN'),(219,'Turkey','TR'),(220,'Turkmenistan','TM'),(221,'Turks and Caicos Islands','TC'),(222,'Tuvalu','TV'),(223,'Uganda','UG'),(224,'Ukraine','UA'),(225,'United Arab Emirates','AE'),(226,'United Kingdom','GB'),(227,'United States minor outlying islands','UM'),(228,'Uruguay','UY'),(229,'Uzbekistan','UZ'),(230,'Vanuatu','VU'),(231,'Vatican City State','VA'),(232,'Venezuela','VE'),(233,'Vietnam','VN'),(234,'Virgin Islands (British)','VG'),(235,'Virgin Islands (U.S.)','VI'),(236,'Wallis and Futuna Islands','WF'),(237,'Western Sahara','EH'),(238,'Yemen','YE'),(239,'Yugoslavia','YU'),(240,'Zaire','ZR'),(241,'Zambia','ZM'),(242,'Zimbabwe','ZW');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` decimal(16,8) NOT NULL,
  `exchange_from` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `currencies_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'Rupiah','Rp',1.00000000,'local');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_converter_configurations`
--

DROP TABLE IF EXISTS `currency_converter_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_converter_configurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_converter_configurations`
--

LOCK TABLES `currency_converter_configurations` WRITE;
/*!40000 ALTER TABLE `currency_converter_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_converter_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_item_orders`
--

DROP TABLE IF EXISTS `custom_item_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_item_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` int(11) NOT NULL,
  `tax_type_id` int(10) unsigned NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` decimal(16,8) NOT NULL,
  `unit_price` decimal(16,8) NOT NULL,
  `discount_percent` decimal(11,8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_item_orders_order_no_index` (`order_no`),
  KEY `custom_item_orders_tax_type_id_foreign_idx` (`tax_type_id`),
  KEY `custom_item_orders_name_index` (`name`),
  CONSTRAINT `custom_item_orders_tax_type_id_foreign` FOREIGN KEY (`tax_type_id`) REFERENCES `tax_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_item_orders`
--

LOCK TABLES `custom_item_orders` WRITE;
/*!40000 ALTER TABLE `custom_item_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_item_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_activations`
--

DROP TABLE IF EXISTS `customer_activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `customer_activations_customer_id_foreign_idx` (`customer_id`),
  CONSTRAINT `customer_activations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_activations`
--

LOCK TABLES `customer_activations` WRITE;
/*!40000 ALTER TABLE `customer_activations` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_branches`
--

DROP TABLE IF EXISTS `customer_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_branches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_street` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country_id` int(10) unsigned DEFAULT NULL,
  `shipping_street` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_branches_customer_id_foreign_idx` (`customer_id`),
  KEY `customer_branches_name_index` (`name`),
  KEY `customer_branches_contact_index` (`contact`),
  KEY `customer_branches_billing_state_index` (`billing_state`),
  KEY `customer_branches_billing_country_id_foreign_idx` (`billing_country_id`),
  KEY `customer_branches_shipping_state_index` (`shipping_state`),
  KEY `customer_branches_shipping_country_id_foreign_idx` (`shipping_country_id`),
  CONSTRAINT `customer_branches_billing_country_id_foreign` FOREIGN KEY (`billing_country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_branches_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_branches_shipping_country_id_foreign` FOREIGN KEY (`shipping_country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_branches`
--

LOCK TABLES `customer_branches` WRITE;
/*!40000 ALTER TABLE `customer_branches` DISABLE KEYS */;
INSERT INTO `customer_branches` VALUES (1,1,'William Jones',NULL,'864  Sussex Court','Waco','Texas','76706',1,'864  Sussex Court','Waco','Texas','76706',1);
/*!40000 ALTER TABLE `customer_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_transactions`
--

DROP TABLE IF EXISTS `customer_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `payment_method_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `sale_order_id` bigint(20) unsigned NOT NULL,
  `transaction_reference_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `transaction_date` date NOT NULL,
  `amount` decimal(16,8) NOT NULL,
  `exchange_rate` decimal(16,8) NOT NULL,
  `status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Approved' COMMENT '''Pending'', ''Approved'', ''Declined''',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `customer_transactions_user_id_foreign_idx` (`user_id`),
  KEY `customer_transactions_account_id_foreign_idx` (`account_id`),
  KEY `customer_transactions_payment_method_id_foreign_idx` (`payment_method_id`),
  KEY `customer_transactions_customer_id_foreign_idx` (`customer_id`),
  KEY `customer_transactions_invoice_id_foreign_idx` (`sale_order_id`),
  KEY `customer_transactions_transaction_reference_id_foreign_idx` (`transaction_reference_id`),
  KEY `customer_transactions_currency_id_foreign_idx` (`currency_id`),
  KEY `customer_transactions_transaction_date_index` (`transaction_date`),
  KEY `customer_transactions_amount_index` (`amount`),
  KEY `customer_transactions_status_index` (`status`),
  CONSTRAINT `customer_transactions_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_transactions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_transactions_sale_order_id_foreign` FOREIGN KEY (`sale_order_id`) REFERENCES `sale_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_transactions_transaction_reference_id_foreign` FOREIGN KEY (`transaction_reference_id`) REFERENCES `transaction_references` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_transactions`
--

LOCK TABLES `customer_transactions` WRITE;
/*!40000 ALTER TABLE `customer_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) unsigned NOT NULL COMMENT 'currency_id refers to currencies tbale id.',
  `customer_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 for active;\\n0 for inactive.',
  `is_verified` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 for vairified;0 for not varified.',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_name_index` (`name`),
  KEY `customers_first_name_index` (`first_name`),
  KEY `customers_last_name_index` (`last_name`),
  KEY `customers_email_index` (`email`),
  KEY `customers_phone_index` (`phone`),
  KEY `customers_currency_id_foreign_idx` (`currency_id`),
  KEY `customers_is_inactive_index` (`is_active`),
  KEY `customers_is_not_verified_index` (`is_verified`),
  CONSTRAINT `customers_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Walking customer','Walking','Customer','','$2y$10$VJwK3pDqNJFXvtA8VJpaeeWAtKXV6/EzhIc61QZ6C.CyN1tojQaqa','',NULL,1,NULL,'Asia/Dhaka','',1,0,'2020-04-06 21:10:36','2020-04-07 22:57:51');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (2,'Marketing'),(3,'Sales'),(1,'Technical');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `income_expense_category_id` int(10) unsigned NOT NULL,
  `transaction_reference_id` int(10) unsigned NOT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `transaction_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(16,8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deposits_account_id_foreign_idx` (`account_id`),
  KEY `deposits_user_id_foreign_idx` (`user_id`),
  KEY `deposits_income_expense_category_id_foreign_idx` (`income_expense_category_id`),
  KEY `deposits_transaction_reference_id_foreign_idx` (`transaction_reference_id`),
  KEY `deposits_payment_method_id_foreign_idx` (`payment_method_id`),
  KEY `deposits_transaction_date_index` (`transaction_date`),
  KEY `deposits_amount_index` (`amount`),
  CONSTRAINT `deposits_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deposits_income_expense_category_id_foreign` FOREIGN KEY (`income_expense_category_id`) REFERENCES `income_expense_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deposits_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deposits_transaction_reference_id_foreign` FOREIGN KEY (`transaction_reference_id`) REFERENCES `transaction_references` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_configurations`
--

DROP TABLE IF EXISTS `email_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_configurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `protocol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_host` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_port` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1= varified, 0= unverified',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_configurations`
--

LOCK TABLES `email_configurations` WRITE;
/*!40000 ALTER TABLE `email_configurations` DISABLE KEYS */;
INSERT INTO `email_configurations` VALUES (1,'smtp','tls','smtp.gmail.com','587','example@gmail.com','example@gmail.com','screte','example@gmail.com','example@gmail.com',1);
/*!40000 ALTER TABLE `email_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_short_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '''email'', ''sms''',
  `language_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email_templates_language_short_name_index` (`language_short_name`),
  KEY `email_templates_language_id_foreign_idx` (`language_id`),
  CONSTRAINT `email_templates_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,1,'Payment information for Quotation#{order_reference_no} and Invoice#{invoice_reference_no}.','<html>\r\n                    <head>\r\n                    <body style=\"background-color:#e0e0e2; font-size:100%;font-weight:400;line-height:1.4;color:#000;\">\r\n                        <table style=\"max-width:700px;margin:50px auto 10px;border: 1px solid black;background-color:#fff;padding:50px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;-webkit-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);-moz-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24); border-top: solid 10px #1028d4;\">\r\n                            <thead>\r\n                                <tr>\r\n                                    <td colspan=\"2\" style=\"text-align: justify;\">\r\n                                        <p style=\"text-align:center\"></p>\r\n                                        <p style=\"font-size: 16px;\"><strong>Hi {customer_name},</strong></p>\r\n                                        <p style=\"font-size: 16px;\" style=\"line-height: 2rem; text-align: justify;\">Thanks for purchasing our products and making your payments. We just want to confirm a few details about payment information. Please, check if it is okay or not.</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"height:35px;\"></td>\r\n                                </tr>\r\n                            </thead>\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td>\r\n                                        <p><u><b>Customer Information:</b></u></p>\r\n                                        <p>{billing_street}, {billing_city}, {billing_state}, {billing_zip_code}, {billing_country}</p><br />\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td>\r\n                                        <p><u><b>Payment Summary:</b></u></p>\r\n                                        <p>Payment No : <span>{payment_id}</span></p>\r\n                                        <p>Payment Date : <span>{payment_date}</span></p>\r\n                                        <p>Total Amount : <span>{total_amount}</span></p>\r\n                                        <p>Quotation No  : <span>{order_reference_no}</span></p>\r\n                                        <p>Invoice No  : <span>{invoice_reference_no}</span></p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr style=\"margin: 0; padding: 0;\">\r\n                                    <td colspan=\"2\">\r\n                                        <p style=\"font-size:16px;margin-top:50px;\"><strong>Regards,</strong></p>\r\n                                        <p style=\"font-size:16px;\">{company_name}</p>\r\n                                        <br />\r\n                                        <hr>\r\n                                        <p style=\"text-align: center;\">©{company_name}, all rights reserved</p>\r\n                                    </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </body>\r\n                </html>','en','email',1),(2,4,'Your Invoice # {invoice_reference_no} from {company_name} has been created.','<html>\r\n                    <body style=\"background-color:#e2e1e0;color:#000;\">\r\n                      <table style=\"max-width:700px;margin:50px auto 10px;border: 1px solid black;background-color:#fff;padding:50px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;-webkit-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);-moz-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24); border-top: solid 10px green;\">\r\n                        <thead>\r\n                          <tr>\r\n                            <td colspan=\"2\" style=\"text-align: justify;\">\r\n                              <p style=\"font-size: 16px\"><strong>Hi {customer_name},</strong></p>\r\n                              <p style=\"font-size: 16px\" style=\"line-height: 2rem; text-align: justify;\">Thank you for your order. Here’s a brief overview of your\r\n                                invoice.<br />\r\n                                Please, take a careful look-</p>\r\n                            </td>\r\n                          </tr>\r\n                          <tr>\r\n                            <td style=\"height:35px;\"></td>\r\n                          </tr>\r\n                          <tr>\r\n                            <th style=\"text-align:left; font-size: 16px\">{company_name}</th>\r\n                          </tr>\r\n                        </thead>\r\n                        <tbody>\r\n                          <tr>\r\n                            <td style=\"height:35px;\"></td>\r\n                          </tr>\r\n                          <tr>\r\n                            <td colspan=\"2\" style=\"border: solid 1px #ddd; padding:10px 20px;\">\r\n                              <p style=\"font-size:16px;margin:0 0 10px 0;\"><span style=\"font-weight:bold;display:inline-block;min-width:150px\">Order status:</span><b style=\"color:green;font-weight:normal;margin:0\">Success</b></p>\r\n                              <p style=\"font-size:16px;margin:0 0 10px 0;\"><span style=\"font-weight:bold;display:inline-block;min-width:146px\">Invoice No:</span>\r\n                                {invoice_reference_no}</p>\r\n                              <p style=\"font-size:16px;margin:0 0 10px 0;\"><span style=\"font-weight:bold;display:inline-block;min-width:146px\">Name:</span> {customer_name}\r\n                              </p>\r\n                              <p style=\"font-size:16px;margin:0 0 10px 0;\"><span style=\"font-weight:bold;display:inline-block;min-width:146px\">Grand Total:</span>\r\n                                {currency}{total_amount}</p>\r\n                              <p style=\"font-size:16px;margin:0 0 10px 0;\"><span style=\"font-weight:bold;display:inline-block;min-width:146px\">Due Date:</span>\r\n                                {due_date}</p>\r\n                            </td>\r\n                          </tr>\r\n                          <tr style=\"margin: 0; padding: 0;\">\r\n                            <td colspan=\"2\">\r\n                              <p style=\"margin-top: 20px; font-size: 16px; line-height: 1.5rem;  text-align: justify;\">Please go to the admin panel, open\r\n                                your\r\n                                customer entity to view the details and pay the due amount by <strong style=\"color: red\">{due_date}</strong>. If you have any confusion, feel free to contact by just replying\r\n                                this email.</p>\r\n\r\n                              <p style=\"font-size:16px;margin:0 0 10px 0;\"><span style=\"font-weight:bold;font-size:16px;display:inline-block;min-width:146px;\"><u>Address:</u> \r\n                                </span></p>\r\n                                <p style=\"font-size: 16px\">\r\n                                {billing_street}, {billing_city}, {billing_state}, {billing_zip_code},\r\n                                {billing_country}</p>\r\n                              <p style=\"font-size: 16px\">To view the invioces, click on the below button:</p>\r\n                              <p style=\"font-size:16px;margin-top:50px;\"><strong>Regards,</strong></p>\r\n                              <p style=\"font-size:16px;\">{company_name}</p>\r\n                              <br />\r\n                            </td>\r\n                          </tr>\r\n                          <tr>\r\n                            <td colspan=\"2\">\r\n                              <p style=\"font-size:16px; line-height: 1.5rem; text-align:justify\"><strong>Disclaimer:</strong> This\r\n                                confidential email with attached files are intended to use for the selected individual merely. If you got\r\n                                this message wrongly or you are not the addressee of this concern, kindly erase this information from your\r\n                                folder and inform us through a kind reply. Please, do not proclaim or copy this email to any other entity.\r\n                              </p>\r\n                              <br />\r\n                              <hr>\r\n                              <p style=\"text-align: center;\">©{company_name}, all rights reserved</p>\r\n                            </td>\r\n                          </tr>\r\n                        </tbody>\r\n                      </table>\r\n                    </body>\r\n                </html>','en','email',1),(3,5,'Your Quotation # {order_reference_no} from {company_name} has been created.','<html>\r\n                    <head>\r\n                        <link href=\"https://fonts.googleapis.com/css2?family=Open+Sans+Condensed:wght@300&display=swap\" rel=\"stylesheet\">\r\n                    </head>\r\n\r\n                    <body\r\n                        style=\"background-color:#e2e1e0;font-family: Open Sans, sans-serif;font-size:100%;font-weight:400;line-height:1.4;color:#000;\">\r\n                        <table style=\"max-width:670px;margin:50px auto 10px;border: 1px solid black;background-color:#fff;padding:50px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;-webkit-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);-moz-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24); border-top: solid 10px green;\">\r\n                            <thead>\r\n                                <tr>\r\n                                    <td colspan=\"2\">\r\n                                        <p><strong>Hi {customer_name},</strong></p>\r\n                                        <p style=\"line-height: 2rem; text-align: justify;\">Thank you for your order. Here’s a brief overview of your Quotation\r\n                                            #{order_reference_no} that was created on {order_date}.</p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"height:35px;\" colspan=\"2\"></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <th style=\"text-align:left;\">{company_name}</th>\r\n                                    <th style=\"text-align:right;font-weight:400;\">{order_date}</th>\r\n                                </tr>\r\n                            </thead>\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td style=\"height:35px;\"></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td colspan=\"2\" style=\"border: solid 1px #ddd; padding:10px 20px;\">\r\n                                        <p style=\"font-size:14px;margin:0 0 10px 0;\">\r\n                                            <span style=\"font-weight:bold;display:inline-block;min-width:150px\">Order status:</span>\r\n                                            <b style=\"color:green;font-weight:normal;margin:0\">Success</b>\r\n                                        </p>\r\n                                        <p style=\"font-size:14px;margin:0 0 10px 0;\">\r\n                                            <span style=\"font-weight:bold;display:inline-block;min-width:146px\">Reference No:</span>\r\n                                            {order_reference_no}\r\n                                        </p>\r\n                                        <p style=\"font-size:14px;margin:0 0 10px 0;\">\r\n                                            <span style=\"font-weight:bold;display:inline-block;min-width:146px\">Name:</span>\r\n                                            {customer_name}\r\n                                        </p>\r\n                                        <p style=\"font-size:14px;margin:0 0 10px 0;\">\r\n                                            <span style=\"font-weight:bold;display:inline-block;min-width:146px\">Total amount:</span>\r\n                                            {currency}{total_amount}\r\n                                        </p>\r\n                                        <p style=\"font-size:14px;margin:0 0 10px 0;\">\r\n                                            <span style=\"font-weight:bold;display:inline-block;min-width:146px\">Billing Address:</span>\r\n                                            {billing_street}, {billing_city}, {billing_state},\r\n                                        </p>\r\n                                        <p style=\"font-size:14px;margin:0 0 10px 0;\">\r\n                                            <span style=\"font-weight:bold;display:inline-block;min-width:146px\"></span> {billing_zip_code},\r\n                                            {billing_country}\r\n                                        </p>\r\n                                    </td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td colspan=\"2\">\r\n                                        <p style=\"margin-top: 20px;\">If you have any questions, please feel free to reply to this email.</p>\r\n                                        <p><strong>Regards,</strong></p>\r\n                                        <p>{company_name}</p>\r\n                                        <br />\r\n                                        <hr>\r\n                                        <p style=\"text-align: center;\">©{company_name}, all rights reserved</p>\r\n                                    </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </body>\r\n                </html>','en','email',1),(4,6,'A new purchase # {invoice_reference_no} has been created from {company_name}.','<html>\r\n                    <body style=\"background-color:#e2e1e0; font-size:100%;font-weight:400;line-height:1.4;color:#000;\">\r\n                    <table style=\"max-width:700px;margin:50px auto 10px;border: 1px solid black;background-color:#fff;padding:50px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;-webkit-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);-moz-box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24);box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24); border-top: solid 10px #1028d4;\">\r\n                        <thead>\r\n                        <tr>\r\n                            <td colspan=\"2\" style=\"text-align: justify;\">\r\n                                <p style=\"text-align: center;\"></p>\r\n                                <p style=\"font-size: 16px\"><strong>Hi {supplier_name},</strong></p>\r\n                                <p style=\"font-size: 16px\" style=\"line-height: 2rem; text-align: justify;\">A purchase has been made. A brief overview of the purchase is given below,</p>\r\n                                <p><strong>Purchase no:</strong> <span>#{invoice_reference_no}</span></p>\r\n                                <p><strong>Total amount:</strong> <span>{currency}{total_amount}</span></p>\r\n                                <p><strong>Due date:</strong> <span>{due_date}</span></p>\r\n                                <br />\r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td>\r\n                                <p><strong><u>Billing address:</u></strong></p>\r\n                                <p>{billing_street}, {billing_city}, {billing_state}, {billing_zip_code}, {billing_country}</p>\r\n                            </td>\r\n                        </tr>\r\n                        </thead>\r\n                        <tbody>\r\n                        <tr style=\"margin: 0; padding: 0;\">\r\n                            <td>\r\n                            <p style=\"font-size:16px;margin-top:50px;\"><strong>Regards,</strong></p>\r\n                            <p style=\"font-size:16px;\">{company_name}</p>\r\n                            <br />\r\n                            <hr>\r\n                            <p style=\"text-align: center;\">©{company_name}, all rights reserved</p>\r\n                            </td>\r\n                        </tr>\r\n                        </tbody>\r\n                    </table>\r\n                    </body>\r\n                </html>','en','email',1),(5,7,'{ticket_subject} #Ticket ID: {ticket_no}','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n                    <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:v=\"urn:schemas-microsoft-com:vml\">\r\n                        <head>\r\n                            <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/>\r\n                            <meta content=\"width=device-width\" name=\"viewport\"/>\r\n                            <meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\"/>\r\n                            <title>Ticket</title>\r\n                            <style type=\"text/css\">\r\n                                    body {\r\n                                        margin: 0;\r\n                                        padding: 0;\r\n                                    }\r\n                                    table,\r\n                                    td,\r\n                                    tr {\r\n                                        vertical-align: top;\r\n                                        border-collapse: collapse;\r\n                                    }\r\n                                    * {\r\n                                        line-height: inherit;\r\n                                    }\r\n                                    a[x-apple-data-detectors=true] {\r\n                                        color: inherit !important;\r\n                                        text-decoration: none !important;\r\n                                    }\r\n                                    .myButton {\r\n                                        background-color:#1aa19c;\r\n                                        border-radius:5px;\r\n                                        display:inline-block;\r\n                                        cursor:pointer;\r\n                                        color:#ffffff;\r\n                                        font-family:Trebuchet MS;\r\n                                        font-size:17px;\r\n                                        font-weight:bold;\r\n                                        padding:9px 28px;\r\n                                        text-decoration:none;\r\n                                        text-shadow:0px 1px 2px #3d768a;\r\n                                    }\r\n                                    .myButton:hover {\r\n                                        background-color:#408c99;\r\n                                    }\r\n                                    .myButton:active {\r\n                                        position:relative;\r\n                                        top:1px;\r\n                                    }\r\n                            </style>\r\n                            <style id=\"media-query\" type=\"text/css\">\r\n                                    @media (max-width: 660px) {\r\n                                        .block-grid,\r\n                                        .col {\r\n                                            min-width: 320px !important;\r\n                                            max-width: 100% !important;\r\n                                            display: block !important;\r\n                                        }\r\n                                        .block-grid {\r\n                                            width: 100% !important;\r\n                                        }\r\n                                        .col {\r\n                                            width: 100% !important;\r\n                                        }\r\n                                        .col>div {\r\n                                            margin: 0 auto;\r\n                                        }\r\n                                        img.fullwidth,\r\n                                        img.fullwidthOnMobile {\r\n                                            max-width: 100% !important;\r\n                                        }\r\n                                        .no-stack .col {\r\n                                            min-width: 0 !important;\r\n                                            display: table-cell !important;\r\n                                        }\r\n                                        .no-stack.two-up .col {\r\n                                            width: 50% !important;\r\n                                        }\r\n                                        .no-stack .col.num4 {\r\n                                            width: 33% !important;\r\n                                        }\r\n                                        .no-stack .col.num8 {\r\n                                            width: 66% !important;\r\n                                        }\r\n                                        .no-stack .col.num4 {\r\n                                            width: 33% !important;\r\n                                        }\r\n                                        .no-stack .col.num3 {\r\n                                            width: 25% !important;\r\n                                        }\r\n                                        .no-stack .col.num6 {\r\n                                            width: 50% !important;\r\n                                        }\r\n                                        .no-stack .col.num9 {\r\n                                            width: 75% !important;\r\n                                        }\r\n                                        .video-block {\r\n                                            max-width: none !important;\r\n                                        }\r\n                                        .mobile_hide {\r\n                                            min-height: 0px;\r\n                                            max-height: 0px;\r\n                                            max-width: 0px;\r\n                                            display: none;\r\n                                            overflow: hidden;\r\n                                            font-size: 0px;\r\n                                        }\r\n                                        .desktop_hide {\r\n                                            display: block !important;\r\n                                            max-height: none !important;\r\n                                        }\r\n                                    }\r\n\r\n                            </style>\r\n                        </head>\r\n                        <body class=\"clean-body\" style=\"margin: 0; padding: 0; -webkit-text-size-adjust: 100%; background-color: #f8f8f9;\">\r\n                            <table bgcolor=\"#f8f8f9\" cellpadding=\"0\" cellspacing=\"0\" class=\"nl-container\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; min-width: 320px; Margin: 0 auto; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f8f8f9; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                <tbody>\r\n                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                        <td style=\"word-break: break-word; vertical-align: top;\" valign=\"top\">\r\n                                            <div style=\"background-color:transparent;\">\r\n                                                <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                                    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                        <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                            <div style=\"width:100% !important;\">\r\n                                                                <div style=\"color:#555555;font-family: Pacifico , cursive;line-height:1.2;padding-top:35px;padding-right:0px;padding-bottom:20px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.2; font-size: 18px; color: #555555; font-family: Pacifico, cursive; mso-line-height-alt: 14px;\">\r\n                                                                        <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: center; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #008080; font-size: 30px;\">{company_name}</span></p>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                            <div style=\"background-color:transparent;\">\r\n                                                <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f3fafa;\">\r\n                                                    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f3fafa;\">\r\n                                                        <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 580px;\">\r\n                                                            <div style=\"width:100% !important;\">\r\n                                                                <!--[if (!mso)&(!IE)]><!-->\r\n                                                                <div style=\"border-top:0px solid transparent; border-left:30px solid #FFFFFF; border-bottom:0px solid transparent; border-right:30px solid #FFFFFF; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                    <!--<![endif]-->\r\n                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                        <tbody>\r\n                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 4px solid #1AA19C; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                        <tbody>\r\n                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 35px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                    <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:15px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                        <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                            <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #2b303a; font-size: 18px;\"><strong>Hello {assignee_name},</strong></span></p>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                    <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:0px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                        <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                            <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #008080; font-size: 18px;\">A new support ticket has been assigned to you.</span></p>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                    <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:0px;padding-right:30px;padding-bottom:20px;padding-left:30px;\">\r\n                                                                        <div style=\"line-height: 1.5; font-size: 16px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                            <p style=\"font-size: 16px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #2b303a; font-size: 18px;\"> {ticket_message} </span></p>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                    <!--[if mso]></td></tr></table><![endif]-->\r\n                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                        <tbody>\r\n                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 25px; padding-bottom: 10px; padding-left: 25px;\" valign=\"top\">\r\n                                                                                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 1px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                    <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:10px;padding-right:10px;padding-bottom:20px;padding-left:25px;\">\r\n                                                                        <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Ticket ID : <span style=\"color: #008080;\"><strong>{ticket_no}</strong></span></span></p>\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Customer ID : <span style=\"color: #008080;\"><strong> {customer_id}</strong></span></span></p>\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Project Name : <span style=\"color: #008080;\"><strong>{project_name}</strong></span></span></p>\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Subject : <span style=\"color: #008080;\"><strong> {ticket_subject}</strong></span></span></p>\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Status : <span style=\"color: #008080;\"><strong> {ticket_status}</strong></span></span></p>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                    <div style=\"text-align: center; width: 100%;\">\r\n                                                                        <a href=\"{details}\" class=\"myButton\" style=\"color: #ffffff\">View Tickets</a>\r\n                                                                    </div>\r\n                                                                <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:20px;padding-right:30px;padding-bottom:40px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">Thank you,</span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">{assigned_by_whom}</span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">{company_name}</span></p>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                            <!--<![endif]-->\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                            <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                <!--<![endif]-->\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 60px; padding-right: 0px; padding-bottom: 12px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                                <!--[if (!mso)&(!IE)]><!-->\r\n                                                            </div>\r\n                                                            <!--<![endif]-->\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f8f8f9;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f8f8f9;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                            <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:5px; padding-bottom:5px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                <!--<![endif]-->\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 20px; padding-right: 20px; padding-bottom: 20px; padding-left: 20px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </body>\r\n                </html>','en','email',1),(6,8,'{ticket_subject} #Ticket ID: {ticket_no}','                  <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n                    <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:v=\"urn:schemas-microsoft-com:vml\">\r\n                        <head>\r\n                            <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/>\r\n                            <meta content=\"width=device-width\" name=\"viewport\"/>\r\n                            <meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\"/>\r\n                            <title>Ticket</title>\r\n                            <style type=\"text/css\">\r\n                                    body {\r\n                                        margin: 0;\r\n                                        padding: 0;\r\n                                    }\r\n                                    table,\r\n                                    td,\r\n                                    tr {\r\n                                        vertical-align: top;\r\n                                        border-collapse: collapse;\r\n                                    }\r\n                                    * {\r\n                                        line-height: inherit;\r\n                                    }\r\n                                    a[x-apple-data-detectors=true] {\r\n                                        color: inherit !important;\r\n                                        text-decoration: none !important;\r\n                                    }\r\n                                    .myButton {\r\n                                        background-color:#1aa19c;\r\n                                        border-radius:5px;\r\n                                        display:inline-block;\r\n                                        cursor:pointer;\r\n                                        color:#ffffff;\r\n                                        font-family:Trebuchet MS;\r\n                                        font-size:17px;\r\n                                        font-weight:bold;\r\n                                        padding:9px 28px;\r\n                                        text-decoration:none;\r\n                                        text-shadow:0px 1px 2px #3d768a;\r\n                                    }\r\n                                    .myButton:hover {\r\n                                        background-color:#408c99;\r\n                                    }\r\n                                    .myButton:active {\r\n                                        position:relative;\r\n                                        top:1px;\r\n                                    }\r\n                            </style>\r\n                            <style id=\"media-query\" type=\"text/css\">\r\n                                    @media (max-width: 660px) {\r\n                                        .block-grid,\r\n                                        .col {\r\n                                            min-width: 320px !important;\r\n                                            max-width: 100% !important;\r\n                                            display: block !important;\r\n                                        }\r\n                                        .block-grid {\r\n                                            width: 100% !important;\r\n                                        }\r\n                                        .col {\r\n                                            width: 100% !important;\r\n                                        }\r\n                                        .col>div {\r\n                                            margin: 0 auto;\r\n                                        }\r\n                                        img.fullwidth,\r\n                                        img.fullwidthOnMobile {\r\n                                            max-width: 100% !important;\r\n                                        }\r\n                                        .no-stack .col {\r\n                                            min-width: 0 !important;\r\n                                            display: table-cell !important;\r\n                                        }\r\n                                        .no-stack.two-up .col {\r\n                                            width: 50% !important;\r\n                                        }\r\n                                        .no-stack .col.num4 {\r\n                                            width: 33% !important;\r\n                                        }\r\n                                        .no-stack .col.num8 {\r\n                                            width: 66% !important;\r\n                                        }\r\n                                        .no-stack .col.num4 {\r\n                                            width: 33% !important;\r\n                                        }\r\n                                        .no-stack .col.num3 {\r\n                                            width: 25% !important;\r\n                                        }\r\n                                        .no-stack .col.num6 {\r\n                                            width: 50% !important;\r\n                                        }\r\n                                        .no-stack .col.num9 {\r\n                                            width: 75% !important;\r\n                                        }\r\n                                        .video-block {\r\n                                            max-width: none !important;\r\n                                        }\r\n                                        .mobile_hide {\r\n                                            min-height: 0px;\r\n                                            max-height: 0px;\r\n                                            max-width: 0px;\r\n                                            display: none;\r\n                                            overflow: hidden;\r\n                                            font-size: 0px;\r\n                                        }\r\n                                        .desktop_hide {\r\n                                            display: block !important;\r\n                                            max-height: none !important;\r\n                                        }\r\n                                    }\r\n\r\n                            </style>\r\n                        </head>\r\n                        <body class=\"clean-body\" style=\"margin: 0; padding: 0; -webkit-text-size-adjust: 100%; background-color: #f8f8f9;\">\r\n                            <table bgcolor=\"#f8f8f9\" cellpadding=\"0\" cellspacing=\"0\" class=\"nl-container\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; min-width: 320px; Margin: 0 auto; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f8f8f9; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                <tbody>\r\n                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                        <td style=\"word-break: break-word; vertical-align: top;\" valign=\"top\">\r\n                                            <div style=\"background-color:transparent;\">\r\n                                                <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                                    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                        <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                            <div style=\"width:100% !important;\">\r\n                                                                <div style=\"color:#555555;font-family: Pacifico, cursive;line-height:1.2;padding-top:35px;padding-right:0px;padding-bottom:20px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.2; font-size: 18px; color: #555555; font-family: Pacifico, cursive; mso-line-height-alt: 14px;\">\r\n                                                                        <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: center; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #008080; font-size: 30px;\">{company_name}</span></p>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                            <div style=\"background-color:transparent;\">\r\n                                                <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f3fafa;\">\r\n                                                    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f3fafa;\">\r\n                                                        <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 580px;\">\r\n                                                            <div style=\"width:100% !important;\">\r\n                                                                <!--[if (!mso)&(!IE)]><!-->\r\n                                                                <div style=\"border-top:0px solid transparent; border-left:30px solid #FFFFFF; border-bottom:0px solid transparent; border-right:30px solid #FFFFFF; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                    <!--<![endif]-->\r\n                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                        <tbody>\r\n                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 4px solid #1AA19C; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                        <tbody>\r\n                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 35px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                    <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:15px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                        <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                            <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #2b303a; font-size: 18px;\"><strong>Hello, {customer_name}</strong></span></p>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                    <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:0px;padding-right:30px;padding-bottom:40px;padding-left:30px;\">\r\n                                                                        <div style=\"line-height: 1.5; font-size: 16px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                            <p style=\"font-size: 16px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #2b303a; font-size: 18px;\"> {ticket_message} </span></p>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                    <!--[if mso]></td></tr></table><![endif]-->\r\n                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                        <tbody>\r\n                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 25px; padding-bottom: 10px; padding-left: 25px;\" valign=\"top\">\r\n                                                                                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 1px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                    <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:10px;padding-right:10px;padding-bottom:20px;padding-left:25px;\">\r\n                                                                        <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Ticket ID : <span style=\"color: #008080;\"><strong>{ticket_no}</strong></span></span></p>\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Project Name : <span style=\"color: #008080;\"><strong>{project_name}</strong></span></span></p>\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Subject : <span style=\"color: #008080;\"><strong> {ticket_subject}</strong></span></span></p>\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Status : <span style=\"color: #008080;\"><strong> {ticket_status}</strong></span></span></p>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                    <div style=\"text-align: center; width: 100%;\">\r\n                                                                        <a href=\"{details}\" class=\"myButton\" style=\"color: #ffffff\">View Tickets</a>\r\n                                                                    </div>\r\n                                                                <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:20px;padding-right:30px;padding-bottom:40px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">Thank you,</span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">{team_member}</span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">{company_name}</span></p>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                            <!--<![endif]-->\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                            <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                <!--<![endif]-->\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 60px; padding-right: 0px; padding-bottom: 12px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                                <!--[if (!mso)&(!IE)]><!-->\r\n                                                            </div>\r\n                                                            <!--<![endif]-->\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f8f8f9;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f8f8f9;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                            <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:5px; padding-bottom:5px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                <!--<![endif]-->\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 20px; padding-right: 20px; padding-bottom: 20px; padding-left: 20px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </body>\r\n                    </html>','en','email',1),(7,9,'{ticket_subject} #Ticket ID: {ticket_no}','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n                    <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:v=\"urn:schemas-microsoft-com:vml\">\r\n                        <head>\r\n                            <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/>\r\n                            <meta content=\"width=device-width\" name=\"viewport\"/>\r\n                            <meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\"/>\r\n                            <title>Ticket</title>\r\n                            <style type=\"text/css\">\r\n                                    body {\r\n                                        margin: 0;\r\n                                        padding: 0;\r\n                                    }\r\n                                    table,\r\n                                    td,\r\n                                    tr {\r\n                                        vertical-align: top;\r\n                                        border-collapse: collapse;\r\n                                    }\r\n                                    * {\r\n                                        line-height: inherit;\r\n                                    }\r\n                                    a[x-apple-data-detectors=true] {\r\n                                        color: inherit !important;\r\n                                        text-decoration: none !important;\r\n                                    }\r\n                                    .myButton {\r\n                                        background-color:#1aa19c;\r\n                                        border-radius:5px;\r\n                                        display:inline-block;\r\n                                        cursor:pointer;\r\n                                        color:#ffffff;\r\n                                        font-family:Trebuchet MS;\r\n                                        font-size:17px;\r\n                                        font-weight:bold;\r\n                                        padding:9px 28px;\r\n                                        text-decoration:none;\r\n                                        text-shadow:0px 1px 2px #3d768a;\r\n                                    }\r\n                                    .myButton:hover {\r\n                                        background-color:#408c99;\r\n                                    }\r\n                                    .myButton:active {\r\n                                        position:relative;\r\n                                        top:1px;\r\n                                    }\r\n                            </style>\r\n                            <style id=\"media-query\" type=\"text/css\">\r\n                                    @media (max-width: 660px) {\r\n                                        .block-grid,\r\n                                        .col {\r\n                                            min-width: 320px !important;\r\n                                            max-width: 100% !important;\r\n                                            display: block !important;\r\n                                        }\r\n                                        .block-grid {\r\n                                            width: 100% !important;\r\n                                        }\r\n                                        .col {\r\n                                            width: 100% !important;\r\n                                        }\r\n                                        .col>div {\r\n                                            margin: 0 auto;\r\n                                        }\r\n                                        img.fullwidth,\r\n                                        img.fullwidthOnMobile {\r\n                                            max-width: 100% !important;\r\n                                        }\r\n                                        .no-stack .col {\r\n                                            min-width: 0 !important;\r\n                                            display: table-cell !important;\r\n                                        }\r\n                                        .no-stack.two-up .col {\r\n                                            width: 50% !important;\r\n                                        }\r\n                                        .no-stack .col.num4 {\r\n                                            width: 33% !important;\r\n                                        }\r\n                                        .no-stack .col.num8 {\r\n                                            width: 66% !important;\r\n                                        }\r\n                                        .no-stack .col.num4 {\r\n                                            width: 33% !important;\r\n                                        }\r\n                                        .no-stack .col.num3 {\r\n                                            width: 25% !important;\r\n                                        }\r\n                                        .no-stack .col.num6 {\r\n                                            width: 50% !important;\r\n                                        }\r\n                                        .no-stack .col.num9 {\r\n                                            width: 75% !important;\r\n                                        }\r\n                                        .video-block {\r\n                                            max-width: none !important;\r\n                                        }\r\n                                        .mobile_hide {\r\n                                            min-height: 0px;\r\n                                            max-height: 0px;\r\n                                            max-width: 0px;\r\n                                            display: none;\r\n                                            overflow: hidden;\r\n                                            font-size: 0px;\r\n                                        }\r\n                                        .desktop_hide {\r\n                                            display: block !important;\r\n                                            max-height: none !important;\r\n                                        }\r\n                                    }\r\n\r\n                            </style>\r\n                        </head>\r\n                        <body class=\"clean-body\" style=\"margin: 0; padding: 0; -webkit-text-size-adjust: 100%; background-color: #f8f8f9;\">\r\n                            <table bgcolor=\"#f8f8f9\" cellpadding=\"0\" cellspacing=\"0\" class=\"nl-container\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; min-width: 320px; Margin: 0 auto; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f8f8f9; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                <tbody>\r\n                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                        <td style=\"word-break: break-word; vertical-align: top;\" valign=\"top\">\r\n                                            <div style=\"background-color:transparent;\">\r\n                                                <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                                    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                        <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                            <div style=\"width:100% !important;\">\r\n                                                                <div style=\"color:#555555;font-family: Pacifico, cursive;line-height:1.2;padding-top:35px;padding-right:0px;padding-bottom:20px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.2; font-size: 18px; color: #555555; font-family: Pacifico, cursive; mso-line-height-alt: 14px;\">\r\n                                                                        <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: center; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #008080; font-size: 30px;\">{company_name}</span></p>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                            <div style=\"background-color:transparent;\">\r\n                                                <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f3fafa;\">\r\n                                                    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f3fafa;\">\r\n                                                        <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 580px;\">\r\n                                                            <div style=\"width:100% !important;\">\r\n                                                                <!--[if (!mso)&(!IE)]><!-->\r\n                                                                <div style=\"border-top:0px solid transparent; border-left:30px solid #FFFFFF; border-bottom:0px solid transparent; border-right:30px solid #FFFFFF; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                    <!--<![endif]-->\r\n                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                        <tbody>\r\n                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 4px solid #1AA19C; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                        <tbody>\r\n                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 35px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                    <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:15px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                        <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                            <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #2b303a; font-size: 18px;\"><strong>Hello {member_name},</strong></span></p>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                    <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:0px;padding-right:30px;padding-bottom:20px;padding-left:30px;\">\r\n                                                                        <div style=\"line-height: 1.5; font-size: 16px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                            <p style=\"font-size: 16px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #2b303a; font-size: 18px;\"> {ticket_message} </span></p>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                    <!--[if mso]></td></tr></table><![endif]-->\r\n                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                        <tbody>\r\n                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 25px; padding-bottom: 10px; padding-left: 25px;\" valign=\"top\">\r\n                                                                                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 1px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                    <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:10px;padding-right:10px;padding-bottom:20px;padding-left:25px;\">\r\n                                                                        <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Ticket ID : <span style=\"color: #008080;\"><strong>{ticket_no}</strong></span></span></p>\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Project Name : <span style=\"color: #008080;\"><strong>{project_name}</strong></span></span></p>\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Subject : <span style=\"color: #008080;\"><strong> {ticket_subject}</strong></span></span></p>\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Status : <span style=\"color: #008080;\"><strong> {ticket_status}</strong></span></span></p>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                    <div style=\"text-align: center; width: 100%;\">\r\n                                                                        <a href=\"{details}\" class=\"myButton\" style=\"color: #ffffff\">View Tickets</a>\r\n                                                                    </div>\r\n                                                                <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:20px;padding-right:30px;padding-bottom:40px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">Thank you,</span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">{customer_name}</span></p>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                            <!--<![endif]-->\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                            <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                <!--<![endif]-->\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 60px; padding-right: 0px; padding-bottom: 12px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                                <!--[if (!mso)&(!IE)]><!-->\r\n                                                            </div>\r\n                                                            <!--<![endif]-->\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f8f8f9;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f8f8f9;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                            <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:5px; padding-bottom:5px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                <!--<![endif]-->\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 20px; padding-right: 20px; padding-bottom: 20px; padding-left: 20px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </body>\r\n                </html>','en','email',1),(8,10,'New Task Assigned #{task_name}.','<!DOCTYPE html\r\n                PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n                <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\"\r\n                xmlns:v=\"urn:schemas-microsoft-com:vml\">\r\n            \r\n                <head>\r\n                    <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\" />\r\n                    <meta content=\"width=device-width\" name=\"viewport\" />\r\n                    <meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\" />\r\n                    <title>Task</title>\r\n                    <style type=\"text/css\">\r\n                        body {\r\n                            margin: 0;\r\n                            padding: 0;\r\n                        }\r\n                \r\n                        table,\r\n                        td,\r\n                        tr {\r\n                            vertical-align: top;\r\n                            border-collapse: collapse;\r\n                        }\r\n                \r\n                        * {\r\n                            line-height: inherit;\r\n                        }\r\n                \r\n                        a[x-apple-data-detectors=true] {\r\n                            color: inherit !important;\r\n                            text-decoration: none !important;\r\n                        }\r\n                \r\n                        .myButton {\r\n                            background-color: #1aa19c;\r\n                            border-radius: 5px;\r\n                            display: inline-block;\r\n                            cursor: pointer;\r\n                            color: #ffffff;\r\n                            font-family: Trebuchet MS;\r\n                            font-size: 17px;\r\n                            font-weight: bold;\r\n                            padding: 9px 28px;\r\n                            text-decoration: none;\r\n                            text-shadow: 0px 1px 2px #3d768a;\r\n                        }\r\n                \r\n                        .myButton:hover {\r\n                            background-color: #408c99;\r\n                        }\r\n                \r\n                        .myButton:active {\r\n                            position: relative;\r\n                            top: 1px;\r\n                        }\r\n                    </style>\r\n                    <style id=\"media-query\" type=\"text/css\">\r\n                        @media (max-width: 660px) {\r\n                \r\n                            .block-grid,\r\n                            .col {\r\n                                min-width: 320px !important;\r\n                                max-width: 100% !important;\r\n                                display: block !important;\r\n                            }\r\n                \r\n                            .block-grid {\r\n                                width: 100% !important;\r\n                            }\r\n                \r\n                            .col {\r\n                                width: 100% !important;\r\n                            }\r\n                \r\n                            .col>div {\r\n                                margin: 0 auto;\r\n                            }\r\n                \r\n                            img.fullwidth,\r\n                            img.fullwidthOnMobile {\r\n                                max-width: 100% !important;\r\n                            }\r\n                \r\n                            .no-stack .col {\r\n                                min-width: 0 !important;\r\n                                display: table-cell !important;\r\n                            }\r\n                \r\n                            .no-stack.two-up .col {\r\n                                width: 50% !important;\r\n                            }\r\n                \r\n                            .no-stack .col.num4 {\r\n                                width: 33% !important;\r\n                            }\r\n                \r\n                            .no-stack .col.num8 {\r\n                                width: 66% !important;\r\n                            }\r\n                \r\n                            .no-stack .col.num4 {\r\n                                width: 33% !important;\r\n                            }\r\n                \r\n                            .no-stack .col.num3 {\r\n                                width: 25% !important;\r\n                            }\r\n                \r\n                            .no-stack .col.num6 {\r\n                                width: 50% !important;\r\n                            }\r\n                \r\n                            .no-stack .col.num9 {\r\n                                width: 75% !important;\r\n                            }\r\n                \r\n                            .video-block {\r\n                                max-width: none !important;\r\n                            }\r\n                \r\n                            .mobile_hide {\r\n                                min-height: 0px;\r\n                                max-height: 0px;\r\n                                max-width: 0px;\r\n                                display: none;\r\n                                overflow: hidden;\r\n                                font-size: 0px;\r\n                            }\r\n                \r\n                            .desktop_hide {\r\n                                display: block !important;\r\n                                max-height: none !important;\r\n                            }\r\n                        }\r\n                    </style>\r\n                </head>\r\n            \r\n                <body class=\"clean-body\" style=\"margin: 0; padding: 0; -webkit-text-size-adjust: 100%; background-color: #f8f8f9;\">\r\n                    <table bgcolor=\"#f8f8f9\" cellpadding=\"0\" cellspacing=\"0\" class=\"nl-container\" role=\"presentation\"\r\n                        style=\"table-layout: fixed; vertical-align: top; min-width: 320px; Margin: 0 auto; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f8f8f9; width: 100%;\"\r\n                        valign=\"top\" width=\"100%\">\r\n                        <tbody>\r\n                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                <td style=\"word-break: break-word; vertical-align: top;\" valign=\"top\">\r\n                                    <div style=\"background-color:transparent;\">\r\n                                        <div class=\"block-grid\"\r\n                                            style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                            <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                <div class=\"col num12\"\r\n                                                    style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                    <div style=\"width:100% !important;\">\r\n                                                        <div style=\"color:#555555;font-family:\" Pacifico\",\r\n                                                            cursive;line-height:1.2;padding-top:35px;padding-right:0px;padding-bottom:20px;padding-left:30px;\">\r\n                                                            <div style=\"line-height: 1.2; font-size: 18px; color: #555555; font-family: \"\r\n                                                                Pacifico\", cursive; mso-line-height-alt: 14px;\">\r\n                                                                <p\r\n                                                                    style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: center; mso-line-height-alt: 22px; margin: 0;\">\r\n                                                                    <span style=\"color: #008080; font-size: 30px;\">{company_name}</span>\r\n                                                                </p>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                    <div style=\"background-color:transparent;\">\r\n                                        <div class=\"block-grid\"\r\n                                            style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f3fafa;\">\r\n                                            <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f3fafa;\">\r\n                                                <div class=\"col num12\"\r\n                                                    style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 580px;\">\r\n                                                    <div style=\"width:100% !important;\">\r\n                                                        <!--[if (!mso)&(!IE)]><!-->\r\n                                                        <div\r\n                                                            style=\"border-top:0px solid transparent; border-left:30px solid #FFFFFF; border-bottom:0px solid transparent; border-right:30px solid #FFFFFF; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                            <!--<![endif]-->\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\"\r\n                                                                role=\"presentation\"\r\n                                                                style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\"\r\n                                                                valign=\"top\" width=\"100%\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                        <td class=\"divider_inner\"\r\n                                                                            style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\"\r\n                                                                            valign=\"top\">\r\n                                                                            <table align=\"center\" border=\"0\" cellpadding=\"0\"\r\n                                                                                cellspacing=\"0\" class=\"divider_content\"\r\n                                                                                role=\"presentation\"\r\n                                                                                style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 4px solid #1AA19C; width: 100%;\"\r\n                                                                                valign=\"top\" width=\"100%\">\r\n                                                                                <tbody>\r\n                                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                        <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\"\r\n                                                                                            valign=\"top\"><span></span></td>\r\n                                                                                    </tr>\r\n                                                                                </tbody>\r\n                                                                            </table>\r\n                                                                        </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\"\r\n                                                                role=\"presentation\"\r\n                                                                style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\"\r\n                                                                valign=\"top\" width=\"100%\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                        <td class=\"divider_inner\"\r\n                                                                            style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 35px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\"\r\n                                                                            valign=\"top\">\r\n                                                                            <table align=\"center\" border=\"0\" cellpadding=\"0\"\r\n                                                                                cellspacing=\"0\" class=\"divider_content\"\r\n                                                                                role=\"presentation\"\r\n                                                                                style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\"\r\n                                                                                valign=\"top\" width=\"100%\">\r\n                                                                                <tbody>\r\n                                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                        <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\"\r\n                                                                                            valign=\"top\"><span></span></td>\r\n                                                                                    </tr>\r\n                                                                                </tbody>\r\n                                                                            </table>\r\n                                                                        </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                            <div\r\n                                                                style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:15px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                <div\r\n                                                                    style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                    <p\r\n                                                                        style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\">\r\n                                                                        <span style=\"color: #2b303a; font-size: 18px;\"><strong>Hello\r\n                                                                                {assignee_name},</strong></span></p>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                            <div\r\n                                                                style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:0px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                <div\r\n                                                                    style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                    <p\r\n                                                                        style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0; padding-right: 5%; text-align: justify \">\r\n                                                                        <span style=\"color: #008080; font-size: 18px;\">A new support\r\n                                                                            task has been assigned to you. Here is a brief overview of\r\n                                                                            the task. Please have a look.</span></p><br />\r\n                                                                </div>\r\n                                                            </div>\r\n                                                            <!--[if mso]></td></tr></table><![endif]-->\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\"\r\n                                                                role=\"presentation\"\r\n                                                                style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\"\r\n                                                                valign=\"top\" width=\"100%\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                        <td class=\"divider_inner\"\r\n                                                                            style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 25px; padding-bottom: 10px; padding-left: 25px;\"\r\n                                                                            valign=\"top\">\r\n                                                                            <table align=\"center\" border=\"0\" cellpadding=\"0\"\r\n                                                                                cellspacing=\"0\" class=\"divider_content\"\r\n                                                                                role=\"presentation\"\r\n                                                                                style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 1px solid #BBBBBB; width: 100%;\"\r\n                                                                                valign=\"top\" width=\"100%\">\r\n                                                                                <tbody>\r\n                                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                        <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\"\r\n                                                                                            valign=\"top\"><span></span></td>\r\n                                                                                    </tr>\r\n                                                                                </tbody>\r\n                                                                            </table>\r\n                                                                        </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                            <div\r\n                                                                style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:10px;padding-right:10px;padding-bottom:20px;padding-left:25px;\">\r\n                                                                <div\r\n                                                                    style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                    <p\r\n                                                                        style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\">\r\n                                                                        <u><b>Task Details:</b></u></p>\r\n                                                                    <p\r\n                                                                        style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\">\r\n                                                                        <span style=\"font-size: 15px;\">Task Name: <span\r\n                                                                                style=\"color: #555555;\"><strong>\r\n                                                                                    {task_name}</strong></span></span></p>\r\n                                                                    <p\r\n                                                                        style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\">\r\n                                                                        <span style=\"font-size: 15px;\">Task Details: <span\r\n                                                                                style=\"color: #555555;\"><strong>\r\n                                                                                    {task_details}</strong></span></span></p>\r\n                                                                    <p\r\n                                                                        style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\">\r\n                                                                        <span style=\"font-size: 15px;\">Start Date: <span\r\n                                                                                style=\"color: #555555;\"><strong>\r\n                                                                                    {start_date}</strong></span></span></p>\r\n                                                                    <p\r\n                                                                        style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\">\r\n                                                                        <span style=\"font-size: 15px;\">Due Date: <span\r\n                                                                                style=\"color: #555555;\"><strong>\r\n                                                                                    {due_date}</strong></span></span></p>\r\n                                                                    <p\r\n                                                                        style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\">\r\n                                                                        <span style=\"font-size: 15px;\">Priority: <span\r\n                                                                                style=\"color: #555555;\"><strong>\r\n                                                                                    {priority}</strong></span></span></p>\r\n                                                                    <p\r\n                                                                        style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\">\r\n                                                                        <span style=\"font-size: 15px;\">Checklist: <span\r\n                                                                                style=\"color: #555555;\"><strong>\r\n                                                                                    {task_checklist}</strong></span></span></p>\r\n                                                                    <p\r\n                                                                        style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\">\r\n                                                                        <span style=\"font-size: 15px;\">Status: <span\r\n                                                                                style=\"color: #555555;\"><strong>\r\n                                                                                    {ticket_status}</strong></span></span></p>\r\n                                                                </div>\r\n                                                                <div>\r\n                                                                    <p\r\n                                                                        style=\"font-size: 15px; padding-top: 3%; line-height: 1; word-break: break-word; text-align: center; mso-line-height-alt: 22px; margin: 0;font-family: inherit;\">\r\n                                                                        <span\r\n                                                                            style=\"color: black; font-size: 18px; line-height: 1rem;\">You\r\n                                                                            can go to the task by clicking the following button.</span>\r\n                                                                    </p>\r\n                                                                    <div style=\"text-align: center; width: 100%; padding-top: 3%;\">\r\n                                                                        <a href=\"{task_link}\" class=\"myButton\"\r\n                                                                            style=\"color: #ffffff\">View Task</a>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                            <div\r\n                                                                style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:20px;padding-right:30px;padding-bottom:40px;padding-left:30px;\">\r\n                                                                <div\r\n                                                                    style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                    <p\r\n                                                                        style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\">\r\n                                                                        <span style=\"color: #2b303a; font-size: 15px;\">Regards,</span>\r\n                                                                    </p>\r\n                                                                    <p\r\n                                                                        style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\">\r\n                                                                        <span\r\n                                                                            style=\"color: #2b303a; font-size: 15px;\">{company_name}</span>\r\n                                                                    </p>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                        <!--<![endif]-->\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                    <div style=\"background-color:transparent;\">\r\n                                        <div class=\"block-grid\"\r\n                                            style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                            <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                <div class=\"col num12\"\r\n                                                    style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                    <div style=\"width:100% !important;\">\r\n                                                        <!--[if (!mso)&(!IE)]><!-->\r\n                                                        <div\r\n                                                            style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                            <!--<![endif]-->\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\"\r\n                                                                role=\"presentation\"\r\n                                                                style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\"\r\n                                                                valign=\"top\" width=\"100%\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                        <td class=\"divider_inner\"\r\n                                                                            style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 60px; padding-right: 0px; padding-bottom: 12px; padding-left: 0px;\"\r\n                                                                            valign=\"top\">\r\n                                                                            <table align=\"center\" border=\"0\" cellpadding=\"0\"\r\n                                                                                cellspacing=\"0\" class=\"divider_content\"\r\n                                                                                role=\"presentation\"\r\n                                                                                style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\"\r\n                                                                                valign=\"top\" width=\"100%\">\r\n                                                                                <tbody>\r\n                                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                        <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\"\r\n                                                                                            valign=\"top\"><span></span></td>\r\n                                                                                    </tr>\r\n                                                                                </tbody>\r\n                                                                            </table>\r\n                                                                        </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                        </div>\r\n                                                        <!--<![endif]-->\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                    <div style=\"background-color:transparent;\">\r\n                                        <div class=\"block-grid\"\r\n                                            style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f8f8f9;\">\r\n                                            <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f8f8f9;\">\r\n                                                <div class=\"col num12\"\r\n                                                    style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                    <div style=\"width:100% !important;\">\r\n                                                        <!--[if (!mso)&(!IE)]><!-->\r\n                                                        <div\r\n                                                            style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:5px; padding-bottom:5px; padding-right: 0px; padding-left: 0px;\">\r\n                                                            <!--<![endif]-->\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\"\r\n                                                                role=\"presentation\"\r\n                                                                style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\"\r\n                                                                valign=\"top\" width=\"100%\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                        <td class=\"divider_inner\"\r\n                                                                            style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 20px; padding-right: 20px; padding-bottom: 20px; padding-left: 20px;\"\r\n                                                                            valign=\"top\">\r\n                                                                            <table align=\"center\" border=\"0\" cellpadding=\"0\"\r\n                                                                                cellspacing=\"0\" class=\"divider_content\"\r\n                                                                                role=\"presentation\"\r\n                                                                                style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\"\r\n                                                                                valign=\"top\" width=\"100%\">\r\n                                                                                <tbody>\r\n                                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                        <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\"\r\n                                                                                            valign=\"top\"><span></span></td>\r\n                                                                                    </tr>\r\n                                                                                </tbody>\r\n                                                                            </table>\r\n                                                                        </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                </td>\r\n                            </tr>\r\n                        </tbody>\r\n                    </table>\r\n                </body>\r\n                \r\n                </html>','en','email',1),(9,15,'Payment information for Purchase #{purchase_reference_no}','<p>Hi {supplier_name},</p><p>We just want to confirm a few details about payment information:</p><p><b>Supplier Information</b></p><p>{billing_street}</p><p>{billing_city}</p><p>{billing_state}</p><p>{billing_zip_code}</p><p>{billing_country}<br></p><p><b>Payment Summary<br></b></p><p><b></b><i>Payment No : {payment_id}</i></p><p><i>Payment Date : {payment_date}&nbsp;</i></p><p><i>Payment Method : {payment_method} <br></i></p><p><i><b>Total Amount : {total_amount}</b></i></p><p><i>Purchase Order No : {purchase_reference_no}</i><br><i></i></p><p><br></p><p>Regards,</p><p>{company_name}<br></p><br><br><br><br><br><br>','en','email',1),(12,5,'','Your Quotation  #{order_reference_no} has been created on {order_date} successfully.{company_name}','en','sms',1),(13,4,'','Your Invoice #{invoice_reference_no} has been created on {order_date} successfully. {company_name}','en','sms',1),(17,13,'You have been assigned in a project','<p></p>\r\n                <p>Hello {assignee},</p><p>\r\n                A new project has been assigned to you.\r\n                <br></p>\r\n                <br>\r\n                Project Name :{project_name}<br>Customer Name:{customer_name}<br><div>Start Date: {start_date}</div><div>Status: {status}</div><div><br></div><div><b>Project Details</b></div><div>{details}<br></div>\r\n                <p>Regards,</p><p>{company_name}</p>\r\n                <br><br>\r\n                <br>','en','email',1),(19,12,'A new project has been created.','<p></p>\r\n\r\n                <p>Hello {customer_name},</p><p>\r\n\r\n\r\n\r\n                A new project has been created.\r\n\r\n\r\n\r\n                <br></p>\r\n\r\n                <br>\r\n\r\n                Project Name :{project_name}<br><div>Start Date: {start_date}</div><div>Status: {status}</div><div><br></div><div><b>Project Details</b></div><div>{details}<br></div>\r\n\r\n                <p>Regards,</p><p>{company_name}</p>\r\n\r\n\r\n\r\n                <br><br>\r\n\r\n                <br>','en','email',1),(20,18,'New Password Set','                  <!DOCTYPE html>\r\n                <html>\r\n                  <head>\r\n                    <meta charset=\"utf-8\">\r\n                    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\r\n                    <title>Password Reset</title>\r\n                    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n                  <style type=\"text/css\">\r\n                  /**\r\n                   * Google webfonts. Recommended to include the .woff version for cross-client compatibility.\r\n                   */\r\n                  @media screen {\r\n                    @font-face {\r\n                      font-family: Source Sans Pro;\r\n                      font-style: normal;\r\n                      font-weight: 400;\r\n                      src: local(\"Source Sans Pro Regular\"), local(\"SourceSansPro-Regular\"), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\"woff\");\r\n                    }\r\n                    @font-face {\r\n                      font-family: Source Sans Pro;\r\n                      font-style: normal;\r\n                      font-weight: 700;\r\n                      src: local(\"Source Sans Pro Bold\"), local(\"SourceSansPro-Bold\"), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\"woff\");\r\n                    }\r\n                  }\r\n                  /**\r\n                   * Avoid browser level font resizing.\r\n                   * 1. Windows Mobile\r\n                   * 2. iOS / OSX\r\n                   */\r\n                  body,\r\n                  table,\r\n                  td,\r\n                  a {\r\n                    -ms-text-size-adjust: 100%; /* 1 */\r\n                    -webkit-text-size-adjust: 100%; /* 2 */\r\n                  }\r\n                  /**\r\n                   * Remove extra space added to tables and cells in Outlook.\r\n                   */\r\n                  table,\r\n                  td {\r\n                    mso-table-rspace: 0pt;\r\n                    mso-table-lspace: 0pt;\r\n                  }\r\n                  /**\r\n                   * Better fluid images in Internet Explorer.\r\n                   */\r\n                  img {\r\n                    -ms-interpolation-mode: bicubic;\r\n                  }\r\n                  /**\r\n                   * Remove blue links for iOS devices.\r\n                   */\r\n                  a[x-apple-data-detectors] {\r\n                    font-family: inherit !important;\r\n                    font-size: inherit !important;\r\n                    font-weight: inherit !important;\r\n                    line-height: inherit !important;\r\n                    color: inherit !important;\r\n                    text-decoration: none !important;\r\n                  }\r\n                  /**\r\n                   * Fix centering issues in Android 4.4.\r\n                   */\r\n                  div[style*=\"margin: 16px 0;\"] {\r\n                    margin: 0 !important;\r\n                  }\r\n                  body {\r\n                    width: 100% !important;\r\n                    height: 100% !important;\r\n                    padding: 0 !important;\r\n                    margin: 0 !important;\r\n                  }\r\n                  /**\r\n                   * Collapse table borders to avoid space between cells.\r\n                   */\r\n                  table {\r\n                    border-collapse: collapse !important;\r\n                  }\r\n                  a {\r\n                    color: #1a82e2;\r\n                  }\r\n                  img {\r\n                    height: auto;\r\n                    line-height: 100%;\r\n                    text-decoration: none;\r\n                    border: 0;\r\n                    outline: none;\r\n                  }\r\n                  </style>\r\n\r\n                </head>\r\n                    <body style=\"background-color: #e9ecef;\">\r\n                      <div class=\"preheader\" style=\"display: none; max-width: 0; max-height: 0; overflow: hidden; font-size: 1px; line-height: 1px; color: #fff; opacity: 0;\">\r\n                      </div>\r\n                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n                        <tr>\r\n                          <td align=\"center\" bgcolor=\"#e9ecef\">\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\r\n                              <tr>\r\n                                <td align=\"center\" valign=\"top\" style=\"padding: 36px 24px;\">\r\n                                </td>\r\n                              </tr>\r\n                            </table>\r\n                          </td>\r\n                        </tr>\r\n                        <tr>\r\n                          <td align=\"center\" bgcolor=\"#e9ecef\">\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\r\n                              <tr>\r\n                                <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 36px 24px 0; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; border-top: 3px solid #d4dadf;\">\r\n                                  <h1 style=\"margin: 0; font-size: 32px; font-weight: 700; letter-spacing: -1px; line-height: 48px; text-align: center; color: cornflowerblue;\">Updated Your Password</h1>\r\n                                </td>\r\n                              </tr>\r\n                            </table>\r\n                          </td>\r\n                        </tr>\r\n                        <tr>\r\n                          <td align=\"center\" bgcolor=\"#e9ecef\">\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\r\n                              <tr>\r\n                                <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\r\n                                  <p style=\"margin: 0;\">Hello {user_name},</p>\r\n                                  <p>You requested to update your password. Your new password has been set. You can check the update going through the <a href=\"{company_url}\">portal</a>.</p>\r\n                                  <h5 style=\"margin-top:10px; margin-bottom:0px; \"> <u>Credentials</u>: </h5>\r\n                                  <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                    <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">User ID: <span style=\"color: #555555;\"><strong> {user_id}</strong></span></span></p>\r\n                                    <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Password: <span style=\"color: #555555;\"><strong> {user_pass}</strong></span></span></p>\r\n                                  </div>\r\n                                  <p style=\"margin-top:10px;\">Was it you or someone else? If it was not you, please inform us promptly.</p>\r\n                                </td>\r\n                              </tr>\r\n                              <tr>\r\n                                <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 0 24px 24px 24px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-bottom: 3px solid #d4dadf\">\r\n                                  <p style=\"margin: 0;\">Thanks & Regards,<br> {company_name}</p>\r\n                                  <p>\r\n                                    From : {company_name}<br />\r\n                                    Email: {company_email}<br />\r\n                                    Phone: {company_phone}<br />\r\n                                    Address: {company_street}, {company_city}, {company_state}\r\n                                  </p>\r\n                                  <br/>\r\n                                  <hr>\r\n                                  <p style=\"text-align: center;\">©{company_name}, all rights reserved</p>\r\n                                </td>\r\n                              </tr>\r\n                            </table>\r\n                          </td>\r\n                        </tr>\r\n                      </table>\r\n                    </body>\r\n                </html>','en','email',1),(21,17,'Reset Password','<!DOCTYPE html>\r\n                    <html>\r\n                      <head>\r\n                        <meta charset=\"utf-8\">\r\n                        <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\r\n                        <title>Password Reset</title>\r\n                        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n                      <style type=\"text/css\">\r\n                      /**\r\n                       * Google webfonts. Recommended to include the .woff version for cross-client compatibility.\r\n                       */\r\n                      @media screen {\r\n                        @font-face {\r\n                          font-family: Source Sans Pro;\r\n                          font-style: normal;\r\n                          font-weight: 400;\r\n                          src: local(\"Source Sans Pro Regular\"), local(\"SourceSansPro-Regular\"), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\"woff\");\r\n                        }\r\n                        @font-face {\r\n                          font-family: Source Sans Pro;\r\n                          font-style: normal;\r\n                          font-weight: 700;\r\n                          src: local(\"Source Sans Pro Bold\"), local(\"SourceSansPro-Bold\"), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\"woff\");\r\n                        }\r\n                      }\r\n                      /**\r\n                       * Avoid browser level font resizing.\r\n                       * 1. Windows Mobile\r\n                       * 2. iOS / OSX\r\n                       */\r\n                      body,\r\n                      table,\r\n                      td,\r\n                      a {\r\n                        -ms-text-size-adjust: 100%; /* 1 */\r\n                        -webkit-text-size-adjust: 100%; /* 2 */\r\n                      }\r\n                      /**\r\n                       * Remove extra space added to tables and cells in Outlook.\r\n                       */\r\n                      table,\r\n                      td {\r\n                        mso-table-rspace: 0pt;\r\n                        mso-table-lspace: 0pt;\r\n                      }\r\n                      /**\r\n                       * Better fluid images in Internet Explorer.\r\n                       */\r\n                      img {\r\n                        -ms-interpolation-mode: bicubic;\r\n                      }\r\n                      /**\r\n                       * Remove blue links for iOS devices.\r\n                       */\r\n                      a[x-apple-data-detectors] {\r\n                        font-family: inherit !important;\r\n                        font-size: inherit !important;\r\n                        font-weight: inherit !important;\r\n                        line-height: inherit !important;\r\n                        color: inherit !important;\r\n                        text-decoration: none !important;\r\n                      }\r\n                      /**\r\n                       * Fix centering issues in Android 4.4.\r\n                       */\r\n                      div[style*=\"margin: 16px 0;\"] {\r\n                        margin: 0 !important;\r\n                      }\r\n                      body {\r\n                        width: 100% !important;\r\n                        height: 100% !important;\r\n                        padding: 0 !important;\r\n                        margin: 0 !important;\r\n                      }\r\n                      /**\r\n                       * Collapse table borders to avoid space between cells.\r\n                       */\r\n                      table {\r\n                        border-collapse: collapse !important;\r\n                      }\r\n                      a {\r\n                        color: #1a82e2;\r\n                      }\r\n                      img {\r\n                        height: auto;\r\n                        line-height: 100%;\r\n                        text-decoration: none;\r\n                        border: 0;\r\n                        outline: none;\r\n                      }\r\n                      </style>\r\n\r\n                    </head>\r\n                    <body style=\"background-color: #e9ecef;\">\r\n                      <div class=\"preheader\" style=\"display: none; color:black; max-width: 0; max-height: 0; overflow: hidden; font-size: 1px; line-height: 1px; color: #fff; opacity: 0;\">\r\n                        A preheader is the short summary text that follows the subject line when an email is viewed in the inbox.\r\n                      </div>\r\n                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n                        <tr>\r\n                          <td align=\"center\" bgcolor=\"#e9ecef\">\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\r\n                              <tr>\r\n                                <td align=\"center\" valign=\"top\" style=\"padding: 36px 24px;\">\r\n                                </td>\r\n                              </tr>\r\n                            </table>\r\n                          </td>\r\n                        </tr>\r\n                        <tr>\r\n                          <td align=\"center\" bgcolor=\"#e9ecef\">\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\r\n                              <tr>\r\n                                <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 36px 24px 0; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; border-top: 3px solid #d4dadf;\">\r\n                                  <h1 style=\"margin: 0; font-size: 32px; font-weight: 700; letter-spacing: -1px; line-height: 48px; text-align: center; color: cornflowerblue;\">Reset Your Password</h1>\r\n                                </td>\r\n                              </tr>\r\n                            </table>\r\n                          </td>\r\n                        </tr>\r\n                        <tr>\r\n                          <td align=\"center\" bgcolor=\"#e9ecef\">\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\r\n                              <tr>\r\n                                <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\r\n                                  <p style=\"margin: 0; color:black;\">Dear {user_name},</p>\r\n                                  <p style=\" color:black;\">Someone has asked to reset the password of your KYC account. If you did not request a password reset, you can disregard this email. No changes have been made to your account.</p>\r\n                                  <p style=\" color:black;\">To reset your password, go to the following the button: </p>\r\n                                </td>\r\n                              </tr>\r\n                              <tr>\r\n                                <td align=\"left\" bgcolor=\"#ffffff\">\r\n                                  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n                                    <tr>\r\n                                      <td align=\"center\" bgcolor=\"#ffffff\" style=\"padding: 12px;\">\r\n                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                                          <tr>\r\n                                            <td align=\"center\" bgcolor=\"#1a82e2\" style=\"border-radius: 6px;\">\r\n                                              <a href=\"{password_reset_url}\" target=\"_blank\" style=\"display: inline-block; padding: 16px 36px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; color: #ffffff; text-decoration: none; border-radius: 6px;\">Click here</a>\r\n                                            </td>\r\n                                          </tr>\r\n                                        </table>\r\n                                      </td>\r\n                                    </tr>\r\n                                  </table>\r\n                                </td>\r\n                              </tr>\r\n                              <tr>\r\n                                <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\r\n                                  <p style=\"margin: 0; color:black;\">If that does not work, click on the following link in your browser:</p>\r\n                                  <p style=\"margin: 0;\"><a href=\"{password_reset_url}\" target=\"_blank\">{password_reset_url}</a></p>\r\n                                </td>\r\n                              </tr>\r\n                              <tr>\r\n                                <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-bottom: 3px solid #d4dadf\">\r\n                                  <p style=\"margin: 0;  color:black;\">Thanks & Regards,<br> {company_name}</p>\r\n                                  <p style=\" color:black;\">\r\n                                    From : {company_name}<br />\r\n                                    Email: {company_email}<br />\r\n                                    Phone: {company_phone}<br />\r\n                                    Address: {company_street}, {company_city}, {company_state}\r\n                                  </p>\r\n                                  <br />\r\n                                  <hr>\r\n                                  <p style=\"text-align: center;font-size:12px\">©{company_name}, all rights reserved</p>\r\n                                </td>\r\n                              </tr>\r\n                            </table>\r\n                          </td>\r\n                        </tr>\r\n                      </table>\r\n                    </body>\r\n                </html>','en','email',1),(22,19,'Your Invoice # {invoice_reference_no} from {company_name} has been created.','<p>Hi {customer_name},</p><p>Thank you for your order. Here’s a brief overview of your invoice: Invoice #{invoice_reference_no}. The invoice total is {currency}{total_amount}, please pay before {due_date}.</p><p>If you have any questions, please feel free to reply to this email.</p><p><strong>Billing address</strong></p><p>&nbsp;{billing_street}</p><p>&nbsp;{billing_city}</p><p>&nbsp;{billing_state}</p><p>&nbsp;{billing_zip_code}</p><p>&nbsp;{billing_country}<br>&nbsp;</p><p><br>&nbsp;</p><p><strong>Quotation summary</strong><br>&nbsp;</p><p>{invoice_summery}<br>&nbsp;</p><p>Regards,</p><p>{company_name}<br>&nbsp;</p>','en','email',1),(24,19,'','Your POS Invoice #{invoice_reference_no} has been created on {order_date} successfully.\r\n                {company_name}','en','sms',1),(26,20,'Task status for task no: #{task_id} has been updated by {changed_by}','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n                <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:v=\"urn:schemas-microsoft-com:vml\">\r\n                    <head>\r\n                        <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/>\r\n                        <meta content=\"width=device-width\" name=\"viewport\"/>\r\n                        <meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\"/>\r\n                        <title>Task</title>\r\n                        <style type=\"text/css\">\r\n                                body {\r\n                                    margin: 0;\r\n                                    padding: 0;\r\n                                }\r\n                                table,\r\n                                td,\r\n                                tr {\r\n                                    vertical-align: top;\r\n                                    border-collapse: collapse;\r\n                                }\r\n                                * {\r\n                                    line-height: inherit;\r\n                                }\r\n                                a[x-apple-data-detectors=true] {\r\n                                    color: inherit !important;\r\n                                    text-decoration: none !important;\r\n                                }\r\n                                .myButton {\r\n                                    background-color:#1aa19c;\r\n                                    border-radius:5px;\r\n                                    display:inline-block;\r\n                                    cursor:pointer;\r\n                                    color:#ffffff;\r\n                                    font-family:Trebuchet MS;\r\n                                    font-size:17px;\r\n                                    font-weight:bold;\r\n                                    padding:9px 28px;\r\n                                    text-decoration:none;\r\n                                    text-shadow:0px 1px 2px #3d768a;\r\n                                }\r\n                                .myButton:hover {\r\n                                    background-color:#408c99;\r\n                                }\r\n                                .myButton:active {\r\n                                    position:relative;\r\n                                    top:1px;\r\n                                }\r\n                        </style>\r\n                        <style id=\"media-query\" type=\"text/css\">\r\n                                @media (max-width: 660px) {\r\n                                    .block-grid,\r\n                                    .col {\r\n                                        min-width: 320px !important;\r\n                                        max-width: 100% !important;\r\n                                        display: block !important;\r\n                                    }\r\n                                    .block-grid {\r\n                                        width: 100% !important;\r\n                                    }\r\n                                    .col {\r\n                                        width: 100% !important;\r\n                                    }\r\n                                    .col>div {\r\n                                        margin: 0 auto;\r\n                                    }\r\n                                    img.fullwidth,\r\n                                    img.fullwidthOnMobile {\r\n                                        max-width: 100% !important;\r\n                                    }\r\n                                    .no-stack .col {\r\n                                        min-width: 0 !important;\r\n                                        display: table-cell !important;\r\n                                    }\r\n                                    .no-stack.two-up .col {\r\n                                        width: 50% !important;\r\n                                    }\r\n                                    .no-stack .col.num4 {\r\n                                        width: 33% !important;\r\n                                    }\r\n                                    .no-stack .col.num8 {\r\n                                        width: 66% !important;\r\n                                    }\r\n                                    .no-stack .col.num4 {\r\n                                        width: 33% !important;\r\n                                    }\r\n                                    .no-stack .col.num3 {\r\n                                        width: 25% !important;\r\n                                    }\r\n                                    .no-stack .col.num6 {\r\n                                        width: 50% !important;\r\n                                    }\r\n                                    .no-stack .col.num9 {\r\n                                        width: 75% !important;\r\n                                    }\r\n                                    .video-block {\r\n                                        max-width: none !important;\r\n                                    }\r\n                                    .mobile_hide {\r\n                                        min-height: 0px;\r\n                                        max-height: 0px;\r\n                                        max-width: 0px;\r\n                                        display: none;\r\n                                        overflow: hidden;\r\n                                        font-size: 0px;\r\n                                    }\r\n                                    .desktop_hide {\r\n                                        display: block !important;\r\n                                        max-height: none !important;\r\n                                    }\r\n                                }\r\n                \r\n                        </style>\r\n                    </head>\r\n                    <body class=\"clean-body\" style=\"margin: 0; padding: 0; -webkit-text-size-adjust: 100%; background-color: #f8f8f9;\">\r\n                        <table bgcolor=\"#f8f8f9\" cellpadding=\"0\" cellspacing=\"0\" class=\"nl-container\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; min-width: 320px; Margin: 0 auto; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f8f8f9; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                            <tbody>\r\n                                <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                    <td style=\"word-break: break-word; vertical-align: top;\" valign=\"top\">\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <div style=\"color:#555555;font-family:Pacifico, cursive;line-height:1.2;padding-top:35px;padding-right:0px;padding-bottom:20px;padding-left:30px;\">\r\n                                                                <div style=\"line-height: 1.2; font-size: 18px; color: #555555; font-family: Pacifico, cursive; mso-line-height-alt: 14px;\">\r\n                                                                    <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: center; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #008080; font-size: 30px;\">{company_name}</span></p>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f3fafa;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f3fafa;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 580px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                            <div style=\"border-top:0px solid transparent; border-left:30px solid #FFFFFF; border-bottom:0px solid transparent; border-right:30px solid #FFFFFF; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                <!--<![endif]-->\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 4px solid #1AA19C; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 35px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                                <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:15px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                        <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #2b303a; font-size: 18px;\"><strong>Hello {assignee_name},</strong></span></p>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                                <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:0px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                        <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: black; font-size: 18px; line-height: 2rem;\">Task status for task #{task_id} has been updated from {task_prev_status} to {task_new_status}. Have a look at the task details.</span></p>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                                <!--[if mso]></td></tr></table><![endif]-->\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 25px; padding-bottom: 10px; padding-left: 25px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 1px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                                <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:10px;padding-right:10px;padding-bottom:20px;padding-left:25px;\">\r\n                                                                    <p style=\"font-size: 16px; color: black;\"><b><u>Task Details:</u></b></p>\r\n                                                                    <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Task No: <span style=\"color: #555555;\"><strong> #{task_id}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Task Name: <span style=\"color: #555555;\"><strong> {task_name}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Changed by: <span style=\"color: #555555;\"><strong> {changed_by}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Task Assignee: <span style=\"color: #555555;\"><strong> {all_assignee_name}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Start Date: <span style=\"color: #555555;\"><strong> {start_date}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Due Date: <span style=\"color: #555555;\"><strong> {due_date}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Priority: <span style=\"color: #555555;\"><strong> {priority}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Status: <span style=\"color: #555555;\"><strong> {task_new_status}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; padding-top: 3%; line-height: 1; word-break: break-word; text-align: center; mso-line-height-alt: 22px; margin: 0;font-family: inherit;\"><span style=\"color: black; font-size: 18px; line-height: 1rem;\">You can go to the task by clicking the following button.</span></p>\r\n                                                                        <div style=\"text-align: center; width: 100%; padding-top: 3%;\">\r\n                                                                            <a href=\"{task_link}\" class=\"myButton\" style=\"color: #ffffff\">View Task</a>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                            <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:20px;padding-right:30px;padding-bottom:40px;padding-left:30px;\">\r\n                                                                <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                    <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">Regards,</span></p>\r\n                                                                    <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">{company_name}</span></p>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                        <!--<![endif]-->\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                    <div style=\"background-color:transparent;\">\r\n                                        <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                            <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                    <div style=\"width:100% !important;\">\r\n                                                        <!--[if (!mso)&(!IE)]><!-->\r\n                                                        <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                            <!--<![endif]-->\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                        <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 60px; padding-right: 0px; padding-bottom: 12px; padding-left: 0px;\" valign=\"top\">\r\n                                                                            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                <tbody>\r\n                                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                        <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                    </tr>\r\n                                                                                </tbody>\r\n                                                                            </table>\r\n                                                                        </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                        </div>\r\n                                                        <!--<![endif]-->\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                    <div style=\"background-color:transparent;\">\r\n                                        <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f8f8f9;\">\r\n                                            <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f8f8f9;\">\r\n                                                <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                    <div style=\"width:100% !important;\">\r\n                                                        <!--[if (!mso)&(!IE)]><!-->\r\n                                                        <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:5px; padding-bottom:5px; padding-right: 0px; padding-left: 0px;\">\r\n                                                            <!--<![endif]-->\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                        <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 20px; padding-right: 20px; padding-bottom: 20px; padding-left: 20px;\" valign=\"top\">\r\n                                                                            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                <tbody>\r\n                                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                        <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                    </tr>\r\n                                                                                </tbody>\r\n                                                                            </table>\r\n                                                                        </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                </td>\r\n                            </tr>\r\n                        </tbody>\r\n                    </table>\r\n                </body>\r\n                </html>','en','email',1),(27,21,'{commented_by} has been commented on \"{task_id}-{task_name}\"','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n                <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:v=\"urn:schemas-microsoft-com:vml\">\r\n                    <head>\r\n                        <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/>\r\n                        <meta content=\"width=device-width\" name=\"viewport\"/>\r\n                        <meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\"/>\r\n                        <title>Task</title>\r\n                        <style type=\"text/css\">\r\n                                body {\r\n                                    margin: 0;\r\n                                    padding: 0;\r\n                                }\r\n                                table,\r\n                                td,\r\n                                tr {\r\n                                    vertical-align: top;\r\n                                    border-collapse: collapse;\r\n                                }\r\n                                * {\r\n                                    line-height: inherit;\r\n                                }\r\n                                a[x-apple-data-detectors=true] {\r\n                                    color: inherit !important;\r\n                                    text-decoration: none !important;\r\n                                }\r\n                                .myButton {\r\n                                    background-color:#1aa19c;\r\n                                    border-radius:5px;\r\n                                    display:inline-block;\r\n                                    cursor:pointer;\r\n                                    color:#ffffff;\r\n                                    font-family:Trebuchet MS;\r\n                                    font-size:17px;\r\n                                    font-weight:bold;\r\n                                    padding:9px 28px;\r\n                                    text-decoration:none;\r\n                                    text-shadow:0px 1px 2px #3d768a;\r\n                                }\r\n                                .myButton:hover {\r\n                                    background-color:#408c99;\r\n                                }\r\n                                .myButton:active {\r\n                                    position:relative;\r\n                                    top:1px;\r\n                                }\r\n                        </style>\r\n                        <style id=\"media-query\" type=\"text/css\">\r\n                                @media (max-width: 660px) {\r\n                                    .block-grid,\r\n                                    .col {\r\n                                        min-width: 320px !important;\r\n                                        max-width: 100% !important;\r\n                                        display: block !important;\r\n                                    }\r\n                                    .block-grid {\r\n                                        width: 100% !important;\r\n                                    }\r\n                                    .col {\r\n                                        width: 100% !important;\r\n                                    }\r\n                                    .col>div {\r\n                                        margin: 0 auto;\r\n                                    }\r\n                                    img.fullwidth,\r\n                                    img.fullwidthOnMobile {\r\n                                        max-width: 100% !important;\r\n                                    }\r\n                                    .no-stack .col {\r\n                                        min-width: 0 !important;\r\n                                        display: table-cell !important;\r\n                                    }\r\n                                    .no-stack.two-up .col {\r\n                                        width: 50% !important;\r\n                                    }\r\n                                    .no-stack .col.num4 {\r\n                                        width: 33% !important;\r\n                                    }\r\n                                    .no-stack .col.num8 {\r\n                                        width: 66% !important;\r\n                                    }\r\n                                    .no-stack .col.num4 {\r\n                                        width: 33% !important;\r\n                                    }\r\n                                    .no-stack .col.num3 {\r\n                                        width: 25% !important;\r\n                                    }\r\n                                    .no-stack .col.num6 {\r\n                                        width: 50% !important;\r\n                                    }\r\n                                    .no-stack .col.num9 {\r\n                                        width: 75% !important;\r\n                                    }\r\n                                    .video-block {\r\n                                        max-width: none !important;\r\n                                    }\r\n                                    .mobile_hide {\r\n                                        min-height: 0px;\r\n                                        max-height: 0px;\r\n                                        max-width: 0px;\r\n                                        display: none;\r\n                                        overflow: hidden;\r\n                                        font-size: 0px;\r\n                                    }\r\n                                    .desktop_hide {\r\n                                        display: block !important;\r\n                                        max-height: none !important;\r\n                                    }\r\n                                }\r\n                \r\n                        </style>\r\n                    </head>\r\n                    <body class=\"clean-body\" style=\"margin: 0; padding: 0; -webkit-text-size-adjust: 100%; background-color: #f8f8f9;\">\r\n                        <table bgcolor=\"#f8f8f9\" cellpadding=\"0\" cellspacing=\"0\" class=\"nl-container\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; min-width: 320px; Margin: 0 auto; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f8f8f9; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                            <tbody>\r\n                                <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                    <td style=\"word-break: break-word; vertical-align: top;\" valign=\"top\">\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <div style=\"color:#555555;font-family:Pacifico, cursive;line-height:1.2;padding-top:35px;padding-right:0px;padding-bottom:20px;padding-left:30px;\">\r\n                                                                <div style=\"line-height: 1.2; font-size: 18px; color: #555555; font-family: Pacifico, cursive; mso-line-height-alt: 14px;\">\r\n                                                                    <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: center; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #008080; font-size: 30px;\">{company_name}</span></p>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f3fafa;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f3fafa;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 580px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                            <div style=\"border-top:0px solid transparent; border-left:30px solid #FFFFFF; border-bottom:0px solid transparent; border-right:30px solid #FFFFFF; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                <!--<![endif]-->\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 4px solid #1AA19C; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 35px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                                <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:15px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                        <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #2b303a; font-size: 18px;\"><strong>Hello {assignee_name},</strong></span></p>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                                <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:0px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                        <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: black; font-size: 18px; line-height: 2rem;\">There is a new comment in task no: #{task_id}. Have a look at the details of the comment.</span></p>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                                <!--[if mso]></td></tr></table><![endif]-->\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 25px; padding-bottom: 10px; padding-left: 25px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 1px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                                <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:10px;padding-right:10px;padding-bottom:20px;padding-left:25px;\">\r\n                                                                    <p style=\"font-size:16px; color: black;\"><b><u>Comment Details:</u></b></p>\r\n                                                                    <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Task No: <span style=\"color: #555555;\"><strong> #{task_id}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Task Name: <span style=\"color: #555555;\"><strong> {task_name}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Commented by: <span style=\"color: #555555;\"><strong> {commented_by}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Start Date: <span style=\"color: #555555;\"><strong> {start_date}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Due Date: <span style=\"color: #555555;\"><strong> {due_date}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Comment: <span style=\"color: #555555;\"><strong> {comment}</strong></span></span></p>\r\n                                                                        <p style=\"font-size: 15px; padding-top: 3%; line-height: 1; word-break: break-word; text-align: center; mso-line-height-alt: 22px; margin: 0;font-family: inherit;\"><span style=\"color: black; font-size: 18px; line-height: 1rem;\">You can go to the task by clicking the following button.</span></p>\r\n                                                                        <div style=\"text-align: center; width: 100%; padding-top: 3%;\">\r\n                                                                            <a href=\"{task_link}\" class=\"myButton\" style=\"color: #ffffff\">View Comment</a>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                            <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:20px;padding-right:30px;padding-bottom:40px;padding-left:30px;\">\r\n                                                                <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                    <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">Regards,</span></p>\r\n                                                                    <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">{company_name}</span></p>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                        <!--<![endif]-->\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                    <div style=\"background-color:transparent;\">\r\n                                        <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                            <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                    <div style=\"width:100% !important;\">\r\n                                                        <!--[if (!mso)&(!IE)]><!-->\r\n                                                        <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                            <!--<![endif]-->\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                        <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 60px; padding-right: 0px; padding-bottom: 12px; padding-left: 0px;\" valign=\"top\">\r\n                                                                            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                <tbody>\r\n                                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                        <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                    </tr>\r\n                                                                                </tbody>\r\n                                                                            </table>\r\n                                                                        </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                        </div>\r\n                                                        <!--<![endif]-->\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                    <div style=\"background-color:transparent;\">\r\n                                        <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f8f8f9;\">\r\n                                            <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f8f8f9;\">\r\n                                                <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                    <div style=\"width:100% !important;\">\r\n                                                        <!--[if (!mso)&(!IE)]><!-->\r\n                                                        <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:5px; padding-bottom:5px; padding-right: 0px; padding-left: 0px;\">\r\n                                                            <!--<![endif]-->\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                        <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 20px; padding-right: 20px; padding-bottom: 20px; padding-left: 20px;\" valign=\"top\">\r\n                                                                            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                <tbody>\r\n                                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                        <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                    </tr>\r\n                                                                                </tbody>\r\n                                                                            </table>\r\n                                                                        </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                </td>\r\n                            </tr>\r\n                        </tbody>\r\n                    </table>\r\n                </body>\r\n                </html>','en','email',1),(28,22,'Dear valued customer welcome to {company_name}','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n                <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:v=\"urn:schemas-microsoft-com:vml\">\r\n                    <head>\r\n                        <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/>\r\n                        <meta content=\"width=device-width\" name=\"viewport\"/>\r\n                        <meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\"/>\r\n                        <title>Task</title>\r\n                        <style type=\"text/css\">\r\n                                body {\r\n                                    margin: 0;\r\n                                    padding: 0;\r\n                                }\r\n                                table,\r\n                                td,\r\n                                tr {\r\n                                    vertical-align: top;\r\n                                    border-collapse: collapse;\r\n                                }\r\n                                * {\r\n                                    line-height: inherit;\r\n                                }\r\n                                a[x-apple-data-detectors=true] {\r\n                                    color: inherit !important;\r\n                                    text-decoration: none !important;\r\n                                }\r\n                                .myButton {\r\n                                    background-color:#1aa19c;\r\n                                    border-radius:5px;\r\n                                    display:inline-block;\r\n                                    cursor:pointer;\r\n                                    color:#ffffff;\r\n                                    font-family:Trebuchet MS;\r\n                                    font-size:17px;\r\n                                    font-weight:bold;\r\n                                    padding:9px 28px;\r\n                                    text-decoration:none;\r\n                                    text-shadow:0px 1px 2px #3d768a;\r\n                                }\r\n                                .myButton:hover {\r\n                                    background-color:#408c99;\r\n                                }\r\n                                .myButton:active {\r\n                                    position:relative;\r\n                                    top:1px;\r\n                                }\r\n                        </style>\r\n                        <style id=\"media-query\" type=\"text/css\">\r\n                                @media (max-width: 660px) {\r\n                                    .block-grid,\r\n                                    .col {\r\n                                        min-width: 320px !important;\r\n                                        max-width: 100% !important;\r\n                                        display: block !important;\r\n                                    }\r\n                                    .block-grid {\r\n                                        width: 100% !important;\r\n                                    }\r\n                                    .col {\r\n                                        width: 100% !important;\r\n                                    }\r\n                                    .col>div {\r\n                                        margin: 0 auto;\r\n                                    }\r\n                                    img.fullwidth,\r\n                                    img.fullwidthOnMobile {\r\n                                        max-width: 100% !important;\r\n                                    }\r\n                                    .no-stack .col {\r\n                                        min-width: 0 !important;\r\n                                        display: table-cell !important;\r\n                                    }\r\n                                    .no-stack.two-up .col {\r\n                                        width: 50% !important;\r\n                                    }\r\n                                    .no-stack .col.num4 {\r\n                                        width: 33% !important;\r\n                                    }\r\n                                    .no-stack .col.num8 {\r\n                                        width: 66% !important;\r\n                                    }\r\n                                    .no-stack .col.num4 {\r\n                                        width: 33% !important;\r\n                                    }\r\n                                    .no-stack .col.num3 {\r\n                                        width: 25% !important;\r\n                                    }\r\n                                    .no-stack .col.num6 {\r\n                                        width: 50% !important;\r\n                                    }\r\n                                    .no-stack .col.num9 {\r\n                                        width: 75% !important;\r\n                                    }\r\n                                    .video-block {\r\n                                        max-width: none !important;\r\n                                    }\r\n                                    .mobile_hide {\r\n                                        min-height: 0px;\r\n                                        max-height: 0px;\r\n                                        max-width: 0px;\r\n                                        display: none;\r\n                                        overflow: hidden;\r\n                                        font-size: 0px;\r\n                                    }\r\n                                    .desktop_hide {\r\n                                        display: block !important;\r\n                                        max-height: none !important;\r\n                                    }\r\n                                }\r\n\r\n                        </style>\r\n                    </head>\r\n                    <body class=\"clean-body\" style=\"margin: 0; padding: 0; -webkit-text-size-adjust: 100%; background-color: #f8f8f9;\">\r\n                        <table bgcolor=\"#f8f8f9\" cellpadding=\"0\" cellspacing=\"0\" class=\"nl-container\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; min-width: 320px; Margin: 0 auto; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f8f8f9; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                            <tbody>\r\n                                <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                    <td style=\"word-break: break-word; vertical-align: top;\" valign=\"top\">\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <div style=\"color:#555555;font-family:Pacifico, cursive;line-height:1.2;padding-top:35px;padding-right:0px;padding-bottom:20px;padding-left:30px;\">\r\n                                                                <div style=\"line-height: 1.2; font-size: 18px; color: #555555; font-family: Pacifico, cursive; mso-line-height-alt: 14px;\">\r\n                                                                    <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: center; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #008080; font-size: 30px;\">{company_name}</span></p>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f3fafa;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f3fafa;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 580px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                            <div style=\"border-top:0px solid transparent; border-left:30px solid #FFFFFF; border-bottom:0px solid transparent; border-right:30px solid #FFFFFF; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                <!--<![endif]-->\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 4px solid #1AA19C; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 35px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                                <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:15px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                        <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #2b303a; font-size: 18px;\"><strong>Hello {customer_name},</strong></span></p>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                                <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:0px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                        <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #008080; font-size: 18px;\">Take our warm welcome, please login to the <a href=\"{company_url}\">portal</a> to see the details of your account.</span></p><br/>\r\n                                                                        <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\">Your login credentials are as follows -</p>\r\n                                                                        <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\">Email: {email}</p>\r\n                                                                        <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\">Password: {password}</p>\r\n                                                                    </div>\r\n                                                                </div> \r\n                                                            <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:20px;padding-right:30px;padding-bottom:40px;padding-left:30px;\">\r\n                                                                <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                    <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">Regards,</span></p>\r\n                                                                    <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">{company_name}</span></p>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                        <!--<![endif]-->\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                    <div style=\"background-color:transparent;\">\r\n                                        <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                            <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                    <div style=\"width:100% !important;\">\r\n                                                        <!--[if (!mso)&(!IE)]><!-->\r\n                                                        <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                            <!--<![endif]-->\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                        <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 60px; padding-right: 0px; padding-bottom: 12px; padding-left: 0px;\" valign=\"top\">\r\n                                                                            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                <tbody>\r\n                                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                        <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                    </tr>\r\n                                                                                </tbody>\r\n                                                                            </table>\r\n                                                                        </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                        </div>\r\n                                                        <!--<![endif]-->\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                    <div style=\"background-color:transparent;\">\r\n                                        <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f8f8f9;\">\r\n                                            <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f8f8f9;\">\r\n                                                <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                    <div style=\"width:100% !important;\">\r\n                                                        <!--[if (!mso)&(!IE)]><!-->\r\n                                                        <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:5px; padding-bottom:5px; padding-right: 0px; padding-left: 0px;\">\r\n                                                            <!--<![endif]-->\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                        <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 20px; padding-right: 20px; padding-bottom: 20px; padding-left: 20px;\" valign=\"top\">\r\n                                                                            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                <tbody>\r\n                                                                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                        <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                    </tr>\r\n                                                                                </tbody>\r\n                                                                            </table>\r\n                                                                        </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                </td>\r\n                            </tr>\r\n                        </tbody>\r\n                    </table>\r\n                    </body>\r\n                </html>','en','email',1),(29,23,'Dear valued Supplier welcome to {company_name}','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n                        <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:v=\"urn:schemas-microsoft-com:vml\">\r\n                            <head>\r\n                                <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/>\r\n                                <meta content=\"width=device-width\" name=\"viewport\"/>\r\n                                <meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\"/>\r\n                                <title>Task</title>\r\n                                <style type=\"text/css\">\r\n                                        body {\r\n                                            margin: 0;\r\n                                            padding: 0;\r\n                                        }\r\n                                        table,\r\n                                        td,\r\n                                        tr {\r\n                                            vertical-align: top;\r\n                                            border-collapse: collapse;\r\n                                        }\r\n                                        * {\r\n                                            line-height: inherit;\r\n                                        }\r\n                                        a[x-apple-data-detectors=true] {\r\n                                            color: inherit !important;\r\n                                            text-decoration: none !important;\r\n                                        }\r\n                                        .myButton {\r\n                                            background-color:#1aa19c;\r\n                                            border-radius:5px;\r\n                                            display:inline-block;\r\n                                            cursor:pointer;\r\n                                            color:#ffffff;\r\n                                            font-family:Trebuchet MS;\r\n                                            font-size:17px;\r\n                                            font-weight:bold;\r\n                                            padding:9px 28px;\r\n                                            text-decoration:none;\r\n                                            text-shadow:0px 1px 2px #3d768a;\r\n                                        }\r\n                                        .myButton:hover {\r\n                                            background-color:#408c99;\r\n                                        }\r\n                                        .myButton:active {\r\n                                            position:relative;\r\n                                            top:1px;\r\n                                        }\r\n                                </style>\r\n                                <style id=\"media-query\" type=\"text/css\">\r\n                                        @media (max-width: 660px) {\r\n                                            .block-grid,\r\n                                            .col {\r\n                                                min-width: 320px !important;\r\n                                                max-width: 100% !important;\r\n                                                display: block !important;\r\n                                            }\r\n                                            .block-grid {\r\n                                                width: 100% !important;\r\n                                            }\r\n                                            .col {\r\n                                                width: 100% !important;\r\n                                            }\r\n                                            .col>div {\r\n                                                margin: 0 auto;\r\n                                            }\r\n                                            img.fullwidth,\r\n                                            img.fullwidthOnMobile {\r\n                                                max-width: 100% !important;\r\n                                            }\r\n                                            .no-stack .col {\r\n                                                min-width: 0 !important;\r\n                                                display: table-cell !important;\r\n                                            }\r\n                                            .no-stack.two-up .col {\r\n                                                width: 50% !important;\r\n                                            }\r\n                                            .no-stack .col.num4 {\r\n                                                width: 33% !important;\r\n                                            }\r\n                                            .no-stack .col.num8 {\r\n                                                width: 66% !important;\r\n                                            }\r\n                                            .no-stack .col.num4 {\r\n                                                width: 33% !important;\r\n                                            }\r\n                                            .no-stack .col.num3 {\r\n                                                width: 25% !important;\r\n                                            }\r\n                                            .no-stack .col.num6 {\r\n                                                width: 50% !important;\r\n                                            }\r\n                                            .no-stack .col.num9 {\r\n                                                width: 75% !important;\r\n                                            }\r\n                                            .video-block {\r\n                                                max-width: none !important;\r\n                                            }\r\n                                            .mobile_hide {\r\n                                                min-height: 0px;\r\n                                                max-height: 0px;\r\n                                                max-width: 0px;\r\n                                                display: none;\r\n                                                overflow: hidden;\r\n                                                font-size: 0px;\r\n                                            }\r\n                                            .desktop_hide {\r\n                                                display: block !important;\r\n                                                max-height: none !important;\r\n                                            }\r\n                                        }\r\n\r\n                                </style>\r\n                            </head>\r\n                            <body class=\"clean-body\" style=\"margin: 0; padding: 0; -webkit-text-size-adjust: 100%; background-color: #f8f8f9;\">\r\n                                <table bgcolor=\"#f8f8f9\" cellpadding=\"0\" cellspacing=\"0\" class=\"nl-container\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; min-width: 320px; Margin: 0 auto; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f8f8f9; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                            <td style=\"word-break: break-word; vertical-align: top;\" valign=\"top\">\r\n                                                <div style=\"background-color:transparent;\">\r\n                                                    <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                                        <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                            <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                                <div style=\"width:100% !important;\">\r\n                                                                    <div style=\"color:#555555;font-family:Pacifico, cursive;line-height:1.2;padding-top:35px;padding-right:0px;padding-bottom:20px;padding-left:30px;\">\r\n                                                                        <div style=\"line-height: 1.2; font-size: 18px; color: #555555; font-family: Pacifico, cursive; mso-line-height-alt: 14px;\">\r\n                                                                            <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: center; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #008080; font-size: 30px;\">{company_name}</span></p>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                                <div style=\"background-color:transparent;\">\r\n                                                    <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f3fafa;\">\r\n                                                        <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f3fafa;\">\r\n                                                            <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 580px;\">\r\n                                                                <div style=\"width:100% !important;\">\r\n                                                                    <!--[if (!mso)&(!IE)]><!-->\r\n                                                                    <div style=\"border-top:0px solid transparent; border-left:30px solid #FFFFFF; border-bottom:0px solid transparent; border-right:30px solid #FFFFFF; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                        <!--<![endif]-->\r\n                                                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                            <tbody>\r\n                                                                                <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                    <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 4px solid #1AA19C; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                            <tbody>\r\n                                                                                                <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                    <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                                </tr>\r\n                                                                                            </tbody>\r\n                                                                                        </table>\r\n                                                                                    </td>\r\n                                                                                </tr>\r\n                                                                            </tbody>\r\n                                                                        </table>\r\n                                                                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                            <tbody>\r\n                                                                                <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                    <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 35px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                            <tbody>\r\n                                                                                                <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                    <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                                </tr>\r\n                                                                                            </tbody>\r\n                                                                                        </table>\r\n                                                                                    </td>\r\n                                                                                </tr>\r\n                                                                            </tbody>\r\n                                                                        </table>\r\n                                                                        <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:15px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                            <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                                <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #2b303a; font-size: 18px;\"><strong>Hello {supplier_name},</strong></span></p>\r\n                                                                            </div>\r\n                                                                        </div>\r\n                                                                        <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:0px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                            <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                                <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #008080; font-size: 18px;\">Thank you for being a part of {company_name} family as a supplier.</span></p>\r\n                                                                            </div>\r\n                                                                        </div>                                              \r\n                                                                    <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:20px;padding-right:30px;padding-bottom:40px;padding-left:30px;\">\r\n                                                                        <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">Regards,</span></p>\r\n                                                                            <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">{company_name}</span></p>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                                <!--<![endif]-->\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                            <div style=\"background-color:transparent;\">\r\n                                                <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                                    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                        <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                            <div style=\"width:100% !important;\">\r\n                                                                <!--[if (!mso)&(!IE)]><!-->\r\n                                                                <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                    <!--<![endif]-->\r\n                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                        <tbody>\r\n                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 60px; padding-right: 0px; padding-bottom: 12px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                    <!--[if (!mso)&(!IE)]><!-->\r\n                                                                </div>\r\n                                                                <!--<![endif]-->\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                            <div style=\"background-color:transparent;\">\r\n                                                <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f8f8f9;\">\r\n                                                    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f8f8f9;\">\r\n                                                        <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                            <div style=\"width:100% !important;\">\r\n                                                                <!--[if (!mso)&(!IE)]><!-->\r\n                                                                <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:5px; padding-bottom:5px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                    <!--<![endif]-->\r\n                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                        <tbody>\r\n                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 20px; padding-right: 20px; padding-bottom: 20px; padding-left: 20px;\" valign=\"top\">\r\n                                                                                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </td>\r\n                                    </tr>\r\n                                </tbody>\r\n                            </table>\r\n                        </body>\r\n                    </html>','en','email',1),(30,24,'Welcome to {company_name} as a Team Member','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n                    <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:v=\"urn:schemas-microsoft-com:vml\">\r\n                        <head>\r\n                            <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/>\r\n                            <meta content=\"width=device-width\" name=\"viewport\"/>\r\n                            <meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\"/>\r\n                            <title>Task</title>\r\n                            <style type=\"text/css\">\r\n                                    body {\r\n                                        margin: 0;\r\n                                        padding: 0;\r\n                                    }\r\n                                    table,\r\n                                    td,\r\n                                    tr {\r\n                                        vertical-align: top;\r\n                                        border-collapse: collapse;\r\n                                    }\r\n                                    * {\r\n                                        line-height: inherit;\r\n                                    }\r\n                                    a[x-apple-data-detectors=true] {\r\n                                        color: inherit !important;\r\n                                        text-decoration: none !important;\r\n                                    }\r\n                                    .myButton {\r\n                                        background-color:#1aa19c;\r\n                                        border-radius:5px;\r\n                                        display:inline-block;\r\n                                        cursor:pointer;\r\n                                        color:#ffffff;\r\n                                        font-family:Trebuchet MS;\r\n                                        font-size:17px;\r\n                                        font-weight:bold;\r\n                                        padding:9px 28px;\r\n                                        text-decoration:none;\r\n                                        text-shadow:0px 1px 2px #3d768a;\r\n                                    }\r\n                                    .myButton:hover {\r\n                                        background-color:#408c99;\r\n                                    }\r\n                                    .myButton:active {\r\n                                        position:relative;\r\n                                        top:1px;\r\n                                    }\r\n                            </style>\r\n                            <style id=\"media-query\" type=\"text/css\">\r\n                                    @media (max-width: 660px) {\r\n                                        .block-grid,\r\n                                        .col {\r\n                                            min-width: 320px !important;\r\n                                            max-width: 100% !important;\r\n                                            display: block !important;\r\n                                        }\r\n                                        .block-grid {\r\n                                            width: 100% !important;\r\n                                        }\r\n                                        .col {\r\n                                            width: 100% !important;\r\n                                        }\r\n                                        .col>div {\r\n                                            margin: 0 auto;\r\n                                        }\r\n                                        img.fullwidth,\r\n                                        img.fullwidthOnMobile {\r\n                                            max-width: 100% !important;\r\n                                        }\r\n                                        .no-stack .col {\r\n                                            min-width: 0 !important;\r\n                                            display: table-cell !important;\r\n                                        }\r\n                                        .no-stack.two-up .col {\r\n                                            width: 50% !important;\r\n                                        }\r\n                                        .no-stack .col.num4 {\r\n                                            width: 33% !important;\r\n                                        }\r\n                                        .no-stack .col.num8 {\r\n                                            width: 66% !important;\r\n                                        }\r\n                                        .no-stack .col.num4 {\r\n                                            width: 33% !important;\r\n                                        }\r\n                                        .no-stack .col.num3 {\r\n                                            width: 25% !important;\r\n                                        }\r\n                                        .no-stack .col.num6 {\r\n                                            width: 50% !important;\r\n                                        }\r\n                                        .no-stack .col.num9 {\r\n                                            width: 75% !important;\r\n                                        }\r\n                                        .video-block {\r\n                                            max-width: none !important;\r\n                                        }\r\n                                        .mobile_hide {\r\n                                            min-height: 0px;\r\n                                            max-height: 0px;\r\n                                            max-width: 0px;\r\n                                            display: none;\r\n                                            overflow: hidden;\r\n                                            font-size: 0px;\r\n                                        }\r\n                                        .desktop_hide {\r\n                                            display: block !important;\r\n                                            max-height: none !important;\r\n                                        }\r\n                                    }\r\n\r\n                            </style>\r\n                        </head>\r\n                        <body class=\"clean-body\" style=\"margin: 0; padding: 0; -webkit-text-size-adjust: 100%; background-color: #f8f8f9;\">\r\n                            <table bgcolor=\"#f8f8f9\" cellpadding=\"0\" cellspacing=\"0\" class=\"nl-container\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; min-width: 320px; Margin: 0 auto; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f8f8f9; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                <tbody>\r\n                                    <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                        <td style=\"word-break: break-word; vertical-align: top;\" valign=\"top\">\r\n                                            <div style=\"background-color:transparent;\">\r\n                                                <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                                    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                        <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                            <div style=\"width:100% !important;\">\r\n                                                                <div style=\"color:#555555;font-family:Pacifico, cursive;line-height:1.2;padding-top:35px;padding-right:0px;padding-bottom:20px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.2; font-size: 18px; color: #555555; font-family: Pacifico, cursive; mso-line-height-alt: 14px;\">\r\n                                                                        <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: center; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #008080; font-size: 30px;\">{company_name}</span></p>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                            <div style=\"background-color:transparent;\">\r\n                                                <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f3fafa;\">\r\n                                                    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f3fafa;\">\r\n                                                        <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 580px;\">\r\n                                                            <div style=\"width:100% !important;\">\r\n                                                                <!--[if (!mso)&(!IE)]><!-->\r\n                                                                <div style=\"border-top:0px solid transparent; border-left:30px solid #FFFFFF; border-bottom:0px solid transparent; border-right:30px solid #FFFFFF; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                    <!--<![endif]-->\r\n                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                        <tbody>\r\n                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 4px solid #1AA19C; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                        <tbody>\r\n                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 35px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                                <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                    <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:15px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                        <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                            <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #2b303a; font-size: 18px;\"><strong>Hello {user_name},</strong></span></p>\r\n                                                                        </div>\r\n                                                                    </div>\r\n                                                                    <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.2;padding-top:0px;padding-right:0px;padding-bottom:10px;padding-left:30px;\">\r\n                                                                        <div style=\"line-height: 1.2; font-size: 12px; color: #555555; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; mso-line-height-alt: 14px;\">\r\n                                                                            <p style=\"font-size: 18px; line-height: 1.2; word-break: break-word; text-align: left; mso-line-height-alt: 22px; margin: 0;\"><span style=\"color: #008080; font-size: 18px;\">A warm welcome to {company_name} family, please login to the <a href=\"{company_url}\">portal</a> to see the details of your account.</span></p>\r\n                                                                        </div>\r\n                                                                    </div>        \r\n                                                                    <div style=\"margin-left:5px;color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:10px;padding-right:10px;padding-bottom:20px;padding-left:25px;\">\r\n                                                                        <h5> <u>Credentials</u>: </h5>\r\n                                                                          <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                              <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">User ID: <span style=\"color: #555555;\"><strong> {user_id}</strong></span></span></p>\r\n                                                                              <p style=\"font-size: 15px; line-height: 1.5; font-family: inherit; word-break: break-word; mso-line-height-alt: 23px; margin: 0;\"><span style=\"font-size: 15px;\">Password: <span style=\"color: #555555;\"><strong> {user_pass}</strong></span></span></p>\r\n                                                                          </div>\r\n                                                                      </div>\r\n                                                                <div style=\"color:#555555;font-family:Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;line-height:1.5;padding-top:20px;padding-right:30px;padding-bottom:40px;padding-left:30px;\">\r\n                                                                    <div style=\"line-height: 1.5; font-size: 12px; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif; color: #555555; mso-line-height-alt: 18px;\">\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">Thank you,</span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">{assigned_by_whom}</span></p>\r\n                                                                        <p style=\"font-size: 15px; line-height: 1.5; word-break: break-word; text-align: left; font-family: inherit; mso-line-height-alt: 23px; margin: 0;\"><span style=\"color: #2b303a; font-size: 15px;\">{company_name}</span></p>\r\n                                                                    </div>\r\n                                                                </div>\r\n                                                            </div>\r\n                                                            <!--<![endif]-->\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #fff;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#fff;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                            <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                <!--<![endif]-->\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 60px; padding-right: 0px; padding-bottom: 12px; padding-left: 0px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                                <!--[if (!mso)&(!IE)]><!-->\r\n                                                            </div>\r\n                                                            <!--<![endif]-->\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div style=\"background-color:transparent;\">\r\n                                            <div class=\"block-grid\" style=\"Margin: 0 auto; min-width: 320px; max-width: 640px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #f8f8f9;\">\r\n                                                <div style=\"border-collapse: collapse;display: table;width: 100%;background-color:#f8f8f9;\">\r\n                                                    <div class=\"col num12\" style=\"min-width: 320px; max-width: 640px; display: table-cell; vertical-align: top; width: 640px;\">\r\n                                                        <div style=\"width:100% !important;\">\r\n                                                            <!--[if (!mso)&(!IE)]><!-->\r\n                                                            <div style=\"border-top:0px solid transparent; border-left:0px solid transparent; border-bottom:0px solid transparent; border-right:0px solid transparent; padding-top:5px; padding-bottom:5px; padding-right: 0px; padding-left: 0px;\">\r\n                                                                <!--<![endif]-->\r\n                                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                    <tbody>\r\n                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                            <td class=\"divider_inner\" style=\"word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 20px; padding-right: 20px; padding-bottom: 20px; padding-left: 20px;\" valign=\"top\">\r\n                                                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\"table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid #BBBBBB; width: 100%;\" valign=\"top\" width=\"100%\">\r\n                                                                                    <tbody>\r\n                                                                                        <tr style=\"vertical-align: top;\" valign=\"top\">\r\n                                                                                            <td style=\"word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\" valign=\"top\"><span></span></td>\r\n                                                                                        </tr>\r\n                                                                                    </tbody>\r\n                                                                                </table>\r\n                                                                            </td>\r\n                                                                        </tr>\r\n                                                                    </tbody>\r\n                                                                </table>\r\n                                                            </div>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                    </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </body>\r\n                </html>','en','email',1),(31,25,'{company_name} - Activate your account','<!DOCTYPE html>\r\n                <html>\r\n                <head>\r\n                  <meta charset=\"utf-8\">\r\n                  <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\r\n                  <title>Activation Link</title>\r\n                  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n                  <style type=\"text/css\">\r\n                    /**\r\n                     * Google webfonts. Recommended to include the .woff version for cross-client compatibility.\r\n                     */\r\n                    @media screen {\r\n                      @font-face {\r\n                        font-family: Source Sans Pro;\r\n                        font-style: normal;\r\n                        font-weight: 400;\r\n                        src: local(\"Source Sans Pro Regular\"), local(\"SourceSansPro-Regular\"), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\"woff\");\r\n                      }\r\n                      @font-face {\r\n                        font-family: Source Sans Pro;\r\n                        font-style: normal;\r\n                        font-weight: 700;\r\n                        src: local(\"Source Sans Pro Bold\"), local(\"SourceSansPro-Bold\"), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\"woff\");\r\n                      }\r\n                    }\r\n                    /**\r\n                     * Avoid browser level font resizing.\r\n                     * 1. Windows Mobile\r\n                     * 2. iOS / OSX\r\n                     */\r\n                    body,\r\n                    table,\r\n                    td,\r\n                    a {\r\n                      -ms-text-size-adjust: 100%; /* 1 */\r\n                      -webkit-text-size-adjust: 100%; /* 2 */\r\n                    }\r\n                    /**\r\n                     * Remove extra space added to tables and cells in Outlook.\r\n                     */\r\n                    table,\r\n                    td {\r\n                      mso-table-rspace: 0pt;\r\n                      mso-table-lspace: 0pt;\r\n                    }\r\n                    /**\r\n                     * Better fluid images in Internet Explorer.\r\n                     */\r\n                    img {\r\n                      -ms-interpolation-mode: bicubic;\r\n                    }\r\n                    /**\r\n                     * Remove blue links for iOS devices.\r\n                     */\r\n                    a[x-apple-data-detectors] {\r\n                      font-family: inherit !important;\r\n                      font-size: inherit !important;\r\n                      font-weight: inherit !important;\r\n                      line-height: inherit !important;\r\n                      color: inherit !important;\r\n                      text-decoration: none !important;\r\n                    }\r\n                    /**\r\n                     * Fix centering issues in Android 4.4.\r\n                     */\r\n                    div[style*=\"margin: 16px 0;\"] {\r\n                      margin: 0 !important;\r\n                    }\r\n                    body {\r\n                      width: 100% !important;\r\n                      height: 100% !important;\r\n                      padding: 0 !important;\r\n                      margin: 0 !important;\r\n                    }\r\n                    /**\r\n                     * Collapse table borders to avoid space between cells.\r\n                     */\r\n                    table {\r\n                      border-collapse: collapse !important;\r\n                    }\r\n                    a {\r\n                      color: #1a82e2;\r\n                    }\r\n                    img {\r\n                      height: auto;\r\n                      line-height: 100%;\r\n                      text-decoration: none;\r\n                      border: 0;\r\n                      outline: none;\r\n                    }\r\n                  </style>\r\n                </head>\r\n                <body style=\"background-color: #e9ecef;\">\r\n                <div class=\"preheader\" style=\"display: none; color:black; max-width: 0; max-height: 0; overflow: hidden; font-size: 1px; line-height: 1px; color: #fff; opacity: 0;\">\r\n                  A preheader is the short summary text that follows the subject line when an email is viewed in the inbox.\r\n                </div>\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n                  <tr>\r\n                    <td align=\"center\" bgcolor=\"#e9ecef\">\r\n                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\r\n                        <tr>\r\n                          <td align=\"center\" valign=\"top\" style=\"padding: 36px 24px;\">\r\n                          </td>\r\n                        </tr>\r\n                      </table>\r\n                    </td>\r\n                  </tr>\r\n                  <tr>\r\n                    <td align=\"center\" bgcolor=\"#e9ecef\">\r\n                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\r\n                        <tr>\r\n                          <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 36px 24px 0; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; border-top: 3px solid #d4dadf;\">\r\n                            <h1 style=\"margin: 0; font-size: 32px; font-weight: 700; letter-spacing: -1px; line-height: 48px; text-align: center; color: cornflowerblue;\">Activate Your Account</h1>\r\n                          </td>\r\n                        </tr>\r\n                      </table>\r\n                    </td>\r\n                  </tr>\r\n                  <tr>\r\n                    <td align=\"center\" bgcolor=\"#e9ecef\">\r\n                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\r\n                        <tr>\r\n                          <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\r\n                            <p style=\"margin: 0; color:black;\">Dear {customer_name},</p>\r\n                            <p style=\" color:black;\">To activate your account, go to the following the button: </p>\r\n                          </td>\r\n                        </tr>\r\n                        <tr>\r\n                          <td align=\"left\" bgcolor=\"#ffffff\">\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n                              <tr>\r\n                                <td align=\"center\" bgcolor=\"#ffffff\" style=\"padding: 12px;\">\r\n                                  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                                    <tr>\r\n                                      <td align=\"center\" bgcolor=\"#1a82e2\" style=\"border-radius: 6px;\">\r\n                                        <a href=\"{activation_link}\" target=\"_blank\" style=\"display: inline-block; padding: 16px 36px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; color: #ffffff; text-decoration: none; border-radius: 6px;\">Click here</a>\r\n                                      </td>\r\n                                    </tr>\r\n                                  </table>\r\n                                </td>\r\n                              </tr>\r\n                            </table>\r\n                          </td>\r\n                        </tr>\r\n                        <tr>\r\n                          <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\r\n                            <p style=\"margin: 0; color:black;\">If that does not work, click on the following link in your browser:</p>\r\n                            <p style=\"margin: 0;\"><a href=\"{activation_link}\" target=\"_blank\">{activation_link}</a></p>\r\n                          </td>\r\n                        </tr>\r\n                        <tr>\r\n                          <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: Source Sans Pro, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-bottom: 3px solid #d4dadf\">\r\n                            <p style=\"margin: 0;  color:black;\">Thanks & Regards,<br> {company_name}</p>\r\n                            <p style=\" color:black;\">\r\n                              From : {company_name}<br />\r\n                              Email: {company_email}<br />\r\n                              Phone: {company_phone}<br />\r\n                              Address: {company_street}, {company_city}, {company_state}\r\n                            </p>\r\n                            <br />\r\n                            <hr>\r\n                            <p style=\"text-align: center;font-size:12px\">©{company_name}, all rights reserved</p>\r\n                          </td>\r\n                        </tr>\r\n                      </table>\r\n                    </td>\r\n                  </tr>\r\n                </table>\r\n                </body>\r\n                </html>','en','email',1);
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_rates`
--

DROP TABLE IF EXISTS `exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exchange_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` int(10) unsigned NOT NULL,
  `rate` decimal(16,8) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exchange_rates_currency_id_foreign_idx` (`currency_id`),
  KEY `exchange_rates_date_index` (`date`),
  CONSTRAINT `exchange_rates_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_rates`
--

LOCK TABLES `exchange_rates` WRITE;
/*!40000 ALTER TABLE `exchange_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint(20) unsigned DEFAULT NULL COMMENT 'transaction_id refers transactions tables'' id;',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'user_id refers users tables'' id;',
  `transaction_reference_id` int(10) unsigned NOT NULL COMMENT 'transaction_reference_id refers transaction_references tables''  id;',
  `income_expense_category_id` int(10) unsigned NOT NULL COMMENT 'income_expense_category_id refers income_expense_categories tables'' id;',
  `currency_id` int(10) unsigned NOT NULL COMMENT 'currency_id refers currencies tables'' id;',
  `payment_method_id` int(10) unsigned DEFAULT NULL COMMENT 'payment_method_id refers payment_methods tables'' id;',
  `amount` decimal(16,8) NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `expenses_transaction_id_foreign_idx` (`transaction_id`),
  KEY `expenses_user_id_foreign_idx` (`user_id`),
  KEY `expenses_transaction_reference_id_foreign_idx` (`transaction_reference_id`),
  KEY `expenses_income_expense_category_id_foreign_idx` (`income_expense_category_id`),
  KEY `expenses_currency_id_foreign_idx` (`currency_id`),
  KEY `expenses_payment_method_id_foreign_idx` (`payment_method_id`),
  KEY `expenses_amount_index` (`amount`),
  KEY `expenses_transaction_date_index` (`transaction_date`),
  CONSTRAINT `expenses_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenses_income_expense_category_id_foreign` FOREIGN KEY (`income_expense_category_id`) REFERENCES `income_expense_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenses_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenses_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenses_transaction_reference_id_foreign` FOREIGN KEY (`transaction_reference_id`) REFERENCES `transaction_references` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_links`
--

DROP TABLE IF EXISTS `external_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `object_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_links`
--

LOCK TABLES `external_links` WRITE;
/*!40000 ALTER TABLE `external_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'The type of file.\r\ne.g.: task, ticket, customer, user etc. ',
  `object_id` int(11) DEFAULT NULL COMMENT 'object id refers\r\ne.g: user_id, customer_id, ticket_id etc.',
  `uploaded_by` int(11) DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `files_object_type_index` (`object_type`),
  KEY `files_object_id_index` (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'Company',48,NULL,'e71e2076c9202964a1664d8df843d25a_1_logopng.png','logo.png','2022-10-17 14:35:44'),(2,'Company',47,NULL,'e71e2076c9202964a1664d8df843d25a_1_faviconico.ico','favicon.ico','2022-10-17 14:35:44');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_ledger_transactions`
--

DROP TABLE IF EXISTS `general_ledger_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_ledger_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_id` int(10) unsigned NOT NULL,
  `reference_type` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `gl_account_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `exchange_rate` decimal(16,8) NOT NULL,
  `amount` decimal(16,8) NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_reversed` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 for yes, 0 for no',
  `transaction_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_ledger_transactions`
--

LOCK TABLES `general_ledger_transactions` WRITE;
/*!40000 ALTER TABLE `general_ledger_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `general_ledger_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `groups_name_index` (`name`),
  KEY `groups_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_expense_categories`
--

DROP TABLE IF EXISTS `income_expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_expense_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `income_expense_categories_name_index` (`name`),
  KEY `income_expense_categories_category_type_index` (`category_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_expense_categories`
--

LOCK TABLES `income_expense_categories` WRITE;
/*!40000 ALTER TABLE `income_expense_categories` DISABLE KEYS */;
INSERT INTO `income_expense_categories` VALUES (1,'Sales','income'),(2,'Operational Cost','expense'),(3,'Advertising Cost','expense'),(4,'Marketing Offline Cost','expense');
/*!40000 ALTER TABLE `income_expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_addresses`
--

DROP TABLE IF EXISTS `ip_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Type can be Debug, Whitelisted, Banned',
  `value` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '	1 for active; 0 for inactive.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_addresses`
--

LOCK TABLES `ip_addresses` WRITE;
/*!40000 ALTER TABLE `ip_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_custom_variants`
--

DROP TABLE IF EXISTS `item_custom_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_custom_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL COMMENT 'item_id refers the items table id column',
  `variant_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_custom_variants_item_id_foreign_idx` (`item_id`),
  KEY `item_custom_variants_variant_title_index` (`variant_title`),
  CONSTRAINT `item_custom_variants_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_custom_variants`
--

LOCK TABLES `item_custom_variants` WRITE;
/*!40000 ALTER TABLE `item_custom_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_custom_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_units`
--

DROP TABLE IF EXISTS `item_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `abbreviation` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_units_abbreviation_index` (`abbreviation`),
  KEY `item_units_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_units`
--

LOCK TABLES `item_units` WRITE;
/*!40000 ALTER TABLE `item_units` DISABLE KEYS */;
INSERT INTO `item_units` VALUES (1,'each','Each','2020-04-07 02:14:34','2020-04-07 02:14:34'),(2,'Kg','Kilogram','2020-04-07 02:14:57','2020-04-07 02:14:57'),(4,'gm','Gram','2020-04-08 00:18:21','2020-04-08 00:18:21');
/*!40000 ALTER TABLE `item_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'every product/service has unique individual stock_id',
  `stock_category_id` int(10) unsigned NOT NULL,
  `item_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '''product'', ''service''',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'If the product/service  is under a product/service as sub-product/service then it will refer an id of this table, if the product/service is main product/service then the parent id will 0.',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_unit_id` int(10) unsigned DEFAULT NULL,
  `tax_type_id` int(10) unsigned DEFAULT NULL,
  `available_variant` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(16,8) DEFAULT NULL,
  `weight_unit_id` int(10) unsigned DEFAULT NULL,
  `is_stock_managed` tinyint(1) NOT NULL COMMENT 'it means the product/service stock management 1 for on0 for off',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 for inactive \\n1 for active',
  `alert_quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `items_stock_id_unique` (`stock_id`),
  KEY `items_stock_category_id_foreign_idx` (`stock_category_id`),
  KEY `items_item_type_index` (`item_type`),
  KEY `items_name_index` (`name`),
  KEY `items_item_unit_id_foreign_idx` (`item_unit_id`),
  KEY `items_tax_type_id_foreign_idx` (`tax_type_id`),
  KEY `items_weight_unit_id_foreign_idx` (`weight_unit_id`),
  KEY `items_manage_stock_level_index` (`is_stock_managed`),
  KEY `items_is_active_index` (`is_active`),
  CONSTRAINT `items_item_unit_id_foreign` FOREIGN KEY (`item_unit_id`) REFERENCES `item_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `items_stock_category_id_foreign` FOREIGN KEY (`stock_category_id`) REFERENCES `stock_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `items_tax_type_id_foreign` FOREIGN KEY (`tax_type_id`) REFERENCES `tax_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `items_weight_unit_id_foreign` FOREIGN KEY (`weight_unit_id`) REFERENCES `item_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'1',1,'product',0,'Item 1 unik',4,1,NULL,NULL,NULL,NULL,NULL,1,'Test',NULL,1,150,NULL,'2022-10-17 10:41:13');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(1) NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge_bases`
--

DROP TABLE IF EXISTS `knowledge_bases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knowledge_bases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `knowledge_bases_slug_unique` (`slug`),
  KEY `knowledge_bases_group_id_foreign_idx` (`group_id`),
  KEY `knowledge_bases_subject_index` (`subject`),
  KEY `knowledge_bases_status_index` (`status`),
  KEY `knowledge_bases_comments_index` (`comments`),
  KEY `knowledge_bases_publish_date_index` (`publish_date`),
  CONSTRAINT `knowledge_bases_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge_bases`
--

LOCK TABLES `knowledge_bases` WRITE;
/*!40000 ALTER TABLE `knowledge_bases` DISABLE KEYS */;
/*!40000 ALTER TABLE `knowledge_bases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active' COMMENT '''Active'', ''Inactive',
  `is_default` tinyint(1) NOT NULL,
  `direction` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr' COMMENT '(''ltr'', ''rtl'') ltr = left-to-right directionrtl = right-to-left direction',
  PRIMARY KEY (`id`),
  KEY `languages_name_index` (`name`),
  KEY `languages_short_name_index` (`short_name`),
  KEY `languages_status_index` (`status`),
  KEY `languages_is_default_index` (`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en.jpg','Active',1,'ltr');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_sources`
--

DROP TABLE IF EXISTS `lead_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active' COMMENT '(''active'',''inactive'')',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lead_sources_name_unique` (`name`),
  KEY `lead_sources_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_sources`
--

LOCK TABLES `lead_sources` WRITE;
/*!40000 ALTER TABLE `lead_sources` DISABLE KEYS */;
INSERT INTO `lead_sources` VALUES (1,'Facebook','active'),(2,'Google','active'),(3,'Instagram','active');
/*!40000 ALTER TABLE `lead_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_statuses`
--

DROP TABLE IF EXISTS `lead_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(''active'',''inactive'')',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lead_status_name_unique` (`name`),
  KEY `lead_status_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_statuses`
--

LOCK TABLES `lead_statuses` WRITE;
/*!40000 ALTER TABLE `lead_statuses` DISABLE KEYS */;
INSERT INTO `lead_statuses` VALUES (1,'Customer','#00a65a','active'),(2,'Web','#00a65a','active');
/*!40000 ALTER TABLE `lead_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lead_status_id` int(11) NOT NULL,
  `lead_source_id` int(11) NOT NULL,
  `assignee_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `last_contact` datetime DEFAULT NULL,
  `last_status_change` datetime DEFAULT NULL,
  `last_lead_status` int(11) DEFAULT NULL,
  `date_converted` date DEFAULT NULL,
  `date_assigned` date DEFAULT NULL,
  `is_lost` tinyint(1) NOT NULL DEFAULT 0,
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `leads_first_name_index` (`first_name`),
  KEY `leads_last_name_index` (`last_name`),
  KEY `leads_email_index` (`email`),
  KEY `leads_state_index` (`state`),
  KEY `leads_country_id_foreign_idx` (`country_id`),
  KEY `leads_phone_index` (`phone`),
  KEY `leads_lead_status_id_foreign_idx` (`lead_status_id`),
  KEY `leads_lead_source_id_foreign_idx` (`lead_source_id`),
  KEY `leads_assignee_id_foreign_idx` (`assignee_id`),
  KEY `leads_user_id_foreign_idx` (`user_id`),
  KEY `leads_last_contact_index` (`last_contact`),
  KEY `leads_is_lost_index` (`is_lost`),
  KEY `leads_is_public_index` (`is_public`),
  CONSTRAINT `leads_assignee_id_foreign` FOREIGN KEY (`assignee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `leads_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `leads_lead_source_id_foreign` FOREIGN KEY (`lead_source_id`) REFERENCES `lead_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `leads_lead_status_id_foreign` FOREIGN KEY (`lead_status_id`) REFERENCES `lead_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `leads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_address` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = ''Active''\\n 0 = ''Inactive''',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = ''Yes''\\n 0 = ''No''',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locations_code_unique` (`code`),
  KEY `locations_name_index` (`name`),
  KEY `locations_email_index` (`email`),
  KEY `locations_phone_index` (`phone`),
  KEY `locations_is_active_index` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'PL','Primary Location','Primary Location','maxy@gmail.com','01521209953','+880 431177','Primary Location',1,1,'2020-04-07 02:06:34','2022-10-11 03:30:01');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2020_04_06_093559_create_account_types_table',1),(2,'2020_04_06_093559_create_accounts_table',1),(3,'2020_04_06_093559_create_activities_table',1),(4,'2020_04_06_093559_create_backups_table',1),(5,'2020_04_06_093559_create_calendar_events_table',1),(6,'2020_04_06_093559_create_checklist_items_table',1),(7,'2020_04_06_093559_create_countries_table',1),(8,'2020_04_06_093559_create_currencies_table',1),(9,'2020_04_06_093559_create_custom_item_orders_table',1),(10,'2020_04_06_093559_create_customer_activations_table',1),(11,'2020_04_06_093559_create_customer_branches_table',1),(12,'2020_04_06_093559_create_customer_transactions_table',1),(13,'2020_04_06_093559_create_customers_table',1),(14,'2020_04_06_093559_create_departments_table',1),(15,'2020_04_06_093559_create_deposits_table',1),(16,'2020_04_06_093559_create_email_configurations_table',1),(17,'2020_04_06_093559_create_email_templates_table',1),(18,'2020_04_06_093559_create_exchange_rates_table',1),(19,'2020_04_06_093559_create_expenses_table',1),(20,'2020_04_06_093559_create_external_links_table',1),(21,'2020_04_06_093559_create_files_table',1),(22,'2020_04_06_093559_create_general_ledger_transactions_table',1),(23,'2020_04_06_093559_create_income_expense_categories_table',1),(24,'2020_04_06_093559_create_item_custom_variants_table',1),(25,'2020_04_06_093559_create_item_units_table',1),(26,'2020_04_06_093559_create_items_table',1),(27,'2020_04_06_093559_create_jobs_table',1),(28,'2020_04_06_093559_create_languages_table',1),(29,'2020_04_06_093559_create_lead_sources_table',1),(30,'2020_04_06_093559_create_lead_statuses_table',1),(31,'2020_04_06_093559_create_leads_table',1),(32,'2020_04_06_093559_create_locations_table',1),(33,'2020_04_06_093559_create_milestones_table',1),(34,'2020_04_06_093559_create_months_table',1),(35,'2020_04_06_093559_create_notes_table',1),(36,'2020_04_06_093559_create_password_resets_table',1),(37,'2020_04_06_093559_create_payment_gateways_table',1),(38,'2020_04_06_093559_create_payment_methods_table',1),(39,'2020_04_06_093559_create_payment_terms_table',1),(40,'2020_04_06_093559_create_permission_roles_table',1),(41,'2020_04_06_093559_create_permissions_table',1),(42,'2020_04_06_093559_create_preferences_table',1),(43,'2020_04_06_093559_create_priorities_table',1),(44,'2020_04_06_093559_create_project_members_table',1),(45,'2020_04_06_093559_create_project_settings_table',1),(46,'2020_04_06_093559_create_project_statuses_table',1),(47,'2020_04_06_093559_create_projects_table',1),(48,'2020_04_06_093559_create_purchase_order_details_table',1),(49,'2020_04_06_093559_create_purchase_orders_table',1),(50,'2020_04_06_093559_create_purchase_prices_table',1),(51,'2020_04_06_093559_create_purchase_receive_types_table',1),(52,'2020_04_06_093559_create_purchase_taxes_table',1),(53,'2020_04_06_093559_create_received_order_details_table',1),(54,'2020_04_06_093559_create_received_orders_table',1),(55,'2020_04_06_093559_create_role_users_table',1),(56,'2020_04_06_093559_create_roles_table',1),(57,'2020_04_06_093559_create_sale_order_details_table',1),(58,'2020_04_06_093559_create_sale_orders_table',1),(59,'2020_04_06_093559_create_sale_prices_table',1),(60,'2020_04_06_093559_create_sale_taxes_table',1),(61,'2020_04_06_093559_create_sale_types_table',1),(62,'2020_04_06_093559_create_security_roles_table',1),(63,'2020_04_06_093559_create_shipment_details_table',1),(64,'2020_04_06_093559_create_shipments_table',1),(65,'2020_04_06_093559_create_sms_config_table',1),(66,'2020_04_06_093559_create_stock_adjustment_details_table',1),(67,'2020_04_06_093559_create_stock_adjustments_table',1),(68,'2020_04_06_093559_create_stock_categories_table',1),(69,'2020_04_06_093559_create_stock_moves_table',1),(70,'2020_04_06_093559_create_stock_transfers_table',1),(71,'2020_04_06_093559_create_supplier_transactions_table',1),(72,'2020_04_06_093559_create_suppliers_table',1),(73,'2020_04_06_093559_create_tag_assigns_table',1),(74,'2020_04_06_093559_create_tags_table',1),(75,'2020_04_06_093559_create_task_assigns_table',1),(76,'2020_04_06_093559_create_task_comments_table',1),(77,'2020_04_06_093559_create_task_statuses_table',1),(78,'2020_04_06_093559_create_task_timers_table',1),(79,'2020_04_06_093559_create_tasks_table',1),(80,'2020_04_06_093559_create_tax_types_table',1),(81,'2020_04_06_093559_create_ticket_replies_table',1),(82,'2020_04_06_093559_create_ticket_statuses_table',1),(83,'2020_04_06_093559_create_tickets_table',1),(84,'2020_04_06_093559_create_transaction_references_table',1),(85,'2020_04_06_093559_create_transactions_table',1),(86,'2020_04_06_093559_create_transfers_table',1),(87,'2020_04_06_093559_create_url_shortner_config_table',1),(88,'2020_04_06_093559_create_user_departments_table',1),(89,'2020_04_06_093559_create_users_table',1),(90,'2020_04_06_093606_add_foreign_keys_to_accounts_table',1),(91,'2020_04_06_093606_add_foreign_keys_to_activities_table',1),(92,'2020_04_06_093606_add_foreign_keys_to_calendar_events_table',1),(93,'2020_04_06_093606_add_foreign_keys_to_checklist_items_table',1),(94,'2020_04_06_093606_add_foreign_keys_to_custom_item_orders_table',1),(95,'2020_04_06_093606_add_foreign_keys_to_customer_activations_table',1),(96,'2020_04_06_093606_add_foreign_keys_to_customer_branches_table',1),(97,'2020_04_06_093606_add_foreign_keys_to_customer_transactions_table',1),(98,'2020_04_06_093606_add_foreign_keys_to_customers_table',1),(99,'2020_04_06_093606_add_foreign_keys_to_deposits_table',1),(100,'2020_04_06_093606_add_foreign_keys_to_email_templates_table',1),(101,'2020_04_06_093606_add_foreign_keys_to_exchange_rates_table',1),(102,'2020_04_06_093606_add_foreign_keys_to_expenses_table',1),(103,'2020_04_06_093606_add_foreign_keys_to_item_custom_variants_table',1),(104,'2020_04_06_093606_add_foreign_keys_to_items_table',1),(105,'2020_04_06_093606_add_foreign_keys_to_leads_table',1),(106,'2020_04_06_093606_add_foreign_keys_to_milestones_table',1),(107,'2020_04_06_093606_add_foreign_keys_to_notes_table',1),(108,'2020_04_06_093606_add_foreign_keys_to_permission_roles_table',1),(109,'2020_04_06_093606_add_foreign_keys_to_project_members_table',1),(110,'2020_04_06_093606_add_foreign_keys_to_project_settings_table',1),(111,'2020_04_06_093606_add_foreign_keys_to_projects_table',1),(112,'2020_04_06_093606_add_foreign_keys_to_purchase_order_details_table',1),(113,'2020_04_06_093606_add_foreign_keys_to_purchase_orders_table',1),(114,'2020_04_06_093606_add_foreign_keys_to_purchase_prices_table',1),(115,'2020_04_06_093606_add_foreign_keys_to_purchase_taxes_table',1),(116,'2020_04_06_093606_add_foreign_keys_to_received_order_details_table',1),(117,'2020_04_06_093606_add_foreign_keys_to_received_orders_table',1),(118,'2020_04_06_093606_add_foreign_keys_to_role_users_table',1),(119,'2020_04_06_093606_add_foreign_keys_to_sale_order_details_table',1),(120,'2020_04_06_093606_add_foreign_keys_to_sale_orders_table',1),(121,'2020_04_06_093606_add_foreign_keys_to_sale_prices_table',1),(122,'2020_04_06_093606_add_foreign_keys_to_sale_taxes_table',1),(123,'2020_04_06_093606_add_foreign_keys_to_shipment_details_table',1),(124,'2020_04_06_093606_add_foreign_keys_to_shipments_table',1),(125,'2020_04_06_093606_add_foreign_keys_to_stock_adjustment_details_table',1),(126,'2020_04_06_093606_add_foreign_keys_to_stock_adjustments_table',1),(127,'2020_04_06_093606_add_foreign_keys_to_stock_categories_table',1),(128,'2020_04_06_093606_add_foreign_keys_to_stock_moves_table',1),(129,'2020_04_06_093606_add_foreign_keys_to_stock_transfers_table',1),(130,'2020_04_06_093606_add_foreign_keys_to_supplier_transactions_table',1),(131,'2020_04_06_093606_add_foreign_keys_to_suppliers_table',1),(132,'2020_04_06_093606_add_foreign_keys_to_tag_assigns_table',1),(133,'2020_04_06_093606_add_foreign_keys_to_task_assigns_table',1),(134,'2020_04_06_093606_add_foreign_keys_to_task_comments_table',1),(135,'2020_04_06_093606_add_foreign_keys_to_task_timers_table',1),(136,'2020_04_06_093606_add_foreign_keys_to_tasks_table',1),(137,'2020_04_06_093606_add_foreign_keys_to_ticket_replies_table',1),(138,'2020_04_06_093606_add_foreign_keys_to_tickets_table',1),(139,'2020_04_06_093606_add_foreign_keys_to_transactions_table',1),(140,'2020_04_06_093606_add_foreign_keys_to_transfers_table',1),(141,'2020_04_06_093606_add_foreign_keys_to_user_departments_table',1),(142,'2020_04_06_093606_add_foreign_keys_to_users_table',1),(143,'2020_08_13_061520_create_ip_addresses_table',1),(144,'2021_06_17_131601_create_canned_messages_table',1),(145,'2021_06_17_145137_create_canned_links_table',1),(146,'2021_06_19_055035_create_groups_table',1),(147,'2021_06_19_055555_create_knowledge_bases_table',1),(148,'2021_06_29_054604_create_captcha_configurations_table',1),(149,'2021_06_29_054929_create_currency_converter_configurations_table',1),(150,'2021_07_06_044441_add_foreign_keys_to_knowledge_bases_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_visible_to_customer` tinyint(1) DEFAULT 0 COMMENT '1=yes, 0=no',
  `due_date` date DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `color` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `milestones_project_id_foreign_idx` (`project_id`),
  KEY `milestones_name_index` (`name`),
  KEY `milestones_due_date_index` (`due_date`),
  CONSTRAINT `milestones_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `months`
--

DROP TABLE IF EXISTS `months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `months` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `months_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `months`
--

LOCK TABLES `months` WRITE;
/*!40000 ALTER TABLE `months` DISABLE KEYS */;
INSERT INTO `months` VALUES (4,'Appril'),(8,'August'),(12,'December'),(2,'February'),(1,'January'),(7,'July'),(6,'June'),(3,'March'),(5,'May'),(11,'November'),(10,'October'),(9,'September');
/*!40000 ALTER TABLE `months` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `related_to_id` int(10) unsigned DEFAULT NULL,
  `related_to_type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `notes_user_id_foreign_idx` (`user_id`),
  KEY `notes_subject_index` (`subject`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_gateways`
--

DROP TABLE IF EXISTS `payment_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_gateways` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_gateways_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_gateways`
--

LOCK TABLES `payment_gateways` WRITE;
/*!40000 ALTER TABLE `payment_gateways` DISABLE KEYS */;
INSERT INTO `payment_gateways` VALUES (1,'bank_account_id','1','Bank');
/*!40000 ALTER TABLE `payment_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consumer_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consumer_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approve` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 for not default;\r\n1 for default',
  `is_active` tinyint(1) NOT NULL COMMENT '0 for inactive;\\n1 for active',
  PRIMARY KEY (`id`),
  KEY `payment_methods_name_index` (`name`),
  KEY `payment_methods_is_default_index` (`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'Bank',NULL,'1',NULL,NULL,'manual',1,1);
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_terms`
--

DROP TABLE IF EXISTS `payment_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days_before_due` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 for default;0 for otherwise;',
  PRIMARY KEY (`id`),
  KEY `payment_terms_name_index` (`name`),
  KEY `payment_terms_is_default_index` (`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_terms`
--

LOCK TABLES `payment_terms` WRITE;
/*!40000 ALTER TABLE `payment_terms` DISABLE KEYS */;
INSERT INTO `payment_terms` VALUES (1,'Net 7',7,1),(2,'Net 10',10,0),(3,'Net 30',30,0);
/*!40000 ALTER TABLE `payment_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_roles`
--

DROP TABLE IF EXISTS `permission_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_roles` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_roles_permission_id_foreign_idx` (`permission_id`),
  KEY `permission_roles_role_id_foreign_idx` (`role_id`),
  CONSTRAINT `permission_roles_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_roles`
--

LOCK TABLES `permission_roles` WRITE;
/*!40000 ALTER TABLE `permission_roles` DISABLE KEYS */;
INSERT INTO `permission_roles` VALUES (2,1),(2,5),(3,1),(3,5),(4,1),(4,5),(5,1),(5,5),(6,1),(6,5),(7,1),(7,5),(8,1),(8,5),(9,1),(9,5),(10,1),(10,5),(11,1),(11,5),(12,1),(12,5),(13,1),(13,5),(15,1),(15,5),(16,1),(16,5),(17,1),(17,5),(18,1),(18,5),(19,1),(19,4),(19,5),(20,1),(20,4),(20,5),(21,1),(21,4),(21,5),(22,1),(22,4),(22,5),(23,1),(23,5),(24,1),(24,5),(25,1),(25,5),(26,1),(26,5),(27,1),(27,5),(28,1),(28,5),(29,1),(29,5),(30,1),(30,5),(31,1),(31,5),(32,1),(32,5),(33,1),(33,5),(34,1),(34,5),(35,1),(35,5),(36,1),(36,5),(37,1),(37,5),(38,1),(38,5),(39,1),(39,5),(40,1),(40,5),(41,1),(41,5),(42,1),(42,5),(43,1),(43,5),(44,1),(44,5),(45,1),(45,5),(46,1),(46,5),(47,1),(47,5),(48,1),(48,5),(50,1),(50,3),(50,5),(51,1),(51,4),(51,5),(52,1),(52,4),(52,5),(53,1),(53,5),(54,1),(54,5),(55,1),(55,5),(56,1),(56,5),(57,1),(57,5),(58,1),(59,1),(60,1),(60,5),(61,1),(61,5),(62,1),(62,5),(63,1),(63,5),(64,1),(65,1),(66,1),(67,1),(68,1),(68,5),(69,1),(69,5),(70,1),(70,5),(71,1),(71,5),(72,1),(73,1),(73,5),(74,1),(74,5),(75,1),(75,5),(76,1),(76,5),(77,1),(77,5),(78,1),(78,5),(79,1),(79,5),(80,1),(80,5),(81,1),(81,5),(82,1),(82,5),(83,1),(83,5),(84,1),(84,5),(85,1),(86,1),(87,1),(88,1),(89,1),(89,5),(90,1),(90,5),(91,1),(91,5),(92,1),(92,5),(93,1),(93,5),(94,1),(94,5),(95,1),(95,5),(96,1),(96,5),(97,1),(97,5),(98,1),(98,5),(99,1),(99,5),(100,1),(100,5),(101,1),(101,5),(102,1),(102,5),(104,1),(104,5),(107,1),(108,1),(111,1),(112,1),(112,5),(113,1),(114,1),(114,5),(115,1),(115,5),(116,1),(116,5),(117,1),(117,5),(118,1),(118,5),(119,1),(119,5),(120,1),(120,5),(121,1),(121,5),(122,1),(122,2),(122,5),(123,1),(123,2),(123,5),(124,1),(124,2),(124,5),(125,1),(125,2),(125,5),(126,1),(126,2),(126,5),(127,1),(127,2),(127,5),(128,1),(128,2),(128,5),(129,1),(129,2),(129,5),(130,1),(130,5),(131,1),(131,5),(132,1),(132,5),(133,1),(133,5),(134,1),(134,5),(135,1),(135,5),(136,1),(136,5),(137,1),(137,5),(140,5),(141,1),(141,5),(142,1),(142,5),(143,1),(143,5),(144,1),(144,5),(145,1),(145,5),(146,1),(146,2),(146,5),(147,1),(147,2),(147,5),(151,1),(151,2),(151,5),(152,1),(152,2),(152,5),(153,1),(153,2),(154,1),(154,2),(154,5),(155,1),(155,2),(155,5),(158,1),(159,5),(160,5),(161,5),(162,5),(163,5),(164,5),(165,5),(166,5),(167,5),(168,1),(168,5),(169,1),(169,3),(169,5),(170,1),(170,3),(170,5),(171,1),(171,3),(171,5),(172,1),(172,2),(172,5),(173,1),(173,5),(174,1),(174,2),(174,5),(175,1),(176,1),(177,1),(178,1),(179,1),(179,2),(179,5),(180,1),(180,2),(180,5),(191,1),(191,5),(192,1),(192,5),(193,1),(193,5),(194,1),(194,5),(195,1),(195,5),(196,1),(196,5),(197,1),(197,5),(198,1),(198,5),(199,1),(199,5),(200,1),(200,5),(201,1),(201,5),(202,1),(202,5),(203,1),(203,5),(204,1),(204,5),(205,1),(205,5),(211,1),(211,5),(212,1),(212,5),(213,1),(213,5),(214,1),(214,5),(215,1),(215,4),(215,5),(216,1),(217,1),(218,1),(218,5),(219,1),(219,5),(220,1),(221,1),(221,5),(222,1),(222,5),(223,1),(223,5),(224,1),(224,5),(225,1),(225,5),(228,1),(228,5),(229,1),(229,5),(230,1),(230,5),(231,1),(231,5),(232,1),(233,1),(233,5),(234,1),(234,5),(235,1),(235,5),(236,1),(236,5),(237,1),(237,5),(238,1),(239,1),(240,1),(240,5),(241,1),(241,5),(242,1),(242,5),(243,1),(243,5),(244,1),(244,5),(245,1),(245,5),(246,1),(246,5),(247,1),(247,5),(248,1),(248,5),(249,1),(249,5),(250,1),(250,5),(251,1),(251,5),(252,1),(252,5),(253,1),(253,5),(254,1),(254,5),(255,1),(255,5),(256,1),(256,5),(257,1),(257,5),(258,1),(258,5);
/*!40000 ALTER TABLE `permission_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_group` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`),
  KEY `permissions_display_name_index` (`display_name`),
  KEY `permissions_permission_group_index` (`permission_group`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (2,'manage_customer','Manage Customers','Manage Customers','Customers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'add_customer','Add Customer','Add Customer','Customers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'edit_customer','Edit Customer','Edit Customer','Customers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'delete_customer','Delete Customer','Delete Customer','Customers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'manage_supplier','Manage Suppliers','Manage Suppliers','Suppliers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'add_supplier','Add Supplier','Add Supplier','Suppliers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'edit_supplier','Edit Supplier','Edit Supplier','Suppliers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'delete_supplier','Delete Supplier','Delete Supplier','Suppliers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'manage_item','Manage Items','Manage Items','Items','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'add_item','Add Item','Add Item','Items','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'edit_item','Edit Item','Edit Item','Items','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'delete_item','Delete Item','Delete Item','Items','0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,'manage_quotation','Manage Quotations','Manage Quotations','Quotations','0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,'add_quotation','Add Quotation','Add Quotation','Quotations','0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,'edit_quotation','Edit Quotation','Edit Quotation','Quotations','0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,'delete_quotation','Delete Quotation','Delete Quotation','Quotations','0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,'manage_invoice','Manage Invoices','Manage Invoices','Invoices','0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,'add_invoice','Add Invoice','Add Invoice','Invoices','0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,'edit_invoice','Edit Invoice','Edit Invoice','Invoices','0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,'delete_invoice','Delete Invoice','Delete Invoice','Invoices','0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,'manage_payment','Manage Payment','Manage Payment','Customer Payments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,'add_payment','Add Payment','Add Payment','Customer Payments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,'edit_payment','Edit Payment','Edit Payment','Customer Payments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,'delete_payment','Delete Payment','Delete Payment','Customer Payments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,'manage_purchase','Manage Purchase','Manage Purchase','Purchases','0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,'add_purchase','Add Purchase','Add Purchase','Purchases','0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,'edit_purchase','Edit Purchase','Edit Purchase','Purchases','0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,'delete_purchase','Delete Purchase','Delete Purchase','Purchases','0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,'manage_banking_transaction','Manage Banking & Transactions','Manage Banking & Transactions','Banking and Transactions','0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,'manage_bank_account','Manage Bank Accounts','Manage Bank Accounts','Bank Accounts','0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,'add_bank_account','Add Bank Account','Add Bank Account','Bank Accounts','0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,'edit_bank_account','Edit Bank Account','Edit Bank Account','Bank Accounts','0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,'delete_bank_account','Delete Bank Account','Delete Bank Account','Bank Accounts','0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,'manage_deposit','Manage Deposit','Manage Deposit','Bank Account Deposits','0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,'add_deposit','Add Deposit','Add Deposit','Bank Account Deposits','0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,'edit_deposit','Edit Deposit','Edit Deposit','Bank Account Deposits','0000-00-00 00:00:00','0000-00-00 00:00:00'),(39,'delete_deposit','Delete Deposit','Delete Deposit','Bank Account Deposits','0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,'manage_balance_transfer','Manage Balance Transfer','Manage Balance Transfer','Bank Account Transfers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,'add_balance_transfer','Add Balance Transfer','Add Balance Transfer','Bank Account Transfers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,'edit_balance_transfer','Edit Balance Transfer','Edit Balance Transfer','Bank Account Transfers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,'delete_balance_transfer','Delete Balance Transfer','Delete Balance Transfer','Bank Account Transfers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(44,'manage_transaction','Manage Transactions','Manage Transactions','Transactions','0000-00-00 00:00:00','0000-00-00 00:00:00'),(45,'manage_expense','Manage Expense','Manage Expense','Expenses','0000-00-00 00:00:00','0000-00-00 00:00:00'),(46,'add_expense','Add Expense','Add Expense','Expenses','0000-00-00 00:00:00','0000-00-00 00:00:00'),(47,'edit_expense','Edit Expense','Edit Expense','Expenses','0000-00-00 00:00:00','0000-00-00 00:00:00'),(48,'delete_expense','Delete Expense','Delete Expense','Expenses','0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,'manage_stock_on_hand','Manage Inventory Stock On Hand','Manage Inventory Stock On Hand','Stock On Hand','0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,'manage_sale_report','Manage Sales Report','Manage Sales Report','Sale Reports','0000-00-00 00:00:00','0000-00-00 00:00:00'),(52,'manage_sale_history_report','Manage Sales History Report','Manage Sales History Report','Sale History Reports','0000-00-00 00:00:00','0000-00-00 00:00:00'),(53,'manage_purchase_report','Manage Purchase Report','Manage Purchase Report','Purchase Reports','0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,'manage_team_report','Manage Team Member Report','Manage Team Member Report','Team Reports','0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,'manage_expense_report','Manage Expense Report','Manage Expense Report','Expense Reports','0000-00-00 00:00:00','0000-00-00 00:00:00'),(56,'manage_income_report','Manage Income Report','Manage Income Report','Income Reports','0000-00-00 00:00:00','0000-00-00 00:00:00'),(57,'manage_income_vs_expense','Manage Income vs Expense','Manage Income vs Expense','Income vs Expense','0000-00-00 00:00:00','0000-00-00 00:00:00'),(58,'manage_setting','Manage Settings','Manage Settings','Settings','0000-00-00 00:00:00','0000-00-00 00:00:00'),(59,'manage_company_setting','Manage Company Setting','Manage Company Setting','Company Settings','0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,'manage_team_member','Manage Team Member','Manage Team Member','Team Members','0000-00-00 00:00:00','0000-00-00 00:00:00'),(61,'add_team_member','Add Team Member','Add Team Member','Team Members','0000-00-00 00:00:00','0000-00-00 00:00:00'),(62,'edit_team_member','Edit Team Member','Edit Team Member','Team Members','0000-00-00 00:00:00','0000-00-00 00:00:00'),(63,'delete_team_member','Delete Team Member','Delete Team Member','Team Members','0000-00-00 00:00:00','0000-00-00 00:00:00'),(64,'manage_role','Manage Roles','Manage Roles','Roles','0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,'add_role','Add Role','Add Role','Roles','0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,'edit_role','Edit Role','Edit Role','Roles','0000-00-00 00:00:00','0000-00-00 00:00:00'),(67,'delete_role','Delete Role','Delete Role','Roles','0000-00-00 00:00:00','0000-00-00 00:00:00'),(68,'manage_location','Manage Location','Manage Location','Locations','0000-00-00 00:00:00','0000-00-00 00:00:00'),(69,'add_location','Add Location','Add Location','Locations','0000-00-00 00:00:00','0000-00-00 00:00:00'),(70,'edit_location','Edit Location','Edit Location','Locations','0000-00-00 00:00:00','0000-00-00 00:00:00'),(71,'delete_location','Delete Location','Delete Location','Locations','0000-00-00 00:00:00','0000-00-00 00:00:00'),(72,'manage_general_setting','Manage General Settings','Manage General Settings','General Settings','0000-00-00 00:00:00','0000-00-00 00:00:00'),(73,'manage_item_category','Manage Item Category','Manage Item Category','Item Categories','0000-00-00 00:00:00','0000-00-00 00:00:00'),(74,'add_item_category','Add Item Category','Add Item Category','Item Categories','0000-00-00 00:00:00','0000-00-00 00:00:00'),(75,'edit_item_category','Edit Item Category','Edit Item Category','Item Categories','0000-00-00 00:00:00','0000-00-00 00:00:00'),(76,'delete_item_category','Delete Item Category','Delete Item Category','Item Categories','0000-00-00 00:00:00','0000-00-00 00:00:00'),(77,'manage_income_expense_category','Manage Income Expense Category','Manage Income Expense Category','Income Expense Categories','0000-00-00 00:00:00','0000-00-00 00:00:00'),(78,'add_income_expense_category','Add Income Expense Category','Add Income Expense Category','Income Expense Categories','0000-00-00 00:00:00','0000-00-00 00:00:00'),(79,'edit_income_expense_category','Edit Income Expense Category','Edit Income Expense Category','Income Expense Categories','0000-00-00 00:00:00','0000-00-00 00:00:00'),(80,'delete_income_expense_category','Delete Income Expense Category','Delete Income Expense Category','Income Expense Categories','0000-00-00 00:00:00','0000-00-00 00:00:00'),(81,'manage_unit','Manage Unit','Manage Unit','Units','0000-00-00 00:00:00','0000-00-00 00:00:00'),(82,'add_unit','Add Unit','Add Unit','Units','0000-00-00 00:00:00','0000-00-00 00:00:00'),(83,'edit_unit','Edit Unit','Edit Unit','Units','0000-00-00 00:00:00','0000-00-00 00:00:00'),(84,'delete_unit','Delete Unit','Delete Unit','Units','0000-00-00 00:00:00','0000-00-00 00:00:00'),(85,'manage_db_backup','Manage Database Backup','Manage Database Backup','Database Backups','0000-00-00 00:00:00','0000-00-00 00:00:00'),(86,'add_db_backup','Add Database Backup','Add Database Backup','Database Backups','0000-00-00 00:00:00','0000-00-00 00:00:00'),(87,'delete_db_backup','Delete Database Backup','Delete Database Backup','Database Backups','0000-00-00 00:00:00','0000-00-00 00:00:00'),(88,'manage_email_setup','Manage Email Setup','Manage Email Setup','Email Setup','0000-00-00 00:00:00','0000-00-00 00:00:00'),(89,'manage_finance','Manage Finance','Manage Finance','Finances','0000-00-00 00:00:00','0000-00-00 00:00:00'),(90,'manage_tax','Manage Taxs','Manage Taxs','Taxes','0000-00-00 00:00:00','0000-00-00 00:00:00'),(91,'add_tax','Add Tax','Add Tax','Taxes','0000-00-00 00:00:00','0000-00-00 00:00:00'),(92,'edit_tax','Edit Tax','Edit Tax','Taxes','0000-00-00 00:00:00','0000-00-00 00:00:00'),(93,'delete_tax','Delete Tax','Delete Tax','Taxes','0000-00-00 00:00:00','0000-00-00 00:00:00'),(94,'manage_currency','Manage Currency','Manage Currency','Currencies','0000-00-00 00:00:00','0000-00-00 00:00:00'),(95,'add_currency','Add Currency','Add Currency','Currencies','0000-00-00 00:00:00','0000-00-00 00:00:00'),(96,'edit_currency','Edit Currency','Edit Currency','Currencies','0000-00-00 00:00:00','0000-00-00 00:00:00'),(97,'delete_currency','Delete Currency','Delete Currency','Currencies','0000-00-00 00:00:00','0000-00-00 00:00:00'),(98,'manage_payment_term','Manage Payment Term','Manage Payment Term','Payment Terms','0000-00-00 00:00:00','0000-00-00 00:00:00'),(99,'add_payment_term','Add Payment Term','Add Payment Term','Payment Terms','0000-00-00 00:00:00','0000-00-00 00:00:00'),(100,'edit_payment_term','Edit Payment Term','Edit Payment Term','Payment Terms','0000-00-00 00:00:00','0000-00-00 00:00:00'),(101,'delete_payment_term','Delete Payment Term','Delete Payment Term','Payment Terms','0000-00-00 00:00:00','0000-00-00 00:00:00'),(102,'manage_payment_method','Manage Payment Method','Manage Payment Method','Payment Methods','0000-00-00 00:00:00','0000-00-00 00:00:00'),(104,'edit_payment_method','Edit Payment Method','Edit Payment Method','Payment Methods','0000-00-00 00:00:00','0000-00-00 00:00:00'),(107,'manage_email_template','Manage Email Template','Manage Email Template','Email Templates','0000-00-00 00:00:00','0000-00-00 00:00:00'),(108,'manage_quotation_email_template','Manage Quotation Template','Manage Quotation Email Template','Quotation Email Templates','0000-00-00 00:00:00','0000-00-00 00:00:00'),(111,'manage_preference','Manage Preference','Manage Preference','Preferences','0000-00-00 00:00:00','0000-00-00 00:00:00'),(112,'manage_barcode','Manage barcode/label','Manage barcode/label','Barcode','0000-00-00 00:00:00','0000-00-00 00:00:00'),(113,'edit_db_backup','Download Database Backup','Download Database Backup','Database Backups','0000-00-00 00:00:00','0000-00-00 00:00:00'),(114,'manage_purch_payment','Manage Purchase Payment','Manage Purchase Payment','Purchase Payments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(115,'add_purch_payment','Add Purchase Payment','Add Purchase Payment','Purchase Payments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(116,'edit_purch_payment','Edit Purchase Payment','Edit Purchase Payment','Purchase Payments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(117,'delete_purch_payment','Delete Purchase Payment','Delete Purchase Payment','Purchase Payments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(118,'manage_ticket','Manage Ticket','Manage Ticket','Tickets','0000-00-00 00:00:00','0000-00-00 00:00:00'),(119,'add_ticket','Add Ticket','Add Ticket','Tickets','0000-00-00 00:00:00','0000-00-00 00:00:00'),(120,'edit_ticket','Edit Ticket','Edit Ticket','Tickets','0000-00-00 00:00:00','0000-00-00 00:00:00'),(121,'delete_ticket','Delete Ticket','Delete Ticket','Tickets','0000-00-00 00:00:00','0000-00-00 00:00:00'),(122,'manage_project','Manage Project','Manage Project','Projects','0000-00-00 00:00:00','0000-00-00 00:00:00'),(123,'add_project','Add Project','Add Project','Projects','0000-00-00 00:00:00','0000-00-00 00:00:00'),(124,'edit_project','Edit Project','Edit Project','Projects','0000-00-00 00:00:00','0000-00-00 00:00:00'),(125,'delete_project','Delete Project','Delete Project','Projects','0000-00-00 00:00:00','0000-00-00 00:00:00'),(126,'manage_task','Manage Task','Manage Task','Tasks','0000-00-00 00:00:00','0000-00-00 00:00:00'),(127,'add_task','Add Task','Add Task','Tasks','0000-00-00 00:00:00','0000-00-00 00:00:00'),(128,'edit_task','Edit Task','Edit Task','Tasks','0000-00-00 00:00:00','0000-00-00 00:00:00'),(129,'delete_task','Delete Task','Delete Task','Tasks','0000-00-00 00:00:00','0000-00-00 00:00:00'),(130,'manage_milestone','Manage Milestone','Manage Milestone','Milestones','0000-00-00 00:00:00','0000-00-00 00:00:00'),(131,'add_milestone','Add Milestone','Add Milestone','Milestones','0000-00-00 00:00:00','0000-00-00 00:00:00'),(132,'edit_milestone','Edit Milestone','Edit Milestone','Milestones','0000-00-00 00:00:00','0000-00-00 00:00:00'),(133,'delete_milestone','Delete Milestone','Delete Milestone','Milestones','0000-00-00 00:00:00','0000-00-00 00:00:00'),(134,'manage_department','Manage Department','Manage Department','Departments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(135,'add_department','Add Department','Add Department','Departments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(136,'edit_department','Edit Department','Edit Department','Departments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(137,'delete_department','Delete Department','Delete Department','Departments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(140,'manage_purch_receive','Manage Purchase Receive','Manage Purchase Receive','Purchase Receive','0000-00-00 00:00:00','0000-00-00 00:00:00'),(141,'edit_purchase_receive','Edit Purchase Receive','Edit Purchase Receive','Purchase Receive','0000-00-00 00:00:00','0000-00-00 00:00:00'),(142,'delete_purchase_receive','Delete Purchase Receive','Delete Purchase Receive','Purchase Receive','0000-00-00 00:00:00','0000-00-00 00:00:00'),(143,'add_calendar_event','Add Calendar Event','Add Calendar Event','Calendar','0000-00-00 00:00:00','0000-00-00 00:00:00'),(144,'edit_calendar_event','Edit Calendar Event','Edit Calendar Event','Calendar','0000-00-00 00:00:00','0000-00-00 00:00:00'),(145,'delete_calendar_event','Delete Calendar Event','Delete Calendar Event','Calendar','0000-00-00 00:00:00','0000-00-00 00:00:00'),(146,'edit_task_comment','Edit Task Comment','Edit Task Comment','Task Comments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(147,'delete_task_comment','Delete Task Comment','Delete Task Comment','Task Comments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(151,'add_task_assignee','Add Task Assignee','Add Task Assignee','Task Assignees','0000-00-00 00:00:00','0000-00-00 00:00:00'),(152,'delete_task_assignee','Delete Task Assignee','Delete Task Assignee','Task Assignees','0000-00-00 00:00:00','0000-00-00 00:00:00'),(153,'delete_project_file','Delete Project File','Delete Project File','Project Files','0000-00-00 00:00:00','0000-00-00 00:00:00'),(154,'add_project_note','Add Project Note','Add Project Note','Project Notes','0000-00-00 00:00:00','0000-00-00 00:00:00'),(155,'edit_project_note','Edit Project Note','Edit Project Note','Project Notes','0000-00-00 00:00:00','0000-00-00 00:00:00'),(158,'manage_sms_setup',' Manage SMS Setup',' Manage SMS Setup','SMS Setup','0000-00-00 00:00:00','0000-00-00 00:00:00'),(159,'own_quotation','View Own Quotations','View Own Quotations','Quotations','0000-00-00 00:00:00','0000-00-00 00:00:00'),(160,'own_invoice','View Own Invoice','View Own Invoice','Invoices','0000-00-00 00:00:00','0000-00-00 00:00:00'),(161,'own_payment','View Own Payment','View Own Payment','Customer Payments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(162,'own_purchase','View Own Purchase','View Own Purchase','Purchases','0000-00-00 00:00:00','0000-00-00 00:00:00'),(163,'own_deposit','View Own Deposit','View Own Deposit','Bank Account Deposits','0000-00-00 00:00:00','0000-00-00 00:00:00'),(164,'own_balance_transfer','View Own Balance Transfer','View Own Balance Transfer','Bank Account Transfers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(165,'own_transaction','View Own Transactions','View Own Transactions','Transactions','0000-00-00 00:00:00','0000-00-00 00:00:00'),(166,'own_expense','View Own Expense','View Own Expense','Expenses','0000-00-00 00:00:00','0000-00-00 00:00:00'),(167,'own_purchase_payment','View Own Purchase Payment','View Own Purchase Payment','Purchase Payments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(168,'own_purchase_receive','View Own Purchase Receive','View Own Purchase Receive','Purchase Receives','0000-00-00 00:00:00','0000-00-00 00:00:00'),(169,'delete_stock_transfer','Delete Stock Transfer','Delete Stock Transfer','Stock Transfers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(170,'edit_stock_adjustment','Edit Stock Adjustment','Edit Stock Adjustment','Stock Adjustments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(171,'delete_stock_adjustment','Delete Stock Adjustment','Delete Stock Adjustment','Stock Adjustments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(172,'own_task','View Own Task','View Own Task','Tasks','0000-00-00 00:00:00','0000-00-00 00:00:00'),(173,'own_ticket','View Own Ticket','View Own Ticket','Tickets','0000-00-00 00:00:00','0000-00-00 00:00:00'),(174,'own_project','View Own Project','View Own Project','Projects','0000-00-00 00:00:00','0000-00-00 00:00:00'),(175,'manage_language','Manage Languages','Manage Languages','Languages','0000-00-00 00:00:00','0000-00-00 00:00:00'),(176,'add_language','Add Language','Add Language','Languages','0000-00-00 00:00:00','0000-00-00 00:00:00'),(177,'delete_language','Delete Languages','Delete Languages','Languages','0000-00-00 00:00:00','0000-00-00 00:00:00'),(178,'edit_language','Edit Language','Edit Language','Languages','0000-00-00 00:00:00','0000-00-00 00:00:00'),(179,'add_task_timer','Add Task Timer','Add Task Timer','Task Timers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(180,'delete_task_timer','Delete Task Timer','Delete Task Timer','Task Timers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(191,'add_customer_note','Add Customer Note','Add Customer Note','Customer Notes','0000-00-00 00:00:00','0000-00-00 00:00:00'),(192,'edit_customer_note','Edit Customer Note','Edit Customer Note','Customer Notes','0000-00-00 00:00:00','0000-00-00 00:00:00'),(193,'delete_customer_note','Delete Customer Note','Delete Customer Note','Customer Notes','0000-00-00 00:00:00','0000-00-00 00:00:00'),(194,'manage_lead_status','Manage Lead Status','Manage Lead Status','Lead Statuses','0000-00-00 00:00:00','0000-00-00 00:00:00'),(195,'add_lead_status','Add Lead Status','Add Lead Status','Lead Statuses','0000-00-00 00:00:00','0000-00-00 00:00:00'),(196,'edit_lead_status','Edit Lead Status','Edit Lead Status','Lead Statuses','0000-00-00 00:00:00','0000-00-00 00:00:00'),(197,'delete_lead_status','Delete Lead Status','Delete Lead Status','Lead Statuses','0000-00-00 00:00:00','0000-00-00 00:00:00'),(198,'manage_lead_source','Manage Lead Source','Manage Lead Source','Lead Sources','0000-00-00 00:00:00','0000-00-00 00:00:00'),(199,'add_lead_source','Add Lead Source','Add Lead Source','Lead Sources','0000-00-00 00:00:00','0000-00-00 00:00:00'),(200,'edit_lead_source','Edit Lead Source','Edit Lead Source','Lead Sources','0000-00-00 00:00:00','0000-00-00 00:00:00'),(201,'delete_lead_source','Delete Lead Source','Delete Lead Source','Lead Sources','0000-00-00 00:00:00','0000-00-00 00:00:00'),(202,'manage_lead','Manage Lead','Manage Lead','Leads','0000-00-00 00:00:00','0000-00-00 00:00:00'),(203,'add_lead','Add Lead','Add Lead','Leads','0000-00-00 00:00:00','0000-00-00 00:00:00'),(204,'edit_lead','Edit Lead','Edit Lead','Leads','0000-00-00 00:00:00','0000-00-00 00:00:00'),(205,'delete_lead','Delete Lead','Delete Lead','Leads','0000-00-00 00:00:00','0000-00-00 00:00:00'),(211,'manage_account_type','Manage Account Type','Manage Account Type','Bank Account Types','0000-00-00 00:00:00','0000-00-00 00:00:00'),(212,'add_account_type','Add Account Type','Add Account Type ','Bank Account Types','0000-00-00 00:00:00','0000-00-00 00:00:00'),(213,'edit_account_type','Edit Account Type','Edit Account Type','Bank Account Types','0000-00-00 00:00:00','0000-00-00 00:00:00'),(214,'delete_account_type','Delete Account Type','Delete Account Type','Bank Account Types','0000-00-00 00:00:00','0000-00-00 00:00:00'),(215,'manage_pos','Manage POs','Manage Point of Sale','POS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(216,'manage_url_shortner','URL Shortner','Manage url shortner','URL Shortner','0000-00-00 00:00:00','0000-00-00 00:00:00'),(217,'manage_sms_template','Manage SMS Template','manage sms template','SMS Templates','0000-00-00 00:00:00','0000-00-00 00:00:00'),(218,'edit_ticket_reply','Edit Ticket Reply','Edit Ticket Reply','Ticket Reply','0000-00-00 00:00:00','0000-00-00 00:00:00'),(219,'manage_calendar','Manage Calendar','Manage Calendar','Calendar','0000-00-00 00:00:00','0000-00-00 00:00:00'),(220,'edit_url_shortner','Edit URL Shortner','Edit URL Shortner','URL Shortner','0000-00-00 00:00:00','0000-00-00 00:00:00'),(221,'manage_stock_transfer','Manage Stock Transfer','Manage Stock Transfer','Stock Transfers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(222,'add_stock_transfer','Add Stock Transfer','Add Stock Transfer','Stock Transfers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(223,'edit_stock_transfer','Edit Stock Transfer','Edit Stock Transfer','Stock Transfers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(224,'manage_stock_adjustment','Manage Stock Adjustment','Manage Stock Adjustment','Stock Adjustments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(225,'add_stock_adjustment','Add Stock Adjustment','Add Stock Adjustment','Stock Adjustments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(228,'manage_ticket_reply','Manage Ticket Reply','Manage Ticket Reply','Ticket Reply','0000-00-00 00:00:00','0000-00-00 00:00:00'),(229,'own_stock_transfer','View Own Stock Transfer','View Own Stock Transfer','Stock Transfers','0000-00-00 00:00:00','0000-00-00 00:00:00'),(230,'own_stock_adjustment','View Own Stock Adjustment','View Own Stock Adjustment','Stock Adjustments','0000-00-00 00:00:00','0000-00-00 00:00:00'),(231,'delete_project_note','Delete Project Note','Delete Project Note','Project Notes','0000-00-00 00:00:00','0000-00-00 00:00:00'),(232,'manage_theme_preference','Manage Theme Preference','Manage Theme Preference','Theme Preference','0000-00-00 00:00:00','0000-00-00 00:00:00'),(233,'manage_timesheet','Manage Timesheet','Manage Timesheet','Timesheets','0000-00-00 00:00:00','0000-00-00 00:00:00'),(234,'add_timesheet','Add Timesheet','Add Timesheet','Timesheets','0000-00-00 00:00:00','0000-00-00 00:00:00'),(235,'edit_timesheet','Edit Timesheet','Edit Timesheet','Timesheets','0000-00-00 00:00:00','0000-00-00 00:00:00'),(236,'delete_timesheet','Delete Timesheet','Delete Timesheet','Timesheets','0000-00-00 00:00:00','0000-00-00 00:00:00'),(237,'own_timesheet','View Own Timesheet','View Own Timesheet','Timesheets','0000-00-00 00:00:00','0000-00-00 00:00:00'),(238,'manage_captcha_setup','Manage Captcha Setup','Manage Captcha Setup','Captcha Setup','2021-06-01 08:16:42','2021-06-09 08:16:42'),(239,'manage_currency_converter_setup','Manage Currency Converter Setup','Manage Currency Converter Setup','Currency Converter Setup','2021-06-01 08:16:42','2021-06-09 08:16:42'),(240,'manage_canned_message','Manage Canned Message','Manage Canned Message','Canned Messages','2021-06-05 09:10:21',NULL),(241,'add_canned_message','Add Canned Message','Add Canned Message','Canned Messages','2021-06-05 09:10:21',NULL),(242,'edit_canned_message','Edit Canned Message','Edit Canned Message','Canned Messages','2021-06-05 09:10:21',NULL),(243,'delete_canned_message','Delete Canned Message','Delete Canned Message','Canned Messages','2021-06-05 09:10:21',NULL),(244,'manage_canned_link','Manage Canned Link','Manage Canned Link','Canned Links','2021-06-05 09:10:21',NULL),(245,'add_canned_link','Add Canned Link','Add Canned Link','Canned Links','2021-06-05 09:10:21',NULL),(246,'edit_canned_link','Edit Canned Link','Edit Canned Link','Canned Links','2021-06-05 09:10:21',NULL),(247,'delete_canned_link','Delete Canned Link','Delete Canned Link','Canned Links','2021-06-05 09:10:21',NULL),(248,'manage_group','Manage Group','Manage Group','Groups','2021-06-05 09:10:21',NULL),(249,'add_group','Add Group','Add Group','Groups','2021-06-05 09:10:21',NULL),(250,'edit_group','Edit Group','Edit Group','Groups','2021-06-05 09:10:21',NULL),(251,'delete_group','Delete Group','Delete Group','Groups','2021-06-05 09:10:21',NULL),(252,'manage_knowledge_base','Manage Knowledge Base','Manage Knowledge Base','Knowledge Base','2021-06-05 09:10:21',NULL),(253,'add_knowledge_base','Add Knowledge Base','Add Knowledge Base','Knowledge Base','2021-06-05 09:10:21',NULL),(254,'edit_knowledge_base','Edit Knowledge Base','Edit Knowledge Base','Knowledge Base','2021-06-05 09:10:21',NULL),(255,'delete_knowledge_base','Delete Knowledge Base','Delete Knowledge Base','Knowledge Base','2021-06-05 09:10:21',NULL),(256,'manage_external_quotation','Manage External Quotation','Manage External Quotation','External Quotation','2021-06-05 09:10:21',NULL),(257,'manage_external_invoice','Manage External Invoice','Manage External Invoice','External Invoice','2021-06-05 09:10:21',NULL),(258,'manage_external_ticket','Manage External Ticket','Manage External Ticket','External Ticket','2021-06-05 09:10:21',NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `preferences_category_index` (`category`),
  KEY `preferences_field_index` (`field`),
  KEY `preferences_value_index` (`value`(768))
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (1,'preference','row_per_page','25'),(2,'preference','date_format','3'),(3,'preference','date_sepa','-'),(4,'preference','soft_name','Inventory'),(5,'company','site_short_name','DQ'),(6,'preference','percentage','0'),(7,'preference','quantity','0'),(8,'preference','date_format_type','dd-M-yyyy'),(9,'company','company_name','QRInventory'),(10,'company','company_email','admin@kpntwks.xyz'),(11,'company','company_phone','123456789'),(12,'company','company_street','City Hall Park Path'),(13,'company','company_city','New york'),(14,'company','company_state','New york'),(15,'company','company_zip_code',''),(17,'company','dflt_lang','en'),(18,'company','dflt_currency_id','1'),(19,'company','sates_type_id','1'),(21,'company','company_gstin','15'),(22,'gl_account','supplier_debit_gl_acc','4'),(23,'gl_account','supplier_credit_gl_acc','4'),(24,'gl_account','customer_debit_gl_acc','4'),(25,'gl_account','customer_credit_gl_acc','4'),(26,'gl_account','user_transaction_debit_gl_acc','4'),(27,'gl_account','user_transaction_credit_gl_acc','4'),(28,'gl_account','bank_charge_gl_acc','3'),(29,'preference','default_timezone','Asia/Jakarta'),(39,'company','company_country','101'),(40,'company','pic','e71e2076c9202964a1664d8df843d25a_1_logopng.png'),(43,'company','icon','e71e2076c9202964a1664d8df843d25a_1_faviconico.ico'),(44,'preference','thousand_separator','.'),(45,'preference','decimal_digits','2'),(46,'preference','symbol_position','before'),(47,'company','company_icon','e71e2076c9202964a1664d8df843d25a_1_faviconico.ico'),(48,'company','company_logo','e71e2076c9202964a1664d8df843d25a_1_logopng.png'),(49,'preference','pdf','mPdf'),(50,'preference','exchange_rate_decimal_digits','2'),(51,'preference','file_size','10'),(52,'preference','captcha','disable'),(53,'preference','facebook_comments','disable'),(54,'preference','theme_preference','{\"theme_mode\":\"default\",\"header_background\":\"header-dark\",\"menu_background\":\"default\",\"menu_brand_background\":\"brand-dark\",\"menu_item_color\":\"default\",\"navbar_image\":\"default\",\"header-fixed\":\"headerpos-fixed\",\"menu_list_icon\":\"default\",\"menu_dropdown_icon\":\"default\"}');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priorities`
--

DROP TABLE IF EXISTS `priorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priorities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `priorities_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priorities`
--

LOCK TABLES `priorities` WRITE;
/*!40000 ALTER TABLE `priorities` DISABLE KEYS */;
INSERT INTO `priorities` VALUES (3,'High'),(1,'Low'),(2,'Medium');
/*!40000 ALTER TABLE `priorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_members`
--

DROP TABLE IF EXISTS `project_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_members_project_id_foreign_idx` (`project_id`),
  KEY `project_members_user_id_foreign_idx` (`user_id`),
  CONSTRAINT `project_members_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `project_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_members`
--

LOCK TABLES `project_members` WRITE;
/*!40000 ALTER TABLE `project_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_settings`
--

DROP TABLE IF EXISTS `project_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `setting_label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_value` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(''on'', ''off'')',
  PRIMARY KEY (`id`),
  KEY `project_settings_project_id_foreign_idx` (`project_id`),
  KEY `project_settings_setting_label_index` (`setting_label`),
  KEY `project_settings_setting_value_index` (`setting_value`),
  CONSTRAINT `project_settings_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_settings`
--

LOCK TABLES `project_settings` WRITE;
/*!40000 ALTER TABLE `project_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_statuses`
--

DROP TABLE IF EXISTS `project_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_statuses_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_statuses`
--

LOCK TABLES `project_statuses` WRITE;
/*!40000 ALTER TABLE `project_statuses` DISABLE KEYS */;
INSERT INTO `project_statuses` VALUES (6,'Archive'),(4,'Cancelled'),(5,'Finished'),(2,'In Progress'),(1,'Not Started'),(3,'On Hold');
/*!40000 ALTER TABLE `project_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `project_status_id` int(10) unsigned NOT NULL,
  `charge_type` int(10) unsigned NOT NULL COMMENT '1 = Fixed Rate;\r\n2 = Project Hour;\r\n3 = Rate Per Hour;',
  `begin_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `improvement` int(11) NOT NULL,
  `improvement_from_task` tinyint(1) DEFAULT NULL COMMENT '1=yes, 0=no',
  `completed_date` date DEFAULT NULL,
  `cost` decimal(16,8) DEFAULT NULL,
  `per_hour_project_scale` decimal(12,8) DEFAULT NULL,
  `estimated_hours` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `projects_name_index` (`name`),
  KEY `projects_project_type_index` (`project_type`),
  KEY `projects_customer_id_foreign_idx` (`customer_id`),
  KEY `projects_user_id_foreign_idx` (`user_id`),
  KEY `projects_status_index` (`project_status_id`),
  KEY `projects_begin_date_index` (`begin_date`),
  KEY `projects_due_date_index` (`due_date`),
  CONSTRAINT `projects_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `projects_project_status_id_foreign` FOREIGN KEY (`project_status_id`) REFERENCES `project_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_details`
--

DROP TABLE IF EXISTS `purchase_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(11,8) unsigned NOT NULL DEFAULT 0.00000000,
  `discount_type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '% or $',
  `hsn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting_no` tinyint(1) NOT NULL,
  `discount_amount` decimal(16,8) unsigned NOT NULL DEFAULT 0.00000000,
  `unit_price` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `quantity_ordered` decimal(16,8) unsigned NOT NULL DEFAULT 0.00000000,
  `quantity_received` decimal(16,8) unsigned NOT NULL DEFAULT 0.00000000,
  PRIMARY KEY (`id`),
  KEY `purchase_order_details_purchase_order_id_foreign_idx` (`purchase_order_id`),
  KEY `purchase_order_details_item_id_foreign_idx` (`item_id`),
  KEY `purchase_order_details_item_name_index` (`item_name`),
  CONSTRAINT `purchase_order_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_order_details_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_details`
--

LOCK TABLES `purchase_order_details` WRITE;
/*!40000 ALTER TABLE `purchase_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `invoice_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '''quantity'', \\n''hours'', \\n''amount''',
  `discount_on` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '''before'', \\n''after''',
  `tax_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '''exclusive'',\r\n''inclusive''',
  `has_tax` tinyint(1) NOT NULL,
  `has_description` tinyint(1) NOT NULL,
  `has_item_discount` tinyint(1) NOT NULL,
  `has_hsn` tinyint(1) NOT NULL,
  `has_other_discount` tinyint(1) NOT NULL,
  `has_shipping_charge` tinyint(1) NOT NULL,
  `has_custom_charge` tinyint(1) NOT NULL,
  `other_discount_amount` decimal(16,8) DEFAULT NULL,
  `other_discount_type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '% or $',
  `shipping_charge` decimal(16,8) DEFAULT NULL,
  `custom_charge_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_charge_amount` decimal(16,8) NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `exchange_rate` decimal(16,8) NOT NULL,
  `purchase_receive_type_id` int(10) unsigned NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_comment` tinyint(1) NOT NULL DEFAULT 0,
  `order_date` date NOT NULL,
  `reference` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `payment_method_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `paid` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `payment_term_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_orders_supplier_id_foreign_idx` (`supplier_id`),
  KEY `purchase_orders_user_id_foreign_idx` (`user_id`),
  KEY `purchase_orders_currency_id_foreign_idx` (`currency_id`),
  KEY `purchase_orders_purchase_receive_type_id_foreign_idx` (`purchase_receive_type_id`),
  KEY `purchase_orders_location_id_foreign_idx` (`location_id`),
  KEY `purchase_orders_payment_method_id_index` (`payment_method_id`),
  KEY `purchase_orders_payment_term_id_foreign_idx` (`payment_term_id`),
  CONSTRAINT `purchase_orders_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_orders_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_orders_payment_term_id_foreign` FOREIGN KEY (`payment_term_id`) REFERENCES `payment_terms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_orders_purchase_receive_type_id_foreign` FOREIGN KEY (`purchase_receive_type_id`) REFERENCES `purchase_receive_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_orders_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_orders`
--

LOCK TABLES `purchase_orders` WRITE;
/*!40000 ALTER TABLE `purchase_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_prices`
--

DROP TABLE IF EXISTS `purchase_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `price` decimal(16,8) DEFAULT 0.00000000,
  PRIMARY KEY (`id`),
  KEY `purchase_prices_item_id_foreign_idx` (`item_id`),
  KEY `purchase_prices_currency_id_foreign_idx` (`currency_id`),
  KEY `purchase_prices_price_index` (`price`),
  CONSTRAINT `purchase_prices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_prices_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_prices`
--

LOCK TABLES `purchase_prices` WRITE;
/*!40000 ALTER TABLE `purchase_prices` DISABLE KEYS */;
INSERT INTO `purchase_prices` VALUES (1,1,1,5000.00000000);
/*!40000 ALTER TABLE `purchase_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_receive_types`
--

DROP TABLE IF EXISTS `purchase_receive_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_receive_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `receive_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 for default.\r\n0 for otherwise.',
  PRIMARY KEY (`id`),
  KEY `purchase_receive_types_receive_type_index` (`receive_type`),
  KEY `purchase_receive_types_is_default_index` (`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_receive_types`
--

LOCK TABLES `purchase_receive_types` WRITE;
/*!40000 ALTER TABLE `purchase_receive_types` DISABLE KEYS */;
INSERT INTO `purchase_receive_types` VALUES (1,'auto',0),(2,'manually',0);
/*!40000 ALTER TABLE `purchase_receive_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_taxes`
--

DROP TABLE IF EXISTS `purchase_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_detail_id` bigint(20) unsigned NOT NULL,
  `tax_type_id` int(10) unsigned NOT NULL,
  `tax_amount` decimal(16,8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_taxes_purchase_order_detail_id_foreign_idx` (`purchase_order_detail_id`),
  KEY `purchase_taxes_tax_type_id_foreign_idx` (`tax_type_id`),
  CONSTRAINT `purchase_taxes_purchase_order_detail_id_foreign` FOREIGN KEY (`purchase_order_detail_id`) REFERENCES `purchase_order_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_taxes_tax_type_id_foreign` FOREIGN KEY (`tax_type_id`) REFERENCES `tax_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_taxes`
--

LOCK TABLES `purchase_taxes` WRITE;
/*!40000 ALTER TABLE `purchase_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `received_order_details`
--

DROP TABLE IF EXISTS `received_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `received_order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) unsigned NOT NULL,
  `purchase_order_detail_id` bigint(20) unsigned NOT NULL,
  `received_order_id` int(10) unsigned NOT NULL,
  `item_id` bigint(20) unsigned DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` decimal(16,8) NOT NULL,
  `quantity` decimal(16,8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `received_order_details_purchase_order_id_foreign_idx` (`purchase_order_id`),
  KEY `received_order_details_purchase_order_details_id_index` (`purchase_order_detail_id`),
  KEY `received_order_details_received_order_id_foreign_idx` (`received_order_id`),
  KEY `receive_order_details_item_id_foreign_idx` (`item_id`),
  KEY `received_order_details_item_name_index` (`item_name`),
  CONSTRAINT `receive_order_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `received_order_details_purchase_order_detail_id_foreign` FOREIGN KEY (`purchase_order_detail_id`) REFERENCES `purchase_order_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `received_order_details_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `received_order_details_received_order_id_foreign` FOREIGN KEY (`received_order_id`) REFERENCES `received_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `received_order_details`
--

LOCK TABLES `received_order_details` WRITE;
/*!40000 ALTER TABLE `received_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `received_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `received_orders`
--

DROP TABLE IF EXISTS `received_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `received_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `supplier_id` int(10) unsigned NOT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `receive_date` date NOT NULL,
  `order_receive_no` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receive_orders_purchase_order_id_foreign_idx` (`purchase_order_id`),
  KEY `receive_orders_user_id_foreign_idx` (`user_id`),
  KEY `receive_orders_supplier_id_foreign_idx` (`supplier_id`),
  KEY `received_orders_location_id_foreign_idx` (`location_id`),
  KEY `received_orders_receive_date_index` (`receive_date`),
  CONSTRAINT `receive_orders_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receive_orders_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receive_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `received_orders_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `received_orders`
--

LOCK TABLES `received_orders` WRITE;
/*!40000 ALTER TABLE `received_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `received_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_users` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_foreign_idx` (`user_id`),
  KEY `role_users_role_id_foreign_idx` (`role_id`),
  CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
INSERT INTO `role_users` VALUES (1,1),(2,5);
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  KEY `roles_display_name_index` (`display_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','Admin User',NULL,NULL),(2,'project-manager','Project Manager','Project Manager role can manage all the functionality of projects','2020-04-07 17:36:51','2020-04-07 17:41:01'),(3,'stock-manager','Stock Manager','Stock Manager can manage all the functionality related of stocks.','2020-04-07 17:44:04','2020-04-07 17:44:04'),(4,'sales-manager','Sales Manager','Sales Manager can sales related functionality.','2020-04-07 17:52:10','2020-04-07 17:52:10'),(5,'owner','Owner','Owner Roles','2022-10-11 04:08:41','2022-10-11 04:08:41');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order_details`
--

DROP TABLE IF EXISTS `sale_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sale_order_id` bigint(20) unsigned NOT NULL,
  `item_id` bigint(20) unsigned DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `quantity_sent` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `quantity` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `discount_amount` decimal(16,8) unsigned NOT NULL DEFAULT 0.00000000,
  `discount` decimal(16,8) unsigned NOT NULL DEFAULT 0.00000000,
  `discount_type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '%' COMMENT '% or $',
  `hsn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting_no` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_order_details_sale_order_id_foreign_idx` (`sale_order_id`),
  KEY `sale_order_details_item_id_foreign_idx` (`item_id`),
  KEY `sale_order_details_item_name_index` (`item_name`),
  CONSTRAINT `sale_order_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_order_details_sale_order_id_foreign` FOREIGN KEY (`sale_order_id`) REFERENCES `sale_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order_details`
--

LOCK TABLES `sale_order_details` WRITE;
/*!40000 ALTER TABLE `sale_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_orders`
--

DROP TABLE IF EXISTS `sale_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'quantity, hourse or amount',
  `order_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `customer_branch_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `tax_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'exclusive or inclusive',
  `reference` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_reference_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_comment` tinyint(1) NOT NULL,
  `order_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `location_id` int(10) unsigned DEFAULT NULL,
  `payment_method_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_on` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `exchange_rate` decimal(16,8) NOT NULL,
  `has_tax` tinyint(1) NOT NULL,
  `has_description` tinyint(1) NOT NULL,
  `has_item_discount` tinyint(1) NOT NULL,
  `has_hsn` tinyint(1) NOT NULL,
  `has_other_discount` tinyint(1) NOT NULL,
  `has_shipping_charge` tinyint(1) NOT NULL,
  `has_custom_charge` tinyint(1) NOT NULL,
  `other_discount_amount` decimal(11,8) DEFAULT NULL,
  `other_discount_type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '% or $',
  `shipping_charge` decimal(16,8) DEFAULT NULL,
  `custom_charge_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_charge_amount` decimal(16,8) NOT NULL,
  `total` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `paid` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `amount_received` decimal(16,8) DEFAULT NULL,
  `payment_term_id` int(10) unsigned DEFAULT NULL,
  `pos_invoice_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'clear' COMMENT 'clear or hold',
  `pos_discount_amount` decimal(11,8) NOT NULL DEFAULT 0.00000000,
  `pos_order_title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_tax_on_order` decimal(16,8) NOT NULL,
  `pos_shipping` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_orders_invoice_type_index` (`invoice_type`),
  KEY `sale_orders_project_id_foreign_idx` (`project_id`),
  KEY `sale_orders_customer_id_foreign_idx` (`customer_id`),
  KEY `sale_orders_customer_branch_id_foreign_idx` (`customer_branch_id`),
  KEY `sale_orders_user_id_foreign_idx` (`user_id`),
  KEY `sale_orders_location_id_foreign_idx` (`location_id`),
  KEY `sale_orders_currency_id_foreign_idx` (`currency_id`),
  KEY `sale_orders_payment_term_id_foreign_idx` (`payment_term_id`),
  CONSTRAINT `sale_orders_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_orders_customer_branch_id_foreign` FOREIGN KEY (`customer_branch_id`) REFERENCES `customer_branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_orders_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_orders_payment_term_id_foreign` FOREIGN KEY (`payment_term_id`) REFERENCES `payment_terms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_orders_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `sale_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_orders`
--

LOCK TABLES `sale_orders` WRITE;
/*!40000 ALTER TABLE `sale_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_prices`
--

DROP TABLE IF EXISTS `sale_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL,
  `sale_type_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `price` decimal(16,8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_prices_item_id_foreign_idx` (`item_id`),
  KEY `sale_prices_sale_type_id_foreign_idx` (`sale_type_id`),
  KEY `sales_prices_currency_id_foreign_idx` (`currency_id`),
  CONSTRAINT `sale_prices_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_prices_sale_type_id_foreign` FOREIGN KEY (`sale_type_id`) REFERENCES `sale_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_prices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_prices_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_prices_sale_type_id_foreign` FOREIGN KEY (`sale_type_id`) REFERENCES `sale_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_prices`
--

LOCK TABLES `sale_prices` WRITE;
/*!40000 ALTER TABLE `sale_prices` DISABLE KEYS */;
INSERT INTO `sale_prices` VALUES (1,1,1,1,10000.00000000),(2,1,2,1,0.00000000);
/*!40000 ALTER TABLE `sale_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_taxes`
--

DROP TABLE IF EXISTS `sale_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_order_detail_id` bigint(20) unsigned NOT NULL,
  `tax_type_id` int(10) unsigned NOT NULL,
  `tax_amount` decimal(16,8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_taxes_sale_order_detail_id_foreign_idx` (`sale_order_detail_id`),
  KEY `sale_taxes_tax_type_id_foreign_idx` (`tax_type_id`),
  CONSTRAINT `sale_taxes_sale_order_detail_id_foreign` FOREIGN KEY (`sale_order_detail_id`) REFERENCES `sale_order_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_taxes_tax_type_id_foreign` FOREIGN KEY (`tax_type_id`) REFERENCES `tax_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_taxes`
--

LOCK TABLES `sale_taxes` WRITE;
/*!40000 ALTER TABLE `sale_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_types`
--

DROP TABLE IF EXISTS `sale_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_tax_included` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sale_types_sale_type_index` (`sale_type`),
  KEY `sale_types_is_default_index` (`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_types`
--

LOCK TABLES `sale_types` WRITE;
/*!40000 ALTER TABLE `sale_types` DISABLE KEYS */;
INSERT INTO `sale_types` VALUES (1,'Retail',1,1),(2,'Wholesale',0,0);
/*!40000 ALTER TABLE `sale_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_roles`
--

DROP TABLE IF EXISTS `security_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sections` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `areas` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1  for active, 0 for inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_roles`
--

LOCK TABLES `security_roles` WRITE;
/*!40000 ALTER TABLE `security_roles` DISABLE KEYS */;
INSERT INTO `security_roles` VALUES (1,'System Administrator','System Administrator','a:26:{s:8:\"category\";s:3:\"100\";s:4:\"unit\";s:3:\"600\";s:3:\"loc\";s:3:\"200\";s:4:\"item\";s:3:\"300\";s:4:\"user\";s:3:\"400\";s:4:\"role\";s:3:\"500\";s:8:\"customer\";s:3:\"700\";s:8:\"purchase\";s:3:\"900\";s:8:\"supplier\";s:4:\"1000\";s:7:\"payment\";s:4:\"1400\";s:6:\"backup\";s:4:\"1500\";s:5:\"email\";s:4:\"1600\";s:9:\"emailtemp\";s:4:\"1700\";s:10:\"preference\";s:4:\"1800\";s:3:\"tax\";s:4:\"1900\";s:10:\"currencies\";s:4:\"2100\";s:11:\"paymentterm\";s:4:\"2200\";s:13:\"paymentmethod\";s:4:\"2300\";s:14:\"companysetting\";s:4:\"2400\";s:10:\"iecategory\";s:4:\"2600\";s:7:\"expense\";s:4:\"2700\";s:7:\"deposit\";s:4:\"3000\";s:9:\"quotation\";s:4:\"2800\";s:7:\"invoice\";s:4:\"2900\";s:12:\"bank_account\";s:4:\"3100\";s:21:\"bank_account_transfer\";s:4:\"3200\";}','a:59:{s:7:\"cat_add\";s:3:\"101\";s:8:\"cat_edit\";s:3:\"102\";s:10:\"cat_delete\";s:3:\"103\";s:8:\"unit_add\";s:3:\"601\";s:9:\"unit_edit\";s:3:\"602\";s:11:\"unit_delete\";s:3:\"603\";s:7:\"loc_add\";s:3:\"201\";s:8:\"loc_edit\";s:3:\"202\";s:10:\"loc_delete\";s:3:\"203\";s:8:\"item_add\";s:3:\"301\";s:9:\"item_edit\";s:3:\"302\";s:11:\"item_delete\";s:3:\"303\";s:8:\"user_add\";s:3:\"401\";s:9:\"user_edit\";s:3:\"402\";s:11:\"user_delete\";s:3:\"403\";s:12:\"customer_add\";s:3:\"701\";s:13:\"customer_edit\";s:3:\"702\";s:15:\"customer_delete\";s:3:\"703\";s:12:\"purchase_add\";s:3:\"901\";s:13:\"purchase_edit\";s:3:\"902\";s:15:\"purchase_delete\";s:3:\"903\";s:12:\"supplier_add\";s:4:\"1001\";s:13:\"supplier_edit\";s:4:\"1002\";s:15:\"supplier_delete\";s:4:\"1003\";s:11:\"payment_add\";s:4:\"1401\";s:12:\"payment_edit\";s:4:\"1402\";s:14:\"payment_delete\";s:4:\"1403\";s:10:\"backup_add\";s:4:\"1501\";s:15:\"backup_download\";s:4:\"1502\";s:7:\"tax_add\";s:4:\"1901\";s:8:\"tax_edit\";s:4:\"1902\";s:10:\"tax_delete\";s:4:\"1903\";s:14:\"currencies_add\";s:4:\"2101\";s:15:\"currencies_edit\";s:4:\"2102\";s:17:\"currencies_delete\";s:4:\"2103\";s:15:\"paymentterm_add\";s:4:\"2201\";s:16:\"paymentterm_edit\";s:4:\"2202\";s:18:\"paymentterm_delete\";s:4:\"2203\";s:17:\"paymentmethod_add\";s:4:\"2301\";s:18:\"paymentmethod_edit\";s:4:\"2302\";s:20:\"paymentmethod_delete\";s:4:\"2303\";s:11:\"expense_add\";s:4:\"2701\";s:12:\"expense_edit\";s:4:\"2702\";s:14:\"expense_delete\";s:4:\"2703\";s:11:\"deposit_add\";s:4:\"3001\";s:12:\"deposit_edit\";s:4:\"3002\";s:14:\"deposit_delete\";s:4:\"3003\";s:13:\"quotation_add\";s:4:\"2801\";s:14:\"quotation_edit\";s:4:\"2802\";s:16:\"quotation_delete\";s:4:\"2803\";s:11:\"invoice_add\";s:4:\"2901\";s:12:\"invoice_edit\";s:4:\"2902\";s:14:\"invoice_delete\";s:4:\"2903\";s:16:\"bank_account_add\";s:4:\"3101\";s:17:\"bank_account_edit\";s:4:\"3102\";s:19:\"bank_account_delete\";s:4:\"3103\";s:25:\"bank_account_transfer_add\";s:4:\"3201\";s:26:\"bank_account_transfer_edit\";s:4:\"3202\";s:28:\"bank_account_transfer_delete\";s:4:\"3203\";}',0,'2018-11-05 00:21:57','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `security_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_details`
--

DROP TABLE IF EXISTS `shipment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shipment_id` int(10) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  `tax_type_id` int(10) unsigned NOT NULL,
  `unit_price` decimal(16,8) NOT NULL,
  `quantity` decimal(16,8) NOT NULL,
  `discount_percent` decimal(11,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_details_shipment_id_foreign_idx` (`shipment_id`),
  KEY `shipment_details_item_id_foreign_idx` (`item_id`),
  KEY `shipment_details_tax_type_id_foreign_idx` (`tax_type_id`),
  KEY `shipments_unit_price_index` (`unit_price`),
  KEY `shipments_quantity_index` (`quantity`),
  CONSTRAINT `shipment_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shipment_details_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shipment_details_tax_type_id_foreign` FOREIGN KEY (`tax_type_id`) REFERENCES `tax_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_details`
--

LOCK TABLES `shipment_details` WRITE;
/*!40000 ALTER TABLE `shipment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_order_id` bigint(20) unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `packed_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_sale_order_id_foreign_idx` (`sale_order_id`),
  KEY `shipments_status_index` (`status`),
  CONSTRAINT `shipments_sale_order_id_foreign` FOREIGN KEY (`sale_order_id`) REFERENCES `sale_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_config`
--

DROP TABLE IF EXISTS `sms_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secretkey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_config`
--

LOCK TABLES `sms_config` WRITE;
/*!40000 ALTER TABLE `sms_config` DISABLE KEYS */;
INSERT INTO `sms_config` VALUES (1,'twilio','Active','1aaxcdff1a0a','eWi2sO2asdfWZrkqfidfdsas7R','Yes','880123456789');
/*!40000 ALTER TABLE `sms_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_adjustment_details`
--

DROP TABLE IF EXISTS `stock_adjustment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_adjustment_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_adjustment_id` int(10) unsigned NOT NULL COMMENT 'stock_adjustment_id refers to stock_adjustments table id',
  `item_id` bigint(20) unsigned NOT NULL COMMENT 'item_id refers to items table id',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` decimal(16,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `stock_adjustment_details_stock_adjustment_id_foreign_idx` (`stock_adjustment_id`),
  KEY `stock_adjustment_details_item_id_foreign_idx` (`item_id`),
  CONSTRAINT `stock_adjustment_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_adjustment_details_stock_adjustment_id_foreign` FOREIGN KEY (`stock_adjustment_id`) REFERENCES `stock_adjustments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_adjustment_details`
--

LOCK TABLES `stock_adjustment_details` WRITE;
/*!40000 ALTER TABLE `stock_adjustment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_adjustment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_adjustments`
--

DROP TABLE IF EXISTS `stock_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `transaction_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_quantity` decimal(16,8) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_adjustments_user_id_foreign_idx` (`user_id`),
  KEY `stock_adjustments_location_id_foreign_idx` (`location_id`),
  CONSTRAINT `stock_adjustments_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_adjustments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_adjustments`
--

LOCK TABLES `stock_adjustments` WRITE;
/*!40000 ALTER TABLE `stock_adjustments` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_adjustments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_categories`
--

DROP TABLE IF EXISTS `stock_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_unit_id` int(10) unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 for active;\\n 0 for otherwise',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_categories_name_index` (`name`),
  KEY `stock_categories_item_unit_id_foreign_idx` (`item_unit_id`),
  KEY `stock_categories_is_active_index` (`is_active`),
  CONSTRAINT `stock_categories_item_unit_id_foreign` FOREIGN KEY (`item_unit_id`) REFERENCES `item_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_categories`
--

LOCK TABLES `stock_categories` WRITE;
/*!40000 ALTER TABLE `stock_categories` DISABLE KEYS */;
INSERT INTO `stock_categories` VALUES (1,'Generic Product',1,1,'2020-04-07 02:15:41','2020-04-07 02:15:41'),(2,'Custom Product',1,1,'2020-04-07 02:16:29','2020-04-07 02:16:29'),(3,'Gift Packages',1,1,'2020-04-07 02:17:51','2022-10-11 04:31:03');
/*!40000 ALTER TABLE `stock_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_moves`
--

DROP TABLE IF EXISTS `stock_moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_moves` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL COMMENT 'item_id refers items table id',
  `transaction_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Id of sale_orders, purchase_orders, stock_adjustments, stock_transfers, items (initial stock)',
  `transaction_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(10) unsigned NOT NULL COMMENT 'location_id refers locations table id',
  `transaction_date` date NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'user_id refers users table id',
  `transaction_type_detail_id` int(10) unsigned DEFAULT NULL COMMENT 'Id of sale_order_details, purchase_order_details, stock_adjustment_details, stock_transfers, items (initial stock)',
  `reference` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `price` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  PRIMARY KEY (`id`),
  KEY `stock_moves_item_id_foreign_idx` (`item_id`),
  KEY `stock_moves_transaction_type_id_index` (`transaction_type_id`),
  KEY `stock_moves_transaction_type_index` (`transaction_type`),
  KEY `stock_moves_location_id_foreign_idx` (`location_id`),
  KEY `stock_moves_transaction_date_index` (`transaction_date`),
  KEY `stock_moves_user_id_foreign_idx` (`user_id`),
  KEY `stock_moves_transaction_type_detail_id_index` (`transaction_type_detail_id`),
  KEY `stock_moves_price_index` (`price`),
  CONSTRAINT `stock_moves_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_moves_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_moves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_moves`
--

LOCK TABLES `stock_moves` WRITE;
/*!40000 ALTER TABLE `stock_moves` DISABLE KEYS */;
INSERT INTO `stock_moves` VALUES (1,1,NULL,'INITIALSTOCKIN',1,'2022-10-11',1,NULL,'store_in_1','Added from initial stock',100000.00000000,5000.00000000);
/*!40000 ALTER TABLE `stock_moves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_transfers`
--

DROP TABLE IF EXISTS `stock_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `source_location_id` int(10) unsigned NOT NULL,
  `destination_location_id` int(10) unsigned NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` decimal(16,8) NOT NULL,
  `transfer_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_transfers_user_id_foreign_idx` (`user_id`),
  KEY `stock_transfers_source_location_id_foreign_idx` (`source_location_id`),
  KEY `stock_transfers_destination_location_id_foreign_idx` (`destination_location_id`),
  KEY `stock_transfers_transfer_date_index` (`transfer_date`),
  CONSTRAINT `stock_transfers_destination_location_id_foreign` FOREIGN KEY (`destination_location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_transfers_source_location_id_foreign` FOREIGN KEY (`source_location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_transfers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_transfers`
--

LOCK TABLES `stock_transfers` WRITE;
/*!40000 ALTER TABLE `stock_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_transactions`
--

DROP TABLE IF EXISTS `supplier_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `transaction_reference_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `supplier_id` int(10) unsigned NOT NULL,
  `purchase_order_id` bigint(20) unsigned NOT NULL,
  `payment_method_id` int(10) unsigned DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `amount` decimal(16,8) DEFAULT NULL,
  `exchange_rate` decimal(16,8) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `supplier_transactions_user_id_foreign)idx` (`user_id`),
  KEY `supplier_transactions_currency_id_foreign_idx` (`currency_id`),
  KEY `supplier_transactions_supplier_id_foreign_idx` (`supplier_id`),
  KEY `supplier_transactions_purchase_order_id_foreign_idx` (`purchase_order_id`),
  KEY `supplier_transactions_payment_method_id_foreign_idx` (`payment_method_id`),
  KEY `supplier_transactions_transaction_date_index` (`transaction_date`),
  KEY `supplier_transactions_amount_index` (`amount`),
  KEY `supplier_transactions_exchange_rate_index` (`exchange_rate`),
  CONSTRAINT `supplier_transactions_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplier_transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplier_transactions_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplier_transactions_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplier_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_transactions`
--

LOCK TABLES `supplier_transactions` WRITE;
/*!40000 ALTER TABLE `supplier_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) unsigned NOT NULL COMMENT 'currency_id refers currencies table id',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 for active; \\n 0 for inactive.',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suppliers_name_index` (`name`),
  KEY `suppliers_email_index` (`email`),
  KEY `suppliers_contact_index` (`contact`),
  KEY `suppliers_currency_id_foreign_idx` (`currency_id`),
  KEY `suppliers_state_index` (`state`),
  KEY `suppliers_country_id_foreign_idx` (`country_id`),
  KEY `suppliers_is_active_index` (`is_active`),
  CONSTRAINT `suppliers_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_assigns`
--

DROP TABLE IF EXISTS `tag_assigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_assigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `reference_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_assigns_tag_type_idx` (`tag_type`),
  KEY `tags_in_tag_id_foreign_idx` (`tag_id`),
  CONSTRAINT `tags_in_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_assigns`
--

LOCK TABLES `tag_assigns` WRITE;
/*!40000 ALTER TABLE `tag_assigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_assigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_assigns`
--

DROP TABLE IF EXISTS `task_assigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_assigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `task_id` int(10) unsigned NOT NULL,
  `assigned_by` int(10) unsigned NOT NULL,
  `is_assigned_by_customer` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 for not;\r\n1 for yes;',
  PRIMARY KEY (`id`),
  KEY `task_assigns_user_id_foreign_idx` (`user_id`),
  KEY `task_assigns_task_id_foreign_idx` (`task_id`),
  KEY `task_assigns_assigned_by_foreign_idx` (`assigned_by`),
  CONSTRAINT `task_assigns_assigned_by_foreign` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_assigns_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_assigns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_assigns`
--

LOCK TABLES `task_assigns` WRITE;
/*!40000 ALTER TABLE `task_assigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_assigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_comments`
--

DROP TABLE IF EXISTS `task_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_comments_task_id_foreign_idx` (`task_id`),
  KEY `task_comments_user_id_foreign_idx` (`user_id`),
  KEY `task_comments_customer_id_foreign_idx` (`customer_id`),
  CONSTRAINT `task_comments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_comments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_comments`
--

LOCK TABLES `task_comments` WRITE;
/*!40000 ALTER TABLE `task_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_statuses`
--

DROP TABLE IF EXISTS `task_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_statuses` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_order` tinyint(1) NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_statuses`
--

LOCK TABLES `task_statuses` WRITE;
/*!40000 ALTER TABLE `task_statuses` DISABLE KEYS */;
INSERT INTO `task_statuses` VALUES (1,'Not Started',1,'#F22012'),(2,'In Progress',3,'#04a9f5'),(3,'Testing',4,'#5a4d4d'),(4,'Complete',6,'#00b894'),(5,'On Hold',2,'#fdcb6e'),(6,'Re-open',7,'#F22012');
/*!40000 ALTER TABLE `task_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_timers`
--

DROP TABLE IF EXISTS `task_timers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_timers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `task_id` int(10) unsigned NOT NULL,
  `start_time` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hourly_rate` decimal(12,8) NOT NULL DEFAULT 0.00000000,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_timers_user_id_foreign_idx` (`user_id`),
  KEY `task_timers_task_id_foreign_idx` (`task_id`),
  CONSTRAINT `task_timers_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_timers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_timers`
--

LOCK TABLES `task_timers` WRITE;
/*!40000 ALTER TABLE `task_timers` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_timers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `finished_date` date DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `task_status_id` int(10) unsigned NOT NULL,
  `recurring_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repeat_every` int(10) unsigned DEFAULT NULL,
  `recurring` int(10) unsigned NOT NULL,
  `recurring_ends_on` date DEFAULT NULL,
  `related_to_id` int(10) unsigned DEFAULT NULL,
  `related_to_type` int(11) DEFAULT NULL COMMENT '1=Project, 2= Customer, 3=Ticket',
  `custom_recurring` int(10) unsigned NOT NULL DEFAULT 0,
  `last_recurring_date` date DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT 0,
  `is_billable` tinyint(1) DEFAULT 0,
  `is_billed` tinyint(1) NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `hourly_rate` decimal(12,8) DEFAULT NULL,
  `milestone_id` int(10) unsigned DEFAULT NULL,
  `is_visible_to_customer` tinyint(1) DEFAULT 0,
  `deadline_notified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_name_index` (`name`),
  KEY `tasks_priority_id_foreign_idx` (`priority_id`),
  KEY `tasks_user_id_foreign_idx` (`user_id`),
  KEY `tasks_task_status_id_foreign_idx` (`task_status_id`),
  KEY `tasks_is_billable_index` (`is_billable`),
  KEY `tasks_is_billed_foreign` (`is_billed`),
  KEY `tasks_milestone_id_foreign_idx` (`milestone_id`),
  CONSTRAINT `tasks_milestone_id_foreign` FOREIGN KEY (`milestone_id`) REFERENCES `milestones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tasks_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `priorities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tasks_task_status_id_foreign` FOREIGN KEY (`task_status_id`) REFERENCES `task_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_types`
--

DROP TABLE IF EXISTS `tax_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,8) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 for defaults;\\n0 for otherwise',
  PRIMARY KEY (`id`),
  KEY `tax_types_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_types`
--

LOCK TABLES `tax_types` WRITE;
/*!40000 ALTER TABLE `tax_types` DISABLE KEYS */;
INSERT INTO `tax_types` VALUES (1,'NONE',0.00000000,0),(2,'PPN',11.00000000,1);
/*!40000 ALTER TABLE `tax_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_replies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL COMMENT 'ticket_id refers tickets table id',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'user_id refers users table id in other word (admin id who replied the current one)',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'customer_id refers customers table id',
  `date` datetime DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_attachment` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 for no attachment;\r\n1 means this reply has attachment',
  PRIMARY KEY (`id`),
  KEY `ticket_replies_ticket_id_foreign_idx` (`ticket_id`),
  KEY `ticket_replies_user_id_foreign_idx` (`user_id`),
  KEY `ticket_replies_customer_id_foreign_idx` (`customer_id`),
  KEY `ticket_replies_date_index` (`date`),
  KEY `ticket_replies_has_attachment_index` (`has_attachment`),
  CONSTRAINT `ticket_replies_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_replies_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_replies`
--

LOCK TABLES `ticket_replies` WRITE;
/*!40000 ALTER TABLE `ticket_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_statuses`
--

DROP TABLE IF EXISTS `ticket_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 for default; 0 otherwise',
  `color` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_statuses_name_index` (`name`),
  KEY `ticket_statuses_is_default_index` (`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_statuses`
--

LOCK TABLES `ticket_statuses` WRITE;
/*!40000 ALTER TABLE `ticket_statuses` DISABLE KEYS */;
INSERT INTO `ticket_statuses` VALUES (1,'Open',1,'#ff2d42'),(2,'In progress',0,'#84c529'),(3,'On Hold',0,'#848484'),(4,'Closed',0,'#03a9f4'),(5,'Answered',0,'#0000ff');
/*!40000 ALTER TABLE `ticket_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'customer_id refers customers table id',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(10) unsigned NOT NULL COMMENT 'department_id refers departments table id',
  `priority_id` int(10) unsigned NOT NULL COMMENT 'priority_id refers priorities table id',
  `ticket_status_id` int(10) unsigned DEFAULT NULL COMMENT 'status_id refers ticket_statuses  table id',
  `ticket_key` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'user_id refers users table id',
  `date` datetime DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL COMMENT 'project_id refers projects table id',
  `last_reply` datetime DEFAULT NULL,
  `assigned_member_id` int(10) unsigned DEFAULT NULL COMMENT 'assigned_member_id refers users table id',
  PRIMARY KEY (`id`),
  KEY `tickets_customer_id_foreign)idx` (`customer_id`),
  KEY `tickets_email_index` (`email`),
  KEY `tickets_name_index` (`name`),
  KEY `tickets_department_id_foreign_idx` (`department_id`),
  KEY `tickets_priority_id_foreign_idx` (`priority_id`),
  KEY `tickets_ticket_status_id_foreign_idx` (`ticket_status_id`),
  KEY `tickets_subject_index` (`subject`),
  KEY `tickets_user_id_foreign_idx` (`user_id`),
  KEY `tickets_date_index` (`date`),
  KEY `tickets_project_id_foreign_idx` (`project_id`),
  KEY `tickets_last_reply_index` (`last_reply`),
  KEY `tickets_assigned_member_id_foreign_idx` (`assigned_member_id`),
  CONSTRAINT `tickets_assigned_member_id_foreign` FOREIGN KEY (`assigned_member_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `priorities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tickets_ticket_status_id_foreign` FOREIGN KEY (`ticket_status_id`) REFERENCES `ticket_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_references`
--

DROP TABLE IF EXISTS `transaction_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_references` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned DEFAULT NULL,
  `reference_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_references_reference_type_index` (`reference_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_references`
--

LOCK TABLES `transaction_references` WRITE;
/*!40000 ALTER TABLE `transaction_references` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` int(10) unsigned NOT NULL,
  `amount` decimal(16,8) NOT NULL,
  `transaction_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` int(10) unsigned DEFAULT NULL COMMENT 'account_id refers accounts table id',
  `transaction_date` date NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'user_id refers users table id',
  `transaction_reference_id` int(10) unsigned NOT NULL COMMENT 'transaction_reference_id refers transaction_references table id',
  `transaction_method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` int(10) unsigned DEFAULT NULL COMMENT 'payment_method_id references payment_methods table id',
  `params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `transactions_currency_id_foreign_idx` (`currency_id`),
  KEY `transactions_amount_index` (`amount`),
  KEY `transactions_transaction_type_index` (`transaction_type`),
  KEY `transactions_account_id_foreign_idx` (`account_id`),
  KEY `transactions_transaction_date_index` (`transaction_date`),
  KEY `transactions_user_id_foreign_idx` (`user_id`),
  KEY `transactions_transaction_reference_id_foreign_idx` (`transaction_reference_id`),
  KEY `transactions_transaction_method_index` (`transaction_method`),
  KEY `transactions_payment_method_id_foreign_idx` (`payment_method_id`),
  CONSTRAINT `transactions_ account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_transaction_reference_id_foreign` FOREIGN KEY (`transaction_reference_id`) REFERENCES `transaction_references` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_account_id` int(10) unsigned NOT NULL,
  `to_account_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `from_currency_id` int(10) unsigned NOT NULL,
  `to_currency_id` int(10) unsigned NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_reference_id` int(10) unsigned NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(16,8) NOT NULL,
  `fee` decimal(16,8) NOT NULL,
  `exchange_rate` decimal(16,8) DEFAULT NULL,
  `incoming_amount` decimal(16,8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transfers_from_account_id_foreign_idx` (`from_account_id`),
  KEY `transfers_to_account_id_foreign_idx` (`to_account_id`),
  KEY `transfers_user_id_foreign_idx` (`user_id`),
  KEY `transfers_from_currency_id_foreign_idx` (`from_currency_id`),
  KEY `transfers_to_currency_id_foreign_idx` (`to_currency_id`),
  KEY `transfers_transaction_date_index` (`transaction_date`),
  KEY `transfers_transaction_reference_id_foreign_idx` (`transaction_reference_id`),
  KEY `transfers_amount_index` (`amount`),
  KEY `transfers_incoming_amount_index` (`incoming_amount`),
  CONSTRAINT `transfers_from_account_id_foreign` FOREIGN KEY (`from_account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transfers_from_currency_id_foreign` FOREIGN KEY (`from_currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transfers_to_account_id_foreign` FOREIGN KEY (`to_account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transfers_to_currency_id_foreign` FOREIGN KEY (`to_currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transfers_transaction_reference_id` FOREIGN KEY (`transaction_reference_id`) REFERENCES `transaction_references` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transfers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_shortner_config`
--

DROP TABLE IF EXISTS `url_shortner_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_shortner_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secretkey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_shortner_config`
--

LOCK TABLES `url_shortner_config` WRITE;
/*!40000 ALTER TABLE `url_shortner_config` DISABLE KEYS */;
INSERT INTO `url_shortner_config` VALUES (3,'Bitly','Active','','6d326e4ad38524f8slkdjlwieweowewlkjl','Yes');
/*!40000 ALTER TABLE `url_shortner_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_departments`
--

DROP TABLE IF EXISTS `user_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'user_id refers users table id',
  `department_id` int(10) unsigned NOT NULL COMMENT 'department_id refers departments table id',
  PRIMARY KEY (`id`),
  KEY `user_departments_user_id_foreign_idx` (`user_id`),
  KEY `user_departments_department_id_foreign_idx` (`department_id`),
  CONSTRAINT `user_departments_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_departments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_departments`
--

LOCK TABLES `user_departments` WRITE;
/*!40000 ALTER TABLE `user_departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(10) unsigned DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 for active;\r\n0 otherwise',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_full_name_index` (`full_name`),
  KEY `users_first_name_index` (`first_name`),
  KEY `users_last_name_index` (`last_name`),
  KEY `users_added_by_foreign_idx` (`added_by`),
  KEY `users_role_id_foreign_idx` (`role_id`),
  KEY `users_email_index` (`email`),
  KEY `users_is_active_index` (`is_active`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Satch','John','Satch',1,'$2y$10$HAhRMwh/pIbkfgxoarpVlu5QYBy3iLTq8HE9OX7QYJEVidxxYJbXW',1,NULL,'admin@kpntwks.xyz','',1,'2020-04-07 23:12:06','2022-10-31 21:44:18',NULL),(2,'Business Owner','Business','Owner',1,'$2y$10$Gq6o6I05yZpBRexWVXxBPu2uLrRUjicu6gQGxNolo9XKe5UKoeOBG',5,NULL,'owner@kpntwks.xyz','',1,'2022-10-11 04:09:35',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-01 11:57:51
