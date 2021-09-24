-- MySQL dump 10.17  Distrib 10.3.25-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ezp330-training
-- ------------------------------------------------------
-- Server version	10.3.25-MariaDB-0ubuntu0.20.04.1

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ancestors` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `depth` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `state` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CE2904019` (`thread_id`),
  CONSTRAINT `FK_9474526CE2904019` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credits`
--

DROP TABLE IF EXISTS `credits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_instruction_id` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `attention_required` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `credited_amount` decimal(10,5) NOT NULL,
  `crediting_amount` decimal(10,5) NOT NULL,
  `reversing_amount` decimal(10,5) NOT NULL,
  `state` smallint(6) NOT NULL,
  `target_amount` decimal(10,5) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4117D17E8789B572` (`payment_instruction_id`),
  KEY `IDX_4117D17E4C3A3BB` (`payment_id`),
  CONSTRAINT `FK_4117D17E4C3A3BB` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4117D17E8789B572` FOREIGN KEY (`payment_instruction_id`) REFERENCES `payment_instructions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credits`
--

LOCK TABLES `credits` WRITE;
/*!40000 ALTER TABLE `credits` DISABLE KEYS */;
/*!40000 ALTER TABLE `credits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezbinaryfile`
--

DROP TABLE IF EXISTS `ezbinaryfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezbinaryfile` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `version` int(11) NOT NULL DEFAULT 0,
  `download_count` int(11) NOT NULL DEFAULT 0,
  `filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `original_filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`contentobject_attribute_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezbinaryfile`
--

LOCK TABLES `ezbinaryfile` WRITE;
/*!40000 ALTER TABLE `ezbinaryfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezbinaryfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state`
--

DROP TABLE IF EXISTS `ezcobj_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_language_id` bigint(20) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcobj_state_identifier` (`group_id`,`identifier`),
  KEY `ezcobj_state_priority` (`priority`),
  KEY `ezcobj_state_lmask` (`language_mask`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state`
--

LOCK TABLES `ezcobj_state` WRITE;
/*!40000 ALTER TABLE `ezcobj_state` DISABLE KEYS */;
INSERT INTO `ezcobj_state` VALUES (1,2,2,'not_locked',3,0),(2,2,2,'locked',3,1);
/*!40000 ALTER TABLE `ezcobj_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_group`
--

DROP TABLE IF EXISTS `ezcobj_state_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_language_id` bigint(20) NOT NULL DEFAULT 0,
  `identifier` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcobj_state_group_identifier` (`identifier`),
  KEY `ezcobj_state_group_lmask` (`language_mask`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_group`
--

LOCK TABLES `ezcobj_state_group` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_group` DISABLE KEYS */;
INSERT INTO `ezcobj_state_group` VALUES (2,2,'ez_lock',3);
/*!40000 ALTER TABLE `ezcobj_state_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_group_language`
--

DROP TABLE IF EXISTS `ezcobj_state_group_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_group_language` (
  `contentobject_state_group_id` int(11) NOT NULL DEFAULT 0,
  `real_language_id` bigint(20) NOT NULL DEFAULT 0,
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `language_id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`contentobject_state_group_id`,`real_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_group_language`
--

LOCK TABLES `ezcobj_state_group_language` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_group_language` DISABLE KEYS */;
INSERT INTO `ezcobj_state_group_language` VALUES (2,2,'',3,'Lock');
/*!40000 ALTER TABLE `ezcobj_state_group_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_language`
--

DROP TABLE IF EXISTS `ezcobj_state_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_language` (
  `contentobject_state_id` int(11) NOT NULL DEFAULT 0,
  `language_id` bigint(20) NOT NULL DEFAULT 0,
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`contentobject_state_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_language`
--

LOCK TABLES `ezcobj_state_language` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_language` DISABLE KEYS */;
INSERT INTO `ezcobj_state_language` VALUES (1,3,'','Not locked'),(2,3,'','Locked');
/*!40000 ALTER TABLE `ezcobj_state_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_link`
--

DROP TABLE IF EXISTS `ezcobj_state_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_link` (
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_state_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contentobject_id`,`contentobject_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_link`
--

LOCK TABLES `ezcobj_state_link` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_link` DISABLE KEYS */;
INSERT INTO `ezcobj_state_link` VALUES (1,1),(4,1),(10,1),(11,1),(12,1),(13,1),(14,1),(41,1),(42,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1);
/*!40000 ALTER TABLE `ezcobj_state_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontent_language`
--

DROP TABLE IF EXISTS `ezcontent_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontent_language` (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `disabled` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezcontent_language_name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontent_language`
--

LOCK TABLES `ezcontent_language` WRITE;
/*!40000 ALTER TABLE `ezcontent_language` DISABLE KEYS */;
INSERT INTO `ezcontent_language` VALUES (2,0,'eng-GB','English (United Kingdom)');
/*!40000 ALTER TABLE `ezcontent_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentbrowsebookmark`
--

DROP TABLE IF EXISTS `ezcontentbrowsebookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentbrowsebookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezcontentbrowsebookmark_location` (`node_id`),
  KEY `ezcontentbrowsebookmark_user` (`user_id`),
  KEY `ezcontentbrowsebookmark_user_location` (`user_id`,`node_id`),
  CONSTRAINT `ezcontentbrowsebookmark_location_fk` FOREIGN KEY (`node_id`) REFERENCES `ezcontentobject_tree` (`node_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ezcontentbrowsebookmark_user_fk` FOREIGN KEY (`user_id`) REFERENCES `ezuser` (`contentobject_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentbrowsebookmark`
--

LOCK TABLES `ezcontentbrowsebookmark` WRITE;
/*!40000 ALTER TABLE `ezcontentbrowsebookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcontentbrowsebookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass`
--

DROP TABLE IF EXISTS `ezcontentclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL DEFAULT 0,
  `always_available` int(11) NOT NULL DEFAULT 0,
  `contentobject_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT 0,
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `initial_language_id` bigint(20) NOT NULL DEFAULT 0,
  `is_container` int(11) NOT NULL DEFAULT 0,
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `modifier_id` int(11) NOT NULL DEFAULT 0,
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `serialized_description_list` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `serialized_name_list` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sort_field` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 1,
  `url_alias_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentclass_version` (`version`),
  KEY `ezcontentclass_identifier` (`identifier`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass`
--

LOCK TABLES `ezcontentclass` WRITE;
/*!40000 ALTER TABLE `ezcontentclass` DISABLE KEYS */;
INSERT INTO `ezcontentclass` VALUES (1,0,1,'<short_name|name>',1024392098,14,'folder',2,1,2,1448831672,14,'a3d405b81be900468eb153d774f4f0d2','a:0:{}','a:1:{s:6:\"eng-GB\";s:6:\"Folder\";}',1,1,NULL),(2,0,0,'<short_title|title>',1024392098,14,'article',2,1,2,1611581047,14,'c15b600eb9198b1924063b5a68758232','a:0:{}','a:1:{s:6:\"eng-GB\";s:7:\"Article\";}',1,1,NULL),(3,0,1,'<name>',1024392098,14,'user_group',2,1,3,1048494743,14,'25b4268cdcd01921b808a0d854b877ef',NULL,'a:2:{s:6:\"eng-GB\";s:10:\"User group\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(4,0,1,'<first_name> <last_name>',1024392098,14,'user',2,0,2,1611581047,14,'40faa822edc579b02c25f6bb7beec3ad','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"User\";}',1,1,NULL),(5,0,1,'<name>',1031484992,14,'image',2,0,3,1048494784,14,'f6df12aa74e36230eb675f364fccd25a',NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(12,0,1,'<name>',1052385472,14,'file',2,0,3,1052385669,14,'637d58bfddf164627bdfd265733280a0',NULL,'a:2:{s:6:\"eng-GB\";s:4:\"File\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL),(42,0,1,'<name>',1435924826,14,'landing_page',2,1,2,1435924826,14,'60c03e9758465eb69d56b3afb6adf18e','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:12:\"Landing page\";}',2,0,''),(43,0,1,'<title>',1537166773,14,'form',2,0,2,1537166834,14,'6f7f21df775a33c1e4bbc76b48c38476','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Form\";}',2,0,''),(44,0,1,'<configuration_name>',1611581046,14,'configuration',2,0,2,1611581046,14,'14ff8228a5a0d720a73032627a94a4ce','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Configuration\";}',2,0,''),(45,0,1,'<ses_name>',1611581046,14,'ses_category',2,1,2,1611581046,14,'ba30d0b284f9b86bb041c6411de53b1a','a:1:{s:6:\"eng-GB\";s:21:\"Category for products\";}','a:1:{s:6:\"eng-GB\";s:16:\"Product category\";}',2,0,''),(46,0,1,'<ses_name>',1611581046,14,'ses_product',2,0,2,1611581046,14,'2cc75c4fac4eed13e5e1b9fa43503227','a:0:{}','a:1:{s:6:\"eng-GB\";s:7:\"Product\";}',2,0,''),(47,0,1,'<name>',1611581047,14,'ses_productcatalog',2,1,2,1611581047,14,'404800b29394f920cd871f494c135b34','a:1:{s:6:\"eng-GB\";s:61:\"Entry point to a product catalog provided by a storage engine\";}','a:1:{s:6:\"eng-GB\";s:15:\"Product catalog\";}',2,0,''),(48,0,1,'<ses_name>',1611581047,14,'ses_product_type',2,1,2,1611581047,14,'a6b38ff5a4cd6fe0958f8234eafb24e6','a:0:{}','a:1:{s:6:\"eng-GB\";s:12:\"Product type\";}',2,0,''),(49,0,1,'<name>',1611581047,14,'st_module',2,0,2,1611581047,14,'b06a039f6162b33a61135d232b019603','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:12:\"Feature link\";}',2,0,''),(50,0,1,'<name>',1611581047,14,'st_textmodule',2,1,2,1611581047,14,'1f74c720678a0c9e1083d437ae8c6292','a:1:{s:6:\"eng-GB\";s:33:\"Textmodule with formatted content\";}','a:1:{s:6:\"eng-GB\";s:10:\"Textmodule\";}',2,0,''),(51,0,1,'<internal_name|title>',1611581047,14,'folder_blog',2,1,2,1611581047,14,'0287ac3368e67cffa54b412189c74557','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Folder (Blog)\";}',2,0,'<title>'),(52,0,1,'<internal_name|title>',1611581047,14,'blog_post',2,1,2,1611581047,14,'0e03012bedac0dced96dc629148d2540','a:0:{}','a:1:{s:6:\"eng-GB\";s:9:\"Blog post\";}',2,0,'<title>'),(53,0,1,'<lastname> <firstname>',1611581047,14,'contact',2,0,2,1611581047,14,'c53cbd56e0f592d8ea72c4a76be74fce','a:0:{}','a:1:{s:6:\"eng-GB\";s:7:\"Contact\";}',2,0,'<lastname>-<firstname>'),(54,0,1,'<internal_name|title>',1611581047,14,'event',2,0,2,1611581047,14,'41aa8d247100dcf7cd758bd7624e6b28','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Event\";}',2,0,'<title>'),(55,0,1,'<internal_name|title>',1611581047,14,'folder_contacts',2,1,2,1611581047,14,'90c07e4be3e28bc52a4e6ed63c25a926','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Folder (Contacts)\";}',2,0,'<title>'),(56,0,1,'<internal_name|title>',1611581047,14,'folder_events',2,1,2,1611581047,14,'2eccaaca5db38240fa497bb49ae5c253','a:0:{}','a:1:{s:6:\"eng-GB\";s:15:\"Folder (Events)\";}',2,0,'<title>'),(57,0,1,'<internal_name|title>',1611581047,14,'folder_news',2,1,2,1611581047,14,'98cc632387b790450e777c3263add679','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Folder (News)\";}',2,0,'<title>'),(58,0,1,'<internal_name|title>',1611581047,14,'news',2,0,2,1611581047,14,'ef3eec4fdaba78789a4b2117e4c770a4','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"News\";}',2,0,'<title>'),(59,0,1,'<title>',1611584814,14,'bike_ride',2,0,2,1611584814,14,'33810f339ab9b2971b1df2c3dc708227','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:9:\"Bike Ride\";}',2,0,''),(60,0,1,'<title>',1611585132,14,'point_of_interest',2,0,2,1611585132,14,'1b347f5cad9eefc5f17348808d4df909','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:17:\"Point of Interest\";}',2,0,'');
/*!40000 ALTER TABLE `ezcontentclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_attribute`
--

DROP TABLE IF EXISTS `ezcontentclass_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL DEFAULT 0,
  `can_translate` int(11) DEFAULT 1,
  `category` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `data_float1` double DEFAULT NULL,
  `data_float2` double DEFAULT NULL,
  `data_float3` double DEFAULT NULL,
  `data_float4` double DEFAULT NULL,
  `data_int1` int(11) DEFAULT NULL,
  `data_int2` int(11) DEFAULT NULL,
  `data_int3` int(11) DEFAULT NULL,
  `data_int4` int(11) DEFAULT NULL,
  `data_text1` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text2` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text3` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text4` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text5` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_type_string` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `identifier` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `is_information_collector` int(11) NOT NULL DEFAULT 0,
  `is_required` int(11) NOT NULL DEFAULT 0,
  `is_searchable` int(11) NOT NULL DEFAULT 0,
  `is_thumbnail` tinyint(1) NOT NULL DEFAULT 0,
  `placement` int(11) NOT NULL DEFAULT 0,
  `serialized_data_text` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `serialized_description_list` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `serialized_name_list` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentclass_attr_ccid` (`contentclass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_attribute`
--

LOCK TABLES `ezcontentclass_attribute` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_attribute` DISABLE KEYS */;
INSERT INTO `ezcontentclass_attribute` VALUES (1,0,1,'',2,NULL,NULL,NULL,NULL,255,0,NULL,NULL,'New article',NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(4,0,1,'',1,NULL,NULL,NULL,NULL,255,0,NULL,NULL,'Folder',NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(6,0,1,'',3,0,0,0,0,255,0,0,0,'','','','',NULL,'ezstring','name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(7,0,1,'',3,0,0,0,0,255,0,0,0,'','','','',NULL,'ezstring','description',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Description\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(8,0,1,'',4,NULL,NULL,NULL,NULL,255,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','first_name',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"First name\";}'),(9,0,1,'',4,NULL,NULL,NULL,NULL,255,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','last_name',0,1,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:9:\"Last name\";}'),(12,0,0,'',4,NULL,NULL,NULL,NULL,32,5,NULL,NULL,NULL,'^[^@]+$',NULL,NULL,NULL,'ezuser','user_account',0,1,0,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:12:\"User account\";}'),(116,0,1,'',5,0,0,0,0,150,0,0,0,'','','','',NULL,'ezstring','name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(117,0,1,'',5,0,0,0,0,10,0,0,0,'','','','',NULL,'ezrichtext','caption',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:7:\"Caption\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(118,0,1,'',5,0,0,0,0,10,0,0,0,'','','','',NULL,'ezimage','image',0,0,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(119,0,1,'',1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','short_description',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Short description\";}'),(120,0,1,'',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','intro',0,1,1,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Intro\";}'),(121,0,1,'',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','body',0,0,1,0,6,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Body\";}'),(123,0,0,'',2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'ezboolean','enable_comments',0,0,0,0,7,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:15:\"Enable comments\";}'),(146,0,1,'',12,0,0,0,0,0,0,0,0,'New file','','','',NULL,'ezstring','name',0,1,1,0,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(147,0,1,'',12,0,0,0,0,10,0,0,0,'','','','',NULL,'ezrichtext','description',0,0,1,0,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Description\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(148,0,1,'',12,0,0,0,0,0,0,0,0,'','','','',NULL,'ezbinaryfile','file',0,1,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"File\";s:16:\"always-available\";s:6:\"eng-GB\";}'),(152,0,1,'',2,NULL,NULL,NULL,NULL,255,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','short_title',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Short title\";}'),(153,0,1,'',2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezauthor','author',0,0,0,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:6:\"Author\";}'),(154,0,1,'',2,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints/><selection_type value=\"0\"/><contentobject-placement/></related-objects>\n','ezobjectrelation','image',0,0,0,0,8,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}'),(155,0,1,'',1,NULL,NULL,NULL,NULL,100,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','short_name',0,0,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Short name\";}'),(156,0,1,'',1,NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','description',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(179,0,1,'',4,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eztext','signature',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:9:\"Signature\";}'),(180,0,1,'',4,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage','image',0,0,0,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}'),(185,0,1,'content',42,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,10,'N;','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(186,0,1,'content',42,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','description',0,1,1,0,20,'N;','a:1:{s:6:\"eng-GB\";s:24:\"Landing page description\";}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(187,0,1,'content',42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezlandingpage','page',0,0,0,0,30,'N;','a:1:{s:6:\"eng-GB\";s:12:\"Landing page\";}','a:1:{s:6:\"eng-GB\";s:12:\"Landing page\";}'),(188,0,1,'content',43,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(189,0,1,'content',43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezform','form',0,0,0,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Form\";}'),(190,0,1,'',44,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','configuration_name',0,0,0,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:18:\"Configuration Name\";}'),(191,0,0,'',44,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eztext','configuration_file',0,0,0,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:18:\"Configuration File\";}'),(192,0,1,'',45,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_name',0,1,1,0,1,'N;','a:1:{s:6:\"eng-GB\";s:20:\"Name of the category\";}','a:1:{s:6:\"eng-GB\";s:13:\"Category name\";}'),(193,0,1,'',45,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_subtitle',0,0,1,0,2,'N;','a:1:{s:6:\"eng-GB\";s:8:\"Subtitle\";}','a:1:{s:6:\"eng-GB\";s:8:\"Subtitle\";}'),(194,0,1,'',45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','ses_short_description',0,0,1,0,3,'N;','a:1:{s:6:\"eng-GB\";s:34:\"Short description for the category\";}','a:1:{s:6:\"eng-GB\";s:26:\"Category description short\";}'),(195,0,1,'',45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','ses_long_description',0,0,1,0,4,'N;','a:1:{s:6:\"eng-GB\";s:33:\"Long description for the category\";}','a:1:{s:6:\"eng-GB\";s:25:\"Category description long\";}'),(196,0,1,'',45,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage','ses_image_main',0,0,0,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:19:\"Category main image\";}'),(197,0,1,'',45,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_code',0,0,1,0,6,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Category code\";}'),(198,0,1,'',45,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_meta_keywords',0,0,1,0,7,'N;','a:1:{s:6:\"eng-GB\";s:21:\"Meta keywords for SEO\";}','a:1:{s:6:\"eng-GB\";s:13:\"Meta keywords\";}'),(199,0,1,'',45,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_meta_description',0,0,1,0,8,'N;','a:1:{s:6:\"eng-GB\";s:28:\"Meta tag description for SEO\";}','a:1:{s:6:\"eng-GB\";s:16:\"Meta description\";}'),(200,0,1,'metadata',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_name',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Productname\";}'),(201,0,1,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_subtitle',0,0,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:8:\"Subtitle\";}'),(202,0,1,'metadata',46,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezselection','ses_type',0,0,1,0,3,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:12:\"Product type\";}'),(203,0,1,'',46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','ses_short_description',0,0,1,0,4,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:17:\"Short description\";}'),(204,0,1,'',46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','ses_long_description',0,0,1,0,5,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:16:\"Long description\";}'),(205,0,0,'metadata',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_sku',0,1,1,0,6,'N;','a:1:{s:6:\"eng-GB\";s:18:\"SKU of the product\";}','a:1:{s:6:\"eng-GB\";s:3:\"SKU\";}'),(206,0,1,'content',46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,'sesspecificationstype','ses_specifications',0,0,1,0,7,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:14:\"Specifications\";}'),(207,0,0,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_ean',0,0,1,0,8,'N;','a:1:{s:6:\"eng-GB\";s:18:\"EAN of the product\";}','a:1:{s:6:\"eng-GB\";s:3:\"EAN\";}'),(208,0,1,'content',46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'null',NULL,NULL,NULL,NULL,'uivarvarianttype','ses_variants',0,0,1,0,9,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:8:\"Variants\";}'),(209,0,0,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_manufacturer_sku',0,0,1,0,10,'N;','a:1:{s:6:\"eng-GB\";s:36:\"SKU of the product from manufacturer\";}','a:1:{s:6:\"eng-GB\";s:16:\"Manufacturer SKU\";}'),(210,0,1,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_unit_price',0,0,1,0,11,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:10:\"Unit price\";}'),(211,0,1,'',46,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage','ses_image_main',0,0,0,0,12,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Product image\";}'),(212,0,1,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_manufacturer',0,0,1,0,13,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:12:\"Manufacturer\";}'),(213,0,1,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_color',0,0,1,0,14,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:5:\"Color\";}'),(214,0,1,'',46,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eztext','ses_specification',0,0,0,0,15,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:23:\"Technical specification\";}'),(215,0,1,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_video',0,0,1,0,16,'N;','a:1:{s:6:\"eng-GB\";s:30:\"contains the URL for the video\";}','a:1:{s:6:\"eng-GB\";s:5:\"Video\";}'),(216,0,1,'',46,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage','ses_image_1',0,0,0,0,17,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:20:\"Add. Product image 1\";}'),(217,0,1,'',46,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage','ses_image_2',0,0,0,0,18,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:20:\"Add. Product image 2\";}'),(218,0,1,'',46,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage','ses_image_3',0,0,0,0,19,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:20:\"Add. Product image 3\";}'),(219,0,1,'',46,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage','ses_image_4',0,0,0,0,20,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:19:\"Add Product image 4\";}'),(220,0,1,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_currency',0,0,1,0,21,'N;','a:1:{s:6:\"eng-GB\";s:35:\"The default currency of the product\";}','a:1:{s:6:\"eng-GB\";s:8:\"Currency\";}'),(221,0,1,'content',46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sesselection','ses_vat_code',0,0,1,0,22,'N;','a:1:{s:6:\"eng-GB\";s:27:\"The vat code of the product\";}','a:1:{s:6:\"eng-GB\";s:8:\"VAT Code\";}'),(222,0,1,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_product_type',0,0,1,0,23,'N;','a:1:{s:6:\"eng-GB\";s:21:\"a type of the product\";}','a:1:{s:6:\"eng-GB\";s:12:\"Product Type\";}'),(223,0,1,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_packaging_unit',0,0,0,0,24,'N;','a:1:{s:6:\"eng-GB\";s:14:\"Packaging unit\";}','a:1:{s:6:\"eng-GB\";s:14:\"Packaging unit\";}'),(224,0,1,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_min_order_quantity',0,0,1,0,25,'N;','a:1:{s:6:\"eng-GB\";s:37:\"minimal order quantity of the product\";}','a:1:{s:6:\"eng-GB\";s:18:\"Min order quantity\";}'),(225,0,1,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_max_order_quantity',0,0,1,0,26,'N;','a:1:{s:6:\"eng-GB\";s:37:\"maximal order quantity of the product\";}','a:1:{s:6:\"eng-GB\";s:18:\"Max order quantity\";}'),(226,0,1,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_unit',0,0,1,0,27,'N;','a:1:{s:6:\"eng-GB\";s:12:\"Product unit\";}','a:1:{s:6:\"eng-GB\";s:4:\"Unit\";}'),(227,0,1,'',46,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_stock_numeric',0,0,1,0,29,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Stock numeric\";}'),(228,0,1,'',46,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'ezboolean','ses_discontinued',0,0,1,0,30,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:12:\"Discontinued\";}'),(229,0,1,'',46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezkeyword','tags',0,0,1,0,31,'N;','a:1:{s:6:\"eng-GB\";s:36:\"Please add tags separated by a comma\";}','a:1:{s:6:\"eng-GB\";s:4:\"Tags\";}'),(230,0,1,'',47,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,1,'N;','a:1:{s:6:\"eng-GB\";s:27:\"Name of the product catalog\";}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(231,0,1,'',47,NULL,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'ezinteger','root_node',0,1,0,0,2,'N;','a:1:{s:6:\"eng-GB\";s:31:\"Root node of the storage engine\";}','a:1:{s:6:\"eng-GB\";s:9:\"Root node\";}'),(232,0,1,'',47,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','path_prefix',0,0,0,0,3,'N;','a:1:{s:6:\"eng-GB\";s:43:\"Optional path prefix for the storage engine\";}','a:1:{s:6:\"eng-GB\";s:11:\"Path prefix\";}'),(233,0,1,'',47,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','depth',0,0,1,0,4,'N;','a:1:{s:6:\"eng-GB\";s:24:\"The depth of the catalog\";}','a:1:{s:6:\"eng-GB\";s:5:\"Depth\";}'),(234,0,1,'content',48,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_name',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Product type name\";}'),(235,0,1,'content',48,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_code',0,0,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Product type code\";}'),(236,0,1,'content',48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','ses_short_description',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Short description\";}'),(237,0,1,'content',48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','ses_long_description',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Long description\";}'),(238,0,1,'content',48,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage','ses_image_main',0,0,0,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:18:\"Product type image\";}'),(239,0,1,'content',48,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','ses_subtitle',0,0,1,0,6,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:8:\"Subtitle\";}'),(240,0,1,'',49,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,0,0,1,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(241,0,0,'',49,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','controller',0,0,0,0,2,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:10:\"Controller\";}'),(242,0,1,'content',49,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eztext','params',0,0,1,0,3,'N;','a:1:{s:6:\"eng-GB\";s:46:\"Semicolon separated parameters: e.g. key;value\";}','a:1:{s:6:\"eng-GB\";s:10:\"Parameters\";}'),(243,0,1,'',50,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,1,1,0,1,'N;','a:1:{s:6:\"eng-GB\";s:22:\"Name of the textmodule\";}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(244,0,0,'',50,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','identifier',0,1,1,0,2,'N;','a:1:{s:6:\"eng-GB\";s:32:\"The identifier of the textmodule\";}','a:1:{s:6:\"eng-GB\";s:10:\"Identifier\";}'),(245,0,1,'',50,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','context',0,0,1,0,3,'N;','a:1:{s:6:\"eng-GB\";s:28:\"Optional translation context\";}','a:1:{s:6:\"eng-GB\";s:7:\"Context\";}'),(246,0,1,'',50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','content',0,0,1,0,4,'N;','a:1:{s:6:\"eng-GB\";s:29:\"The content of the textmodule\";}','a:1:{s:6:\"eng-GB\";s:7:\"Content\";}'),(247,0,0,'content',51,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','internal_name',0,0,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Internal name\";}'),(248,0,1,'content',51,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(249,0,1,'content',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','intro',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Intro\";}'),(250,0,1,'content',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','body',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Body\";}'),(251,0,1,'content',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/><allowed-class contentclass-identifier=\"video\"/></constraints><type value=\"2\"/><object_class value=\"\"/><selection_type value=\"0\"/><contentobject-placement node-id=\"43\"/><selection_limit value=\"0\"/></related-objects>\n','ezobjectrelationlist','media',0,0,1,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Media\";}'),(252,0,1,'content',51,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','alternative_title',0,0,1,0,7,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Title\";}'),(253,0,1,'content',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','alternative_intro',0,0,1,0,8,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Intro\";}'),(254,0,1,'content',51,NULL,NULL,NULL,NULL,0,51,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/></constraints><selection_type value=\"0\"/><contentobject-placement node-id=\"51\"/></related-objects>\n','ezobjectrelation','alternative_image',0,0,1,0,9,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}'),(255,0,1,'content',51,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_title',0,0,1,0,10,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Meta title\";}'),(256,0,1,'content',51,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_description',0,0,1,0,11,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Meta description\";}'),(257,0,1,'content',51,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_keywords',0,0,1,0,12,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Meta keywords\";}'),(258,0,0,'content',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','internal_name',0,0,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Internal name\";}'),(259,0,1,'content',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,0,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(260,0,1,'content',52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','intro',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Intro\";}'),(261,0,1,'content',52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','body',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Body\";}'),(262,0,1,'content',52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/><allowed-class contentclass-identifier=\"video\"/></constraints><type value=\"2\"/><object_class value=\"\"/><selection_type value=\"0\"/><contentobject-placement node-id=\"43\"/><selection_limit value=\"0\"/></related-objects>\n','ezobjectrelationlist','media',0,0,1,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Media\";}'),(263,0,1,'content',52,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezdate','date',0,0,1,0,6,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Date\";}'),(264,0,1,'content',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','author',0,0,1,0,7,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:6:\"Author\";}'),(265,0,1,'content',52,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,'ezboolean','comments_enabled',0,0,1,0,8,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Comments enabled\";}'),(266,0,1,'content',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','alternative_title',0,0,1,0,9,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Title\";}'),(267,0,1,'content',52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','alternative_intro',0,0,1,0,10,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Title\";}'),(268,0,1,'content',52,NULL,NULL,NULL,NULL,0,51,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/></constraints><selection_type value=\"0\"/><contentobject-placement node-id=\"51\"/></related-objects>\n','ezobjectrelation','alternative_image',0,0,1,0,11,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}'),(269,0,1,'content',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_title',0,0,1,0,12,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Meta title\";}'),(270,0,1,'content',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_description',0,0,1,0,13,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Meta description\";}'),(271,0,1,'content',52,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_keywords',0,0,1,0,14,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Meta keywords\";}'),(272,0,0,'content',53,NULL,NULL,NULL,NULL,0,0,NULL,NULL,'New Contact',NULL,NULL,NULL,NULL,'ezstring','firstname',0,1,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:9:\"Firstname\";}'),(273,0,0,'content',53,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','lastname',0,1,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:8:\"Lastname\";}'),(274,0,1,'content',53,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','position',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:8:\"Position\";}'),(275,0,1,'content',53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','description',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(276,0,1,'content',53,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage','photo',0,1,0,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Photo\";}'),(277,0,1,'content',53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezemail','email',0,0,1,0,6,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Email\";}'),(278,0,0,'content',54,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','internal_name',0,0,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Internal name\";}'),(279,0,1,'content',54,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(280,0,1,'content',54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','intro',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Intro\";}'),(281,0,1,'content',54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','body',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Body\";}'),(282,0,1,'content',54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/><allowed-class contentclass-identifier=\"video\"/></constraints><type value=\"2\"/><object_class value=\"\"/><selection_type value=\"0\"/><contentobject-placement node-id=\"43\"/><selection_limit value=\"0\"/></related-objects>\n','ezobjectrelationlist','media',0,0,1,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Media\";}'),(283,0,1,'content',54,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezdate','start_date',0,0,1,0,6,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Start date\";}'),(284,0,1,'content',54,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezdate','end_date',0,0,1,0,7,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:8:\"End date\";}'),(285,0,1,'content',54,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','alternative_title',0,0,1,0,8,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Title\";}'),(286,0,1,'content',54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','alternative_intro',0,0,1,0,9,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Title\";}'),(287,0,1,'content',54,NULL,NULL,NULL,NULL,0,51,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/></constraints><selection_type value=\"0\"/><contentobject-placement node-id=\"51\"/></related-objects>\n','ezobjectrelation','alternative_image',0,0,1,0,10,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}'),(288,0,1,'content',54,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','address',0,0,1,0,11,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:7:\"Address\";}'),(289,0,1,'content',54,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','zipcode',0,0,1,0,12,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:8:\"Zip code\";}'),(290,0,1,'content',54,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','city',0,0,1,0,13,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"City\";}'),(291,0,1,'content',54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sesselection','country',0,0,1,0,14,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:7:\"Country\";}'),(292,0,1,'content',54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezgmaplocation','map_location',0,0,1,0,15,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:12:\"Map location\";}'),(293,0,1,'content',54,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','url',0,0,1,0,16,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:3:\"URL\";}'),(294,0,1,'content',54,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_title',0,0,1,0,17,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Meta title\";}'),(295,0,1,'content',54,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_description',0,0,1,0,18,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Meta description\";}'),(296,0,1,'content',54,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_keywords',0,0,1,0,19,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Meta keywords\";}'),(297,0,0,'content',55,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','internal_name',0,0,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Internal name\";}'),(298,0,1,'content',55,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(299,0,1,'content',55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','intro',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Intro\";}'),(300,0,1,'content',55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','body',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Body\";}'),(301,0,1,'content',55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/><allowed-class contentclass-identifier=\"video\"/></constraints><type value=\"2\"/><object_class value=\"\"/><selection_type value=\"0\"/><contentobject-placement node-id=\"43\"/><selection_limit value=\"0\"/></related-objects>\n','ezobjectrelationlist','media',0,0,1,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Media\";}'),(302,0,1,'content',55,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','alternative_title',0,0,1,0,7,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Title\";}'),(303,0,1,'content',55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','alternative_intro',0,0,1,0,8,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Title\";}'),(304,0,1,'content',55,NULL,NULL,NULL,NULL,0,43,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/></constraints><selection_type value=\"0\"/><contentobject-placement node-id=\"43\"/></related-objects>\n','ezobjectrelation','alternative_image',0,0,1,0,9,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}'),(305,0,1,'content',55,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_title',0,0,1,0,10,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Meta title\";}'),(306,0,1,'content',55,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_description',0,0,1,0,11,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Meta description\";}'),(307,0,1,'content',55,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_keywords',0,0,1,0,12,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Meta keywords\";}'),(308,0,0,'content',56,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','internal_name',0,0,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Internal name\";}'),(309,0,1,'content',56,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(310,0,1,'content',56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','intro',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Intro\";}'),(311,0,1,'content',56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','body',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Body\";}'),(312,0,1,'content',56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/><allowed-class contentclass-identifier=\"video\"/></constraints><type value=\"2\"/><object_class value=\"\"/><selection_type value=\"0\"/><contentobject-placement node-id=\"43\"/><selection_limit value=\"0\"/></related-objects>\n','ezobjectrelationlist','media',0,0,1,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Media\";}'),(313,0,1,'content',56,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','alternative_title',0,0,1,0,7,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative title\";}'),(314,0,1,'content',56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','alternative_intro',0,0,1,0,8,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Title\";}'),(315,0,1,'content',56,NULL,NULL,NULL,NULL,0,43,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/></constraints><selection_type value=\"0\"/><contentobject-placement node-id=\"43\"/></related-objects>\n','ezobjectrelation','alternative_image',0,0,1,0,9,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}'),(316,0,1,'content',56,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_title',0,0,1,0,10,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Meta title\";}'),(317,0,1,'content',56,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_description',0,0,1,0,11,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Meta description\";}'),(318,0,1,'content',56,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_keywords',0,0,1,0,12,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Meta keywords\";}'),(319,0,0,'content',57,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','internal_name',0,0,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Internal name\";}'),(320,0,1,'content',57,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(321,0,1,'content',57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','intro',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Intro\";}'),(322,0,1,'content',57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','body',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Body\";}'),(323,0,1,'content',57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/><allowed-class contentclass-identifier=\"video\"/></constraints><type value=\"2\"/><object_class value=\"\"/><selection_type value=\"0\"/><contentobject-placement node-id=\"43\"/><selection_limit value=\"0\"/></related-objects>\n','ezobjectrelationlist','media',0,0,1,0,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Media\";}'),(324,0,1,'content',57,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','alternative_title',0,0,1,0,7,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Title\";}'),(325,0,1,'content',57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','alternative_intro',0,0,1,0,8,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Title\";}'),(326,0,1,'content',57,NULL,NULL,NULL,NULL,0,43,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/></constraints><selection_type value=\"0\"/><contentobject-placement node-id=\"43\"/></related-objects>\n','ezobjectrelation','alternative_image',0,0,1,0,9,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}'),(327,0,1,'content',57,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_title',0,0,1,0,10,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Meta title\";}'),(328,0,1,'content',57,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_description',0,0,1,0,11,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Meta description\";}'),(329,0,1,'content',57,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_keywords',0,0,1,0,12,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Meta keywords\";}'),(330,0,0,'content',58,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','internal_name',0,0,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Internal name\";}'),(331,0,1,'content',58,NULL,NULL,NULL,NULL,255,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(332,0,1,'content',58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','intro',0,0,1,0,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Intro\";}'),(333,0,1,'content',58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','body',0,0,1,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Body\";}'),(334,0,1,'content',58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/><allowed-class contentclass-identifier=\"video\"/></constraints><type value=\"2\"/><object_class value=\"\"/><selection_type value=\"0\"/><contentobject-placement node-id=\"43\"/><selection_limit value=\"0\"/></related-objects>\n','ezobjectrelationlist','media',0,0,1,0,5,'N;','a:1:{s:6:\"eng-GB\";s:15:\"Images & videos\";}','a:1:{s:6:\"eng-GB\";s:5:\"Media\";}'),(335,0,0,'content',58,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezdate','date',0,1,1,0,6,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Date\";}'),(336,0,1,'content',58,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','alternative_title',0,0,1,0,7,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Title\";}'),(337,0,1,'content',58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','alternative_intro',0,0,1,0,8,'N;','a:1:{s:6:\"eng-GB\";s:42:\"Text  shown on landingpages and listpages.\";}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Title\";}'),(338,0,1,'content',58,NULL,NULL,NULL,NULL,0,51,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/></constraints><selection_type value=\"0\"/><contentobject-placement node-id=\"51\"/></related-objects>\n','ezobjectrelation','alternative_image',0,0,1,0,9,'N;','a:1:{s:6:\"eng-GB\";s:42:\"Image shown on landingpages and listpages.\";}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}'),(339,0,1,'content',58,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_title',0,0,1,0,10,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Meta title\";}'),(340,0,1,'content',58,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_description',0,0,1,0,11,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Meta description\";}'),(341,0,1,'content',58,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_keywords',0,0,1,0,12,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Meta keywords\";}'),(342,0,1,'',4,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','name',0,0,1,0,50,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}'),(343,0,0,'content',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sesselection','salutation',0,0,1,0,51,'N;','a:1:{s:6:\"eng-GB\";s:27:\"Salutation of the shop user\";}','a:1:{s:6:\"eng-GB\";s:10:\"Salutation\";}'),(344,0,1,'',4,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','customer_number',0,0,1,0,52,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:15:\"Customer number\";}'),(345,0,1,'',4,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','contact_number',0,0,1,0,53,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:14:\"Contact number\";}'),(346,0,1,'',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sesprofiledata','customer_profile_data',0,0,1,0,54,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:21:\"Customer profile data\";}'),(347,0,1,'',4,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezfloat','budget_order',0,0,0,0,55,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Budget per order\";}'),(348,0,0,'',4,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezfloat','budget_month',0,0,0,0,56,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Budget per month\";}'),(349,0,1,'content',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sesselection','ses_customer_group',0,0,1,0,57,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:14:\"Customer group\";}'),(350,0,0,'content',4,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,'ezboolean','ses_hastopay_vat',0,0,1,0,58,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:23:\"Customer has to pay VAT\";}'),(351,0,0,'content',4,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,'ezboolean','ses_display_vat',0,0,1,0,59,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Display VAT\";}'),(352,0,0,'content',2,NULL,NULL,NULL,NULL,255,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','internal_name',0,0,1,0,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Internal name\";}'),(353,0,1,'content',2,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','identifier',0,0,1,0,15,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Identifier\";}'),(354,0,1,'content',2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezselection><options><option id=\"0\" name=\"Test1\"/><option id=\"1\" name=\"Test2\"/></options></ezselection>\n','ezselection','article_selection',0,0,1,0,16,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:17:\"Article selection\";}'),(355,0,1,'content',2,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eztext','html',0,0,0,0,17,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"HTML\";}'),(356,0,1,'content',2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezbinaryfile','file',0,0,1,0,18,'N;','a:1:{s:6:\"eng-GB\";s:18:\"printable PDF file\";}','a:1:{s:6:\"eng-GB\";s:4:\"File\";}'),(357,0,1,'content',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/><allowed-class contentclass-identifier=\"video\"/></constraints><type value=\"2\"/><object_class value=\"\"/><selection_type value=\"0\"/><contentobject-placement node-id=\"43\"/><selection_limit value=\"0\"/></related-objects>\n','ezobjectrelationlist','media',0,0,1,0,19,'N;','a:1:{s:6:\"eng-GB\";s:35:\"Images & Videos (for ContentPlugin)\";}','a:1:{s:6:\"eng-GB\";s:5:\"Media\";}'),(358,0,1,'content',2,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezdate','date',0,0,1,0,20,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Date\";}'),(359,0,1,'content',2,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','alternative_title',0,0,1,0,21,'N;','a:1:{s:6:\"eng-GB\";s:17:\"For ContentPlugin\";}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Title\";}'),(360,0,1,'content',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','alternative_intro',0,0,1,0,22,'N;','a:1:{s:6:\"eng-GB\";s:17:\"For ContentPlugin\";}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Intro\";}'),(361,0,1,'content',2,NULL,NULL,NULL,NULL,0,51,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><constraints><allowed-class contentclass-identifier=\"image\"/></constraints><selection_type value=\"0\"/><contentobject-placement node-id=\"51\"/></related-objects>\n','ezobjectrelation','alternative_image',0,0,1,0,23,'N;','a:1:{s:6:\"eng-GB\";s:60:\"Image shown on landingpages and listpages. For ContentPlugin\";}','a:1:{s:6:\"eng-GB\";s:17:\"Alternative Image\";}'),(362,0,1,'content',2,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_title',0,0,1,0,24,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:10:\"Meta title\";}'),(363,0,1,'content',2,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_description',0,0,1,0,25,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Meta description\";}'),(364,0,1,'content',2,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','meta_keywords',0,0,1,0,26,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:13:\"Meta keywords\";}'),(365,0,1,'content',59,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,1,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(366,0,1,'content',59,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage','photo',0,0,0,0,2,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:5:\"Photo\";}'),(367,0,1,'content',59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','description',0,0,1,0,3,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(368,0,1,'content',59,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezselection><options><option id=\"0\" name=\"Beginner\"/><option id=\"1\" name=\"Intermediate\"/><option id=\"2\" name=\"Advanced\"/></options></ezselection>\n','ezselection','difficulty',0,0,1,0,4,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:10:\"Difficulty\";}'),(369,0,1,'content',59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezgmaplocation','starting_point',0,0,1,0,5,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:14:\"Starting Point\";}'),(370,0,1,'content',59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezgmaplocation','ending_point',0,0,1,0,6,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:12:\"Ending Point\";}'),(371,0,1,'content',59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'ezinteger','length',0,0,1,0,7,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:6:\"Length\";}'),(372,0,1,'content',59,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezauthor','author',0,0,1,0,8,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:6:\"Author\";}'),(373,0,1,'content',60,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring','title',0,1,1,0,1,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}'),(374,0,1,'content',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','description',0,0,1,0,2,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}'),(375,0,1,'content',60,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage','photo',0,0,0,0,3,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:5:\"Photo\";}'),(376,0,1,'content',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext','photo_legend',0,0,1,0,5,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:12:\"Photo legend\";}'),(377,0,1,'content',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezgmaplocation','place',0,0,1,0,6,'N;','a:1:{s:6:\"eng-GB\";s:0:\"\";}','a:1:{s:6:\"eng-GB\";s:5:\"Place\";}');
/*!40000 ALTER TABLE `ezcontentclass_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_attribute_ml`
--

DROP TABLE IF EXISTS `ezcontentclass_attribute_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_attribute_ml` (
  `contentclass_attribute_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_text` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_json` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`contentclass_attribute_id`,`version`,`language_id`),
  KEY `ezcontentclass_attribute_ml_lang_fk` (`language_id`),
  CONSTRAINT `ezcontentclass_attribute_ml_lang_fk` FOREIGN KEY (`language_id`) REFERENCES `ezcontent_language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_attribute_ml`
--

LOCK TABLES `ezcontentclass_attribute_ml` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_attribute_ml` DISABLE KEYS */;
INSERT INTO `ezcontentclass_attribute_ml` VALUES (1,0,2,'Title',NULL,NULL,NULL),(8,0,2,'First name',NULL,NULL,NULL),(9,0,2,'Last name',NULL,NULL,NULL),(12,0,2,'User account',NULL,NULL,NULL),(120,0,2,'Intro',NULL,NULL,NULL),(121,0,2,'Body',NULL,NULL,NULL),(123,0,2,'Enable comments',NULL,NULL,NULL),(152,0,2,'Short title',NULL,NULL,NULL),(153,0,2,'Author',NULL,NULL,NULL),(154,0,2,'Image',NULL,NULL,NULL),(179,0,2,'Signature',NULL,NULL,NULL),(180,0,2,'Image',NULL,NULL,NULL),(190,0,2,'Configuration Name',NULL,NULL,NULL),(191,0,2,'Configuration File',NULL,NULL,NULL),(192,0,2,'Category name','Name of the category',NULL,NULL),(193,0,2,'Subtitle','Subtitle',NULL,NULL),(194,0,2,'Category description short','Short description for the category',NULL,NULL),(195,0,2,'Category description long','Long description for the category',NULL,NULL),(196,0,2,'Category main image',NULL,NULL,NULL),(197,0,2,'Category code',NULL,NULL,NULL),(198,0,2,'Meta keywords','Meta keywords for SEO',NULL,NULL),(199,0,2,'Meta description','Meta tag description for SEO',NULL,NULL),(200,0,2,'Productname',NULL,NULL,NULL),(201,0,2,'Subtitle',NULL,NULL,NULL),(202,0,2,'Product type','',NULL,NULL),(203,0,2,'Short description','',NULL,NULL),(204,0,2,'Long description','',NULL,NULL),(205,0,2,'SKU','SKU of the product',NULL,NULL),(206,0,2,'Specifications',NULL,NULL,NULL),(207,0,2,'EAN','EAN of the product',NULL,NULL),(208,0,2,'Variants',NULL,NULL,NULL),(209,0,2,'Manufacturer SKU','SKU of the product from manufacturer',NULL,NULL),(210,0,2,'Unit price','',NULL,NULL),(211,0,2,'Product image',NULL,NULL,NULL),(212,0,2,'Manufacturer','',NULL,NULL),(213,0,2,'Color','',NULL,NULL),(214,0,2,'Technical specification','',NULL,NULL),(215,0,2,'Video','contains the URL for the video',NULL,NULL),(216,0,2,'Add. Product image 1',NULL,NULL,NULL),(217,0,2,'Add. Product image 2',NULL,NULL,NULL),(218,0,2,'Add. Product image 3',NULL,NULL,NULL),(219,0,2,'Add Product image 4',NULL,NULL,NULL),(220,0,2,'Currency','The default currency of the product',NULL,NULL),(221,0,2,'VAT Code','The vat code of the product',NULL,NULL),(222,0,2,'Product Type','a type of the product',NULL,NULL),(223,0,2,'Packaging unit','Packaging unit',NULL,NULL),(224,0,2,'Min order quantity','minimal order quantity of the product',NULL,NULL),(225,0,2,'Max order quantity','maximal order quantity of the product',NULL,NULL),(226,0,2,'Unit','Product unit',NULL,NULL),(227,0,2,'Stock numeric',NULL,NULL,NULL),(228,0,2,'Discontinued',NULL,NULL,NULL),(229,0,2,'Tags','Please add tags separated by a comma',NULL,NULL),(230,0,2,'Name','Name of the product catalog',NULL,NULL),(231,0,2,'Root node','Root node of the storage engine',NULL,NULL),(232,0,2,'Path prefix','Optional path prefix for the storage engine',NULL,NULL),(233,0,2,'Depth','The depth of the catalog',NULL,NULL),(234,0,2,'Product type name',NULL,NULL,NULL),(235,0,2,'Product type code',NULL,NULL,NULL),(236,0,2,'Short description',NULL,NULL,NULL),(237,0,2,'Long description',NULL,NULL,NULL),(238,0,2,'Product type image',NULL,NULL,NULL),(239,0,2,'Subtitle',NULL,NULL,NULL),(240,0,2,'Name','',NULL,NULL),(241,0,2,'Controller','',NULL,NULL),(242,0,2,'Parameters','Semicolon separated parameters: e.g. key;value',NULL,NULL),(243,0,2,'Name','Name of the textmodule',NULL,NULL),(244,0,2,'Identifier','The identifier of the textmodule',NULL,NULL),(245,0,2,'Context','Optional translation context',NULL,NULL),(246,0,2,'Content','The content of the textmodule',NULL,NULL),(247,0,2,'Internal name',NULL,NULL,NULL),(248,0,2,'Title',NULL,NULL,NULL),(249,0,2,'Intro',NULL,NULL,NULL),(250,0,2,'Body',NULL,NULL,NULL),(251,0,2,'Media',NULL,NULL,NULL),(252,0,2,'Alternative Title',NULL,NULL,NULL),(253,0,2,'Intro',NULL,NULL,NULL),(254,0,2,'Image',NULL,NULL,NULL),(255,0,2,'Meta title',NULL,NULL,NULL),(256,0,2,'Meta description',NULL,NULL,NULL),(257,0,2,'Meta keywords',NULL,NULL,NULL),(258,0,2,'Internal name',NULL,NULL,NULL),(259,0,2,'Title',NULL,NULL,NULL),(260,0,2,'Intro',NULL,NULL,NULL),(261,0,2,'Body',NULL,NULL,NULL),(262,0,2,'Media',NULL,NULL,NULL),(263,0,2,'Date',NULL,NULL,NULL),(264,0,2,'Author',NULL,NULL,NULL),(265,0,2,'Comments enabled',NULL,NULL,NULL),(266,0,2,'Alternative Title',NULL,NULL,NULL),(267,0,2,'Alternative Title',NULL,NULL,NULL),(268,0,2,'Image',NULL,NULL,NULL),(269,0,2,'Meta title',NULL,NULL,NULL),(270,0,2,'Meta description',NULL,NULL,NULL),(271,0,2,'Meta keywords',NULL,NULL,NULL),(272,0,2,'Firstname',NULL,NULL,NULL),(273,0,2,'Lastname',NULL,NULL,NULL),(274,0,2,'Position',NULL,NULL,NULL),(275,0,2,'Description',NULL,NULL,NULL),(276,0,2,'Photo',NULL,NULL,NULL),(277,0,2,'Email',NULL,NULL,NULL),(278,0,2,'Internal name',NULL,NULL,NULL),(279,0,2,'Title',NULL,NULL,NULL),(280,0,2,'Intro',NULL,NULL,NULL),(281,0,2,'Body',NULL,NULL,NULL),(282,0,2,'Media',NULL,NULL,NULL),(283,0,2,'Start date',NULL,NULL,NULL),(284,0,2,'End date',NULL,NULL,NULL),(285,0,2,'Alternative Title',NULL,NULL,NULL),(286,0,2,'Alternative Title',NULL,NULL,NULL),(287,0,2,'Image',NULL,NULL,NULL),(288,0,2,'Address',NULL,NULL,NULL),(289,0,2,'Zip code',NULL,NULL,NULL),(290,0,2,'City',NULL,NULL,NULL),(291,0,2,'Country',NULL,NULL,NULL),(292,0,2,'Map location',NULL,NULL,NULL),(293,0,2,'URL',NULL,NULL,NULL),(294,0,2,'Meta title',NULL,NULL,NULL),(295,0,2,'Meta description',NULL,NULL,NULL),(296,0,2,'Meta keywords',NULL,NULL,NULL),(297,0,2,'Internal name',NULL,NULL,NULL),(298,0,2,'Title',NULL,NULL,NULL),(299,0,2,'Intro',NULL,NULL,NULL),(300,0,2,'Body',NULL,NULL,NULL),(301,0,2,'Media',NULL,NULL,NULL),(302,0,2,'Alternative Title',NULL,NULL,NULL),(303,0,2,'Alternative Title',NULL,NULL,NULL),(304,0,2,'Image',NULL,NULL,NULL),(305,0,2,'Meta title',NULL,NULL,NULL),(306,0,2,'Meta description',NULL,NULL,NULL),(307,0,2,'Meta keywords',NULL,NULL,NULL),(308,0,2,'Internal name',NULL,NULL,NULL),(309,0,2,'Title',NULL,NULL,NULL),(310,0,2,'Intro',NULL,NULL,NULL),(311,0,2,'Body',NULL,NULL,NULL),(312,0,2,'Media',NULL,NULL,NULL),(313,0,2,'Alternative title',NULL,NULL,NULL),(314,0,2,'Alternative Title',NULL,NULL,NULL),(315,0,2,'Image',NULL,NULL,NULL),(316,0,2,'Meta title',NULL,NULL,NULL),(317,0,2,'Meta description',NULL,NULL,NULL),(318,0,2,'Meta keywords',NULL,NULL,NULL),(319,0,2,'Internal name',NULL,NULL,NULL),(320,0,2,'Title',NULL,NULL,NULL),(321,0,2,'Intro',NULL,NULL,NULL),(322,0,2,'Body',NULL,NULL,NULL),(323,0,2,'Media',NULL,NULL,NULL),(324,0,2,'Alternative Title',NULL,NULL,NULL),(325,0,2,'Alternative Title',NULL,NULL,NULL),(326,0,2,'Image',NULL,NULL,NULL),(327,0,2,'Meta title',NULL,NULL,NULL),(328,0,2,'Meta description',NULL,NULL,NULL),(329,0,2,'Meta keywords',NULL,NULL,NULL),(330,0,2,'Internal name',NULL,NULL,NULL),(331,0,2,'Title',NULL,NULL,NULL),(332,0,2,'Intro',NULL,NULL,NULL),(333,0,2,'Body',NULL,NULL,NULL),(334,0,2,'Media','Images & videos',NULL,NULL),(335,0,2,'Date',NULL,NULL,NULL),(336,0,2,'Alternative Title',NULL,NULL,NULL),(337,0,2,'Alternative Title','Text  shown on landingpages and listpages.',NULL,NULL),(338,0,2,'Image','Image shown on landingpages and listpages.',NULL,NULL),(339,0,2,'Meta title',NULL,NULL,NULL),(340,0,2,'Meta description',NULL,NULL,NULL),(341,0,2,'Meta keywords',NULL,NULL,NULL),(342,0,2,'Name',NULL,NULL,NULL),(343,0,2,'Salutation','Salutation of the shop user',NULL,NULL),(344,0,2,'Customer number',NULL,NULL,NULL),(345,0,2,'Contact number',NULL,NULL,NULL),(346,0,2,'Customer profile data',NULL,NULL,NULL),(347,0,2,'Budget per order',NULL,NULL,NULL),(348,0,2,'Budget per month',NULL,NULL,NULL),(349,0,2,'Customer group',NULL,NULL,NULL),(350,0,2,'Customer has to pay VAT',NULL,NULL,NULL),(351,0,2,'Display VAT',NULL,NULL,NULL),(352,0,2,'Internal name',NULL,NULL,NULL),(353,0,2,'Identifier',NULL,NULL,NULL),(354,0,2,'Article selection',NULL,NULL,NULL),(355,0,2,'HTML',NULL,NULL,NULL),(356,0,2,'File','printable PDF file',NULL,NULL),(357,0,2,'Media','Images & Videos (for ContentPlugin)',NULL,NULL),(358,0,2,'Date',NULL,NULL,NULL),(359,0,2,'Alternative Title','For ContentPlugin',NULL,NULL),(360,0,2,'Alternative Intro','For ContentPlugin',NULL,NULL),(361,0,2,'Alternative Image','Image shown on landingpages and listpages. For ContentPlugin',NULL,NULL),(362,0,2,'Meta title',NULL,NULL,NULL),(363,0,2,'Meta description',NULL,NULL,NULL),(364,0,2,'Meta keywords',NULL,NULL,NULL),(365,0,2,'Title','',NULL,NULL),(366,0,2,'Photo','',NULL,NULL),(367,0,2,'Description','',NULL,NULL),(368,0,2,'Difficulty','','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezselection><options><option id=\"0\" name=\"Beginner\"/><option id=\"1\" name=\"Intermediate\"/><option id=\"2\" name=\"Advanced\"/></options></ezselection>\n',NULL),(369,0,2,'Starting Point','',NULL,NULL),(370,0,2,'Ending Point','',NULL,NULL),(371,0,2,'Length','',NULL,NULL),(372,0,2,'Author','',NULL,NULL),(373,0,2,'Title','',NULL,NULL),(374,0,2,'Description','',NULL,NULL),(375,0,2,'Photo','',NULL,NULL),(376,0,2,'Photo legend','',NULL,NULL),(377,0,2,'Place','',NULL,NULL);
/*!40000 ALTER TABLE `ezcontentclass_attribute_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_classgroup`
--

DROP TABLE IF EXISTS `ezcontentclass_classgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_classgroup` (
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `contentclass_version` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`contentclass_id`,`contentclass_version`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_classgroup`
--

LOCK TABLES `ezcontentclass_classgroup` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_classgroup` DISABLE KEYS */;
INSERT INTO `ezcontentclass_classgroup` VALUES (1,0,1,'Content'),(2,0,1,'Content'),(3,0,2,'Users'),(4,0,2,'Users'),(5,0,3,'Media'),(12,0,3,'Media'),(42,0,1,'Content'),(43,0,1,'Content'),(44,0,1,'Content'),(45,0,1,'Content'),(46,0,1,'Content'),(47,0,1,'Content'),(48,0,1,'Content'),(49,0,1,'Content'),(50,0,1,'Content'),(51,0,1,'Content'),(52,0,1,'Content'),(53,0,1,'Content'),(54,0,1,'Content'),(55,0,1,'Content'),(56,0,1,'Content'),(57,0,1,'Content'),(58,0,1,'Content'),(59,0,1,'Content'),(60,0,1,'Content');
/*!40000 ALTER TABLE `ezcontentclass_classgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_name`
--

DROP TABLE IF EXISTS `ezcontentclass_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_name` (
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `contentclass_version` int(11) NOT NULL DEFAULT 0,
  `language_id` bigint(20) NOT NULL DEFAULT 0,
  `language_locale` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`contentclass_id`,`contentclass_version`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_name`
--

LOCK TABLES `ezcontentclass_name` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_name` DISABLE KEYS */;
INSERT INTO `ezcontentclass_name` VALUES (1,0,2,'eng-GB','Folder'),(2,0,2,'eng-GB','Article'),(3,0,3,'eng-GB','User group'),(4,0,2,'eng-GB','User'),(5,0,3,'eng-GB','Image'),(12,0,3,'eng-GB','File'),(42,0,2,'eng-GB','Landing page'),(43,0,2,'eng-GB','Form'),(44,0,2,'eng-GB','Configuration'),(45,0,2,'eng-GB','Product category'),(46,0,2,'eng-GB','Product'),(47,0,2,'eng-GB','Product catalog'),(48,0,2,'eng-GB','Product type'),(49,0,2,'eng-GB','Feature link'),(50,0,2,'eng-GB','Textmodule'),(51,0,2,'eng-GB','Folder (Blog)'),(52,0,2,'eng-GB','Blog post'),(53,0,2,'eng-GB','Contact'),(54,0,2,'eng-GB','Event'),(55,0,2,'eng-GB','Folder (Contacts)'),(56,0,2,'eng-GB','Folder (Events)'),(57,0,2,'eng-GB','Folder (News)'),(58,0,2,'eng-GB','News'),(59,0,2,'eng-GB','Bike Ride'),(60,0,2,'eng-GB','Point of Interest');
/*!40000 ALTER TABLE `ezcontentclass_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclassgroup`
--

DROP TABLE IF EXISTS `ezcontentclassgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclassgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL DEFAULT 0,
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `modifier_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclassgroup`
--

LOCK TABLES `ezcontentclassgroup` WRITE;
/*!40000 ALTER TABLE `ezcontentclassgroup` DISABLE KEYS */;
INSERT INTO `ezcontentclassgroup` VALUES (1,1031216928,14,1033922106,14,'Content'),(2,1031216941,14,1033922113,14,'Users'),(3,1032009743,14,1033922120,14,'Media');
/*!40000 ALTER TABLE `ezcontentclassgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject`
--

DROP TABLE IF EXISTS `ezcontentobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `current_version` int(11) DEFAULT NULL,
  `initial_language_id` bigint(20) NOT NULL DEFAULT 0,
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 0,
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `section_id` int(11) NOT NULL DEFAULT 0,
  `status` int(11) DEFAULT 0,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcontentobject_remote_id` (`remote_id`),
  KEY `ezcontentobject_classid` (`contentclass_id`),
  KEY `ezcontentobject_lmask` (`language_mask`),
  KEY `ezcontentobject_pub` (`published`),
  KEY `ezcontentobject_section` (`section_id`),
  KEY `ezcontentobject_currentversion` (`current_version`),
  KEY `ezcontentobject_owner` (`owner_id`),
  KEY `ezcontentobject_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject`
--

LOCK TABLES `ezcontentobject` WRITE;
/*!40000 ALTER TABLE `ezcontentobject` DISABLE KEYS */;
INSERT INTO `ezcontentobject` VALUES (1,1,9,2,3,1448889046,'Ibexa Platform',14,1448889046,'9459d3c29e15006e45197295722c7ade',1,1,0),(4,3,1,2,3,1033917596,'Users',14,1033917596,'f5c88a2209584891056f987fd965b0ba',2,1,0),(10,4,2,2,3,1072180405,'Anonymous User',14,1033920665,'faaeb9be3bd98ed09f606fc16d144eca',2,1,0),(11,3,1,2,3,1033920746,'Guest accounts',14,1033920746,'5f7f0bdb3381d6a461d8c29ff53d908f',2,1,0),(12,3,1,2,3,1033920775,'Administrator users',14,1033920775,'9b47a45624b023b1a76c73b74d704acf',2,1,0),(13,3,1,2,3,1033920794,'Editors',14,1033920794,'3c160cca19fb135f83bd02d911f04db2',2,1,0),(14,4,3,2,3,1301062024,'Administrator User',14,1033920830,'1bb4fe25487f05527efa8bfd394cecc7',2,1,0),(41,1,1,2,3,1060695457,'Media',14,1060695457,'a6e35cbcb7cd6ae4b691f3eee30cd262',3,1,0),(42,3,1,2,3,1072180330,'Anonymous Users',14,1072180330,'15b256dbea2ae72418ff5facc999e8f9',2,1,0),(49,1,1,2,3,1080220197,'Images',14,1080220197,'e7ff633c6b8e0fd3531e74c6e712bead',3,1,0),(50,1,1,2,3,1080220220,'Files',14,1080220220,'732a5acd01b51a6fe6eab448ad4138a9',3,1,0),(51,1,1,2,3,1080220233,'Multimedia',14,1080220233,'09082deb98662a104f325aaa8c4933d3',3,1,0),(52,42,1,2,3,1442481743,'Ibexa Digital Experience Platform',14,1442481743,'34720ff636e1d4ce512f762dc638e4ac',1,1,0),(53,1,1,2,3,1486473151,'Form Uploads',14,1486473151,'6797ab09a3e84316f09c4ccabce90e2d',3,1,0),(54,1,1,2,2,1537166893,'Forms',14,1537166893,'9e863fbb0fb835ce050032b4f00de61d',6,1,0),(55,1,1,2,3,1586855342,'Site skeletons',14,1586855342,'1ac4a4b7108e607682beaba14ba860c5',7,1,0),(56,3,1,2,3,1611581046,'Shop users',14,1611581046,'f78dba52d7074fbc677ca5ec25978af5',2,1,0),(57,3,1,2,3,1611581046,'Private customers',14,1611581046,'332d3e04b2643c1c9981948e6ec7ae8d',2,1,0),(58,3,1,2,3,1611581046,'Business customers',14,1611581046,'c29c84da29000ebc6dc18b30dd2541d9',2,1,0),(59,1,1,2,3,1611581049,'Components',14,1611581049,'1e2ab6b25a789a2f663098fed2d49fb6',1,1,0),(60,44,1,2,2,1611581049,'silver-eshop',14,1611581049,'db265df68aea35ce54c8f4a94d5c0c34',1,1,0),(61,1,1,2,3,1611581049,'Textmodules',14,1611581049,'4d790006d652f3142615b3ab9054b5f6',1,1,0),(62,1,1,2,3,1611581049,'Basket',14,1611581049,'dd0b83ecbe5692d0933e63da23f40e62',1,1,0),(63,1,1,2,3,1611581049,'Checkout',14,1611581049,'f5327dd73dc954bee3919f1645466a60',1,1,0),(64,1,1,2,3,1611581049,'Contact',14,1611581049,'78ac71ad107473cbbce3d0c1b8b16692',1,1,0),(65,1,1,2,3,1611581049,'Customercenter',14,1611581049,'49b0449b8194e79eb5bf7eef44735637',1,1,0),(66,1,1,2,3,1611581049,'Email',14,1611581049,'37c1cb4b0386ceab8332d4dc2855433c',1,1,0),(67,1,1,2,3,1611581049,'Footer',14,1611581049,'167157508ff75abf23620c761fdf8f8c',1,1,0),(68,1,1,2,3,1611581049,'Forms',14,1611581049,'540eb8a090d92dab7552dcf7b025e03e',1,1,0),(69,1,1,2,3,1611581049,'Misc',14,1611581049,'6db7f8bf4eee108f649c311ed5244fff',1,1,0),(70,1,1,2,3,1611581049,'Orderhistory',14,1611581049,'f360f12a5276882d72c46be02730be91',1,1,0),(71,1,1,2,3,1611581049,'User',14,1611581049,'49b498864c1f551b04e99ede34e74a2b',1,1,0),(72,50,1,2,3,1611581049,'Introtext stored basket',14,1611581049,'afa05f3a2c0701aa4eac93c1f52e7ee2',1,1,0),(73,50,1,2,3,1611581049,'Introtext wishlist',14,1611581049,'23c72f1bcff15fc319ec6ce666776667',1,1,0),(74,50,1,2,3,1611581050,'Accept our Data protection and Cancellation policies',14,1611581050,'7a951fdc343b6a6bb1c1abc29ba4a4ac',1,1,0),(75,50,1,2,2,1611581050,'Data privay hint',14,1611581050,'e91ee562afd0c54871e46e8ea0534b98',1,1,0),(76,50,1,2,3,1611581050,'Success message - Cancellation',14,1611581050,'021e3a6c7cd73ed3be42730588345bab',1,1,0),(77,50,1,2,3,1611581050,'Introtext - Summary of order',14,1611581050,'80b2af642714416dfe9c0eb9754bd3df',1,1,0),(78,50,1,2,3,1611581050,'Terms&Conditions',14,1611581050,'1814c7dff5733ef41ceb26d6838af478',1,1,0),(79,50,1,2,3,1611581050,'Success message - Contact form',14,1611581050,'d9d4431867d21e73020d0a51b3333d6a',1,1,0),(80,50,1,2,3,1611581051,'Intro text - Contact form',14,1611581051,'365d8203c19f8a4b92f647adb10adb3a',1,1,0),(81,50,1,2,3,1611581051,'Appoval request entry page',14,1611581051,'e5b5243f031c3aa343f4783b018fa077',1,1,0),(82,50,1,2,3,1611581051,'Basket sent to approver',14,1611581051,'1a3e69cb5c92261a404d15fe8e9ec230',1,1,0),(83,50,1,2,3,1611581051,'Basket was send to approver info ',14,1611581051,'990d7e1a23d7b8d6f6599bf6bb41e8c2',1,1,0),(84,50,1,2,3,1611581051,'Buyer approval request entry page',14,1611581051,'99d5d34db707c2efd6b876bd1bc5c8d4',1,1,0),(85,50,1,2,3,1611581052,'Email request new user',14,1611581052,'ce4abad7746f9656eca736483fc5ebcf',1,1,0),(86,50,1,2,3,1611581052,'Success message edit user',14,1611581052,'b0b1dfa5d29f8e5bf2deda3dea546137',1,1,0),(87,50,1,2,3,1611581052,'Success message add erp user to the shop',14,1611581052,'91cc7fa550b99dd4f8da740c2ea0d88b',1,1,0),(88,50,1,2,3,1611581052,'Success message request new user',14,1611581052,'dbedd23e502c859f104b671f7f94c659',1,1,0),(89,50,1,2,3,1611581052,'Error message forms',14,1611581052,'1309b8016d6ba9b16a359daff5258f61',1,1,0),(90,50,1,2,3,1611581053,'Customercenter - Contacts from ERP',14,1611581053,'5273a4e51740f233b60f11874322f284',1,1,0),(91,50,1,2,3,1611581053,'Customercenter introtext',14,1611581053,'d5dbc2e2d3e8255656846afc20ead14c',1,1,0),(92,50,1,2,3,1611581053,'Request new user tooltip',14,1611581053,'b315f967bc404620a3f44f39b5d80d77',1,1,0),(93,50,1,2,2,1611581053,'Email cancellation policies',14,1611581053,'b16c14e8dc84d7df3a0304018950713d',1,1,0),(94,50,1,2,2,1611581054,'Email footer',14,1611581054,'6f155258f5a433cdb5b2b8426e3da6d5',1,1,0),(95,50,1,2,2,1611581054,'Email intro text Shop Owner',14,1611581054,'ded763078a1b5d86f2cd3e1aaefd9334',1,1,0),(96,50,1,2,3,1611581054,'Email header address invoice text',14,1611581054,'85465e9b4af755260079324a10b21aff',1,1,0),(97,50,1,2,3,1611581054,'Email payment method invoice text',14,1611581054,'2772ded671f4a5278f0e6bd9fa2bd60d',1,1,0),(98,50,1,2,3,1611581054,'Email invoice left footer',14,1611581054,'2da48d122512cfeb0be786c745f723fc',1,1,0),(99,50,1,2,3,1611581055,'Email invoice right footer',14,1611581055,'c9a6a094361ac03503c6319b4eb050d8',1,1,0),(100,50,1,2,3,1611581055,'Introduction text newsletter',14,1611581055,'0fc5dc10344ca311b693aac401004595',1,1,0),(101,50,1,2,3,1611581055,'Footer address',14,1611581055,'a3966e6a4d7aa01be4023fe66980ca3f',1,1,0),(102,50,1,2,3,1611581055,'Footer block company',14,1611581055,'8b21d23781aa9013b27fd76124114892',1,1,0),(103,50,1,2,3,1611581055,'Footer block ordering',14,1611581055,'86c0196b150f519480075364b4c972a4',1,1,0),(104,50,1,2,3,1611581056,'Footer block service',14,1611581056,'56bc538f1b69814a910d06e0d492484d',1,1,0),(105,50,1,2,2,1611581056,'Quickorder Introtext',14,1611581056,'9b03e95f822f04a504e58637855eabac',1,1,0),(106,50,1,2,3,1611581056,'404 Page',14,1611581056,'31d6414e0562dbb86bcf29535ae23e63',1,1,0),(107,50,1,2,3,1611581056,'Access denied',14,1611581056,'0e24f016161b93d399c7ce7376b49d9b',1,1,0),(108,50,1,2,3,1611581057,'Introtext orderhistory',14,1611581057,'4fd4f5cfdbadb0f9f19527483e036ffa',1,1,0),(109,50,1,2,3,1611581057,'Back to catalog',14,1611581057,'5f73a64466ecd0befb98c08c1dcd240f',1,1,0),(110,50,1,2,2,1611581057,'Click here to register new user',14,1611581057,'bd83638995f5e85e66a103835bf28006',1,1,0),(111,50,1,2,3,1611581057,'Success message password change',14,1611581057,'4107f4f021ed7cba5dffcf9170d157e3',1,1,0),(112,50,1,2,3,1611581057,'Success message for password request',14,1611581057,'ab8de9ad2d7748dede565371b4184bd9',1,1,0),(113,50,1,2,3,1611581058,'Error message password change',14,1611581058,'ebf1cd7782d8a3911df5a4873697d0cd',1,1,0),(114,50,1,2,3,1611581058,'Error message for password reminder',14,1611581058,'290805deda6a53ef42b1e11f57362292',1,1,0),(115,50,1,2,3,1611581058,'Intro text Edit Buyer',14,1611581058,'45a4d956ff6abee791f01c0556b88d66',1,1,0),(116,50,1,2,3,1611581058,'Intro text edit My Account',14,1611581058,'85444fc0d0eea3bfb264a0efddf7bd1b',1,1,0),(117,50,1,2,3,1611581058,'My profile information intro text',14,1611581058,'3d6ddb5b7c76b82023cfc38cd0fe08b8',1,1,0),(118,50,1,2,3,1611581059,'Registration error message',14,1611581059,'4af8ced259febe5640a626de124d7642',1,1,0),(119,50,1,2,3,1611581059,'Success message activate business customer',14,1611581059,'62996e6c981caed1d0a679e4aa87b590',1,1,0),(120,50,1,2,3,1611581059,'Success message Edit Buyer',14,1611581059,'ddb253dce09887112ab21a8fa51db280',1,1,0),(121,50,1,2,3,1611581059,'Success message edit invoice',14,1611581059,'aafd4bbe00d60444bb2631aee4169a74',1,1,0),(122,50,1,2,3,1611581059,'Success message Edit MyAccount',14,1611581059,'e6ed367a3fb48ad0ac147ea2f4c03481',1,1,0),(123,50,1,2,3,1611581060,'Success message registration business customer',14,1611581060,'ca324a9d84740de542dbf3eaa4ca711f',1,1,0),(124,50,1,2,3,1611581060,'Success message registration private customer',14,1611581060,'811678760397351b225b373ad12ac7b9',1,1,0),(125,47,3,2,2,1611581063,'Product Catalog',14,1611581061,'e70984b872149f0085f1ac2bfc6b6439',1,1,0),(126,2,1,2,2,1611581061,'Terms & Conditions',14,1611581061,'2074c7670d3d19376d1865c25b97339d',1,1,0),(127,2,1,2,2,1611581062,'Data & privacy regulations',14,1611581062,'6aa6b7ab0d51e4ad99c9c88e57def865',1,1,0),(128,2,1,2,2,1611581062,'Cancellation policies',14,1611581062,'0df8bf5df41651b407514a121f0fe585',1,1,0),(129,1,1,2,3,1611589692,'All Rides',14,1611589692,'d92892d45fddc83d27925faf9fe1c70a',1,1,0),(130,1,1,2,3,1611589692,'Points of Interest',14,1611589692,'06c8db392761260d3830d2ecf2d81d9e',1,1,0),(131,59,1,2,3,1611589692,'Finnish coastline from Rauma to Pori',14,1611589692,'cbf3755d8ecce83b1e307632094795b0',1,1,0),(132,59,1,2,3,1611589692,'Baby tour of the Battenkill',14,1611589692,'9d41c35658502b498b7bac700b3f6294',1,1,0),(133,59,1,2,3,1611589693,'Meillonnas terrain track',14,1611589693,'d65cfb06a8e89654aac9d789c7c028d1',1,1,0),(134,59,1,2,3,1611589693,'Rallarvegen in Norway',14,1611589693,'32485de9edb3b92207b3c2d56a0b8fdc',1,1,0),(135,59,1,2,3,1611589693,'Lookouts between Coligny and Montagna-le-Reconduit',14,1611589693,'a6b75e9cde416559229aa4ec92473c6a',1,1,0),(136,60,1,2,3,1611589694,'Cross above Tarcia',14,1611589694,'e2bcafb91f8a40bd170780734a9e177b',1,1,0),(137,60,1,2,3,1611589694,'Plateau de Vergongeat',14,1611589694,'91b10e537d31e0213e29ebb7cf0e2082',1,1,0);
/*!40000 ALTER TABLE `ezcontentobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_attribute`
--

DROP TABLE IF EXISTS `ezcontentobject_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL DEFAULT 0,
  `attribute_original_id` int(11) DEFAULT 0,
  `contentclassattribute_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `data_float` double DEFAULT NULL,
  `data_int` int(11) DEFAULT NULL,
  `data_text` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data_type_string` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `language_code` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_id` bigint(20) NOT NULL DEFAULT 0,
  `sort_key_int` int(11) NOT NULL DEFAULT 0,
  `sort_key_string` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentobject_attribute_co_id_ver_lang_code` (`contentobject_id`,`version`,`language_code`),
  KEY `ezcontentobject_classattr_id` (`contentclassattribute_id`),
  KEY `sort_key_string` (`sort_key_string`(191)),
  KEY `ezcontentobject_attribute_language_code` (`language_code`),
  KEY `sort_key_int` (`sort_key_int`)
) ENGINE=InnoDB AUTO_INCREMENT=667 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_attribute`
--

LOCK TABLES `ezcontentobject_attribute` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_attribute` DISABLE KEYS */;
INSERT INTO `ezcontentobject_attribute` VALUES (1,9,0,4,1,NULL,NULL,'Ibexa Platform','ezstring','eng-GB',3,0,'ibexa platform'),(2,9,0,119,1,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?><section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para><emphasis role=\"strong\">You are now ready to start your project.</emphasis></para></section>','ezrichtext','eng-GB',3,0,''),(7,1,0,7,4,NULL,NULL,'Main group','ezstring','eng-GB',3,0,''),(8,1,0,6,4,NULL,NULL,'Users','ezstring','eng-GB',3,0,''),(19,2,0,8,10,0,0,'Anonymous','ezstring','eng-GB',3,0,'anonymous'),(20,2,0,9,10,0,0,'User','ezstring','eng-GB',3,0,'user'),(21,2,0,12,10,0,0,'','ezuser','eng-GB',3,0,''),(22,1,0,6,11,0,0,'Guest accounts','ezstring','eng-GB',3,0,''),(23,1,0,7,11,0,0,'','ezstring','eng-GB',3,0,''),(24,1,0,6,12,0,0,'Administrator users','ezstring','eng-GB',3,0,''),(25,1,0,7,12,0,0,'','ezstring','eng-GB',3,0,''),(26,1,0,6,13,0,0,'Editors','ezstring','eng-GB',3,0,''),(27,1,0,7,13,0,0,'','ezstring','eng-GB',3,0,''),(28,3,0,8,14,0,0,'Administrator','ezstring','eng-GB',3,0,'administrator'),(29,3,0,9,14,0,0,'User','ezstring','eng-GB',3,0,'user'),(30,3,30,12,14,0,0,'','ezuser','eng-GB',3,0,''),(98,1,0,4,41,0,0,'Media','ezstring','eng-GB',3,0,''),(99,1,0,119,41,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(100,1,0,6,42,0,0,'Anonymous Users','ezstring','eng-GB',3,0,'anonymous users'),(101,1,0,7,42,0,0,'User group for the anonymous user','ezstring','eng-GB',3,0,'user group for the anonymous user'),(102,9,0,155,1,NULL,NULL,'Ibexa Platform','ezstring','eng-GB',3,0,'ibexa platform'),(103,1,0,155,41,0,0,'','ezstring','eng-GB',3,0,''),(104,9,0,156,1,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?><section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>This is the clean installation coming with Ibexa Platform.</para><para>It\'s a bare-bones setup of the Platform, an excellent foundation to build upon if you want to start your project from scratch.</para></section>','ezrichtext','eng-GB',3,0,''),(105,1,0,156,41,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(142,1,0,4,49,0,0,'Images','ezstring','eng-GB',3,0,'images'),(143,1,0,155,49,0,0,'','ezstring','eng-GB',3,0,''),(144,1,0,119,49,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(145,1,0,156,49,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(147,1,0,4,50,0,0,'Files','ezstring','eng-GB',3,0,'files'),(148,1,0,155,50,0,0,'','ezstring','eng-GB',3,0,''),(149,1,0,119,50,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(150,1,0,156,50,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(152,1,0,4,51,0,0,'Multimedia','ezstring','eng-GB',3,0,'multimedia'),(153,1,0,155,51,0,0,'','ezstring','eng-GB',3,0,''),(154,1,0,119,51,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(155,1,0,156,51,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(177,2,0,179,10,0,0,'','eztext','eng-GB',3,0,''),(178,3,0,179,14,0,0,'','eztext','eng-GB',3,0,''),(179,2,0,180,10,0,0,'','ezimage','eng-GB',3,0,''),(180,3,0,180,14,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"\" filename=\"\" suffix=\"\" basename=\"\" dirpath=\"\" url=\"\" original_filename=\"\" mime_type=\"\" width=\"\" height=\"\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1301057722\"><original attribute_id=\"180\" attribute_version=\"3\" attribute_language=\"eng-GB\"/></ezimage>\n','ezimage','eng-GB',3,0,''),(242,1,0,185,52,NULL,NULL,'Ibexa Digital Experience Platform','ezstring','eng-GB',3,0,'ibexa digital experience platform'),(243,1,0,186,52,NULL,NULL,'You are now ready to start your project.','ezstring','eng-GB',3,0,'you are now ready to start your project.'),(244,1,0,187,52,NULL,NULL,NULL,'ezlandingpage','eng-GB',3,0,'ibexa digital experience platform'),(245,1,0,4,53,NULL,NULL,'Form Uploads','ezstring','eng-GB',3,0,'form uploads'),(246,1,0,155,53,NULL,NULL,'form uploads','ezstring','eng-GB',3,0,'form uploads'),(247,1,0,119,53,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>Folder for file uploads</para></section>\n','ezrichtext','eng-GB',3,0,''),(248,1,0,156,53,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(249,1,0,4,54,NULL,NULL,'Forms','ezstring','eng-GB',2,0,'forms'),(250,1,0,155,54,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(251,1,0,119,54,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,''),(252,1,0,156,54,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,''),(253,1,0,4,55,NULL,NULL,'Site skeletons','ezstring','eng-GB',3,0,'site skeletons'),(254,1,0,155,55,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(255,1,0,119,55,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(256,1,0,156,55,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(257,1,0,6,56,NULL,NULL,'Shop users','ezstring','eng-GB',3,0,'shop users'),(258,1,0,7,56,NULL,NULL,'Shop users','ezstring','eng-GB',3,0,'shop users'),(259,1,0,6,57,NULL,NULL,'Private customers','ezstring','eng-GB',3,0,'private customers'),(260,1,0,7,57,NULL,NULL,'User group for private customers','ezstring','eng-GB',3,0,'user group for private customers'),(261,1,0,6,58,NULL,NULL,'Business customers','ezstring','eng-GB',3,0,'business customers'),(262,1,0,7,58,NULL,NULL,'User group for business customers','ezstring','eng-GB',3,0,'user group for business customers'),(263,2,0,342,10,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(264,2,0,343,10,NULL,NULL,NULL,'sesselection','eng-GB',3,0,''),(265,2,0,344,10,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(266,2,0,345,10,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(267,2,0,346,10,NULL,NULL,NULL,'sesprofiledata','eng-GB',3,0,''),(268,2,0,347,10,NULL,NULL,NULL,'ezfloat','eng-GB',3,0,'0'),(269,2,0,348,10,NULL,NULL,NULL,'ezfloat','eng-GB',3,0,'0'),(270,2,0,349,10,NULL,NULL,NULL,'sesselection','eng-GB',3,0,''),(271,2,0,350,10,NULL,1,NULL,'ezboolean','eng-GB',3,1,''),(272,2,0,351,10,NULL,1,NULL,'ezboolean','eng-GB',3,1,''),(273,3,0,342,14,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(274,3,0,343,14,NULL,NULL,NULL,'sesselection','eng-GB',3,0,''),(275,3,0,344,14,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(276,3,0,345,14,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(277,3,0,346,14,NULL,NULL,NULL,'sesprofiledata','eng-GB',3,0,''),(278,3,0,347,14,NULL,NULL,NULL,'ezfloat','eng-GB',3,0,'0'),(279,3,0,348,14,NULL,NULL,NULL,'ezfloat','eng-GB',3,0,'0'),(280,3,0,349,14,NULL,NULL,NULL,'sesselection','eng-GB',3,0,''),(281,3,0,350,14,NULL,1,NULL,'ezboolean','eng-GB',3,1,''),(282,3,0,351,14,NULL,1,NULL,'ezboolean','eng-GB',3,1,''),(283,1,0,4,59,NULL,NULL,'Components','ezstring','eng-GB',3,0,'components'),(284,1,0,155,59,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(285,1,0,119,59,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(286,1,0,156,59,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(287,1,0,190,60,NULL,NULL,'silver-eshop','ezstring','eng-GB',2,0,'silver-eshop'),(288,1,0,191,60,NULL,NULL,'siso_core.default.category_view: product_list\nsilver_eshop.default.last_viewed_products_in_session_limit: 10\nsilver_eshop.default.catalog_description_limit: 50\nsiso_core.default.currency_rate_changed_at: 01.01.2018\nsiso_core.default.automatic_currency_conversion: true\nsiso_core.default.currency_list:\n    EUR: \'1\'\n    USD: \'1.23625\'\n    GBP: \'0.86466\'\n    CAD: \'1.55686\'\nsiso_core.default.standard_price_factory.fallback_currency: EUR\nsiso_core.default.standard_price_factory.base_currency: EUR\nsiso_price.default.price_service_chain.product_list:\n    - siso_price.price_provider.shop\nsiso_price.default.price_service_chain.product_detail:\n    - siso_price.price_provider.shop\n    - siso_price.price_provider.shop\nsiso_price.default.price_service_chain.slider_product_list:\n    - siso_price.price_provider.shop\nsiso_price.default.price_service_chain.basket:\n    - siso_price.price_provider.shop\n    - siso_price.price_provider.shop\nsiso_price.default.price_service_chain.basket_variant:\n    - siso_price.price_provider.shop\n    - siso_price.price_provider.shop\nsiso_price.default.price_service_chain.stored_basket:\n    - siso_price.price_provider.shop\nsiso_price.default.price_service_chain.wish_list:\n    - siso_price.price_provider.shop\nsiso_price.default.price_service_chain.quick_order:\n    - siso_price.price_provider.shop\n    - siso_price.price_provider.shop\nsiso_price.default.price_service_chain.quick_order_line_preview:\n    - siso_price.price_provider.shop\nsiso_price.default.price_service_chain.comparison:\n    - siso_price.price_provider.shop\nsiso_price.default.price_service_chain.search_list:\n    - siso_price.price_provider.shop\nsiso_price.default.price_service_chain.bestseller_list:\n    - siso_price.price_provider.shop\nsiso_core.default.marketing.olark_chat.activated: false\nsiso_core.default.marketing.olark_chat.id: 6295-386-10-7457\nsiso_basket.default.discontinued_products_listener_active: true\nsiso_basket.default.discontinued_products_listener_consider_packaging_unit: true\nsiso_checkout.default.order_confirmation.sales_email_address: \'\'\nsiso_newsletter.default.newsletter_active: false\nsiso_newsletter.default.unsubscribe_globally: true\nsiso_newsletter.default.display_newsletter_box_for_logged_in_users: true\nsiso_newsletter.default.newsletter2go_username: \'\'\nsiso_newsletter.default.newsletter2go_password: \'\'\nsiso_newsletter.default.newsletter2go_auth_key: \'\'\nses_basket.default.validHours: 120\nses_basket.default.refreshCatalogElementAfter: \'1 hours\'\nses_basket.default.stock_in_column: true\nses_basket.default.description_limit: 50\nses_basket.default.additional_text_for_basket_line: false\nses_basket.default.additional_text_for_basket_line_input_limit: 30\nses_stored_basket.default.stock_in_column: true\nses_stored_basket.default.description_limit: 50\nses_wishlist.default.description_limit: 50\nsiso_core.default.template_debitor_country: DE\nsiso_core.default.enable_customer_number_login: false\nsiso_core.default.use_template_debitor_customer_number: true\nsiso_core.default.use_template_debitor_contact_number: false\nsiso_core.default.price_requests_without_customer_number: true\nses_basket.default.recalculatePricesAfter: \'3 hours\'\nsilver_eshop.default.erp.variant_handling: SKU_ONLY\nsiso_erp.default.web_connector.service_location: \'http://webconnproxy.silver-eshop.de?config=harmony_wc3_noop_mapping\'\nsilver_eshop.default.webconnector.username: admin\nsilver_eshop.default.webconnector.password: passwo\nsilver_eshop.default.webconnector.soapTimeout: 5\nsilver_eshop.default.webconnector.erpTimeout: 5\nsiso_core.default.bestseller_limit_on_bestseller_page: 6\nsiso_core.default.bestseller_limit_on_catalog_page: 6\nsiso_core.default.bestseller_limit_in_silver_module: 6\nsiso_core.default.bestseller_threshold: 1\nsiso_checkout.default.payment_method.paypal_express_checkout: true\nsiso_checkout.default.payment_method.invoice: true\nsiso_checkout.default.shipping_method.standard: true\nsiso_checkout.default.shipping_method.express_delivery: false\nsiso_local_order_management.default.shipping_cost: \'\'\nsiso_local_order_management.default.shipping_free: \'\'\nsiso_core.default.shipping_vat_code: \'19\'\nsiso_core.en.standard_price_factory.fallback_currency: EUR\nsiso_checkout.en.payment_method.paypal_express_checkout: true\nsiso_checkout.en.payment_method.invoice: true\nsiso_checkout.en.shipping_method.standard: true\nsiso_checkout.en.shipping_method.express_delivery: true\nsiso_core.de.standard_price_factory.fallback_currency: EUR\nsiso_checkout.de.payment_method.paypal_express_checkout: true\nsiso_checkout.de.payment_method.invoice: true\nsiso_checkout.de.shipping_method.standard: true\nsiso_checkout.de.shipping_method.express_delivery: true\n','eztext','eng-GB',2,0,'siso_core.default.category_view: product_list'),(289,1,0,4,61,NULL,NULL,'Textmodules','ezstring','eng-GB',3,0,'textmodules'),(290,1,0,155,61,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(291,1,0,119,61,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(292,1,0,156,61,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(293,1,0,4,62,NULL,NULL,'Basket','ezstring','eng-GB',3,0,'basket'),(294,1,0,155,62,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(295,1,0,119,62,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(296,1,0,156,62,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(297,1,0,4,63,NULL,NULL,'Checkout','ezstring','eng-GB',3,0,'checkout'),(298,1,0,155,63,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(299,1,0,119,63,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(300,1,0,156,63,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(301,1,0,4,64,NULL,NULL,'Contact','ezstring','eng-GB',3,0,'contact'),(302,1,0,155,64,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(303,1,0,119,64,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(304,1,0,156,64,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(305,1,0,4,65,NULL,NULL,'Customercenter','ezstring','eng-GB',3,0,'customercenter'),(306,1,0,155,65,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(307,1,0,119,65,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(308,1,0,156,65,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(309,1,0,4,66,NULL,NULL,'Email','ezstring','eng-GB',3,0,'email'),(310,1,0,155,66,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(311,1,0,119,66,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(312,1,0,156,66,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(313,1,0,4,67,NULL,NULL,'Footer','ezstring','eng-GB',3,0,'footer'),(314,1,0,155,67,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(315,1,0,119,67,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(316,1,0,156,67,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(317,1,0,4,68,NULL,NULL,'Forms','ezstring','eng-GB',3,0,'forms'),(318,1,0,155,68,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(319,1,0,119,68,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(320,1,0,156,68,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(321,1,0,4,69,NULL,NULL,'Misc','ezstring','eng-GB',3,0,'misc'),(322,1,0,155,69,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(323,1,0,119,69,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(324,1,0,156,69,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(325,1,0,4,70,NULL,NULL,'Orderhistory','ezstring','eng-GB',3,0,'orderhistory'),(326,1,0,155,70,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(327,1,0,119,70,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(328,1,0,156,70,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(329,1,0,4,71,NULL,NULL,'User','ezstring','eng-GB',3,0,'user'),(330,1,0,155,71,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(331,1,0,119,71,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(332,1,0,156,71,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(333,1,0,243,72,NULL,NULL,'Introtext stored basket','ezstring','eng-GB',3,0,'introtext stored basket'),(334,1,0,244,72,NULL,NULL,'wishlist_stored_basket_intro_text','ezstring','eng-GB',3,0,'wishlist_stored_basket_intro_text'),(335,1,0,245,72,NULL,NULL,'storedBasket','ezstring','eng-GB',3,0,'storedbasket'),(336,1,0,246,72,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">You can remove or update products and add one or more products to the basket.</para>\n        <para ezxhtml:class=\"paraClass\">We have recalculated prices and stock information for your stored basket. Price or stock information may have changed.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'You can remove or update products and add one or more products to the basket.'),(337,1,0,243,73,NULL,NULL,'Introtext wishlist','ezstring','eng-GB',3,0,'introtext wishlist'),(338,1,0,244,73,NULL,NULL,'wishlist_stored_basket_intro_text','ezstring','eng-GB',3,0,'wishlist_stored_basket_intro_text'),(339,1,0,245,73,NULL,NULL,'wishList','ezstring','eng-GB',3,0,'wishlist'),(340,1,0,246,73,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Use the wishlist to store items for later.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Use the wishlist to store items for later.'),(341,1,0,243,74,NULL,NULL,'Accept our Data protection and Cancellation policies','ezstring','eng-GB',3,0,'accept our data protection and cancellation policies'),(342,1,0,244,74,NULL,NULL,'label.accept_cancellation_policies','ezstring','eng-GB',3,0,'label.accept_cancellation_policies'),(343,1,0,245,74,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(344,1,0,246,74,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Please accept our <link xlink:href=\"ezurl://1\" xlink:show=\"none\" xlink:title=\"\">Cancellation policies</link>.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Please accept our Cancellation policies.'),(345,1,0,243,75,NULL,NULL,'Data privay hint','ezstring','eng-GB',2,0,'data privay hint'),(346,1,0,244,75,NULL,NULL,'data_privacy_hint','ezstring','eng-GB',2,0,'data_privacy_hint'),(347,1,0,245,75,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(348,1,0,246,75,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para>By placing your order you agree to our <link xlink:href=\"ezurl://2\" xlink:show=\"none\" xlink:title=\"\">data &amp; privacy regulations</link>.</para>\n</section>\n','ezrichtext','eng-GB',2,0,'By placing your order you agree to our data & privacy regulations.'),(349,1,0,243,76,NULL,NULL,'Success message - Cancellation','ezstring','eng-GB',3,0,'success message - cancellation'),(350,1,0,244,76,NULL,NULL,'common.success_cancellation','ezstring','eng-GB',3,0,'common.success_cancellation'),(351,1,0,245,76,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(352,1,0,246,76,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Thank you for submitting this form.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Thank you for submitting this form.'),(353,1,0,243,77,NULL,NULL,'Introtext - Summary of order','ezstring','eng-GB',3,0,'introtext - summary of order'),(354,1,0,244,77,NULL,NULL,'introtext_order_summary','ezstring','eng-GB',3,0,'introtext_order_summary'),(355,1,0,245,77,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(356,1,0,246,77,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">\n            This is a summary of your order. If you have chosen an electronic payment method you will be redirected to the payment provider after clicking on the order button.\n        </para>\n</section>\n','ezrichtext','eng-GB',3,0,'This is a summary of your order. If you have chosen an electronic payment method you will be redirected to the payment provider after clicking on the order button.'),(357,1,0,243,78,NULL,NULL,'Terms&Conditions','ezstring','eng-GB',3,0,'terms&conditions'),(358,1,0,244,78,NULL,NULL,'terms_conditions','ezstring','eng-GB',3,0,'terms_conditions'),(359,1,0,245,78,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(360,1,0,246,78,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Please accept our <link xlink:href=\"ezurl://3\" xlink:show=\"none\" xlink:title=\"\">Terms&amp;Conditions</link>.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Please accept our Terms&Conditions.'),(361,1,0,243,79,NULL,NULL,'Success message - Contact form','ezstring','eng-GB',3,0,'success message - contact form'),(362,1,0,244,79,NULL,NULL,'success_contact','ezstring','eng-GB',3,0,'success_contact'),(363,1,0,245,79,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(364,1,0,246,79,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">\n            Thank you very much for your request. We will come back as soon as possible.\n        </para>\n</section>\n','ezrichtext','eng-GB',3,0,'Thank you very much for your request. We will come back as soon as possible.'),(365,1,0,243,80,NULL,NULL,'Intro text - Contact form','ezstring','eng-GB',3,0,'intro text - contact form'),(366,1,0,244,80,NULL,NULL,'contact_intro_text','ezstring','eng-GB',3,0,'contact_intro_text'),(367,1,0,245,80,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(368,1,0,246,80,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">\n            Please let us a message. We will take care as soon as possible.\n        </para>\n</section>\n','ezrichtext','eng-GB',3,0,'Please let us a message. We will take care as soon as possible.'),(369,1,0,243,81,NULL,NULL,'Appoval request entry page','ezstring','eng-GB',3,0,'appoval request entry page'),(370,1,0,244,81,NULL,NULL,'approver_entry_page_intro_text','ezstring','eng-GB',3,0,'approver_entry_page_intro_text'),(371,1,0,245,81,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(372,1,0,246,81,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Here you can see a list of baskets that are waiting for approval.</para>\n        <para ezxhtml:class=\"paraClass\">You can</para>\n        <itemizedlist>\n            <listitem>\n                <para>approve an order (the buyer will get an email as well). You can change products or the delivery address for this order if required.</para>\n            </listitem>\n            <listitem>\n                <para>reject the order and add a comment for the buyer</para>\n            </listitem>\n        </itemizedlist>\n        <para ezxhtml:class=\"paraClass\">If you want to approve an order, make sure that you don\'t have an active basket. Either order or remove it.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Here you can see a list of baskets that are waiting for approval.'),(373,1,0,243,82,NULL,NULL,'Basket sent to approver','ezstring','eng-GB',3,0,'basket sent to approver'),(374,1,0,244,82,NULL,NULL,'basket_send_to_approver_success_message','ezstring','eng-GB',3,0,'basket_send_to_approver_success_message'),(375,1,0,245,82,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(376,1,0,246,82,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Your basket is now in the approval process. All approvers were informed. You will be informed immediately when your basket is ordered or rejected.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Your basket is now in the approval process. All approvers were informed. You will be informed immediately when your basket is ordered or rejected.'),(377,1,0,243,83,NULL,NULL,'Basket was send to approver info ','ezstring','eng-GB',3,0,'basket was send to approver info '),(378,1,0,244,83,NULL,NULL,'basket_send_to_approver_info_message','ezstring','eng-GB',3,0,'basket_send_to_approver_info_message'),(379,1,0,245,83,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(380,1,0,246,83,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Please wait until your order has been approved. You will get a message when your order is approved.</para>\n        <para ezxhtml:class=\"paraClass\">You will also receive an email, if your order is rejected.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Please wait until your order has been approved. You will get a message when your order is approved.'),(381,1,0,243,84,NULL,NULL,'Buyer approval request entry page','ezstring','eng-GB',3,0,'buyer approval request entry page'),(382,1,0,244,84,NULL,NULL,'buyer_entry_page_intro_text','ezstring','eng-GB',3,0,'buyer_entry_page_intro_text'),(383,1,0,245,84,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(384,1,0,246,84,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Here you can find a list of your approval requests</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Here you can find a list of your approval requests'),(385,1,0,243,85,NULL,NULL,'Email request new user','ezstring','eng-GB',3,0,'email request new user'),(386,1,0,244,85,NULL,NULL,'customercenter_new_user_created_email','ezstring','eng-GB',3,0,'customercenter_new_user_created_email'),(387,1,0,245,85,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(388,1,0,246,85,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">The main contact has created a shop account for you. You can log in with your new login data. For security reasons we recommend you to change your password.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'The main contact has created a shop account for you. You can log in with your new login data. For security reasons we recommend you to change your password.'),(389,1,0,243,86,NULL,NULL,'Success message edit user','ezstring','eng-GB',3,0,'success message edit user'),(390,1,0,244,86,NULL,NULL,'success_message_customer_center_edit_user','ezstring','eng-GB',3,0,'success_message_customer_center_edit_user'),(391,1,0,245,86,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(392,1,0,246,86,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">The user data was successfully updated.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'The user data was successfully updated.'),(393,1,0,243,87,NULL,NULL,'Success message add erp user to the shop','ezstring','eng-GB',3,0,'success message add erp user to the shop'),(394,1,0,244,87,NULL,NULL,'success_message_customer_center_add_user','ezstring','eng-GB',3,0,'success_message_customer_center_add_user'),(395,1,0,245,87,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(396,1,0,246,87,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Benutzer wurde erfolgreich in den Shop hinzugef&#xFC;gt. Eine Email mit seinen Login-Daten wurde an ihn versendet.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Benutzer wurde erfolgreich in den Shop hinzugefügt. Eine Email mit seinen Login-Daten wurde an ihn versendet.'),(397,1,0,243,88,NULL,NULL,'Success message request new user','ezstring','eng-GB',3,0,'success message request new user'),(398,1,0,244,88,NULL,NULL,'success_message_customer_center_request_user','ezstring','eng-GB',3,0,'success_message_customer_center_request_user'),(399,1,0,245,88,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(400,1,0,246,88,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Ein neuer Benutzer wurde erfolgreich angelegt. Eine Email mit seinen Login-Daten wurde an ihn versendet.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Ein neuer Benutzer wurde erfolgreich angelegt. Eine Email mit seinen Login-Daten wurde an ihn versendet.'),(401,1,0,243,89,NULL,NULL,'Error message forms','ezstring','eng-GB',3,0,'error message forms'),(402,1,0,244,89,NULL,NULL,'error_message_customer_center_forms','ezstring','eng-GB',3,0,'error_message_customer_center_forms'),(403,1,0,245,89,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(404,1,0,246,89,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Es sind Fehler aufgetreten. Bitte pr&#xFC;fen Sie oballe Pflicht-Felder ausgef&#xFC;llt sind,f&#xFC;r diese E-Mail Adresse ggf. bereits ein Benutzer im Shop angelegt wurde undmindestens eine Rolle aktiviert wurde.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Es sind Fehler aufgetreten. Bitte prüfen Sie oballe Pflicht-Felder ausgefüllt sind,für diese E-Mail Adresse ggf. bereits ein Benutzer im Shop angelegt wurde undmindestens eine Rolle aktiviert wurde.'),(405,1,0,243,90,NULL,NULL,'Customercenter - Contacts from ERP','ezstring','eng-GB',3,0,'customercenter - contacts from erp'),(406,1,0,244,90,NULL,NULL,'customer_center_entry_page_erp_users_intro','ezstring','eng-GB',3,0,'customer_center_entry_page_erp_users_intro'),(407,1,0,245,90,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(408,1,0,246,90,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Folgende Mitarbeiter sind uns bereits bekannt aber sie haben noch keinen Shop-Account. Sie k&#xF6;nnen Mitarbeiter hier direkt aktivieren.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Folgende Mitarbeiter sind uns bereits bekannt aber sie haben noch keinen Shop-Account. Sie können Mitarbeiter hier direkt aktivieren.'),(409,1,0,243,91,NULL,NULL,'Customercenter introtext','ezstring','eng-GB',3,0,'customercenter introtext'),(410,1,0,244,91,NULL,NULL,'customer_center_entry_page_shop_users_intro','ezstring','eng-GB',3,0,'customer_center_entry_page_shop_users_intro'),(411,1,0,245,91,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(412,1,0,246,91,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">\n            The customercenter allows to maintain shop accounts for your employees. You can:Change the rights for an userDeactivate an userChange a users settingsYou can also create new shop accounts. \\_\n        </para>\n</section>\n','ezrichtext','eng-GB',3,0,'The customercenter allows to maintain shop accounts for your employees. You can:Change the rights for an userDeactivate an userChange a users settingsYou can also create new shop accounts. \\_'),(413,1,0,243,92,NULL,NULL,'Request new user tooltip','ezstring','eng-GB',3,0,'request new user tooltip'),(414,1,0,244,92,NULL,NULL,'customer_center_request_new_user_tooltip','ezstring','eng-GB',3,0,'customer_center_request_new_user_tooltip'),(415,1,0,245,92,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(416,1,0,246,92,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Hier k&#xF6;nnen Sie neue Benutzer in Shop anlegen.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Hier können Sie neue Benutzer in Shop anlegen.'),(417,1,0,243,93,NULL,NULL,'Email cancellation policies','ezstring','eng-GB',2,0,'email cancellation policies'),(418,1,0,244,93,NULL,NULL,'email_cancelation_policies','ezstring','eng-GB',2,0,'email_cancelation_policies'),(419,1,0,245,93,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(420,1,0,246,93,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para><link xlink:href=\"ezurl://1\" xlink:show=\"none\">Cancellation policy</link></para>\n</section>\n','ezrichtext','eng-GB',2,0,'Cancellation policy'),(421,1,0,243,94,NULL,NULL,'Email footer','ezstring','eng-GB',2,0,'email footer'),(422,1,0,244,94,NULL,NULL,'email_footer','ezstring','eng-GB',2,0,'email_footer'),(423,1,0,245,94,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(424,1,0,246,94,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para>\n<literallayout class=\"normal\">Best regards \\_ -- -- -- -- -- -- -- -- -- -- -- -- -- -- \\_ Ibexa AS Solligata 2 0254 OSLO Norway Phone: +47 35 58 70 20 * Shop systems B2B und B2C with integration in your ERP system * Multishop systems * Mobile commerce * \\_ </literallayout>\n        </para>\n</section>\n','ezrichtext','eng-GB',2,0,'Best regards \\_ -- -- -- -- -- -- -- -- -- -- -- -- -- -- \\_ Ibexa AS Solligata 2 0254 OSLO Norway Phone: +47 35 58 70 20 * Shop systems B2B und B2C with integration in your ERP system * Multishop systems * Mobile commerce * \\_'),(425,1,0,243,95,NULL,NULL,'Email intro text Shop Owner','ezstring','eng-GB',2,0,'email intro text shop owner'),(426,1,0,244,95,NULL,NULL,'email_shop_owner_intro_text','ezstring','eng-GB',2,0,'email_shop_owner_intro_text'),(427,1,0,245,95,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(428,1,0,246,95,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Thank you for your order</para>\n</section>\n','ezrichtext','eng-GB',2,0,'Thank you for your order'),(429,1,0,243,96,NULL,NULL,'Email header address invoice text','ezstring','eng-GB',3,0,'email header address invoice text'),(430,1,0,244,96,NULL,NULL,'header_address_invoice_text','ezstring','eng-GB',3,0,'header_address_invoice_text'),(431,1,0,245,96,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(432,1,0,246,96,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para>Ibexa AS</para>\n        <para>Solligata 2</para>\n        <para>0254 OSLO</para>\n        <para>Norway</para>\n        <para><link xlink:href=\"ezurl://4\" xlink:show=\"none\">info@ibexa.co</link></para>\n        <para><link xlink:href=\"ezurl://5\" xlink:show=\"none\">https://www.ibexa.co/</link></para>\n        <para>+47 35 58 70 20</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Ibexa AS'),(433,1,0,243,97,NULL,NULL,'Email payment method invoice text','ezstring','eng-GB',3,0,'email payment method invoice text'),(434,1,0,244,97,NULL,NULL,'invoice_payment_method_invoice_text','ezstring','eng-GB',3,0,'invoice_payment_method_invoice_text'),(435,1,0,245,97,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(436,1,0,246,97,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para>If you have any questions do not hesitate to contact us.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'If you have any questions do not hesitate to contact us.'),(437,1,0,243,98,NULL,NULL,'Email invoice left footer','ezstring','eng-GB',3,0,'email invoice left footer'),(438,1,0,244,98,NULL,NULL,'invoice_left_footer','ezstring','eng-GB',3,0,'invoice_left_footer'),(439,1,0,245,98,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(440,1,0,246,98,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para/>\n</section>\n','ezrichtext','eng-GB',3,0,''),(441,1,0,243,99,NULL,NULL,'Email invoice right footer','ezstring','eng-GB',3,0,'email invoice right footer'),(442,1,0,244,99,NULL,NULL,'invoice_right_footer','ezstring','eng-GB',3,0,'invoice_right_footer'),(443,1,0,245,99,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(444,1,0,246,99,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para/>\n</section>\n','ezrichtext','eng-GB',3,0,''),(445,1,0,243,100,NULL,NULL,'Introduction text newsletter','ezstring','eng-GB',3,0,'introduction text newsletter'),(446,1,0,244,100,NULL,NULL,'common.subscribe_newsletter_intro','ezstring','eng-GB',3,0,'common.subscribe_newsletter_intro'),(447,1,0,245,100,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(448,1,0,246,100,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Subscribe to our newsletter and benefit from our regular updates about new products and news,</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Subscribe to our newsletter and benefit from our regular updates about new products and news,'),(449,1,0,243,101,NULL,NULL,'Footer address','ezstring','eng-GB',3,0,'footer address'),(450,1,0,244,101,NULL,NULL,'footer_block_address','ezstring','eng-GB',3,0,'footer_block_address'),(451,1,0,245,101,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(452,1,0,246,101,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para>Ibexa AS</para>\n        <para>Solligata 2</para>\n        <para>0254 OSLO</para>\n        <para>Norway</para>\n        <para><link xlink:href=\"ezurl://4\" xlink:show=\"none\">info@ibexa.co</link></para>\n        <para><link xlink:href=\"ezurl://5\" xlink:show=\"none\">https://www.ibexa.co/</link></para>\n        <para>+47 35 58 70 20</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Ibexa AS'),(453,1,0,243,102,NULL,NULL,'Footer block company','ezstring','eng-GB',3,0,'footer block company'),(454,1,0,244,102,NULL,NULL,'footer_block_company','ezstring','eng-GB',3,0,'footer_block_company'),(455,1,0,245,102,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(456,1,0,246,102,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">\n            <link xlink:href=\"ezurl://6\" xlink:show=\"none\" xlink:title=\"\">Contact</link>\n        </para>\n</section>\n','ezrichtext','eng-GB',3,0,'Contact'),(457,1,0,243,103,NULL,NULL,'Footer block ordering','ezstring','eng-GB',3,0,'footer block ordering'),(458,1,0,244,103,NULL,NULL,'footer_block_ordering','ezstring','eng-GB',3,0,'footer_block_ordering'),(459,1,0,245,103,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(460,1,0,246,103,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">\n            <link xlink:href=\"ezurl://7\" xlink:show=\"none\" xlink:title=\"\">Online-Cancellation form</link>\n        </para>\n</section>\n','ezrichtext','eng-GB',3,0,'Online-Cancellation form'),(461,1,0,243,104,NULL,NULL,'Footer block service','ezstring','eng-GB',3,0,'footer block service'),(462,1,0,244,104,NULL,NULL,'footer_block_service','ezstring','eng-GB',3,0,'footer_block_service'),(463,1,0,245,104,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(464,1,0,246,104,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">\n            <link xlink:href=\"ezurl://8\" xlink:show=\"none\">Product return form</link>\n        </para>\n</section>\n','ezrichtext','eng-GB',3,0,'Product return form'),(465,1,0,243,105,NULL,NULL,'Quickorder Introtext','ezstring','eng-GB',2,0,'quickorder introtext'),(466,1,0,244,105,NULL,NULL,'quickorder_introtext','ezstring','eng-GB',2,0,'quickorder_introtext'),(467,1,0,245,105,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(468,1,0,246,105,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para>If you know the skus of the products you want to order, you can use quickorder to add these products to the basket.</para>\n        <para>You can search for</para>\n        <itemizedlist>\n            <listitem>\n                <para>a product name</para>\n            </listitem>\n            <listitem>\n                <para>a sku</para>\n            </listitem>\n            <listitem>\n                <para>a sku and variant code or a variant name</para>\n            </listitem>\n        </itemizedlist>\n        <para>The shop will display suggestions and you can choose one of the list.</para>\n        <para>A csv file containing a list of skus, variant codes and quantity can be imported by drag &amp; drop. Instead of uploading a file you can paste the content into the textbox s well.</para>\n        <para>Please click on \"Refresh quickorder\" if you want to see your individual prices and the updated stock information.</para>\n</section>\n','ezrichtext','eng-GB',2,0,'If you know the skus of the products you want to order, you can use quickorder to add these products to the basket.'),(469,1,0,243,106,NULL,NULL,'404 Page','ezstring','eng-GB',3,0,'404 page'),(470,1,0,244,106,NULL,NULL,'404_page','ezstring','eng-GB',3,0,'404_page'),(471,1,0,245,106,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(472,1,0,246,106,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">The page you\'ve requested could not be found. The requested page may no longer exist, or there may be a typo in the URL.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'The page you\'ve requested could not be found. The requested page may no longer exist, or there may be a typo in the URL.'),(473,1,0,243,107,NULL,NULL,'Access denied','ezstring','eng-GB',3,0,'access denied'),(474,1,0,244,107,NULL,NULL,'403_access_denied','ezstring','eng-GB',3,0,'403_access_denied'),(475,1,0,245,107,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(476,1,0,246,107,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">You have been logged out automatically because of a timeout or you don\'t have access to the requested content. Please log in again if you are already a customers or create a new account.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'You have been logged out automatically because of a timeout or you don\'t have access to the requested content. Please log in again if you are already a customers or create a new account.'),(477,1,0,243,108,NULL,NULL,'Introtext orderhistory','ezstring','eng-GB',3,0,'introtext orderhistory'),(478,1,0,244,108,NULL,NULL,'orderhistory_introtext','ezstring','eng-GB',3,0,'orderhistory_introtext'),(479,1,0,245,108,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(480,1,0,246,108,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Here you will find an overview of your order history.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Here you will find an overview of your order history.'),(481,1,0,243,109,NULL,NULL,'Back to catalog','ezstring','eng-GB',3,0,'back to catalog'),(482,1,0,244,109,NULL,NULL,'back_to_catalog','ezstring','eng-GB',3,0,'back_to_catalog'),(483,1,0,245,109,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(484,1,0,246,109,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Go back to catalog</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Go back to catalog'),(485,1,0,243,110,NULL,NULL,'Click here to register new user','ezstring','eng-GB',2,0,'click here to register new user'),(486,1,0,244,110,NULL,NULL,'common.click_here_to_register','ezstring','eng-GB',2,0,'common.click_here_to_register'),(487,1,0,245,110,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(488,1,0,246,110,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para>New customer? You can create a new account here:</para>\n</section>\n','ezrichtext','eng-GB',2,0,'New customer? You can create a new account here:'),(489,1,0,243,111,NULL,NULL,'Success message password change','ezstring','eng-GB',3,0,'success message password change'),(490,1,0,244,111,NULL,NULL,'success_message_password_change','ezstring','eng-GB',3,0,'success_message_password_change'),(491,1,0,245,111,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(492,1,0,246,111,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Password changed successfully.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Password changed successfully.'),(493,1,0,243,112,NULL,NULL,'Success message for password request','ezstring','eng-GB',3,0,'success message for password request'),(494,1,0,244,112,NULL,NULL,'success_message_password_reminder','ezstring','eng-GB',3,0,'success_message_password_reminder'),(495,1,0,245,112,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(496,1,0,246,112,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">An email was sent to your email address.</para>\n        <para ezxhtml:class=\"paraClass\">Please check your mailbox to get a new password.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'An email was sent to your email address.'),(497,1,0,243,113,NULL,NULL,'Error message password change','ezstring','eng-GB',3,0,'error message password change'),(498,1,0,244,113,NULL,NULL,'error_message_password_change','ezstring','eng-GB',3,0,'error_message_password_change'),(499,1,0,245,113,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(500,1,0,246,113,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Could not send the form. Please check for errors and resubmit.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Could not send the form. Please check for errors and resubmit.'),(501,1,0,243,114,NULL,NULL,'Error message for password reminder','ezstring','eng-GB',3,0,'error message for password reminder'),(502,1,0,244,114,NULL,NULL,'error_message_password_reminder','ezstring','eng-GB',3,0,'error_message_password_reminder'),(503,1,0,245,114,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(504,1,0,246,114,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Could not send the form. Please check for errors and resubmit.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Could not send the form. Please check for errors and resubmit.'),(505,1,0,243,115,NULL,NULL,'Intro text Edit Buyer','ezstring','eng-GB',3,0,'intro text edit buyer'),(506,1,0,244,115,NULL,NULL,'buyer_intro_text','ezstring','eng-GB',3,0,'buyer_intro_text'),(507,1,0,245,115,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(508,1,0,246,115,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">You can edit your buyer address here.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'You can edit your buyer address here.'),(509,1,0,243,116,NULL,NULL,'Intro text edit My Account','ezstring','eng-GB',3,0,'intro text edit my account'),(510,1,0,244,116,NULL,NULL,'my_account_intro_text','ezstring','eng-GB',3,0,'my_account_intro_text'),(511,1,0,245,116,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(512,1,0,246,116,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">You can edit your account here.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'You can edit your account here.'),(513,1,0,243,117,NULL,NULL,'My profile information intro text','ezstring','eng-GB',3,0,'my profile information intro text'),(514,1,0,244,117,NULL,NULL,'my_profile_intro_text','ezstring','eng-GB',3,0,'my_profile_intro_text'),(515,1,0,245,117,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(516,1,0,246,117,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">You may edit your profile information here.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'You may edit your profile information here.'),(517,1,0,243,118,NULL,NULL,'Registration error message','ezstring','eng-GB',3,0,'registration error message'),(518,1,0,244,118,NULL,NULL,'error_message_register','ezstring','eng-GB',3,0,'error_message_register'),(519,1,0,245,118,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(520,1,0,246,118,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Some errors occurred. See below.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Some errors occurred. See below.'),(521,1,0,243,119,NULL,NULL,'Success message activate business customer','ezstring','eng-GB',3,0,'success message activate business customer'),(522,1,0,244,119,NULL,NULL,'success_activate_business','ezstring','eng-GB',3,0,'success_activate_business'),(523,1,0,245,119,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(524,1,0,246,119,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Thank you for activating your account.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Thank you for activating your account.'),(525,1,0,243,120,NULL,NULL,'Success message Edit Buyer','ezstring','eng-GB',3,0,'success message edit buyer'),(526,1,0,244,120,NULL,NULL,'success_buyer','ezstring','eng-GB',3,0,'success_buyer'),(527,1,0,245,120,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(528,1,0,246,120,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Your buyer address has been successfully modified.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Your buyer address has been successfully modified.'),(529,1,0,243,121,NULL,NULL,'Success message edit invoice','ezstring','eng-GB',3,0,'success message edit invoice'),(530,1,0,244,121,NULL,NULL,'success_invoice','ezstring','eng-GB',3,0,'success_invoice'),(531,1,0,245,121,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(532,1,0,246,121,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">If your account doesn\'t have a customer number, your invoice address has been modified. If your account has a customer number, your changes have to be approved first. An email has been sent to the administrator.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'If your account doesn\'t have a customer number, your invoice address has been modified. If your account has a customer number, your changes have to be approved first. An email has been sent to the administrator.'),(533,1,0,243,122,NULL,NULL,'Success message Edit MyAccount','ezstring','eng-GB',3,0,'success message edit myaccount'),(534,1,0,244,122,NULL,NULL,'success_my_account','ezstring','eng-GB',3,0,'success_my_account'),(535,1,0,245,122,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(536,1,0,246,122,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Your account has been modified.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Your account has been modified.'),(537,1,0,243,123,NULL,NULL,'Success message registration business customer','ezstring','eng-GB',3,0,'success message registration business customer'),(538,1,0,244,123,NULL,NULL,'success_register_business','ezstring','eng-GB',3,0,'success_register_business'),(539,1,0,245,123,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(540,1,0,246,123,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Thank you for your registration. You will receive an email after your data is verified by an administrator.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Thank you for your registration. You will receive an email after your data is verified by an administrator.'),(541,1,0,243,124,NULL,NULL,'Success message registration private customer','ezstring','eng-GB',3,0,'success message registration private customer'),(542,1,0,244,124,NULL,NULL,'success_register_private','ezstring','eng-GB',3,0,'success_register_private'),(543,1,0,245,124,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(544,1,0,246,124,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para ezxhtml:class=\"paraClass\">Thank you for your registration. In a few minutes you will receive a confirmation email.</para>\n</section>\n','ezrichtext','eng-GB',3,0,'Thank you for your registration. In a few minutes you will receive a confirmation email.'),(545,1,0,230,125,NULL,NULL,'Product Catalog','ezstring','eng-GB',2,0,'product catalog'),(545,2,0,230,125,NULL,NULL,'Product Catalog','ezstring','eng-GB',2,0,'product catalog'),(545,3,0,230,125,NULL,NULL,'Product Catalog','ezstring','eng-GB',2,0,'product catalog'),(546,1,0,231,125,NULL,56,NULL,'ezinteger','eng-GB',2,56,''),(546,2,0,231,125,NULL,126,NULL,'ezinteger','eng-GB',2,126,''),(546,3,0,231,125,NULL,126,NULL,'ezinteger','eng-GB',2,126,''),(547,1,0,232,125,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(547,2,0,232,125,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(547,3,0,232,125,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(548,1,0,233,125,NULL,NULL,'5','ezstring','eng-GB',2,0,'5'),(548,2,0,233,125,NULL,NULL,'5','ezstring','eng-GB',2,0,'5'),(548,3,0,233,125,NULL,NULL,'5','ezstring','eng-GB',2,0,'5'),(549,1,0,352,126,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(550,1,0,1,126,NULL,NULL,'Terms & Conditions','ezstring','eng-GB',2,0,'terms & conditions'),(551,1,0,152,126,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(552,1,0,153,126,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors/></ezauthor>\n','ezauthor','eng-GB',2,0,''),(553,1,0,120,126,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para>Terms &amp; Conditions</para>\n</section>\n','ezrichtext','eng-GB',2,0,'Terms & Conditions'),(554,1,0,121,126,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,''),(555,1,0,123,126,NULL,0,NULL,'ezboolean','eng-GB',2,0,''),(556,1,0,154,126,NULL,NULL,NULL,'ezobjectrelation','eng-GB',2,0,''),(557,1,0,353,126,NULL,NULL,'termsAndConditionsIdentifier','ezstring','eng-GB',2,0,'termsandconditionsidentifier'),(558,1,0,354,126,NULL,NULL,'','ezselection','eng-GB',2,0,''),(559,1,0,355,126,NULL,NULL,NULL,'eztext','eng-GB',2,0,''),(560,1,0,356,126,NULL,NULL,NULL,'ezbinaryfile','eng-GB',2,0,''),(561,1,0,357,126,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><relation-list/></related-objects>\n','ezobjectrelationlist','eng-GB',2,0,''),(562,1,0,358,126,NULL,1611529200,NULL,'ezdate','eng-GB',2,1611529200,''),(563,1,0,359,126,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(564,1,0,360,126,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,''),(565,1,0,361,126,NULL,NULL,NULL,'ezobjectrelation','eng-GB',2,0,''),(566,1,0,362,126,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(567,1,0,363,126,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(568,1,0,364,126,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(569,1,0,352,127,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(570,1,0,1,127,NULL,NULL,'Data & privacy regulations','ezstring','eng-GB',2,0,'data & privacy regulations'),(571,1,0,152,127,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(572,1,0,153,127,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors/></ezauthor>\n','ezauthor','eng-GB',2,0,''),(573,1,0,120,127,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para>Data &amp; privacy regulations</para>\n</section>\n','ezrichtext','eng-GB',2,0,'Data & privacy regulations'),(574,1,0,121,127,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,''),(575,1,0,123,127,NULL,0,NULL,'ezboolean','eng-GB',2,0,''),(576,1,0,154,127,NULL,NULL,NULL,'ezobjectrelation','eng-GB',2,0,''),(577,1,0,353,127,NULL,NULL,'data_protection','ezstring','eng-GB',2,0,'data_protection'),(578,1,0,354,127,NULL,NULL,'','ezselection','eng-GB',2,0,''),(579,1,0,355,127,NULL,NULL,NULL,'eztext','eng-GB',2,0,''),(580,1,0,356,127,NULL,NULL,NULL,'ezbinaryfile','eng-GB',2,0,''),(581,1,0,357,127,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><relation-list/></related-objects>\n','ezobjectrelationlist','eng-GB',2,0,''),(582,1,0,358,127,NULL,1611529200,NULL,'ezdate','eng-GB',2,1611529200,''),(583,1,0,359,127,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(584,1,0,360,127,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,''),(585,1,0,361,127,NULL,NULL,NULL,'ezobjectrelation','eng-GB',2,0,''),(586,1,0,362,127,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(587,1,0,363,127,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(588,1,0,364,127,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(589,1,0,352,128,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(590,1,0,1,128,NULL,NULL,'Cancellation policies','ezstring','eng-GB',2,0,'cancellation policies'),(591,1,0,152,128,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(592,1,0,153,128,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors/></ezauthor>\n','ezauthor','eng-GB',2,0,''),(593,1,0,120,128,NULL,NULL,'<?xml version=\"1.0\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\">\n        <para>Cancellation policies</para>\n</section>\n','ezrichtext','eng-GB',2,0,'Cancellation policies'),(594,1,0,121,128,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,''),(595,1,0,123,128,NULL,0,NULL,'ezboolean','eng-GB',2,0,''),(596,1,0,154,128,NULL,NULL,NULL,'ezobjectrelation','eng-GB',2,0,''),(597,1,0,353,128,NULL,NULL,'cancellation_policy','ezstring','eng-GB',2,0,'cancellation_policy'),(598,1,0,354,128,NULL,NULL,'','ezselection','eng-GB',2,0,''),(599,1,0,355,128,NULL,NULL,NULL,'eztext','eng-GB',2,0,''),(600,1,0,356,128,NULL,NULL,NULL,'ezbinaryfile','eng-GB',2,0,''),(601,1,0,357,128,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<related-objects><relation-list/></related-objects>\n','ezobjectrelationlist','eng-GB',2,0,''),(602,1,0,358,128,NULL,1611529200,NULL,'ezdate','eng-GB',2,1611529200,''),(603,1,0,359,128,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(604,1,0,360,128,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',2,0,''),(605,1,0,361,128,NULL,NULL,NULL,'ezobjectrelation','eng-GB',2,0,''),(606,1,0,362,128,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(607,1,0,363,128,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(608,1,0,364,128,NULL,NULL,NULL,'ezstring','eng-GB',2,0,''),(609,1,0,4,129,NULL,NULL,'All Rides','ezstring','eng-GB',3,0,'all rides'),(610,1,0,155,129,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(611,1,0,119,129,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(612,1,0,156,129,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(613,1,0,4,130,NULL,NULL,'Points of Interest','ezstring','eng-GB',3,0,'points of interest'),(614,1,0,155,130,NULL,NULL,NULL,'ezstring','eng-GB',3,0,''),(615,1,0,119,130,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(616,1,0,156,130,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext','eng-GB',3,0,''),(617,1,0,365,131,NULL,NULL,'Finnish coastline from Rauma to Pori','ezstring','eng-GB',3,0,'finnish coastline from rauma to pori'),(618,1,0,366,131,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"saaristo.jpg\"\n    suffix=\"jpg\" basename=\"saaristo\" dirpath=\"var/site/storage/images/8/1/6/0/618-1-eng-GB\" url=\"var/site/storage/images/8/1/6/0/618-1-eng-GB/saaristo.jpg\"\n    original_filename=\"saaristo.jpg\" mime_type=\"image/jpeg\" width=\"600\"\n    height=\"450\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1611589692\">\n  <original attribute_id=\"618\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"450\" Width=\"600\" IsColor=\"1\"/>\n  <additional_data/>\n</ezimage>','ezimage','eng-GB',3,0,''),(619,1,0,367,131,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para><emphasis>Following</emphasis> on the route of the <emphasis role=\"strong\">Battenkill</emphasis>, starting from <emphasis role=\"underlined\">Schueylerville</emphasis> and ending in Shushan this ride offers breathtaking views.</para><itemizedlist><listitem><para>Schueylerville</para></listitem><listitem><para>Battenkill</para></listitem><listitem><para>ride</para></listitem></itemizedlist></section>\n','ezrichtext','eng-GB',3,0,'Following'),(620,1,0,368,131,NULL,NULL,'1','ezselection','eng-GB',3,0,'1'),(621,1,0,369,131,NULL,1,'','ezgmaplocation','eng-GB',3,0,'rauma, finland'),(622,1,0,370,131,NULL,1,'','ezgmaplocation','eng-GB',3,0,'pori, finland'),(623,1,0,371,131,NULL,54,NULL,'ezinteger','eng-GB',3,54,''),(624,1,0,372,131,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"Artturi Sakari Reinikainen\" email=\"me@ez.no\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'artturi sakari reinikainen'),(625,1,0,365,132,NULL,NULL,'Baby tour of the Battenkill','ezstring','eng-GB',3,0,'baby tour of the battenkill'),(626,1,0,366,132,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"battenkill.jpg\"\n    suffix=\"jpg\" basename=\"battenkill\" dirpath=\"var/site/storage/images/6/2/6/0/626-1-eng-GB\" url=\"var/site/storage/images/6/2/6/0/626-1-eng-GB/battenkill.jpg\"\n    original_filename=\"battenkill.jpg\" mime_type=\"image/jpeg\" width=\"500\"\n    height=\"375\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1611589692\">\n  <original attribute_id=\"626\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"375\" Width=\"500\" IsColor=\"1\"/>\n  <additional_data/>\n</ezimage>','ezimage','eng-GB',3,0,''),(627,1,0,367,132,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para><emphasis>Following</emphasis> on the route of the <emphasis role=\"strong\">Battenkill</emphasis>, starting from <emphasis role=\"underlined\">Schueylerville</emphasis> and ending in Shushan this ride offers breathtaking views.</para><itemizedlist><listitem><para>Schueylerville</para></listitem><listitem><para>Battenkill</para></listitem><listitem><para>ride</para></listitem></itemizedlist></section>\n','ezrichtext','eng-GB',3,0,'Following'),(628,1,0,368,132,NULL,NULL,'1','ezselection','eng-GB',3,0,'1'),(629,1,0,369,132,NULL,1,'','ezgmaplocation','eng-GB',3,0,'schuylerville, ny, usa'),(630,1,0,370,132,NULL,1,'','ezgmaplocation','eng-GB',3,0,'shushan, ny, usa'),(631,1,0,371,132,NULL,37,NULL,'ezinteger','eng-GB',3,37,''),(632,1,0,372,132,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"Angus MacGyver\" email=\"me@ez.no\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'angus macgyver'),(633,1,0,365,133,NULL,NULL,'Meillonnas terrain track','ezstring','eng-GB',3,0,'meillonnas terrain track'),(634,1,0,366,133,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"cabatane_full.jpg\"\n    suffix=\"jpg\" basename=\"cabatane_full\" dirpath=\"var/site/storage/images/4/3/6/0/634-1-eng-GB\" url=\"var/site/storage/images/4/3/6/0/634-1-eng-GB/cabatane_full.jpg\"\n    original_filename=\"cabatane_full.jpg\" mime_type=\"image/jpeg\" width=\"760\"\n    height=\"760\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1611589693\">\n  <original attribute_id=\"634\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"760\" Width=\"760\" IsColor=\"1\"/>\n  <additional_data/>\n</ezimage>','ezimage','eng-GB',3,0,''),(635,1,0,367,133,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para><emphasis>Following</emphasis> on the route of the <emphasis role=\"strong\">Battenkill</emphasis>, starting from <emphasis role=\"underlined\">Schueylerville</emphasis> and ending in Shushan this ride offers breathtaking views.</para><itemizedlist><listitem><para>Schueylerville</para></listitem><listitem><para>Battenkill</para></listitem><listitem><para>ride</para></listitem></itemizedlist></section>\n','ezrichtext','eng-GB',3,0,'Following'),(636,1,0,368,133,NULL,NULL,'2','ezselection','eng-GB',3,0,'2'),(637,1,0,369,133,NULL,1,'','ezgmaplocation','eng-GB',3,0,'meillonnas, france'),(638,1,0,370,133,NULL,1,'','ezgmaplocation','eng-GB',3,0,'pressiat, france'),(639,1,0,371,133,NULL,18,NULL,'ezinteger','eng-GB',3,18,''),(640,1,0,372,133,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"Damien Pobel\" email=\"me@ez.no\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'damien pobel'),(641,1,0,365,134,NULL,NULL,'Rallarvegen in Norway','ezstring','eng-GB',3,0,'rallarvegen in norway'),(642,1,0,366,134,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"rallarvagen.jpg\"\n    suffix=\"jpg\" basename=\"rallarvagen\" dirpath=\"var/site/storage/images/2/4/6/0/642-1-eng-GB\" url=\"var/site/storage/images/2/4/6/0/642-1-eng-GB/rallarvagen.jpg\"\n    original_filename=\"rallarvagen.jpg\" mime_type=\"image/jpeg\" width=\"1176\"\n    height=\"882\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1611589693\">\n  <original attribute_id=\"642\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"882\" Width=\"1176\" IsColor=\"1\"/>\n  <additional_data/>\n</ezimage>','ezimage','eng-GB',3,0,''),(643,1,0,367,134,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para><emphasis>Following</emphasis> on the route of the <emphasis role=\"strong\">Battenkill</emphasis>, starting from <emphasis role=\"underlined\">Schueylerville</emphasis> and ending in Shushan this ride offers breathtaking views.</para><itemizedlist><listitem><para>Schueylerville</para></listitem><listitem><para>Battenkill</para></listitem><listitem><para>ride</para></listitem></itemizedlist></section>\n','ezrichtext','eng-GB',3,0,'Following'),(644,1,0,368,134,NULL,NULL,'1','ezselection','eng-GB',3,0,'1'),(645,1,0,369,134,NULL,1,'','ezgmaplocation','eng-GB',3,0,'haugastøl, hol, norway'),(646,1,0,370,134,NULL,1,'','ezgmaplocation','eng-GB',3,0,'finse, ulvik, norway'),(647,1,0,371,134,NULL,28,NULL,'ezinteger','eng-GB',3,28,''),(648,1,0,372,134,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"Gunnstein Lye\" email=\"me@ez.no\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'gunnstein lye'),(649,1,0,365,135,NULL,NULL,'Lookouts between Coligny and Montagna-le-Reconduit','ezstring','eng-GB',3,0,'lookouts between coligny and montagna-le-reconduit'),(650,1,0,366,135,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"default_ride.jpg\"\n    suffix=\"jpg\" basename=\"default_ride\" dirpath=\"var/site/storage/images/0/5/6/0/650-1-eng-GB\" url=\"var/site/storage/images/0/5/6/0/650-1-eng-GB/default_ride.jpg\"\n    original_filename=\"default_ride.jpg\" mime_type=\"image/jpeg\" width=\"1900\"\n    height=\"1080\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1611589693\">\n  <original attribute_id=\"650\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"1080\" Width=\"1900\" IsColor=\"1\"/>\n  <additional_data/>\n</ezimage>','ezimage','eng-GB',3,0,''),(651,1,0,367,135,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para><emphasis>Following</emphasis> on the route of the <emphasis role=\"strong\">Battenkill</emphasis>, starting from <emphasis role=\"underlined\">Schueylerville</emphasis> and ending in Shushan this ride offers breathtaking views.</para><itemizedlist><listitem><para>Schueylerville</para></listitem><listitem><para>Battenkill</para></listitem><listitem><para>ride</para></listitem></itemizedlist></section>\n','ezrichtext','eng-GB',3,0,'Following'),(652,1,0,368,135,NULL,NULL,'0','ezselection','eng-GB',3,0,'0'),(653,1,0,369,135,NULL,1,'','ezgmaplocation','eng-GB',3,0,'coligny, france'),(654,1,0,370,135,NULL,1,'','ezgmaplocation','eng-GB',3,0,'montagna-le-reconduit, france'),(655,1,0,371,135,NULL,19,NULL,'ezinteger','eng-GB',3,19,''),(656,1,0,372,135,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezauthor><authors><author id=\"1\" name=\"Damien Pobel\" email=\"me@ez.no\"/></authors></ezauthor>\n','ezauthor','eng-GB',3,0,'damien pobel'),(657,1,0,373,136,NULL,NULL,'Cross above Tarcia','ezstring','eng-GB',3,0,'cross above tarcia'),(658,1,0,374,136,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>This is the cross that\'s above Tarcia in the hills.</para></section>\n','ezrichtext','eng-GB',3,0,'This is the cross that\'s above Tarcia in the hills.'),(659,1,0,375,136,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"cross-tarcia.jpg\"\n    suffix=\"jpg\" basename=\"cross-tarcia\" dirpath=\"var/site/storage/images/9/5/6/0/659-1-eng-GB\" url=\"var/site/storage/images/9/5/6/0/659-1-eng-GB/cross-tarcia.jpg\"\n    original_filename=\"cross-tarcia.jpg\" mime_type=\"image/jpeg\" width=\"1536\"\n    height=\"864\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1611589694\">\n  <original attribute_id=\"659\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"864\" Width=\"1536\" IsColor=\"1\"/>\n  <additional_data/>\n</ezimage>','ezimage','eng-GB',3,0,''),(660,1,0,376,136,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>View of the top in the summer</para></section>\n','ezrichtext','eng-GB',3,0,'View of the top in the summer'),(661,1,0,377,136,NULL,1,'','ezgmaplocation','eng-GB',3,0,'tarcia'),(662,1,0,373,137,NULL,NULL,'Plateau de Vergongeat','ezstring','eng-GB',3,0,'plateau de vergongeat'),(663,1,0,374,137,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>﻿Vergongeat Plateau, located between Coligny and Poisoux, allows great views to see the Jura Mountains and the Mont Blanc.</para></section>\n','ezrichtext','eng-GB',3,0,'﻿Vergongeat Plateau, located between Coligny and Poisoux, allows great views to see the Jura Mountains and the Mont Blanc.'),(664,1,0,375,137,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"vergongeat_full.jpg\"\n    suffix=\"jpg\" basename=\"vergongeat_full\" dirpath=\"var/site/storage/images/4/6/6/0/664-1-eng-GB\" url=\"var/site/storage/images/4/6/6/0/664-1-eng-GB/vergongeat_full.jpg\"\n    original_filename=\"vergongeat_full.jpg\" mime_type=\"image/jpeg\" width=\"760\"\n    height=\"249\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1611589694\">\n  <original attribute_id=\"664\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"249\" Width=\"760\" IsColor=\"1\"/>\n  <additional_data/>\n</ezimage>','ezimage','eng-GB',3,0,''),(665,1,0,376,137,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>Panorama view</para></section>\n','ezrichtext','eng-GB',3,0,'Panorama view'),(666,1,0,377,137,NULL,0,'','ezgmaplocation','eng-GB',3,0,'');
/*!40000 ALTER TABLE `ezcontentobject_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_link`
--

DROP TABLE IF EXISTS `ezcontentobject_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentclassattribute_id` int(11) NOT NULL DEFAULT 0,
  `from_contentobject_id` int(11) NOT NULL DEFAULT 0,
  `from_contentobject_version` int(11) NOT NULL DEFAULT 0,
  `relation_type` int(11) NOT NULL DEFAULT 1,
  `to_contentobject_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ezco_link_to_co_id` (`to_contentobject_id`),
  KEY `ezco_link_from` (`from_contentobject_id`,`from_contentobject_version`,`contentclassattribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_link`
--

LOCK TABLES `ezcontentobject_link` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcontentobject_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_name`
--

DROP TABLE IF EXISTS `ezcontentobject_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_name` (
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `content_version` int(11) NOT NULL DEFAULT 0,
  `content_translation` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `language_id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `real_translation` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`contentobject_id`,`content_version`,`content_translation`),
  KEY `ezcontentobject_name_lang_id` (`language_id`),
  KEY `ezcontentobject_name_cov_id` (`content_version`),
  KEY `ezcontentobject_name_name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_name`
--

LOCK TABLES `ezcontentobject_name` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_name` DISABLE KEYS */;
INSERT INTO `ezcontentobject_name` VALUES (1,9,'eng-GB',2,'Ibexa Platform','eng-GB'),(4,1,'eng-GB',3,'Users','eng-GB'),(10,2,'eng-GB',3,'Anonymous User','eng-GB'),(11,1,'eng-GB',3,'Guest accounts','eng-GB'),(12,1,'eng-GB',3,'Administrator users','eng-GB'),(13,1,'eng-GB',3,'Editors','eng-GB'),(14,3,'eng-GB',3,'Administrator User','eng-GB'),(41,1,'eng-GB',3,'Media','eng-GB'),(42,1,'eng-GB',3,'Anonymous Users','eng-GB'),(49,1,'eng-GB',3,'Images','eng-GB'),(50,1,'eng-GB',3,'Files','eng-GB'),(51,1,'eng-GB',3,'Multimedia','eng-GB'),(52,1,'eng-GB',2,'Ibexa Digital Experience Platform','eng-GB'),(53,1,'eng-GB',2,'Form Uploads','eng-GB'),(54,1,'eng-GB',3,'Forms','eng-GB'),(55,1,'eng-GB',3,'Site skeletons','eng-GB'),(56,1,'eng-GB',3,'Shop users','eng-GB'),(57,1,'eng-GB',3,'Private customers','eng-GB'),(58,1,'eng-GB',3,'Business customers','eng-GB'),(59,1,'eng-GB',3,'Components','eng-GB'),(60,1,'eng-GB',3,'silver-eshop','eng-GB'),(61,1,'eng-GB',3,'Textmodules','eng-GB'),(62,1,'eng-GB',3,'Basket','eng-GB'),(63,1,'eng-GB',3,'Checkout','eng-GB'),(64,1,'eng-GB',3,'Contact','eng-GB'),(65,1,'eng-GB',3,'Customercenter','eng-GB'),(66,1,'eng-GB',3,'Email','eng-GB'),(67,1,'eng-GB',3,'Footer','eng-GB'),(68,1,'eng-GB',3,'Forms','eng-GB'),(69,1,'eng-GB',3,'Misc','eng-GB'),(70,1,'eng-GB',3,'Orderhistory','eng-GB'),(71,1,'eng-GB',3,'User','eng-GB'),(72,1,'eng-GB',3,'Introtext stored basket','eng-GB'),(73,1,'eng-GB',3,'Introtext wishlist','eng-GB'),(74,1,'eng-GB',3,'Accept our Data protection and Cancellation policies','eng-GB'),(75,1,'eng-GB',3,'Data privay hint','eng-GB'),(76,1,'eng-GB',3,'Success message - Cancellation','eng-GB'),(77,1,'eng-GB',3,'Introtext - Summary of order','eng-GB'),(78,1,'eng-GB',3,'Terms&Conditions','eng-GB'),(79,1,'eng-GB',3,'Success message - Contact form','eng-GB'),(80,1,'eng-GB',3,'Intro text - Contact form','eng-GB'),(81,1,'eng-GB',3,'Appoval request entry page','eng-GB'),(82,1,'eng-GB',3,'Basket sent to approver','eng-GB'),(83,1,'eng-GB',3,'Basket was send to approver info ','eng-GB'),(84,1,'eng-GB',3,'Buyer approval request entry page','eng-GB'),(85,1,'eng-GB',3,'Email request new user','eng-GB'),(86,1,'eng-GB',3,'Success message edit user','eng-GB'),(87,1,'eng-GB',3,'Success message add erp user to the shop','eng-GB'),(88,1,'eng-GB',3,'Success message request new user','eng-GB'),(89,1,'eng-GB',3,'Error message forms','eng-GB'),(90,1,'eng-GB',3,'Customercenter - Contacts from ERP','eng-GB'),(91,1,'eng-GB',3,'Customercenter introtext','eng-GB'),(92,1,'eng-GB',3,'Request new user tooltip','eng-GB'),(93,1,'eng-GB',3,'Email cancellation policies','eng-GB'),(94,1,'eng-GB',3,'Email footer','eng-GB'),(95,1,'eng-GB',3,'Email intro text Shop Owner','eng-GB'),(96,1,'eng-GB',3,'Email header address invoice text','eng-GB'),(97,1,'eng-GB',3,'Email payment method invoice text','eng-GB'),(98,1,'eng-GB',3,'Email invoice left footer','eng-GB'),(99,1,'eng-GB',3,'Email invoice right footer','eng-GB'),(100,1,'eng-GB',3,'Introduction text newsletter','eng-GB'),(101,1,'eng-GB',3,'Footer address','eng-GB'),(102,1,'eng-GB',3,'Footer block company','eng-GB'),(103,1,'eng-GB',3,'Footer block ordering','eng-GB'),(104,1,'eng-GB',3,'Footer block service','eng-GB'),(105,1,'eng-GB',3,'Quickorder Introtext','eng-GB'),(106,1,'eng-GB',3,'404 Page','eng-GB'),(107,1,'eng-GB',3,'Access denied','eng-GB'),(108,1,'eng-GB',3,'Introtext orderhistory','eng-GB'),(109,1,'eng-GB',3,'Back to catalog','eng-GB'),(110,1,'eng-GB',3,'Click here to register new user','eng-GB'),(111,1,'eng-GB',3,'Success message password change','eng-GB'),(112,1,'eng-GB',3,'Success message for password request','eng-GB'),(113,1,'eng-GB',3,'Error message password change','eng-GB'),(114,1,'eng-GB',3,'Error message for password reminder','eng-GB'),(115,1,'eng-GB',3,'Intro text Edit Buyer','eng-GB'),(116,1,'eng-GB',3,'Intro text edit My Account','eng-GB'),(117,1,'eng-GB',3,'My profile information intro text','eng-GB'),(118,1,'eng-GB',3,'Registration error message','eng-GB'),(119,1,'eng-GB',3,'Success message activate business customer','eng-GB'),(120,1,'eng-GB',3,'Success message Edit Buyer','eng-GB'),(121,1,'eng-GB',3,'Success message edit invoice','eng-GB'),(122,1,'eng-GB',3,'Success message Edit MyAccount','eng-GB'),(123,1,'eng-GB',3,'Success message registration business customer','eng-GB'),(124,1,'eng-GB',3,'Success message registration private customer','eng-GB'),(125,1,'eng-GB',3,'Product Catalog','eng-GB'),(125,2,'eng-GB',3,'Product Catalog','eng-GB'),(125,3,'eng-GB',3,'Product Catalog','eng-GB'),(126,1,'eng-GB',3,'Terms & Conditions','eng-GB'),(127,1,'eng-GB',3,'Data & privacy regulations','eng-GB'),(128,1,'eng-GB',3,'Cancellation policies','eng-GB'),(129,1,'eng-GB',3,'All Rides','eng-GB'),(130,1,'eng-GB',3,'Points of Interest','eng-GB'),(131,1,'eng-GB',3,'Finnish coastline from Rauma to Pori','eng-GB'),(132,1,'eng-GB',3,'Baby tour of the Battenkill','eng-GB'),(133,1,'eng-GB',3,'Meillonnas terrain track','eng-GB'),(134,1,'eng-GB',3,'Rallarvegen in Norway','eng-GB'),(135,1,'eng-GB',3,'Lookouts between Coligny and Montagna-le-Reconduit','eng-GB'),(136,1,'eng-GB',3,'Cross above Tarcia','eng-GB'),(137,1,'eng-GB',3,'Plateau de Vergongeat','eng-GB');
/*!40000 ALTER TABLE `ezcontentobject_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_trash`
--

DROP TABLE IF EXISTS `ezcontentobject_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_trash` (
  `node_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `is_hidden` int(11) NOT NULL DEFAULT 0,
  `is_invisible` int(11) NOT NULL DEFAULT 0,
  `main_node_id` int(11) DEFAULT NULL,
  `modified_subnode` int(11) DEFAULT 0,
  `parent_node_id` int(11) NOT NULL DEFAULT 0,
  `path_identification_string` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `path_string` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT 0,
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `sort_field` int(11) DEFAULT 1,
  `sort_order` int(11) DEFAULT 1,
  `trashed` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`node_id`),
  KEY `ezcobj_trash_depth` (`depth`),
  KEY `ezcobj_trash_p_node_id` (`parent_node_id`),
  KEY `ezcobj_trash_path_ident` (`path_identification_string`(50)),
  KEY `ezcobj_trash_co_id` (`contentobject_id`),
  KEY `ezcobj_trash_modified_subnode` (`modified_subnode`),
  KEY `ezcobj_trash_path` (`path_string`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_trash`
--

LOCK TABLES `ezcontentobject_trash` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcontentobject_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_tree`
--

DROP TABLE IF EXISTS `ezcontentobject_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_tree` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_is_published` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `is_hidden` int(11) NOT NULL DEFAULT 0,
  `is_invisible` int(11) NOT NULL DEFAULT 0,
  `main_node_id` int(11) DEFAULT NULL,
  `modified_subnode` int(11) DEFAULT 0,
  `parent_node_id` int(11) NOT NULL DEFAULT 0,
  `path_identification_string` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `path_string` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT 0,
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `sort_field` int(11) DEFAULT 1,
  `sort_order` int(11) DEFAULT 1,
  PRIMARY KEY (`node_id`),
  KEY `ezcontentobject_tree_p_node_id` (`parent_node_id`),
  KEY `ezcontentobject_tree_path_ident` (`path_identification_string`(50)),
  KEY `ezcontentobject_tree_contentobject_id_path_string` (`path_string`(191),`contentobject_id`),
  KEY `ezcontentobject_tree_co_id` (`contentobject_id`),
  KEY `ezcontentobject_tree_depth` (`depth`),
  KEY `ezcontentobject_tree_path` (`path_string`(191)),
  KEY `modified_subnode` (`modified_subnode`),
  KEY `ezcontentobject_tree_remote_id` (`remote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_tree`
--

LOCK TABLES `ezcontentobject_tree` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_tree` DISABLE KEYS */;
INSERT INTO `ezcontentobject_tree` VALUES (1,0,1,1,0,0,0,1,1448999778,1,'','/1/',0,'629709ba256fe317c3ddcee35453a96a',1,1),(2,52,1,1,1,0,0,2,1301073466,1,'node_2','/1/2/',0,'f3e90596361e31d496d4026eb624c983',8,1),(5,4,1,1,1,0,0,5,1301062024,1,'users','/1/5/',0,'3f6d92f8044aed134f32153517850f5a',1,1),(12,11,1,1,2,0,0,12,1081860719,5,'users/guest_accounts','/1/5/12/',0,'602dcf84765e56b7f999eaafd3821dd3',1,1),(13,12,1,1,2,0,0,13,1301062024,5,'users/administrator_users','/1/5/13/',0,'769380b7aa94541679167eab817ca893',1,1),(14,13,1,1,2,0,0,14,1081860719,5,'users/editors','/1/5/14/',0,'f7dda2854fc68f7c8455d9cb14bd04a9',1,1),(15,14,1,3,3,0,0,15,1301062024,13,'users/administrator_users/administrator_user','/1/5/13/15/',0,'e5161a99f733200b9ed4e80f9c16187b',1,1),(42,1,1,9,2,0,0,42,1486473151,2,'node_2/ez_platform','/1/2/42/',0,'581da01017b80b1afb1e5e2a3081c724',1,1),(43,41,1,1,1,0,0,43,1081860720,1,'media','/1/43/',0,'75c715a51699d2d309a924eca6a95145',9,1),(44,42,1,1,2,0,0,44,1081860719,5,'users/anonymous_users','/1/5/44/',0,'4fdf0072da953bb276c0c7e0141c5c9b',9,1),(45,10,1,2,3,0,0,45,1081860719,44,'users/anonymous_users/anonymous_user','/1/5/44/45/',0,'2cf8343bee7b482bab82b269d8fecd76',9,1),(51,49,1,1,2,0,0,51,1081860720,43,'media/images','/1/43/51/',0,'1b26c0454b09bb49dfb1b9190ffd67cb',9,1),(52,50,1,1,2,0,0,52,1081860720,43,'media/files','/1/43/52/',0,'0b113a208f7890f9ad3c24444ff5988c',9,1),(53,51,1,1,2,0,0,53,1081860720,43,'media/multimedia','/1/43/53/',0,'4f18b82c75f10aad476cae5adf98c11f',9,1),(54,53,1,1,3,0,0,54,1486473151,52,'media/files/form_uploads','/1/43/52/54/',0,'0543630fa051a1e2be54dbd32da2420f',1,1),(55,54,1,1,1,0,0,55,1537166893,1,'forms','/1/55/',0,'1dad43be47e3a5c12cd06010aab65112',9,1),(56,55,1,1,2,0,0,56,1586855342,1,'site_skeletons','/1/56/',0,'9658f6deaeef9fc27300df5d5f566b37',9,1),(57,56,1,1,2,0,0,57,1611581046,5,'users/shop_users','/1/5/57/',0,'cbb0fd0d1e9cd96b24d94e713bdb6d9a',1,1),(58,57,1,1,3,0,0,58,1611581046,57,'users/shop_users/private_customers','/1/5/57/58/',0,'d7b91720f00df1843b3670779c113f60',1,1),(59,58,1,1,3,0,0,59,1611581046,57,'users/shop_users/business_customers','/1/5/57/59/',0,'fe6e47f3c40fe8360c606520a6d12388',1,1),(60,59,1,1,1,0,0,60,1611581049,1,'components','/1/60/',0,'f0bd28dd963104810feac295aef30491',9,1),(61,60,1,1,2,0,0,61,1611581049,60,'components/silver_eshop','/1/60/61/',0,'f6c54226f2d14403c0b5fa714635bde6',9,1),(62,61,1,1,2,0,0,62,1611581049,60,'components/textmodules','/1/60/62/',0,'51d6eb1e0bc72d3f0af9f511f8f31f20',9,1),(63,62,1,1,3,0,0,63,1611581049,62,'components/textmodules/basket','/1/60/62/63/',0,'890ae437af69bd7d6115fcb5c78bbc6c',9,1),(64,63,1,1,3,0,0,64,1611581049,62,'components/textmodules/checkout','/1/60/62/64/',0,'3a31c8cc7b2e65b0654c64da6f94168a',9,1),(65,64,1,1,3,0,0,65,1611581049,62,'components/textmodules/contact','/1/60/62/65/',0,'385a63bbd0d1882dfe2d64afca30e547',9,1),(66,65,1,1,3,0,0,66,1611581049,62,'components/textmodules/customercenter','/1/60/62/66/',0,'41363dbe46a60fa4e44218f6ee967be2',9,1),(67,66,1,1,3,0,0,67,1611581049,62,'components/textmodules/email','/1/60/62/67/',0,'18531efcf8e6ff2282528d08e9e222c4',9,1),(68,67,1,1,3,0,0,68,1611581049,62,'components/textmodules/footer','/1/60/62/68/',0,'e7566528dc68091141082ec94f6d6f84',9,1),(69,68,1,1,3,0,0,69,1611581049,62,'components/textmodules/forms','/1/60/62/69/',0,'11abfff2d8f039d9785bf1cf39fba731',9,1),(70,69,1,1,3,0,0,70,1611581049,62,'components/textmodules/misc','/1/60/62/70/',0,'0cc7c0647f5bf25d0b1c54184abbd65c',9,1),(71,70,1,1,3,0,0,71,1611581049,62,'components/textmodules/orderhistory','/1/60/62/71/',0,'810332c889956a484e4978383fb0a044',9,1),(72,71,1,1,3,0,0,72,1611581049,62,'components/textmodules/user','/1/60/62/72/',0,'e7d8719c8526c4c301a9feb8ff290519',9,1),(73,72,1,1,4,0,0,73,1611581049,63,'components/textmodules/basket/introtext_stored_basket','/1/60/62/63/73/',0,'fd7d6a64aa5673772d57a5afa0b116f6',9,1),(74,73,1,1,4,0,0,74,1611581049,63,'components/textmodules/basket/introtext_wishlist','/1/60/62/63/74/',0,'08fce27338b85cc29ed5d08ef994c00f',9,1),(75,74,1,1,4,0,0,75,1611581050,64,'components/textmodules/checkout/accept_our_data_protection_and_cancellation_policies','/1/60/62/64/75/',0,'be6f7d6e3a45faac744da65cb8491c41',9,1),(76,75,1,1,4,0,0,76,1611581050,64,'components/textmodules/checkout/data_privay_hint','/1/60/62/64/76/',0,'53ada457ed43f74e448041fa96047bc5',9,1),(77,76,1,1,4,0,0,77,1611581050,64,'components/textmodules/checkout/success_message_cancellation','/1/60/62/64/77/',0,'cd5f0b33c88184ccd4deb0d055c379f0',9,1),(78,77,1,1,4,0,0,78,1611581050,64,'components/textmodules/checkout/introtext_summary_of_order','/1/60/62/64/78/',0,'98ebe6b62ee60c69be4f43dedabdb675',9,1),(79,78,1,1,4,0,0,79,1611581050,64,'components/textmodules/checkout/terms_conditions','/1/60/62/64/79/',0,'038e33e3967465ba3cd2d0409579f61a',9,1),(80,79,1,1,4,0,0,80,1611581051,65,'components/textmodules/contact/success_message_contact_form','/1/60/62/65/80/',0,'e1e4621fb84ae8cd63dd1a4cc8a9d43b',9,1),(81,80,1,1,4,0,0,81,1611581051,65,'components/textmodules/contact/intro_text_contact_form','/1/60/62/65/81/',0,'da3a40083fd84a1ffb0f5d2130348433',9,1),(82,81,1,1,4,0,0,82,1611581051,66,'components/textmodules/customercenter/appoval_request_entry_page','/1/60/62/66/82/',0,'bf954d8b646a6c93edf364f39b25d460',9,1),(83,82,1,1,4,0,0,83,1611581051,66,'components/textmodules/customercenter/basket_sent_to_approver','/1/60/62/66/83/',0,'0571281792cd328f38aa6b027da55097',9,1),(84,83,1,1,4,0,0,84,1611581051,66,'components/textmodules/customercenter/basket_was_send_to_approver_info','/1/60/62/66/84/',0,'591a82c5ad538027f486e665e89637a1',9,1),(85,84,1,1,4,0,0,85,1611581052,66,'components/textmodules/customercenter/buyer_approval_request_entry_page','/1/60/62/66/85/',0,'5e972ecfb2ae55decece9b32865acf5b',9,1),(86,85,1,1,4,0,0,86,1611581052,66,'components/textmodules/customercenter/email_request_new_user','/1/60/62/66/86/',0,'aa299628b52a00dc9383b7e678b9f756',9,1),(87,86,1,1,4,0,0,87,1611581052,66,'components/textmodules/customercenter/success_message_edit_user','/1/60/62/66/87/',0,'6bfd5caf223679a877cb7ce80eecc88f',9,1),(88,87,1,1,4,0,0,88,1611581052,66,'components/textmodules/customercenter/success_message_add_erp_user_to_the_shop','/1/60/62/66/88/',0,'bfa145525c7712b322a764617d0b2be2',9,1),(89,88,1,1,4,0,0,89,1611581052,66,'components/textmodules/customercenter/success_message_request_new_user','/1/60/62/66/89/',0,'4ddd4a413edb28c1414d1a0a80c19887',9,1),(90,89,1,1,4,0,0,90,1611581052,66,'components/textmodules/customercenter/error_message_forms','/1/60/62/66/90/',0,'0cf5c90d55e2afd93a90c74f6390bb53',9,1),(91,90,1,1,4,0,0,91,1611581053,66,'components/textmodules/customercenter/customercenter_contacts_from_erp','/1/60/62/66/91/',0,'dfd143c6ec731e0ac882ae39f3d24775',9,1),(92,91,1,1,4,0,0,92,1611581053,66,'components/textmodules/customercenter/customercenter_introtext','/1/60/62/66/92/',0,'a16d134af3c619304a78c22a4f60f213',9,1),(93,92,1,1,4,0,0,93,1611581053,66,'components/textmodules/customercenter/request_new_user_tooltip','/1/60/62/66/93/',0,'fc33108cd8c67d804f7beea547d4602b',9,1),(94,93,1,1,4,0,0,94,1611581053,67,'components/textmodules/email/email_cancellation_policies','/1/60/62/67/94/',0,'b23780dc639796dbfb097b430bc927a5',9,1),(95,94,1,1,4,0,0,95,1611581054,67,'components/textmodules/email/email_footer','/1/60/62/67/95/',0,'a70bfa13c10681fddcddb6183b5ba3e8',9,1),(96,95,1,1,4,0,0,96,1611581054,67,'components/textmodules/email/email_intro_text_shop_owner','/1/60/62/67/96/',0,'b7a940197d463d3df655542012095835',9,1),(97,96,1,1,4,0,0,97,1611581054,67,'components/textmodules/email/email_header_address_invoice_text','/1/60/62/67/97/',0,'3866a7ed0f802a36d86f180eea47c1ef',9,1),(98,97,1,1,4,0,0,98,1611581054,67,'components/textmodules/email/email_payment_method_invoice_text','/1/60/62/67/98/',0,'75daf9a0061500d941a3b3e7eb68379c',9,1),(99,98,1,1,4,0,0,99,1611581054,67,'components/textmodules/email/email_invoice_left_footer','/1/60/62/67/99/',0,'c6a3961017a32ca161a35c95f558dc4e',9,1),(100,99,1,1,4,0,0,100,1611581055,67,'components/textmodules/email/email_invoice_right_footer','/1/60/62/67/100/',0,'9acd939cee17e657b0b4bdc637832f8d',9,1),(101,100,1,1,4,0,0,101,1611581055,67,'components/textmodules/email/introduction_text_newsletter','/1/60/62/67/101/',0,'f5c54905eb923e8682e532e8220289d9',9,1),(102,101,1,1,4,0,0,102,1611581055,68,'components/textmodules/footer/footer_address','/1/60/62/68/102/',0,'b73e06b38d533431edfa2950852f2c64',9,1),(103,102,1,1,4,0,0,103,1611581055,68,'components/textmodules/footer/footer_block_company','/1/60/62/68/103/',0,'be03365f72374260d5702bb5a9512b54',9,1),(104,103,1,1,4,0,0,104,1611581055,68,'components/textmodules/footer/footer_block_ordering','/1/60/62/68/104/',0,'fc43ede4a9cfb043cab28d4d0131a341',9,1),(105,104,1,1,4,0,0,105,1611581056,68,'components/textmodules/footer/footer_block_service','/1/60/62/68/105/',0,'e9e98a0b76d608a94e7496cd886ece0e',9,1),(106,105,1,1,4,0,0,106,1611581056,69,'components/textmodules/forms/quickorder_introtext','/1/60/62/69/106/',0,'a9e885dc1d627571475b2ce3fc7fb9be',9,1),(107,106,1,1,4,0,0,107,1611581056,70,'components/textmodules/misc/404_page','/1/60/62/70/107/',0,'7e3c13d39153bd32736cdb0510a736d6',9,1),(108,107,1,1,4,0,0,108,1611581056,70,'components/textmodules/misc/access_denied','/1/60/62/70/108/',0,'1fe2609987e3ad69d6741877f7c75d4e',9,1),(109,108,1,1,4,0,0,109,1611581057,71,'components/textmodules/orderhistory/introtext_orderhistory','/1/60/62/71/109/',0,'c45b5a0e02ca642e706ea0c19ba4dd1b',9,1),(110,109,1,1,4,0,0,110,1611581057,72,'components/textmodules/user/back_to_catalog','/1/60/62/72/110/',0,'fb7b73e08da279805cb43a2aeb67c7cb',9,1),(111,110,1,1,4,0,0,111,1611581057,72,'components/textmodules/user/click_here_to_register_new_user','/1/60/62/72/111/',0,'f4f331f18a9e45cad4c93da923fa576a',9,1),(112,111,1,1,4,0,0,112,1611581057,72,'components/textmodules/user/success_message_password_change','/1/60/62/72/112/',0,'98851aa4be35efef2c821efd30d23887',9,1),(113,112,1,1,4,0,0,113,1611581057,72,'components/textmodules/user/success_message_for_password_request','/1/60/62/72/113/',0,'19ec574f19e9543165cc7fbba3694ff6',9,1),(114,113,1,1,4,0,0,114,1611581058,72,'components/textmodules/user/error_message_password_change','/1/60/62/72/114/',0,'d90b03619607d548fb03fefe705778fa',9,1),(115,114,1,1,4,0,0,115,1611581058,72,'components/textmodules/user/error_message_for_password_reminder','/1/60/62/72/115/',0,'7e22274d90204a9ec6b05be633948892',9,1),(116,115,1,1,4,0,0,116,1611581058,72,'components/textmodules/user/intro_text_edit_buyer','/1/60/62/72/116/',0,'2d80960ba3e208102649d09d6a33e5ff',9,1),(117,116,1,1,4,0,0,117,1611581058,72,'components/textmodules/user/intro_text_edit_my_account','/1/60/62/72/117/',0,'311dcf548a849cd6a1dfc12a796e386a',9,1),(118,117,1,1,4,0,0,118,1611581059,72,'components/textmodules/user/my_profile_information_intro_text','/1/60/62/72/118/',0,'5306ce06efe859ec57bd7a628d326d72',9,1),(119,118,1,1,4,0,0,119,1611581059,72,'components/textmodules/user/registration_error_message','/1/60/62/72/119/',0,'048c079ecffa51c32a48b465b8cc9016',9,1),(120,119,1,1,4,0,0,120,1611581059,72,'components/textmodules/user/success_message_activate_business_customer','/1/60/62/72/120/',0,'c8250a741abd944d09e40f7a5b020566',9,1),(121,120,1,1,4,0,0,121,1611581059,72,'components/textmodules/user/success_message_edit_buyer','/1/60/62/72/121/',0,'71fefb834d35fa209246baecfa15ffe5',9,1),(122,121,1,1,4,0,0,122,1611581059,72,'components/textmodules/user/success_message_edit_invoice','/1/60/62/72/122/',0,'319b03d08984c9431e72cdc486ab6fd6',9,1),(123,122,1,1,4,0,0,123,1611581060,72,'components/textmodules/user/success_message_edit_myaccount','/1/60/62/72/123/',0,'be512cf3465cdd897070bc129b1911ce',9,1),(124,123,1,1,4,0,0,124,1611581060,72,'components/textmodules/user/success_message_registration_business_customer','/1/60/62/72/124/',0,'45dec00e438e4206ca9d3b54501d6858',9,1),(125,124,1,1,4,0,0,125,1611581060,72,'components/textmodules/user/success_message_registration_private_customer','/1/60/62/72/125/',0,'0c3d26dd9884f2b884112719eb9ad2b3',9,1),(126,125,1,3,2,0,0,126,1611581061,2,'node_2/product_catalog','/1/2/126/',1,'e84660f3c55517c73da4eb691269dd6d',1,1),(127,126,1,1,2,0,0,127,1611581061,2,'node_2/terms_conditions','/1/2/127/',1,'bc3727844eed268cfed5c1e7fa815821',1,1),(128,127,1,1,2,0,0,128,1611581062,2,'node_2/data_privacy_regulations','/1/2/128/',1,'d4829fbca0118981002c82bc351e1905',1,1),(129,128,1,1,2,0,0,129,1611581062,2,'node_2/cancellation_policies','/1/2/129/',1,'b821b894c8804aba245ba3d83d89b9b6',1,1),(130,129,1,1,2,0,0,130,1611589692,2,'node_2/all_rides','/1/2/130/',0,'ccc0af02dc3e9ef95d53f9df607db570',1,1),(131,130,1,1,2,0,0,131,1611589692,2,'node_2/points_of_interest','/1/2/131/',0,'8cc74484a471a13c3d2d35c0c882b960',1,1),(132,131,1,1,3,0,0,132,1611589692,130,'node_2/all_rides/finnish_coastline_from_rauma_to_pori','/1/2/130/132/',0,'d743e9660ceb400bcd7b0ca3fb2fc10d',2,0),(133,132,1,1,3,0,0,133,1611589693,130,'node_2/all_rides/baby_tour_of_the_battenkill','/1/2/130/133/',0,'593b8c11b79d7e0147c7aa2309965f67',2,0),(134,133,1,1,3,0,0,134,1611589693,130,'node_2/all_rides/meillonnas_terrain_track','/1/2/130/134/',0,'93bcceb06796d61a52c17929904a1cca',2,0),(135,134,1,1,3,0,0,135,1611589693,130,'node_2/all_rides/rallarvegen_in_norway','/1/2/130/135/',0,'6fa460444e21d0ea8b75b5dc67587fc2',2,0),(136,135,1,1,3,0,0,136,1611589693,130,'node_2/all_rides/lookouts_between_coligny_and_montagna_le_reconduit','/1/2/130/136/',0,'236837562793933c24c2878e172b2c50',2,0),(137,136,1,1,3,0,0,137,1611589694,131,'node_2/points_of_interest/cross_above_tarcia','/1/2/131/137/',0,'7492a09b08d3e1e9a6fef2d044673809',2,0),(138,137,1,1,3,0,0,138,1611589694,131,'node_2/points_of_interest/plateau_de_vergongeat','/1/2/131/138/',0,'2b56603786bc0fc6e084585e616adac1',2,0);
/*!40000 ALTER TABLE `ezcontentobject_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_version`
--

DROP TABLE IF EXISTS `ezcontentobject_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT 0,
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `initial_language_id` bigint(20) NOT NULL DEFAULT 0,
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `version` int(11) NOT NULL DEFAULT 0,
  `workflow_event_pos` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ezcobj_version_status` (`status`),
  KEY `idx_object_version_objver` (`contentobject_id`,`version`),
  KEY `ezcontobj_version_obj_status` (`contentobject_id`,`status`),
  KEY `ezcobj_version_creator_id` (`creator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_version`
--

LOCK TABLES `ezcontentobject_version` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_version` DISABLE KEYS */;
INSERT INTO `ezcontentobject_version` VALUES (4,4,0,14,2,3,0,1,0,1,1),(439,11,1033920737,14,2,3,1033920746,1,0,1,0),(440,12,1033920760,14,2,3,1033920775,1,0,1,0),(441,13,1033920786,14,2,3,1033920794,1,0,1,0),(472,41,1060695450,14,2,3,1060695457,1,0,1,0),(473,42,1072180278,14,2,3,1072180330,1,0,1,0),(474,10,1072180337,14,2,3,1072180405,1,0,2,0),(488,49,1080220181,14,2,3,1080220197,1,0,1,0),(489,50,1080220211,14,2,3,1080220220,1,0,1,0),(490,51,1080220225,14,2,3,1080220233,1,0,1,0),(499,14,1301061783,14,2,3,1301062024,1,0,3,0),(506,1,1448889045,14,2,3,1448889046,1,0,9,0),(512,52,1442481742,14,2,3,1442481743,1,0,1,0),(513,53,1486473143,14,2,3,1486473151,1,0,1,0),(514,54,1537166893,14,2,2,1537166893,1,0,1,0),(515,55,1586855342,14,2,3,1586855342,1,0,1,0),(516,56,1611581046,14,2,3,1611581046,1,0,1,0),(517,57,1611581046,14,2,3,1611581046,1,0,1,0),(518,58,1611581046,14,2,3,1611581046,1,0,1,0),(519,59,1611581049,14,2,3,1611581049,1,0,1,0),(520,60,1611581049,14,2,2,1611581049,1,0,1,0),(521,61,1611581049,14,2,3,1611581049,1,0,1,0),(522,62,1611581049,14,2,3,1611581049,1,0,1,0),(523,63,1611581049,14,2,3,1611581049,1,0,1,0),(524,64,1611581049,14,2,3,1611581049,1,0,1,0),(525,65,1611581049,14,2,3,1611581049,1,0,1,0),(526,66,1611581049,14,2,3,1611581049,1,0,1,0),(527,67,1611581049,14,2,3,1611581049,1,0,1,0),(528,68,1611581049,14,2,3,1611581049,1,0,1,0),(529,69,1611581049,14,2,3,1611581049,1,0,1,0),(530,70,1611581049,14,2,3,1611581049,1,0,1,0),(531,71,1611581049,14,2,3,1611581049,1,0,1,0),(532,72,1611581049,14,2,3,1611581049,1,0,1,0),(533,73,1611581049,14,2,3,1611581049,1,0,1,0),(534,74,1611581049,14,2,3,1611581050,1,0,1,0),(535,75,1611581050,14,2,2,1611581050,1,0,1,0),(536,76,1611581050,14,2,3,1611581050,1,0,1,0),(537,77,1611581050,14,2,3,1611581050,1,0,1,0),(538,78,1611581050,14,2,3,1611581050,1,0,1,0),(539,79,1611581050,14,2,3,1611581051,1,0,1,0),(540,80,1611581051,14,2,3,1611581051,1,0,1,0),(541,81,1611581051,14,2,3,1611581051,1,0,1,0),(542,82,1611581051,14,2,3,1611581051,1,0,1,0),(543,83,1611581051,14,2,3,1611581051,1,0,1,0),(544,84,1611581051,14,2,3,1611581052,1,0,1,0),(545,85,1611581052,14,2,3,1611581052,1,0,1,0),(546,86,1611581052,14,2,3,1611581052,1,0,1,0),(547,87,1611581052,14,2,3,1611581052,1,0,1,0),(548,88,1611581052,14,2,3,1611581052,1,0,1,0),(549,89,1611581052,14,2,3,1611581052,1,0,1,0),(550,90,1611581053,14,2,3,1611581053,1,0,1,0),(551,91,1611581053,14,2,3,1611581053,1,0,1,0),(552,92,1611581053,14,2,3,1611581053,1,0,1,0),(553,93,1611581053,14,2,2,1611581053,1,0,1,0),(554,94,1611581054,14,2,2,1611581054,1,0,1,0),(555,95,1611581054,14,2,2,1611581054,1,0,1,0),(556,96,1611581054,14,2,3,1611581054,1,0,1,0),(557,97,1611581054,14,2,3,1611581054,1,0,1,0),(558,98,1611581054,14,2,3,1611581054,1,0,1,0),(559,99,1611581055,14,2,3,1611581055,1,0,1,0),(560,100,1611581055,14,2,3,1611581055,1,0,1,0),(561,101,1611581055,14,2,3,1611581055,1,0,1,0),(562,102,1611581055,14,2,3,1611581055,1,0,1,0),(563,103,1611581055,14,2,3,1611581055,1,0,1,0),(564,104,1611581056,14,2,3,1611581056,1,0,1,0),(565,105,1611581056,14,2,2,1611581056,1,0,1,0),(566,106,1611581056,14,2,3,1611581056,1,0,1,0),(567,107,1611581056,14,2,3,1611581056,1,0,1,0),(568,108,1611581057,14,2,3,1611581057,1,0,1,0),(569,109,1611581057,14,2,3,1611581057,1,0,1,0),(570,110,1611581057,14,2,2,1611581057,1,0,1,0),(571,111,1611581057,14,2,3,1611581057,1,0,1,0),(572,112,1611581057,14,2,3,1611581057,1,0,1,0),(573,113,1611581058,14,2,3,1611581058,1,0,1,0),(574,114,1611581058,14,2,3,1611581058,1,0,1,0),(575,115,1611581058,14,2,3,1611581058,1,0,1,0),(576,116,1611581058,14,2,3,1611581058,1,0,1,0),(577,117,1611581058,14,2,3,1611581059,1,0,1,0),(578,118,1611581059,14,2,3,1611581059,1,0,1,0),(579,119,1611581059,14,2,3,1611581059,1,0,1,0),(580,120,1611581059,14,2,3,1611581059,1,0,1,0),(581,121,1611581059,14,2,3,1611581059,1,0,1,0),(582,122,1611581059,14,2,3,1611581060,1,0,1,0),(583,123,1611581060,14,2,3,1611581060,1,0,1,0),(584,124,1611581060,14,2,3,1611581060,1,0,1,0),(585,125,1611581061,14,2,2,1611581061,3,0,1,0),(586,125,1611581061,14,2,2,1611581063,3,0,2,0),(587,126,1611581061,14,2,2,1611581061,1,0,1,0),(588,127,1611581062,14,2,2,1611581062,1,0,1,0),(589,128,1611581062,14,2,2,1611581062,1,0,1,0),(590,125,1611581063,10,2,2,1611581063,1,0,3,0),(591,129,1611585378,14,2,3,1611589692,1,0,1,0),(592,130,1611585402,14,2,3,1611589692,1,0,1,0),(593,131,1611585549,14,2,3,1611589692,1,0,1,0),(594,132,1611585550,14,2,3,1611589693,1,0,1,0),(595,133,1611585550,14,2,3,1611589693,1,0,1,0),(596,134,1611585550,14,2,3,1611589693,1,0,1,0),(597,135,1611585550,14,2,3,1611589693,1,0,1,0),(598,136,1611585683,14,2,3,1611589694,1,0,1,0),(599,137,1611585743,14,2,3,1611589694,1,0,1,0);
/*!40000 ALTER TABLE `ezcontentobject_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezdatebasedpublisher_scheduled_entries`
--

DROP TABLE IF EXISTS `ezdatebasedpublisher_scheduled_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezdatebasedpublisher_scheduled_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `version_id` int(11) DEFAULT NULL,
  `version_number` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `action_timestamp` int(11) NOT NULL,
  `action` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `url_root` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_id_version_number_action` (`content_id`,`version_number`,`action`),
  KEY `content_id` (`content_id`),
  KEY `version_id` (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezdatebasedpublisher_scheduled_entries`
--

LOCK TABLES `ezdatebasedpublisher_scheduled_entries` WRITE;
/*!40000 ALTER TABLE `ezdatebasedpublisher_scheduled_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezdatebasedpublisher_scheduled_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezdfsfile`
--

DROP TABLE IF EXISTS `ezdfsfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezdfsfile` (
  `name_hash` varchar(34) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name_trunk` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'application/octet-stream',
  `scope` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `mtime` int(11) NOT NULL DEFAULT 0,
  `expired` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name_hash`),
  KEY `ezdfsfile_name_trunk` (`name_trunk`(191)),
  KEY `ezdfsfile_expired_name` (`expired`,`name`(191)),
  KEY `ezdfsfile_name` (`name`(191)),
  KEY `ezdfsfile_mtime` (`mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezdfsfile`
--

LOCK TABLES `ezdfsfile` WRITE;
/*!40000 ALTER TABLE `ezdfsfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezdfsfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezeditorialworkflow_markings`
--

DROP TABLE IF EXISTS `ezeditorialworkflow_markings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezeditorialworkflow_markings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `result` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_workflow_id_markings` (`workflow_id`),
  CONSTRAINT `fk_ezeditorialworkflow_markings_workflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `ezeditorialworkflow_workflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezeditorialworkflow_markings`
--

LOCK TABLES `ezeditorialworkflow_markings` WRITE;
/*!40000 ALTER TABLE `ezeditorialworkflow_markings` DISABLE KEYS */;
INSERT INTO `ezeditorialworkflow_markings` VALUES (1,1,'draft','',NULL,'[]'),(2,2,'draft','',NULL,'[]'),(3,3,'draft','',NULL,'[]'),(4,4,'draft','',NULL,'[]'),(5,5,'draft','',NULL,'[]'),(6,6,'draft','',NULL,'[]'),(7,7,'draft','',NULL,'[]'),(8,8,'draft','',NULL,'[]'),(9,9,'draft','',NULL,'[]'),(10,10,'draft','',NULL,'[]'),(11,11,'draft','',NULL,'[]'),(12,12,'draft','',NULL,'[]'),(13,13,'draft','',NULL,'[]'),(14,14,'draft','',NULL,'[]'),(15,15,'draft','',NULL,'[]'),(16,16,'draft','',NULL,'[]'),(17,17,'draft','',NULL,'[]'),(18,18,'draft','',NULL,'[]'),(19,19,'draft','',NULL,'[]'),(20,20,'draft','',NULL,'[]'),(21,21,'draft','',NULL,'[]'),(22,22,'draft','',NULL,'[]'),(23,23,'draft','',NULL,'[]'),(24,24,'draft','',NULL,'[]'),(25,25,'draft','',NULL,'[]'),(26,26,'draft','',NULL,'[]'),(27,27,'draft','',NULL,'[]'),(28,28,'draft','',NULL,'[]'),(29,29,'draft','',NULL,'[]'),(30,30,'draft','',NULL,'[]'),(31,31,'draft','',NULL,'[]'),(32,32,'draft','',NULL,'[]'),(33,33,'draft','',NULL,'[]'),(34,34,'draft','',NULL,'[]'),(35,35,'draft','',NULL,'[]'),(36,36,'draft','',NULL,'[]'),(37,37,'draft','',NULL,'[]'),(38,38,'draft','',NULL,'[]'),(39,39,'draft','',NULL,'[]'),(40,40,'draft','',NULL,'[]'),(41,41,'draft','',NULL,'[]'),(42,42,'draft','',NULL,'[]'),(43,43,'draft','',NULL,'[]'),(44,44,'draft','',NULL,'[]'),(45,45,'draft','',NULL,'[]'),(46,46,'draft','',NULL,'[]'),(47,47,'draft','',NULL,'[]'),(48,48,'draft','',NULL,'[]'),(49,49,'draft','',NULL,'[]'),(50,50,'draft','',NULL,'[]'),(51,51,'draft','',NULL,'[]'),(52,52,'draft','',NULL,'[]'),(53,53,'draft','',NULL,'[]'),(54,54,'draft','',NULL,'[]'),(55,55,'draft','',NULL,'[]'),(56,56,'draft','',NULL,'[]'),(57,57,'draft','',NULL,'[]'),(58,58,'draft','',NULL,'[]'),(59,59,'draft','',NULL,'[]'),(60,60,'draft','',NULL,'[]'),(61,61,'draft','',NULL,'[]'),(62,62,'draft','',NULL,'[]'),(63,63,'draft','',NULL,'[]'),(64,64,'draft','',NULL,'[]'),(65,65,'draft','',NULL,'[]'),(66,66,'draft','',NULL,'[]'),(67,67,'draft','',NULL,'[]'),(68,68,'draft','',NULL,'[]'),(69,69,'draft','',NULL,'[]'),(70,70,'draft','',NULL,'[]'),(71,71,'draft','',NULL,'[]'),(72,72,'draft','',NULL,'[]'),(73,73,'draft','',NULL,'[]'),(74,74,'draft','',NULL,'[]'),(75,75,'draft','',NULL,'[]'),(76,76,'draft','',NULL,'[]'),(77,77,'draft','',NULL,'[]'),(78,78,'draft','',NULL,'[]'),(79,79,'draft','',NULL,'[]');
/*!40000 ALTER TABLE `ezeditorialworkflow_markings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezeditorialworkflow_transitions`
--

DROP TABLE IF EXISTS `ezeditorialworkflow_transitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezeditorialworkflow_transitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_workflow_id_transitions` (`workflow_id`),
  CONSTRAINT `fk_ezeditorialworkflow_transitions_workflow_id` FOREIGN KEY (`workflow_id`) REFERENCES `ezeditorialworkflow_workflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezeditorialworkflow_transitions`
--

LOCK TABLES `ezeditorialworkflow_transitions` WRITE;
/*!40000 ALTER TABLE `ezeditorialworkflow_transitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezeditorialworkflow_transitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezeditorialworkflow_workflows`
--

DROP TABLE IF EXISTS `ezeditorialworkflow_workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezeditorialworkflow_workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `version_no` int(11) NOT NULL,
  `workflow_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `initial_owner_id` int(11) DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_workflow_id` (`id`),
  KEY `initial_owner_id` (`initial_owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezeditorialworkflow_workflows`
--

LOCK TABLES `ezeditorialworkflow_workflows` WRITE;
/*!40000 ALTER TABLE `ezeditorialworkflow_workflows` DISABLE KEYS */;
INSERT INTO `ezeditorialworkflow_workflows` VALUES (1,59,1,'quick_review',14,1611581049),(2,60,1,'quick_review',14,1611581049),(3,61,1,'quick_review',14,1611581049),(4,62,1,'quick_review',14,1611581049),(5,63,1,'quick_review',14,1611581049),(6,64,1,'quick_review',14,1611581049),(7,65,1,'quick_review',14,1611581049),(8,66,1,'quick_review',14,1611581049),(9,67,1,'quick_review',14,1611581049),(10,68,1,'quick_review',14,1611581049),(11,69,1,'quick_review',14,1611581049),(12,70,1,'quick_review',14,1611581049),(13,71,1,'quick_review',14,1611581049),(14,72,1,'quick_review',14,1611581049),(15,73,1,'quick_review',14,1611581049),(16,74,1,'quick_review',14,1611581049),(17,75,1,'quick_review',14,1611581050),(18,76,1,'quick_review',14,1611581050),(19,77,1,'quick_review',14,1611581050),(20,78,1,'quick_review',14,1611581050),(21,79,1,'quick_review',14,1611581050),(22,80,1,'quick_review',14,1611581051),(23,81,1,'quick_review',14,1611581051),(24,82,1,'quick_review',14,1611581051),(25,83,1,'quick_review',14,1611581051),(26,84,1,'quick_review',14,1611581051),(27,85,1,'quick_review',14,1611581052),(28,86,1,'quick_review',14,1611581052),(29,87,1,'quick_review',14,1611581052),(30,88,1,'quick_review',14,1611581052),(31,89,1,'quick_review',14,1611581052),(32,90,1,'quick_review',14,1611581053),(33,91,1,'quick_review',14,1611581053),(34,92,1,'quick_review',14,1611581053),(35,93,1,'quick_review',14,1611581053),(36,94,1,'quick_review',14,1611581054),(37,95,1,'quick_review',14,1611581054),(38,96,1,'quick_review',14,1611581054),(39,97,1,'quick_review',14,1611581054),(40,98,1,'quick_review',14,1611581054),(41,99,1,'quick_review',14,1611581055),(42,100,1,'quick_review',14,1611581055),(43,101,1,'quick_review',14,1611581055),(44,102,1,'quick_review',14,1611581055),(45,103,1,'quick_review',14,1611581055),(46,104,1,'quick_review',14,1611581056),(47,105,1,'quick_review',14,1611581056),(48,106,1,'quick_review',14,1611581056),(49,107,1,'quick_review',14,1611581056),(50,108,1,'quick_review',14,1611581057),(51,109,1,'quick_review',14,1611581057),(52,110,1,'quick_review',14,1611581057),(53,111,1,'quick_review',14,1611581057),(54,112,1,'quick_review',14,1611581057),(55,113,1,'quick_review',14,1611581058),(56,114,1,'quick_review',14,1611581058),(57,115,1,'quick_review',14,1611581058),(58,116,1,'quick_review',14,1611581058),(59,117,1,'quick_review',14,1611581058),(60,118,1,'quick_review',14,1611581059),(61,119,1,'quick_review',14,1611581059),(62,120,1,'quick_review',14,1611581059),(63,121,1,'quick_review',14,1611581059),(64,122,1,'quick_review',14,1611581059),(65,123,1,'quick_review',14,1611581060),(66,124,1,'quick_review',14,1611581060),(67,125,1,'quick_review',14,1611581061),(68,126,1,'quick_review',14,1611581061),(69,127,1,'quick_review',14,1611581062),(70,128,1,'quick_review',14,1611581062),(71,129,1,'quick_review',14,1611589692),(72,130,1,'quick_review',14,1611589692),(73,131,1,'quick_review',14,1611589692),(74,132,1,'quick_review',14,1611589692),(75,133,1,'quick_review',14,1611589693),(76,134,1,'quick_review',14,1611589693),(77,135,1,'quick_review',14,1611589693),(78,136,1,'quick_review',14,1611589694),(79,137,1,'quick_review',14,1611589694);
/*!40000 ALTER TABLE `ezeditorialworkflow_workflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_field_attributes`
--

DROP TABLE IF EXISTS `ezform_field_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_field_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_field_attributes`
--

LOCK TABLES `ezform_field_attributes` WRITE;
/*!40000 ALTER TABLE `ezform_field_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_field_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_field_validators`
--

DROP TABLE IF EXISTS `ezform_field_validators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_field_validators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_field_validators`
--

LOCK TABLES `ezform_field_validators` WRITE;
/*!40000 ALTER TABLE `ezform_field_validators` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_field_validators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_fields`
--

DROP TABLE IF EXISTS `ezform_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_fields`
--

LOCK TABLES `ezform_fields` WRITE;
/*!40000 ALTER TABLE `ezform_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_form_submission_data`
--

DROP TABLE IF EXISTS `ezform_form_submission_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_form_submission_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_submission_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_form_submission_data`
--

LOCK TABLES `ezform_form_submission_data` WRITE;
/*!40000 ALTER TABLE `ezform_form_submission_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_form_submission_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_form_submissions`
--

DROP TABLE IF EXISTS `ezform_form_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_form_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `language_code` varchar(6) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_form_submissions`
--

LOCK TABLES `ezform_form_submissions` WRITE;
/*!40000 ALTER TABLE `ezform_form_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_form_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezform_forms`
--

DROP TABLE IF EXISTS `ezform_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezform_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  `content_field_id` int(11) DEFAULT NULL,
  `language_code` varchar(16) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezform_forms`
--

LOCK TABLES `ezform_forms` WRITE;
/*!40000 ALTER TABLE `ezform_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezform_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezgmaplocation`
--

DROP TABLE IF EXISTS `ezgmaplocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezgmaplocation` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_version` int(11) NOT NULL DEFAULT 0,
  `latitude` double NOT NULL DEFAULT 0,
  `longitude` double NOT NULL DEFAULT 0,
  `address` varchar(150) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`contentobject_attribute_id`,`contentobject_version`),
  KEY `latitude_longitude_key` (`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezgmaplocation`
--

LOCK TABLES `ezgmaplocation` WRITE;
/*!40000 ALTER TABLE `ezgmaplocation` DISABLE KEYS */;
INSERT INTO `ezgmaplocation` VALUES (621,1,61.130885,21.505926,'Rauma, Finland'),(622,1,61.485139,21.797418,'Pori, Finland'),(629,1,43.100076,-73.581783,'Schuylerville, NY, USA'),(630,1,43.090319,-73.34293,'Shushan, NY, USA'),(637,1,46.245743,5.351351,'Meillonnas, France'),(638,1,46.323672,5.385258,'Pressiat, France'),(645,1,60.51199,7.863081,'Haugastøl, Hol, Norway'),(646,1,60.605074,7.504649,'Finse, Ulvik, Norway'),(653,1,46.382954,5.346038,'Coligny, France'),(654,1,46.458554,5.388351,'Montagna-le-Reconduit, France'),(661,1,46.384895,5.404414,'Tarcia');
/*!40000 ALTER TABLE `ezgmaplocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezimagefile`
--

DROP TABLE IF EXISTS `ezimagefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezimagefile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `filepath` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ezimagefile_file` (`filepath`(191)),
  KEY `ezimagefile_coid` (`contentobject_attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezimagefile`
--

LOCK TABLES `ezimagefile` WRITE;
/*!40000 ALTER TABLE `ezimagefile` DISABLE KEYS */;
INSERT INTO `ezimagefile` VALUES (1,618,'var/site/storage/images/8/1/6/0/618-1-eng-GB/saaristo.jpg'),(2,626,'var/site/storage/images/6/2/6/0/626-1-eng-GB/battenkill.jpg'),(3,634,'var/site/storage/images/4/3/6/0/634-1-eng-GB/cabatane_full.jpg'),(4,642,'var/site/storage/images/2/4/6/0/642-1-eng-GB/rallarvagen.jpg'),(5,650,'var/site/storage/images/0/5/6/0/650-1-eng-GB/default_ride.jpg'),(6,659,'var/site/storage/images/9/5/6/0/659-1-eng-GB/cross-tarcia.jpg'),(7,664,'var/site/storage/images/4/6/6/0/664-1-eng-GB/vergongeat_full.jpg');
/*!40000 ALTER TABLE `ezimagefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezkeyword`
--

DROP TABLE IF EXISTS `ezkeyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezkeyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL DEFAULT 0,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezkeyword_keyword` (`keyword`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezkeyword`
--

LOCK TABLES `ezkeyword` WRITE;
/*!40000 ALTER TABLE `ezkeyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezkeyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezkeyword_attribute_link`
--

DROP TABLE IF EXISTS `ezkeyword_attribute_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezkeyword_attribute_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) NOT NULL DEFAULT 0,
  `objectattribute_id` int(11) NOT NULL DEFAULT 0,
  `version` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ezkeyword_attr_link_oaid` (`objectattribute_id`),
  KEY `ezkeyword_attr_link_kid_oaid` (`keyword_id`,`objectattribute_id`),
  KEY `ezkeyword_attr_link_oaid_ver` (`objectattribute_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezkeyword_attribute_link`
--

LOCK TABLES `ezkeyword_attribute_link` WRITE;
/*!40000 ALTER TABLE `ezkeyword_attribute_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezkeyword_attribute_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezmedia`
--

DROP TABLE IF EXISTS `ezmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezmedia` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `version` int(11) NOT NULL DEFAULT 0,
  `controls` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `has_controller` int(11) DEFAULT 0,
  `height` int(11) DEFAULT NULL,
  `is_autoplay` int(11) DEFAULT 0,
  `is_loop` int(11) DEFAULT 0,
  `mime_type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `original_filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `pluginspage` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `quality` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentobject_attribute_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezmedia`
--

LOCK TABLES `ezmedia` WRITE;
/*!40000 ALTER TABLE `ezmedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eznode_assignment`
--

DROP TABLE IF EXISTS `eznode_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eznode_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `from_node_id` int(11) DEFAULT 0,
  `is_main` int(11) NOT NULL DEFAULT 0,
  `op_code` int(11) NOT NULL DEFAULT 0,
  `parent_node` int(11) DEFAULT NULL,
  `parent_remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `remote_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `sort_field` int(11) DEFAULT 1,
  `sort_order` int(11) DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 0,
  `is_hidden` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `eznode_assignment_is_main` (`is_main`),
  KEY `eznode_assignment_coid_cov` (`contentobject_id`,`contentobject_version`),
  KEY `eznode_assignment_parent_node` (`parent_node`),
  KEY `eznode_assignment_co_version` (`contentobject_version`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eznode_assignment`
--

LOCK TABLES `eznode_assignment` WRITE;
/*!40000 ALTER TABLE `eznode_assignment` DISABLE KEYS */;
INSERT INTO `eznode_assignment` VALUES (4,8,2,0,1,2,5,'','0',1,1,0,0),(5,42,1,0,1,2,5,'','0',9,1,0,0),(6,10,2,-1,1,2,44,'','0',9,1,0,0),(7,4,1,0,1,2,1,'','0',1,1,0,0),(8,12,1,0,1,2,5,'','0',1,1,0,0),(9,13,1,0,1,2,5,'','0',1,1,0,0),(11,41,1,0,1,2,1,'','0',1,1,0,0),(12,11,1,0,1,2,5,'','0',1,1,0,0),(27,49,1,0,1,2,43,'','0',9,1,0,0),(28,50,1,0,1,2,43,'','0',9,1,0,0),(29,51,1,0,1,2,43,'','0',9,1,0,0),(38,14,3,-1,1,2,13,'','0',1,1,0,0),(40,53,1,0,1,2,52,'0543630fa051a1e2be54dbd32da2420f','0',1,1,0,0),(41,54,1,0,1,2,2,'1dad43be47e3a5c12cd06010aab65112','0',9,1,0,0),(42,55,1,0,1,2,2,'9658f6deaeef9fc27300df5d5f566b37','0',9,1,0,0),(43,56,1,0,1,2,5,'cbb0fd0d1e9cd96b24d94e713bdb6d9a','0',1,1,0,0),(44,57,1,0,1,2,57,'d7b91720f00df1843b3670779c113f60','0',1,1,0,0),(45,58,1,0,1,2,57,'fe6e47f3c40fe8360c606520a6d12388','0',1,1,0,0),(46,59,1,0,1,2,1,'f0bd28dd963104810feac295aef30491','0',9,1,0,0),(47,60,1,0,1,2,60,'f6c54226f2d14403c0b5fa714635bde6','0',9,1,0,0),(48,61,1,0,1,2,60,'51d6eb1e0bc72d3f0af9f511f8f31f20','0',9,1,0,0),(49,62,1,0,1,2,62,'890ae437af69bd7d6115fcb5c78bbc6c','0',9,1,0,0),(50,63,1,0,1,2,62,'3a31c8cc7b2e65b0654c64da6f94168a','0',9,1,0,0),(51,64,1,0,1,2,62,'385a63bbd0d1882dfe2d64afca30e547','0',9,1,0,0),(52,65,1,0,1,2,62,'41363dbe46a60fa4e44218f6ee967be2','0',9,1,0,0),(53,66,1,0,1,2,62,'18531efcf8e6ff2282528d08e9e222c4','0',9,1,0,0),(54,67,1,0,1,2,62,'e7566528dc68091141082ec94f6d6f84','0',9,1,0,0),(55,68,1,0,1,2,62,'11abfff2d8f039d9785bf1cf39fba731','0',9,1,0,0),(56,69,1,0,1,2,62,'0cc7c0647f5bf25d0b1c54184abbd65c','0',9,1,0,0),(57,70,1,0,1,2,62,'810332c889956a484e4978383fb0a044','0',9,1,0,0),(58,71,1,0,1,2,62,'e7d8719c8526c4c301a9feb8ff290519','0',9,1,0,0),(59,72,1,0,1,2,63,'fd7d6a64aa5673772d57a5afa0b116f6','0',9,1,0,0),(60,73,1,0,1,2,63,'08fce27338b85cc29ed5d08ef994c00f','0',9,1,0,0),(61,74,1,0,1,2,64,'be6f7d6e3a45faac744da65cb8491c41','0',9,1,0,0),(62,75,1,0,1,2,64,'53ada457ed43f74e448041fa96047bc5','0',9,1,0,0),(63,76,1,0,1,2,64,'cd5f0b33c88184ccd4deb0d055c379f0','0',9,1,0,0),(64,77,1,0,1,2,64,'98ebe6b62ee60c69be4f43dedabdb675','0',9,1,0,0),(65,78,1,0,1,2,64,'038e33e3967465ba3cd2d0409579f61a','0',9,1,0,0),(66,79,1,0,1,2,65,'e1e4621fb84ae8cd63dd1a4cc8a9d43b','0',9,1,0,0),(67,80,1,0,1,2,65,'da3a40083fd84a1ffb0f5d2130348433','0',9,1,0,0),(68,81,1,0,1,2,66,'bf954d8b646a6c93edf364f39b25d460','0',9,1,0,0),(69,82,1,0,1,2,66,'0571281792cd328f38aa6b027da55097','0',9,1,0,0),(70,83,1,0,1,2,66,'591a82c5ad538027f486e665e89637a1','0',9,1,0,0),(71,84,1,0,1,2,66,'5e972ecfb2ae55decece9b32865acf5b','0',9,1,0,0),(72,85,1,0,1,2,66,'aa299628b52a00dc9383b7e678b9f756','0',9,1,0,0),(73,86,1,0,1,2,66,'6bfd5caf223679a877cb7ce80eecc88f','0',9,1,0,0),(74,87,1,0,1,2,66,'bfa145525c7712b322a764617d0b2be2','0',9,1,0,0),(75,88,1,0,1,2,66,'4ddd4a413edb28c1414d1a0a80c19887','0',9,1,0,0),(76,89,1,0,1,2,66,'0cf5c90d55e2afd93a90c74f6390bb53','0',9,1,0,0),(77,90,1,0,1,2,66,'dfd143c6ec731e0ac882ae39f3d24775','0',9,1,0,0),(78,91,1,0,1,2,66,'a16d134af3c619304a78c22a4f60f213','0',9,1,0,0),(79,92,1,0,1,2,66,'fc33108cd8c67d804f7beea547d4602b','0',9,1,0,0),(80,93,1,0,1,2,67,'b23780dc639796dbfb097b430bc927a5','0',9,1,0,0),(81,94,1,0,1,2,67,'a70bfa13c10681fddcddb6183b5ba3e8','0',9,1,0,0),(82,95,1,0,1,2,67,'b7a940197d463d3df655542012095835','0',9,1,0,0),(83,96,1,0,1,2,67,'3866a7ed0f802a36d86f180eea47c1ef','0',9,1,0,0),(84,97,1,0,1,2,67,'75daf9a0061500d941a3b3e7eb68379c','0',9,1,0,0),(85,98,1,0,1,2,67,'c6a3961017a32ca161a35c95f558dc4e','0',9,1,0,0),(86,99,1,0,1,2,67,'9acd939cee17e657b0b4bdc637832f8d','0',9,1,0,0),(87,100,1,0,1,2,67,'f5c54905eb923e8682e532e8220289d9','0',9,1,0,0),(88,101,1,0,1,2,68,'b73e06b38d533431edfa2950852f2c64','0',9,1,0,0),(89,102,1,0,1,2,68,'be03365f72374260d5702bb5a9512b54','0',9,1,0,0),(90,103,1,0,1,2,68,'fc43ede4a9cfb043cab28d4d0131a341','0',9,1,0,0),(91,104,1,0,1,2,68,'e9e98a0b76d608a94e7496cd886ece0e','0',9,1,0,0),(92,105,1,0,1,2,69,'a9e885dc1d627571475b2ce3fc7fb9be','0',9,1,0,0),(93,106,1,0,1,2,70,'7e3c13d39153bd32736cdb0510a736d6','0',9,1,0,0),(94,107,1,0,1,2,70,'1fe2609987e3ad69d6741877f7c75d4e','0',9,1,0,0),(95,108,1,0,1,2,71,'c45b5a0e02ca642e706ea0c19ba4dd1b','0',9,1,0,0),(96,109,1,0,1,2,72,'fb7b73e08da279805cb43a2aeb67c7cb','0',9,1,0,0),(97,110,1,0,1,2,72,'f4f331f18a9e45cad4c93da923fa576a','0',9,1,0,0),(98,111,1,0,1,2,72,'98851aa4be35efef2c821efd30d23887','0',9,1,0,0),(99,112,1,0,1,2,72,'19ec574f19e9543165cc7fbba3694ff6','0',9,1,0,0),(100,113,1,0,1,2,72,'d90b03619607d548fb03fefe705778fa','0',9,1,0,0),(101,114,1,0,1,2,72,'7e22274d90204a9ec6b05be633948892','0',9,1,0,0),(102,115,1,0,1,2,72,'2d80960ba3e208102649d09d6a33e5ff','0',9,1,0,0),(103,116,1,0,1,2,72,'311dcf548a849cd6a1dfc12a796e386a','0',9,1,0,0),(104,117,1,0,1,2,72,'5306ce06efe859ec57bd7a628d326d72','0',9,1,0,0),(105,118,1,0,1,2,72,'048c079ecffa51c32a48b465b8cc9016','0',9,1,0,0),(106,119,1,0,1,2,72,'c8250a741abd944d09e40f7a5b020566','0',9,1,0,0),(107,120,1,0,1,2,72,'71fefb834d35fa209246baecfa15ffe5','0',9,1,0,0),(108,121,1,0,1,2,72,'319b03d08984c9431e72cdc486ab6fd6','0',9,1,0,0),(109,122,1,0,1,2,72,'be512cf3465cdd897070bc129b1911ce','0',9,1,0,0),(110,123,1,0,1,2,72,'45dec00e438e4206ca9d3b54501d6858','0',9,1,0,0),(111,124,1,0,1,2,72,'0c3d26dd9884f2b884112719eb9ad2b3','0',9,1,0,0),(112,125,1,0,1,2,2,'e84660f3c55517c73da4eb691269dd6d','0',1,1,1,0),(113,126,1,0,1,2,2,'bc3727844eed268cfed5c1e7fa815821','0',1,1,1,0),(114,127,1,0,1,2,2,'d4829fbca0118981002c82bc351e1905','0',1,1,1,0),(115,128,1,0,1,2,2,'b821b894c8804aba245ba3d83d89b9b6','0',1,1,1,0),(116,129,1,0,1,2,2,'ccc0af02dc3e9ef95d53f9df607db570','0',1,1,0,0),(117,130,1,0,1,2,2,'8cc74484a471a13c3d2d35c0c882b960','0',1,1,0,0),(118,131,1,0,1,2,130,'d743e9660ceb400bcd7b0ca3fb2fc10d','0',2,0,0,0),(119,132,1,0,1,2,130,'593b8c11b79d7e0147c7aa2309965f67','0',2,0,0,0),(120,133,1,0,1,2,130,'93bcceb06796d61a52c17929904a1cca','0',2,0,0,0),(121,134,1,0,1,2,130,'6fa460444e21d0ea8b75b5dc67587fc2','0',2,0,0,0),(122,135,1,0,1,2,130,'236837562793933c24c2878e172b2c50','0',2,0,0,0),(123,136,1,0,1,2,131,'7492a09b08d3e1e9a6fef2d044673809','0',2,0,0,0),(124,137,1,0,1,2,131,'2b56603786bc0fc6e084585e616adac1','0',2,0,0,0);
/*!40000 ALTER TABLE `eznode_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eznotification`
--

DROP TABLE IF EXISTS `eznotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eznotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `is_pending` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT 0,
  `data` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eznotification_owner_is_pending` (`owner_id`,`is_pending`),
  KEY `eznotification_owner` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eznotification`
--

LOCK TABLES `eznotification` WRITE;
/*!40000 ALTER TABLE `eznotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `eznotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpackage`
--

DROP TABLE IF EXISTS `ezpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpackage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `install_date` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `version` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpackage`
--

LOCK TABLES `ezpackage` WRITE;
/*!40000 ALTER TABLE `ezpackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_attributes`
--

DROP TABLE IF EXISTS `ezpage_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_attributes`
--

LOCK TABLES `ezpage_attributes` WRITE;
/*!40000 ALTER TABLE `ezpage_attributes` DISABLE KEYS */;
INSERT INTO `ezpage_attributes` VALUES (1,'content','<p>This is the clean installation coming with Ibexa Digital Experience Platform.<br>It\'s a bare-bones setup of the Platform, an excellent foundation to build upon if you want to start your project from scratch.</p>');
/*!40000 ALTER TABLE `ezpage_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_blocks`
--

DROP TABLE IF EXISTS `ezpage_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `view` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_blocks`
--

LOCK TABLES `ezpage_blocks` WRITE;
/*!40000 ALTER TABLE `ezpage_blocks` DISABLE KEYS */;
INSERT INTO `ezpage_blocks` VALUES (1,'tag','default','Tag');
/*!40000 ALTER TABLE `ezpage_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_blocks_design`
--

DROP TABLE IF EXISTS `ezpage_blocks_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_blocks_design` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `style` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `compiled` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpage_blocks_design_block_id` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_blocks_design`
--

LOCK TABLES `ezpage_blocks_design` WRITE;
/*!40000 ALTER TABLE `ezpage_blocks_design` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpage_blocks_design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_blocks_visibility`
--

DROP TABLE IF EXISTS `ezpage_blocks_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_blocks_visibility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `since` int(11) DEFAULT NULL,
  `till` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpage_blocks_visibility_block_id` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_blocks_visibility`
--

LOCK TABLES `ezpage_blocks_visibility` WRITE;
/*!40000 ALTER TABLE `ezpage_blocks_visibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpage_blocks_visibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_map_attributes_blocks`
--

DROP TABLE IF EXISTS `ezpage_map_attributes_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_map_attributes_blocks` (
  `attribute_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_id`,`block_id`),
  KEY `ezpage_map_attributes_blocks_attribute_id` (`attribute_id`),
  KEY `ezpage_map_attributes_blocks_block_id` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_map_attributes_blocks`
--

LOCK TABLES `ezpage_map_attributes_blocks` WRITE;
/*!40000 ALTER TABLE `ezpage_map_attributes_blocks` DISABLE KEYS */;
INSERT INTO `ezpage_map_attributes_blocks` VALUES (1,1);
/*!40000 ALTER TABLE `ezpage_map_attributes_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_map_blocks_zones`
--

DROP TABLE IF EXISTS `ezpage_map_blocks_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_map_blocks_zones` (
  `block_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  PRIMARY KEY (`block_id`,`zone_id`),
  KEY `ezpage_map_blocks_zones_block_id` (`block_id`),
  KEY `ezpage_map_blocks_zones_zone_id` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_map_blocks_zones`
--

LOCK TABLES `ezpage_map_blocks_zones` WRITE;
/*!40000 ALTER TABLE `ezpage_map_blocks_zones` DISABLE KEYS */;
INSERT INTO `ezpage_map_blocks_zones` VALUES (1,1);
/*!40000 ALTER TABLE `ezpage_map_blocks_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_map_zones_pages`
--

DROP TABLE IF EXISTS `ezpage_map_zones_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_map_zones_pages` (
  `zone_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`zone_id`,`page_id`),
  KEY `ezpage_map_zones_pages_zone_id` (`zone_id`),
  KEY `ezpage_map_zones_pages_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_map_zones_pages`
--

LOCK TABLES `ezpage_map_zones_pages` WRITE;
/*!40000 ALTER TABLE `ezpage_map_zones_pages` DISABLE KEYS */;
INSERT INTO `ezpage_map_zones_pages` VALUES (1,1);
/*!40000 ALTER TABLE `ezpage_map_zones_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_pages`
--

DROP TABLE IF EXISTS `ezpage_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_no` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `language_code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `layout` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezpage_pages_content_id_version_no` (`content_id`,`version_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_pages`
--

LOCK TABLES `ezpage_pages` WRITE;
/*!40000 ALTER TABLE `ezpage_pages` DISABLE KEYS */;
INSERT INTO `ezpage_pages` VALUES (1,1,52,'eng-GB','default');
/*!40000 ALTER TABLE `ezpage_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpage_zones`
--

DROP TABLE IF EXISTS `ezpage_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpage_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpage_zones`
--

LOCK TABLES `ezpage_zones` WRITE;
/*!40000 ALTER TABLE `ezpage_zones` DISABLE KEYS */;
INSERT INTO `ezpage_zones` VALUES (1,'default');
/*!40000 ALTER TABLE `ezpage_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpolicy`
--

DROP TABLE IF EXISTS `ezpolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `module_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `original_id` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpolicy_role_id` (`role_id`),
  KEY `ezpolicy_original_id` (`original_id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy`
--

LOCK TABLES `ezpolicy` WRITE;
/*!40000 ALTER TABLE `ezpolicy` DISABLE KEYS */;
INSERT INTO `ezpolicy` VALUES (317,'*','content',0,3),(319,'login','user',0,3),(328,'read','content',0,1),(331,'login','user',0,1),(332,'*','*',0,2),(334,'view_embed','content',0,1),(340,'*','url',0,3),(356,'read','content',0,5),(357,'login','user',0,5),(358,'read_basket','siso_policy',0,5),(359,'write_basket','siso_policy',0,5),(360,'see_product_price','siso_policy',0,5),(361,'quickorder','siso_policy',0,5),(362,'checkout','siso_policy',0,12),(373,'edit_invoice','siso_policy',0,14),(374,'forms_profile_edit','siso_policy',0,14),(375,'order_list','siso_policy',0,14),(376,'edit_delivery','siso_policy',0,14),(377,'read','content',0,14),(378,'read','content',333,20),(395,'read','content',0,4),(396,'login','user',0,4),(397,'read_basket','siso_policy',0,4),(398,'write_basket','siso_policy',0,4),(399,'see_product_price','siso_policy',0,4),(400,'quickorder','siso_policy',0,4);
/*!40000 ALTER TABLE `ezpolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpolicy_limitation`
--

DROP TABLE IF EXISTS `ezpolicy_limitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy_limitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `policy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policy_id` (`policy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy_limitation`
--

LOCK TABLES `ezpolicy_limitation` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation` DISABLE KEYS */;
INSERT INTO `ezpolicy_limitation` VALUES (251,'Section',328),(252,'Section',329),(253,'SiteAccess',331),(256,'Class',334),(271,'Class',356),(272,'Section',356),(273,'SiteAccess',357),(274,'Owner',377),(275,'Class',378),(276,'Owner',378),(293,'Class',395),(294,'Section',395),(295,'SiteAccess',396);
/*!40000 ALTER TABLE `ezpolicy_limitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpolicy_limitation_value`
--

DROP TABLE IF EXISTS `ezpolicy_limitation_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy_limitation_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limitation_id` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpolicy_limit_value_limit_id` (`limitation_id`),
  KEY `ezpolicy_limitation_value_val` (`value`(191))
) ENGINE=InnoDB AUTO_INCREMENT=651 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy_limitation_value`
--

LOCK TABLES `ezpolicy_limitation_value` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation_value` DISABLE KEYS */;
INSERT INTO `ezpolicy_limitation_value` VALUES (477,251,'1'),(478,252,'1'),(479,253,'1766001124'),(482,256,'5'),(483,256,'12'),(484,251,'3'),(485,251,'6'),(550,271,'2'),(551,271,'12'),(552,271,'1'),(553,271,'5'),(554,271,'45'),(555,271,'46'),(556,271,'47'),(557,271,'49'),(558,271,'50'),(559,272,'8'),(560,272,'3'),(561,272,'1'),(562,273,'1766001124'),(563,274,'1'),(564,275,'4'),(565,276,'1'),(637,293,'2'),(638,293,'12'),(639,293,'1'),(640,293,'5'),(641,293,'42'),(642,293,'45'),(643,293,'46'),(644,293,'47'),(645,293,'49'),(646,293,'50'),(647,294,'8'),(648,294,'3'),(649,294,'1'),(650,295,'1766001124');
/*!40000 ALTER TABLE `ezpolicy_limitation_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpreferences`
--

DROP TABLE IF EXISTS `ezpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpreferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpreferences_user_id_idx` (`user_id`,`name`),
  KEY `ezpreferences_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpreferences`
--

LOCK TABLES `ezpreferences` WRITE;
/*!40000 ALTER TABLE `ezpreferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezrole`
--

DROP TABLE IF EXISTS `ezrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_new` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `value` char(1) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `version` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezrole`
--

LOCK TABLES `ezrole` WRITE;
/*!40000 ALTER TABLE `ezrole` DISABLE KEYS */;
INSERT INTO `ezrole` VALUES (1,0,'Anonymous','',0),(2,0,'Administrator','0',0),(3,0,'Editor','',0),(4,0,'Member','0',0),(5,0,'Ecommerce anonymous','0',0),(12,0,'Ecommerce checkout','0',0),(14,0,'Ecommerce registered users','0',0),(20,0,'Member','0',4);
/*!40000 ALTER TABLE `ezrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsearch_object_word_link`
--

DROP TABLE IF EXISTS `ezsearch_object_word_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsearch_object_word_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentclass_attribute_id` int(11) NOT NULL DEFAULT 0,
  `contentclass_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `frequency` double NOT NULL DEFAULT 0,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `integer_value` int(11) NOT NULL DEFAULT 0,
  `next_word_id` int(11) NOT NULL DEFAULT 0,
  `placement` int(11) NOT NULL DEFAULT 0,
  `prev_word_id` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 0,
  `section_id` int(11) NOT NULL DEFAULT 0,
  `word_id` int(11) NOT NULL DEFAULT 0,
  `language_mask` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ezsearch_object_word_link_object` (`contentobject_id`),
  KEY `ezsearch_object_word_link_identifier` (`identifier`(191)),
  KEY `ezsearch_object_word_link_integer_value` (`integer_value`),
  KEY `ezsearch_object_word_link_word` (`word_id`),
  KEY `ezsearch_object_word_link_frequency` (`frequency`)
) ENGINE=InnoDB AUTO_INCREMENT=2697 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsearch_object_word_link`
--

LOCK TABLES `ezsearch_object_word_link` WRITE;
/*!40000 ALTER TABLE `ezsearch_object_word_link` DISABLE KEYS */;
INSERT INTO `ezsearch_object_word_link` VALUES (1190,243,50,90,0,'name',0,431,0,0,1611581053,1,430,3),(1191,243,50,90,0,'name',0,432,1,430,1611581053,1,431,3),(1192,243,50,90,0,'name',0,433,2,431,1611581053,1,432,3),(1193,243,50,90,0,'name',0,434,3,432,1611581053,1,433,3),(1194,244,50,90,0,'identifier',0,435,4,433,1611581053,1,434,3),(1195,246,50,90,0,'content',0,436,5,434,1611581053,1,435,3),(1196,246,50,90,0,'content',0,437,6,435,1611581053,1,436,3),(1197,246,50,90,0,'content',0,438,7,436,1611581053,1,437,3),(1198,246,50,90,0,'content',0,439,8,437,1611581053,1,438,3),(1199,246,50,90,0,'content',0,440,9,438,1611581053,1,439,3),(1200,246,50,90,0,'content',0,442,10,439,1611581053,1,440,3),(1201,246,50,90,0,'content',0,444,11,440,1611581053,1,442,3),(1202,246,50,90,0,'content',0,446,12,442,1611581053,1,444,3),(1203,246,50,90,0,'content',0,448,13,444,1611581053,1,446,3),(1204,246,50,90,0,'content',0,450,14,446,1611581053,1,448,3),(1205,246,50,90,0,'content',0,452,15,448,1611581053,1,450,3),(1206,246,50,90,0,'content',0,454,16,450,1611581053,1,452,3),(1207,246,50,90,0,'content',0,444,17,452,1611581053,1,454,3),(1208,246,50,90,0,'content',0,456,18,454,1611581053,1,444,3),(1209,246,50,90,0,'content',0,436,19,444,1611581053,1,456,3),(1210,246,50,90,0,'content',0,458,20,456,1611581053,1,436,3),(1211,4,1,1,0,'name',0,443,0,0,1448889046,1,441,3),(1212,246,50,90,0,'content',0,460,21,436,1611581053,1,458,3),(1213,4,1,1,0,'name',0,445,1,441,1448889046,1,443,3),(1214,246,50,90,0,'content',0,462,22,458,1611581053,1,460,3),(1215,119,1,1,0,'short_description',0,447,2,443,1448889046,1,445,3),(1216,246,50,90,0,'content',0,0,23,460,1611581053,1,462,3),(1217,119,1,1,0,'short_description',0,449,3,445,1448889046,1,447,3),(1218,119,1,1,0,'short_description',0,451,4,447,1448889046,1,449,3),(1219,119,1,1,0,'short_description',0,453,5,449,1448889046,1,451,3),(1220,119,1,1,0,'short_description',0,455,6,451,1448889046,1,453,3),(1221,119,1,1,0,'short_description',0,457,7,453,1448889046,1,455,3),(1222,119,1,1,0,'short_description',0,459,8,455,1448889046,1,457,3),(1223,119,1,1,0,'short_description',0,441,9,457,1448889046,1,459,3),(1224,155,1,1,0,'short_name',0,443,10,459,1448889046,1,441,3),(1225,155,1,1,0,'short_name',0,461,11,441,1448889046,1,443,3),(1226,156,1,1,0,'description',0,463,12,443,1448889046,1,461,3),(1227,156,1,1,0,'description',0,464,13,461,1448889046,1,463,3),(1228,156,1,1,0,'description',0,465,14,463,1448889046,1,464,3),(1229,156,1,1,0,'description',0,466,15,464,1448889046,1,465,3),(1230,156,1,1,0,'description',0,467,16,465,1448889046,1,466,3),(1231,156,1,1,0,'description',0,468,17,466,1448889046,1,467,3),(1232,156,1,1,0,'description',0,441,18,467,1448889046,1,468,3),(1233,156,1,1,0,'description',0,443,19,468,1448889046,1,441,3),(1234,156,1,1,0,'description',0,469,20,441,1448889046,1,443,3),(1235,156,1,1,0,'description',0,470,21,443,1448889046,1,469,3),(1236,156,1,1,0,'description',0,471,22,469,1448889046,1,470,3),(1237,156,1,1,0,'description',0,472,23,470,1448889046,1,471,3),(1238,156,1,1,0,'description',0,473,24,471,1448889046,1,472,3),(1239,156,1,1,0,'description',0,474,25,472,1448889046,1,473,3),(1240,156,1,1,0,'description',0,475,26,473,1448889046,1,474,3),(1241,156,1,1,0,'description',0,464,27,474,1448889046,1,475,3),(1242,156,1,1,0,'description',0,443,28,475,1448889046,1,464,3),(1243,156,1,1,0,'description',0,476,29,464,1448889046,1,443,3),(1244,156,1,1,0,'description',0,477,30,443,1448889046,1,476,3),(1245,156,1,1,0,'description',0,478,31,476,1448889046,1,477,3),(1246,156,1,1,0,'description',0,453,32,477,1448889046,1,478,3),(1247,156,1,1,0,'description',0,479,33,478,1448889046,1,453,3),(1248,156,1,1,0,'description',0,480,34,453,1448889046,1,479,3),(1249,156,1,1,0,'description',0,481,35,479,1448889046,1,480,3),(1250,156,1,1,0,'description',0,445,36,480,1448889046,1,481,3),(1251,156,1,1,0,'description',0,482,37,481,1448889046,1,445,3),(1252,156,1,1,0,'description',0,453,38,445,1448889046,1,482,3),(1253,156,1,1,0,'description',0,455,39,482,1448889046,1,453,3),(1254,156,1,1,0,'description',0,457,40,453,1448889046,1,455,3),(1255,156,1,1,0,'description',0,459,41,455,1448889046,1,457,3),(1256,156,1,1,0,'description',0,483,42,457,1448889046,1,459,3),(1257,156,1,1,0,'description',0,484,43,459,1448889046,1,483,3),(1258,156,1,1,0,'description',0,0,44,483,1448889046,1,484,3),(1259,243,50,91,0,'name',0,485,0,0,1611581053,1,430,3),(1260,243,50,91,0,'name',0,486,1,430,1611581053,1,485,3),(1261,244,50,91,0,'identifier',0,464,2,485,1611581053,1,486,3),(1262,246,50,91,0,'content',0,430,3,486,1611581053,1,464,3),(1263,246,50,91,0,'content',0,487,4,464,1611581053,1,430,3),(1264,246,50,91,0,'content',0,453,5,430,1611581053,1,487,3),(1265,246,50,91,0,'content',0,488,6,487,1611581053,1,453,3),(1266,246,50,91,0,'content',0,452,7,453,1611581053,1,488,3),(1267,246,50,91,0,'content',0,489,8,488,1611581053,1,452,3),(1268,246,50,91,0,'content',0,490,9,452,1611581053,1,489,3),(1269,246,50,91,0,'content',0,457,10,489,1611581053,1,490,3),(1270,246,50,91,0,'content',0,491,11,490,1611581053,1,457,3),(1271,246,50,91,0,'content',0,445,12,457,1611581053,1,491,3),(1272,246,50,91,0,'content',0,492,13,491,1611581053,1,445,3),(1273,246,50,91,0,'content',0,493,14,445,1611581053,1,492,3),(1274,246,50,91,0,'content',0,464,15,492,1611581053,1,493,3),(1275,246,50,91,0,'content',0,494,16,493,1611581053,1,464,3),(1276,246,50,91,0,'content',0,490,17,464,1611581053,1,494,3),(1277,246,50,91,0,'content',0,476,18,494,1611581053,1,490,3),(1278,246,50,91,0,'content',0,495,19,490,1611581053,1,476,3),(1279,246,50,91,0,'content',0,476,20,476,1611581053,1,495,3),(1280,246,50,91,0,'content',0,496,21,495,1611581053,1,476,3),(1281,246,50,91,0,'content',0,471,22,476,1611581053,1,496,3),(1282,246,50,91,0,'content',0,497,23,496,1611581053,1,471,3),(1283,246,50,91,0,'content',0,498,24,471,1611581053,1,497,3),(1284,246,50,91,0,'content',0,492,25,497,1611581053,1,498,3),(1285,246,50,91,0,'content',0,499,26,498,1611581053,1,492,3),(1286,246,50,91,0,'content',0,500,27,492,1611581053,1,499,3),(1287,246,50,91,0,'content',0,501,28,499,1611581053,1,500,3),(1288,246,50,91,0,'content',0,452,29,500,1611581053,1,501,3),(1289,246,50,91,0,'content',0,489,30,501,1611581053,1,452,3),(1290,246,50,91,0,'content',0,502,31,452,1611581053,1,489,3),(1291,7,3,4,0,'description',0,504,0,0,1033917596,2,503,3),(1292,246,50,91,0,'content',0,0,32,489,1611581053,1,502,3),(1293,7,3,4,0,'description',0,497,1,503,1033917596,2,504,3),(1294,6,3,4,0,'name',0,0,2,504,1033917596,2,497,3),(1295,243,50,92,0,'name',0,501,0,0,1611581053,1,505,3),(1296,243,50,92,0,'name',0,506,1,505,1611581053,1,501,3),(1297,243,50,92,0,'name',0,507,2,501,1611581053,1,506,3),(1298,243,50,92,0,'name',0,508,3,506,1611581053,1,507,3),(1299,244,50,92,0,'identifier',0,458,4,507,1611581053,1,508,3),(1300,246,50,92,0,'content',0,456,5,508,1611581053,1,458,3),(1301,246,50,92,0,'content',0,444,6,458,1611581053,1,456,3),(1302,246,50,92,0,'content',0,509,7,456,1611581053,1,444,3),(1303,246,50,92,0,'content',0,510,8,444,1611581053,1,509,3),(1304,246,50,92,0,'content',0,511,9,509,1611581053,1,510,3),(1305,246,50,92,0,'content',0,452,10,510,1611581053,1,511,3),(1306,246,50,92,0,'content',0,512,11,511,1611581053,1,452,3),(1307,246,50,92,0,'content',0,0,12,452,1611581053,1,512,3),(1308,8,4,10,0,'first_name',0,506,0,0,1033920665,2,513,3),(1309,9,4,10,0,'last_name',0,0,1,513,1033920665,2,506,3),(1310,243,50,93,0,'name',0,515,0,0,1611581053,1,514,2),(1311,243,50,93,0,'name',0,516,1,514,1611581053,1,515,2),(1312,243,50,93,0,'name',0,517,2,515,1611581053,1,516,2),(1313,244,50,93,0,'identifier',0,515,3,516,1611581053,1,517,2),(1314,246,50,93,0,'content',0,518,4,517,1611581053,1,515,2),(1315,6,3,11,0,'name',0,489,0,0,1033920746,2,519,3),(1316,246,50,93,0,'content',0,0,5,515,1611581053,1,518,2),(1317,6,3,11,0,'name',0,0,1,519,1033920746,2,489,3),(1318,6,3,12,0,'name',0,497,0,0,1033920775,2,533,3),(1319,6,3,12,0,'name',0,0,1,533,1033920775,2,497,3),(1320,243,50,94,0,'name',0,520,0,0,1611581054,1,514,2),(1321,243,50,94,0,'name',0,521,1,514,1611581054,1,520,2),(1322,244,50,94,0,'identifier',0,522,2,520,1611581054,1,521,2),(1323,246,50,94,0,'content',0,523,3,521,1611581054,1,522,2),(1324,246,50,94,0,'content',0,502,4,522,1611581054,1,523,2),(1325,246,50,94,0,'content',0,502,5,523,1611581054,1,502,2),(1326,246,50,94,0,'content',0,441,6,502,1611581054,1,502,2),(1327,246,50,94,0,'content',0,524,7,502,1611581054,1,441,2),(1328,246,50,94,0,'content',0,525,8,441,1611581054,1,524,2),(1329,246,50,94,0,'content',0,526,9,524,1611581054,1,525,2),(1330,246,50,94,0,'content',0,527,10,525,1611581054,1,526,2),(1331,246,50,94,0,'content',0,528,11,526,1611581054,1,527,2),(1332,246,50,94,0,'content',0,529,12,527,1611581054,1,528,2),(1333,246,50,94,0,'content',0,530,13,528,1611581054,1,529,2),(1334,246,50,94,0,'content',0,531,14,529,1611581054,1,530,2),(1335,246,50,94,0,'content',0,532,15,530,1611581054,1,531,2),(1336,246,50,94,0,'content',0,534,16,531,1611581054,1,532,2),(1337,6,3,13,0,'name',0,0,0,0,1033920794,2,546,3),(1338,246,50,94,0,'content',0,535,17,532,1611581054,1,534,2),(1339,246,50,94,0,'content',0,536,18,534,1611581054,1,535,2),(1340,246,50,94,0,'content',0,452,19,535,1611581054,1,536,2),(1341,246,50,94,0,'content',0,537,20,536,1611581054,1,452,2),(1342,246,50,94,0,'content',0,538,21,452,1611581054,1,537,2),(1343,246,50,94,0,'content',0,539,22,537,1611581054,1,538,2),(1344,246,50,94,0,'content',0,540,23,538,1611581054,1,539,2),(1345,246,50,94,0,'content',0,468,24,539,1611581054,1,540,2),(1346,246,50,94,0,'content',0,541,25,540,1611581054,1,468,2),(1347,246,50,94,0,'content',0,511,26,468,1611581054,1,541,2),(1348,246,50,94,0,'content',0,457,27,541,1611581054,1,511,2),(1349,246,50,94,0,'content',0,433,28,511,1611581054,1,457,2),(1350,246,50,94,0,'content',0,542,29,457,1611581054,1,433,2),(1351,246,50,94,0,'content',0,543,30,433,1611581054,1,542,2),(1352,246,50,94,0,'content',0,537,31,542,1611581054,1,543,2),(1353,246,50,94,0,'content',0,544,32,543,1611581054,1,537,2),(1354,246,50,94,0,'content',0,545,33,537,1611581054,1,544,2),(1355,246,50,94,0,'content',0,502,34,544,1611581054,1,545,2),(1356,246,50,94,0,'content',0,0,35,545,1611581054,1,502,2),(1357,243,50,95,0,'name',0,547,0,0,1611581054,1,514,2),(1358,243,50,95,0,'name',0,548,1,514,1611581054,1,547,2),(1359,243,50,95,0,'name',0,452,2,547,1611581054,1,548,2),(1360,243,50,95,0,'name',0,549,3,548,1611581054,1,452,2),(1361,243,50,95,0,'name',0,550,4,452,1611581054,1,549,2),(1362,8,4,14,0,'first_name',0,506,0,0,1033920830,2,533,3),(1363,244,50,95,0,'identifier',0,551,5,549,1611581054,1,550,2),(1364,9,4,14,0,'last_name',0,0,1,533,1033920830,2,506,3),(1365,246,50,95,0,'content',0,445,6,550,1611581054,1,551,2),(1366,246,50,95,0,'content',0,490,7,551,1611581054,1,445,2),(1367,246,50,95,0,'content',0,457,8,445,1611581054,1,490,2),(1368,246,50,95,0,'content',0,552,9,490,1611581054,1,457,2),(1369,246,50,95,0,'content',0,0,10,457,1611581054,1,552,2),(1370,4,1,41,0,'name',0,0,0,0,1060695457,3,553,3),(1371,243,50,96,0,'name',0,554,0,0,1611581054,1,514,3),(1372,243,50,96,0,'name',0,555,1,514,1611581054,1,554,3),(1373,243,50,96,0,'name',0,556,2,554,1611581054,1,555,3),(1374,243,50,96,0,'name',0,548,3,555,1611581054,1,556,3),(1375,243,50,96,0,'name',0,557,4,556,1611581054,1,548,3),(1376,244,50,96,0,'identifier',0,441,5,548,1611581054,1,557,3),(1377,246,50,96,0,'content',0,524,6,557,1611581054,1,441,3),(1378,246,50,96,0,'content',0,525,7,441,1611581054,1,524,3),(1379,246,50,96,0,'content',0,526,8,524,1611581054,1,525,3),(1380,246,50,96,0,'content',0,527,9,525,1611581054,1,526,3),(1381,6,3,42,0,'name',0,497,0,0,1072180330,2,513,3),(1382,246,50,96,0,'content',0,528,10,526,1611581054,1,527,3),(1383,6,3,42,0,'name',0,506,1,513,1072180330,2,497,3),(1384,246,50,96,0,'content',0,529,11,527,1611581054,1,528,3),(1385,7,3,42,0,'description',0,504,2,497,1072180330,2,506,3),(1386,246,50,96,0,'content',0,558,12,528,1611581054,1,529,3),(1387,7,3,42,0,'description',0,490,3,506,1072180330,2,504,3),(1388,246,50,96,0,'content',0,441,13,529,1611581054,1,558,3),(1389,7,3,42,0,'description',0,464,4,504,1072180330,2,490,3),(1390,246,50,96,0,'content',0,559,14,558,1611581054,1,441,3),(1391,7,3,42,0,'description',0,513,5,490,1072180330,2,464,3),(1392,246,50,96,0,'content',0,560,15,441,1611581054,1,559,3),(1393,7,3,42,0,'description',0,506,6,464,1072180330,2,513,3),(1394,246,50,96,0,'content',0,561,16,559,1611581054,1,560,3),(1395,7,3,42,0,'description',0,0,7,513,1072180330,2,506,3),(1396,246,50,96,0,'content',0,441,17,560,1611581054,1,561,3),(1397,246,50,96,0,'content',0,559,18,561,1611581054,1,441,3),(1398,246,50,96,0,'content',0,531,19,441,1611581054,1,559,3),(1399,246,50,96,0,'content',0,532,20,559,1611581054,1,531,3),(1400,246,50,96,0,'content',0,534,21,531,1611581054,1,532,3),(1401,246,50,96,0,'content',0,535,22,532,1611581054,1,534,3),(1402,246,50,96,0,'content',0,536,23,534,1611581054,1,535,3),(1403,246,50,96,0,'content',0,0,24,535,1611581054,1,536,3),(1404,4,1,49,0,'name',0,0,0,0,1080220197,3,562,3),(1405,243,50,97,0,'name',0,563,0,0,1611581054,1,514,3),(1406,243,50,97,0,'name',0,564,1,514,1611581054,1,563,3),(1407,243,50,97,0,'name',0,556,2,563,1611581054,1,564,3),(1408,243,50,97,0,'name',0,548,3,564,1611581054,1,556,3),(1409,243,50,97,0,'name',0,565,4,556,1611581054,1,548,3),(1410,244,50,97,0,'identifier',0,481,5,548,1611581054,1,565,3),(1411,4,1,50,0,'name',0,0,0,0,1080220220,3,574,3),(1412,246,50,97,0,'content',0,445,6,565,1611581054,1,481,3),(1413,246,50,97,0,'content',0,566,7,481,1611581054,1,445,3),(1414,246,50,97,0,'content',0,567,8,445,1611581054,1,566,3),(1415,246,50,97,0,'content',0,568,9,566,1611581054,1,567,3),(1416,246,50,97,0,'content',0,569,10,567,1611581054,1,568,3),(1417,246,50,97,0,'content',0,570,11,568,1611581054,1,569,3),(1418,246,50,97,0,'content',0,571,12,569,1611581054,1,570,3),(1419,246,50,97,0,'content',0,453,13,570,1611581054,1,571,3),(1420,246,50,97,0,'content',0,572,14,571,1611581054,1,453,3),(1421,246,50,97,0,'content',0,573,15,453,1611581054,1,572,3),(1422,246,50,97,0,'content',0,0,16,572,1611581054,1,573,3),(1423,4,1,51,0,'name',0,0,0,0,1080220233,3,575,3),(1424,243,50,98,0,'name',0,556,0,0,1611581054,1,514,3),(1425,243,50,98,0,'name',0,576,1,514,1611581054,1,556,3),(1426,243,50,98,0,'name',0,520,2,556,1611581054,1,576,3),(1427,243,50,98,0,'name',0,577,3,576,1611581054,1,520,3),(1428,244,50,98,0,'identifier',0,0,4,520,1611581054,1,577,3),(1429,185,42,52,0,'name',0,578,0,0,1442481743,1,441,3),(1430,185,42,52,0,'name',0,579,1,441,1442481743,1,578,3),(1431,185,42,52,0,'name',0,443,2,578,1442481743,1,579,3),(1432,185,42,52,0,'name',0,445,3,579,1442481743,1,443,3),(1433,186,42,52,0,'description',0,447,4,443,1442481743,1,445,3),(1434,186,42,52,0,'description',0,449,5,445,1442481743,1,447,3),(1435,186,42,52,0,'description',0,451,6,447,1442481743,1,449,3),(1436,186,42,52,0,'description',0,453,7,449,1442481743,1,451,3),(1437,186,42,52,0,'description',0,455,8,451,1442481743,1,453,3),(1438,186,42,52,0,'description',0,457,9,453,1442481743,1,455,3),(1439,186,42,52,0,'description',0,459,10,455,1442481743,1,457,3),(1440,186,42,52,0,'description',0,0,11,457,1442481743,1,459,3),(1441,243,50,99,0,'name',0,556,0,0,1611581055,1,514,3),(1442,243,50,99,0,'name',0,580,1,514,1611581055,1,556,3),(1443,243,50,99,0,'name',0,520,2,556,1611581055,1,580,3),(1444,243,50,99,0,'name',0,581,3,580,1611581055,1,520,3),(1445,244,50,99,0,'identifier',0,0,4,520,1611581055,1,581,3),(1446,4,1,53,0,'name',0,583,0,0,1486473151,3,582,3),(1447,4,1,53,0,'name',0,582,1,582,1486473151,3,583,3),(1448,155,1,53,0,'short_name',0,583,2,583,1486473151,3,582,3),(1449,155,1,53,0,'short_name',0,584,3,582,1486473151,3,583,3),(1450,243,50,100,0,'name',0,548,0,0,1611581055,1,586,3),(1451,243,50,100,0,'name',0,587,1,586,1611581055,1,548,3),(1452,119,1,53,0,'short_description',0,490,4,583,1486473151,3,584,3),(1453,243,50,100,0,'name',0,588,2,548,1611581055,1,587,3),(1454,119,1,53,0,'short_description',0,585,5,584,1486473151,3,490,3),(1455,244,50,100,0,'identifier',0,589,3,587,1611581055,1,588,3),(1456,119,1,53,0,'short_description',0,583,6,490,1486473151,3,585,3),(1457,244,50,100,0,'identifier',0,590,4,588,1611581055,1,589,3),(1458,246,50,100,0,'content',0,453,5,589,1611581055,1,590,3),(1459,119,1,53,0,'short_description',0,0,7,585,1486473151,3,583,3),(1460,246,50,100,0,'content',0,591,6,590,1611581055,1,453,3),(1461,246,50,100,0,'content',0,587,7,453,1611581055,1,591,3),(1462,246,50,100,0,'content',0,592,8,591,1611581055,1,587,3),(1463,246,50,100,0,'content',0,593,9,587,1611581055,1,592,3),(1464,246,50,100,0,'content',0,483,10,592,1611581055,1,593,3),(1465,246,50,100,0,'content',0,591,11,593,1611581055,1,483,3),(1466,246,50,100,0,'content',0,594,12,483,1611581055,1,591,3),(1467,246,50,100,0,'content',0,595,13,591,1611581055,1,594,3),(1468,246,50,100,0,'content',0,596,14,594,1611581055,1,595,3),(1469,246,50,100,0,'content',0,501,15,595,1611581055,1,596,3),(1470,246,50,100,0,'content',0,597,16,596,1611581055,1,501,3),(1471,246,50,100,0,'content',0,592,17,501,1611581055,1,597,3),(1472,246,50,100,0,'content',0,598,18,597,1611581055,1,592,3),(1473,246,50,100,0,'content',0,0,19,592,1611581055,1,598,3),(1474,4,1,54,0,'name',0,0,0,0,1537166893,6,599,2),(1475,243,50,101,0,'name',0,555,0,0,1611581055,1,520,3),(1476,243,50,101,0,'name',0,600,1,520,1611581055,1,555,3),(1477,244,50,101,0,'identifier',0,441,2,555,1611581055,1,600,3),(1478,246,50,101,0,'content',0,524,3,600,1611581055,1,441,3),(1479,246,50,101,0,'content',0,525,4,441,1611581055,1,524,3),(1480,246,50,101,0,'content',0,526,5,524,1611581055,1,525,3),(1481,246,50,101,0,'content',0,527,6,525,1611581055,1,526,3),(1482,246,50,101,0,'content',0,528,7,526,1611581055,1,527,3),(1483,246,50,101,0,'content',0,529,8,527,1611581055,1,528,3),(1484,246,50,101,0,'content',0,558,9,528,1611581055,1,529,3),(1485,246,50,101,0,'content',0,441,10,529,1611581055,1,558,3),(1486,246,50,101,0,'content',0,559,11,558,1611581055,1,441,3),(1487,246,50,101,0,'content',0,560,12,441,1611581055,1,559,3),(1488,246,50,101,0,'content',0,561,13,559,1611581055,1,560,3),(1489,246,50,101,0,'content',0,441,14,560,1611581055,1,561,3),(1490,246,50,101,0,'content',0,559,15,561,1611581055,1,441,3),(1491,246,50,101,0,'content',0,531,16,441,1611581055,1,559,3),(1492,246,50,101,0,'content',0,532,17,559,1611581055,1,531,3),(1493,246,50,101,0,'content',0,534,18,531,1611581055,1,532,3),(1494,246,50,101,0,'content',0,535,19,532,1611581055,1,534,3),(1495,246,50,101,0,'content',0,536,20,534,1611581055,1,535,3),(1496,4,1,55,0,'name',0,602,0,0,1586855342,7,601,3),(1497,246,50,101,0,'content',0,0,21,535,1611581055,1,536,3),(1498,4,1,55,0,'name',0,0,1,601,1586855342,7,602,3),(1499,6,3,56,0,'name',0,497,0,0,1611581046,2,452,3),(1500,6,3,56,0,'name',0,452,1,452,1611581046,2,497,3),(1501,7,3,56,0,'description',0,497,2,497,1611581046,2,452,3),(1502,7,3,56,0,'description',0,0,3,452,1611581046,2,497,3),(1503,243,50,102,0,'name',0,603,0,0,1611581055,1,520,3),(1504,243,50,102,0,'name',0,604,1,520,1611581055,1,603,3),(1505,243,50,102,0,'name',0,605,2,603,1611581055,1,604,3),(1506,244,50,102,0,'identifier',0,572,3,604,1611581055,1,605,3),(1507,246,50,102,0,'content',0,0,4,605,1611581055,1,572,3),(1508,6,3,57,0,'name',0,607,0,0,1611581046,2,606,3),(1509,6,3,57,0,'name',0,506,1,606,1611581046,2,607,3),(1510,7,3,57,0,'description',0,504,2,607,1611581046,2,506,3),(1511,7,3,57,0,'description',0,490,3,506,1611581046,2,504,3),(1512,7,3,57,0,'description',0,606,4,504,1611581046,2,490,3),(1513,7,3,57,0,'description',0,607,5,490,1611581046,2,606,3),(1514,7,3,57,0,'description',0,0,6,606,1611581046,2,607,3),(1515,243,50,103,0,'name',0,603,0,0,1611581055,1,520,3),(1516,243,50,103,0,'name',0,608,1,520,1611581055,1,603,3),(1517,243,50,103,0,'name',0,609,2,603,1611581055,1,608,3),(1518,244,50,103,0,'identifier',0,610,3,608,1611581055,1,609,3),(1519,246,50,103,0,'content',0,515,4,609,1611581055,1,610,3),(1520,246,50,103,0,'content',0,582,5,610,1611581055,1,515,3),(1521,246,50,103,0,'content',0,0,6,515,1611581055,1,582,3),(1522,6,3,58,0,'name',0,607,0,0,1611581046,2,611,3),(1523,6,3,58,0,'name',0,506,1,611,1611581046,2,607,3),(1524,7,3,58,0,'description',0,504,2,607,1611581046,2,506,3),(1525,7,3,58,0,'description',0,490,3,506,1611581046,2,504,3),(1526,7,3,58,0,'description',0,611,4,504,1611581046,2,490,3),(1527,7,3,58,0,'description',0,607,5,490,1611581046,2,611,3),(1528,7,3,58,0,'description',0,0,6,611,1611581046,2,607,3),(1529,243,50,104,0,'name',0,603,0,0,1611581056,1,520,3),(1530,243,50,104,0,'name',0,612,1,520,1611581056,1,603,3),(1531,243,50,104,0,'name',0,613,2,603,1611581056,1,612,3),(1532,244,50,104,0,'identifier',0,614,3,612,1611581056,1,613,3),(1533,246,50,104,0,'content',0,615,4,613,1611581056,1,614,3),(1534,4,1,59,0,'name',0,0,0,0,1611581049,1,616,3),(1535,246,50,104,0,'content',0,582,5,614,1611581056,1,615,3),(1536,246,50,104,0,'content',0,0,6,615,1611581056,1,582,3),(1537,4,1,61,0,'name',0,0,0,0,1611581049,1,621,3),(1538,243,50,105,0,'name',0,485,0,0,1611581056,1,617,2),(1539,243,50,105,0,'name',0,618,1,617,1611581056,1,485,2),(1540,244,50,105,0,'identifier',0,481,2,485,1611581056,1,618,2),(1541,246,50,105,0,'content',0,445,3,618,1611581056,1,481,2),(1542,246,50,105,0,'content',0,619,4,481,1611581056,1,445,2),(1543,246,50,105,0,'content',0,464,5,445,1611581056,1,619,2),(1544,246,50,105,0,'content',0,620,6,619,1611581056,1,464,2),(1545,246,50,105,0,'content',0,475,7,464,1611581056,1,620,2),(1546,246,50,105,0,'content',0,464,8,620,1611581056,1,475,2),(1547,246,50,105,0,'content',0,597,9,475,1611581056,1,464,2),(1548,246,50,105,0,'content',0,445,10,464,1611581056,1,597,2),(1549,246,50,105,0,'content',0,482,11,597,1611581056,1,445,2),(1550,246,50,105,0,'content',0,453,12,445,1611581056,1,482,2),(1551,246,50,105,0,'content',0,552,13,482,1611581056,1,453,2),(1552,246,50,105,0,'content',0,445,14,453,1611581056,1,552,2),(1553,246,50,105,0,'content',0,492,15,552,1611581056,1,445,2),(1554,246,50,105,0,'content',0,622,16,445,1611581056,1,492,2),(1555,4,1,62,0,'name',0,0,0,0,1611581049,1,625,3),(1556,246,50,105,0,'content',0,617,17,492,1611581056,1,622,2),(1557,246,50,105,0,'content',0,453,18,622,1611581056,1,617,2),(1558,246,50,105,0,'content',0,623,19,617,1611581056,1,453,2),(1559,246,50,105,0,'content',0,624,20,453,1611581056,1,623,2),(1560,246,50,105,0,'content',0,597,21,623,1611581056,1,624,2),(1561,246,50,105,0,'content',0,453,22,624,1611581056,1,597,2),(1562,246,50,105,0,'content',0,464,23,597,1611581056,1,453,2),(1563,246,50,105,0,'content',0,625,24,453,1611581056,1,464,2),(1564,246,50,105,0,'content',0,445,25,464,1611581056,1,625,2),(1565,246,50,105,0,'content',0,492,26,625,1611581056,1,445,2),(1566,246,50,105,0,'content',0,626,27,445,1611581056,1,492,2),(1567,246,50,105,0,'content',0,490,28,492,1611581056,1,626,2),(1568,246,50,105,0,'content',0,471,29,626,1611581056,1,490,2),(1569,246,50,105,0,'content',0,614,30,490,1611581056,1,471,2),(1570,246,50,105,0,'content',0,627,31,471,1611581056,1,614,2),(1571,246,50,105,0,'content',0,471,32,614,1611581056,1,627,2),(1572,246,50,105,0,'content',0,628,33,627,1611581056,1,471,2),(1573,246,50,105,0,'content',0,471,34,471,1611581056,1,628,2),(1574,246,50,105,0,'content',0,628,35,628,1611581056,1,471,2),(1575,246,50,105,0,'content',0,592,36,471,1611581056,1,628,2),(1576,246,50,105,0,'content',0,629,37,628,1611581056,1,592,2),(1577,246,50,105,0,'content',0,630,38,592,1611581056,1,629,2),(1578,246,50,105,0,'content',0,631,39,629,1611581056,1,630,2),(1579,246,50,105,0,'content',0,471,40,630,1611581056,1,631,2),(1580,246,50,105,0,'content',0,629,41,631,1611581056,1,471,2),(1581,246,50,105,0,'content',0,627,42,471,1611581056,1,629,2),(1582,246,50,105,0,'content',0,464,43,629,1611581056,1,627,2),(1583,246,50,105,0,'content',0,452,44,627,1611581056,1,464,2),(1584,246,50,105,0,'content',0,632,45,464,1611581056,1,452,2),(1585,246,50,105,0,'content',0,633,46,452,1611581056,1,632,2),(1586,246,50,105,0,'content',0,634,47,632,1611581056,1,633,2),(1587,246,50,105,0,'content',0,592,48,633,1611581056,1,634,2),(1588,246,50,105,0,'content',0,445,49,634,1611581056,1,592,2),(1589,246,50,105,0,'content',0,492,50,592,1611581056,1,445,2),(1590,246,50,105,0,'content',0,635,51,445,1611581056,1,492,2),(1591,246,50,105,0,'content',0,636,52,492,1611581056,1,635,2),(1592,246,50,105,0,'content',0,475,53,635,1611581056,1,636,2),(1593,246,50,105,0,'content',0,464,54,636,1611581056,1,475,2),(1594,246,50,105,0,'content',0,637,55,475,1611581056,1,464,2),(1595,246,50,105,0,'content',0,471,56,464,1611581056,1,637,2),(1596,246,50,105,0,'content',0,638,57,637,1611581056,1,471,2),(1597,246,50,105,0,'content',0,585,58,471,1611581056,1,638,2),(1598,246,50,105,0,'content',0,639,59,638,1611581056,1,585,2),(1599,246,50,105,0,'content',0,471,60,585,1611581056,1,639,2),(1600,246,50,105,0,'content',0,637,61,639,1611581056,1,471,2),(1601,246,50,105,0,'content',0,475,62,471,1611581056,1,637,2),(1602,246,50,105,0,'content',0,620,63,637,1611581056,1,475,2),(1603,246,50,105,0,'content',0,629,64,475,1611581056,1,620,2),(1604,246,50,105,0,'content',0,640,65,620,1611581056,1,629,2),(1605,246,50,105,0,'content',0,592,66,629,1611581056,1,640,2),(1606,246,50,105,0,'content',0,641,67,640,1611581056,1,592,2),(1607,246,50,105,0,'content',0,492,68,592,1611581056,1,641,2),(1608,246,50,105,0,'content',0,642,69,641,1611581056,1,492,2),(1609,246,50,105,0,'content',0,643,70,492,1611581056,1,642,2),(1610,246,50,105,0,'content',0,644,71,642,1611581056,1,643,2),(1611,246,50,105,0,'content',0,645,72,643,1611581056,1,644,2),(1612,4,1,63,0,'name',0,0,0,0,1611581049,1,664,3),(1613,246,50,105,0,'content',0,646,73,644,1611581056,1,645,2),(1614,246,50,105,0,'content',0,647,74,645,1611581056,1,646,2),(1615,246,50,105,0,'content',0,475,75,646,1611581056,1,647,2),(1616,246,50,105,0,'content',0,648,76,647,1611581056,1,475,2),(1617,246,50,105,0,'content',0,471,77,475,1611581056,1,648,2),(1618,246,50,105,0,'content',0,585,78,648,1611581056,1,471,2),(1619,246,50,105,0,'content',0,445,79,471,1611581056,1,585,2),(1620,246,50,105,0,'content',0,492,80,585,1611581056,1,445,2),(1621,246,50,105,0,'content',0,649,81,445,1611581056,1,492,2),(1622,246,50,105,0,'content',0,464,82,492,1611581056,1,649,2),(1623,246,50,105,0,'content',0,650,83,649,1611581056,1,464,2),(1624,246,50,105,0,'content',0,651,84,464,1611581056,1,650,2),(1625,246,50,105,0,'content',0,464,85,650,1611581056,1,651,2),(1626,246,50,105,0,'content',0,652,86,651,1611581056,1,464,2),(1627,246,50,105,0,'content',0,470,87,464,1611581056,1,652,2),(1628,246,50,105,0,'content',0,653,88,652,1611581056,1,470,2),(1629,246,50,105,0,'content',0,654,89,470,1611581056,1,653,2),(1630,246,50,105,0,'content',0,655,90,653,1611581056,1,654,2),(1631,246,50,105,0,'content',0,656,91,654,1611581056,1,655,2),(1632,246,50,105,0,'content',0,657,92,655,1611581056,1,656,2),(1633,246,50,105,0,'content',0,617,93,656,1611581056,1,657,2),(1634,246,50,105,0,'content',0,481,94,657,1611581056,1,617,2),(1635,246,50,105,0,'content',0,445,95,617,1611581056,1,481,2),(1636,246,50,105,0,'content',0,482,96,481,1611581056,1,445,2),(1637,246,50,105,0,'content',0,453,97,445,1611581056,1,482,2),(1638,246,50,105,0,'content',0,658,98,482,1611581056,1,453,2),(1639,246,50,105,0,'content',0,457,99,453,1611581056,1,658,2),(1640,246,50,105,0,'content',0,659,100,658,1611581056,1,457,2),(1641,246,50,105,0,'content',0,660,101,457,1611581056,1,659,2),(1642,246,50,105,0,'content',0,592,102,659,1611581056,1,660,2),(1643,246,50,105,0,'content',0,464,103,660,1611581056,1,592,2),(1644,246,50,105,0,'content',0,661,104,592,1611581056,1,464,2),(1645,246,50,105,0,'content',0,662,105,464,1611581056,1,661,2),(1646,246,50,105,0,'content',0,663,106,661,1611581056,1,662,2),(1647,246,50,105,0,'content',0,0,107,662,1611581056,1,663,2),(1648,4,1,64,0,'name',0,0,0,0,1611581049,1,572,3),(1649,243,50,106,0,'name',0,666,0,0,1611581056,1,665,3),(1650,243,50,106,0,'name',0,667,1,665,1611581056,1,666,3),(1651,244,50,106,0,'identifier',0,464,2,666,1611581056,1,667,3),(1652,246,50,106,0,'content',0,666,3,667,1611581056,1,464,3),(1653,246,50,106,0,'content',0,445,4,464,1611581056,1,666,3),(1654,246,50,106,0,'content',0,668,5,666,1611581056,1,445,3),(1655,246,50,106,0,'content',0,669,6,445,1611581056,1,668,3),(1656,246,50,106,0,'content',0,670,7,668,1611581056,1,669,3),(1657,246,50,106,0,'content',0,570,8,669,1611581056,1,670,3),(1658,246,50,106,0,'content',0,642,9,670,1611581056,1,570,3),(1659,246,50,106,0,'content',0,671,10,570,1611581056,1,642,3),(1660,246,50,106,0,'content',0,464,11,642,1611581056,1,671,3),(1661,246,50,106,0,'content',0,669,12,671,1611581056,1,464,3),(1662,246,50,106,0,'content',0,666,13,464,1611581056,1,669,3),(1663,246,50,106,0,'content',0,672,14,669,1611581056,1,666,3),(1664,246,50,106,0,'content',0,673,15,666,1611581056,1,672,3),(1665,246,50,106,0,'content',0,674,16,672,1611581056,1,673,3),(1666,4,1,65,0,'name',0,0,0,0,1611581049,1,430,3),(1667,246,50,106,0,'content',0,675,17,673,1611581056,1,674,3),(1668,246,50,106,0,'content',0,631,18,674,1611581056,1,675,3),(1669,246,50,106,0,'content',0,676,19,675,1611581056,1,631,3),(1670,246,50,106,0,'content',0,672,20,631,1611581056,1,676,3),(1671,246,50,106,0,'content',0,642,21,676,1611581056,1,672,3),(1672,246,50,106,0,'content',0,471,22,672,1611581056,1,642,3),(1673,246,50,106,0,'content',0,677,23,642,1611581056,1,471,3),(1674,246,50,106,0,'content',0,511,24,471,1611581056,1,677,3),(1675,246,50,106,0,'content',0,464,25,677,1611581056,1,511,3),(1676,246,50,106,0,'content',0,678,26,511,1611581056,1,464,3),(1677,246,50,106,0,'content',0,0,27,464,1611581056,1,678,3),(1678,4,1,66,0,'name',0,0,0,0,1611581049,1,514,3),(1679,243,50,107,0,'name',0,680,0,0,1611581056,1,679,3),(1680,243,50,107,0,'name',0,681,1,679,1611581056,1,680,3),(1681,244,50,107,0,'identifier',0,445,2,680,1611581056,1,681,3),(1682,246,50,107,0,'content',0,566,3,681,1611581056,1,445,3),(1683,246,50,107,0,'content',0,682,4,445,1611581056,1,566,3),(1684,246,50,107,0,'content',0,683,5,566,1611581056,1,682,3),(1685,246,50,107,0,'content',0,684,6,682,1611581056,1,683,3),(1686,246,50,107,0,'content',0,685,7,683,1611581056,1,684,3),(1687,246,50,107,0,'content',0,686,8,684,1611581056,1,685,3),(1688,246,50,107,0,'content',0,475,9,685,1611581056,1,686,3),(1689,246,50,107,0,'content',0,471,10,686,1611581056,1,475,3),(1690,246,50,107,0,'content',0,687,11,475,1611581056,1,471,3),(1691,246,50,107,0,'content',0,631,12,471,1611581056,1,687,3),(1692,246,50,107,0,'content',0,445,13,687,1611581056,1,631,3),(1693,246,50,107,0,'content',0,688,14,631,1611581056,1,445,3),(1694,246,50,107,0,'content',0,689,15,445,1611581056,1,688,3),(1695,246,50,107,0,'content',0,566,16,688,1611581056,1,689,3),(1696,246,50,107,0,'content',0,679,17,689,1611581056,1,566,3),(1697,246,50,107,0,'content',0,453,18,566,1611581056,1,679,3),(1698,246,50,107,0,'content',0,464,19,679,1611581056,1,453,3),(1699,246,50,107,0,'content',0,669,20,453,1611581056,1,464,3),(1700,246,50,107,0,'content',0,650,21,464,1611581056,1,669,3),(1701,246,50,107,0,'content',0,654,22,669,1611581056,1,650,3),(1702,246,50,107,0,'content',0,690,23,650,1611581056,1,654,3),(1703,246,50,107,0,'content',0,511,24,654,1611581056,1,690,3),(1704,246,50,107,0,'content',0,691,25,690,1611581056,1,511,3),(1705,4,1,67,0,'name',0,0,0,0,1611581049,1,520,3),(1706,246,50,107,0,'content',0,481,26,511,1611581056,1,691,3),(1707,246,50,107,0,'content',0,445,27,691,1611581056,1,481,3),(1708,246,50,107,0,'content',0,447,28,481,1611581056,1,445,3),(1709,246,50,107,0,'content',0,692,29,445,1611581056,1,447,3),(1710,246,50,107,0,'content',0,471,30,447,1611581056,1,692,3),(1711,246,50,107,0,'content',0,607,31,692,1611581056,1,471,3),(1712,246,50,107,0,'content',0,631,32,471,1611581056,1,607,3),(1713,246,50,107,0,'content',0,500,33,607,1611581056,1,631,3),(1714,246,50,107,0,'content',0,471,34,631,1611581056,1,500,3),(1715,246,50,107,0,'content',0,501,35,500,1611581056,1,471,3),(1716,246,50,107,0,'content',0,454,36,471,1611581056,1,501,3),(1717,246,50,107,0,'content',0,0,37,501,1611581056,1,454,3),(1718,4,1,68,0,'name',0,0,0,0,1611581049,1,599,3),(1719,243,50,108,0,'name',0,693,0,0,1611581057,1,485,3),(1720,243,50,108,0,'name',0,694,1,485,1611581057,1,693,3),(1721,244,50,108,0,'identifier',0,695,2,693,1611581057,1,694,3),(1722,246,50,108,0,'content',0,445,3,694,1611581057,1,695,3),(1723,246,50,108,0,'content',0,632,4,695,1611581057,1,445,3),(1724,246,50,108,0,'content',0,696,5,445,1611581057,1,632,3),(1725,246,50,108,0,'content',0,476,6,632,1611581057,1,696,3),(1726,246,50,108,0,'content',0,697,7,696,1611581057,1,476,3),(1727,246,50,108,0,'content',0,475,8,476,1611581057,1,697,3),(1728,246,50,108,0,'content',0,457,9,697,1611581057,1,475,3),(1729,246,50,108,0,'content',0,552,10,475,1611581057,1,457,3),(1730,246,50,108,0,'content',0,698,11,457,1611581057,1,552,3),(1731,246,50,108,0,'content',0,0,12,552,1611581057,1,698,3),(1732,4,1,69,0,'name',0,0,0,0,1611581049,1,699,3),(1733,243,50,109,0,'name',0,453,0,0,1611581057,1,700,3),(1734,243,50,109,0,'name',0,701,1,700,1611581057,1,453,3),(1735,243,50,109,0,'name',0,702,2,453,1611581057,1,701,3),(1736,244,50,109,0,'identifier',0,703,3,701,1611581057,1,702,3),(1737,246,50,109,0,'content',0,700,4,702,1611581057,1,703,3),(1738,246,50,109,0,'content',0,453,5,703,1611581057,1,700,3),(1739,4,1,70,0,'name',0,0,0,0,1611581049,1,693,3),(1740,246,50,109,0,'content',0,701,6,700,1611581057,1,453,3),(1741,246,50,109,0,'content',0,0,7,453,1611581057,1,701,3),(1742,4,1,71,0,'name',0,0,0,0,1611581049,1,506,3),(1743,243,50,110,0,'name',0,695,0,0,1611581057,1,655,2),(1744,243,50,110,0,'name',0,453,1,655,1611581057,1,695,2),(1745,243,50,110,0,'name',0,704,2,695,1611581057,1,453,2),(1746,243,50,110,0,'name',0,501,3,453,1611581057,1,704,2),(1747,243,50,110,0,'name',0,506,4,704,1611581057,1,501,2),(1748,243,50,110,0,'name',0,588,5,501,1611581057,1,506,2),(1749,244,50,110,0,'identifier',0,705,6,506,1611581057,1,588,2),(1750,244,50,110,0,'identifier',0,501,7,588,1611581057,1,705,2),(1751,246,50,110,0,'content',0,706,8,705,1611581057,1,501,2),(1752,246,50,110,0,'content',0,445,9,501,1611581057,1,706,2),(1753,246,50,110,0,'content',0,492,10,706,1611581057,1,445,2),(1754,246,50,110,0,'content',0,500,11,445,1611581057,1,492,2),(1755,246,50,110,0,'content',0,471,12,492,1611581057,1,500,2),(1756,246,50,110,0,'content',0,501,13,500,1611581057,1,471,2),(1757,246,50,110,0,'content',0,454,14,471,1611581057,1,501,2),(1758,246,50,110,0,'content',0,695,15,501,1611581057,1,454,2),(1759,246,50,110,0,'content',0,0,16,454,1611581057,1,695,2),(1760,243,50,72,0,'name',0,707,0,0,1611581049,1,485,3),(1761,243,50,72,0,'name',0,625,1,485,1611581049,1,707,3),(1762,243,50,72,0,'name',0,708,2,707,1611581049,1,625,3),(1763,244,50,72,0,'identifier',0,709,3,625,1611581049,1,708,3),(1764,245,50,72,0,'context',0,445,4,708,1611581049,1,709,3),(1765,246,50,72,0,'content',0,492,5,709,1611581049,1,445,3),(1766,246,50,72,0,'content',0,710,6,445,1611581049,1,492,3),(1767,246,50,72,0,'content',0,631,7,492,1611581049,1,710,3),(1768,243,50,111,0,'name',0,718,0,0,1611581057,1,717,3),(1769,246,50,72,0,'content',0,711,8,710,1611581049,1,631,3),(1770,243,50,111,0,'name',0,719,1,717,1611581057,1,718,3),(1771,246,50,72,0,'content',0,597,9,631,1611581049,1,711,3),(1772,243,50,111,0,'name',0,493,2,718,1611581057,1,719,3),(1773,246,50,72,0,'content',0,592,10,711,1611581049,1,597,3),(1774,243,50,111,0,'name',0,720,3,719,1611581057,1,493,3),(1775,246,50,72,0,'content',0,623,11,597,1611581049,1,592,3),(1776,244,50,111,0,'identifier',0,719,4,493,1611581057,1,720,3),(1777,246,50,72,0,'content',0,636,12,592,1611581049,1,623,3),(1778,246,50,111,0,'content',0,716,5,720,1611581057,1,719,3),(1779,246,50,72,0,'content',0,631,13,623,1611581049,1,636,3),(1780,246,50,111,0,'content',0,721,6,719,1611581057,1,716,3),(1781,246,50,72,0,'content',0,712,14,636,1611581049,1,631,3),(1782,246,50,111,0,'content',0,0,7,716,1611581057,1,721,3),(1783,246,50,72,0,'content',0,597,15,631,1611581049,1,712,3),(1784,246,50,72,0,'content',0,453,16,712,1611581049,1,597,3),(1785,246,50,72,0,'content',0,464,17,597,1611581049,1,453,3),(1786,246,50,72,0,'content',0,625,18,453,1611581049,1,464,3),(1787,246,50,72,0,'content',0,713,19,464,1611581049,1,625,3),(1788,246,50,72,0,'content',0,566,20,625,1611581049,1,713,3),(1789,246,50,72,0,'content',0,714,21,713,1611581049,1,566,3),(1790,246,50,72,0,'content',0,660,22,566,1611581049,1,714,3),(1791,246,50,72,0,'content',0,592,23,714,1611581049,1,660,3),(1792,246,50,72,0,'content',0,662,24,660,1611581049,1,592,3),(1793,246,50,72,0,'content',0,663,25,592,1611581049,1,662,3),(1794,246,50,72,0,'content',0,490,26,662,1611581049,1,663,3),(1795,246,50,72,0,'content',0,457,27,663,1611581049,1,490,3),(1796,246,50,72,0,'content',0,707,28,490,1611581049,1,457,3),(1797,246,50,72,0,'content',0,625,29,457,1611581049,1,707,3),(1798,246,50,72,0,'content',0,715,30,707,1611581049,1,625,3),(1799,246,50,72,0,'content',0,631,31,625,1611581049,1,715,3),(1800,246,50,72,0,'content',0,662,32,715,1611581049,1,631,3),(1801,246,50,72,0,'content',0,663,33,631,1611581049,1,662,3),(1802,246,50,72,0,'content',0,672,34,662,1611581049,1,663,3),(1803,246,50,72,0,'content',0,566,35,663,1611581049,1,672,3),(1804,246,50,72,0,'content',0,716,36,672,1611581049,1,566,3),(1805,246,50,72,0,'content',0,0,37,566,1611581049,1,716,3),(1806,243,50,112,0,'name',0,718,0,0,1611581057,1,717,3),(1807,243,50,112,0,'name',0,490,1,717,1611581057,1,718,3),(1808,243,50,112,0,'name',0,719,2,718,1611581057,1,490,3),(1809,243,50,112,0,'name',0,505,3,490,1611581057,1,719,3),(1810,243,50,112,0,'name',0,722,4,719,1611581057,1,505,3),(1811,244,50,112,0,'identifier',0,476,5,505,1611581057,1,722,3),(1812,246,50,112,0,'content',0,514,6,722,1611581057,1,476,3),(1813,246,50,112,0,'content',0,723,7,476,1611581057,1,514,3),(1814,246,50,112,0,'content',0,724,8,514,1611581057,1,723,3),(1815,246,50,112,0,'content',0,453,9,723,1611581057,1,724,3),(1816,246,50,112,0,'content',0,457,10,724,1611581057,1,453,3),(1817,246,50,112,0,'content',0,514,11,453,1611581057,1,457,3),(1818,246,50,112,0,'content',0,555,12,457,1611581057,1,514,3),(1819,246,50,112,0,'content',0,654,13,514,1611581057,1,555,3),(1820,246,50,112,0,'content',0,725,14,555,1611581057,1,654,3),(1821,246,50,112,0,'content',0,457,15,654,1611581057,1,725,3),(1822,246,50,112,0,'content',0,726,16,725,1611581057,1,457,3),(1823,246,50,112,0,'content',0,453,17,457,1611581057,1,726,3),(1824,246,50,112,0,'content',0,727,18,726,1611581057,1,453,3),(1825,246,50,112,0,'content',0,471,19,453,1611581057,1,727,3),(1826,246,50,112,0,'content',0,501,20,727,1611581057,1,471,3),(1827,246,50,112,0,'content',0,719,21,471,1611581057,1,501,3),(1828,246,50,112,0,'content',0,0,22,501,1611581057,1,719,3),(1829,243,50,73,0,'name',0,728,0,0,1611581049,1,485,3),(1830,243,50,73,0,'name',0,708,1,485,1611581049,1,728,3),(1831,244,50,73,0,'identifier',0,728,2,728,1611581049,1,708,3),(1832,245,50,73,0,'context',0,622,3,708,1611581049,1,728,3),(1833,246,50,73,0,'content',0,464,4,728,1611581049,1,622,3),(1834,246,50,73,0,'content',0,728,5,622,1611581049,1,464,3),(1835,246,50,73,0,'content',0,453,6,464,1611581049,1,728,3),(1836,246,50,73,0,'content',0,729,7,728,1611581049,1,453,3),(1837,246,50,73,0,'content',0,730,8,453,1611581049,1,729,3),(1838,246,50,73,0,'content',0,490,9,729,1611581049,1,730,3),(1839,246,50,73,0,'content',0,731,10,730,1611581049,1,490,3),(1840,246,50,73,0,'content',0,0,11,490,1611581049,1,731,3),(1841,243,50,113,0,'name',0,718,0,0,1611581058,1,732,3),(1842,243,50,113,0,'name',0,719,1,732,1611581058,1,718,3),(1843,243,50,113,0,'name',0,493,2,718,1611581058,1,719,3),(1844,243,50,113,0,'name',0,733,3,719,1611581058,1,493,3),(1845,244,50,113,0,'identifier',0,670,4,493,1611581058,1,733,3),(1846,246,50,113,0,'content',0,570,5,733,1611581058,1,670,3),(1847,243,50,74,0,'name',0,591,0,0,1611581050,1,737,3),(1848,246,50,113,0,'content',0,734,6,670,1611581058,1,570,3),(1849,243,50,74,0,'name',0,738,1,737,1611581050,1,591,3),(1850,246,50,113,0,'content',0,464,7,570,1611581058,1,734,3),(1851,243,50,74,0,'name',0,739,2,591,1611581050,1,738,3),(1852,246,50,113,0,'content',0,582,8,734,1611581058,1,464,3),(1853,243,50,74,0,'name',0,592,3,738,1611581050,1,739,3),(1854,246,50,113,0,'content',0,654,9,464,1611581058,1,582,3),(1855,243,50,74,0,'name',0,515,4,739,1611581050,1,592,3),(1856,246,50,113,0,'content',0,725,10,582,1611581058,1,654,3),(1857,246,50,113,0,'content',0,490,11,654,1611581058,1,725,3),(1858,243,50,74,0,'name',0,516,5,592,1611581050,1,515,3),(1859,246,50,113,0,'content',0,735,12,725,1611581058,1,490,3),(1860,243,50,74,0,'name',0,740,6,515,1611581050,1,516,3),(1861,246,50,113,0,'content',0,592,13,490,1611581058,1,735,3),(1862,244,50,74,0,'identifier',0,741,7,516,1611581050,1,740,3),(1863,246,50,113,0,'content',0,736,14,735,1611581058,1,592,3),(1864,244,50,74,0,'identifier',0,654,8,740,1611581050,1,741,3),(1865,246,50,113,0,'content',0,0,15,592,1611581058,1,736,3),(1866,246,50,74,0,'content',0,737,9,741,1611581050,1,654,3),(1867,246,50,74,0,'content',0,591,10,654,1611581050,1,737,3),(1868,246,50,74,0,'content',0,515,11,737,1611581050,1,591,3),(1869,246,50,74,0,'content',0,516,12,591,1611581050,1,515,3),(1870,246,50,74,0,'content',0,0,13,515,1611581050,1,516,3),(1871,243,50,114,0,'name',0,718,0,0,1611581058,1,732,3),(1872,243,50,114,0,'name',0,490,1,732,1611581058,1,718,3),(1873,243,50,114,0,'name',0,719,2,718,1611581058,1,490,3),(1874,243,50,114,0,'name',0,742,3,490,1611581058,1,719,3),(1875,243,50,114,0,'name',0,743,4,719,1611581058,1,742,3),(1876,244,50,114,0,'identifier',0,670,5,742,1611581058,1,743,3),(1877,243,50,75,0,'name',0,744,0,0,1611581050,1,738,2),(1878,246,50,114,0,'content',0,570,6,743,1611581058,1,670,3),(1879,243,50,75,0,'name',0,745,1,738,1611581050,1,744,2),(1880,246,50,114,0,'content',0,734,7,670,1611581058,1,570,3),(1881,243,50,75,0,'name',0,746,2,744,1611581050,1,745,2),(1882,246,50,114,0,'content',0,464,8,570,1611581058,1,734,3),(1883,244,50,75,0,'identifier',0,644,3,745,1611581050,1,746,2),(1884,246,50,114,0,'content',0,582,9,734,1611581058,1,464,3),(1885,246,50,75,0,'content',0,747,4,746,1611581050,1,644,2),(1886,246,50,114,0,'content',0,654,10,464,1611581058,1,582,3),(1887,246,50,75,0,'content',0,457,5,644,1611581050,1,747,2),(1888,246,50,114,0,'content',0,725,11,582,1611581058,1,654,3),(1889,246,50,75,0,'content',0,552,6,747,1611581050,1,457,2),(1890,246,50,114,0,'content',0,490,12,654,1611581058,1,725,3),(1891,246,50,75,0,'content',0,445,7,457,1611581050,1,552,2),(1892,246,50,114,0,'content',0,735,13,725,1611581058,1,490,3),(1893,246,50,75,0,'content',0,748,8,552,1611581050,1,445,2),(1894,246,50,114,0,'content',0,592,14,490,1611581058,1,735,3),(1895,246,50,75,0,'content',0,453,9,445,1611581050,1,748,2),(1896,246,50,114,0,'content',0,736,15,735,1611581058,1,592,3),(1897,246,50,75,0,'content',0,591,10,748,1611581050,1,453,2),(1898,246,50,114,0,'content',0,0,16,592,1611581058,1,736,3),(1899,246,50,75,0,'content',0,738,11,453,1611581050,1,591,2),(1900,246,50,75,0,'content',0,749,12,591,1611581050,1,738,2),(1901,246,50,75,0,'content',0,750,13,738,1611581050,1,749,2),(1902,246,50,75,0,'content',0,0,14,749,1611581050,1,750,2),(1903,243,50,115,0,'name',0,548,0,0,1611581058,1,547,3),(1904,243,50,115,0,'name',0,751,1,547,1611581058,1,548,3),(1905,243,50,115,0,'name',0,752,2,548,1611581058,1,751,3),(1906,243,50,115,0,'name',0,753,3,751,1611581058,1,752,3),(1907,244,50,115,0,'identifier',0,445,4,752,1611581058,1,753,3),(1908,243,50,76,0,'name',0,718,0,0,1611581050,1,717,3),(1909,246,50,115,0,'content',0,492,5,753,1611581058,1,445,3),(1910,246,50,115,0,'content',0,751,6,445,1611581058,1,492,3),(1911,243,50,76,0,'name',0,515,1,717,1611581050,1,718,3),(1912,246,50,115,0,'content',0,457,7,492,1611581058,1,751,3),(1913,243,50,76,0,'name',0,588,2,718,1611581050,1,515,3),(1914,246,50,115,0,'content',0,752,8,751,1611581058,1,457,3),(1915,244,50,76,0,'identifier',0,754,3,515,1611581050,1,588,3),(1916,246,50,115,0,'content',0,555,9,457,1611581058,1,752,3),(1917,244,50,76,0,'identifier',0,551,4,588,1611581050,1,754,3),(1918,246,50,115,0,'content',0,695,10,752,1611581058,1,555,3),(1919,246,50,76,0,'content',0,445,5,754,1611581050,1,551,3),(1920,246,50,115,0,'content',0,0,11,555,1611581058,1,695,3),(1921,246,50,76,0,'content',0,490,6,551,1611581050,1,445,3),(1922,246,50,76,0,'content',0,755,7,445,1611581050,1,490,3),(1923,246,50,76,0,'content',0,461,8,490,1611581050,1,755,3),(1924,246,50,76,0,'content',0,582,9,755,1611581050,1,461,3),(1925,246,50,76,0,'content',0,0,10,461,1611581050,1,582,3),(1926,243,50,116,0,'name',0,548,0,0,1611581058,1,547,3),(1927,243,50,116,0,'name',0,751,1,547,1611581058,1,548,3),(1928,243,50,116,0,'name',0,756,2,548,1611581058,1,751,3),(1929,243,50,116,0,'name',0,454,3,751,1611581058,1,756,3),(1930,243,50,116,0,'name',0,757,4,756,1611581058,1,454,3),(1931,243,50,77,0,'name',0,758,0,0,1611581050,1,485,3),(1932,244,50,116,0,'identifier',0,445,5,454,1611581058,1,757,3),(1933,243,50,77,0,'name',0,475,1,485,1611581050,1,758,3),(1934,246,50,116,0,'content',0,492,6,757,1611581058,1,445,3),(1935,243,50,77,0,'name',0,552,2,758,1611581050,1,475,3),(1936,246,50,116,0,'content',0,751,7,445,1611581058,1,492,3),(1937,246,50,116,0,'content',0,457,8,492,1611581058,1,751,3),(1938,243,50,77,0,'name',0,759,3,475,1611581050,1,552,3),(1939,246,50,116,0,'content',0,454,9,751,1611581058,1,457,3),(1940,244,50,77,0,'identifier',0,461,4,552,1611581050,1,759,3),(1941,246,50,116,0,'content',0,695,10,457,1611581058,1,454,3),(1942,246,50,77,0,'content',0,463,5,759,1611581050,1,461,3),(1943,246,50,116,0,'content',0,0,11,454,1611581058,1,695,3),(1944,246,50,77,0,'content',0,471,6,461,1611581050,1,463,3),(1945,246,50,77,0,'content',0,758,7,463,1611581050,1,471,3),(1946,246,50,77,0,'content',0,475,8,471,1611581050,1,758,3),(1947,246,50,77,0,'content',0,457,9,758,1611581050,1,475,3),(1948,246,50,77,0,'content',0,552,10,475,1611581050,1,457,3),(1949,246,50,77,0,'content',0,481,11,457,1611581050,1,552,3),(1950,246,50,77,0,'content',0,445,12,552,1611581050,1,481,3),(1951,246,50,77,0,'content',0,566,13,481,1611581050,1,445,3),(1952,246,50,77,0,'content',0,760,14,445,1611581050,1,566,3),(1953,246,50,77,0,'content',0,476,15,566,1611581050,1,760,3),(1954,246,50,77,0,'content',0,761,16,760,1611581050,1,476,3),(1955,246,50,77,0,'content',0,563,17,476,1611581050,1,761,3),(1956,246,50,77,0,'content',0,564,18,761,1611581050,1,563,3),(1957,246,50,77,0,'content',0,445,19,563,1611581050,1,564,3),(1958,246,50,77,0,'content',0,632,20,564,1611581050,1,445,3),(1959,246,50,77,0,'content',0,642,21,445,1611581050,1,632,3),(1960,246,50,77,0,'content',0,762,22,632,1611581050,1,642,3),(1961,246,50,77,0,'content',0,453,23,642,1611581050,1,762,3),(1962,246,50,77,0,'content',0,464,24,762,1611581050,1,453,3),(1963,246,50,77,0,'content',0,563,25,453,1611581050,1,464,3),(1964,246,50,77,0,'content',0,763,26,464,1611581050,1,563,3),(1965,246,50,77,0,'content',0,764,27,563,1611581050,1,763,3),(1966,246,50,77,0,'content',0,765,28,763,1611581050,1,764,3),(1967,246,50,77,0,'content',0,656,29,764,1611581050,1,765,3),(1968,246,50,77,0,'content',0,464,30,765,1611581050,1,656,3),(1969,246,50,77,0,'content',0,552,31,656,1611581050,1,464,3),(1970,246,50,77,0,'content',0,766,32,464,1611581050,1,552,3),(1971,246,50,77,0,'content',0,0,33,552,1611581050,1,766,3),(1972,243,50,117,0,'name',0,767,0,0,1611581058,1,756,3),(1973,243,50,117,0,'name',0,663,1,756,1611581058,1,767,3),(1974,243,50,117,0,'name',0,547,2,767,1611581058,1,663,3),(1975,243,50,117,0,'name',0,548,3,663,1611581058,1,547,3),(1976,243,50,117,0,'name',0,768,4,547,1611581058,1,548,3),(1977,244,50,117,0,'identifier',0,445,5,548,1611581058,1,768,3),(1978,246,50,117,0,'content',0,672,6,768,1611581058,1,445,3),(1979,246,50,117,0,'content',0,751,7,445,1611581058,1,672,3),(1980,246,50,117,0,'content',0,457,8,672,1611581058,1,751,3),(1981,246,50,117,0,'content',0,767,9,751,1611581058,1,457,3),(1982,243,50,78,0,'name',0,770,0,0,1611581050,1,769,3),(1983,246,50,117,0,'content',0,663,10,457,1611581058,1,767,3),(1984,246,50,117,0,'content',0,695,11,767,1611581058,1,663,3),(1985,243,50,78,0,'name',0,771,1,769,1611581050,1,770,3),(1986,246,50,117,0,'content',0,0,12,663,1611581058,1,695,3),(1987,244,50,78,0,'identifier',0,654,2,770,1611581050,1,771,3),(1988,246,50,78,0,'content',0,737,3,771,1611581050,1,654,3),(1989,246,50,78,0,'content',0,591,4,654,1611581050,1,737,3),(1990,246,50,78,0,'content',0,769,5,737,1611581050,1,591,3),(1991,246,50,78,0,'content',0,770,6,591,1611581050,1,769,3),(1992,246,50,78,0,'content',0,0,7,769,1611581050,1,770,3),(1993,243,50,118,0,'name',0,732,0,0,1611581059,1,772,3),(1994,243,50,118,0,'name',0,718,1,772,1611581059,1,732,3),(1995,243,50,118,0,'name',0,773,2,732,1611581059,1,718,3),(1996,244,50,118,0,'identifier',0,774,3,718,1611581059,1,773,3),(1997,246,50,118,0,'content',0,735,4,773,1611581059,1,774,3),(1998,246,50,118,0,'content',0,775,5,774,1611581059,1,735,3),(1999,246,50,118,0,'content',0,658,6,735,1611581059,1,775,3),(2000,246,50,118,0,'content',0,776,7,775,1611581059,1,658,3),(2001,246,50,118,0,'content',0,0,8,658,1611581059,1,776,3),(2002,243,50,79,0,'name',0,718,0,0,1611581050,1,717,3),(2003,243,50,79,0,'name',0,572,1,717,1611581050,1,718,3),(2004,243,50,79,0,'name',0,582,2,718,1611581050,1,572,3),(2005,243,50,79,0,'name',0,777,3,572,1611581050,1,582,3),(2006,244,50,79,0,'identifier',0,551,4,582,1611581050,1,777,3),(2007,246,50,79,0,'content',0,445,5,777,1611581050,1,551,3),(2008,246,50,79,0,'content',0,778,6,551,1611581050,1,445,3),(2009,246,50,79,0,'content',0,779,7,445,1611581050,1,778,3),(2010,246,50,79,0,'content',0,490,8,778,1611581050,1,779,3),(2011,246,50,79,0,'content',0,457,9,779,1611581050,1,490,3),(2012,246,50,79,0,'content',0,505,10,490,1611581050,1,457,3),(2013,246,50,79,0,'content',0,713,11,457,1611581050,1,505,3),(2014,246,50,79,0,'content',0,632,12,505,1611581050,1,713,3),(2015,246,50,79,0,'content',0,780,13,713,1611581050,1,632,3),(2016,246,50,79,0,'content',0,700,14,632,1611581050,1,780,3),(2017,246,50,79,0,'content',0,524,15,780,1611581050,1,700,3),(2018,246,50,79,0,'content',0,781,16,700,1611581050,1,524,3),(2019,246,50,79,0,'content',0,524,17,524,1611581050,1,781,3),(2020,246,50,79,0,'content',0,782,18,781,1611581050,1,524,3),(2021,246,50,79,0,'content',0,0,19,524,1611581050,1,782,3),(2022,243,50,119,0,'name',0,718,0,0,1611581059,1,717,3),(2023,243,50,119,0,'name',0,783,1,717,1611581059,1,718,3),(2024,243,50,119,0,'name',0,611,2,718,1611581059,1,783,3),(2025,243,50,119,0,'name',0,706,3,783,1611581059,1,611,3),(2026,243,50,119,0,'name',0,784,4,611,1611581059,1,706,3),(2027,244,50,119,0,'identifier',0,551,5,706,1611581059,1,784,3),(2028,246,50,119,0,'content',0,445,6,784,1611581059,1,551,3),(2029,246,50,119,0,'content',0,490,7,551,1611581059,1,445,3),(2030,246,50,119,0,'content',0,785,8,445,1611581059,1,490,3),(2031,246,50,119,0,'content',0,457,9,490,1611581059,1,785,3),(2032,246,50,119,0,'content',0,454,10,785,1611581059,1,457,3),(2033,246,50,119,0,'content',0,0,11,457,1611581059,1,454,3),(2034,243,50,80,0,'name',0,548,0,0,1611581051,1,547,3),(2035,243,50,80,0,'name',0,572,1,547,1611581051,1,548,3),(2036,243,50,80,0,'name',0,582,2,548,1611581051,1,572,3),(2037,243,50,80,0,'name',0,786,3,572,1611581051,1,582,3),(2038,244,50,80,0,'identifier',0,654,4,582,1611581051,1,786,3),(2039,246,50,80,0,'content',0,787,5,786,1611581051,1,654,3),(2040,246,50,80,0,'content',0,573,6,654,1611581051,1,787,3),(2041,246,50,80,0,'content',0,471,7,787,1611581051,1,573,3),(2042,246,50,80,0,'content',0,718,8,573,1611581051,1,471,3),(2043,246,50,80,0,'content',0,713,9,471,1611581051,1,718,3),(2044,246,50,80,0,'content',0,632,10,718,1611581051,1,713,3),(2045,246,50,80,0,'content',0,788,11,713,1611581051,1,632,3),(2046,246,50,80,0,'content',0,789,12,632,1611581051,1,788,3),(2047,246,50,80,0,'content',0,524,13,788,1611581051,1,789,3),(2048,246,50,80,0,'content',0,781,14,789,1611581051,1,524,3),(2049,246,50,80,0,'content',0,524,15,524,1611581051,1,781,3),(2050,246,50,80,0,'content',0,782,16,781,1611581051,1,524,3),(2051,246,50,80,0,'content',0,0,17,524,1611581051,1,782,3),(2052,243,50,120,0,'name',0,718,0,0,1611581059,1,717,3),(2053,243,50,120,0,'name',0,751,1,717,1611581059,1,718,3),(2054,243,50,120,0,'name',0,752,2,718,1611581059,1,751,3),(2055,243,50,120,0,'name',0,790,3,751,1611581059,1,752,3),(2056,244,50,120,0,'identifier',0,457,4,752,1611581059,1,790,3),(2057,246,50,120,0,'content',0,752,5,790,1611581059,1,457,3),(2058,246,50,120,0,'content',0,555,6,457,1611581059,1,752,3),(2059,246,50,120,0,'content',0,791,7,752,1611581059,1,555,3),(2060,246,50,120,0,'content',0,682,8,555,1611581059,1,791,3),(2061,246,50,120,0,'content',0,721,9,791,1611581059,1,682,3),(2062,246,50,120,0,'content',0,792,10,682,1611581059,1,721,3),(2063,246,50,120,0,'content',0,0,11,721,1611581059,1,792,3),(2064,243,50,81,0,'name',0,505,0,0,1611581051,1,793,3),(2065,243,50,81,0,'name',0,794,1,793,1611581051,1,505,3),(2066,243,50,81,0,'name',0,666,2,505,1611581051,1,794,3),(2067,243,50,81,0,'name',0,795,3,794,1611581051,1,666,3),(2068,244,50,81,0,'identifier',0,695,4,666,1611581051,1,795,3),(2069,246,50,81,0,'content',0,445,5,795,1611581051,1,695,3),(2070,246,50,81,0,'content',0,492,6,695,1611581051,1,445,3),(2071,246,50,81,0,'content',0,658,7,445,1611581051,1,492,3),(2072,246,50,81,0,'content',0,471,8,492,1611581051,1,658,3),(2073,246,50,81,0,'content',0,637,9,658,1611581051,1,471,3),(2074,246,50,81,0,'content',0,475,10,471,1611581051,1,637,3),(2075,246,50,81,0,'content',0,796,11,637,1611581051,1,475,3),(2076,246,50,81,0,'content',0,797,12,475,1611581051,1,796,3),(2077,246,50,81,0,'content',0,447,13,796,1611581051,1,797,3),(2078,246,50,81,0,'content',0,798,14,797,1611581051,1,447,3),(2079,246,50,81,0,'content',0,490,15,447,1611581051,1,798,3),(2080,246,50,81,0,'content',0,799,16,798,1611581051,1,490,3),(2081,246,50,81,0,'content',0,445,17,490,1611581051,1,799,3),(2082,243,50,121,0,'name',0,718,0,0,1611581059,1,717,3),(2083,246,50,81,0,'content',0,492,18,799,1611581051,1,445,3),(2084,243,50,121,0,'name',0,751,1,717,1611581059,1,718,3),(2085,246,50,81,0,'content',0,800,19,445,1611581051,1,492,3),(2086,243,50,121,0,'name',0,556,2,718,1611581059,1,751,3),(2087,246,50,81,0,'content',0,476,20,492,1611581051,1,800,3),(2088,246,50,81,0,'content',0,552,21,800,1611581051,1,476,3),(2089,243,50,121,0,'name',0,809,3,751,1611581059,1,556,3),(2090,246,50,81,0,'content',0,464,22,476,1611581051,1,552,3),(2091,244,50,121,0,'identifier',0,481,4,556,1611581059,1,809,3),(2092,246,50,81,0,'content',0,752,23,552,1611581051,1,464,3),(2093,246,50,121,0,'content',0,457,5,809,1611581059,1,481,3),(2094,246,50,81,0,'content',0,632,24,464,1611581051,1,752,3),(2095,246,50,121,0,'content',0,454,6,481,1611581059,1,457,3),(2096,246,50,81,0,'content',0,727,25,752,1611581051,1,632,3),(2097,246,50,121,0,'content',0,810,7,457,1611581059,1,454,3),(2098,246,50,81,0,'content',0,476,26,632,1611581051,1,727,3),(2099,246,50,121,0,'content',0,689,8,454,1611581059,1,810,3),(2100,246,50,81,0,'content',0,514,27,727,1611581051,1,476,3),(2101,246,50,121,0,'content',0,566,9,810,1611581059,1,689,3),(2102,246,50,81,0,'content',0,524,28,476,1611581051,1,514,3),(2103,246,50,121,0,'content',0,471,10,689,1611581059,1,566,3),(2104,246,50,81,0,'content',0,653,29,514,1611581051,1,524,3),(2105,246,50,121,0,'content',0,706,11,566,1611581059,1,471,3),(2106,246,50,81,0,'content',0,445,30,524,1611581051,1,653,3),(2107,246,50,121,0,'content',0,811,12,471,1611581059,1,706,3),(2108,246,50,81,0,'content',0,492,31,653,1611581051,1,445,3),(2109,246,50,121,0,'content',0,457,13,706,1611581059,1,811,3),(2110,246,50,81,0,'content',0,493,32,445,1611581051,1,492,3),(2111,246,50,121,0,'content',0,556,14,811,1611581059,1,457,3),(2112,246,50,81,0,'content',0,597,33,492,1611581051,1,493,3),(2113,246,50,121,0,'content',0,555,15,457,1611581059,1,556,3),(2114,246,50,81,0,'content',0,631,34,493,1611581051,1,597,3),(2115,246,50,121,0,'content',0,791,16,556,1611581059,1,555,3),(2116,246,50,81,0,'content',0,464,35,597,1611581051,1,631,3),(2117,246,50,121,0,'content',0,682,17,555,1611581059,1,791,3),(2118,246,50,81,0,'content',0,801,36,631,1611581051,1,464,3),(2119,246,50,121,0,'content',0,792,18,791,1611581059,1,682,3),(2120,246,50,81,0,'content',0,555,37,464,1611581051,1,801,3),(2121,246,50,121,0,'content',0,481,19,682,1611581059,1,792,3),(2122,246,50,81,0,'content',0,490,38,801,1611581051,1,555,3),(2123,246,50,121,0,'content',0,457,20,792,1611581059,1,481,3),(2124,246,50,81,0,'content',0,461,39,555,1611581051,1,490,3),(2125,246,50,121,0,'content',0,454,21,481,1611581059,1,457,3),(2126,246,50,81,0,'content',0,552,40,490,1611581051,1,461,3),(2127,246,50,121,0,'content',0,791,22,457,1611581059,1,454,3),(2128,246,50,81,0,'content',0,481,41,461,1611581051,1,552,3),(2129,246,50,121,0,'content',0,471,23,454,1611581059,1,791,3),(2130,246,50,81,0,'content',0,802,42,552,1611581051,1,481,3),(2131,246,50,121,0,'content',0,706,24,791,1611581059,1,471,3),(2132,246,50,81,0,'content',0,803,43,481,1611581051,1,802,3),(2133,246,50,121,0,'content',0,811,25,471,1611581059,1,706,3),(2134,246,50,81,0,'content',0,464,44,802,1611581051,1,803,3),(2135,246,50,121,0,'content',0,457,26,706,1611581059,1,811,3),(2136,246,50,81,0,'content',0,552,45,803,1611581051,1,464,3),(2137,246,50,121,0,'content',0,812,27,811,1611581059,1,457,3),(2138,246,50,81,0,'content',0,592,46,464,1611581051,1,552,3),(2139,246,50,121,0,'content',0,566,28,457,1611581059,1,812,3),(2140,246,50,81,0,'content',0,623,47,552,1611581051,1,592,3),(2141,246,50,121,0,'content',0,453,29,812,1611581059,1,566,3),(2142,246,50,81,0,'content',0,471,48,592,1611581051,1,623,3),(2143,246,50,121,0,'content',0,642,30,566,1611581059,1,453,3),(2144,246,50,81,0,'content',0,804,49,623,1611581051,1,471,3),(2145,246,50,121,0,'content',0,813,31,453,1611581059,1,642,3),(2146,246,50,81,0,'content',0,490,50,471,1611581051,1,804,3),(2147,246,50,121,0,'content',0,814,32,642,1611581059,1,813,3),(2148,246,50,81,0,'content',0,464,51,804,1611581051,1,490,3),(2149,246,50,121,0,'content',0,476,33,813,1611581059,1,814,3),(2150,246,50,81,0,'content',0,752,52,490,1611581051,1,464,3),(2151,246,50,121,0,'content',0,514,34,814,1611581059,1,476,3),(2152,246,50,81,0,'content',0,481,53,464,1611581051,1,752,3),(2153,246,50,121,0,'content',0,791,35,476,1611581059,1,514,3),(2154,246,50,81,0,'content',0,445,54,752,1611581051,1,481,3),(2155,246,50,121,0,'content',0,682,36,514,1611581059,1,791,3),(2156,246,50,81,0,'content',0,482,55,481,1611581051,1,445,3),(2157,246,50,121,0,'content',0,724,37,791,1611581059,1,682,3),(2158,246,50,81,0,'content',0,453,56,445,1611581051,1,482,3),(2159,246,50,121,0,'content',0,453,38,682,1611581059,1,724,3),(2160,246,50,81,0,'content',0,800,57,482,1611581051,1,453,3),(2161,246,50,121,0,'content',0,464,39,724,1611581059,1,453,3),(2162,246,50,81,0,'content',0,476,58,453,1611581051,1,800,3),(2163,246,50,121,0,'content',0,533,40,453,1611581059,1,464,3),(2164,246,50,81,0,'content',0,552,59,800,1611581051,1,476,3),(2165,246,50,121,0,'content',0,0,41,464,1611581059,1,533,3),(2166,246,50,81,0,'content',0,805,60,476,1611581051,1,552,3),(2167,246,50,81,0,'content',0,806,61,552,1611581051,1,805,3),(2168,246,50,81,0,'content',0,797,62,805,1611581051,1,806,3),(2169,246,50,81,0,'content',0,445,63,806,1611581051,1,797,3),(2170,246,50,81,0,'content',0,688,64,797,1611581051,1,445,3),(2171,246,50,81,0,'content',0,689,65,445,1611581051,1,688,3),(2172,246,50,81,0,'content',0,566,66,688,1611581051,1,689,3),(2173,246,50,81,0,'content',0,476,67,689,1611581051,1,566,3),(2174,246,50,81,0,'content',0,807,68,566,1611581051,1,476,3),(2175,246,50,81,0,'content',0,625,69,476,1611581051,1,807,3),(2176,246,50,81,0,'content',0,808,70,807,1611581051,1,625,3),(2177,246,50,81,0,'content',0,552,71,625,1611581051,1,808,3),(2178,246,50,81,0,'content',0,631,72,808,1611581051,1,552,3),(2179,246,50,81,0,'content',0,710,73,552,1611581051,1,631,3),(2180,246,50,81,0,'content',0,469,74,631,1611581051,1,710,3),(2181,246,50,81,0,'content',0,0,75,710,1611581051,1,469,3),(2182,243,50,122,0,'name',0,718,0,0,1611581059,1,717,3),(2183,243,50,122,0,'name',0,751,1,717,1611581059,1,718,3),(2184,243,50,122,0,'name',0,815,2,718,1611581059,1,751,3),(2185,243,50,122,0,'name',0,816,3,751,1611581059,1,815,3),(2186,244,50,122,0,'identifier',0,457,4,815,1611581059,1,816,3),(2187,246,50,122,0,'content',0,454,5,816,1611581059,1,457,3),(2188,246,50,122,0,'content',0,791,6,457,1611581059,1,454,3),(2189,246,50,122,0,'content',0,682,7,454,1611581059,1,791,3),(2190,246,50,122,0,'content',0,792,8,791,1611581059,1,682,3),(2191,246,50,122,0,'content',0,0,9,682,1611581059,1,792,3),(2192,243,50,82,0,'name',0,724,0,0,1611581051,1,625,3),(2193,243,50,82,0,'name',0,453,1,625,1611581051,1,724,3),(2194,243,50,82,0,'name',0,817,2,724,1611581051,1,453,3),(2195,243,50,82,0,'name',0,818,3,453,1611581051,1,817,3),(2196,244,50,82,0,'identifier',0,457,4,817,1611581051,1,818,3),(2197,246,50,82,0,'content',0,625,5,818,1611581051,1,457,3),(2198,246,50,82,0,'content',0,463,6,457,1611581051,1,625,3),(2199,246,50,82,0,'content',0,449,7,625,1611581051,1,463,3),(2200,246,50,82,0,'content',0,511,8,463,1611581051,1,449,3),(2201,246,50,82,0,'content',0,464,9,449,1611581051,1,511,3),(2202,246,50,82,0,'content',0,799,10,511,1611581051,1,464,3),(2203,246,50,82,0,'content',0,819,11,464,1611581051,1,799,3),(2204,246,50,82,0,'content',0,820,12,799,1611581051,1,819,3),(2205,243,50,123,0,'name',0,718,0,0,1611581060,1,717,3),(2206,246,50,82,0,'content',0,821,13,819,1611581051,1,820,3),(2207,243,50,123,0,'name',0,772,1,717,1611581060,1,718,3),(2208,246,50,82,0,'content',0,822,14,820,1611581051,1,821,3),(2209,243,50,123,0,'name',0,611,2,718,1611581060,1,772,3),(2210,246,50,82,0,'content',0,823,15,821,1611581051,1,822,3),(2211,243,50,123,0,'name',0,706,3,772,1611581060,1,611,3),(2212,246,50,82,0,'content',0,445,16,822,1611581051,1,823,3),(2213,243,50,123,0,'name',0,828,4,611,1611581060,1,706,3),(2214,246,50,82,0,'content',0,632,17,823,1611581051,1,445,3),(2215,244,50,123,0,'identifier',0,551,5,706,1611581060,1,828,3),(2216,246,50,82,0,'content',0,642,18,445,1611581051,1,632,3),(2217,246,50,123,0,'content',0,445,6,828,1611581060,1,551,3),(2218,246,50,82,0,'content',0,823,19,632,1611581051,1,642,3),(2219,246,50,123,0,'content',0,490,7,551,1611581060,1,445,3),(2220,246,50,123,0,'content',0,457,8,445,1611581060,1,490,3),(2221,246,50,82,0,'content',0,824,20,642,1611581051,1,823,3),(2222,246,50,123,0,'content',0,772,9,490,1611581060,1,457,3),(2223,246,50,82,0,'content',0,825,21,823,1611581051,1,824,3),(2224,246,50,123,0,'content',0,445,10,457,1611581060,1,772,3),(2225,246,50,82,0,'content',0,457,22,824,1611581051,1,825,3),(2226,246,50,123,0,'content',0,632,11,772,1611581060,1,445,3),(2227,246,50,82,0,'content',0,625,23,825,1611581051,1,457,3),(2228,246,50,123,0,'content',0,829,12,445,1611581060,1,632,3),(2229,246,50,82,0,'content',0,463,24,457,1611581051,1,625,3),(2230,246,50,123,0,'content',0,476,13,632,1611581060,1,829,3),(2231,246,50,123,0,'content',0,514,14,829,1611581060,1,476,3),(2232,246,50,82,0,'content',0,826,25,625,1611581051,1,463,3),(2233,246,50,123,0,'content',0,764,15,476,1611581060,1,514,3),(2234,246,50,82,0,'content',0,631,26,463,1611581051,1,826,3),(2235,246,50,123,0,'content',0,457,16,514,1611581060,1,764,3),(2236,246,50,82,0,'content',0,827,27,826,1611581051,1,631,3),(2237,246,50,123,0,'content',0,738,17,764,1611581060,1,457,3),(2238,246,50,82,0,'content',0,0,28,631,1611581051,1,827,3),(2239,246,50,123,0,'content',0,463,18,457,1611581060,1,738,3),(2240,246,50,123,0,'content',0,830,19,738,1611581060,1,463,3),(2241,246,50,123,0,'content',0,644,20,463,1611581060,1,830,3),(2242,246,50,123,0,'content',0,476,21,830,1611581060,1,644,3),(2243,246,50,123,0,'content',0,533,22,644,1611581060,1,476,3),(2244,246,50,123,0,'content',0,0,23,476,1611581060,1,533,3),(2245,243,50,83,0,'name',0,723,0,0,1611581051,1,625,3),(2246,243,50,83,0,'name',0,734,1,625,1611581051,1,723,3),(2247,243,50,83,0,'name',0,453,2,723,1611581051,1,734,3),(2248,243,50,83,0,'name',0,817,3,734,1611581051,1,453,3),(2249,243,50,124,0,'name',0,718,0,0,1611581060,1,717,3),(2250,243,50,83,0,'name',0,558,4,453,1611581051,1,817,3),(2251,243,50,124,0,'name',0,772,1,717,1611581060,1,718,3),(2252,243,50,83,0,'name',0,831,5,817,1611581051,1,558,3),(2253,243,50,124,0,'name',0,606,2,718,1611581060,1,772,3),(2254,243,50,124,0,'name',0,706,3,772,1611581060,1,606,3),(2255,244,50,83,0,'identifier',0,654,6,558,1611581051,1,831,3),(2256,243,50,124,0,'name',0,834,4,606,1611581060,1,706,3),(2257,246,50,83,0,'content',0,832,7,831,1611581051,1,654,3),(2258,244,50,124,0,'identifier',0,551,5,706,1611581060,1,834,3),(2259,246,50,83,0,'content',0,833,8,654,1611581051,1,832,3),(2260,246,50,124,0,'content',0,445,6,834,1611581060,1,551,3),(2261,246,50,83,0,'content',0,457,9,832,1611581051,1,833,3),(2262,246,50,124,0,'content',0,490,7,551,1611581060,1,445,3),(2263,246,50,83,0,'content',0,552,10,833,1611581051,1,457,3),(2264,246,50,124,0,'content',0,457,8,445,1611581060,1,490,3),(2265,246,50,83,0,'content',0,791,11,457,1611581051,1,552,3),(2266,246,50,124,0,'content',0,772,9,490,1611581060,1,457,3),(2267,246,50,124,0,'content',0,511,10,457,1611581060,1,772,3),(2268,246,50,83,0,'content',0,682,12,552,1611581051,1,791,3),(2269,246,50,124,0,'content',0,471,11,772,1611581060,1,511,3),(2270,246,50,83,0,'content',0,813,13,791,1611581051,1,682,3),(2271,246,50,124,0,'content',0,835,12,511,1611581060,1,471,3),(2272,246,50,83,0,'content',0,445,14,682,1611581051,1,813,3),(2273,246,50,124,0,'content',0,836,13,471,1611581060,1,835,3),(2274,246,50,83,0,'content',0,632,15,813,1611581051,1,445,3),(2275,246,50,124,0,'content',0,445,14,835,1611581060,1,836,3),(2276,246,50,83,0,'content',0,727,16,445,1611581051,1,632,3),(2277,246,50,124,0,'content',0,632,15,836,1611581060,1,445,3),(2278,246,50,83,0,'content',0,471,17,632,1611581051,1,727,3),(2279,246,50,124,0,'content',0,829,16,445,1611581060,1,632,3),(2280,246,50,124,0,'content',0,471,17,632,1611581060,1,829,3),(2281,246,50,83,0,'content',0,718,18,727,1611581051,1,471,3),(2282,246,50,124,0,'content',0,837,18,829,1611581060,1,471,3),(2283,246,50,83,0,'content',0,825,19,471,1611581051,1,718,3),(2284,246,50,124,0,'content',0,514,19,471,1611581060,1,837,3),(2285,246,50,83,0,'content',0,457,20,718,1611581051,1,825,3),(2286,246,50,124,0,'content',0,0,20,837,1611581060,1,514,3),(2287,246,50,83,0,'content',0,552,21,825,1611581051,1,457,3),(2288,246,50,83,0,'content',0,463,22,457,1611581051,1,552,3),(2289,246,50,83,0,'content',0,813,23,552,1611581051,1,463,3),(2290,246,50,83,0,'content',0,445,24,463,1611581051,1,813,3),(2291,246,50,83,0,'content',0,632,25,813,1611581051,1,445,3),(2292,246,50,83,0,'content',0,499,26,445,1611581051,1,632,3),(2293,246,50,83,0,'content',0,829,27,632,1611581051,1,499,3),(2294,246,50,83,0,'content',0,476,28,499,1611581051,1,829,3),(2295,246,50,83,0,'content',0,514,29,829,1611581051,1,476,3),(2296,246,50,83,0,'content',0,481,30,476,1611581051,1,514,3),(2297,246,50,83,0,'content',0,457,31,514,1611581051,1,481,3),(2298,246,50,83,0,'content',0,552,32,481,1611581051,1,457,3),(2299,246,50,83,0,'content',0,463,33,457,1611581051,1,552,3),(2300,246,50,83,0,'content',0,827,34,552,1611581051,1,463,3),(2301,246,50,83,0,'content',0,0,35,463,1611581051,1,827,3),(2302,230,47,125,0,'name',0,701,0,0,1611581061,1,614,2),(2303,230,47,125,0,'name',0,838,1,614,1611581061,1,701,2),(2304,233,47,125,0,'depth',5,0,2,701,1611581061,1,838,2),(2305,243,50,84,0,'name',0,799,0,0,1611581051,1,752,3),(2306,243,50,84,0,'name',0,505,1,752,1611581051,1,799,3),(2307,243,50,84,0,'name',0,794,2,799,1611581051,1,505,3),(2308,243,50,84,0,'name',0,666,3,505,1611581051,1,794,3),(2309,243,50,84,0,'name',0,839,4,794,1611581051,1,666,3),(2310,244,50,84,0,'identifier',0,695,5,666,1611581051,1,839,3),(2311,246,50,84,0,'content',0,445,6,839,1611581051,1,695,3),(2312,246,50,84,0,'content',0,492,7,695,1611581051,1,445,3),(2313,246,50,84,0,'content',0,696,8,445,1611581051,1,492,3),(2314,246,50,84,0,'content',0,471,9,492,1611581051,1,696,3),(2315,246,50,84,0,'content',0,637,10,696,1611581051,1,471,3),(2316,246,50,84,0,'content',0,475,11,471,1611581051,1,637,3),(2317,246,50,84,0,'content',0,457,12,637,1611581051,1,475,3),(2318,246,50,84,0,'content',0,799,13,475,1611581051,1,457,3),(2319,246,50,84,0,'content',0,840,14,457,1611581051,1,799,3),(2320,246,50,84,0,'content',0,0,15,799,1611581051,1,840,3),(2321,243,50,85,0,'name',0,505,0,0,1611581052,1,514,3),(2322,243,50,85,0,'name',0,501,1,514,1611581052,1,505,3),(2323,243,50,85,0,'name',0,506,2,505,1611581052,1,501,3),(2324,243,50,85,0,'name',0,841,3,501,1611581052,1,506,3),(2325,244,50,85,0,'identifier',0,464,4,506,1611581052,1,841,3),(2326,246,50,85,0,'content',0,503,5,841,1611581052,1,464,3),(2327,246,50,85,0,'content',0,572,6,464,1611581052,1,503,3),(2328,246,50,85,0,'content',0,791,7,503,1611581052,1,572,3),(2329,246,50,85,0,'content',0,842,8,572,1611581052,1,791,3),(2330,246,50,85,0,'content',0,471,9,791,1611581052,1,842,3),(2331,246,50,85,0,'content',0,452,10,842,1611581052,1,471,3),(2332,1,2,126,0,'title',0,770,0,0,1611581061,1,769,2),(2333,246,50,85,0,'content',0,454,11,471,1611581052,1,452,3),(2334,1,2,126,0,'title',0,769,1,769,1611581061,1,770,2),(2335,246,50,85,0,'content',0,490,12,452,1611581052,1,454,3),(2336,120,2,126,0,'intro',0,770,2,770,1611581061,1,769,2),(2337,246,50,85,0,'content',0,445,13,454,1611581052,1,490,3),(2338,120,2,126,0,'intro',0,847,3,769,1611581061,1,770,2),(2339,246,50,85,0,'content',0,445,14,490,1611581052,1,445,3),(2340,353,2,126,0,'identifier',0,0,4,770,1611581061,1,847,2),(2341,246,50,85,0,'content',0,492,15,445,1611581052,1,445,3),(2342,246,50,85,0,'content',0,690,16,445,1611581052,1,492,3),(2343,246,50,85,0,'content',0,511,17,492,1611581052,1,690,3),(2344,246,50,85,0,'content',0,468,18,690,1611581052,1,511,3),(2345,246,50,85,0,'content',0,457,19,511,1611581052,1,468,3),(2346,246,50,85,0,'content',0,501,20,468,1611581052,1,457,3),(2347,246,50,85,0,'content',0,843,21,457,1611581052,1,501,3),(2348,246,50,85,0,'content',0,738,22,501,1611581052,1,843,3),(2349,246,50,85,0,'content',0,490,23,843,1611581052,1,738,3),(2350,246,50,85,0,'content',0,844,24,738,1611581052,1,490,3),(2351,246,50,85,0,'content',0,845,25,490,1611581052,1,844,3),(2352,246,50,85,0,'content',0,713,26,844,1611581052,1,845,3),(2353,246,50,85,0,'content',0,846,27,845,1611581052,1,713,3),(2354,246,50,85,0,'content',0,445,28,713,1611581052,1,846,3),(2355,246,50,85,0,'content',0,453,29,846,1611581052,1,445,3),(2356,246,50,85,0,'content',0,493,30,445,1611581052,1,453,3),(2357,246,50,85,0,'content',0,457,31,453,1611581052,1,493,3),(2358,246,50,85,0,'content',0,719,32,493,1611581052,1,457,3),(2359,246,50,85,0,'content',0,0,33,457,1611581052,1,719,3),(2360,243,50,86,0,'name',0,718,0,0,1611581052,1,717,3),(2361,243,50,86,0,'name',0,751,1,717,1611581052,1,718,3),(2362,243,50,86,0,'name',0,506,2,718,1611581052,1,751,3),(2363,243,50,86,0,'name',0,848,3,751,1611581052,1,506,3),(2364,244,50,86,0,'identifier',0,464,4,506,1611581052,1,848,3),(2365,246,50,86,0,'content',0,506,5,848,1611581052,1,464,3),(2366,246,50,86,0,'content',0,738,6,464,1611581052,1,506,3),(2367,246,50,86,0,'content',0,723,7,506,1611581052,1,738,3),(2368,246,50,86,0,'content',0,721,8,738,1611581052,1,723,3),(2369,246,50,86,0,'content',0,661,9,723,1611581052,1,721,3),(2370,246,50,86,0,'content',0,0,10,721,1611581052,1,661,3),(2371,1,2,127,0,'title',0,749,0,0,1611581062,1,738,2),(2372,1,2,127,0,'title',0,750,1,738,1611581062,1,749,2),(2373,1,2,127,0,'title',0,738,2,749,1611581062,1,750,2),(2374,120,2,127,0,'intro',0,749,3,750,1611581062,1,738,2),(2375,120,2,127,0,'intro',0,750,4,738,1611581062,1,749,2),(2376,120,2,127,0,'intro',0,849,5,749,1611581062,1,750,2),(2377,353,2,127,0,'identifier',0,0,6,750,1611581062,1,849,2),(2378,243,50,87,0,'name',0,718,0,0,1611581052,1,717,3),(2379,243,50,87,0,'name',0,623,1,717,1611581052,1,718,3),(2380,243,50,87,0,'name',0,433,2,718,1611581052,1,623,3),(2381,243,50,87,0,'name',0,506,3,623,1611581052,1,433,3),(2382,243,50,87,0,'name',0,453,4,433,1611581052,1,506,3),(2383,243,50,87,0,'name',0,464,5,506,1611581052,1,453,3),(2384,243,50,87,0,'name',0,452,6,453,1611581052,1,464,3),(2385,243,50,87,0,'name',0,850,7,464,1611581052,1,452,3),(2386,244,50,87,0,'identifier',0,510,8,452,1611581052,1,850,3),(2387,246,50,87,0,'content',0,851,9,850,1611581052,1,510,3),(2388,246,50,87,0,'content',0,852,10,510,1611581052,1,851,3),(2389,246,50,87,0,'content',0,511,11,851,1611581052,1,852,3),(2390,246,50,87,0,'content',0,853,12,852,1611581052,1,511,3),(2391,246,50,87,0,'content',0,452,13,511,1611581052,1,853,3),(2392,246,50,87,0,'content',0,854,14,853,1611581052,1,452,3),(2393,246,50,87,0,'content',0,855,15,452,1611581052,1,854,3),(2394,1,2,128,0,'title',0,516,0,0,1611581062,1,515,2),(2395,246,50,87,0,'content',0,514,16,854,1611581052,1,855,3),(2396,1,2,128,0,'title',0,515,1,515,1611581062,1,516,2),(2397,246,50,87,0,'content',0,856,17,855,1611581052,1,514,3),(2398,120,2,128,0,'intro',0,516,2,516,1611581062,1,515,2),(2399,246,50,87,0,'content',0,857,18,514,1611581052,1,856,3),(2400,120,2,128,0,'intro',0,861,3,515,1611581062,1,516,2),(2401,246,50,87,0,'content',0,843,19,856,1611581052,1,857,3),(2402,353,2,128,0,'identifier',0,0,4,516,1611581062,1,861,2),(2403,246,50,87,0,'content',0,858,20,857,1611581052,1,843,3),(2404,246,50,87,0,'content',0,851,21,843,1611581052,1,858,3),(2405,246,50,87,0,'content',0,476,22,858,1611581052,1,851,3),(2406,246,50,87,0,'content',0,859,23,851,1611581052,1,476,3),(2407,246,50,87,0,'content',0,860,24,476,1611581052,1,859,3),(2408,246,50,87,0,'content',0,0,25,859,1611581052,1,860,3),(2409,243,50,88,0,'name',0,718,0,0,1611581052,1,717,3),(2410,243,50,88,0,'name',0,505,1,717,1611581052,1,718,3),(2411,243,50,88,0,'name',0,501,2,718,1611581052,1,505,3),(2412,243,50,88,0,'name',0,506,3,505,1611581052,1,501,3),(2413,243,50,88,0,'name',0,862,4,501,1611581052,1,506,3),(2414,244,50,88,0,'identifier',0,863,5,506,1611581052,1,862,3),(2415,246,50,88,0,'content',0,864,6,862,1611581052,1,863,3),(2416,246,50,88,0,'content',0,510,7,863,1611581052,1,864,3),(2417,246,50,88,0,'content',0,851,8,864,1611581052,1,510,3),(2418,246,50,88,0,'content',0,852,9,510,1611581052,1,851,3),(2419,246,50,88,0,'content',0,865,10,851,1611581052,1,852,3),(2420,246,50,88,0,'content',0,855,11,852,1611581052,1,865,3),(2421,246,50,88,0,'content',0,514,12,865,1611581052,1,855,3),(2422,246,50,88,0,'content',0,856,13,855,1611581052,1,514,3),(2423,246,50,88,0,'content',0,857,14,514,1611581052,1,856,3),(2424,246,50,88,0,'content',0,843,15,856,1611581052,1,857,3),(2425,246,50,88,0,'content',0,858,16,857,1611581052,1,843,3),(2426,246,50,88,0,'content',0,851,17,843,1611581052,1,858,3),(2427,246,50,88,0,'content',0,476,18,858,1611581052,1,851,3),(2428,246,50,88,0,'content',0,859,19,851,1611581052,1,476,3),(2429,246,50,88,0,'content',0,860,20,476,1611581052,1,859,3),(2430,246,50,88,0,'content',0,0,21,859,1611581052,1,860,3),(2431,243,50,89,0,'name',0,718,0,0,1611581052,1,732,3),(2432,243,50,89,0,'name',0,599,1,732,1611581052,1,718,3),(2433,243,50,89,0,'name',0,866,2,718,1611581052,1,599,3),(2434,244,50,89,0,'identifier',0,867,3,599,1611581052,1,866,3),(2435,246,50,89,0,'content',0,437,4,866,1611581052,1,867,3),(2436,246,50,89,0,'content',0,868,5,867,1611581052,1,437,3),(2437,246,50,89,0,'content',0,869,6,437,1611581052,1,868,3),(2438,246,50,89,0,'content',0,870,7,868,1611581052,1,869,3),(2439,246,50,89,0,'content',0,871,8,869,1611581052,1,870,3),(2440,246,50,89,0,'content',0,444,9,870,1611581052,1,871,3),(2441,246,50,89,0,'content',0,872,10,871,1611581052,1,444,3),(2442,246,50,89,0,'content',0,873,11,444,1611581052,1,872,3),(2443,246,50,89,0,'content',0,874,12,872,1611581052,1,873,3),(2444,246,50,89,0,'content',0,875,13,873,1611581052,1,874,3),(2445,246,50,89,0,'content',0,437,14,874,1611581052,1,875,3),(2446,246,50,89,0,'content',0,876,15,875,1611581052,1,437,3),(2447,246,50,89,0,'content',0,877,16,437,1611581052,1,876,3),(2448,246,50,89,0,'content',0,878,17,876,1611581052,1,877,3),(2449,246,50,89,0,'content',0,879,18,877,1611581052,1,878,3),(2450,246,50,89,0,'content',0,880,19,878,1611581052,1,879,3),(2451,246,50,89,0,'content',0,881,20,879,1611581052,1,880,3),(2452,246,50,89,0,'content',0,439,21,880,1611581052,1,881,3),(2453,246,50,89,0,'content',0,863,22,881,1611581052,1,439,3),(2454,246,50,89,0,'content',0,510,23,439,1611581052,1,863,3),(2455,246,50,89,0,'content',0,882,24,863,1611581052,1,510,3),(2456,246,50,89,0,'content',0,452,25,510,1611581052,1,882,3),(2457,246,50,89,0,'content',0,865,26,882,1611581052,1,452,3),(2458,246,50,89,0,'content',0,851,27,452,1611581052,1,865,3),(2459,246,50,89,0,'content',0,883,28,865,1611581052,1,851,3),(2460,246,50,89,0,'content',0,855,29,851,1611581052,1,883,3),(2461,246,50,89,0,'content',0,884,30,883,1611581052,1,855,3),(2462,246,50,89,0,'content',0,885,31,855,1611581052,1,884,3),(2463,246,50,89,0,'content',0,851,32,884,1611581052,1,885,3),(2464,246,50,89,0,'content',0,0,33,885,1611581052,1,851,3),(2465,4,1,129,0,'name',0,886,0,0,1611589692,1,820,3),(2466,4,1,129,0,'name',0,0,1,820,1611589692,1,886,3),(2467,4,1,130,0,'name',0,475,0,0,1611589692,1,887,3),(2468,4,1,130,0,'name',0,888,1,887,1611589692,1,475,3),(2469,4,1,130,0,'name',0,0,2,475,1611589692,1,888,3),(2470,365,59,131,0,'title',0,890,0,0,1611589692,1,889,3),(2471,365,59,131,0,'title',0,483,1,889,1611589692,1,890,3),(2472,365,59,131,0,'title',0,891,2,890,1611589692,1,483,3),(2473,365,59,131,0,'title',0,453,3,483,1611589692,1,891,3),(2474,365,59,131,0,'title',0,892,4,891,1611589692,1,453,3),(2475,365,59,131,0,'title',0,893,5,453,1611589692,1,892,3),(2476,367,59,131,0,'description',0,656,6,892,1611589692,1,893,3),(2477,367,59,131,0,'description',0,464,7,893,1611589692,1,656,3),(2478,367,59,131,0,'description',0,894,8,656,1611589692,1,464,3),(2479,367,59,131,0,'description',0,475,9,464,1611589692,1,894,3),(2480,367,59,131,0,'description',0,464,10,894,1611589692,1,475,3),(2481,367,59,131,0,'description',0,895,11,475,1611589692,1,464,3),(2482,367,59,131,0,'description',0,896,12,464,1611589692,1,895,3),(2483,367,59,131,0,'description',0,483,13,895,1611589692,1,896,3),(2484,367,59,131,0,'description',0,897,14,896,1611589692,1,483,3),(2485,367,59,131,0,'description',0,592,15,483,1611589692,1,897,3),(2486,367,59,131,0,'description',0,898,16,897,1611589692,1,592,3),(2487,367,59,131,0,'description',0,511,17,592,1611589692,1,898,3),(2488,367,59,131,0,'description',0,899,18,898,1611589692,1,511,3),(2489,367,59,131,0,'description',0,461,19,511,1611589692,1,899,3),(2490,367,59,131,0,'description',0,900,20,899,1611589692,1,461,3),(2491,367,59,131,0,'description',0,901,21,461,1611589692,1,900,3),(2492,367,59,131,0,'description',0,902,22,900,1611589692,1,901,3),(2493,367,59,131,0,'description',0,903,23,901,1611589692,1,902,3),(2494,367,59,131,0,'description',0,897,24,902,1611589692,1,903,3),(2495,367,59,131,0,'description',0,895,25,903,1611589692,1,897,3),(2496,367,59,131,0,'description',0,900,26,897,1611589692,1,895,3),(2497,367,59,131,0,'description',0,904,27,895,1611589692,1,900,3),(2498,368,59,131,0,'difficulty',0,891,28,900,1611589692,1,904,3),(2499,369,59,131,0,'starting_point',0,905,29,904,1611589692,1,891,3),(2500,369,59,131,0,'starting_point',0,892,30,891,1611589692,1,905,3),(2501,370,59,131,0,'ending_point',0,905,31,905,1611589692,1,892,3),(2502,370,59,131,0,'ending_point',0,906,32,892,1611589692,1,905,3),(2503,371,59,131,0,'length',54,907,33,905,1611589692,1,906,3),(2504,372,59,131,0,'author',0,908,34,906,1611589692,1,907,3),(2505,372,59,131,0,'author',0,909,35,907,1611589692,1,908,3),(2506,372,59,131,0,'author',0,0,36,908,1611589692,1,909,3),(2507,365,59,132,0,'title',0,911,0,0,1611589692,1,910,3),(2508,365,59,132,0,'title',0,475,1,910,1611589692,1,911,3),(2509,365,59,132,0,'title',0,464,2,911,1611589692,1,475,3),(2510,365,59,132,0,'title',0,895,3,475,1611589692,1,464,3),(2511,365,59,132,0,'title',0,893,4,464,1611589692,1,895,3),(2512,367,59,132,0,'description',0,656,5,895,1611589692,1,893,3),(2513,367,59,132,0,'description',0,464,6,893,1611589692,1,656,3),(2514,367,59,132,0,'description',0,894,7,656,1611589692,1,464,3),(2515,367,59,132,0,'description',0,475,8,464,1611589692,1,894,3),(2516,367,59,132,0,'description',0,464,9,894,1611589692,1,475,3),(2517,367,59,132,0,'description',0,895,10,475,1611589692,1,464,3),(2518,367,59,132,0,'description',0,896,11,464,1611589692,1,895,3),(2519,367,59,132,0,'description',0,483,12,895,1611589692,1,896,3),(2520,367,59,132,0,'description',0,897,13,896,1611589692,1,483,3),(2521,367,59,132,0,'description',0,592,14,483,1611589692,1,897,3),(2522,367,59,132,0,'description',0,898,15,897,1611589692,1,592,3),(2523,367,59,132,0,'description',0,511,16,592,1611589692,1,898,3),(2524,367,59,132,0,'description',0,899,17,898,1611589692,1,511,3),(2525,367,59,132,0,'description',0,461,18,511,1611589692,1,899,3),(2526,367,59,132,0,'description',0,900,19,899,1611589692,1,461,3),(2527,367,59,132,0,'description',0,901,20,461,1611589692,1,900,3),(2528,367,59,132,0,'description',0,902,21,900,1611589692,1,901,3),(2529,367,59,132,0,'description',0,903,22,901,1611589692,1,902,3),(2530,367,59,132,0,'description',0,897,23,902,1611589692,1,903,3),(2531,367,59,132,0,'description',0,895,24,903,1611589692,1,897,3),(2532,367,59,132,0,'description',0,900,25,897,1611589692,1,895,3),(2533,367,59,132,0,'description',0,904,26,895,1611589692,1,900,3),(2534,368,59,132,0,'difficulty',0,912,27,900,1611589692,1,904,3),(2535,369,59,132,0,'starting_point',0,913,28,904,1611589692,1,912,3),(2536,369,59,132,0,'starting_point',0,914,29,912,1611589692,1,913,3),(2537,369,59,132,0,'starting_point',0,899,30,913,1611589692,1,914,3),(2538,370,59,132,0,'ending_point',0,913,31,914,1611589692,1,899,3),(2539,370,59,132,0,'ending_point',0,914,32,899,1611589692,1,913,3),(2540,370,59,132,0,'ending_point',0,915,33,913,1611589692,1,914,3),(2541,371,59,132,0,'length',37,916,34,914,1611589692,1,915,3),(2542,372,59,132,0,'author',0,917,35,915,1611589692,1,916,3),(2543,372,59,132,0,'author',0,0,36,916,1611589692,1,917,3),(2544,365,59,133,0,'title',0,919,0,0,1611589693,1,918,3),(2545,365,59,133,0,'title',0,920,1,918,1611589693,1,919,3),(2546,365,59,133,0,'title',0,893,2,919,1611589693,1,920,3),(2547,367,59,133,0,'description',0,656,3,920,1611589693,1,893,3),(2548,367,59,133,0,'description',0,464,4,893,1611589693,1,656,3),(2549,367,59,133,0,'description',0,894,5,656,1611589693,1,464,3),(2550,367,59,133,0,'description',0,475,6,464,1611589693,1,894,3),(2551,367,59,133,0,'description',0,464,7,894,1611589693,1,475,3),(2552,367,59,133,0,'description',0,895,8,475,1611589693,1,464,3),(2553,367,59,133,0,'description',0,896,9,464,1611589693,1,895,3),(2554,367,59,133,0,'description',0,483,10,895,1611589693,1,896,3),(2555,367,59,133,0,'description',0,897,11,896,1611589693,1,483,3),(2556,367,59,133,0,'description',0,592,12,483,1611589693,1,897,3),(2557,367,59,133,0,'description',0,898,13,897,1611589693,1,592,3),(2558,367,59,133,0,'description',0,511,14,592,1611589693,1,898,3),(2559,367,59,133,0,'description',0,899,15,898,1611589693,1,511,3),(2560,367,59,133,0,'description',0,461,16,511,1611589693,1,899,3),(2561,367,59,133,0,'description',0,900,17,899,1611589693,1,461,3),(2562,367,59,133,0,'description',0,901,18,461,1611589693,1,900,3),(2563,367,59,133,0,'description',0,902,19,900,1611589693,1,901,3),(2564,367,59,133,0,'description',0,903,20,901,1611589693,1,902,3),(2565,367,59,133,0,'description',0,897,21,902,1611589693,1,903,3),(2566,367,59,133,0,'description',0,895,22,903,1611589693,1,897,3),(2567,367,59,133,0,'description',0,900,23,897,1611589693,1,895,3),(2568,367,59,133,0,'description',0,921,24,895,1611589693,1,900,3),(2569,368,59,133,0,'difficulty',0,918,25,900,1611589693,1,921,3),(2570,369,59,133,0,'starting_point',0,922,26,921,1611589693,1,918,3),(2571,369,59,133,0,'starting_point',0,923,27,918,1611589693,1,922,3),(2572,370,59,133,0,'ending_point',0,922,28,922,1611589693,1,923,3),(2573,370,59,133,0,'ending_point',0,924,29,923,1611589693,1,922,3),(2574,371,59,133,0,'length',18,925,30,922,1611589693,1,924,3),(2575,372,59,133,0,'author',0,926,31,924,1611589693,1,925,3),(2576,372,59,133,0,'author',0,0,32,925,1611589693,1,926,3),(2577,365,59,134,0,'title',0,511,0,0,1611589693,1,927,3),(2578,365,59,134,0,'title',0,529,1,927,1611589693,1,511,3),(2579,365,59,134,0,'title',0,893,2,511,1611589693,1,529,3),(2580,367,59,134,0,'description',0,656,3,529,1611589693,1,893,3),(2581,367,59,134,0,'description',0,464,4,893,1611589693,1,656,3),(2582,367,59,134,0,'description',0,894,5,656,1611589693,1,464,3),(2583,367,59,134,0,'description',0,475,6,464,1611589693,1,894,3),(2584,367,59,134,0,'description',0,464,7,894,1611589693,1,475,3),(2585,367,59,134,0,'description',0,895,8,475,1611589693,1,464,3),(2586,367,59,134,0,'description',0,896,9,464,1611589693,1,895,3),(2587,367,59,134,0,'description',0,483,10,895,1611589693,1,896,3),(2588,367,59,134,0,'description',0,897,11,896,1611589693,1,483,3),(2589,367,59,134,0,'description',0,592,12,483,1611589693,1,897,3),(2590,367,59,134,0,'description',0,898,13,897,1611589693,1,592,3),(2591,367,59,134,0,'description',0,511,14,592,1611589693,1,898,3),(2592,367,59,134,0,'description',0,899,15,898,1611589693,1,511,3),(2593,367,59,134,0,'description',0,461,16,511,1611589693,1,899,3),(2594,367,59,134,0,'description',0,900,17,899,1611589693,1,461,3),(2595,367,59,134,0,'description',0,901,18,461,1611589693,1,900,3),(2596,367,59,134,0,'description',0,902,19,900,1611589693,1,901,3),(2597,367,59,134,0,'description',0,903,20,901,1611589693,1,902,3),(2598,367,59,134,0,'description',0,897,21,902,1611589693,1,903,3),(2599,367,59,134,0,'description',0,895,22,903,1611589693,1,897,3),(2600,367,59,134,0,'description',0,900,23,897,1611589693,1,895,3),(2601,367,59,134,0,'description',0,904,24,895,1611589693,1,900,3),(2602,368,59,134,0,'difficulty',0,928,25,900,1611589693,1,904,3),(2603,369,59,134,0,'starting_point',0,929,26,904,1611589693,1,928,3),(2604,369,59,134,0,'starting_point',0,529,27,928,1611589693,1,929,3),(2605,369,59,134,0,'starting_point',0,930,28,929,1611589693,1,529,3),(2606,370,59,134,0,'ending_point',0,931,29,529,1611589693,1,930,3),(2607,370,59,134,0,'ending_point',0,529,30,930,1611589693,1,931,3),(2608,370,59,134,0,'ending_point',0,932,31,931,1611589693,1,529,3),(2609,371,59,134,0,'length',28,933,32,529,1611589693,1,932,3),(2610,372,59,134,0,'author',0,934,33,932,1611589693,1,933,3),(2611,372,59,134,0,'author',0,0,34,933,1611589693,1,934,3),(2612,365,59,135,0,'title',0,936,0,0,1611589693,1,935,3),(2613,365,59,135,0,'title',0,937,1,935,1611589693,1,936,3),(2614,365,59,135,0,'title',0,592,2,936,1611589693,1,937,3),(2615,365,59,135,0,'title',0,938,3,937,1611589693,1,592,3),(2616,365,59,135,0,'title',0,939,4,592,1611589693,1,938,3),(2617,365,59,135,0,'title',0,940,5,938,1611589693,1,939,3),(2618,365,59,135,0,'title',0,893,6,939,1611589693,1,940,3),(2619,367,59,135,0,'description',0,656,7,940,1611589693,1,893,3),(2620,367,59,135,0,'description',0,464,8,893,1611589693,1,656,3),(2621,367,59,135,0,'description',0,894,9,656,1611589693,1,464,3),(2622,367,59,135,0,'description',0,475,10,464,1611589693,1,894,3),(2623,367,59,135,0,'description',0,464,11,894,1611589693,1,475,3),(2624,367,59,135,0,'description',0,895,12,475,1611589693,1,464,3),(2625,367,59,135,0,'description',0,896,13,464,1611589693,1,895,3),(2626,367,59,135,0,'description',0,483,14,895,1611589693,1,896,3),(2627,367,59,135,0,'description',0,897,15,896,1611589693,1,483,3),(2628,367,59,135,0,'description',0,592,16,483,1611589693,1,897,3),(2629,367,59,135,0,'description',0,898,17,897,1611589693,1,592,3),(2630,367,59,135,0,'description',0,511,18,592,1611589693,1,898,3),(2631,367,59,135,0,'description',0,899,19,898,1611589693,1,511,3),(2632,367,59,135,0,'description',0,461,20,511,1611589693,1,899,3),(2633,367,59,135,0,'description',0,900,21,899,1611589693,1,461,3),(2634,367,59,135,0,'description',0,901,22,461,1611589693,1,900,3),(2635,367,59,135,0,'description',0,902,23,900,1611589693,1,901,3),(2636,367,59,135,0,'description',0,903,24,901,1611589693,1,902,3),(2637,367,59,135,0,'description',0,897,25,902,1611589693,1,903,3),(2638,367,59,135,0,'description',0,895,26,903,1611589693,1,897,3),(2639,367,59,135,0,'description',0,900,27,897,1611589693,1,895,3),(2640,367,59,135,0,'description',0,941,28,895,1611589693,1,900,3),(2641,368,59,135,0,'difficulty',0,937,29,900,1611589693,1,941,3),(2642,369,59,135,0,'starting_point',0,922,30,941,1611589693,1,937,3),(2643,369,59,135,0,'starting_point',0,938,31,937,1611589693,1,922,3),(2644,370,59,135,0,'ending_point',0,939,32,922,1611589693,1,938,3),(2645,370,59,135,0,'ending_point',0,940,33,938,1611589693,1,939,3),(2646,370,59,135,0,'ending_point',0,922,34,939,1611589693,1,940,3),(2647,370,59,135,0,'ending_point',0,942,35,940,1611589693,1,922,3),(2648,371,59,135,0,'length',19,925,36,922,1611589693,1,942,3),(2649,372,59,135,0,'author',0,926,37,942,1611589693,1,925,3),(2650,372,59,135,0,'author',0,0,38,925,1611589693,1,926,3),(2651,373,60,136,0,'title',0,944,0,0,1611589694,1,943,3),(2652,373,60,136,0,'title',0,945,1,943,1611589694,1,944,3),(2653,373,60,136,0,'title',0,461,2,944,1611589694,1,945,3),(2654,374,60,136,0,'description',0,463,3,945,1611589694,1,461,3),(2655,374,60,136,0,'description',0,464,4,461,1611589694,1,463,3),(2656,374,60,136,0,'description',0,943,5,463,1611589694,1,464,3),(2657,374,60,136,0,'description',0,797,6,464,1611589694,1,943,3),(2658,374,60,136,0,'description',0,470,7,943,1611589694,1,797,3),(2659,374,60,136,0,'description',0,944,8,797,1611589694,1,470,3),(2660,374,60,136,0,'description',0,945,9,470,1611589694,1,944,3),(2661,374,60,136,0,'description',0,511,10,944,1611589694,1,945,3),(2662,374,60,136,0,'description',0,464,11,945,1611589694,1,511,3),(2663,374,60,136,0,'description',0,946,12,511,1611589694,1,464,3),(2664,374,60,136,0,'description',0,947,13,464,1611589694,1,946,3),(2665,376,60,136,0,'photo_legend',0,475,14,946,1611589694,1,947,3),(2666,376,60,136,0,'photo_legend',0,464,15,947,1611589694,1,475,3),(2667,376,60,136,0,'photo_legend',0,948,16,475,1611589694,1,464,3),(2668,376,60,136,0,'photo_legend',0,511,17,464,1611589694,1,948,3),(2669,376,60,136,0,'photo_legend',0,464,18,948,1611589694,1,511,3),(2670,376,60,136,0,'photo_legend',0,949,19,511,1611589694,1,464,3),(2671,376,60,136,0,'photo_legend',0,945,20,464,1611589694,1,949,3),(2672,377,60,136,0,'place',0,0,21,949,1611589694,1,945,3),(2673,373,60,137,0,'title',0,951,0,0,1611589694,1,950,3),(2674,373,60,137,0,'title',0,952,1,950,1611589694,1,951,3),(2675,373,60,137,0,'title',0,952,2,951,1611589694,1,952,3),(2676,374,60,137,0,'description',0,950,3,952,1611589694,1,952,3),(2677,374,60,137,0,'description',0,953,4,952,1611589694,1,950,3),(2678,374,60,137,0,'description',0,936,5,950,1611589694,1,953,3),(2679,374,60,137,0,'description',0,937,6,953,1611589694,1,936,3),(2680,374,60,137,0,'description',0,592,7,936,1611589694,1,937,3),(2681,374,60,137,0,'description',0,954,8,937,1611589694,1,592,3),(2682,374,60,137,0,'description',0,487,9,592,1611589694,1,954,3),(2683,374,60,137,0,'description',0,955,10,954,1611589694,1,487,3),(2684,374,60,137,0,'description',0,903,11,487,1611589694,1,955,3),(2685,374,60,137,0,'description',0,453,12,955,1611589694,1,903,3),(2686,374,60,137,0,'description',0,658,13,903,1611589694,1,453,3),(2687,374,60,137,0,'description',0,464,14,453,1611589694,1,658,3),(2688,374,60,137,0,'description',0,956,15,658,1611589694,1,464,3),(2689,374,60,137,0,'description',0,957,16,464,1611589694,1,956,3),(2690,374,60,137,0,'description',0,592,17,956,1611589694,1,957,3),(2691,374,60,137,0,'description',0,464,18,957,1611589694,1,592,3),(2692,374,60,137,0,'description',0,958,19,592,1611589694,1,464,3),(2693,374,60,137,0,'description',0,959,20,464,1611589694,1,958,3),(2694,374,60,137,0,'description',0,960,21,958,1611589694,1,959,3),(2695,376,60,137,0,'photo_legend',0,947,22,959,1611589694,1,960,3),(2696,376,60,137,0,'photo_legend',0,0,23,960,1611589694,1,947,3);
/*!40000 ALTER TABLE `ezsearch_object_word_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsearch_word`
--

DROP TABLE IF EXISTS `ezsearch_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsearch_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_count` int(11) NOT NULL DEFAULT 0,
  `word` varchar(150) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezsearch_word_word_i` (`word`),
  KEY `ezsearch_word_obj_count` (`object_count`)
) ENGINE=InnoDB AUTO_INCREMENT=961 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsearch_word`
--

LOCK TABLES `ezsearch_word` WRITE;
/*!40000 ALTER TABLE `ezsearch_word` DISABLE KEYS */;
INSERT INTO `ezsearch_word` VALUES (430,3,'customercenter'),(431,1,'contacts'),(432,7,'from'),(433,3,'erp'),(434,1,'customer_center_entry_page_erp_users_intro'),(435,1,'folgende'),(436,1,'mitarbeiter'),(437,2,'sind'),(438,1,'uns'),(439,2,'bereits'),(440,1,'bekannt'),(441,5,'ibexa'),(442,1,'aber'),(443,2,'platform'),(444,3,'sie'),(445,26,'you'),(446,1,'haben'),(447,4,'are'),(448,1,'noch'),(449,3,'now'),(450,1,'keinen'),(451,2,'ready'),(452,10,'shop'),(453,22,'to'),(454,8,'account'),(455,2,'start'),(456,2,'konnen'),(457,25,'your'),(458,2,'hier'),(459,2,'project'),(460,1,'direkt'),(461,10,'this'),(462,1,'aktivieren'),(463,6,'is'),(464,24,'the'),(465,1,'clean'),(466,1,'installation'),(467,1,'coming'),(468,3,'with'),(469,2,'it'),(470,3,'s'),(471,15,'a'),(472,1,'bare'),(473,1,'bones'),(474,1,'setup'),(475,14,'of'),(476,11,'an'),(477,1,'excellent'),(478,1,'foundation'),(479,1,'build'),(480,1,'upon'),(481,8,'if'),(482,3,'want'),(483,7,'from'),(484,1,'scratch'),(485,6,'introtext'),(486,1,'customer_center_entry_page_shop_users_intro'),(487,2,'allows'),(488,1,'maintain'),(489,2,'accounts'),(490,19,'for'),(491,1,'employees'),(492,9,'can'),(493,5,'change'),(494,1,'rights'),(495,1,'userdeactivate'),(496,1,'userchange'),(497,5,'users'),(498,1,'settingsyou'),(499,2,'also'),(500,3,'create'),(501,8,'new'),(502,2,'_'),(503,2,'main'),(504,4,'group'),(505,7,'request'),(506,12,'user'),(507,1,'tooltip'),(508,1,'customer_center_request_new_user_tooltip'),(509,1,'neue'),(510,4,'benutzer'),(511,14,'in'),(512,1,'anlegen'),(513,2,'anonymous'),(514,17,'email'),(515,5,'cancellation'),(516,3,'policies'),(517,1,'email_cancelation_policies'),(518,1,'policy'),(519,1,'guest'),(520,8,'footer'),(521,1,'email_footer'),(522,1,'best'),(523,1,'regards'),(524,6,'as'),(525,3,'solligata'),(526,3,'2'),(527,3,'0254'),(528,3,'oslo'),(529,4,'norway'),(530,1,'phone'),(531,3,'47'),(532,3,'35'),(533,4,'administrator'),(534,3,'58'),(535,3,'70'),(536,3,'20'),(537,1,'systems'),(538,1,'b2b'),(539,1,'und'),(540,1,'b2c'),(541,1,'integration'),(542,1,'system'),(543,1,'multishop'),(544,1,'mobile'),(545,1,'commerce'),(546,1,'editors'),(547,5,'intro'),(548,8,'text'),(549,1,'owner'),(550,1,'email_shop_owner_intro_text'),(551,6,'thank'),(552,7,'order'),(553,1,'media'),(554,1,'header'),(555,7,'address'),(556,5,'invoice'),(557,1,'header_address_invoice_text'),(558,3,'info'),(559,2,'co'),(560,2,'https'),(561,2,'www'),(562,1,'images'),(563,2,'payment'),(564,2,'method'),(565,1,'invoice_payment_method_invoice_text'),(566,6,'have'),(567,1,'any'),(568,1,'questions'),(569,1,'do'),(570,4,'not'),(571,1,'hesitate'),(572,6,'contact'),(573,2,'us'),(574,1,'files'),(575,1,'multimedia'),(576,1,'left'),(577,1,'invoice_left_footer'),(578,1,'digital'),(579,1,'experience'),(580,1,'right'),(581,1,'invoice_right_footer'),(582,8,'form'),(583,1,'uploads'),(584,1,'folder'),(585,2,'file'),(586,1,'introduction'),(587,1,'newsletter'),(588,3,'common'),(589,1,'subscribe_newsletter_intro'),(590,1,'subscribe'),(591,4,'our'),(592,13,'and'),(593,1,'benefit'),(594,1,'regular'),(595,1,'updates'),(596,1,'about'),(597,4,'products'),(598,1,'news'),(599,3,'forms'),(600,1,'footer_block_address'),(601,1,'site'),(602,1,'skeletons'),(603,3,'block'),(604,1,'company'),(605,1,'footer_block_company'),(606,2,'private'),(607,3,'customers'),(608,1,'ordering'),(609,1,'footer_block_ordering'),(610,1,'online'),(611,3,'business'),(612,1,'service'),(613,1,'footer_block_service'),(614,3,'product'),(615,1,'return'),(616,1,'components'),(617,1,'quickorder'),(618,1,'quickorder_introtext'),(619,1,'know'),(620,1,'skus'),(621,1,'textmodules'),(622,2,'use'),(623,4,'add'),(624,1,'these'),(625,6,'basket'),(626,1,'search'),(627,1,'name'),(628,1,'sku'),(629,1,'variant'),(630,1,'code'),(631,6,'or'),(632,10,'will'),(633,1,'display'),(634,1,'suggestions'),(635,1,'choose'),(636,2,'one'),(637,3,'list'),(638,1,'csv'),(639,1,'containing'),(640,1,'codes'),(641,1,'quantity'),(642,5,'be'),(643,1,'imported'),(644,3,'by'),(645,1,'drag'),(646,1,'drop'),(647,1,'instead'),(648,1,'uploading'),(649,1,'paste'),(650,2,'content'),(651,1,'into'),(652,1,'textbox'),(653,2,'well'),(654,9,'please'),(655,2,'click'),(656,7,'on'),(657,1,'refresh'),(658,4,'see'),(659,1,'individual'),(660,2,'prices'),(661,2,'updated'),(662,2,'stock'),(663,3,'information'),(664,1,'checkout'),(665,1,'404'),(666,3,'page'),(667,1,'404_page'),(668,1,'ve'),(669,2,'requested'),(670,3,'could'),(671,1,'found'),(672,3,'may'),(673,1,'no'),(674,1,'longer'),(675,1,'exist'),(676,1,'there'),(677,1,'typo'),(678,1,'url'),(679,1,'access'),(680,1,'denied'),(681,1,'403_access_denied'),(682,5,'been'),(683,1,'logged'),(684,1,'out'),(685,1,'automatically'),(686,1,'because'),(687,1,'timeout'),(688,2,'don'),(689,3,'t'),(690,2,'log'),(691,1,'again'),(692,1,'already'),(693,2,'orderhistory'),(694,1,'orderhistory_introtext'),(695,7,'here'),(696,2,'find'),(697,1,'overview'),(698,1,'history'),(699,1,'misc'),(700,2,'back'),(701,2,'catalog'),(702,1,'back_to_catalog'),(703,1,'go'),(704,1,'register'),(705,1,'click_here_to_register'),(706,5,'customer'),(707,1,'stored'),(708,2,'wishlist_stored_basket_intro_text'),(709,1,'storedbasket'),(710,2,'remove'),(711,1,'update'),(712,1,'more'),(713,4,'we'),(714,1,'recalculated'),(715,1,'price'),(716,2,'changed'),(717,13,'success'),(718,19,'message'),(719,5,'password'),(720,1,'success_message_password_change'),(721,3,'successfully'),(722,1,'success_message_password_reminder'),(723,3,'was'),(724,3,'sent'),(725,3,'check'),(726,1,'mailbox'),(727,3,'get'),(728,1,'wishlist'),(729,1,'store'),(730,1,'items'),(731,1,'later'),(732,4,'error'),(733,1,'error_message_password_change'),(734,3,'send'),(735,3,'errors'),(736,2,'resubmit'),(737,2,'accept'),(738,6,'data'),(739,1,'protection'),(740,1,'label'),(741,1,'accept_cancellation_policies'),(742,1,'reminder'),(743,1,'error_message_password_reminder'),(744,1,'privay'),(745,1,'hint'),(746,1,'data_privacy_hint'),(747,1,'placing'),(748,1,'agree'),(749,2,'privacy'),(750,2,'regulations'),(751,7,'edit'),(752,4,'buyer'),(753,1,'buyer_intro_text'),(754,1,'success_cancellation'),(755,1,'submitting'),(756,2,'my'),(757,1,'my_account_intro_text'),(758,1,'summary'),(759,1,'introtext_order_summary'),(760,1,'chosen'),(761,1,'electronic'),(762,1,'redirected'),(763,1,'provider'),(764,2,'after'),(765,1,'clicking'),(766,1,'button'),(767,1,'profile'),(768,1,'my_profile_intro_text'),(769,2,'terms'),(770,2,'conditions'),(771,1,'terms_conditions'),(772,3,'registration'),(773,1,'error_message_register'),(774,1,'some'),(775,1,'occurred'),(776,1,'below'),(777,1,'success_contact'),(778,1,'very'),(779,1,'much'),(780,1,'come'),(781,2,'soon'),(782,2,'possible'),(783,1,'activate'),(784,1,'success_activate_business'),(785,1,'activating'),(786,1,'contact_intro_text'),(787,1,'let'),(788,1,'take'),(789,1,'care'),(790,1,'success_buyer'),(791,5,'has'),(792,3,'modified'),(793,1,'appoval'),(794,2,'entry'),(795,1,'approver_entry_page_intro_text'),(796,1,'baskets'),(797,2,'that'),(798,1,'waiting'),(799,3,'approval'),(800,1,'approve'),(801,1,'delivery'),(802,1,'required'),(803,1,'reject'),(804,1,'comment'),(805,1,'make'),(806,1,'sure'),(807,1,'active'),(808,1,'either'),(809,1,'success_invoice'),(810,1,'doesn'),(811,1,'number'),(812,1,'changes'),(813,2,'approved'),(814,1,'first'),(815,1,'myaccount'),(816,1,'success_my_account'),(817,2,'approver'),(818,1,'basket_send_to_approver_success_message'),(819,1,'process'),(820,2,'all'),(821,1,'approvers'),(822,1,'were'),(823,1,'informed'),(824,1,'immediately'),(825,2,'when'),(826,1,'ordered'),(827,2,'rejected'),(828,1,'success_register_business'),(829,3,'receive'),(830,1,'verified'),(831,1,'basket_send_to_approver_info_message'),(832,1,'wait'),(833,1,'until'),(834,1,'success_register_private'),(835,1,'few'),(836,1,'minutes'),(837,1,'confirmation'),(838,1,'5'),(839,1,'buyer_entry_page_intro_text'),(840,1,'requests'),(841,1,'customercenter_new_user_created_email'),(842,1,'created'),(843,3,'login'),(844,1,'security'),(845,1,'reasons'),(846,1,'recommend'),(847,1,'termsandconditionsidentifier'),(848,1,'success_message_customer_center_edit_user'),(849,1,'data_protection'),(850,1,'success_message_customer_center_add_user'),(851,3,'wurde'),(852,2,'erfolgreich'),(853,1,'den'),(854,1,'hinzugefugt'),(855,3,'eine'),(856,2,'mit'),(857,2,'seinen'),(858,2,'daten'),(859,2,'ihn'),(860,2,'versendet'),(861,1,'cancellation_policy'),(862,1,'success_message_customer_center_request_user'),(863,2,'ein'),(864,1,'neuer'),(865,2,'angelegt'),(866,1,'error_message_customer_center_forms'),(867,1,'es'),(868,1,'fehler'),(869,1,'aufgetreten'),(870,1,'bitte'),(871,1,'prufen'),(872,1,'oballe'),(873,1,'pflicht'),(874,1,'felder'),(875,1,'ausgefullt'),(876,1,'fur'),(877,1,'diese'),(878,1,'e'),(879,1,'mail'),(880,1,'adresse'),(881,1,'ggf'),(882,1,'im'),(883,1,'undmindestens'),(884,1,'rolle'),(885,1,'aktiviert'),(886,1,'rides'),(887,1,'points'),(888,1,'interest'),(889,1,'finnish'),(890,1,'coastline'),(891,1,'rauma'),(892,1,'pori'),(893,5,'following'),(894,5,'route'),(895,5,'battenkill'),(896,5,'starting'),(897,5,'schueylerville'),(898,5,'ending'),(899,5,'shushan'),(900,5,'ride'),(901,5,'offers'),(902,5,'breathtaking'),(903,6,'views'),(904,3,'intermediate'),(905,1,'finland'),(906,1,'54'),(907,1,'artturi'),(908,1,'sakari'),(909,1,'reinikainen'),(910,1,'baby'),(911,1,'tour'),(912,1,'schuylerville'),(913,1,'ny'),(914,1,'usa'),(915,1,'37'),(916,1,'angus'),(917,1,'macgyver'),(918,1,'meillonnas'),(919,1,'terrain'),(920,1,'track'),(921,1,'advanced'),(922,2,'france'),(923,1,'pressiat'),(924,1,'18'),(925,2,'damien'),(926,2,'pobel'),(927,1,'rallarvegen'),(928,1,'haugastoel'),(929,1,'hol'),(930,1,'finse'),(931,1,'ulvik'),(932,1,'28'),(933,1,'gunnstein'),(934,1,'lye'),(935,1,'lookouts'),(936,2,'between'),(937,2,'coligny'),(938,1,'montagna'),(939,1,'le'),(940,1,'reconduit'),(941,1,'beginner'),(942,1,'19'),(943,1,'cross'),(944,1,'above'),(945,1,'tarcia'),(946,1,'hills'),(947,2,'view'),(948,1,'top'),(949,1,'summer'),(950,1,'plateau'),(951,1,'de'),(952,1,'vergongeat'),(953,1,'located'),(954,1,'poisoux'),(955,1,'great'),(956,1,'jura'),(957,1,'mountains'),(958,1,'mont'),(959,1,'blanc'),(960,1,'panorama');
/*!40000 ALTER TABLE `ezsearch_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsection`
--

DROP TABLE IF EXISTS `ezsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `navigation_part_identifier` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'ezcontentnavigationpart',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsection`
--

LOCK TABLES `ezsection` WRITE;
/*!40000 ALTER TABLE `ezsection` DISABLE KEYS */;
INSERT INTO `ezsection` VALUES (1,'standard','','Standard','ezcontentnavigationpart'),(2,'users','','Users','ezusernavigationpart'),(3,'media','','Media','ezmedianavigationpart'),(6,'form',NULL,'Form','ezcontentnavigationpart'),(7,'site_skeleton',NULL,'Site skeleton','ezcontentnavigationpart'),(8,'components',NULL,'Components','ezcontentnavigationpart');
/*!40000 ALTER TABLE `ezsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsite`
--

DROP TABLE IF EXISTS `ezsite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsite`
--

LOCK TABLES `ezsite` WRITE;
/*!40000 ALTER TABLE `ezsite` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezsite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsite_data`
--

DROP TABLE IF EXISTS `ezsite_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsite_data` (
  `name` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsite_data`
--

LOCK TABLES `ezsite_data` WRITE;
/*!40000 ALTER TABLE `ezsite_data` DISABLE KEYS */;
INSERT INTO `ezsite_data` VALUES ('ezplatform-release','3.0.0');
/*!40000 ALTER TABLE `ezsite_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsite_public_access`
--

DROP TABLE IF EXISTS `ezsite_public_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsite_public_access` (
  `public_access_identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `site_access_group` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL,
  `config` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `site_matcher_host` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `site_matcher_path` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`public_access_identifier`),
  KEY `ezsite_public_access_site_id` (`site_id`),
  CONSTRAINT `fk_ezsite_public_access_site_id` FOREIGN KEY (`site_id`) REFERENCES `ezsite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsite_public_access`
--

LOCK TABLES `ezsite_public_access` WRITE;
/*!40000 ALTER TABLE `ezsite_public_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezsite_public_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurl`
--

DROP TABLE IF EXISTS `ezurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL DEFAULT 0,
  `is_valid` int(11) NOT NULL DEFAULT 1,
  `last_checked` int(11) NOT NULL DEFAULT 0,
  `modified` int(11) NOT NULL DEFAULT 0,
  `original_url_md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `url` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezurl_url` (`url`(191))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurl`
--

LOCK TABLES `ezurl` WRITE;
/*!40000 ALTER TABLE `ezurl` DISABLE KEYS */;
INSERT INTO `ezurl` VALUES (1,1611581049,1,0,1611581049,'065837a4cff084bf6aa4b883718297fd','/viewcontent/cancellation_policy'),(2,1611581050,1,0,1611581050,'f9d6115a4cfa34a934b4790c337add1f','/viewcontent/data_protection'),(3,1611581050,1,0,1611581050,'dbd07b8c8482755c498fe8ca38d65e42','/viewcontent/termsAndConditionsIdentifier'),(4,1611581054,1,0,1611581054,'d4c4ea0710963e70c38f0e60b0422239','mailto:info@ibexa.co'),(5,1611581054,1,0,1611581054,'01e120d90da54426206a8583aa6c4549','https://www.ibexa.co/'),(6,1611581055,1,0,1611581055,'eec9f9a94fd6a040bc80af35ddfea7bd','/service/contact'),(7,1611581055,1,0,1611581055,'8d1ba34ab8fbc67f5678b3fd99551e24','/service/cancellation'),(8,1611581056,1,0,1611581056,'9bc17796ff3bb816ffd51cab52d2dd1a','/service/rma');
/*!40000 ALTER TABLE `ezurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurl_object_link`
--

DROP TABLE IF EXISTS `ezurl_object_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurl_object_link` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT 0,
  `contentobject_attribute_version` int(11) NOT NULL DEFAULT 0,
  `url_id` int(11) NOT NULL DEFAULT 0,
  KEY `ezurl_ol_coa_id` (`contentobject_attribute_id`),
  KEY `ezurl_ol_url_id` (`url_id`),
  KEY `ezurl_ol_coa_version` (`contentobject_attribute_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurl_object_link`
--

LOCK TABLES `ezurl_object_link` WRITE;
/*!40000 ALTER TABLE `ezurl_object_link` DISABLE KEYS */;
INSERT INTO `ezurl_object_link` VALUES (344,1,1),(348,1,2),(360,1,3),(420,1,1),(432,1,4),(432,1,5),(452,1,4),(452,1,5),(456,1,6),(460,1,7),(464,1,8);
/*!40000 ALTER TABLE `ezurl_object_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlalias`
--

DROP TABLE IF EXISTS `ezurlalias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlalias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `forward_to_id` int(11) NOT NULL DEFAULT 0,
  `is_imported` int(11) NOT NULL DEFAULT 0,
  `is_internal` int(11) NOT NULL DEFAULT 1,
  `is_wildcard` int(11) NOT NULL DEFAULT 0,
  `source_md5` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `source_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ezurlalias_source_md5` (`source_md5`),
  KEY `ezurlalias_wcard_fwd` (`is_wildcard`,`forward_to_id`),
  KEY `ezurlalias_forward_to_id` (`forward_to_id`),
  KEY `ezurlalias_imp_wcard_fwd` (`is_imported`,`is_wildcard`,`forward_to_id`),
  KEY `ezurlalias_source_url` (`source_url`(191)),
  KEY `ezurlalias_desturl` (`destination_url`(191))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlalias`
--

LOCK TABLES `ezurlalias` WRITE;
/*!40000 ALTER TABLE `ezurlalias` DISABLE KEYS */;
INSERT INTO `ezurlalias` VALUES (12,'content/view/full/2',0,1,1,0,'d41d8cd98f00b204e9800998ecf8427e',''),(13,'content/view/full/5',0,1,1,0,'9bc65c2abec141778ffaa729489f3e87','users'),(15,'content/view/full/12',0,1,1,0,'02d4e844e3a660857a3f81585995ffe1','users/guest_accounts'),(16,'content/view/full/13',0,1,1,0,'1b1d79c16700fd6003ea7be233e754ba','users/administrator_users'),(17,'content/view/full/14',0,1,1,0,'0bb9dd665c96bbc1cf36b79180786dea','users/editors'),(18,'content/view/full/15',0,1,1,0,'f1305ac5f327a19b451d82719e0c3f5d','users/administrator_users/administrator_user'),(20,'content/view/full/43',0,1,1,0,'62933a2951ef01f4eafd9bdf4d3cd2f0','media'),(21,'content/view/full/44',0,1,1,0,'3ae1aac958e1c82013689d917d34967a','users/anonymous_users'),(22,'content/view/full/45',0,1,1,0,'aad93975f09371695ba08292fd9698db','users/anonymous_users/anonymous_user'),(28,'content/view/full/51',0,1,1,0,'38985339d4a5aadfc41ab292b4527046','media/images'),(29,'content/view/full/52',0,1,1,0,'ad5a8c6f6aac3b1b9df267fe22e7aef6','media/files'),(30,'content/view/full/53',0,1,1,0,'562a0ac498571c6c3529173184a2657c','media/multimedia');
/*!40000 ALTER TABLE `ezurlalias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlalias_ml`
--

DROP TABLE IF EXISTS `ezurlalias_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlalias_ml` (
  `parent` int(11) NOT NULL DEFAULT 0,
  `text_md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `action` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `action_type` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `alias_redirects` int(11) NOT NULL DEFAULT 1,
  `id` int(11) NOT NULL DEFAULT 0,
  `is_alias` int(11) NOT NULL DEFAULT 0,
  `is_original` int(11) NOT NULL DEFAULT 0,
  `lang_mask` bigint(20) NOT NULL DEFAULT 0,
  `link` int(11) NOT NULL DEFAULT 0,
  `text` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`parent`,`text_md5`),
  KEY `ezurlalias_ml_actt_org_al` (`action_type`,`is_original`,`is_alias`),
  KEY `ezurlalias_ml_text_lang` (`text`(32),`lang_mask`,`parent`),
  KEY `ezurlalias_ml_par_act_id_lnk` (`action`(32),`id`,`link`,`parent`),
  KEY `ezurlalias_ml_par_lnk_txt` (`parent`,`text`(32),`link`),
  KEY `ezurlalias_ml_act_org` (`action`(32),`is_original`),
  KEY `ezurlalias_ml_text` (`text`(32),`id`,`link`),
  KEY `ezurlalias_ml_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlalias_ml`
--

LOCK TABLES `ezurlalias_ml` WRITE;
/*!40000 ALTER TABLE `ezurlalias_ml` DISABLE KEYS */;
INSERT INTO `ezurlalias_ml` VALUES (0,'1924739b7fe6608b10f88bff822c91b0','eznode:129','eznode',0,114,0,1,2,114,'cancellation-policies'),(0,'25d9c27d68ba0e40468e05a61f96d31d','eznode:56','eznode',0,41,0,1,3,41,'site-skeletons'),(0,'3947c8a1d64e952c11d2239fd7fd41f8','eznode:128','eznode',0,113,0,1,2,113,'data-privacy-regulations'),(0,'3b9effd9776474f4dc4ba6add25c7c60','eznode:131','eznode',0,116,0,1,3,116,'points-of-interest'),(0,'4725dcf446a342f1473a8228e42dfa48','eznode:60','eznode',0,45,0,1,3,45,'components'),(0,'50e2736330de124f6edea9b008556fe6','nop:','nop',1,17,0,0,1,17,'media2'),(0,'62933a2951ef01f4eafd9bdf4d3cd2f0','eznode:43','eznode',1,9,0,1,3,9,'Media'),(0,'76e323bf7efc1fad8935eb37bd557b92','eznode:42','eznode',0,40,0,1,3,40,'ez-platform'),(0,'86425c35a33507d479f71ade53a669aa','nop:','nop',1,3,0,0,1,3,'users2'),(0,'9bc65c2abec141778ffaa729489f3e87','eznode:5','eznode',1,2,0,1,3,2,'Users'),(0,'9e0f311464e46d9bf246f4e367538bf6','eznode:127','eznode',0,112,0,1,2,112,'terms-conditions'),(0,'a4d1fdf4a7cd746c56dbb5241779104c','eznode:126','eznode',1,111,0,1,2,111,'product-catalog'),(0,'ac68b62abfd6a9fe26e8ac4236c8ce0c','eznode:55','eznode',0,39,0,1,2,39,'forms'),(0,'d41d8cd98f00b204e9800998ecf8427e','eznode:2','eznode',1,1,0,1,3,1,''),(0,'e9b05f6557c0adad7c548b8ac4ccb334','eznode:130','eznode',0,115,0,1,3,115,'all-rides'),(2,'9ae929a5d5f36fe29e77c7c1ad993a6b','eznode:57','eznode',0,42,0,1,3,42,'shop-users'),(2,'a147e136bfa717592f2bd70bd4b53b17','eznode:14','eznode',1,6,0,1,3,6,'Editors'),(2,'c2803c3fa1b0b5423237b4e018cae755','eznode:44','eznode',1,10,0,1,3,10,'Anonymous-Users'),(2,'e57843d836e3af8ab611fde9e2139b3a','eznode:12','eznode',1,4,0,1,3,4,'Guest-accounts'),(2,'f89fad7f8a3abc8c09e1deb46a420007','eznode:13','eznode',1,5,0,1,3,5,'Administrator-users'),(3,'505e93077a6dde9034ad97a14ab022b1','nop:','nop',1,11,0,0,1,11,'anonymous_users2'),(3,'70bb992820e73638731aa8de79b3329e','eznode:12','eznode',1,26,0,0,1,4,'guest_accounts'),(3,'a147e136bfa717592f2bd70bd4b53b17','eznode:14','eznode',1,29,0,0,1,6,'editors'),(3,'a7da338c20bf65f9f789c87296379c2a','nop:','nop',1,7,0,0,1,7,'administrator_users2'),(3,'aeb8609aa933b0899aa012c71139c58c','eznode:13','eznode',1,27,0,0,1,5,'administrator_users'),(3,'e9e5ad0c05ee1a43715572e5cc545926','eznode:44','eznode',1,30,0,0,1,10,'anonymous_users'),(5,'5a9d7b0ec93173ef4fedee023209cb61','eznode:15','eznode',1,8,0,1,3,8,'Administrator-User'),(7,'a3cca2de936df1e2f805710399989971','eznode:15','eznode',1,28,0,0,0,8,'administrator_user'),(9,'2e5bc8831f7ae6a29530e7f1bbf2de9c','eznode:53','eznode',1,20,0,1,3,20,'Multimedia'),(9,'45b963397aa40d4a0063e0d85e4fe7a1','eznode:52','eznode',1,19,0,1,3,19,'Files'),(9,'59b514174bffe4ae402b3d63aad79fe0','eznode:51','eznode',1,18,0,1,3,18,'Images'),(10,'ccb62ebca03a31272430bc414bd5cd5b','eznode:45','eznode',1,12,0,1,3,12,'Anonymous-User'),(11,'c593ec85293ecb0e02d50d4c5c6c20eb','eznode:45','eznode',1,31,0,0,1,12,'anonymous_user'),(17,'2e5bc8831f7ae6a29530e7f1bbf2de9c','eznode:53','eznode',1,34,0,0,1,20,'multimedia'),(17,'45b963397aa40d4a0063e0d85e4fe7a1','eznode:52','eznode',1,33,0,0,1,19,'files'),(17,'59b514174bffe4ae402b3d63aad79fe0','eznode:51','eznode',1,32,0,0,1,18,'images'),(19,'2c5f0c4eb6b8ba8d176b87665bdbe1af','eznode:54','eznode',0,38,0,1,3,38,'form-uploads'),(42,'2e2e08df0b16974d193a4b5671cd3637','eznode:58','eznode',0,43,0,1,3,43,'private-customers'),(42,'a8c6f3a5f51fb893854a21a19857d882','eznode:59','eznode',0,44,0,1,3,44,'business-customers'),(45,'72a17c910b58be6710f8ee4a2cda65bd','eznode:62','eznode',0,47,0,1,3,47,'textmodules'),(45,'d0526cae012a62a7330efe8fb02103b3','eznode:61','eznode',0,46,0,1,2,46,'silver-eshop'),(47,'0c83f57c786a0b4a39efab23731c7ebc','eznode:67','eznode',0,52,0,1,3,52,'email'),(47,'0f6cdb621b452ac6fb994d88e674e49f','eznode:63','eznode',0,48,0,1,3,48,'basket'),(47,'177627f91af678a9b03e993f1a91917f','eznode:64','eznode',0,49,0,1,3,49,'checkout'),(47,'251d164643533a527361dbe1a7b9235d','eznode:68','eznode',0,53,0,1,3,53,'footer'),(47,'27553c0561973bee59955b80a240317f','eznode:71','eznode',0,56,0,1,3,56,'orderhistory'),(47,'2f8a6bf31f3bd67bd2d9720c58b19c9a','eznode:65','eznode',0,50,0,1,3,50,'contact'),(47,'ac68b62abfd6a9fe26e8ac4236c8ce0c','eznode:69','eznode',0,54,0,1,3,54,'forms'),(47,'bc957e26ff41470c556ee5d09e96880b','eznode:70','eznode',0,55,0,1,3,55,'misc'),(47,'e2ce0b549221aa6e0b6ee3826d198a14','eznode:66','eznode',0,51,0,1,3,51,'customercenter'),(47,'ee11cbb19052e40b07aac0ca060c23ee','eznode:72','eznode',0,57,0,1,3,57,'user'),(48,'734b90b4c9723efff60d64d0ca53e28a','eznode:74','eznode',0,59,0,1,3,59,'introtext-wishlist'),(48,'d63fed654db791a675a4080f693dae60','eznode:73','eznode',0,58,0,1,3,58,'introtext-stored-basket'),(49,'6150cab1980d86483bc3109ab49e9b67','eznode:76','eznode',0,61,0,1,2,61,'data-privay-hint'),(49,'8970d7fdd0cec509514d7945fc54105a','eznode:77','eznode',0,62,0,1,3,62,'success-message-cancellation'),(49,'9e0f311464e46d9bf246f4e367538bf6','eznode:79','eznode',0,64,0,1,3,64,'terms-conditions'),(49,'b234d1c3c4b1bb6d651c5b6789594c48','eznode:75','eznode',0,60,0,1,3,60,'accept-our-data-protection-and-cancellation-policies'),(49,'b9dd00684cb93a823b9e7725bb2f1242','eznode:78','eznode',0,63,0,1,3,63,'introtext-summary-of-order'),(50,'41f1bd2b07c878a067be19cb69c183b1','eznode:80','eznode',0,65,0,1,3,65,'success-message-contact-form'),(50,'637e5dbd7a910617008f91ddcec15a55','eznode:81','eznode',0,66,0,1,3,66,'intro-text-contact-form'),(51,'04df6fa57d509cf99bcd6d86e6547a9c','eznode:85','eznode',0,70,0,1,3,70,'buyer-approval-request-entry-page'),(51,'1f7e018d6502d81969b8b24bf98cc081','eznode:89','eznode',0,74,0,1,3,74,'success-message-request-new-user'),(51,'2202092cefbf3a2e24c1067bbaca3897','eznode:87','eznode',0,72,0,1,3,72,'success-message-edit-user'),(51,'3181851de6ee810775431c0db75fbaa5','eznode:88','eznode',0,73,0,1,3,73,'success-message-add-erp-user-to-the-shop'),(51,'412427c9f72988e885f05f5345e743a6','eznode:82','eznode',0,67,0,1,3,67,'appoval-request-entry-page'),(51,'854d6ea36164c9af097eb50ad448327f','eznode:83','eznode',0,68,0,1,3,68,'basket-sent-to-approver'),(51,'8eaa4372cfa28ce2b6a6d1ce18b35084','eznode:86','eznode',0,71,0,1,3,71,'email-request-new-user'),(51,'b925d545a954153b1880357607aa02b3','eznode:84','eznode',0,69,0,1,3,69,'basket-was-send-to-approver-info'),(51,'bbefb01b34ffa0f152bcb04d2fca424f','eznode:92','eznode',0,77,0,1,3,77,'customercenter-introtext'),(51,'dc199d1a4515b92d1bd0eab1ca22dccc','eznode:90','eznode',0,75,0,1,3,75,'error-message-forms'),(51,'ec7863bad96e6ff87c9b303e511ae246','eznode:91','eznode',0,76,0,1,3,76,'customercenter-contacts-from-erp'),(51,'f5d04785f8af9e9bed2bbe95eeeed85a','eznode:93','eznode',0,78,0,1,3,78,'request-new-user-tooltip'),(52,'0d212b99fa37c234dc15fa5bf7dd2146','eznode:96','eznode',0,81,0,1,2,81,'email-intro-text-shop-owner'),(52,'7ced87553d9831c6983e1686cb618443','eznode:95','eznode',0,80,0,1,2,80,'email-footer'),(52,'aaf3c3865fdd5761a9821f059faebc15','eznode:100','eznode',0,85,0,1,3,85,'email-invoice-right-footer'),(52,'acd866416293c4c1cb348ba9c9e6d448','eznode:98','eznode',0,83,0,1,3,83,'email-payment-method-invoice-text'),(52,'ad19bd77ee5256ef0b63501eb8e23a8f','eznode:101','eznode',0,86,0,1,3,86,'introduction-text-newsletter'),(52,'d2e405ab5afcf9b4acf0bb7873d2b570','eznode:99','eznode',0,84,0,1,3,84,'email-invoice-left-footer'),(52,'df0bab3012af3f6a5f52915db2cda1da','eznode:97','eznode',0,82,0,1,3,82,'email-header-address-invoice-text'),(52,'dfa1669c383e983ac98ab4d0d9342651','eznode:94','eznode',0,79,0,1,2,79,'email-cancellation-policies'),(53,'35c2832d5a30af16b2bcae1675006f8a','eznode:103','eznode',0,88,0,1,3,88,'footer-block-company'),(53,'83f08a6b2fbed43d60819765b04e38ff','eznode:105','eznode',0,90,0,1,3,90,'footer-block-service'),(53,'bb6a0b298ec5892160fe7b2d4f37d8cb','eznode:102','eznode',0,87,0,1,3,87,'footer-address'),(53,'d4d10526341b90eb2ddd38182783daad','eznode:104','eznode',0,89,0,1,3,89,'footer-block-ordering'),(54,'d6181cef25ea18b8dc1479941640c3ce','eznode:106','eznode',0,91,0,1,2,91,'quickorder-introtext'),(55,'27af05a1d6110ad25035e6e2f5c68b55','eznode:108','eznode',0,93,0,1,3,93,'access-denied'),(55,'6722002a0ff2b4389634bf09d35ad13e','eznode:107','eznode',0,92,0,1,3,92,'404-page'),(56,'96448651ffb17631a5175993a2eb1dbc','eznode:109','eznode',0,94,0,1,3,94,'introtext-orderhistory'),(57,'02a8b8d4e1c799fa2159db206e79df3f','eznode:115','eznode',0,100,0,1,3,100,'error-message-for-password-reminder'),(57,'08de85951c5595ddffb0fd4018228db0','eznode:120','eznode',0,105,0,1,3,105,'success-message-activate-business-customer'),(57,'344c7b358e54b6b0f1d7d398ce75c3dd','eznode:123','eznode',0,108,0,1,3,108,'success-message-edit-myaccount'),(57,'4e91e319c4333a4b1f85ab9d6a35cb55','eznode:118','eznode',0,103,0,1,3,103,'my-profile-information-intro-text'),(57,'622c5afc961caf54181e3b500a8e84a9','eznode:122','eznode',0,107,0,1,3,107,'success-message-edit-invoice'),(57,'7039edc5befb6afcbf587145da460c9d','eznode:111','eznode',0,96,0,1,2,96,'click-here-to-register-new-user'),(57,'70eb78bb27ea37b9106fcf12f74da12b','eznode:112','eznode',0,97,0,1,3,97,'success-message-password-change'),(57,'723b13feb15c8065902f088bc64ae861','eznode:116','eznode',0,101,0,1,3,101,'intro-text-edit-buyer'),(57,'789caaeb5c77d3118fc2c489cdaa1e92','eznode:110','eznode',0,95,0,1,3,95,'back-to-catalog'),(57,'8eb20f2249d404130c54c5295b43653a','eznode:119','eznode',0,104,0,1,3,104,'registration-error-message'),(57,'a29ca706a274f2f1180ecfe96d45bdde','eznode:125','eznode',0,110,0,1,3,110,'success-message-registration-private-customer'),(57,'a46cacf0b66c290c20f34c9e912cb412','eznode:113','eznode',0,98,0,1,3,98,'success-message-for-password-request'),(57,'ab2fba1022f7aad191534d6cdf877430','eznode:124','eznode',0,109,0,1,3,109,'success-message-registration-business-customer'),(57,'adbf7a723a6c6ff4a46d6da0ad77f760','eznode:117','eznode',0,102,0,1,3,102,'intro-text-edit-my-account'),(57,'baca56f0159c56b83147c9ac5e54e205','eznode:114','eznode',0,99,0,1,3,99,'error-message-password-change'),(57,'f4c93a9304ec56cfe6b0d9833636b0fb','eznode:121','eznode',0,106,0,1,3,106,'success-message-edit-buyer'),(115,'17ca0da4a30b54ddde8999f371ac1455','eznode:132','eznode',0,117,0,1,3,117,'finnish-coastline-from-rauma-to-pori'),(115,'ae95ff7623ff6f6ea6acd4384649f5fd','eznode:135','eznode',0,120,0,1,3,120,'rallarvegen-in-norway'),(115,'d35acb17ec0d0f90b13aee364acb3bc7','eznode:133','eznode',0,118,0,1,3,118,'baby-tour-of-the-battenkill'),(115,'ef449d96788bc3c56d32d0dddc0f0231','eznode:134','eznode',0,119,0,1,3,119,'meillonnas-terrain-track'),(115,'ef6af7589e8365c81ae5af713032bd4c','eznode:136','eznode',0,121,0,1,3,121,'lookouts-between-coligny-and-montagna-le-reconduit'),(116,'a803537cd8be46e54eed190daa10cc67','eznode:138','eznode',0,123,0,1,3,123,'plateau-de-vergongeat'),(116,'f2ff093ce4ec5aad7fab7dc8aadebb69','eznode:137','eznode',0,122,0,1,3,122,'cross-above-tarcia');
/*!40000 ALTER TABLE `ezurlalias_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlalias_ml_incr`
--

DROP TABLE IF EXISTS `ezurlalias_ml_incr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlalias_ml_incr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlalias_ml_incr`
--

LOCK TABLES `ezurlalias_ml_incr` WRITE;
/*!40000 ALTER TABLE `ezurlalias_ml_incr` DISABLE KEYS */;
INSERT INTO `ezurlalias_ml_incr` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92),(93),(94),(95),(96),(97),(98),(99),(100),(101),(102),(103),(104),(105),(106),(107),(108),(109),(110),(111),(112),(113),(114),(115),(116),(117),(118),(119),(120),(121),(122),(123);
/*!40000 ALTER TABLE `ezurlalias_ml_incr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlwildcard`
--

DROP TABLE IF EXISTS `ezurlwildcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlwildcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlwildcard`
--

LOCK TABLES `ezurlwildcard` WRITE;
/*!40000 ALTER TABLE `ezurlwildcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezurlwildcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser`
--

DROP TABLE IF EXISTS `ezuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser` (
  `contentobject_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `login` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `password_hash_type` int(11) NOT NULL DEFAULT 1,
  `password_updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentobject_id`),
  UNIQUE KEY `ezuser_login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser`
--

LOCK TABLES `ezuser` WRITE;
/*!40000 ALTER TABLE `ezuser` DISABLE KEYS */;
INSERT INTO `ezuser` VALUES (10,'nospam@ez.no','anonymous','$2y$10$35gOSQs6JK4u4whyERaeUuVeQBi2TUBIZIfP7HEj7sfz.MxvTuOeC',7,NULL),(14,'nospam@ez.no','admin','$2y$10$FDn9NPwzhq85cLLxfD5Wu.L3SL3Z/LNCvhkltJUV0wcJj7ciJg2oy',7,NULL);
/*!40000 ALTER TABLE `ezuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser_accountkey`
--

DROP TABLE IF EXISTS `ezuser_accountkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser_accountkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash_key` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `hash_key` (`hash_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser_accountkey`
--

LOCK TABLES `ezuser_accountkey` WRITE;
/*!40000 ALTER TABLE `ezuser_accountkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezuser_accountkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser_role`
--

DROP TABLE IF EXISTS `ezuser_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) DEFAULT NULL,
  `limit_identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `limit_value` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezuser_role_role_id` (`role_id`),
  KEY `ezuser_role_contentobject_id` (`contentobject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser_role`
--

LOCK TABLES `ezuser_role` WRITE;
/*!40000 ALTER TABLE `ezuser_role` DISABLE KEYS */;
INSERT INTO `ezuser_role` VALUES (28,11,'','',1),(31,42,'','',1),(32,13,'Subtree','/1/2/',3),(33,13,'Subtree','/1/43/',3),(34,12,'','',2),(36,42,'','',5),(37,56,'','',5),(38,42,'','',12),(39,56,'','',12),(40,56,'','',14),(54,13,'','',4),(55,56,'','',4);
/*!40000 ALTER TABLE `ezuser_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser_setting`
--

DROP TABLE IF EXISTS `ezuser_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser_setting` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `is_enabled` int(11) NOT NULL DEFAULT 0,
  `max_login` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser_setting`
--

LOCK TABLES `ezuser_setting` WRITE;
/*!40000 ALTER TABLE `ezuser_setting` DISABLE KEYS */;
INSERT INTO `ezuser_setting` VALUES (10,1,1000),(14,1,10);
/*!40000 ALTER TABLE `ezuser_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_transactions`
--

DROP TABLE IF EXISTS `financial_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `extended_data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:extended_payment_data)',
  `processed_amount` decimal(10,5) NOT NULL,
  `reason_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_amount` decimal(10,5) NOT NULL,
  `response_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tracking_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1353F2D9CE062FF9` (`credit_id`),
  KEY `IDX_1353F2D94C3A3BB` (`payment_id`),
  CONSTRAINT `FK_1353F2D94C3A3BB` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1353F2D9CE062FF9` FOREIGN KEY (`credit_id`) REFERENCES `credits` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_transactions`
--

LOCK TABLES `financial_transactions` WRITE;
/*!40000 ALTER TABLE `financial_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `financial_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_segment_group_map`
--

DROP TABLE IF EXISTS `ibexa_segment_group_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_segment_group_map` (
  `segment_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`segment_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_segment_group_map`
--

LOCK TABLES `ibexa_segment_group_map` WRITE;
/*!40000 ALTER TABLE `ibexa_segment_group_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_segment_group_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_segment_groups`
--

DROP TABLE IF EXISTS `ibexa_segment_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_segment_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`identifier`),
  UNIQUE KEY `ibexa_segment_groups_identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_segment_groups`
--

LOCK TABLES `ibexa_segment_groups` WRITE;
/*!40000 ALTER TABLE `ibexa_segment_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_segment_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_segment_user_map`
--

DROP TABLE IF EXISTS `ibexa_segment_user_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_segment_user_map` (
  `segment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`segment_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_segment_user_map`
--

LOCK TABLES `ibexa_segment_user_map` WRITE;
/*!40000 ALTER TABLE `ibexa_segment_user_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_segment_user_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_segments`
--

DROP TABLE IF EXISTS `ibexa_segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_segments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`identifier`),
  UNIQUE KEY `ibexa_segments_identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_segments`
--

LOCK TABLES `ibexa_segments` WRITE;
/*!40000 ALTER TABLE `ibexa_segments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibexa_segments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibexa_setting`
--

DROP TABLE IF EXISTS `ibexa_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibexa_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `identifier` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ibexa_setting_group_identifier` (`group`,`identifier`),
  KEY `ibexa_setting_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibexa_setting`
--

LOCK TABLES `ibexa_setting` WRITE;
/*!40000 ALTER TABLE `ibexa_setting` DISABLE KEYS */;
INSERT INTO `ibexa_setting` VALUES (1,'personalization','installation_key','\"\"');
/*!40000 ALTER TABLE `ibexa_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jms_cron_jobs`
--

DROP TABLE IF EXISTS `jms_cron_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jms_cron_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `command` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastRunAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_55F5ED428ECAEAD4` (`command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jms_cron_jobs`
--

LOCK TABLES `jms_cron_jobs` WRITE;
/*!40000 ALTER TABLE `jms_cron_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jms_cron_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jms_job_dependencies`
--

DROP TABLE IF EXISTS `jms_job_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jms_job_dependencies` (
  `source_job_id` bigint(20) unsigned NOT NULL,
  `dest_job_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`source_job_id`,`dest_job_id`),
  KEY `IDX_8DCFE92CBD1F6B4F` (`source_job_id`),
  KEY `IDX_8DCFE92C32CF8D4C` (`dest_job_id`),
  CONSTRAINT `FK_8DCFE92C32CF8D4C` FOREIGN KEY (`dest_job_id`) REFERENCES `jms_jobs` (`id`),
  CONSTRAINT `FK_8DCFE92CBD1F6B4F` FOREIGN KEY (`source_job_id`) REFERENCES `jms_jobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jms_job_dependencies`
--

LOCK TABLES `jms_job_dependencies` WRITE;
/*!40000 ALTER TABLE `jms_job_dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `jms_job_dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jms_job_related_entities`
--

DROP TABLE IF EXISTS `jms_job_related_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jms_job_related_entities` (
  `job_id` bigint(20) unsigned NOT NULL,
  `related_class` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`job_id`,`related_class`,`related_id`),
  KEY `IDX_E956F4E2BE04EA9` (`job_id`),
  CONSTRAINT `FK_E956F4E2BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `jms_jobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jms_job_related_entities`
--

LOCK TABLES `jms_job_related_entities` WRITE;
/*!40000 ALTER TABLE `jms_job_related_entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `jms_job_related_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jms_job_statistics`
--

DROP TABLE IF EXISTS `jms_job_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jms_job_statistics` (
  `job_id` bigint(20) unsigned NOT NULL,
  `characteristic` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `charValue` double NOT NULL,
  PRIMARY KEY (`job_id`,`characteristic`,`createdAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jms_job_statistics`
--

LOCK TABLES `jms_job_statistics` WRITE;
/*!40000 ALTER TABLE `jms_job_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `jms_job_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jms_jobs`
--

DROP TABLE IF EXISTS `jms_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jms_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` smallint(6) NOT NULL,
  `createdAt` datetime NOT NULL,
  `startedAt` datetime DEFAULT NULL,
  `checkedAt` datetime DEFAULT NULL,
  `workerName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `executeAfter` datetime DEFAULT NULL,
  `closedAt` datetime DEFAULT NULL,
  `command` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `output` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `errorOutput` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exitCode` smallint(5) unsigned DEFAULT NULL,
  `maxRuntime` smallint(5) unsigned NOT NULL,
  `maxRetries` smallint(5) unsigned NOT NULL,
  `stackTrace` longblob DEFAULT NULL COMMENT '(DC2Type:jms_job_safe_object)',
  `runtime` smallint(5) unsigned DEFAULT NULL,
  `memoryUsage` int(10) unsigned DEFAULT NULL,
  `memoryUsageReal` int(10) unsigned DEFAULT NULL,
  `originalJob_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_704ADB9349C447F1` (`originalJob_id`),
  KEY `cmd_search_index` (`command`),
  KEY `sorting_index` (`state`,`priority`,`id`),
  CONSTRAINT `FK_704ADB9349C447F1` FOREIGN KEY (`originalJob_id`) REFERENCES `jms_jobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jms_jobs`
--

LOCK TABLES `jms_jobs` WRITE;
/*!40000 ALTER TABLE `jms_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jms_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaliop_migrations`
--

DROP TABLE IF EXISTS `kaliop_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaliop_migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `execution_date` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `execution_error` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`migration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaliop_migrations`
--

LOCK TABLES `kaliop_migrations` WRITE;
/*!40000 ALTER TABLE `kaliop_migrations` DISABLE KEYS */;
INSERT INTO `kaliop_migrations` VALUES ('201804161300_components.yml','/var/www/html/training/ibexa_website_3.3/vendor/ibexa/installer/src/bundle/Resources/install/migrations/kaliop_migrations/content/Components/201804161300_components.yml','8a9f864b9e5e95233d6543b7a91bf2e3',1611581048,2,''),('201804161300_content_types.yml','/var/www/html/training/ibexa_website_3.3/vendor/ibexa/installer/src/bundle/Resources/install/migrations/kaliop_migrations/content_types/201804161300_content_types.yml','82945ea413b8ab73c97f7d435c9c815a',1611581046,2,''),('201804161300_product_catalog.yml','/var/www/html/training/ibexa_website_3.3/vendor/ibexa/installer/src/bundle/Resources/install/migrations/kaliop_migrations/content/Catalog/201804161300_product_catalog.yml','e3ab9f36311b45a04796b570fabbb53f',1611581060,2,''),('201804161300_roles_pb_update.yml','/var/www/html/training/ibexa_website_3.3/vendor/ibexa/installer/src/bundle/Resources/install/migrations/kaliop_migrations/roles/201804161300_roles_pb_update.yml','75136536debccf9f1bc716026e05cd08',1611581064,2,''),('201804161300_roles.yml','/var/www/html/training/ibexa_website_3.3/vendor/ibexa/installer/src/bundle/Resources/install/migrations/kaliop_migrations/roles/201804161300_roles.yml','06ea50ffc65ab623fcb71a6e2fdb320d',1611581062,2,''),('201804161300_sections.yml','/var/www/html/training/ibexa_website_3.3/vendor/ibexa/installer/src/bundle/Resources/install/migrations/kaliop_migrations/sections/201804161300_sections.yml','42a52fe7edbf9cf85bd2e3e66319ffc1',1611581048,2,''),('201804161300_users.yml','/var/www/html/training/ibexa_website_3.3/vendor/ibexa/installer/src/bundle/Resources/install/migrations/kaliop_migrations/users/201804161300_users.yml','c5fe46979527d1e669b872ba95d8a9c8',1611581046,2,''),('202007121300_articles.yml','/var/www/html/training/ibexa_website_3.3/vendor/ibexa/installer/src/bundle/Resources/install/migrations/kaliop_migrations/content/Articles/202007121300_articles.yml','606dc96e60df9d2a5467394808dc9e55',1611581061,2,'');
/*!40000 ALTER TABLE `kaliop_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_instructions`
--

DROP TABLE IF EXISTS `payment_instructions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_instructions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,5) NOT NULL,
  `approved_amount` decimal(10,5) NOT NULL,
  `approving_amount` decimal(10,5) NOT NULL,
  `created_at` datetime NOT NULL,
  `credited_amount` decimal(10,5) NOT NULL,
  `crediting_amount` decimal(10,5) NOT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposited_amount` decimal(10,5) NOT NULL,
  `depositing_amount` decimal(10,5) NOT NULL,
  `extended_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:extended_payment_data)',
  `payment_system_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reversing_approved_amount` decimal(10,5) NOT NULL,
  `reversing_credited_amount` decimal(10,5) NOT NULL,
  `reversing_deposited_amount` decimal(10,5) NOT NULL,
  `state` smallint(6) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_instructions`
--

LOCK TABLES `payment_instructions` WRITE;
/*!40000 ALTER TABLE `payment_instructions` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_instructions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_instruction_id` int(11) NOT NULL,
  `approved_amount` decimal(10,5) NOT NULL,
  `approving_amount` decimal(10,5) NOT NULL,
  `credited_amount` decimal(10,5) NOT NULL,
  `crediting_amount` decimal(10,5) NOT NULL,
  `deposited_amount` decimal(10,5) NOT NULL,
  `depositing_amount` decimal(10,5) NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `reversing_approved_amount` decimal(10,5) NOT NULL,
  `reversing_credited_amount` decimal(10,5) NOT NULL,
  `reversing_deposited_amount` decimal(10,5) NOT NULL,
  `state` smallint(6) NOT NULL,
  `target_amount` decimal(10,5) NOT NULL,
  `attention_required` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_65D29B328789B572` (`payment_instruction_id`),
  CONSTRAINT `FK_65D29B328789B572` FOREIGN KEY (`payment_instruction_id`) REFERENCES `payment_instructions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_basket`
--

DROP TABLE IF EXISTS `ses_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_basket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_id` int(11) DEFAULT NULL,
  `erp_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `erp_fail_counter` int(11) DEFAULT NULL,
  `erp_fail_error_log` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `basket_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_party` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:object)',
  `delivery_party` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:object)',
  `buyer_party` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:object)',
  `remark` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_last_modified` datetime NOT NULL,
  `shop` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `require_price_update` tinyint(1) NOT NULL,
  `totals` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `totals_sum` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:object)',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totals_sum_net` double DEFAULT NULL,
  `totals_sum_gross` double DEFAULT NULL,
  `additional_lines` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `last_price_calculation` datetime DEFAULT NULL,
  `shipping_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmation_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_confirmation_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `all_products_available` tinyint(1) NOT NULL DEFAULT 1,
  `data_map` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `search_idx_user_id` (`user_id`),
  KEY `search_idx_session_id` (`session_id`),
  KEY `search_idx_guid` (`guid`),
  KEY `search_idx_state` (`state`),
  KEY `search_idx_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_basket`
--

LOCK TABLES `ses_basket` WRITE;
/*!40000 ALTER TABLE `ses_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_basket_line`
--

DROP TABLE IF EXISTS `ses_basket_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_basket_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basket_id` int(11) DEFAULT NULL,
  `line_number` int(11) NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `price_net` double DEFAULT NULL,
  `price_gross` double DEFAULT NULL,
  `line_price_amount_net` double DEFAULT NULL,
  `line_price_amount_gross` double DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `is_inc_vat` tinyint(1) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catalog_element_serialized` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_calc` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_order` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote_data_map` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `variant_characteristics` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:object)',
  `assigned_lines` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_F0419B6E1BE1FB52` (`basket_id`),
  CONSTRAINT `FK_F0419B6E1BE1FB52` FOREIGN KEY (`basket_id`) REFERENCES `ses_basket` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_basket_line`
--

LOCK TABLES `ses_basket_line` WRITE;
/*!40000 ALTER TABLE `ses_basket_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_basket_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_content_modification_queue`
--

DROP TABLE IF EXISTS `ses_content_modification_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_content_modification_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_content_modification_queue`
--

LOCK TABLES `ses_content_modification_queue` WRITE;
/*!40000 ALTER TABLE `ses_content_modification_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_content_modification_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_customer_prices`
--

DROP TABLE IF EXISTS `ses_customer_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_customer_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_group` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basic_price` double NOT NULL,
  `price` double DEFAULT NULL,
  `shop_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_price` (`shop_id`,`sku`,`variant_code`,`currency`,`customer_group`,`customer_number`),
  KEY `ind_sku_cust_prices` (`sku`),
  KEY `ind_shop_id` (`shop_id`),
  KEY `ind_variant_code` (`variant_code`),
  KEY `ind_group` (`customer_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_customer_prices`
--

LOCK TABLES `ses_customer_prices` WRITE;
/*!40000 ALTER TABLE `ses_customer_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_customer_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_customer_sku`
--

DROP TABLE IF EXISTS `ses_customer_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_customer_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_sku` (`sku`),
  KEY `ind_customer_sku` (`customer_sku`),
  KEY `ind_customer_number` (`customer_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_customer_sku`
--

LOCK TABLES `ses_customer_sku` WRITE;
/*!40000 ALTER TABLE `ses_customer_sku` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_customer_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_download`
--

DROP TABLE IF EXISTS `ses_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basket_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_of_order` datetime NOT NULL,
  `guid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_paths` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `basket_line_id` int(11) DEFAULT NULL,
  `data_map` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_download`
--

LOCK TABLES `ses_download` WRITE;
/*!40000 ALTER TABLE `ses_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_externaldata`
--

DROP TABLE IF EXISTS `ses_externaldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_externaldata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identifier` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_code` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ses_field_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_ses_externaldata` (`sku`,`identifier`,`language_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_externaldata`
--

LOCK TABLES `ses_externaldata` WRITE;
/*!40000 ALTER TABLE `ses_externaldata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_externaldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_gdpr_log`
--

DROP TABLE IF EXISTS `ses_gdpr_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_gdpr_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_timestamp` datetime NOT NULL,
  `log_channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_level` int(11) NOT NULL,
  `log_message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_mail` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_gdpr_log`
--

LOCK TABLES `ses_gdpr_log` WRITE;
/*!40000 ALTER TABLE `ses_gdpr_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_gdpr_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_log_erp`
--

DROP TABLE IF EXISTS `ses_log_erp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_log_erp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_timestamp` datetime NOT NULL,
  `log_channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_level` int(11) NOT NULL,
  `log_message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `measuring_point` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response_status` int(11) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_time` int(11) DEFAULT NULL,
  `message_identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_log_erp`
--

LOCK TABLES `ses_log_erp` WRITE;
/*!40000 ALTER TABLE `ses_log_erp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_log_erp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_log_mail`
--

DROP TABLE IF EXISTS `ses_log_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_log_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_timestamp` datetime NOT NULL,
  `log_channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_level` int(11) NOT NULL,
  `log_message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_timestamp` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_log_mail`
--

LOCK TABLES `ses_log_mail` WRITE;
/*!40000 ALTER TABLE `ses_log_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_log_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_log_search`
--

DROP TABLE IF EXISTS `ses_log_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_log_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_timestamp` datetime NOT NULL,
  `log_channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_level` int(11) NOT NULL,
  `log_message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `results` int(11) NOT NULL,
  `language` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_log_search`
--

LOCK TABLES `ses_log_search` WRITE;
/*!40000 ALTER TABLE `ses_log_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_log_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_payment_basket_map`
--

DROP TABLE IF EXISTS `ses_payment_basket_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_payment_basket_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basket_id` int(11) DEFAULT NULL,
  `payment_instruction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C62902641BE1FB52` (`basket_id`),
  UNIQUE KEY `UNIQ_C62902648789B572` (`payment_instruction_id`),
  CONSTRAINT `FK_C62902641BE1FB52` FOREIGN KEY (`basket_id`) REFERENCES `ses_basket` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C62902648789B572` FOREIGN KEY (`payment_instruction_id`) REFERENCES `payment_instructions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_payment_basket_map`
--

LOCK TABLES `ses_payment_basket_map` WRITE;
/*!40000 ALTER TABLE `ses_payment_basket_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_payment_basket_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_price`
--

DROP TABLE IF EXISTS `ses_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_group` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_price` double NOT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_price_ses_price` (`shop_id`,`sku`,`variant_code`,`currency`,`customer_group`),
  KEY `ind_sku_ses_price` (`sku`),
  KEY `ind_shop_id_ses_price` (`shop_id`),
  KEY `ind_variant_code_ses_price` (`variant_code`),
  KEY `ind_group_ses_price` (`customer_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_price`
--

LOCK TABLES `ses_price` WRITE;
/*!40000 ALTER TABLE `ses_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_shipping_cost`
--

DROP TABLE IF EXISTS `ses_shipping_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_shipping_cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shippingMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shippingCost` double DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valueOfGoods` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_shipping_cost`
--

LOCK TABLES `ses_shipping_cost` WRITE;
/*!40000 ALTER TABLE `ses_shipping_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_shipping_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_stat_sessions`
--

DROP TABLE IF EXISTS `ses_stat_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_stat_sessions` (
  `sessions` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`sessions`,`date`),
  KEY `session_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_stat_sessions`
--

LOCK TABLES `ses_stat_sessions` WRITE;
/*!40000 ALTER TABLE `ses_stat_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_stat_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_stock`
--

DROP TABLE IF EXISTS `ses_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_sign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_stock`
--

LOCK TABLES `ses_stock` WRITE;
/*!40000 ALTER TABLE `ses_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ses_token`
--

DROP TABLE IF EXISTS `ses_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ses_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `valid_until` datetime NOT NULL,
  `last_access` datetime NOT NULL,
  `lock_timeout` datetime DEFAULT NULL,
  `action_service_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_service_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_service_method_parameter` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:object)',
  `token_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ses_token`
--

LOCK TABLES `ses_token` WRITE;
/*!40000 ALTER TABLE `ses_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `ses_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_time` int(11) NOT NULL,
  `sess_lifetime` int(11) NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sve_class`
--

DROP TABLE IF EXISTS `sve_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sve_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_identifier` int(11) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sve_class`
--

LOCK TABLES `sve_class` WRITE;
/*!40000 ALTER TABLE `sve_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `sve_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sve_class_attributes`
--

DROP TABLE IF EXISTS `sve_class_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sve_class_attributes` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `attribute_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ezdatatype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`attribute_id`),
  KEY `ind_class_id` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sve_class_attributes`
--

LOCK TABLES `sve_class_attributes` WRITE;
/*!40000 ALTER TABLE `sve_class_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sve_class_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sve_object`
--

DROP TABLE IF EXISTS `sve_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sve_object` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `change_date` datetime DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` smallint(6) NOT NULL,
  `section` int(11) NOT NULL,
  `url_alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_string` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `main_node_id` int(11) NOT NULL,
  PRIMARY KEY (`node_id`),
  UNIQUE KEY `ind_url_alias` (`url_alias`),
  KEY `ind_parent_id` (`parent_id`),
  KEY `ind_path_string` (`path_string`),
  KEY `ind_main_node_id` (`main_node_id`),
  KEY `ind_class_id_obj` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sve_object`
--

LOCK TABLES `sve_object` WRITE;
/*!40000 ALTER TABLE `sve_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `sve_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sve_object_attributes`
--

DROP TABLE IF EXISTS `sve_object_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sve_object_attributes` (
  `node_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_float` double DEFAULT NULL,
  `data_int` int(11) DEFAULT NULL,
  `data_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`node_id`,`attribute_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sve_object_attributes`
--

LOCK TABLES `sve_object_attributes` WRITE;
/*!40000 ALTER TABLE `sve_object_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sve_object_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sve_object_attributes_tmp`
--

DROP TABLE IF EXISTS `sve_object_attributes_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sve_object_attributes_tmp` (
  `node_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_float` double DEFAULT NULL,
  `data_int` int(11) DEFAULT NULL,
  `data_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`node_id`,`attribute_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sve_object_attributes_tmp`
--

LOCK TABLES `sve_object_attributes_tmp` WRITE;
/*!40000 ALTER TABLE `sve_object_attributes_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sve_object_attributes_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sve_object_catalog`
--

DROP TABLE IF EXISTS `sve_object_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sve_object_catalog` (
  `node_id` int(11) NOT NULL,
  `catalog_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`node_id`,`catalog_code`),
  KEY `node_id_obj_cat` (`node_id`),
  KEY `catalog_code` (`catalog_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sve_object_catalog`
--

LOCK TABLES `sve_object_catalog` WRITE;
/*!40000 ALTER TABLE `sve_object_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `sve_object_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sve_object_catalog_tmp`
--

DROP TABLE IF EXISTS `sve_object_catalog_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sve_object_catalog_tmp` (
  `node_id` int(11) NOT NULL,
  `catalog_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`node_id`,`catalog_code`),
  KEY `node_id` (`node_id`),
  KEY `catalog_code_tmp` (`catalog_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sve_object_catalog_tmp`
--

LOCK TABLES `sve_object_catalog_tmp` WRITE;
/*!40000 ALTER TABLE `sve_object_catalog_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sve_object_catalog_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sve_object_tmp`
--

DROP TABLE IF EXISTS `sve_object_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sve_object_tmp` (
  `node_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `change_date` datetime DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` smallint(6) NOT NULL,
  `section` int(11) NOT NULL,
  `url_alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_string` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `main_node_id` int(11) NOT NULL,
  PRIMARY KEY (`node_id`),
  UNIQUE KEY `ind_url_alias_tmp` (`url_alias`),
  KEY `ind_parent_id_tmp` (`parent_id`),
  KEY `ind_path_string_tmp` (`path_string`),
  KEY `ind_main_node_id_tmp` (`main_node_id`),
  KEY `ind_class_id_tmp` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sve_object_tmp`
--

LOCK TABLES `sve_object_tmp` WRITE;
/*!40000 ALTER TABLE `sve_object_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sve_object_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sve_object_urls`
--

DROP TABLE IF EXISTS `sve_object_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sve_object_urls` (
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `url_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `is_current_url` tinyint(1) NOT NULL DEFAULT 1,
  `node_id` int(11) NOT NULL,
  `sku` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`url`,`language`),
  KEY `search_idx_node_id_obj` (`node_id`),
  KEY `search_idx_is_current_url_sve_obj_url` (`is_current_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sve_object_urls`
--

LOCK TABLES `sve_object_urls` WRITE;
/*!40000 ALTER TABLE `sve_object_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `sve_object_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sve_object_urls_tmp`
--

DROP TABLE IF EXISTS `sve_object_urls_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sve_object_urls_tmp` (
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `url_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `is_current_url` tinyint(1) NOT NULL DEFAULT 1,
  `node_id` int(11) NOT NULL,
  `sku` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`url`,`language`),
  KEY `search_idx_node_id` (`node_id`),
  KEY `search_idx_is_current_url` (`is_current_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sve_object_urls_tmp`
--

LOCK TABLES `sve_object_urls_tmp` WRITE;
/*!40000 ALTER TABLE `sve_object_urls_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sve_object_urls_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thread` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_commentable` tinyint(1) NOT NULL,
  `num_comments` int(11) NOT NULL,
  `last_comment_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-25 16:48:57
