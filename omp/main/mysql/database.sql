-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: omp-ci
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcement_settings`
--

DROP TABLE IF EXISTS `announcement_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_settings` (
  `announcement_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `announcement_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`announcement_setting_id`),
  UNIQUE KEY `announcement_settings_unique` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`),
  CONSTRAINT `announcement_settings_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about announcements, including localized properties like names and contents.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_settings`
--

LOCK TABLES `announcement_settings` WRITE;
/*!40000 ALTER TABLE `announcement_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_type_settings`
--

DROP TABLE IF EXISTS `announcement_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_type_settings` (
  `announcement_type_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`announcement_type_setting_id`),
  UNIQUE KEY `announcement_type_settings_unique` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`),
  CONSTRAINT `announcement_type_settings_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about announcement types, including localized properties like their names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_type_settings`
--

LOCK TABLES `announcement_type_settings` WRITE;
/*!40000 ALTER TABLE `announcement_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_types`
--

DROP TABLE IF EXISTS `announcement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_types` (
  `type_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_context_id` (`context_id`),
  CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Announcement types allow for announcements to optionally be categorized.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_types`
--

LOCK TABLES `announcement_types` WRITE;
/*!40000 ALTER TABLE `announcement_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `announcement_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint DEFAULT NULL,
  `assoc_id` bigint DEFAULT NULL,
  `type_id` bigint DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_type_id` (`type_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `announcements_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Announcements are messages that can be presented to users e.g. on the homepage.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_settings`
--

DROP TABLE IF EXISTS `author_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_settings` (
  `author_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`author_setting_id`),
  UNIQUE KEY `author_settings_unique` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`),
  CONSTRAINT `author_settings_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8mb3 COMMENT='More data about authors, including localized properties such as their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (1,1,'en','affiliation','University of Calgary'),(2,1,'','country','CA'),(3,1,'en','familyName','Clark'),(4,1,'en','givenName','Arthur'),(5,2,'en','affiliation','Athabasca University'),(6,2,'','country','CA'),(7,2,'en','familyName','Finkel'),(8,2,'en','givenName','Alvin'),(9,3,'en','affiliation',NULL),(10,3,'fr_CA','affiliation',NULL),(11,3,'en','biography',NULL),(12,3,'fr_CA','biography',NULL),(13,3,'','country','CA'),(14,3,'en','familyName','Carter'),(15,3,'fr_CA','familyName',NULL),(16,3,'en','givenName','Sarah'),(17,3,'fr_CA','givenName',NULL),(18,3,'en','preferredPublicName',NULL),(19,3,'fr_CA','preferredPublicName',NULL),(20,3,'','isVolumeEditor','0'),(21,4,'en','affiliation',NULL),(22,4,'fr_CA','affiliation',NULL),(23,4,'en','biography',NULL),(24,4,'fr_CA','biography',NULL),(25,4,'','country','CA'),(26,4,'en','familyName','Fortna'),(27,4,'fr_CA','familyName',NULL),(28,4,'en','givenName','Peter'),(29,4,'fr_CA','givenName',NULL),(30,4,'en','preferredPublicName',NULL),(31,4,'fr_CA','preferredPublicName',NULL),(32,4,'','isVolumeEditor','0'),(33,5,'en','affiliation',NULL),(34,5,'fr_CA','affiliation',NULL),(35,5,'en','biography',NULL),(36,5,'fr_CA','biography',NULL),(37,5,'','country','CA'),(38,5,'en','familyName','Friesen'),(39,5,'fr_CA','familyName',NULL),(40,5,'en','givenName','Gerald'),(41,5,'fr_CA','givenName',NULL),(42,5,'en','preferredPublicName',NULL),(43,5,'fr_CA','preferredPublicName',NULL),(44,5,'','isVolumeEditor','0'),(45,6,'en','affiliation',NULL),(46,6,'fr_CA','affiliation',NULL),(47,6,'en','biography',NULL),(48,6,'fr_CA','biography',NULL),(49,6,'','country','CA'),(50,6,'en','familyName','Dick'),(51,6,'fr_CA','familyName',NULL),(52,6,'en','givenName','Lyle'),(53,6,'fr_CA','givenName',NULL),(54,6,'en','preferredPublicName',NULL),(55,6,'fr_CA','preferredPublicName',NULL),(56,6,'','isVolumeEditor','0'),(57,7,'en','affiliation',NULL),(58,7,'fr_CA','affiliation',NULL),(59,7,'en','biography',NULL),(60,7,'fr_CA','biography',NULL),(61,7,'','country','CA'),(62,7,'en','familyName','Wheeler'),(63,7,'fr_CA','familyName',NULL),(64,7,'en','givenName','Winona'),(65,7,'fr_CA','givenName',NULL),(66,7,'en','preferredPublicName',NULL),(67,7,'fr_CA','preferredPublicName',NULL),(68,7,'','isVolumeEditor','0'),(69,8,'en','affiliation',NULL),(70,8,'fr_CA','affiliation',NULL),(71,8,'en','biography',NULL),(72,8,'fr_CA','biography',NULL),(73,8,'','country','CA'),(74,8,'en','familyName','Dyce'),(75,8,'fr_CA','familyName',NULL),(76,8,'en','givenName','Matt'),(77,8,'fr_CA','givenName',NULL),(78,8,'en','preferredPublicName',NULL),(79,8,'fr_CA','preferredPublicName',NULL),(80,8,'','isVolumeEditor','0'),(81,9,'en','affiliation',NULL),(82,9,'fr_CA','affiliation',NULL),(83,9,'en','biography',NULL),(84,9,'fr_CA','biography',NULL),(85,9,'','country','CA'),(86,9,'en','familyName','Opp'),(87,9,'fr_CA','familyName',NULL),(88,9,'en','givenName','James'),(89,9,'fr_CA','givenName',NULL),(90,9,'en','preferredPublicName',NULL),(91,9,'fr_CA','preferredPublicName',NULL),(92,9,'','isVolumeEditor','0'),(105,11,'en','affiliation','Athabasca University'),(106,11,'','country','CA'),(107,11,'en','familyName','Barnetson'),(108,11,'en','givenName','Bob'),(109,12,'en','affiliation','University of British Columbia'),(110,12,'','country','CA'),(111,12,'en','familyName','Beaty'),(112,12,'en','givenName','Bart'),(113,13,'en','affiliation','University of Alberta'),(114,13,'','country','CA'),(115,13,'en','familyName','Miller'),(116,13,'en','givenName','Toby'),(117,14,'en','affiliation','Athabasca University'),(118,14,'','country','CA'),(119,14,'en','familyName','Wagman'),(120,14,'en','givenName','Ira'),(121,15,'en','affiliation','University of Calgary'),(122,15,'','country','CA'),(123,15,'en','familyName','Straw'),(124,15,'en','givenName','Will'),(125,16,'en','affiliation','University of Southern California'),(126,16,'','country','CA'),(127,16,'en','familyName','Allan'),(128,16,'en','givenName','Chantal'),(129,17,'en','affiliation','SUNY'),(130,17,'','country','US'),(131,17,'en','familyName','Bernnard'),(132,17,'en','givenName','Deborah'),(133,18,'en','affiliation','SUNY'),(134,18,'','country','US'),(135,18,'en','familyName','Bobish'),(136,18,'en','givenName','Greg'),(137,19,'en','affiliation','SUNY'),(138,19,'','country','US'),(139,19,'en','familyName','Bullis'),(140,19,'en','givenName','Daryl'),(141,20,'en','affiliation','SUNY'),(142,20,'','country','US'),(143,20,'en','familyName','Hecker'),(144,20,'en','givenName','Jenna'),(145,21,'en','affiliation','Athabasca University'),(146,21,'','country','CA'),(147,21,'en','familyName','Kennepohl'),(148,21,'en','givenName','Dietmar'),(149,22,'en','affiliation','University of Calgary'),(150,22,'','country','CA'),(151,22,'en','familyName','Anderson'),(152,22,'en','givenName','Terry'),(153,23,'en','affiliation','University of Alberta'),(154,23,'','country','CA'),(155,23,'en','familyName','Gorsky'),(156,23,'en','givenName','Paul'),(157,24,'en','affiliation','Athabasca University'),(158,24,'','country','CA'),(159,24,'en','familyName','Parchoma'),(160,24,'en','givenName','Gale'),(161,25,'en','affiliation','University of Alberta'),(162,25,'','country','CA'),(163,25,'en','familyName','Palmer'),(164,25,'en','givenName','Stuart'),(165,26,'en','affiliation','University of Sussex'),(166,26,'','country','CA'),(167,26,'en','familyName','Perini'),(168,26,'en','givenName','Fernando'),(169,27,'','country','GB'),(170,27,'en','familyName','Mansell'),(171,27,'en','givenName','Robin'),(172,28,'','country','AR'),(173,28,'en','familyName','Galperin'),(174,28,'en','givenName','Hernan'),(175,29,'','country','CL'),(176,29,'en','familyName','Bello'),(177,29,'en','givenName','Pablo'),(178,30,'','country','AR'),(179,30,'en','familyName','Rabinovich'),(180,30,'en','givenName','Eleonora'),(181,31,'en','affiliation','Buffalo National Park Foundation'),(182,31,'','country','CA'),(183,31,'en','familyName','Brower'),(184,31,'en','givenName','Jennifer'),(185,32,'en','affiliation','University of Alberta'),(186,32,'','country','CA'),(187,32,'en','familyName','Locke Hart'),(188,32,'en','givenName','Jonathan'),(189,33,'en','affiliation','International Development Research Centre'),(190,33,'','country','CA'),(191,33,'en','familyName','Elder'),(192,33,'en','givenName','Laurent'),(193,34,'','country','CA'),(194,34,'en','familyName','Emdon'),(195,34,'en','givenName','Heloise'),(196,35,'','country','CA'),(197,35,'en','familyName','Tulus'),(198,35,'en','givenName','Frank'),(199,36,'','country','AR'),(200,36,'en','familyName','Hyma'),(201,36,'en','givenName','Raymond'),(202,37,'','country','CA'),(203,37,'en','familyName','Valk'),(204,37,'en','givenName','John'),(205,38,'','country','CA'),(206,38,'en','familyName','Fourati'),(207,38,'en','givenName','Khaled'),(208,39,'','country','CA'),(209,39,'en','familyName','de Beer'),(210,39,'en','givenName','Jeremy'),(211,40,'','country','CA'),(212,40,'en','familyName','Bannerman'),(213,40,'en','givenName','Sara'),(214,41,'en','affiliation','Athabasca University'),(215,41,'','country','CA'),(216,41,'en','familyName','Ally'),(217,41,'en','givenName','Mohamed'),(218,42,'','country','GB'),(219,42,'en','familyName','Traxler'),(220,42,'en','givenName','John'),(221,43,'','country','CA'),(222,43,'en','familyName','Koole'),(223,43,'en','givenName','Marguerite'),(224,44,'','country','NO'),(225,44,'en','familyName','Rekkedal'),(226,44,'en','givenName','Torstein'),(227,45,'en','affiliation','University of Alberta'),(228,45,'','country','CA'),(229,45,'en','familyName','Dawson'),(230,45,'en','givenName','Michael'),(231,46,'en','affiliation','Athabasca University'),(232,46,'','country','CA'),(233,46,'en','familyName','Dupuis'),(234,46,'en','givenName','Brian'),(235,47,'en','affiliation','University of Calgary'),(236,47,'','country','CA'),(237,47,'en','familyName','Wilson'),(238,47,'en','givenName','Michael'),(239,48,'en','affiliation','University of Calgary'),(240,48,'','country','CA'),(241,48,'en','familyName','Foran'),(242,48,'en','givenName','Max'),(243,49,'en','affiliation','London School of Economics'),(244,49,'','country','CA'),(245,49,'en','familyName','Power'),(246,49,'en','givenName','Michael'),(247,50,'en','affiliation','International Development Research Centre'),(248,50,'','country','CA'),(249,50,'en','familyName','Smith'),(250,50,'en','givenName','Matthew'),(251,51,'','country','US'),(252,51,'en','familyName','Benkler'),(253,51,'en','givenName','Yochai'),(254,52,'','country','CA'),(255,52,'en','familyName','Reilly'),(256,52,'en','givenName','Katherine'),(257,53,'','country','US'),(258,53,'en','familyName','Loudon'),(259,53,'en','givenName','Melissa'),(260,54,'','country','SA'),(261,54,'en','familyName','Rivett'),(262,54,'en','givenName','Ulrike'),(263,55,'','country','GB'),(264,55,'en','familyName','Graham'),(265,55,'en','givenName','Mark'),(266,56,'','country','NO'),(267,56,'en','familyName','Haarstad'),(268,56,'en','givenName','Håvard'),(269,57,'','country','US'),(270,57,'en','familyName','Smith'),(271,57,'en','givenName','Marshall');
/*!40000 ALTER TABLE `author_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint NOT NULL DEFAULT '1',
  `publication_id` bigint NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `user_group_id` bigint DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_user_group_id` (`user_group_id`),
  KEY `authors_publication_id_foreign` (`publication_id`),
  CONSTRAINT `authors_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `authors_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COMMENT='The authors of a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'aclark@mailinator.com',1,1,0,13),(2,'afinkel@mailinator.com',1,2,0,13),(3,'scarter@mailinator.com',1,2,1,14),(4,'pfortna@mailinator.com',1,2,2,14),(5,'gfriesen@mailinator.com',1,2,3,15),(6,'ldick@mailinator.com',1,2,4,15),(7,'wwheeler@mailinator.com',1,2,5,15),(8,'mdyce@mailinator.com',1,2,6,15),(9,'jopp@mailinator.com',1,2,7,15),(11,'bbarnetson@mailinator.com',1,3,0,13),(12,'bbeaty@mailinator.com',1,4,0,13),(13,'tmiller@mailinator.com',1,4,0,13),(14,'awagman@mailinator.com',1,4,0,13),(15,'wstraw@mailinator.com',1,4,0,13),(16,'callan@mailinator.com',1,5,0,13),(17,'dbernnard@mailinator.com',1,6,0,13),(18,'gbobish@mailinator.com',1,6,0,13),(19,'dbullis@mailinator.com',1,6,0,13),(20,'jhecker@mailinator.com',1,6,0,13),(21,'dkennepohl@mailinator.com',1,7,0,13),(22,'tanderson@mailinator.com',1,7,0,13),(23,'pgorsky@mailinator.com',1,7,0,13),(24,'gparchoma@mailinator.com',1,7,0,13),(25,'spalmer@mailinator.com',1,7,0,13),(26,'fperini@mailinator.com',1,9,0,13),(27,'rmansell@mailinator.com',1,9,0,13),(28,'hgalperin@mailinator.com',1,9,0,13),(29,'pbello@mailinator.com',1,9,0,13),(30,'erabinovich@mailinator.com',1,9,0,13),(31,'jbrower@mailinator.com',1,10,0,13),(32,'jlockehart@mailinator.com',1,11,0,13),(33,'lelder@mailinator.com',1,12,0,13),(34,'lelder@mailinator.com',1,12,0,14),(35,'ftulus@mailinator.com',1,12,0,13),(36,'rhyma@mailinator.com',1,12,0,13),(37,'jvalk@mailinator.com',1,12,0,13),(38,'fkourati@mailinator.com',1,12,0,13),(39,'jdebeer@mailinator.com',1,12,0,13),(40,'sbannerman@mailinator.com',1,12,0,13),(41,'mally@mailinator.com',1,13,0,13),(42,'jtraxler@mailinator.com',1,13,0,13),(43,'mkoole@mailinator.com',1,13,0,13),(44,'trekkedal@mailinator.com',1,13,0,13),(45,'mdawson@mailinator.com',1,14,0,13),(46,'bdupuis@mailinator.com',1,14,0,13),(47,'mwilson@mailinator.com',1,14,0,13),(48,'mforan@mailinator.com',1,15,0,13),(49,'mpower@mailinator.com',1,16,0,13),(50,'msmith@mailinator.com',1,17,0,13),(51,'ybenkler@mailinator.com',1,17,0,13),(52,'kreilly@mailinator.com',1,17,0,13),(53,'mloudon@mailinator.com',1,17,0,13),(54,'urivett@mailinator.com',1,17,0,13),(55,'mgraham@mailinator.com',1,17,0,13),(56,'hhaarstad@mailinator.com',1,17,0,13),(57,'masmith@mailinator.com',1,17,0,13);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `seq` bigint DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`),
  KEY `category_context_parent_id` (`context_id`,`parent_id`),
  KEY `category_parent_id` (`parent_id`),
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='Categories permit the organization of submissions into a heirarchical structure.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,NULL,1,'applied-science',NULL),(2,1,1,2,'comp-sci',NULL),(3,1,1,3,'eng',NULL),(4,1,NULL,4,'social-sciences',NULL),(5,1,4,5,'sociology',NULL),(6,1,4,10000,'anthropology',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_settings`
--

DROP TABLE IF EXISTS `category_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_settings` (
  `category_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`category_setting_id`),
  UNIQUE KEY `category_settings_unique` (`category_id`,`locale`,`setting_name`),
  KEY `category_settings_category_id` (`category_id`),
  CONSTRAINT `category_settings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COMMENT='More data about categories, including localized properties such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
INSERT INTO `category_settings` VALUES (1,1,'','sortOption','title-ASC'),(2,1,'en','title','Applied Science'),(3,1,'fr_CA','title',''),(4,1,'en','description',''),(5,1,'fr_CA','description',''),(6,2,'','sortOption','title-ASC'),(7,2,'en','title','Computer Science'),(8,2,'fr_CA','title',''),(9,2,'en','description',''),(10,2,'fr_CA','description',''),(11,3,'','sortOption','title-ASC'),(12,3,'en','title','Engineering'),(13,3,'fr_CA','title',''),(14,3,'en','description',''),(15,3,'fr_CA','description',''),(16,4,'','sortOption','title-ASC'),(17,4,'en','title','Social Sciences'),(18,4,'fr_CA','title',''),(19,4,'en','description',''),(20,4,'fr_CA','description',''),(21,5,'','sortOption','title-ASC'),(22,5,'en','title','Sociology'),(23,5,'fr_CA','title',''),(24,5,'en','description',''),(25,5,'fr_CA','description',''),(26,6,'','sortOption','title-ASC'),(27,6,'en','title','Anthropology'),(28,6,'fr_CA','title',''),(29,6,'en','description',''),(30,6,'fr_CA','description','');
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citation_settings` (
  `citation_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `citation_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`citation_setting_id`),
  UNIQUE KEY `citation_settings_unique` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`),
  CONSTRAINT `citation_settings_citation_id` FOREIGN KEY (`citation_id`) REFERENCES `citations` (`citation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Additional data about citations, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_settings`
--

LOCK TABLES `citation_settings` WRITE;
/*!40000 ALTER TABLE `citation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citations`
--

DROP TABLE IF EXISTS `citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citations` (
  `citation_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `raw_citation` text NOT NULL,
  `seq` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`),
  CONSTRAINT `citations_publication` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A citation made by an associated publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citations`
--

LOCK TABLES `citations` WRITE;
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_payments`
--

DROP TABLE IF EXISTS `completed_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `assoc_id` varchar(16) DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`),
  KEY `completed_payments_context_id` (`context_id`),
  KEY `completed_payments_user_id` (`user_id`),
  CONSTRAINT `completed_payments_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `completed_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of completed (fulfilled) payments, with information about the type of payment and the entity it relates to.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_payments`
--

LOCK TABLES `completed_payments` WRITE;
/*!40000 ALTER TABLE `completed_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entries`
--

DROP TABLE IF EXISTS `controlled_vocab_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint NOT NULL,
  `seq` double DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_controlled_vocab_id` (`controlled_vocab_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`),
  CONSTRAINT `controlled_vocab_entries_controlled_vocab_id_foreign` FOREIGN KEY (`controlled_vocab_id`) REFERENCES `controlled_vocabs` (`controlled_vocab_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COMMENT='The order that a word or phrase used in a controlled vocabulary should appear. For example, the order of keywords in a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (1,10,1),(2,10,2),(3,14,1),(4,14,2),(14,18,1),(15,18,2),(16,18,3),(17,22,1),(18,22,2),(19,26,1),(20,34,1),(21,34,2),(22,34,3),(23,38,1),(24,38,2),(25,38,3),(26,46,1),(27,46,2),(28,50,1),(30,54,1),(31,66,1),(32,66,2);
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `controlled_vocab_entry_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`controlled_vocab_entry_setting_id`),
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `c_v_e_s_entry_id` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COMMENT='More data about a controlled vocabulary entry, including localized properties such as the actual word or phrase.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,1,'en','submissionKeyword','Business & Economics','string'),(2,2,'en','submissionKeyword','Political & International Studies','string'),(3,3,'en','submissionKeyword','Canadian Studies','string'),(4,4,'en','submissionKeyword','Communication & Cultural Studies','string'),(14,14,'en','submissionKeyword','Canadian Studies','string'),(15,15,'en','submissionKeyword','Communication & Cultural Studies','string'),(16,16,'en','submissionKeyword','Political & International Studies','string'),(17,17,'en','submissionKeyword','information literacy','string'),(18,18,'en','submissionKeyword','academic libraries','string'),(19,19,'en','submissionKeyword','Education','string'),(20,20,'en','submissionKeyword','Information','string'),(21,21,'en','submissionKeyword','society','string'),(22,22,'en','submissionKeyword','ICT','string'),(23,23,'en','submissionKeyword','Biography & Memoir','string'),(24,24,'en','submissionKeyword','Environmental Studies','string'),(25,25,'en','submissionKeyword','Political & International Studies','string'),(26,26,'en','submissionKeyword','International Development','string'),(27,27,'en','submissionKeyword','ICT','string'),(28,28,'en','submissionKeyword','Educational Technology','string'),(30,30,'en','submissionKeyword','Psychology','string'),(31,31,'en','submissionKeyword','International Development','string'),(32,32,'en','submissionKeyword','ICT','string');
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocabs`
--

DROP TABLE IF EXISTS `controlled_vocabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint NOT NULL DEFAULT '0',
  `assoc_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3 COMMENT='Every word or phrase used in a controlled vocabulary. Controlled vocabularies are used for submission metadata like keywords and subjects, reviewer interests, and wherever a similar dictionary of words or phrases is required. Each entry corresponds to a word or phrase like "cellular reproduction" and a type like "submissionKeyword".';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (1,'interest',0,0),(5,'submissionAgency',1048588,1),(9,'submissionAgency',1048588,2),(13,'submissionAgency',1048588,3),(17,'submissionAgency',1048588,4),(21,'submissionAgency',1048588,5),(25,'submissionAgency',1048588,6),(29,'submissionAgency',1048588,7),(33,'submissionAgency',1048588,8),(37,'submissionAgency',1048588,9),(41,'submissionAgency',1048588,10),(45,'submissionAgency',1048588,11),(49,'submissionAgency',1048588,12),(53,'submissionAgency',1048588,13),(57,'submissionAgency',1048588,14),(61,'submissionAgency',1048588,15),(65,'submissionAgency',1048588,16),(69,'submissionAgency',1048588,17),(4,'submissionDiscipline',1048588,1),(8,'submissionDiscipline',1048588,2),(12,'submissionDiscipline',1048588,3),(16,'submissionDiscipline',1048588,4),(20,'submissionDiscipline',1048588,5),(24,'submissionDiscipline',1048588,6),(28,'submissionDiscipline',1048588,7),(32,'submissionDiscipline',1048588,8),(36,'submissionDiscipline',1048588,9),(40,'submissionDiscipline',1048588,10),(44,'submissionDiscipline',1048588,11),(48,'submissionDiscipline',1048588,12),(52,'submissionDiscipline',1048588,13),(56,'submissionDiscipline',1048588,14),(60,'submissionDiscipline',1048588,15),(64,'submissionDiscipline',1048588,16),(68,'submissionDiscipline',1048588,17),(2,'submissionKeyword',1048588,1),(6,'submissionKeyword',1048588,2),(10,'submissionKeyword',1048588,3),(14,'submissionKeyword',1048588,4),(18,'submissionKeyword',1048588,5),(22,'submissionKeyword',1048588,6),(26,'submissionKeyword',1048588,7),(30,'submissionKeyword',1048588,8),(34,'submissionKeyword',1048588,9),(38,'submissionKeyword',1048588,10),(42,'submissionKeyword',1048588,11),(46,'submissionKeyword',1048588,12),(50,'submissionKeyword',1048588,13),(54,'submissionKeyword',1048588,14),(58,'submissionKeyword',1048588,15),(62,'submissionKeyword',1048588,16),(66,'submissionKeyword',1048588,17),(3,'submissionSubject',1048588,1),(7,'submissionSubject',1048588,2),(11,'submissionSubject',1048588,3),(15,'submissionSubject',1048588,4),(19,'submissionSubject',1048588,5),(23,'submissionSubject',1048588,6),(27,'submissionSubject',1048588,7),(31,'submissionSubject',1048588,8),(35,'submissionSubject',1048588,9),(39,'submissionSubject',1048588,10),(43,'submissionSubject',1048588,11),(47,'submissionSubject',1048588,12),(51,'submissionSubject',1048588,13),(55,'submissionSubject',1048588,14),(59,'submissionSubject',1048588,15),(63,'submissionSubject',1048588,16),(67,'submissionSubject',1048588,17);
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

DROP TABLE IF EXISTS `data_object_tombstone_oai_set_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_oai_set_objects_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='Relationships between tombstones and other data that can be collected in OAI sets, e.g. sections.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_oai_set_objects`
--

LOCK TABLES `data_object_tombstone_oai_set_objects` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_settings`
--

DROP TABLE IF EXISTS `data_object_tombstone_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`tombstone_setting_id`),
  UNIQUE KEY `data_object_tombstone_settings_unique` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_settings_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about data object tombstones, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_settings`
--

LOCK TABLES `data_object_tombstone_settings` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstones`
--

DROP TABLE IF EXISTS `data_object_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Entries for published data that has been removed. Usually used in the OAI endpoint.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstones`
--

LOCK TABLES `data_object_tombstones` WRITE;
/*!40000 ALTER TABLE `data_object_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doi_settings`
--

DROP TABLE IF EXISTS `doi_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doi_settings` (
  `doi_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `doi_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`doi_setting_id`),
  UNIQUE KEY `doi_settings_unique` (`doi_id`,`locale`,`setting_name`),
  KEY `doi_settings_doi_id` (`doi_id`),
  CONSTRAINT `doi_settings_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about DOIs, including the registration agency.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doi_settings`
--

LOCK TABLES `doi_settings` WRITE;
/*!40000 ALTER TABLE `doi_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `doi_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dois`
--

DROP TABLE IF EXISTS `dois`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dois` (
  `doi_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `doi` varchar(255) NOT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`doi_id`),
  KEY `dois_context_id` (`context_id`),
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Stores all DOIs used in the system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dois`
--

LOCK TABLES `dois` WRITE;
/*!40000 ALTER TABLE `dois` DISABLE KEYS */;
/*!40000 ALTER TABLE `dois` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_decisions`
--

DROP TABLE IF EXISTS `edit_decisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `review_round_id` bigint DEFAULT NULL,
  `stage_id` bigint DEFAULT NULL,
  `round` smallint DEFAULT NULL,
  `editor_id` bigint NOT NULL,
  `decision` smallint NOT NULL COMMENT 'A numeric constant indicating the decision that was taken. Possible values are listed in the Decision class.',
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`),
  KEY `edit_decisions_review_round_id` (`review_round_id`),
  CONSTRAINT `edit_decisions_editor_id` FOREIGN KEY (`editor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COMMENT='Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,1,NULL,1,NULL,3,18,'2024-12-20 05:27:12'),(2,1,1,3,1,3,2,'2024-12-20 05:27:21'),(3,2,NULL,1,NULL,3,18,'2024-12-20 05:29:23'),(4,4,NULL,1,NULL,3,1,'2024-12-20 05:30:58'),(5,4,3,2,1,3,3,'2024-12-20 05:31:08'),(6,4,4,3,1,3,2,'2024-12-20 05:31:18'),(7,4,NULL,4,NULL,3,7,'2024-12-20 05:31:29'),(8,5,NULL,1,NULL,3,1,'2024-12-20 05:32:37'),(9,5,5,2,1,3,3,'2024-12-20 05:32:48'),(10,5,6,3,1,3,2,'2024-12-20 05:32:57'),(11,5,NULL,4,NULL,3,7,'2024-12-20 05:33:09'),(12,6,NULL,1,NULL,3,1,'2024-12-20 05:34:28'),(13,6,7,2,1,6,23,'2024-12-20 05:34:48'),(14,7,NULL,1,NULL,3,18,'2024-12-20 05:35:47'),(15,7,8,3,1,3,2,'2024-12-20 05:35:58'),(16,9,NULL,1,NULL,3,1,'2024-12-20 05:37:05'),(17,11,NULL,1,NULL,3,1,'2024-12-20 05:38:48'),(18,11,10,2,1,3,3,'2024-12-20 05:38:58'),(19,11,11,3,1,3,2,'2024-12-20 05:39:36'),(20,12,NULL,1,NULL,3,1,'2024-12-20 05:40:17'),(21,13,NULL,1,NULL,3,1,'2024-12-20 05:41:17'),(22,13,13,2,1,3,3,'2024-12-20 05:41:27'),(23,13,14,3,1,3,2,'2024-12-20 05:42:10'),(24,14,NULL,1,NULL,3,1,'2024-12-20 05:43:03'),(25,14,15,2,1,3,3,'2024-12-20 05:43:15'),(26,14,16,3,1,3,2,'2024-12-20 05:43:26'),(27,14,NULL,4,NULL,3,7,'2024-12-20 05:43:39'),(28,15,NULL,1,NULL,3,18,'2024-12-20 05:45:05'),(29,16,NULL,1,NULL,3,18,'2024-12-20 05:45:58'),(30,17,NULL,1,NULL,3,1,'2024-12-20 05:47:23');
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `sender_id` bigint DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`log_id`),
  KEY `email_log_sender_id` (`sender_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `email_log_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb3 COMMENT='A record of email messages that are sent in relation to an associated entity, such as a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,NULL,'2024-12-20 05:27:04',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/1\">The ABCs of Human Survival: A Paradigm for Global Citizenship</a><br />Arthur Clark</p><p><b>Abstract</b></p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(2,1048585,1,NULL,'2024-12-20 05:27:04',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Arthur Clark,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username aclark.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(3,1048585,1,3,'2024-12-20 05:27:12',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been sent for review','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that an editor has reviewed your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(4,1048585,1,3,'2024-12-20 05:27:16',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Manuscript Review Request','<p>Dear Gonzalo Favio,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">The ABCs of Human Survival: A Paradigm for Global Citizenship</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=1\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(5,1048585,1,3,'2024-12-20 05:27:21',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(6,1048585,2,NULL,'2024-12-20 05:29:07',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(7,1048585,2,NULL,'2024-12-20 05:29:07',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(8,1048585,2,NULL,'2024-12-20 05:29:07',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(9,1048585,2,NULL,'2024-12-20 05:29:07',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Alvin Finkel,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The West and Beyond: New Perspectives on an Imagined Region, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username afinkel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/2\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(10,1048585,2,NULL,'2024-12-20 05:29:07',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Sarah Carter\" <scarter@mailinator.com>, \"Peter Fortna\" <pfortna@mailinator.com>, \"Gerald Friesen\" <gfriesen@mailinator.com>, \"Lyle Dick\" <ldick@mailinator.com>, \"Winona Wheeler\" <wwheeler@mailinator.com>, \"Matt Dyce\" <mdyce@mailinator.com>, \"James Opp\" <jopp@mailinator.com>','','','Submission confirmation','<p>Dear Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Alvin Finkel, provided the following details:</p><p>The West and Beyond: New Perspectives on an Imagined Region<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(11,1048585,2,3,'2024-12-20 05:29:23',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Your submission has been sent for review','<p>Dear Alvin Finkel,</p><p>I am pleased to inform you that an editor has reviewed your submission, The West and Beyond: New Perspectives on an Imagined Region, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(12,1048585,2,3,'2024-12-20 05:29:31',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>','','','Manuscript Review Request','<p>Dear Al Zacharia,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=2\">The West and Beyond: New Perspectives on an Imagined Region</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=2\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(13,1048585,2,3,'2024-12-20 05:29:35',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Manuscript Review Request','<p>Dear Gonzalo Favio,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=2\">The West and Beyond: New Perspectives on an Imagined Region</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=2\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(14,1048585,3,NULL,'2024-12-20 05:30:15',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(15,1048585,3,NULL,'2024-12-20 05:30:15',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(16,1048585,3,NULL,'2024-12-20 05:30:16',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(17,1048585,3,NULL,'2024-12-20 05:30:16',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bob Barnetson\" <bbarnetson@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Bob Barnetson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Political Economy of Workplace Injury in Canada, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username bbarnetson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(18,1048585,4,NULL,'2024-12-20 05:30:50',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a><br />Bart Beaty, Toby Miller, Ira Wagman, Will Straw</p><p><b>Abstract</b></p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(19,1048585,4,NULL,'2024-12-20 05:30:50',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Bart Beaty,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username bbeaty.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(20,1048585,4,NULL,'2024-12-20 05:30:50',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>','','','Submission confirmation','<p>Dear Toby Miller, Ira Wagman, Will Straw,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Bart Beaty, provided the following details:</p><p>How Canadians Communicate: Contexts of Canadian Popular Culture<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(21,1048585,4,3,'2024-12-20 05:30:58',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(22,1048585,4,3,'2024-12-20 05:31:04',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Manuscript Review Request','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=4\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(23,1048585,4,3,'2024-12-20 05:31:08',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(24,1048585,4,3,'2024-12-20 05:31:13',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>','','','Manuscript Review Request','<p>Dear Al Zacharia,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=4\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(25,1048585,4,3,'2024-12-20 05:31:18',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(26,1048585,4,3,'2024-12-20 05:31:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Bart Beaty,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(27,1048585,5,NULL,'2024-12-20 05:32:27',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(28,1048585,5,NULL,'2024-12-20 05:32:27',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(29,1048585,5,NULL,'2024-12-20 05:32:27',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(30,1048585,5,NULL,'2024-12-20 05:32:27',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Chantal Allan,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Bomb Canada and Other Unkind Remarks in the American Media, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username callan.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(31,1048585,5,3,'2024-12-20 05:32:37',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(32,1048585,5,3,'2024-12-20 05:32:43',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Manuscript Review Request','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=5\">Bomb Canada and Other Unkind Remarks in the American Media</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=5\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(33,1048585,5,3,'2024-12-20 05:32:48',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(34,1048585,5,3,'2024-12-20 05:32:53',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Manuscript Review Request','<p>Dear Gonzalo Favio,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=5\">Bomb Canada and Other Unkind Remarks in the American Media</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=5\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(35,1048585,5,3,'2024-12-20 05:32:58',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Bomb Canada and Other Unkind Remarks in the American Media, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(36,1048585,5,3,'2024-12-20 05:33:09',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Chantal Allan,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, Bomb Canada and Other Unkind Remarks in the American Media, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(37,1048585,6,NULL,'2024-12-20 05:34:19',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/6\">The Information Literacy User’s Guide</a><br />Deborah Bernnard, Greg Bobish, Daryl Bullis, Jenna Hecker</p><p><b>Abstract</b></p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(38,1048585,6,NULL,'2024-12-20 05:34:19',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Deborah Bernnard,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Information Literacy User’s Guide, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dbernnard.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(39,1048585,6,NULL,'2024-12-20 05:34:19',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Greg Bobish\" <gbobish@mailinator.com>, \"Daryl Bullis\" <dbullis@mailinator.com>, \"Jenna Hecker\" <jhecker@mailinator.com>','','','Submission confirmation','<p>Dear Greg Bobish, Daryl Bullis, Jenna Hecker,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Deborah Bernnard, provided the following details:</p><p>The Information Literacy User’s Guide<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(40,1048585,6,3,'2024-12-20 05:34:28',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Deborah Bernnard,</p><p>I am pleased to inform you that an editor has reviewed your submission, The Information Literacy User’s Guide, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(41,1048585,7,NULL,'2024-12-20 05:35:37',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/7\">Accessible Elements: Teaching Science Online and at a Distance</a><br />Dietmar Kennepohl, Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer</p><p><b>Abstract</b></p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(42,1048585,7,NULL,'2024-12-20 05:35:37',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Dietmar Kennepohl,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Accessible Elements: Teaching Science Online and at a Distance, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username dkennepohl.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(43,1048585,7,NULL,'2024-12-20 05:35:38',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Terry Anderson\" <tanderson@mailinator.com>, \"Paul Gorsky\" <pgorsky@mailinator.com>, \"Gale Parchoma\" <gparchoma@mailinator.com>, \"Stuart Palmer\" <spalmer@mailinator.com>','','','Submission confirmation','<p>Dear Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Dietmar Kennepohl, provided the following details:</p><p>Accessible Elements: Teaching Science Online and at a Distance<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(44,1048585,7,3,'2024-12-20 05:35:47',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been sent for review','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that an editor has reviewed your submission, Accessible Elements: Teaching Science Online and at a Distance, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(45,1048585,7,3,'2024-12-20 05:35:53',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Manuscript Review Request','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">Accessible Elements: Teaching Science Online and at a Distance</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=7\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(46,1048585,7,3,'2024-12-20 05:35:58',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Accessible Elements: Teaching Science Online and at a Distance, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(47,1048585,8,NULL,'2024-12-20 05:36:14',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(48,1048585,8,NULL,'2024-12-20 05:36:15',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(49,1048585,8,NULL,'2024-12-20 05:36:15',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(50,1048585,8,NULL,'2024-12-20 05:36:15',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(51,1048585,9,NULL,'2024-12-20 05:36:55',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/9\">Enabling Openness: The future of the information society in Latin America and the Caribbean</a><br />Fernando Perini, Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich</p><p><b>Abstract</b></p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(52,1048585,9,NULL,'2024-12-20 05:36:55',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Fernando Perini,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username fperini.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(53,1048585,9,NULL,'2024-12-20 05:36:55',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Robin Mansell\" <rmansell@mailinator.com>, \"Hernan Galperin\" <hgalperin@mailinator.com>, \"Pablo Bello\" <pbello@mailinator.com>, \"Eleonora Rabinovich\" <erabinovich@mailinator.com>','','','Submission confirmation','<p>Dear Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Fernando Perini, provided the following details:</p><p>Enabling Openness: The future of the information society in Latin America and the Caribbean<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(54,1048585,9,3,'2024-12-20 05:37:05',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Fernando Perini,</p><p>I am pleased to inform you that an editor has reviewed your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(55,1048585,10,NULL,'2024-12-20 05:38:19',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(56,1048585,10,NULL,'2024-12-20 05:38:19',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(57,1048585,10,NULL,'2024-12-20 05:38:19',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(58,1048585,10,NULL,'2024-12-20 05:38:19',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jennifer Brower\" <jbrower@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Jennifer Brower,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Lost Tracks: Buffalo National Park, 1909-1939, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jbrower.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/10\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(59,1048585,11,NULL,'2024-12-20 05:38:40',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(60,1048585,11,NULL,'2024-12-20 05:38:40',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(61,1048585,11,NULL,'2024-12-20 05:38:40',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(62,1048585,11,NULL,'2024-12-20 05:38:40',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Jonathan Locke Hart,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Dreamwork, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username jlockehart.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(63,1048585,11,3,'2024-12-20 05:38:48',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(64,1048585,11,3,'2024-12-20 05:38:54',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Manuscript Review Request','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=11\">Dreamwork</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=11\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(65,1048585,11,3,'2024-12-20 05:38:58',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(66,1048585,11,3,'2024-12-20 05:39:03',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Manuscript Review Request','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=11\">Dreamwork</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=11\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(67,1048585,11,3,'2024-12-20 05:39:06',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Manuscript Review Request','<p>Dear Gonzalo Favio,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=11\">Dreamwork</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=11\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(68,1048585,11,10,'2024-12-20 05:39:11',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #11 Locke Hart — Dreamwork','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/11\">#11 Locke Hart — Dreamwork</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-01-17</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/11\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.'),(69,1048585,11,12,'2024-12-20 05:39:21',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Gonzalo Favio accepted review assignment for #11 Locke Hart — Dreamwork','<p>Dear Ramiro Vaca,</p><p>Gonzalo Favio has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/11\">#11 Locke Hart — Dreamwork</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-01-17</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/11\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.'),(70,1048585,11,3,'2024-12-20 05:39:36',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Dreamwork, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(71,1048585,11,3,'2024-12-20 05:39:36',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Thank you for your review','<p>Dear Adela Gallego,</p>\n<p>Thank you for completing your review of the submission, Dreamwork, for Public Knowledge Press. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have chosen to accept this submission without revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Public Knowledge Press, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),(72,1048585,11,3,'2024-12-20 05:39:36',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Thank you for your review','<p>Dear Gonzalo Favio,</p>\n<p>Thank you for completing your review of the submission, Dreamwork, for Public Knowledge Press. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have chosen to accept this submission without revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Public Knowledge Press, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),(73,1048585,12,NULL,'2024-12-20 05:40:08',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(74,1048585,12,NULL,'2024-12-20 05:40:08',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(75,1048585,12,NULL,'2024-12-20 05:40:08',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(76,1048585,12,NULL,'2024-12-20 05:40:08',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Laurent Elder,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Connecting ICTs to Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lelder.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/12\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(77,1048585,12,NULL,'2024-12-20 05:40:08',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank Tulus\" <ftulus@mailinator.com>, \"Raymond Hyma\" <rhyma@mailinator.com>, \"John Valk\" <jvalk@mailinator.com>, \"Khaled Fourati\" <fkourati@mailinator.com>, \"Jeremy de Beer\" <jdebeer@mailinator.com>, \"Sara Bannerman\" <sbannerman@mailinator.com>','','','Submission confirmation','<p>Dear Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Laurent Elder, provided the following details:</p><p>Connecting ICTs to Development<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(78,1048585,12,3,'2024-12-20 05:40:17',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Laurent Elder,</p><p>I am pleased to inform you that an editor has reviewed your submission, Connecting ICTs to Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(79,1048585,12,3,'2024-12-20 05:40:24',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Manuscript Review Request','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">Connecting ICTs to Development</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(80,1048585,12,3,'2024-12-20 05:40:27',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Manuscript Review Request','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">Connecting ICTs to Development</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(81,1048585,12,3,'2024-12-20 05:40:30',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Manuscript Review Request','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">Connecting ICTs to Development</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=12\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(82,1048585,12,8,'2024-12-20 05:40:36',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Paul Hudson accepted review assignment for #12 Elder et al. — Connecting ICTs to Development','<p>Dear Ramiro Vaca,</p><p>Paul Hudson has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/12\">#12 Elder et al. — Connecting ICTs to Development</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-01-17</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/12\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.'),(83,1048585,13,NULL,'2024-12-20 05:41:07',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(84,1048585,13,NULL,'2024-12-20 05:41:07',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(85,1048585,13,NULL,'2024-12-20 05:41:07',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(86,1048585,13,NULL,'2024-12-20 05:41:07',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Mohamed Ally,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Mobile Learning: Transforming the Delivery of Education and Training, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username mally.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(87,1048585,13,NULL,'2024-12-20 05:41:07',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Traxler\" <jtraxler@mailinator.com>, \"Marguerite Koole\" <mkoole@mailinator.com>, \"Torstein Rekkedal\" <trekkedal@mailinator.com>','','','Submission confirmation','<p>Dear John Traxler, Marguerite Koole, Torstein Rekkedal,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Mohamed Ally, provided the following details:</p><p>Mobile Learning: Transforming the Delivery of Education and Training<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(88,1048585,13,3,'2024-12-20 05:41:17',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(89,1048585,13,3,'2024-12-20 05:41:23',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Manuscript Review Request','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">Mobile Learning: Transforming the Delivery of Education and Training</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(90,1048585,13,3,'2024-12-20 05:41:27',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(91,1048585,13,3,'2024-12-20 05:41:33',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Manuscript Review Request','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">Mobile Learning: Transforming the Delivery of Education and Training</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(92,1048585,13,3,'2024-12-20 05:41:36',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>','','','Manuscript Review Request','<p>Dear Al Zacharia,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">Mobile Learning: Transforming the Delivery of Education and Training</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(93,1048585,13,3,'2024-12-20 05:41:39',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Manuscript Review Request','<p>Dear Gonzalo Favio,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">Mobile Learning: Transforming the Delivery of Education and Training</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(94,1048585,13,10,'2024-12-20 05:41:45',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-01-17</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.'),(95,1048585,13,12,'2024-12-20 05:41:54',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Gonzalo Favio accepted review assignment for #13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>Gonzalo Favio has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">#13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-01-17</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.'),(96,1048585,13,3,'2024-12-20 05:42:10',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Mobile Learning: Transforming the Delivery of Education and Training, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(97,1048585,13,3,'2024-12-20 05:42:10',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Thank you for your review','<p>Dear Adela Gallego,</p>\n<p>Thank you for completing your review of the submission, Mobile Learning: Transforming the Delivery of Education and Training, for Public Knowledge Press. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have chosen to accept this submission without revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Public Knowledge Press, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),(98,1048585,13,3,'2024-12-20 05:42:11',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Thank you for your review','<p>Dear Gonzalo Favio,</p>\n<p>Thank you for completing your review of the submission, Mobile Learning: Transforming the Delivery of Education and Training, for Public Knowledge Press. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have chosen to accept this submission without revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Public Knowledge Press, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),(99,1048585,14,NULL,'2024-12-20 05:42:52',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a><br />Michael Dawson, Brian Dupuis, Michael Wilson</p><p><b>Abstract</b></p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(100,1048585,14,NULL,'2024-12-20 05:42:52',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Michael Dawson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username mdawson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(101,1048585,14,NULL,'2024-12-20 05:42:52',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>','','','Submission confirmation','<p>Dear Brian Dupuis, Michael Wilson,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Michael Dawson, provided the following details:</p><p>From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(102,1048585,14,3,'2024-12-20 05:43:03',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(103,1048585,14,3,'2024-12-20 05:43:10',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Manuscript Review Request','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=14\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(104,1048585,14,3,'2024-12-20 05:43:15',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(105,1048585,14,3,'2024-12-20 05:43:22',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>','','','Manuscript Review Request','<p>Dear Al Zacharia,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=14\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(106,1048585,14,3,'2024-12-20 05:43:27',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(107,1048585,14,3,'2024-12-20 05:43:39',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Michael Dawson,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(108,1048585,15,NULL,'2024-12-20 05:44:56',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(109,1048585,15,NULL,'2024-12-20 05:44:56',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(110,1048585,15,NULL,'2024-12-20 05:44:56',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(111,1048585,15,NULL,'2024-12-20 05:44:56',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Max Foran,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username mforan.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(112,1048585,15,3,'2024-12-20 05:45:05',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Max Foran,</p><p>I am pleased to inform you that an editor has reviewed your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(113,1048585,16,NULL,'2024-12-20 05:45:48',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(114,1048585,16,NULL,'2024-12-20 05:45:48',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(115,1048585,16,NULL,'2024-12-20 05:45:48',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(116,1048585,16,NULL,'2024-12-20 05:45:48',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Michael Power,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, A Designer\'s Log: Case Studies in Instructional Design, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username mpower.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/16\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(117,1048585,16,3,'2024-12-20 05:45:58',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Power,</p><p>I am pleased to inform you that an editor has reviewed your submission, A Designer\'s Log: Case Studies in Instructional Design, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(118,1048585,16,3,'2024-12-20 05:46:05',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Manuscript Review Request','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=16\">A Designer\'s Log: Case Studies in Instructional Design</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=16\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(119,1048585,16,3,'2024-12-20 05:46:08',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>','','','Manuscript Review Request','<p>Dear Al Zacharia,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=16\">A Designer\'s Log: Case Studies in Instructional Design</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=16\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(120,1048585,16,3,'2024-12-20 05:46:11',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Manuscript Review Request','<p>Dear Gonzalo Favio,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=16\">A Designer\'s Log: Case Studies in Instructional Design</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=16\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(121,1048585,16,10,'2024-12-20 05:46:17',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #16 Power — A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/16\">#16 Power — A Designer\'s Log: Case Studies in Instructional Design</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2025-01-17</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/16\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.'),(122,1048585,17,NULL,'2024-12-20 05:47:11',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(123,1048585,17,NULL,'2024-12-20 05:47:11',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(124,1048585,17,NULL,'2024-12-20 05:47:12',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge/en\">Public Knowledge Press</a>.</p>'),(125,1048585,17,NULL,'2024-12-20 05:47:12',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Matthew Smith,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Open Development: Networked Innovations in International Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username msmith.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(126,1048585,17,NULL,'2024-12-20 05:47:12',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Yochai Benkler\" <ybenkler@mailinator.com>, \"Katherine Reilly\" <kreilly@mailinator.com>, \"Melissa Loudon\" <mloudon@mailinator.com>, \"Ulrike Rivett\" <urivett@mailinator.com>, \"Mark Graham\" <mgraham@mailinator.com>, \"Håvard Haarstad\" <hhaarstad@mailinator.com>, \"Marshall Smith\" <masmith@mailinator.com>','','','Submission confirmation','<p>Dear Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Matthew Smith, provided the following details:</p><p>Open Development: Networked Innovations in International Development<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(127,1048585,17,3,'2024-12-20 05:47:23',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Matthew Smith,</p><p>I am pleased to inform you that an editor has reviewed your submission, Open Development: Networked Innovations in International Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(128,1048585,17,3,'2024-12-20 05:47:31',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Manuscript Review Request','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=17\">Open Development: Networked Innovations in International Development</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=17\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(129,1048585,17,3,'2024-12-20 05:47:35',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Manuscript Review Request','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2025-01-17. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=17\">Open Development: Networked Innovations in International Development</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/en/reviewer/submission?submissionId=17\">accept or decline</a> the review by <strong>2025-01-17</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>');
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log_users` (
  `email_log_user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_log_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`email_log_user_id`),
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`),
  KEY `email_log_users_email_log_id` (`email_log_id`),
  KEY `email_log_users_user_id` (`user_id`),
  CONSTRAINT `email_log_users_email_log_id_foreign` FOREIGN KEY (`email_log_id`) REFERENCES `email_log` (`log_id`) ON DELETE CASCADE,
  CONSTRAINT `email_log_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3 COMMENT='A record of users associated with an email log entry.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
INSERT INTO `email_log_users` VALUES (1,1,4),(2,2,19),(3,3,19),(4,4,12),(5,5,19),(6,6,1),(7,7,2),(8,8,3),(9,9,20),(10,11,20),(11,12,11),(12,13,12),(13,14,1),(14,15,2),(15,16,3),(16,17,21),(17,18,3),(18,19,22),(19,21,22),(20,22,9),(21,23,22),(22,24,11),(23,25,22),(24,26,22),(25,27,1),(26,28,2),(27,29,3),(28,30,23),(29,31,23),(30,32,8),(31,33,23),(32,34,12),(33,35,23),(34,36,23),(35,37,4),(36,38,24),(37,40,24),(38,41,3),(39,42,25),(40,44,25),(41,45,10),(42,46,25),(43,47,3),(44,48,1),(45,49,2),(46,50,3),(47,51,4),(48,52,26),(49,54,26),(50,55,1),(51,56,2),(52,57,3),(53,58,27),(54,59,1),(55,60,2),(56,61,3),(57,62,28),(58,63,28),(59,64,9),(60,65,28),(61,66,10),(62,67,12),(63,68,2),(64,69,2),(65,70,28),(66,71,10),(67,72,12),(68,73,1),(69,74,2),(70,75,3),(71,76,29),(72,78,29),(73,79,7),(74,80,8),(75,81,9),(76,82,2),(77,83,1),(78,84,2),(79,85,3),(80,86,30),(81,88,30),(82,89,8),(83,90,30),(84,91,10),(85,92,11),(86,93,12),(87,94,2),(88,95,2),(89,96,30),(90,97,10),(91,98,12),(92,99,3),(93,100,31),(94,102,31),(95,103,7),(96,104,31),(97,105,11),(98,106,31),(99,107,31),(100,108,1),(101,109,2),(102,110,3),(103,111,32),(104,112,32),(105,113,1),(106,114,2),(107,115,3),(108,116,33),(109,117,33),(110,118,10),(111,119,11),(112,120,12),(113,121,2),(114,122,1),(115,123,2),(116,124,3),(117,125,34),(118,127,34),(119,128,7),(120,129,8);
/*!40000 ALTER TABLE `email_log_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `email_id` bigint NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint NOT NULL,
  `alternate_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`),
  KEY `email_templates_context_id` (`context_id`),
  KEY `email_templates_alternate_to` (`alternate_to`),
  CONSTRAINT `email_templates_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='Custom email templates created by each context, and overrides of the default templates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,'COPYEDIT_REQUEST',1,'DISCUSSION_NOTIFICATION_COPYEDITING'),(2,'EDITOR_ASSIGN_SUBMISSION',1,'DISCUSSION_NOTIFICATION_SUBMISSION'),(3,'EDITOR_ASSIGN_REVIEW',1,'DISCUSSION_NOTIFICATION_REVIEW'),(4,'EDITOR_ASSIGN_PRODUCTION',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),(5,'LAYOUT_REQUEST',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),(6,'LAYOUT_COMPLETE',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),(7,'INDEX_REQUEST',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),(8,'INDEX_COMPLETE',1,'DISCUSSION_NOTIFICATION_PRODUCTION');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_default_data` (
  `email_templates_default_data_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(28) NOT NULL DEFAULT 'en',
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY (`email_templates_default_data_id`),
  UNIQUE KEY `email_templates_default_data_unique` (`email_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb3 COMMENT='Default email templates created for every installed locale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES (1,'PASSWORD_RESET_CONFIRM','en','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),(3,'USER_REGISTER','en','User Created','Press Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$pressName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),(5,'USER_VALIDATE_CONTEXT','en','Validate Email (Press Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$pressName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$pressSignature}'),(7,'USER_VALIDATE_SITE','en','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),(9,'REVIEWER_REGISTER','en','Reviewer Register','Registration as Reviewer with {$pressName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$pressName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),(11,'SUBMISSION_ACK','en','Submission Confirmation','Thank you for your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$pressName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$pressName} as a venue for your work.</p>{$pressSignature}'),(13,'SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission confirmation','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a submission to {$pressName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering {$pressName} as a venue for your work.</p><p>Kind regards,</p>{$pressSignature}'),(15,'EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$pressName}, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$pressSignature}'),(17,'REVIEW_CANCEL','en','Reviewer Unassign','Request for Review Cancelled','{$recipientName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.'),(19,'REVIEW_REINSTATE','en','Reviewer Reinstate','Can you still review something for {$pressName}?','<p>Dear {$recipientName},</p><p>We recently cancelled our request for you to review a submission, {$submissionTitle}, for {$pressName}. We\'ve reversed that decision and we hope that you are still able to conduct the review.</p><p>If you are able to assist with this submission\'s review, you can <a href=\"{$reviewAssignmentUrl}\">login to the press</a> to view the submission, upload review files, and submit your review request.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),(21,'REVIEW_RESEND_REQUEST','en','Resend Review Request to Reviewer','Requesting your review again for {$pressName}','<p>Dear {$recipientName},</p><p>Recently, you declined our request to review a submission, {$submissionTitle}, for {$pressName}. I\'m writing to see if you are able to conduct the review after all.</p><p>We would be grateful if you\'re able to perform this review, but we understand if that is not possible at this time. Either way, please <a href=\"{$reviewAssignmentUrl}\">accept or decline the request</a> by {$responseDueDate}, so that we can find an alternate reviewer.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),(23,'REVIEW_REQUEST','en','Review Request','Manuscript Review Request','<p>Dear {$recipientName},</p><p>I believe that you would serve as an excellent reviewer for a submission  to {$pressName}. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>You may contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),(25,'REVIEW_REQUEST_SUBSEQUENT','en','Review Request Subsequent','Request to review a revised submission','<p>Dear {$recipientName},</p><p>Thank you for your review of <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. The authors have considered the reviewers\' feedback and have now submitted a revised version of their work. I\'m writing to ask if you would conduct a second round of peer review for this submission.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href=\"{$reviewAssignmentUrl}\">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),(27,'REVIEW_RESPONSE_OVERDUE_AUTO','en','Review Response Overdue (Automated)','Manuscript Review Request','Dear {$recipientName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$pressSignature}<br />\n'),(29,'REVIEW_CONFIRM','en','Review Confirm','Review accepted: {$reviewerName} accepted review assignment for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} has accepted the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}</p><p><b>Review Due:</b> {$reviewDueDate}</p><p>Login to <a href=\"{$submissionUrl}\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"{$pressUrl}\">{$pressName}</a>.'),(31,'REVIEW_DECLINE','en','Review Decline','Unable to Review','Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}'),(33,'REVIEW_ACK','en','Review Acknowledgement','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),(35,'REVIEW_REMIND','en','Review Reminder','A reminder to please complete your review','<p>Dear {$recipientName},</p><p>Just a gentle reminder of our request for your review of the submission, \"{$submissionTitle},\" for {$pressName}. We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>You can <a href=\"{$reviewAssignmentUrl}\">login to the press</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$signature}'),(37,'REVIEW_REMIND_AUTO','en','Review Reminder (Automated)','A reminder to please complete your review','<p>Dear {$recipientName}:</p><p>This email is an automated reminder from {$pressName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>Please <a href=\"{$reviewAssignmentUrl}\">login to the press</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$pressSignature}'),(39,'REVIEW_COMPLETE','en','Review Completed','Review complete: {$reviewerName} recommends {$reviewRecommendation} for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} completed the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Recommendation:</b> {$reviewRecommendation}<br /><b>Type:</b> {$reviewMethod}</p><p>Login to <a href=\"{$submissionUrl}\">view all files and comments</a> provided by this reviewer.</p>'),(41,'REVIEW_EDIT','en','Review Edited','Your review assignment has been changed for {$pressName}','<p>Dear {$recipientName},</p><p>An editor has made changes to your review assignment for {$pressName}. Please review the details below and let us know if you have any questions.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}<br /><b>Accept or Decline By:</b> {$responseDueDate}<br /><b>Submit Review By:</b> {$reviewDueDate}</p><p>You can login to <a href=\"{$reviewAssignmentUrl}\">complete this review</a> at any time.</p>'),(43,'EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has been accepted to {$pressName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),(45,'EDITOR_DECISION_SEND_TO_INTERNAL','en','Sent to Internal Review','Your submission has been sent for internal review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),(47,'EDITOR_DECISION_SEND_TO_EXTERNAL','en','Sent to Review','Your submission has been sent for review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),(49,'EDITOR_DECISION_SEND_TO_PRODUCTION','en','Sent to Production','Next steps for publishing your submission','<p>Dear {$recipientName},</p><p>I am writing from {$pressName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),(51,'EDITOR_DECISION_REVISIONS','en','Revisions Requested','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(53,'EDITOR_DECISION_RESUBMIT','en','Resubmit for Review','Your submission has been reviewed - please revise and resubmit','<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(55,'EDITOR_DECISION_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$pressName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(57,'EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined (Pre-Review)','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$pressName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),(59,'EDITOR_RECOMMENDATION','en','Recommendation Made','Editor Recommendation','<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is: {$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>'),(61,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$pressName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),(63,'EDITOR_DECISION_NOTIFY_REVIEWERS','en','Notify Reviewers of Decision','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),(65,'EDITOR_DECISION_NEW_ROUND','en','New Review Round Initiated','Your submission has been sent for another round of review','<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(67,'EDITOR_DECISION_REVERT_DECLINE','en','Reinstate Declined Submission','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(69,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(71,'EDITOR_DECISION_SKIP_REVIEW','en','Submission Accepted (Without Review)','Your submission has been sent for copyediting','<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p>\n<p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(73,'EDITOR_DECISION_BACK_FROM_PRODUCTION','en','Submission Sent Back to Copyediting','Your submission has been sent back to copyediting','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the copyediting stage, where it will undergo further copyediting and formatting to prepare it for publication.</p><p>Occasionally, a submission is sent to the production stage before it is ready for the final galleys to be prepared for publication. Your submission is still forthcoming. I apologize for any confusion.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We will contact you if we need any further assistance.</p><p>Kind regards,</p><p>{$signature}</p>'),(75,'EDITOR_DECISION_BACK_FROM_COPYEDITING','en','Submission Sent Back from Copyediting','Your submission has been sent back to review','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the review stage. It will undergo further review before it can be accepted for publication.</p><p>Occasionally, a decision to accept a submission will be recorded accidentally in our system and we must send it back to review. I apologize for any confusion this has caused. We will work to complete any further review quickly so that you have a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),(77,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','en','Review Round Cancelled','A review round for your submission has been cancelled','<p>Dear {$recipientName},</p><p>We recently opened a new review round for your submission, {$submissionTitle}. We are closing this review round now.</p><p>Occasionally, a decision to open a round of review will be recorded accidentally in our system and we must cancel this review round. I apologize for any confusion this may have caused.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),(79,'REVISED_VERSION_NOTIFY','en','Revised Version Notification','Revised Version Uploaded','<p>Dear {$recipientName},</p><p>The author has uploaded revisions for the submission, <b>{$authorsShort} — {$submissionTitle}</b>. <p>As an assigned editor, we ask that you login and <a href=\"{$submissionUrl}\">view the revisions</a> and make a decision to accept, decline or send the submission for further review.</p><br><br>—<br>This is an automated message from <a href=\"{$pressUrl}\">{$pressName}</a>.'),(81,'STATISTICS_REPORT_NOTIFICATION','en','Statistics Report Notification','Editorial activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published book stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$pressSignature}'),(83,'ANNOUNCEMENT','en','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),(85,'DISCUSSION_NOTIFICATION_SUBMISSION','en','Discussion (Submission)','A message regarding {$pressName}','Please enter your message.'),(87,'DISCUSSION_NOTIFICATION_REVIEW','en','Discussion (Review)','A message regarding {$pressName}','Please enter your message.'),(89,'DISCUSSION_NOTIFICATION_COPYEDITING','en','Discussion (Copyediting)','A message regarding {$pressName}','Please enter your message.'),(91,'DISCUSSION_NOTIFICATION_PRODUCTION','en','Discussion (Production)','A message regarding {$pressName}','Please enter your message.'),(93,'COPYEDIT_REQUEST','en','Request Copyedit','Submission {$submissionId} is ready to be copyedited for {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$pressName}</p><p>Please follow these steps to complete this task:</p><ol><li>Click on the Submission URL below.</li><li>Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to {$pressName}.</p><p>Kind regards,</p>{$signature}'),(95,'EDITOR_ASSIGN_SUBMISSION','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$pressName}, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$pressSignature}'),(97,'EDITOR_ASSIGN_REVIEW','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the review stage.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a> and assign qualified reviewers. You can assign a reviewer by clicking \"Add Reviewer\".</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),(99,'EDITOR_ASSIGN_PRODUCTION','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the production stage.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a>. Once production-ready files are available, upload them under the <strong>Publication > Publication Formats</strong> section.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),(101,'LAYOUT_REQUEST','en','Ready for Production','Submission {$submissionId} is ready for production at {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><ol><li>Click on the Submission URL above.</li><li>Download the Production Ready files and use them to create the galleys according to the press\'s standards.</li><li>Upload the galleys to the Publication Formats section of the submission.</li><li>Use the Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.</p><p>Kind regards,</p>{$signature}'),(103,'LAYOUT_COMPLETE','en','Galleys Complete','Galleys Complete','<p>Dear {$recipientName},<p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$pressName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$senderName}</p>'),(105,'INDEX_REQUEST','en','Index Requested','Request Index','{$recipientName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$pressName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$signature}'),(107,'INDEX_COMPLETE','en','Index Completed','Index Galleys Complete','{$recipientName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$pressName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$senderName}'),(109,'VERSION_CREATED','en','Version Created','A new version was created for {$submissionTitle}','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(111,'EDITORIAL_REMINDER','en','Editorial Reminder','Outstanding editorial tasks for {$pressName}','<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href=\"{$pressUrl}\">{$pressName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href=\"{$submissionsUrl}\">submission dashboard</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>'),(113,'SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(115,'SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(117,'CHANGE_EMAIL','en','Change Email Address Invitation','Confirm account contact email change request','<p>Dear {$recipientName},</p><p>You are receiving this email because someone has requested a change of your email to {$newEmail}.</p><p>If you have made this request please <a href=\"{$acceptInvitationUrl}\">confirm</a> the email change.</p><p>You can always <a href=\"{$declineInvitationUrl}\">reject</a> this email change.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Kind regards,</p>{$siteContactName}'),(119,'ORCID_COLLECT_AUTHOR_ID','en','','Submission ORCID','Dear {$recipientName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$pressName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$pressName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),(121,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','en','','Requesting ORCID record access','Dear {$recipientName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$pressName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<br>\n<a href=\"{$authorOrcidUrl}\" style=\"display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\nClick here to verify your account with ORCID: <a href=\"{$authorOrcidUrl}\">{$authorOrcidUrl}.</a>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$pressName}</a><br/>\n<br>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n'),(123,'USER_ROLE_ASSIGNMENT_INVITATION','en','','You are invited to new roles','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at {$pressName}</p>        <p>At {$pressName}, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.</p>        <div>{$existingRoles}</div>        <div>{$rolesAdded}</div>        <p>On accepting the invite, you will be redirected to {$pressName}</p>        <p>Feel free to contact me with any questions about the process.</p>        <p><a href=\'{$acceptUrl}\' class=\'btn btn-accept\'>Accept Invitation</a></p>        <p><a href=\'{$declineUrl}\' class=\'btn btn-decline\'>Decline Invitation</a></p>        <p>Kind regards,</p>        <p>{$pressName}</p>    </div></div><style>{$emailTemplateStyle}</style>'),(125,'USER_ROLE_END','en','User Role Ended Notification','You have been removed from a role','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Removed from a Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>Thank you very much for your participation in the role of {$roleRemoved} at {$pressName}.</p>        <p>This is a notice to let you know that you have been removed from the following role at {$pressName}: <b>{$roleRemoved}</b>.</p>        <p>Your account with {$pressName} is still active and any other roles you previously held are still active.</p>        <p>Feel free to contact me with any questions about the process.</p>        <p>Kind regards,</p>        <p>{$pressName}</p>    </div></div><style>{$emailTemplateStyle}</style>'),(127,'MANUAL_PAYMENT_NOTIFICATION','en','Manual Payment Notify','Manual Payment Notification','A manual payment needs to be processed for the press {$pressName} and the user {$senderName} (username &quot;{$senderUsername}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$paymentName}&quot;.<br />\nThe cost is {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.'),(193,'PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Confirmation de réinitialisation du mot de passe','Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l\'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),(194,'USER_REGISTER','fr_CA','Création de l\'utilisateur-trice','Inscription à la presse','{$recipientName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$pressName}. Ce courriel contient votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l\'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),(195,'USER_VALIDATE_CONTEXT','fr_CA','','',''),(196,'USER_VALIDATE_SITE','fr_CA','Valider le courriel (site)','',''),(197,'REVIEWER_REGISTER','fr_CA','Inscription d\'une évaluateur-trice','Inscription à titre d\'évaluateur pour la presse {$pressName}','En raison de votre expertise, nous avons ajouté votre nom à notre base de données d\'évaluateurs pour la presse {$pressName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d\'évaluation, vous aurez la possibilité de lire le titre et le résumé de l\'article en question. Vous serez toujours libre d\'accepter ou de refuser l\'invitation. Vous pouvez demander que l\'on retire votre nom de notre liste d\'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d\'intérêt en ce qui concerne l\'évaluation des articles.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),(198,'SUBMISSION_ACK','fr_CA','Confirmation de soumission','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$pressName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$pressSignature}'),(199,'SUBMISSION_ACK_NOT_USER','fr_CA','Confirmation de soumission (autres auteur-es)','Accusé de réception de la soumission','<p>Bonjour,</p><p>Le manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à la revue {$pressName}.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à la revue {$pressName} pour la publication de vos travaux.</p><p>Cordialement,</p>{$pressSignature}'),(200,'EDITOR_ASSIGN','fr_CA','Rédacteur-trice assigné','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),(201,'REVIEW_CANCEL','fr_CA','Évaluateur.trice non assigné.e','Annulation de la requête d\'évaluation','{$recipientName}:<br />\n<br />\n<br />\nNous avons décidé d\'annuler notre requête d\'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$pressName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d\'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter.'),(202,'REVIEW_REINSTATE','fr_CA','Évaluateur.trice réintégré.e','',''),(203,'REVIEW_RESEND_REQUEST','fr_CA','Envoyer de nouveau la demande d\'évaluation à l\'évaluateur-trice','Demande d\'évaluation réitérée pour {$pressName}','<p>{$recipientName},</p><p>Vous avez décliné récemment notre invitation à évaluer la soumission, {$submissionTitle}, pour {$pressName}. Je vous écris afin de vous demander si vous accepteriez de reconsidérer votre décision et d\'accepter de l\'évaluer.</p><p>Nous vous en serions très reconnaissant, mais nous comprenons également que vous soyez dans l\'impossibilité de le faire en ce moment. Quoi qu\'il en soit, pouvez-vous s\'il vous plait <a href=\"{$reviewAssignmentUrl}\">accepter ou approuver notre demande</a> avant le {$responseDueDate}.</p><p>Si vous avez des questions, n\'hésitez pas nous contacter.</p><p>Cordialement,</p>{$signature}'),(204,'REVIEW_REQUEST','fr_CA','Demande d\'évaluation','Requête d\'évaluation d\'un manuscrit','Bonjour {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d\'ici le {$responseDueDate} pour indiquer si vous serez en mesure d\'évaluer l\'article ou non. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$signature}<br />\n'),(205,'REVIEW_REQUEST_SUBSEQUENT','fr_CA','Demande d\'évaluation (nouveau cycle)','',''),(206,'REVIEW_RESPONSE_OVERDUE_AUTO','fr_CA','Rappel automatique pour une invitation à évaluer','',''),(207,'REVIEW_CONFIRM','fr_CA','Évaluation confirmée','Acceptation d\'évaluation','Rédacteurs-trices,<br />\n<br />\nJe suis en mesure d\'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$pressName}. Je vous remercie d\'avoir pensé à moi. Je devrais être en mesure de compléter l\'évaluation pour la date du {$reviewDueDate}, voire avant.<br />\n<br />\n{$senderName}'),(208,'REVIEW_DECLINE','fr_CA','Évaluation refusée','Ne peux pas évaluer','Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m\'avoir invité à évaluer cet article et n\'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$senderName}'),(209,'REVIEW_ACK','fr_CA','Accusé de réception de l\'évaluation','Accusé de réception de l\'évaluation d\'une soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir évalué la soumission intitulée « {$submissionTitle} » pour la revue {$pressName}. Nous vous sommes reconnaissants de votre contribution à la qualité des travaux que nous publions.'),(210,'REVIEW_REMIND','fr_CA','Rappel d\'évaluation','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordLostUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}'),(211,'REVIEW_REMIND_AUTO','fr_CA','Rappel automatique d\'évaluation','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordLostUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$pressSignature}'),(212,'REVIEW_COMPLETE','fr_CA','Évaluation terminée','',''),(213,'REVIEW_EDIT','fr_CA','','',''),(214,'EDITOR_DECISION_ACCEPT','fr_CA','Soumission acceptée','Décision du rédacteur en chef','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}'),(215,'EDITOR_DECISION_SEND_TO_INTERNAL','fr_CA','','',''),(216,'EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','Envoyé à l\'évaluation','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est d\'envoyer votre soumission en évaluation.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),(217,'EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','Envoyé en production','Décision du rédacteur','{$authors},<br />\n<br />\nL\'édition de votre soumission « {$submissionTitle} » est complétée. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),(218,'EDITOR_DECISION_REVISIONS','fr_CA','Révisions demandées','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission.'),(219,'EDITOR_DECISION_RESUBMIT','fr_CA','Soumettez à nouveau pour évaluation','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission et de la soumettre à nouveau.'),(220,'EDITOR_DECISION_DECLINE','fr_CA','Soumission refusée','Décision du rédacteur','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),(221,'EDITOR_DECISION_INITIAL_DECLINE','fr_CA','Soumission refusée avant évaluation','Décision du rédacteur','\n			{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),(222,'EDITOR_RECOMMENDATION','fr_CA','Recommandation émise','Recommandation du rédacteur','{$editors},<br />\n<br />\nLa recommandation concernant la soumission « {$submissionTitle} » à la revue {$pressName} est de : {$recommendation}'),(223,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','Envoyer une notification aux autres auteur-es','Mise à jour concernant votre soumission','<p>Ce courriel a été envoyé à {$submittingAuthorName} par {$pressName} concernant {$submissionTitle}.</p>\n<p>Vous recevez une copie de cet avis car vous êtes identifié comme auteur-e de cette soumission. Toutes les instructions dans le message ci-dessous sont à l\'intention de l\'auteur-e de correspondance, {$submittingAuthorName}. </p><p>Aucune action n\'est attendue de votre part.</p>\n\n{$messageToSubmittingAuthor}'),(224,'EDITOR_DECISION_NOTIFY_REVIEWERS','fr_CA','Notifier les évaluateurs-trices de la décision','Décision éditoriale suite à votre évaluation','<p>{$recipientName},</p>\n<p>Nous vous remercions d\'avoir complété votre évaluation de la soumission, {$submissionTitle}, pour {$pressName}. Nous vous sommes reconnaissant pour votre temps et votre expertise qui contribue à la qualité des travaux que nous publions. Nous avons partagé vos commentaires avec l\'auteur-e, ainsi que ceux des autres évaluateurs-trices. </p>\n<p>En fonction des recommandations reçues, nous avons informé l\'auteur-e de notre décision qui est la suivante: </p>\n<p>{$decisionDescription}</p>\n<p>Votre recommandation a été prise en considération conjointement avec celles des autres évaluateurs-trices avant d\'en arriver à cette décision.</p>\n<p>Ce fut un plaisir de travailler avec vous à cette évaluation pour {$pressName}. Nous espérons avoir l\'opportunité de renouveler cette expérience avec vous à l\'avenir.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>'),(225,'EDITOR_DECISION_NEW_ROUND','fr_CA','Un nouveau cycle d\'évaluation a été lancé','Votre soumission fera l\'objet d\'un nouveau cycle d\'évaluation','<p>{$recipientName},</p>\n<p>Votre soumission révisée, {$submissionTitle}, fera l\'objet d\'un nouveau cycle d\'évaluation par les pairs. \nNous vous contacterons afin de vous faire part des commentaires des évaluateurs et vous fournir des informations sur les prochaines étapes.</p>\n<p>Si vous avec des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),(226,'EDITOR_DECISION_REVERT_DECLINE','fr_CA','Rétablir une soumission refusée','Nous avons renversé la décision de rejeter votre soumission','<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e rédacteur-trice complétera le cycle d\'évaluation et vous serez informé-e lorsqu\'une décision éditoriale sera prise.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter sur votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumissions</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),(227,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','Rétablir une soumission refusée sans évaluation','Nous avons renversé la décision de rejeter votre soumission','<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e rédacteur-trice consultera en détail votre soumission avant de décider de la rejeter ou de l\'envoyer en évaluation.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),(228,'EDITOR_DECISION_SKIP_REVIEW','fr_CA','Soumission acceptée (sans évaluation)','',''),(229,'EDITOR_DECISION_BACK_FROM_PRODUCTION','fr_CA','Soumission renvoyée à la révision','Votre soumission a été renvoyée à l\'étape de révision','<p>{$recipientName},</p><p>Votre soumission, {$submissionTitle}, a été renvoyée à l\'étape de révision, où nous procéderons à des révisions supplémentaires ainsi qu\'à la mise en page en prévision de la publication.</p><p>Nous nous excusons pour la confusion que cette opération peut occasionner.</p><p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p><p>Cordialement,</p><p>{$signature}</p>'),(230,'EDITOR_DECISION_BACK_FROM_COPYEDITING','fr_CA','Soumission renvoyée de l\'étape de révision','',''),(231,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','fr_CA','Cycle d\'évaluation annulé','Un cycle d\'évaluation de votre soumission a été annulé','<p>{$recipientName},</p><p>Nous avions déclenché un nouveau cycle d\'évaluation pour votre soumission, {$submissionTitle}. Nous fermons désormais ce cycle.</p><p>Nous nous excusons pour la confusion que cette action peut occasionner. </p><p>Nous vous contacterons si nous avons besoin d\'une aide supplémentaire de votre part.</p><p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumissions</a></p>.<p>Kind regards,</p><p>{$signature}</p>'),(232,'REVISED_VERSION_NOTIFY','fr_CA','Notification de la version révisée','',''),(233,'STATISTICS_REPORT_NOTIFICATION','fr_CA','Notification sur les rapports statistiques','',''),(234,'ANNOUNCEMENT','fr_CA','Nouvelle annonce','',''),(235,'DISCUSSION_NOTIFICATION_SUBMISSION','fr_CA','Discussion (soumission)','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(236,'DISCUSSION_NOTIFICATION_REVIEW','fr_CA','Discussion (évaluation)','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(237,'DISCUSSION_NOTIFICATION_COPYEDITING','fr_CA','Discussion (révision)','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(238,'DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','Discussion (production)','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(239,'COPYEDIT_REQUEST','fr_CA','Demande de révision','Demande de révision d\'une soumission','{$recipientName},<br />\n<br />\nJ\'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$pressName} à l\'aide des étapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l\'étape de production peut débuter.<br />\n<br />\nURL de la revue {$pressName} : {$pressUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}'),(240,'EDITOR_ASSIGN_SUBMISSION','fr_CA','Assigner un-e rédacteur-trice','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),(241,'EDITOR_ASSIGN_REVIEW','fr_CA','Assigner un-e rédacteur-trice','Travail éditorial',''),(242,'EDITOR_ASSIGN_PRODUCTION','fr_CA','Assigner un-e rédacteur-trice','Travail éditorial',''),(243,'LAYOUT_REQUEST','fr_CA','Prêt pour production','Requête des épreuves en placard','{$recipientName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.'),(244,'LAYOUT_COMPLETE','fr_CA','','Épreuves en placard complétées','{$recipientName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$senderName}'),(245,'INDEX_REQUEST','fr_CA','','Requête d\'indexage','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$pressName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d\'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.<br />\n<br />\n{$signature}'),(246,'INDEX_COMPLETE','fr_CA','','Indexage des épreuves en placard complété','{$recipientName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}'),(247,'VERSION_CREATED','fr_CA','Version créée','Une nouvelle version a été créée pour {$submissionTitle}','<p>{$recipientName}, </p><p>Ceci est un courriel automatique de <a href=\"{$pressUrl}\">{$pressName}</a> pour vous informer qu\'une nouvelle version de votre soumission, {$submissionTitle}, a été créée. Vous pouvez consulter cette version à partir de votre tableau de bord de soumission:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr>'),(248,'EDITORIAL_REMINDER','fr_CA','Rappel éditorial','Tâches éditoriales en attente pour {$pressName}','<p>$recipientName}, </p><p>Vous êtes présentement assigné-e à {$numberOfSubmissions} soumissions dans <a href=\"{$pressUrl}\">{$journalName}</a>. Des actions sont <b>attendues de votre part pour ces soumissions</b>.</p>{$outstandingTasks}<p>Vous pouvez consulter toutes vos soumissions dans votre <a href=\"{$submissionsUrl}\">tableau de bord des soumissions</a>.</p><p>Si vous avez des questions, contactez {$contactName} par courriel à l’adresse: {$contactEmail}. </p>'),(249,'SUBMISSION_SAVED_FOR_LATER','fr_CA','Soumission incomplète sauvegardée','','<p>{$recipientName},</p><p>Les détails de votre soumission ont été enregistrés, mais vous ne l\'avez pas encore finalisée. Vous pouvez le faire en cliquant sur le lien ci-dessous: </p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>Ceci est un message automatique de <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(250,'SUBMISSION_NEEDS_EDITOR','fr_CA','Soumission en attente de rédacteur-trice','Un-e rédacteur-trice doit être assigné-e à la nouvelle soumission : {$submissionTitle}','<p>{$recipientName},</p><p>La soumission suivante a été soumise et aucun-e rédacteur-trice ne lui est assigné-e.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>S\'il vous plait, assignez un-e rédacteur-trice qui sera responsable de la soumission. </p><hr><p>Ceci est un courriel automatique de <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(251,'CHANGE_EMAIL','fr_CA','','',''),(252,'ORCID_COLLECT_AUTHOR_ID','fr_CA','','Soumission ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$pressName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$pressName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),(253,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','','Demande d\'accès au dossier ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$pressName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$pressName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),(254,'USER_ROLE_ASSIGNMENT_INVITATION','fr_CA','','',''),(255,'USER_ROLE_END','fr_CA','','',''),(256,'MANUAL_PAYMENT_NOTIFICATION','fr_CA','','','');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_settings` (
  `email_template_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`email_template_setting_id`),
  UNIQUE KEY `email_templates_settings_unique` (`email_id`,`locale`,`setting_name`),
  KEY `email_templates_settings_email_id` (`email_id`),
  CONSTRAINT `email_templates_settings_email_id` FOREIGN KEY (`email_id`) REFERENCES `email_templates` (`email_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about custom email templates, including localized properties such as the subject and body.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_settings`
--

LOCK TABLES `email_templates_settings` WRITE;
/*!40000 ALTER TABLE `email_templates_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL COMMENT 'NULL if it''s system or automated event',
  `date_logged` datetime NOT NULL,
  `event_type` bigint DEFAULT NULL,
  `message` text,
  `is_translated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_user_id` (`user_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `event_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8mb3 COMMENT='A log of all events related to an object like a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,19,'2024-12-20 05:26:45',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,19,'2024-12-20 05:26:45',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,19,'2024-12-20 05:26:47',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,19,'2024-12-20 05:26:47',1342177288,'submission.event.fileRevised',0),(5,515,1,19,'2024-12-20 05:26:47',1342177296,'submission.event.fileEdited',0),(6,515,2,19,'2024-12-20 05:26:48',1342177281,'submission.event.fileUploaded',0),(7,1048585,1,19,'2024-12-20 05:26:48',1342177288,'submission.event.fileRevised',0),(8,515,2,19,'2024-12-20 05:26:48',1342177296,'submission.event.fileEdited',0),(9,515,3,19,'2024-12-20 05:26:49',1342177281,'submission.event.fileUploaded',0),(10,1048585,1,19,'2024-12-20 05:26:49',1342177288,'submission.event.fileRevised',0),(11,515,3,19,'2024-12-20 05:26:49',1342177296,'submission.event.fileEdited',0),(12,1048585,1,19,'2024-12-20 05:27:04',268435457,'submission.event.submissionSubmitted',0),(13,1048585,1,3,'2024-12-20 05:27:12',805306371,'editor.submission.decision.sendExternalReview.log',0),(14,515,4,3,'2024-12-20 05:27:12',1342177281,'submission.event.fileUploaded',0),(15,1048585,1,3,'2024-12-20 05:27:12',1342177288,'submission.event.fileRevised',0),(16,515,5,3,'2024-12-20 05:27:12',1342177281,'submission.event.fileUploaded',0),(17,1048585,1,3,'2024-12-20 05:27:12',1342177288,'submission.event.fileRevised',0),(18,515,6,3,'2024-12-20 05:27:12',1342177281,'submission.event.fileUploaded',0),(19,1048585,1,3,'2024-12-20 05:27:12',1342177288,'submission.event.fileRevised',0),(20,1048585,1,3,'2024-12-20 05:27:16',1073741825,'log.review.reviewerAssigned',0),(21,1048585,1,3,'2024-12-20 05:27:21',805306371,'editor.submission.decision.accept.log',0),(22,1048585,1,3,'2024-12-20 05:27:26',268435459,'submission.event.participantAdded',0),(23,1048585,2,20,'2024-12-20 05:27:34',268435458,'submission.event.general.metadataUpdated',0),(24,1048585,2,20,'2024-12-20 05:27:34',268435458,'submission.event.general.metadataUpdated',0),(25,515,7,20,'2024-12-20 05:27:43',1342177281,'submission.event.fileUploaded',0),(26,1048585,2,20,'2024-12-20 05:27:43',1342177288,'submission.event.fileRevised',0),(27,515,7,20,'2024-12-20 05:27:43',1342177296,'submission.event.fileEdited',0),(28,1048585,2,20,'2024-12-20 05:27:44',268435458,'submission.event.general.metadataUpdated',0),(29,515,8,20,'2024-12-20 05:27:44',1342177281,'submission.event.fileUploaded',0),(30,1048585,2,20,'2024-12-20 05:27:44',1342177288,'submission.event.fileRevised',0),(31,515,8,20,'2024-12-20 05:27:44',1342177296,'submission.event.fileEdited',0),(32,515,9,20,'2024-12-20 05:27:45',1342177281,'submission.event.fileUploaded',0),(33,1048585,2,20,'2024-12-20 05:27:45',1342177288,'submission.event.fileRevised',0),(34,515,9,20,'2024-12-20 05:27:45',1342177296,'submission.event.fileEdited',0),(35,515,10,20,'2024-12-20 05:27:46',1342177281,'submission.event.fileUploaded',0),(36,1048585,2,20,'2024-12-20 05:27:46',1342177288,'submission.event.fileRevised',0),(37,515,10,20,'2024-12-20 05:27:46',1342177296,'submission.event.fileEdited',0),(38,515,11,20,'2024-12-20 05:27:47',1342177281,'submission.event.fileUploaded',0),(39,1048585,2,20,'2024-12-20 05:27:47',1342177288,'submission.event.fileRevised',0),(40,515,11,20,'2024-12-20 05:27:47',1342177296,'submission.event.fileEdited',0),(41,515,11,20,'2024-12-20 05:27:48',1342177282,'submission.event.fileDeleted',0),(42,1048585,2,20,'2024-12-20 05:29:07',268435457,'submission.event.submissionSubmitted',0),(43,1048585,2,3,'2024-12-20 05:29:23',805306371,'editor.submission.decision.sendExternalReview.log',0),(44,515,12,3,'2024-12-20 05:29:24',1342177281,'submission.event.fileUploaded',0),(45,1048585,2,3,'2024-12-20 05:29:24',1342177288,'submission.event.fileRevised',0),(46,515,13,3,'2024-12-20 05:29:24',1342177281,'submission.event.fileUploaded',0),(47,1048585,2,3,'2024-12-20 05:29:24',1342177288,'submission.event.fileRevised',0),(48,515,14,3,'2024-12-20 05:29:24',1342177281,'submission.event.fileUploaded',0),(49,1048585,2,3,'2024-12-20 05:29:24',1342177288,'submission.event.fileRevised',0),(50,515,15,3,'2024-12-20 05:29:24',1342177281,'submission.event.fileUploaded',0),(51,1048585,2,3,'2024-12-20 05:29:24',1342177288,'submission.event.fileRevised',0),(52,1048585,2,3,'2024-12-20 05:29:31',1073741825,'log.review.reviewerAssigned',0),(53,1048585,2,3,'2024-12-20 05:29:35',1073741825,'log.review.reviewerAssigned',0),(54,1048585,3,21,'2024-12-20 05:29:42',268435458,'submission.event.general.metadataUpdated',0),(55,1048585,3,21,'2024-12-20 05:29:43',268435458,'submission.event.general.metadataUpdated',0),(56,515,16,21,'2024-12-20 05:29:45',1342177281,'submission.event.fileUploaded',0),(57,1048585,3,21,'2024-12-20 05:29:45',1342177288,'submission.event.fileRevised',0),(58,515,16,21,'2024-12-20 05:29:45',1342177296,'submission.event.fileEdited',0),(59,515,17,21,'2024-12-20 05:29:46',1342177281,'submission.event.fileUploaded',0),(60,1048585,3,21,'2024-12-20 05:29:46',1342177288,'submission.event.fileRevised',0),(61,515,17,21,'2024-12-20 05:29:46',1342177296,'submission.event.fileEdited',0),(62,515,18,21,'2024-12-20 05:29:47',1342177281,'submission.event.fileUploaded',0),(63,1048585,3,21,'2024-12-20 05:29:47',1342177288,'submission.event.fileRevised',0),(64,515,18,21,'2024-12-20 05:29:47',1342177296,'submission.event.fileEdited',0),(65,515,19,21,'2024-12-20 05:29:47',1342177281,'submission.event.fileUploaded',0),(66,1048585,3,21,'2024-12-20 05:29:47',1342177288,'submission.event.fileRevised',0),(67,515,19,21,'2024-12-20 05:29:48',1342177296,'submission.event.fileEdited',0),(68,515,20,21,'2024-12-20 05:29:48',1342177281,'submission.event.fileUploaded',0),(69,1048585,3,21,'2024-12-20 05:29:48',1342177288,'submission.event.fileRevised',0),(70,515,20,21,'2024-12-20 05:29:49',1342177296,'submission.event.fileEdited',0),(71,1048585,3,21,'2024-12-20 05:30:16',268435457,'submission.event.submissionSubmitted',0),(72,1048585,4,22,'2024-12-20 05:30:22',268435458,'submission.event.general.metadataUpdated',0),(73,1048585,4,22,'2024-12-20 05:30:23',268435458,'submission.event.general.metadataUpdated',0),(74,515,21,22,'2024-12-20 05:30:25',1342177281,'submission.event.fileUploaded',0),(75,1048585,4,22,'2024-12-20 05:30:25',1342177288,'submission.event.fileRevised',0),(76,515,21,22,'2024-12-20 05:30:25',1342177296,'submission.event.fileEdited',0),(77,515,22,22,'2024-12-20 05:30:26',1342177281,'submission.event.fileUploaded',0),(78,1048585,4,22,'2024-12-20 05:30:26',1342177288,'submission.event.fileRevised',0),(79,515,22,22,'2024-12-20 05:30:26',1342177296,'submission.event.fileEdited',0),(80,515,23,22,'2024-12-20 05:30:27',1342177281,'submission.event.fileUploaded',0),(81,1048585,4,22,'2024-12-20 05:30:27',1342177288,'submission.event.fileRevised',0),(82,515,23,22,'2024-12-20 05:30:27',1342177296,'submission.event.fileEdited',0),(83,515,24,22,'2024-12-20 05:30:28',1342177281,'submission.event.fileUploaded',0),(84,1048585,4,22,'2024-12-20 05:30:28',1342177288,'submission.event.fileRevised',0),(85,515,24,22,'2024-12-20 05:30:28',1342177296,'submission.event.fileEdited',0),(86,1048585,4,22,'2024-12-20 05:30:50',268435457,'submission.event.submissionSubmitted',0),(87,1048585,4,3,'2024-12-20 05:30:58',805306371,'editor.submission.decision.sendInternalReview.log',0),(88,515,25,3,'2024-12-20 05:30:59',1342177281,'submission.event.fileUploaded',0),(89,1048585,4,3,'2024-12-20 05:30:59',1342177288,'submission.event.fileRevised',0),(90,515,26,3,'2024-12-20 05:30:59',1342177281,'submission.event.fileUploaded',0),(91,1048585,4,3,'2024-12-20 05:30:59',1342177288,'submission.event.fileRevised',0),(92,515,27,3,'2024-12-20 05:30:59',1342177281,'submission.event.fileUploaded',0),(93,1048585,4,3,'2024-12-20 05:30:59',1342177288,'submission.event.fileRevised',0),(94,515,28,3,'2024-12-20 05:30:59',1342177281,'submission.event.fileUploaded',0),(95,1048585,4,3,'2024-12-20 05:30:59',1342177288,'submission.event.fileRevised',0),(96,1048585,4,3,'2024-12-20 05:31:04',1073741825,'log.review.reviewerAssigned',0),(97,1048585,4,3,'2024-12-20 05:31:08',805306371,'editor.submission.decision.sendExternalReview.log',0),(98,1048585,4,3,'2024-12-20 05:31:13',1073741825,'log.review.reviewerAssigned',0),(99,1048585,4,3,'2024-12-20 05:31:18',805306371,'editor.submission.decision.accept.log',0),(100,1048585,4,3,'2024-12-20 05:31:24',268435459,'submission.event.participantAdded',0),(101,1048585,4,3,'2024-12-20 05:31:29',805306371,'editor.submission.decision.sendToProduction.log',0),(102,1048585,4,3,'2024-12-20 05:31:35',268435459,'submission.event.participantAdded',0),(103,1048585,4,3,'2024-12-20 05:31:41',268435474,'submission.event.publicationFormatCreated',NULL),(104,1048585,5,23,'2024-12-20 05:31:47',268435458,'submission.event.general.metadataUpdated',0),(105,1048585,5,23,'2024-12-20 05:31:47',268435458,'submission.event.general.metadataUpdated',0),(106,515,29,23,'2024-12-20 05:31:50',1342177281,'submission.event.fileUploaded',0),(107,1048585,5,23,'2024-12-20 05:31:50',1342177288,'submission.event.fileRevised',0),(108,515,29,23,'2024-12-20 05:31:50',1342177296,'submission.event.fileEdited',0),(109,515,30,23,'2024-12-20 05:31:50',1342177281,'submission.event.fileUploaded',0),(110,1048585,5,23,'2024-12-20 05:31:50',1342177288,'submission.event.fileRevised',0),(111,515,30,23,'2024-12-20 05:31:51',1342177296,'submission.event.fileEdited',0),(112,515,31,23,'2024-12-20 05:31:51',1342177281,'submission.event.fileUploaded',0),(113,1048585,5,23,'2024-12-20 05:31:51',1342177288,'submission.event.fileRevised',0),(114,515,31,23,'2024-12-20 05:31:52',1342177296,'submission.event.fileEdited',0),(115,515,32,23,'2024-12-20 05:31:52',1342177281,'submission.event.fileUploaded',0),(116,1048585,5,23,'2024-12-20 05:31:52',1342177288,'submission.event.fileRevised',0),(117,515,32,23,'2024-12-20 05:31:53',1342177296,'submission.event.fileEdited',0),(118,515,33,23,'2024-12-20 05:31:53',1342177281,'submission.event.fileUploaded',0),(119,1048585,5,23,'2024-12-20 05:31:53',1342177288,'submission.event.fileRevised',0),(120,515,33,23,'2024-12-20 05:31:53',1342177296,'submission.event.fileEdited',0),(121,515,34,23,'2024-12-20 05:31:54',1342177281,'submission.event.fileUploaded',0),(122,1048585,5,23,'2024-12-20 05:31:54',1342177288,'submission.event.fileRevised',0),(123,515,34,23,'2024-12-20 05:31:54',1342177296,'submission.event.fileEdited',0),(124,1048585,5,23,'2024-12-20 05:32:27',268435457,'submission.event.submissionSubmitted',0),(125,1048585,5,3,'2024-12-20 05:32:37',805306371,'editor.submission.decision.sendInternalReview.log',0),(126,515,35,3,'2024-12-20 05:32:37',1342177281,'submission.event.fileUploaded',0),(127,1048585,5,3,'2024-12-20 05:32:37',1342177288,'submission.event.fileRevised',0),(128,515,36,3,'2024-12-20 05:32:37',1342177281,'submission.event.fileUploaded',0),(129,1048585,5,3,'2024-12-20 05:32:37',1342177288,'submission.event.fileRevised',0),(130,515,37,3,'2024-12-20 05:32:37',1342177281,'submission.event.fileUploaded',0),(131,1048585,5,3,'2024-12-20 05:32:37',1342177288,'submission.event.fileRevised',0),(132,515,38,3,'2024-12-20 05:32:37',1342177281,'submission.event.fileUploaded',0),(133,1048585,5,3,'2024-12-20 05:32:37',1342177288,'submission.event.fileRevised',0),(134,515,39,3,'2024-12-20 05:32:37',1342177281,'submission.event.fileUploaded',0),(135,1048585,5,3,'2024-12-20 05:32:37',1342177288,'submission.event.fileRevised',0),(136,515,40,3,'2024-12-20 05:32:37',1342177281,'submission.event.fileUploaded',0),(137,1048585,5,3,'2024-12-20 05:32:38',1342177288,'submission.event.fileRevised',0),(138,1048585,5,3,'2024-12-20 05:32:43',1073741825,'log.review.reviewerAssigned',0),(139,1048585,5,3,'2024-12-20 05:32:48',805306371,'editor.submission.decision.sendExternalReview.log',0),(140,1048585,5,3,'2024-12-20 05:32:53',1073741825,'log.review.reviewerAssigned',0),(141,1048585,5,3,'2024-12-20 05:32:57',805306371,'editor.submission.decision.accept.log',0),(142,1048585,5,3,'2024-12-20 05:33:04',268435459,'submission.event.participantAdded',0),(143,1048585,5,3,'2024-12-20 05:33:09',805306371,'editor.submission.decision.sendToProduction.log',0),(144,1048585,5,3,'2024-12-20 05:33:16',268435459,'submission.event.participantAdded',0),(145,1048585,5,3,'2024-12-20 05:33:20',268435459,'submission.event.participantAdded',0),(146,1048585,5,3,'2024-12-20 05:33:24',268435474,'submission.event.publicationFormatCreated',NULL),(147,515,41,3,'2024-12-20 05:33:26',1342177281,'submission.event.fileUploaded',0),(148,1048585,5,3,'2024-12-20 05:33:26',1342177288,'submission.event.fileRevised',0),(149,1048585,5,3,'2024-12-20 05:33:28',268435464,'submission.event.publicationFormatPublished',0),(150,1048585,5,3,'2024-12-20 05:33:30',268435476,'submission.event.publicationFormatMadeAvailable',0),(151,515,41,3,'2024-12-20 05:33:31',1342177296,'submission.event.fileEdited',0),(152,515,41,3,'2024-12-20 05:33:31',1342177287,'submission.event.signoffSignoff',0),(153,515,41,3,'2024-12-20 05:33:33',1342177296,'submission.event.fileEdited',0),(154,1048585,5,3,'2024-12-20 05:33:35',268435462,'publication.event.published',0),(155,1048585,5,3,'2024-12-20 05:33:40',268435463,'publication.event.unpublished',0),(156,1048585,5,3,'2024-12-20 05:33:46',268435462,'publication.event.published',0),(157,1048585,6,24,'2024-12-20 05:33:52',268435458,'submission.event.general.metadataUpdated',0),(158,1048585,6,24,'2024-12-20 05:33:52',268435458,'submission.event.general.metadataUpdated',0),(159,515,42,24,'2024-12-20 05:33:54',1342177281,'submission.event.fileUploaded',0),(160,1048585,6,24,'2024-12-20 05:33:54',1342177288,'submission.event.fileRevised',0),(161,515,42,24,'2024-12-20 05:33:55',1342177296,'submission.event.fileEdited',0),(162,515,43,24,'2024-12-20 05:33:55',1342177281,'submission.event.fileUploaded',0),(163,1048585,6,24,'2024-12-20 05:33:55',1342177288,'submission.event.fileRevised',0),(164,515,43,24,'2024-12-20 05:33:56',1342177296,'submission.event.fileEdited',0),(165,515,44,24,'2024-12-20 05:33:56',1342177281,'submission.event.fileUploaded',0),(166,1048585,6,24,'2024-12-20 05:33:56',1342177288,'submission.event.fileRevised',0),(167,515,44,24,'2024-12-20 05:33:57',1342177296,'submission.event.fileEdited',0),(168,515,45,24,'2024-12-20 05:33:57',1342177281,'submission.event.fileUploaded',0),(169,1048585,6,24,'2024-12-20 05:33:57',1342177288,'submission.event.fileRevised',0),(170,515,45,24,'2024-12-20 05:33:57',1342177296,'submission.event.fileEdited',0),(171,1048585,6,24,'2024-12-20 05:34:19',268435457,'submission.event.submissionSubmitted',0),(172,1048585,6,3,'2024-12-20 05:34:28',805306371,'editor.submission.decision.sendInternalReview.log',0),(173,515,46,3,'2024-12-20 05:34:28',1342177281,'submission.event.fileUploaded',0),(174,1048585,6,3,'2024-12-20 05:34:28',1342177288,'submission.event.fileRevised',0),(175,515,47,3,'2024-12-20 05:34:28',1342177281,'submission.event.fileUploaded',0),(176,1048585,6,3,'2024-12-20 05:34:28',1342177288,'submission.event.fileRevised',0),(177,515,48,3,'2024-12-20 05:34:28',1342177281,'submission.event.fileUploaded',0),(178,1048585,6,3,'2024-12-20 05:34:28',1342177288,'submission.event.fileRevised',0),(179,515,49,3,'2024-12-20 05:34:28',1342177281,'submission.event.fileUploaded',0),(180,1048585,6,3,'2024-12-20 05:34:28',1342177288,'submission.event.fileRevised',0),(181,1048585,6,3,'2024-12-20 05:34:34',268435459,'submission.event.participantAdded',0),(182,1048585,6,3,'2024-12-20 05:34:38',268435459,'submission.event.participantAdded',0),(183,1048585,6,6,'2024-12-20 05:34:48',805306372,'editor.submission.recommend.accept.log',0),(184,1048585,7,25,'2024-12-20 05:35:03',268435458,'submission.event.general.metadataUpdated',0),(185,1048585,7,25,'2024-12-20 05:35:03',268435458,'submission.event.general.metadataUpdated',0),(186,515,50,25,'2024-12-20 05:35:05',1342177281,'submission.event.fileUploaded',0),(187,1048585,7,25,'2024-12-20 05:35:05',1342177288,'submission.event.fileRevised',0),(188,515,50,25,'2024-12-20 05:35:05',1342177296,'submission.event.fileEdited',0),(189,515,51,25,'2024-12-20 05:35:06',1342177281,'submission.event.fileUploaded',0),(190,1048585,7,25,'2024-12-20 05:35:06',1342177288,'submission.event.fileRevised',0),(191,515,51,25,'2024-12-20 05:35:06',1342177296,'submission.event.fileEdited',0),(192,515,52,25,'2024-12-20 05:35:07',1342177281,'submission.event.fileUploaded',0),(193,1048585,7,25,'2024-12-20 05:35:07',1342177288,'submission.event.fileRevised',0),(194,515,52,25,'2024-12-20 05:35:07',1342177296,'submission.event.fileEdited',0),(195,515,53,25,'2024-12-20 05:35:08',1342177281,'submission.event.fileUploaded',0),(196,1048585,7,25,'2024-12-20 05:35:08',1342177288,'submission.event.fileRevised',0),(197,515,53,25,'2024-12-20 05:35:08',1342177296,'submission.event.fileEdited',0),(198,515,54,25,'2024-12-20 05:35:09',1342177281,'submission.event.fileUploaded',0),(199,1048585,7,25,'2024-12-20 05:35:09',1342177288,'submission.event.fileRevised',0),(200,515,54,25,'2024-12-20 05:35:09',1342177296,'submission.event.fileEdited',0),(201,1048585,7,25,'2024-12-20 05:35:37',268435457,'submission.event.submissionSubmitted',0),(202,1048585,7,3,'2024-12-20 05:35:47',805306371,'editor.submission.decision.sendExternalReview.log',0),(203,515,55,3,'2024-12-20 05:35:47',1342177281,'submission.event.fileUploaded',0),(204,1048585,7,3,'2024-12-20 05:35:47',1342177288,'submission.event.fileRevised',0),(205,515,56,3,'2024-12-20 05:35:47',1342177281,'submission.event.fileUploaded',0),(206,1048585,7,3,'2024-12-20 05:35:48',1342177288,'submission.event.fileRevised',0),(207,515,57,3,'2024-12-20 05:35:48',1342177281,'submission.event.fileUploaded',0),(208,1048585,7,3,'2024-12-20 05:35:48',1342177288,'submission.event.fileRevised',0),(209,515,58,3,'2024-12-20 05:35:48',1342177281,'submission.event.fileUploaded',0),(210,1048585,7,3,'2024-12-20 05:35:48',1342177288,'submission.event.fileRevised',0),(211,515,59,3,'2024-12-20 05:35:48',1342177281,'submission.event.fileUploaded',0),(212,1048585,7,3,'2024-12-20 05:35:48',1342177288,'submission.event.fileRevised',0),(213,1048585,7,3,'2024-12-20 05:35:53',1073741825,'log.review.reviewerAssigned',0),(214,1048585,7,3,'2024-12-20 05:35:58',805306371,'editor.submission.decision.accept.log',0),(215,1048585,7,3,'2024-12-20 05:36:04',268435459,'submission.event.participantAdded',0),(216,1048585,8,3,'2024-12-20 05:36:11',268435458,'submission.event.general.metadataUpdated',0),(217,515,60,3,'2024-12-20 05:36:13',1342177281,'submission.event.fileUploaded',0),(218,1048585,8,3,'2024-12-20 05:36:13',1342177288,'submission.event.fileRevised',0),(219,515,60,3,'2024-12-20 05:36:14',1342177296,'submission.event.fileEdited',0),(220,1048585,8,3,'2024-12-20 05:36:15',268435457,'submission.event.submissionSubmitted',0),(221,1048585,9,26,'2024-12-20 05:36:21',268435458,'submission.event.general.metadataUpdated',0),(222,1048585,9,26,'2024-12-20 05:36:21',268435458,'submission.event.general.metadataUpdated',0),(223,515,61,26,'2024-12-20 05:36:23',1342177281,'submission.event.fileUploaded',0),(224,1048585,9,26,'2024-12-20 05:36:23',1342177288,'submission.event.fileRevised',0),(225,515,61,26,'2024-12-20 05:36:23',1342177296,'submission.event.fileEdited',0),(226,515,62,26,'2024-12-20 05:36:24',1342177281,'submission.event.fileUploaded',0),(227,1048585,9,26,'2024-12-20 05:36:24',1342177288,'submission.event.fileRevised',0),(228,515,62,26,'2024-12-20 05:36:24',1342177296,'submission.event.fileEdited',0),(229,515,63,26,'2024-12-20 05:36:25',1342177281,'submission.event.fileUploaded',0),(230,1048585,9,26,'2024-12-20 05:36:25',1342177288,'submission.event.fileRevised',0),(231,515,63,26,'2024-12-20 05:36:25',1342177296,'submission.event.fileEdited',0),(232,515,64,26,'2024-12-20 05:36:26',1342177281,'submission.event.fileUploaded',0),(233,1048585,9,26,'2024-12-20 05:36:26',1342177288,'submission.event.fileRevised',0),(234,515,64,26,'2024-12-20 05:36:26',1342177296,'submission.event.fileEdited',0),(235,515,65,26,'2024-12-20 05:36:27',1342177281,'submission.event.fileUploaded',0),(236,1048585,9,26,'2024-12-20 05:36:27',1342177288,'submission.event.fileRevised',0),(237,515,65,26,'2024-12-20 05:36:27',1342177296,'submission.event.fileEdited',0),(238,1048585,9,26,'2024-12-20 05:36:55',268435457,'submission.event.submissionSubmitted',0),(239,1048585,9,3,'2024-12-20 05:37:05',805306371,'editor.submission.decision.sendInternalReview.log',0),(240,515,66,3,'2024-12-20 05:37:05',1342177281,'submission.event.fileUploaded',0),(241,1048585,9,3,'2024-12-20 05:37:05',1342177288,'submission.event.fileRevised',0),(242,515,67,3,'2024-12-20 05:37:06',1342177281,'submission.event.fileUploaded',0),(243,1048585,9,3,'2024-12-20 05:37:06',1342177288,'submission.event.fileRevised',0),(244,515,68,3,'2024-12-20 05:37:06',1342177281,'submission.event.fileUploaded',0),(245,1048585,9,3,'2024-12-20 05:37:06',1342177288,'submission.event.fileRevised',0),(246,515,69,3,'2024-12-20 05:37:06',1342177281,'submission.event.fileUploaded',0),(247,1048585,9,3,'2024-12-20 05:37:06',1342177288,'submission.event.fileRevised',0),(248,515,70,3,'2024-12-20 05:37:06',1342177281,'submission.event.fileUploaded',0),(249,1048585,9,3,'2024-12-20 05:37:06',1342177288,'submission.event.fileRevised',0),(250,1048585,10,27,'2024-12-20 05:37:16',268435458,'submission.event.general.metadataUpdated',0),(251,1048585,10,27,'2024-12-20 05:37:16',268435458,'submission.event.general.metadataUpdated',0),(252,515,71,27,'2024-12-20 05:37:18',1342177281,'submission.event.fileUploaded',0),(253,1048585,10,27,'2024-12-20 05:37:18',1342177288,'submission.event.fileRevised',0),(254,515,71,27,'2024-12-20 05:37:19',1342177296,'submission.event.fileEdited',0),(255,515,72,27,'2024-12-20 05:37:19',1342177281,'submission.event.fileUploaded',0),(256,1048585,10,27,'2024-12-20 05:37:19',1342177288,'submission.event.fileRevised',0),(257,515,72,27,'2024-12-20 05:37:19',1342177296,'submission.event.fileEdited',0),(258,515,73,27,'2024-12-20 05:37:20',1342177281,'submission.event.fileUploaded',0),(259,1048585,10,27,'2024-12-20 05:37:20',1342177288,'submission.event.fileRevised',0),(260,515,73,27,'2024-12-20 05:37:20',1342177296,'submission.event.fileEdited',0),(261,515,74,27,'2024-12-20 05:37:21',1342177281,'submission.event.fileUploaded',0),(262,1048585,10,27,'2024-12-20 05:37:21',1342177288,'submission.event.fileRevised',0),(263,515,74,27,'2024-12-20 05:37:21',1342177296,'submission.event.fileEdited',0),(264,515,75,27,'2024-12-20 05:37:22',1342177281,'submission.event.fileUploaded',0),(265,1048585,10,27,'2024-12-20 05:37:22',1342177288,'submission.event.fileRevised',0),(266,515,75,27,'2024-12-20 05:37:22',1342177296,'submission.event.fileEdited',0),(267,515,76,27,'2024-12-20 05:37:23',1342177281,'submission.event.fileUploaded',0),(268,1048585,10,27,'2024-12-20 05:37:23',1342177288,'submission.event.fileRevised',0),(269,515,76,27,'2024-12-20 05:37:23',1342177296,'submission.event.fileEdited',0),(270,515,77,27,'2024-12-20 05:37:24',1342177281,'submission.event.fileUploaded',0),(271,1048585,10,27,'2024-12-20 05:37:24',1342177288,'submission.event.fileRevised',0),(272,515,77,27,'2024-12-20 05:37:24',1342177296,'submission.event.fileEdited',0),(273,515,78,27,'2024-12-20 05:37:25',1342177281,'submission.event.fileUploaded',0),(274,1048585,10,27,'2024-12-20 05:37:25',1342177288,'submission.event.fileRevised',0),(275,515,78,27,'2024-12-20 05:37:25',1342177296,'submission.event.fileEdited',0),(276,515,79,27,'2024-12-20 05:37:26',1342177281,'submission.event.fileUploaded',0),(277,1048585,10,27,'2024-12-20 05:37:26',1342177288,'submission.event.fileRevised',0),(278,515,79,27,'2024-12-20 05:37:26',1342177296,'submission.event.fileEdited',0),(279,1048585,10,27,'2024-12-20 05:38:19',268435457,'submission.event.submissionSubmitted',0),(280,1048585,11,28,'2024-12-20 05:38:26',268435458,'submission.event.general.metadataUpdated',0),(281,1048585,11,28,'2024-12-20 05:38:27',268435458,'submission.event.general.metadataUpdated',0),(282,515,80,28,'2024-12-20 05:38:29',1342177281,'submission.event.fileUploaded',0),(283,1048585,11,28,'2024-12-20 05:38:29',1342177288,'submission.event.fileRevised',0),(284,515,80,28,'2024-12-20 05:38:29',1342177296,'submission.event.fileEdited',0),(285,515,81,28,'2024-12-20 05:38:30',1342177281,'submission.event.fileUploaded',0),(286,1048585,11,28,'2024-12-20 05:38:30',1342177288,'submission.event.fileRevised',0),(287,515,81,28,'2024-12-20 05:38:30',1342177296,'submission.event.fileEdited',0),(288,1048585,11,28,'2024-12-20 05:38:40',268435457,'submission.event.submissionSubmitted',0),(289,1048585,11,3,'2024-12-20 05:38:48',805306371,'editor.submission.decision.sendInternalReview.log',0),(290,515,82,3,'2024-12-20 05:38:48',1342177281,'submission.event.fileUploaded',0),(291,1048585,11,3,'2024-12-20 05:38:48',1342177288,'submission.event.fileRevised',0),(292,515,83,3,'2024-12-20 05:38:49',1342177281,'submission.event.fileUploaded',0),(293,1048585,11,3,'2024-12-20 05:38:49',1342177288,'submission.event.fileRevised',0),(294,1048585,11,3,'2024-12-20 05:38:54',1073741825,'log.review.reviewerAssigned',0),(295,1048585,11,3,'2024-12-20 05:38:58',805306371,'editor.submission.decision.sendExternalReview.log',0),(296,1048585,11,3,'2024-12-20 05:39:03',1073741825,'log.review.reviewerAssigned',0),(297,1048585,11,3,'2024-12-20 05:39:06',1073741825,'log.review.reviewerAssigned',0),(298,1048585,11,10,'2024-12-20 05:39:12',1073741830,'log.review.reviewAccepted',NULL),(299,1048585,11,10,'2024-12-20 05:39:16',1073741848,'log.review.reviewReady',0),(300,1048585,11,12,'2024-12-20 05:39:21',1073741830,'log.review.reviewAccepted',NULL),(301,1048585,11,12,'2024-12-20 05:39:25',1073741848,'log.review.reviewReady',0),(302,1048585,11,3,'2024-12-20 05:39:36',805306371,'editor.submission.decision.accept.log',0),(303,1048585,11,3,'2024-12-20 05:39:36',805306375,'submission.event.decisionReviewerEmailSent',0),(304,1048585,12,29,'2024-12-20 05:39:46',268435458,'submission.event.general.metadataUpdated',0),(305,1048585,12,29,'2024-12-20 05:39:46',268435458,'submission.event.general.metadataUpdated',0),(306,515,84,29,'2024-12-20 05:39:48',1342177281,'submission.event.fileUploaded',0),(307,1048585,12,29,'2024-12-20 05:39:48',1342177288,'submission.event.fileRevised',0),(308,515,84,29,'2024-12-20 05:39:48',1342177296,'submission.event.fileEdited',0),(309,515,85,29,'2024-12-20 05:39:49',1342177281,'submission.event.fileUploaded',0),(310,1048585,12,29,'2024-12-20 05:39:49',1342177288,'submission.event.fileRevised',0),(311,515,85,29,'2024-12-20 05:39:49',1342177296,'submission.event.fileEdited',0),(312,515,86,29,'2024-12-20 05:39:50',1342177281,'submission.event.fileUploaded',0),(313,1048585,12,29,'2024-12-20 05:39:50',1342177288,'submission.event.fileRevised',0),(314,515,86,29,'2024-12-20 05:39:50',1342177296,'submission.event.fileEdited',0),(315,1048585,12,29,'2024-12-20 05:40:08',268435457,'submission.event.submissionSubmitted',0),(316,1048585,12,3,'2024-12-20 05:40:17',805306371,'editor.submission.decision.sendInternalReview.log',0),(317,515,87,3,'2024-12-20 05:40:18',1342177281,'submission.event.fileUploaded',0),(318,1048585,12,3,'2024-12-20 05:40:18',1342177288,'submission.event.fileRevised',0),(319,515,88,3,'2024-12-20 05:40:18',1342177281,'submission.event.fileUploaded',0),(320,1048585,12,3,'2024-12-20 05:40:18',1342177288,'submission.event.fileRevised',0),(321,515,89,3,'2024-12-20 05:40:18',1342177281,'submission.event.fileUploaded',0),(322,1048585,12,3,'2024-12-20 05:40:18',1342177288,'submission.event.fileRevised',0),(323,1048585,12,3,'2024-12-20 05:40:24',1073741825,'log.review.reviewerAssigned',0),(324,1048585,12,3,'2024-12-20 05:40:27',1073741825,'log.review.reviewerAssigned',0),(325,1048585,12,3,'2024-12-20 05:40:30',1073741825,'log.review.reviewerAssigned',0),(326,1048585,12,8,'2024-12-20 05:40:36',1073741830,'log.review.reviewAccepted',NULL),(327,1048585,12,8,'2024-12-20 05:40:40',1073741848,'log.review.reviewReady',0),(328,1048585,13,30,'2024-12-20 05:40:46',268435458,'submission.event.general.metadataUpdated',0),(329,1048585,13,30,'2024-12-20 05:40:47',268435458,'submission.event.general.metadataUpdated',0),(330,515,90,30,'2024-12-20 05:40:49',1342177281,'submission.event.fileUploaded',0),(331,1048585,13,30,'2024-12-20 05:40:49',1342177288,'submission.event.fileRevised',0),(332,515,90,30,'2024-12-20 05:40:49',1342177296,'submission.event.fileEdited',0),(333,515,91,30,'2024-12-20 05:40:50',1342177281,'submission.event.fileUploaded',0),(334,1048585,13,30,'2024-12-20 05:40:50',1342177288,'submission.event.fileRevised',0),(335,515,91,30,'2024-12-20 05:40:50',1342177296,'submission.event.fileEdited',0),(336,515,92,30,'2024-12-20 05:40:51',1342177281,'submission.event.fileUploaded',0),(337,1048585,13,30,'2024-12-20 05:40:51',1342177288,'submission.event.fileRevised',0),(338,515,92,30,'2024-12-20 05:40:51',1342177296,'submission.event.fileEdited',0),(339,1048585,13,30,'2024-12-20 05:41:07',268435457,'submission.event.submissionSubmitted',0),(340,1048585,13,3,'2024-12-20 05:41:17',805306371,'editor.submission.decision.sendInternalReview.log',0),(341,515,93,3,'2024-12-20 05:41:17',1342177281,'submission.event.fileUploaded',0),(342,1048585,13,3,'2024-12-20 05:41:17',1342177288,'submission.event.fileRevised',0),(343,515,94,3,'2024-12-20 05:41:17',1342177281,'submission.event.fileUploaded',0),(344,1048585,13,3,'2024-12-20 05:41:17',1342177288,'submission.event.fileRevised',0),(345,515,95,3,'2024-12-20 05:41:17',1342177281,'submission.event.fileUploaded',0),(346,1048585,13,3,'2024-12-20 05:41:17',1342177288,'submission.event.fileRevised',0),(347,1048585,13,3,'2024-12-20 05:41:23',1073741825,'log.review.reviewerAssigned',0),(348,1048585,13,3,'2024-12-20 05:41:27',805306371,'editor.submission.decision.sendExternalReview.log',0),(349,1048585,13,3,'2024-12-20 05:41:33',1073741825,'log.review.reviewerAssigned',0),(350,1048585,13,3,'2024-12-20 05:41:36',1073741825,'log.review.reviewerAssigned',0),(351,1048585,13,3,'2024-12-20 05:41:39',1073741825,'log.review.reviewerAssigned',0),(352,1048585,13,10,'2024-12-20 05:41:45',1073741830,'log.review.reviewAccepted',NULL),(353,1048585,13,10,'2024-12-20 05:41:49',1073741848,'log.review.reviewReady',0),(354,1048585,13,12,'2024-12-20 05:41:54',1073741830,'log.review.reviewAccepted',NULL),(355,1048585,13,12,'2024-12-20 05:41:58',1073741848,'log.review.reviewReady',0),(356,1048585,13,3,'2024-12-20 05:42:10',805306371,'editor.submission.decision.accept.log',0),(357,1048585,13,3,'2024-12-20 05:42:11',805306375,'submission.event.decisionReviewerEmailSent',0),(358,1048585,14,31,'2024-12-20 05:42:21',268435458,'submission.event.general.metadataUpdated',0),(359,1048585,14,31,'2024-12-20 05:42:21',268435458,'submission.event.general.metadataUpdated',0),(360,515,96,31,'2024-12-20 05:42:23',1342177281,'submission.event.fileUploaded',0),(361,1048585,14,31,'2024-12-20 05:42:23',1342177288,'submission.event.fileRevised',0),(362,515,96,31,'2024-12-20 05:42:24',1342177296,'submission.event.fileEdited',0),(363,515,97,31,'2024-12-20 05:42:24',1342177281,'submission.event.fileUploaded',0),(364,1048585,14,31,'2024-12-20 05:42:24',1342177288,'submission.event.fileRevised',0),(365,515,97,31,'2024-12-20 05:42:25',1342177296,'submission.event.fileEdited',0),(366,515,98,31,'2024-12-20 05:42:25',1342177281,'submission.event.fileUploaded',0),(367,1048585,14,31,'2024-12-20 05:42:25',1342177288,'submission.event.fileRevised',0),(368,515,98,31,'2024-12-20 05:42:25',1342177296,'submission.event.fileEdited',0),(369,515,99,31,'2024-12-20 05:42:26',1342177281,'submission.event.fileUploaded',0),(370,1048585,14,31,'2024-12-20 05:42:26',1342177288,'submission.event.fileRevised',0),(371,515,99,31,'2024-12-20 05:42:26',1342177296,'submission.event.fileEdited',0),(372,515,100,31,'2024-12-20 05:42:27',1342177281,'submission.event.fileUploaded',0),(373,1048585,14,31,'2024-12-20 05:42:27',1342177288,'submission.event.fileRevised',0),(374,515,100,31,'2024-12-20 05:42:28',1342177296,'submission.event.fileEdited',0),(375,515,101,31,'2024-12-20 05:42:28',1342177281,'submission.event.fileUploaded',0),(376,1048585,14,31,'2024-12-20 05:42:28',1342177288,'submission.event.fileRevised',0),(377,515,101,31,'2024-12-20 05:42:29',1342177296,'submission.event.fileEdited',0),(378,1048585,14,31,'2024-12-20 05:42:52',268435457,'submission.event.submissionSubmitted',0),(379,1048585,14,3,'2024-12-20 05:43:03',805306371,'editor.submission.decision.sendInternalReview.log',0),(380,515,102,3,'2024-12-20 05:43:03',1342177281,'submission.event.fileUploaded',0),(381,1048585,14,3,'2024-12-20 05:43:03',1342177288,'submission.event.fileRevised',0),(382,515,103,3,'2024-12-20 05:43:04',1342177281,'submission.event.fileUploaded',0),(383,1048585,14,3,'2024-12-20 05:43:04',1342177288,'submission.event.fileRevised',0),(384,515,104,3,'2024-12-20 05:43:04',1342177281,'submission.event.fileUploaded',0),(385,1048585,14,3,'2024-12-20 05:43:04',1342177288,'submission.event.fileRevised',0),(386,515,105,3,'2024-12-20 05:43:04',1342177281,'submission.event.fileUploaded',0),(387,1048585,14,3,'2024-12-20 05:43:04',1342177288,'submission.event.fileRevised',0),(388,515,106,3,'2024-12-20 05:43:04',1342177281,'submission.event.fileUploaded',0),(389,1048585,14,3,'2024-12-20 05:43:04',1342177288,'submission.event.fileRevised',0),(390,515,107,3,'2024-12-20 05:43:04',1342177281,'submission.event.fileUploaded',0),(391,1048585,14,3,'2024-12-20 05:43:04',1342177288,'submission.event.fileRevised',0),(392,1048585,14,3,'2024-12-20 05:43:10',1073741825,'log.review.reviewerAssigned',0),(393,1048585,14,3,'2024-12-20 05:43:15',805306371,'editor.submission.decision.sendExternalReview.log',0),(394,1048585,14,3,'2024-12-20 05:43:22',1073741825,'log.review.reviewerAssigned',0),(395,1048585,14,3,'2024-12-20 05:43:26',805306371,'editor.submission.decision.accept.log',0),(396,1048585,14,3,'2024-12-20 05:43:34',268435459,'submission.event.participantAdded',0),(397,1048585,14,3,'2024-12-20 05:43:39',805306371,'editor.submission.decision.sendToProduction.log',0),(398,1048585,14,3,'2024-12-20 05:43:46',268435459,'submission.event.participantAdded',0),(399,1048585,14,3,'2024-12-20 05:43:50',268435459,'submission.event.participantAdded',0),(400,1048585,14,3,'2024-12-20 05:43:54',268435474,'submission.event.publicationFormatCreated',NULL),(401,515,108,3,'2024-12-20 05:44:00',1342177281,'submission.event.fileUploaded',0),(402,1048585,14,3,'2024-12-20 05:44:00',1342177288,'submission.event.fileRevised',0),(403,515,109,3,'2024-12-20 05:44:00',1342177281,'submission.event.fileUploaded',0),(404,1048585,14,3,'2024-12-20 05:44:00',1342177288,'submission.event.fileRevised',0),(405,515,110,3,'2024-12-20 05:44:00',1342177281,'submission.event.fileUploaded',0),(406,1048585,14,3,'2024-12-20 05:44:00',1342177288,'submission.event.fileRevised',0),(407,515,111,3,'2024-12-20 05:44:00',1342177281,'submission.event.fileUploaded',0),(408,1048585,14,3,'2024-12-20 05:44:00',1342177288,'submission.event.fileRevised',0),(409,515,112,3,'2024-12-20 05:44:00',1342177281,'submission.event.fileUploaded',0),(410,1048585,14,3,'2024-12-20 05:44:00',1342177288,'submission.event.fileRevised',0),(411,515,113,3,'2024-12-20 05:44:00',1342177281,'submission.event.fileUploaded',0),(412,1048585,14,3,'2024-12-20 05:44:00',1342177288,'submission.event.fileRevised',0),(413,1048585,14,3,'2024-12-20 05:44:02',268435464,'submission.event.publicationFormatPublished',0),(414,1048585,14,3,'2024-12-20 05:44:03',268435476,'submission.event.publicationFormatMadeAvailable',0),(415,515,113,3,'2024-12-20 05:44:05',1342177296,'submission.event.fileEdited',0),(416,515,113,3,'2024-12-20 05:44:05',1342177287,'submission.event.signoffSignoff',0),(417,515,113,3,'2024-12-20 05:44:07',1342177296,'submission.event.fileEdited',0),(418,515,112,3,'2024-12-20 05:44:09',1342177296,'submission.event.fileEdited',0),(419,515,112,3,'2024-12-20 05:44:09',1342177287,'submission.event.signoffSignoff',0),(420,515,112,3,'2024-12-20 05:44:11',1342177296,'submission.event.fileEdited',0),(421,515,111,3,'2024-12-20 05:44:13',1342177296,'submission.event.fileEdited',0),(422,515,111,3,'2024-12-20 05:44:13',1342177287,'submission.event.signoffSignoff',0),(423,515,111,3,'2024-12-20 05:44:15',1342177296,'submission.event.fileEdited',0),(424,515,110,3,'2024-12-20 05:44:17',1342177296,'submission.event.fileEdited',0),(425,515,110,3,'2024-12-20 05:44:17',1342177287,'submission.event.signoffSignoff',0),(426,515,110,3,'2024-12-20 05:44:19',1342177296,'submission.event.fileEdited',0),(427,515,109,3,'2024-12-20 05:44:21',1342177296,'submission.event.fileEdited',0),(428,515,109,3,'2024-12-20 05:44:21',1342177287,'submission.event.signoffSignoff',0),(429,515,109,3,'2024-12-20 05:44:24',1342177296,'submission.event.fileEdited',0),(430,515,108,3,'2024-12-20 05:44:26',1342177296,'submission.event.fileEdited',0),(431,515,108,3,'2024-12-20 05:44:26',1342177287,'submission.event.signoffSignoff',0),(432,515,108,3,'2024-12-20 05:44:28',1342177296,'submission.event.fileEdited',0),(433,1048585,14,3,'2024-12-20 05:44:30',268435462,'publication.event.published',0),(434,1048585,15,32,'2024-12-20 05:44:37',268435458,'submission.event.general.metadataUpdated',0),(435,1048585,15,32,'2024-12-20 05:44:37',268435458,'submission.event.general.metadataUpdated',0),(436,515,114,32,'2024-12-20 05:44:39',1342177281,'submission.event.fileUploaded',0),(437,1048585,15,32,'2024-12-20 05:44:39',1342177288,'submission.event.fileRevised',0),(438,515,114,32,'2024-12-20 05:44:39',1342177296,'submission.event.fileEdited',0),(439,515,115,32,'2024-12-20 05:44:40',1342177281,'submission.event.fileUploaded',0),(440,1048585,15,32,'2024-12-20 05:44:40',1342177288,'submission.event.fileRevised',0),(441,515,115,32,'2024-12-20 05:44:40',1342177296,'submission.event.fileEdited',0),(442,515,116,32,'2024-12-20 05:44:41',1342177281,'submission.event.fileUploaded',0),(443,1048585,15,32,'2024-12-20 05:44:41',1342177288,'submission.event.fileRevised',0),(444,515,116,32,'2024-12-20 05:44:41',1342177296,'submission.event.fileEdited',0),(445,1048585,15,32,'2024-12-20 05:44:56',268435457,'submission.event.submissionSubmitted',0),(446,1048585,15,3,'2024-12-20 05:45:05',805306371,'editor.submission.decision.sendExternalReview.log',0),(447,515,117,3,'2024-12-20 05:45:06',1342177281,'submission.event.fileUploaded',0),(448,1048585,15,3,'2024-12-20 05:45:06',1342177288,'submission.event.fileRevised',0),(449,515,118,3,'2024-12-20 05:45:06',1342177281,'submission.event.fileUploaded',0),(450,1048585,15,3,'2024-12-20 05:45:06',1342177288,'submission.event.fileRevised',0),(451,515,119,3,'2024-12-20 05:45:06',1342177281,'submission.event.fileUploaded',0),(452,1048585,15,3,'2024-12-20 05:45:06',1342177288,'submission.event.fileRevised',0),(453,1048585,16,33,'2024-12-20 05:45:16',268435458,'submission.event.general.metadataUpdated',0),(454,1048585,16,33,'2024-12-20 05:45:16',268435458,'submission.event.general.metadataUpdated',0),(455,515,120,33,'2024-12-20 05:45:18',1342177281,'submission.event.fileUploaded',0),(456,1048585,16,33,'2024-12-20 05:45:18',1342177288,'submission.event.fileRevised',0),(457,515,120,33,'2024-12-20 05:45:18',1342177296,'submission.event.fileEdited',0),(458,515,121,33,'2024-12-20 05:45:19',1342177281,'submission.event.fileUploaded',0),(459,1048585,16,33,'2024-12-20 05:45:19',1342177288,'submission.event.fileRevised',0),(460,515,121,33,'2024-12-20 05:45:19',1342177296,'submission.event.fileEdited',0),(461,515,122,33,'2024-12-20 05:45:20',1342177281,'submission.event.fileUploaded',0),(462,1048585,16,33,'2024-12-20 05:45:20',1342177288,'submission.event.fileRevised',0),(463,515,122,33,'2024-12-20 05:45:20',1342177296,'submission.event.fileEdited',0),(464,515,123,33,'2024-12-20 05:45:21',1342177281,'submission.event.fileUploaded',0),(465,1048585,16,33,'2024-12-20 05:45:21',1342177288,'submission.event.fileRevised',0),(466,515,123,33,'2024-12-20 05:45:21',1342177296,'submission.event.fileEdited',0),(467,515,124,33,'2024-12-20 05:45:22',1342177281,'submission.event.fileUploaded',0),(468,1048585,16,33,'2024-12-20 05:45:22',1342177288,'submission.event.fileRevised',0),(469,515,124,33,'2024-12-20 05:45:22',1342177296,'submission.event.fileEdited',0),(470,1048585,16,33,'2024-12-20 05:45:48',268435457,'submission.event.submissionSubmitted',0),(471,1048585,16,3,'2024-12-20 05:45:58',805306371,'editor.submission.decision.sendExternalReview.log',0),(472,515,125,3,'2024-12-20 05:45:58',1342177281,'submission.event.fileUploaded',0),(473,1048585,16,3,'2024-12-20 05:45:58',1342177288,'submission.event.fileRevised',0),(474,515,126,3,'2024-12-20 05:45:59',1342177281,'submission.event.fileUploaded',0),(475,1048585,16,3,'2024-12-20 05:45:59',1342177288,'submission.event.fileRevised',0),(476,515,127,3,'2024-12-20 05:45:59',1342177281,'submission.event.fileUploaded',0),(477,1048585,16,3,'2024-12-20 05:45:59',1342177288,'submission.event.fileRevised',0),(478,515,128,3,'2024-12-20 05:45:59',1342177281,'submission.event.fileUploaded',0),(479,1048585,16,3,'2024-12-20 05:45:59',1342177288,'submission.event.fileRevised',0),(480,515,129,3,'2024-12-20 05:45:59',1342177281,'submission.event.fileUploaded',0),(481,1048585,16,3,'2024-12-20 05:45:59',1342177288,'submission.event.fileRevised',0),(482,1048585,16,3,'2024-12-20 05:46:05',1073741825,'log.review.reviewerAssigned',0),(483,1048585,16,3,'2024-12-20 05:46:08',1073741825,'log.review.reviewerAssigned',0),(484,1048585,16,3,'2024-12-20 05:46:10',1073741825,'log.review.reviewerAssigned',0),(485,1048585,16,10,'2024-12-20 05:46:17',1073741830,'log.review.reviewAccepted',NULL),(486,1048585,16,10,'2024-12-20 05:46:21',1073741848,'log.review.reviewReady',0),(487,1048585,17,34,'2024-12-20 05:46:28',268435458,'submission.event.general.metadataUpdated',0),(488,1048585,17,34,'2024-12-20 05:46:28',268435458,'submission.event.general.metadataUpdated',0),(489,515,130,34,'2024-12-20 05:46:30',1342177281,'submission.event.fileUploaded',0),(490,1048585,17,34,'2024-12-20 05:46:30',1342177288,'submission.event.fileRevised',0),(491,515,130,34,'2024-12-20 05:46:31',1342177296,'submission.event.fileEdited',0),(492,515,131,34,'2024-12-20 05:46:31',1342177281,'submission.event.fileUploaded',0),(493,1048585,17,34,'2024-12-20 05:46:31',1342177288,'submission.event.fileRevised',0),(494,515,131,34,'2024-12-20 05:46:31',1342177296,'submission.event.fileEdited',0),(495,515,132,34,'2024-12-20 05:46:32',1342177281,'submission.event.fileUploaded',0),(496,1048585,17,34,'2024-12-20 05:46:32',1342177288,'submission.event.fileRevised',0),(497,515,132,34,'2024-12-20 05:46:32',1342177296,'submission.event.fileEdited',0),(498,515,133,34,'2024-12-20 05:46:33',1342177281,'submission.event.fileUploaded',0),(499,1048585,17,34,'2024-12-20 05:46:33',1342177288,'submission.event.fileRevised',0),(500,515,133,34,'2024-12-20 05:46:33',1342177296,'submission.event.fileEdited',0),(501,515,134,34,'2024-12-20 05:46:34',1342177281,'submission.event.fileUploaded',0),(502,1048585,17,34,'2024-12-20 05:46:34',1342177288,'submission.event.fileRevised',0),(503,515,134,34,'2024-12-20 05:46:34',1342177296,'submission.event.fileEdited',0),(504,515,135,34,'2024-12-20 05:46:35',1342177281,'submission.event.fileUploaded',0),(505,1048585,17,34,'2024-12-20 05:46:35',1342177288,'submission.event.fileRevised',0),(506,515,135,34,'2024-12-20 05:46:35',1342177296,'submission.event.fileEdited',0),(507,1048585,17,34,'2024-12-20 05:47:12',268435457,'submission.event.submissionSubmitted',0),(508,1048585,17,3,'2024-12-20 05:47:23',805306371,'editor.submission.decision.sendInternalReview.log',0),(509,515,136,3,'2024-12-20 05:47:24',1342177281,'submission.event.fileUploaded',0),(510,1048585,17,3,'2024-12-20 05:47:24',1342177288,'submission.event.fileRevised',0),(511,515,137,3,'2024-12-20 05:47:24',1342177281,'submission.event.fileUploaded',0),(512,1048585,17,3,'2024-12-20 05:47:24',1342177288,'submission.event.fileRevised',0),(513,515,138,3,'2024-12-20 05:47:24',1342177281,'submission.event.fileUploaded',0),(514,1048585,17,3,'2024-12-20 05:47:24',1342177288,'submission.event.fileRevised',0),(515,515,139,3,'2024-12-20 05:47:24',1342177281,'submission.event.fileUploaded',0),(516,1048585,17,3,'2024-12-20 05:47:24',1342177288,'submission.event.fileRevised',0),(517,515,140,3,'2024-12-20 05:47:24',1342177281,'submission.event.fileUploaded',0),(518,1048585,17,3,'2024-12-20 05:47:24',1342177288,'submission.event.fileRevised',0),(519,515,141,3,'2024-12-20 05:47:24',1342177281,'submission.event.fileUploaded',0),(520,1048585,17,3,'2024-12-20 05:47:24',1342177288,'submission.event.fileRevised',0),(521,1048585,17,3,'2024-12-20 05:47:31',1073741825,'log.review.reviewerAssigned',0),(522,1048585,17,3,'2024-12-20 05:47:34',1073741825,'log.review.reviewerAssigned',0);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log_settings` (
  `event_log_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`event_log_setting_id`),
  UNIQUE KEY `event_log_settings_unique` (`log_id`,`setting_name`,`locale`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `event_log_settings_log_id` FOREIGN KEY (`log_id`) REFERENCES `event_log` (`log_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2614 DEFAULT CHARSET=utf8mb3 COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (1,3,'','fileId','1'),(2,3,'en','filename','chapter1.pdf'),(3,3,'','fileStage','2'),(4,3,'','submissionFileId','1'),(5,3,'','submissionId','1'),(6,3,'','username','aclark'),(7,4,'','fileId','1'),(8,4,'en','filename','chapter1.pdf'),(9,4,'','fileStage','2'),(10,4,'','submissionFileId','1'),(11,4,'','submissionId','1'),(12,4,'','username','aclark'),(13,5,'','fileId','1'),(14,5,'en','filename','chapter1.pdf'),(15,5,'','fileStage','2'),(16,5,'','submissionFileId','1'),(17,5,'','submissionId','1'),(18,5,'','username','aclark'),(19,6,'','fileId','2'),(20,6,'en','filename','chapter2.pdf'),(21,6,'','fileStage','2'),(22,6,'','submissionFileId','2'),(23,6,'','submissionId','1'),(24,6,'','username','aclark'),(25,7,'','fileId','2'),(26,7,'en','filename','chapter2.pdf'),(27,7,'','fileStage','2'),(28,7,'','submissionFileId','2'),(29,7,'','submissionId','1'),(30,7,'','username','aclark'),(31,8,'','fileId','2'),(32,8,'en','filename','chapter2.pdf'),(33,8,'','fileStage','2'),(34,8,'','submissionFileId','2'),(35,8,'','submissionId','1'),(36,8,'','username','aclark'),(37,9,'','fileId','3'),(38,9,'en','filename','chapter3.pdf'),(39,9,'','fileStage','2'),(40,9,'','submissionFileId','3'),(41,9,'','submissionId','1'),(42,9,'','username','aclark'),(43,10,'','fileId','3'),(44,10,'en','filename','chapter3.pdf'),(45,10,'','fileStage','2'),(46,10,'','submissionFileId','3'),(47,10,'','submissionId','1'),(48,10,'','username','aclark'),(49,11,'','fileId','3'),(50,11,'en','filename','chapter3.pdf'),(51,11,'','fileStage','2'),(52,11,'','submissionFileId','3'),(53,11,'','submissionId','1'),(54,11,'','username','aclark'),(55,14,'','fileId','3'),(56,14,'en','filename','chapter3.pdf'),(57,14,'','fileStage','4'),(58,14,'','sourceSubmissionFileId','3'),(59,14,'','submissionFileId','4'),(60,14,'','submissionId','1'),(61,14,'','username','dbarnes'),(62,15,'','fileId','3'),(63,15,'en','filename','chapter3.pdf'),(64,15,'','fileStage','4'),(65,15,'','sourceSubmissionFileId','3'),(66,15,'','submissionFileId','4'),(67,15,'','submissionId','1'),(68,15,'','username','dbarnes'),(69,16,'','fileId','2'),(70,16,'en','filename','chapter2.pdf'),(71,16,'','fileStage','4'),(72,16,'','sourceSubmissionFileId','2'),(73,16,'','submissionFileId','5'),(74,16,'','submissionId','1'),(75,16,'','username','dbarnes'),(76,17,'','fileId','2'),(77,17,'en','filename','chapter2.pdf'),(78,17,'','fileStage','4'),(79,17,'','sourceSubmissionFileId','2'),(80,17,'','submissionFileId','5'),(81,17,'','submissionId','1'),(82,17,'','username','dbarnes'),(83,18,'','fileId','1'),(84,18,'en','filename','chapter1.pdf'),(85,18,'','fileStage','4'),(86,18,'','sourceSubmissionFileId','1'),(87,18,'','submissionFileId','6'),(88,18,'','submissionId','1'),(89,18,'','username','dbarnes'),(90,19,'','fileId','1'),(91,19,'en','filename','chapter1.pdf'),(92,19,'','fileStage','4'),(93,19,'','sourceSubmissionFileId','1'),(94,19,'','submissionFileId','6'),(95,19,'','submissionId','1'),(96,19,'','username','dbarnes'),(97,20,'','reviewerName','Gonzalo Favio'),(98,20,'','round','1'),(99,20,'','stageId','3'),(100,20,'','submissionId','1'),(101,22,'','userFullName','Sarah Vogt'),(102,22,'en','userGroupName','Copyeditor'),(103,22,'fr_CA','userGroupName','Réviseur-e'),(104,22,'','username','svogt'),(105,25,'','fileId','4'),(106,25,'en','filename','chapter1.pdf'),(107,25,'','fileStage','2'),(108,25,'','submissionFileId','7'),(109,25,'','submissionId','2'),(110,25,'','username','afinkel'),(111,26,'','fileId','4'),(112,26,'en','filename','chapter1.pdf'),(113,26,'','fileStage','2'),(114,26,'','submissionFileId','7'),(115,26,'','submissionId','2'),(116,26,'','username','afinkel'),(117,27,'','fileId','4'),(118,27,'en','filename','chapter1.pdf'),(119,27,'','fileStage','2'),(120,27,'','submissionFileId','7'),(121,27,'','submissionId','2'),(122,27,'','username','afinkel'),(123,29,'','fileId','5'),(124,29,'en','filename','chapter2.pdf'),(125,29,'','fileStage','2'),(126,29,'','submissionFileId','8'),(127,29,'','submissionId','2'),(128,29,'','username','afinkel'),(129,30,'','fileId','5'),(130,30,'en','filename','chapter2.pdf'),(131,30,'','fileStage','2'),(132,30,'','submissionFileId','8'),(133,30,'','submissionId','2'),(134,30,'','username','afinkel'),(135,31,'','fileId','5'),(136,31,'en','filename','chapter2.pdf'),(137,31,'','fileStage','2'),(138,31,'','submissionFileId','8'),(139,31,'','submissionId','2'),(140,31,'','username','afinkel'),(141,32,'','fileId','6'),(142,32,'en','filename','chapter3.pdf'),(143,32,'','fileStage','2'),(144,32,'','submissionFileId','9'),(145,32,'','submissionId','2'),(146,32,'','username','afinkel'),(147,33,'','fileId','6'),(148,33,'en','filename','chapter3.pdf'),(149,33,'','fileStage','2'),(150,33,'','submissionFileId','9'),(151,33,'','submissionId','2'),(152,33,'','username','afinkel'),(153,34,'','fileId','6'),(154,34,'en','filename','chapter3.pdf'),(155,34,'','fileStage','2'),(156,34,'','submissionFileId','9'),(157,34,'','submissionId','2'),(158,34,'','username','afinkel'),(159,35,'','fileId','7'),(160,35,'en','filename','chapter4.pdf'),(161,35,'','fileStage','2'),(162,35,'','submissionFileId','10'),(163,35,'','submissionId','2'),(164,35,'','username','afinkel'),(165,36,'','fileId','7'),(166,36,'en','filename','chapter4.pdf'),(167,36,'','fileStage','2'),(168,36,'','submissionFileId','10'),(169,36,'','submissionId','2'),(170,36,'','username','afinkel'),(171,37,'','fileId','7'),(172,37,'en','filename','chapter4.pdf'),(173,37,'','fileStage','2'),(174,37,'','submissionFileId','10'),(175,37,'','submissionId','2'),(176,37,'','username','afinkel'),(177,38,'','fileId','8'),(178,38,'en','filename','delete-this-file.pdf'),(179,38,'','fileStage','2'),(180,38,'','submissionFileId','11'),(181,38,'','submissionId','2'),(182,38,'','username','afinkel'),(183,39,'','fileId','8'),(184,39,'en','filename','delete-this-file.pdf'),(185,39,'','fileStage','2'),(186,39,'','submissionFileId','11'),(187,39,'','submissionId','2'),(188,39,'','username','afinkel'),(189,40,'','fileId','8'),(190,40,'en','filename','delete-this-file.pdf'),(191,40,'','fileStage','2'),(192,40,'','submissionFileId','11'),(193,40,'','submissionId','2'),(194,40,'','username','afinkel'),(195,41,'','fileId','8'),(196,41,'en','filename','delete-this-file.pdf'),(197,41,'','fileStage','2'),(198,41,'','submissionFileId','11'),(199,41,'','submissionId','2'),(200,41,'','username','afinkel'),(201,44,'','fileId','7'),(202,44,'en','filename','chapter4.pdf'),(203,44,'','fileStage','4'),(204,44,'','sourceSubmissionFileId','10'),(205,44,'','submissionFileId','12'),(206,44,'','submissionId','2'),(207,44,'','username','dbarnes'),(208,45,'','fileId','7'),(209,45,'en','filename','chapter4.pdf'),(210,45,'','fileStage','4'),(211,45,'','sourceSubmissionFileId','10'),(212,45,'','submissionFileId','12'),(213,45,'','submissionId','2'),(214,45,'','username','dbarnes'),(215,46,'','fileId','6'),(216,46,'en','filename','chapter3.pdf'),(217,46,'','fileStage','4'),(218,46,'','sourceSubmissionFileId','9'),(219,46,'','submissionFileId','13'),(220,46,'','submissionId','2'),(221,46,'','username','dbarnes'),(222,47,'','fileId','6'),(223,47,'en','filename','chapter3.pdf'),(224,47,'','fileStage','4'),(225,47,'','sourceSubmissionFileId','9'),(226,47,'','submissionFileId','13'),(227,47,'','submissionId','2'),(228,47,'','username','dbarnes'),(229,48,'','fileId','5'),(230,48,'en','filename','chapter2.pdf'),(231,48,'','fileStage','4'),(232,48,'','sourceSubmissionFileId','8'),(233,48,'','submissionFileId','14'),(234,48,'','submissionId','2'),(235,48,'','username','dbarnes'),(236,49,'','fileId','5'),(237,49,'en','filename','chapter2.pdf'),(238,49,'','fileStage','4'),(239,49,'','sourceSubmissionFileId','8'),(240,49,'','submissionFileId','14'),(241,49,'','submissionId','2'),(242,49,'','username','dbarnes'),(243,50,'','fileId','4'),(244,50,'en','filename','chapter1.pdf'),(245,50,'','fileStage','4'),(246,50,'','sourceSubmissionFileId','7'),(247,50,'','submissionFileId','15'),(248,50,'','submissionId','2'),(249,50,'','username','dbarnes'),(250,51,'','fileId','4'),(251,51,'en','filename','chapter1.pdf'),(252,51,'','fileStage','4'),(253,51,'','sourceSubmissionFileId','7'),(254,51,'','submissionFileId','15'),(255,51,'','submissionId','2'),(256,51,'','username','dbarnes'),(257,52,'','reviewerName','Al Zacharia'),(258,52,'','round','1'),(259,52,'','stageId','3'),(260,52,'','submissionId','2'),(261,53,'','reviewerName','Gonzalo Favio'),(262,53,'','round','1'),(263,53,'','stageId','3'),(264,53,'','submissionId','2'),(265,56,'','fileId','9'),(266,56,'en','filename','chapter1.pdf'),(267,56,'','fileStage','2'),(268,56,'','submissionFileId','16'),(269,56,'','submissionId','3'),(270,56,'','username','bbarnetson'),(271,57,'','fileId','9'),(272,57,'en','filename','chapter1.pdf'),(273,57,'','fileStage','2'),(274,57,'','submissionFileId','16'),(275,57,'','submissionId','3'),(276,57,'','username','bbarnetson'),(277,58,'','fileId','9'),(278,58,'en','filename','chapter1.pdf'),(279,58,'','fileStage','2'),(280,58,'','submissionFileId','16'),(281,58,'','submissionId','3'),(282,58,'','username','bbarnetson'),(283,59,'','fileId','10'),(284,59,'en','filename','chapter2.pdf'),(285,59,'','fileStage','2'),(286,59,'','submissionFileId','17'),(287,59,'','submissionId','3'),(288,59,'','username','bbarnetson'),(289,60,'','fileId','10'),(290,60,'en','filename','chapter2.pdf'),(291,60,'','fileStage','2'),(292,60,'','submissionFileId','17'),(293,60,'','submissionId','3'),(294,60,'','username','bbarnetson'),(295,61,'','fileId','10'),(296,61,'en','filename','chapter2.pdf'),(297,61,'','fileStage','2'),(298,61,'','submissionFileId','17'),(299,61,'','submissionId','3'),(300,61,'','username','bbarnetson'),(301,62,'','fileId','11'),(302,62,'en','filename','chapter3.pdf'),(303,62,'','fileStage','2'),(304,62,'','submissionFileId','18'),(305,62,'','submissionId','3'),(306,62,'','username','bbarnetson'),(307,63,'','fileId','11'),(308,63,'en','filename','chapter3.pdf'),(309,63,'','fileStage','2'),(310,63,'','submissionFileId','18'),(311,63,'','submissionId','3'),(312,63,'','username','bbarnetson'),(313,64,'','fileId','11'),(314,64,'en','filename','chapter3.pdf'),(315,64,'','fileStage','2'),(316,64,'','submissionFileId','18'),(317,64,'','submissionId','3'),(318,64,'','username','bbarnetson'),(319,65,'','fileId','12'),(320,65,'en','filename','chapter4.pdf'),(321,65,'','fileStage','2'),(322,65,'','submissionFileId','19'),(323,65,'','submissionId','3'),(324,65,'','username','bbarnetson'),(325,66,'','fileId','12'),(326,66,'en','filename','chapter4.pdf'),(327,66,'','fileStage','2'),(328,66,'','submissionFileId','19'),(329,66,'','submissionId','3'),(330,66,'','username','bbarnetson'),(331,67,'','fileId','12'),(332,67,'en','filename','chapter4.pdf'),(333,67,'','fileStage','2'),(334,67,'','submissionFileId','19'),(335,67,'','submissionId','3'),(336,67,'','username','bbarnetson'),(337,68,'','fileId','13'),(338,68,'en','filename','chapter5.pdf'),(339,68,'','fileStage','2'),(340,68,'','submissionFileId','20'),(341,68,'','submissionId','3'),(342,68,'','username','bbarnetson'),(343,69,'','fileId','13'),(344,69,'en','filename','chapter5.pdf'),(345,69,'','fileStage','2'),(346,69,'','submissionFileId','20'),(347,69,'','submissionId','3'),(348,69,'','username','bbarnetson'),(349,70,'','fileId','13'),(350,70,'en','filename','chapter5.pdf'),(351,70,'','fileStage','2'),(352,70,'','submissionFileId','20'),(353,70,'','submissionId','3'),(354,70,'','username','bbarnetson'),(355,74,'','fileId','14'),(356,74,'en','filename','chapter1.pdf'),(357,74,'','fileStage','2'),(358,74,'','submissionFileId','21'),(359,74,'','submissionId','4'),(360,74,'','username','bbeaty'),(361,75,'','fileId','14'),(362,75,'en','filename','chapter1.pdf'),(363,75,'','fileStage','2'),(364,75,'','submissionFileId','21'),(365,75,'','submissionId','4'),(366,75,'','username','bbeaty'),(367,76,'','fileId','14'),(368,76,'en','filename','chapter1.pdf'),(369,76,'','fileStage','2'),(370,76,'','submissionFileId','21'),(371,76,'','submissionId','4'),(372,76,'','username','bbeaty'),(373,77,'','fileId','15'),(374,77,'en','filename','chapter2.pdf'),(375,77,'','fileStage','2'),(376,77,'','submissionFileId','22'),(377,77,'','submissionId','4'),(378,77,'','username','bbeaty'),(379,78,'','fileId','15'),(380,78,'en','filename','chapter2.pdf'),(381,78,'','fileStage','2'),(382,78,'','submissionFileId','22'),(383,78,'','submissionId','4'),(384,78,'','username','bbeaty'),(385,79,'','fileId','15'),(386,79,'en','filename','chapter2.pdf'),(387,79,'','fileStage','2'),(388,79,'','submissionFileId','22'),(389,79,'','submissionId','4'),(390,79,'','username','bbeaty'),(391,80,'','fileId','16'),(392,80,'en','filename','chapter3.pdf'),(393,80,'','fileStage','2'),(394,80,'','submissionFileId','23'),(395,80,'','submissionId','4'),(396,80,'','username','bbeaty'),(397,81,'','fileId','16'),(398,81,'en','filename','chapter3.pdf'),(399,81,'','fileStage','2'),(400,81,'','submissionFileId','23'),(401,81,'','submissionId','4'),(402,81,'','username','bbeaty'),(403,82,'','fileId','16'),(404,82,'en','filename','chapter3.pdf'),(405,82,'','fileStage','2'),(406,82,'','submissionFileId','23'),(407,82,'','submissionId','4'),(408,82,'','username','bbeaty'),(409,83,'','fileId','17'),(410,83,'en','filename','intro.pdf'),(411,83,'','fileStage','2'),(412,83,'','submissionFileId','24'),(413,83,'','submissionId','4'),(414,83,'','username','bbeaty'),(415,84,'','fileId','17'),(416,84,'en','filename','intro.pdf'),(417,84,'','fileStage','2'),(418,84,'','submissionFileId','24'),(419,84,'','submissionId','4'),(420,84,'','username','bbeaty'),(421,85,'','fileId','17'),(422,85,'en','filename','intro.pdf'),(423,85,'','fileStage','2'),(424,85,'','submissionFileId','24'),(425,85,'','submissionId','4'),(426,85,'','username','bbeaty'),(427,88,'','fileId','17'),(428,88,'en','filename','intro.pdf'),(429,88,'','fileStage','19'),(430,88,'','sourceSubmissionFileId','24'),(431,88,'','submissionFileId','25'),(432,88,'','submissionId','4'),(433,88,'','username','dbarnes'),(434,89,'','fileId','17'),(435,89,'en','filename','intro.pdf'),(436,89,'','fileStage','19'),(437,89,'','sourceSubmissionFileId','24'),(438,89,'','submissionFileId','25'),(439,89,'','submissionId','4'),(440,89,'','username','dbarnes'),(441,90,'','fileId','16'),(442,90,'en','filename','chapter3.pdf'),(443,90,'','fileStage','19'),(444,90,'','sourceSubmissionFileId','23'),(445,90,'','submissionFileId','26'),(446,90,'','submissionId','4'),(447,90,'','username','dbarnes'),(448,91,'','fileId','16'),(449,91,'en','filename','chapter3.pdf'),(450,91,'','fileStage','19'),(451,91,'','sourceSubmissionFileId','23'),(452,91,'','submissionFileId','26'),(453,91,'','submissionId','4'),(454,91,'','username','dbarnes'),(455,92,'','fileId','15'),(456,92,'en','filename','chapter2.pdf'),(457,92,'','fileStage','19'),(458,92,'','sourceSubmissionFileId','22'),(459,92,'','submissionFileId','27'),(460,92,'','submissionId','4'),(461,92,'','username','dbarnes'),(462,93,'','fileId','15'),(463,93,'en','filename','chapter2.pdf'),(464,93,'','fileStage','19'),(465,93,'','sourceSubmissionFileId','22'),(466,93,'','submissionFileId','27'),(467,93,'','submissionId','4'),(468,93,'','username','dbarnes'),(469,94,'','fileId','14'),(470,94,'en','filename','chapter1.pdf'),(471,94,'','fileStage','19'),(472,94,'','sourceSubmissionFileId','21'),(473,94,'','submissionFileId','28'),(474,94,'','submissionId','4'),(475,94,'','username','dbarnes'),(476,95,'','fileId','14'),(477,95,'en','filename','chapter1.pdf'),(478,95,'','fileStage','19'),(479,95,'','sourceSubmissionFileId','21'),(480,95,'','submissionFileId','28'),(481,95,'','submissionId','4'),(482,95,'','username','dbarnes'),(483,96,'','reviewerName','Aisla McCrae'),(484,96,'','round','1'),(485,96,'','stageId','2'),(486,96,'','submissionId','4'),(487,98,'','reviewerName','Al Zacharia'),(488,98,'','round','1'),(489,98,'','stageId','3'),(490,98,'','submissionId','4'),(491,100,'','userFullName','Maria Fritz'),(492,100,'en','userGroupName','Copyeditor'),(493,100,'fr_CA','userGroupName','Réviseur-e'),(494,100,'','username','mfritz'),(495,102,'','userFullName','Graham Cox'),(496,102,'en','userGroupName','Layout Editor'),(497,102,'fr_CA','userGroupName','Responsable de la mise en page'),(498,102,'','username','gcox'),(499,103,'en','publicationFormatName','PDF'),(500,103,'fr_CA','publicationFormatName',''),(501,106,'','fileId','18'),(502,106,'en','filename','prologue.pdf'),(503,106,'','fileStage','2'),(504,106,'','submissionFileId','29'),(505,106,'','submissionId','5'),(506,106,'','username','callan'),(507,107,'','fileId','18'),(508,107,'en','filename','prologue.pdf'),(509,107,'','fileStage','2'),(510,107,'','submissionFileId','29'),(511,107,'','submissionId','5'),(512,107,'','username','callan'),(513,108,'','fileId','18'),(514,108,'en','filename','prologue.pdf'),(515,108,'','fileStage','2'),(516,108,'','submissionFileId','29'),(517,108,'','submissionId','5'),(518,108,'','username','callan'),(519,109,'','fileId','19'),(520,109,'en','filename','chapter1.pdf'),(521,109,'','fileStage','2'),(522,109,'','submissionFileId','30'),(523,109,'','submissionId','5'),(524,109,'','username','callan'),(525,110,'','fileId','19'),(526,110,'en','filename','chapter1.pdf'),(527,110,'','fileStage','2'),(528,110,'','submissionFileId','30'),(529,110,'','submissionId','5'),(530,110,'','username','callan'),(531,111,'','fileId','19'),(532,111,'en','filename','chapter1.pdf'),(533,111,'','fileStage','2'),(534,111,'','submissionFileId','30'),(535,111,'','submissionId','5'),(536,111,'','username','callan'),(537,112,'','fileId','20'),(538,112,'en','filename','chapter2.pdf'),(539,112,'','fileStage','2'),(540,112,'','submissionFileId','31'),(541,112,'','submissionId','5'),(542,112,'','username','callan'),(543,113,'','fileId','20'),(544,113,'en','filename','chapter2.pdf'),(545,113,'','fileStage','2'),(546,113,'','submissionFileId','31'),(547,113,'','submissionId','5'),(548,113,'','username','callan'),(549,114,'','fileId','20'),(550,114,'en','filename','chapter2.pdf'),(551,114,'','fileStage','2'),(552,114,'','submissionFileId','31'),(553,114,'','submissionId','5'),(554,114,'','username','callan'),(555,115,'','fileId','21'),(556,115,'en','filename','chapter3.pdf'),(557,115,'','fileStage','2'),(558,115,'','submissionFileId','32'),(559,115,'','submissionId','5'),(560,115,'','username','callan'),(561,116,'','fileId','21'),(562,116,'en','filename','chapter3.pdf'),(563,116,'','fileStage','2'),(564,116,'','submissionFileId','32'),(565,116,'','submissionId','5'),(566,116,'','username','callan'),(567,117,'','fileId','21'),(568,117,'en','filename','chapter3.pdf'),(569,117,'','fileStage','2'),(570,117,'','submissionFileId','32'),(571,117,'','submissionId','5'),(572,117,'','username','callan'),(573,118,'','fileId','22'),(574,118,'en','filename','chapter4.pdf'),(575,118,'','fileStage','2'),(576,118,'','submissionFileId','33'),(577,118,'','submissionId','5'),(578,118,'','username','callan'),(579,119,'','fileId','22'),(580,119,'en','filename','chapter4.pdf'),(581,119,'','fileStage','2'),(582,119,'','submissionFileId','33'),(583,119,'','submissionId','5'),(584,119,'','username','callan'),(585,120,'','fileId','22'),(586,120,'en','filename','chapter4.pdf'),(587,120,'','fileStage','2'),(588,120,'','submissionFileId','33'),(589,120,'','submissionId','5'),(590,120,'','username','callan'),(591,121,'','fileId','23'),(592,121,'en','filename','epilogue.pdf'),(593,121,'','fileStage','2'),(594,121,'','submissionFileId','34'),(595,121,'','submissionId','5'),(596,121,'','username','callan'),(597,122,'','fileId','23'),(598,122,'en','filename','epilogue.pdf'),(599,122,'','fileStage','2'),(600,122,'','submissionFileId','34'),(601,122,'','submissionId','5'),(602,122,'','username','callan'),(603,123,'','fileId','23'),(604,123,'en','filename','epilogue.pdf'),(605,123,'','fileStage','2'),(606,123,'','submissionFileId','34'),(607,123,'','submissionId','5'),(608,123,'','username','callan'),(609,126,'','fileId','23'),(610,126,'en','filename','epilogue.pdf'),(611,126,'','fileStage','19'),(612,126,'','sourceSubmissionFileId','34'),(613,126,'','submissionFileId','35'),(614,126,'','submissionId','5'),(615,126,'','username','dbarnes'),(616,127,'','fileId','23'),(617,127,'en','filename','epilogue.pdf'),(618,127,'','fileStage','19'),(619,127,'','sourceSubmissionFileId','34'),(620,127,'','submissionFileId','35'),(621,127,'','submissionId','5'),(622,127,'','username','dbarnes'),(623,128,'','fileId','22'),(624,128,'en','filename','chapter4.pdf'),(625,128,'','fileStage','19'),(626,128,'','sourceSubmissionFileId','33'),(627,128,'','submissionFileId','36'),(628,128,'','submissionId','5'),(629,128,'','username','dbarnes'),(630,129,'','fileId','22'),(631,129,'en','filename','chapter4.pdf'),(632,129,'','fileStage','19'),(633,129,'','sourceSubmissionFileId','33'),(634,129,'','submissionFileId','36'),(635,129,'','submissionId','5'),(636,129,'','username','dbarnes'),(637,130,'','fileId','21'),(638,130,'en','filename','chapter3.pdf'),(639,130,'','fileStage','19'),(640,130,'','sourceSubmissionFileId','32'),(641,130,'','submissionFileId','37'),(642,130,'','submissionId','5'),(643,130,'','username','dbarnes'),(644,131,'','fileId','21'),(645,131,'en','filename','chapter3.pdf'),(646,131,'','fileStage','19'),(647,131,'','sourceSubmissionFileId','32'),(648,131,'','submissionFileId','37'),(649,131,'','submissionId','5'),(650,131,'','username','dbarnes'),(651,132,'','fileId','20'),(652,132,'en','filename','chapter2.pdf'),(653,132,'','fileStage','19'),(654,132,'','sourceSubmissionFileId','31'),(655,132,'','submissionFileId','38'),(656,132,'','submissionId','5'),(657,132,'','username','dbarnes'),(658,133,'','fileId','20'),(659,133,'en','filename','chapter2.pdf'),(660,133,'','fileStage','19'),(661,133,'','sourceSubmissionFileId','31'),(662,133,'','submissionFileId','38'),(663,133,'','submissionId','5'),(664,133,'','username','dbarnes'),(665,134,'','fileId','18'),(666,134,'en','filename','prologue.pdf'),(667,134,'','fileStage','19'),(668,134,'','sourceSubmissionFileId','29'),(669,134,'','submissionFileId','39'),(670,134,'','submissionId','5'),(671,134,'','username','dbarnes'),(672,135,'','fileId','18'),(673,135,'en','filename','prologue.pdf'),(674,135,'','fileStage','19'),(675,135,'','sourceSubmissionFileId','29'),(676,135,'','submissionFileId','39'),(677,135,'','submissionId','5'),(678,135,'','username','dbarnes'),(679,136,'','fileId','19'),(680,136,'en','filename','chapter1.pdf'),(681,136,'','fileStage','19'),(682,136,'','sourceSubmissionFileId','30'),(683,136,'','submissionFileId','40'),(684,136,'','submissionId','5'),(685,136,'','username','dbarnes'),(686,137,'','fileId','19'),(687,137,'en','filename','chapter1.pdf'),(688,137,'','fileStage','19'),(689,137,'','sourceSubmissionFileId','30'),(690,137,'','submissionFileId','40'),(691,137,'','submissionId','5'),(692,137,'','username','dbarnes'),(693,138,'','reviewerName','Paul Hudson'),(694,138,'','round','1'),(695,138,'','stageId','2'),(696,138,'','submissionId','5'),(697,140,'','reviewerName','Gonzalo Favio'),(698,140,'','round','1'),(699,140,'','stageId','3'),(700,140,'','submissionId','5'),(701,142,'','userFullName','Sarah Vogt'),(702,142,'en','userGroupName','Copyeditor'),(703,142,'fr_CA','userGroupName','Réviseur-e'),(704,142,'','username','svogt'),(705,144,'','userFullName','Stephen Hellier'),(706,144,'en','userGroupName','Layout Editor'),(707,144,'fr_CA','userGroupName','Responsable de la mise en page'),(708,144,'','username','shellier'),(709,145,'','userFullName','Catherine Turner'),(710,145,'en','userGroupName','Proofreader'),(711,145,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),(712,145,'','username','cturner'),(713,146,'en','publicationFormatName','PDF'),(714,146,'fr_CA','publicationFormatName',''),(715,147,'','fileId','23'),(716,147,'en','filename','epilogue.pdf'),(717,147,'','fileStage','10'),(718,147,'','sourceSubmissionFileId','34'),(719,147,'','submissionFileId','41'),(720,147,'','submissionId','5'),(721,147,'','username','dbarnes'),(722,148,'','fileId','23'),(723,148,'en','filename','epilogue.pdf'),(724,148,'','fileStage','10'),(725,148,'','sourceSubmissionFileId','34'),(726,148,'','submissionFileId','41'),(727,148,'','submissionId','5'),(728,148,'','username','dbarnes'),(729,149,'en','publicationFormatName','PDF'),(730,149,'fr_CA','publicationFormatName',''),(731,150,'en','publicationFormatName','PDF'),(732,150,'fr_CA','publicationFormatName',''),(733,151,'','fileId','23'),(734,151,'en','filename','epilogue.pdf'),(735,151,'','fileStage','10'),(736,151,'','sourceSubmissionFileId','34'),(737,151,'','submissionFileId','41'),(738,151,'','submissionId','5'),(739,151,'','username','dbarnes'),(740,152,'en','filename','epilogue.pdf'),(741,152,'','userFullName','Daniel Barnes'),(742,152,'','username','dbarnes'),(743,153,'','fileId','23'),(744,153,'en','filename','epilogue.pdf'),(745,153,'','fileStage','10'),(746,153,'','sourceSubmissionFileId','34'),(747,153,'','submissionFileId','41'),(748,153,'','submissionId','5'),(749,153,'','username','dbarnes'),(750,159,'','fileId','24'),(751,159,'en','filename','chapter1.pdf'),(752,159,'','fileStage','2'),(753,159,'','submissionFileId','42'),(754,159,'','submissionId','6'),(755,159,'','username','dbernnard'),(756,160,'','fileId','24'),(757,160,'en','filename','chapter1.pdf'),(758,160,'','fileStage','2'),(759,160,'','submissionFileId','42'),(760,160,'','submissionId','6'),(761,160,'','username','dbernnard'),(762,161,'','fileId','24'),(763,161,'en','filename','chapter1.pdf'),(764,161,'','fileStage','2'),(765,161,'','submissionFileId','42'),(766,161,'','submissionId','6'),(767,161,'','username','dbernnard'),(768,162,'','fileId','25'),(769,162,'en','filename','chapter2.pdf'),(770,162,'','fileStage','2'),(771,162,'','submissionFileId','43'),(772,162,'','submissionId','6'),(773,162,'','username','dbernnard'),(774,163,'','fileId','25'),(775,163,'en','filename','chapter2.pdf'),(776,163,'','fileStage','2'),(777,163,'','submissionFileId','43'),(778,163,'','submissionId','6'),(779,163,'','username','dbernnard'),(780,164,'','fileId','25'),(781,164,'en','filename','chapter2.pdf'),(782,164,'','fileStage','2'),(783,164,'','submissionFileId','43'),(784,164,'','submissionId','6'),(785,164,'','username','dbernnard'),(786,165,'','fileId','26'),(787,165,'en','filename','chapter3.pdf'),(788,165,'','fileStage','2'),(789,165,'','submissionFileId','44'),(790,165,'','submissionId','6'),(791,165,'','username','dbernnard'),(792,166,'','fileId','26'),(793,166,'en','filename','chapter3.pdf'),(794,166,'','fileStage','2'),(795,166,'','submissionFileId','44'),(796,166,'','submissionId','6'),(797,166,'','username','dbernnard'),(798,167,'','fileId','26'),(799,167,'en','filename','chapter3.pdf'),(800,167,'','fileStage','2'),(801,167,'','submissionFileId','44'),(802,167,'','submissionId','6'),(803,167,'','username','dbernnard'),(804,168,'','fileId','27'),(805,168,'en','filename','chapter4.pdf'),(806,168,'','fileStage','2'),(807,168,'','submissionFileId','45'),(808,168,'','submissionId','6'),(809,168,'','username','dbernnard'),(810,169,'','fileId','27'),(811,169,'en','filename','chapter4.pdf'),(812,169,'','fileStage','2'),(813,169,'','submissionFileId','45'),(814,169,'','submissionId','6'),(815,169,'','username','dbernnard'),(816,170,'','fileId','27'),(817,170,'en','filename','chapter4.pdf'),(818,170,'','fileStage','2'),(819,170,'','submissionFileId','45'),(820,170,'','submissionId','6'),(821,170,'','username','dbernnard'),(822,173,'','fileId','27'),(823,173,'en','filename','chapter4.pdf'),(824,173,'','fileStage','19'),(825,173,'','sourceSubmissionFileId','45'),(826,173,'','submissionFileId','46'),(827,173,'','submissionId','6'),(828,173,'','username','dbarnes'),(829,174,'','fileId','27'),(830,174,'en','filename','chapter4.pdf'),(831,174,'','fileStage','19'),(832,174,'','sourceSubmissionFileId','45'),(833,174,'','submissionFileId','46'),(834,174,'','submissionId','6'),(835,174,'','username','dbarnes'),(836,175,'','fileId','26'),(837,175,'en','filename','chapter3.pdf'),(838,175,'','fileStage','19'),(839,175,'','sourceSubmissionFileId','44'),(840,175,'','submissionFileId','47'),(841,175,'','submissionId','6'),(842,175,'','username','dbarnes'),(843,176,'','fileId','26'),(844,176,'en','filename','chapter3.pdf'),(845,176,'','fileStage','19'),(846,176,'','sourceSubmissionFileId','44'),(847,176,'','submissionFileId','47'),(848,176,'','submissionId','6'),(849,176,'','username','dbarnes'),(850,177,'','fileId','25'),(851,177,'en','filename','chapter2.pdf'),(852,177,'','fileStage','19'),(853,177,'','sourceSubmissionFileId','43'),(854,177,'','submissionFileId','48'),(855,177,'','submissionId','6'),(856,177,'','username','dbarnes'),(857,178,'','fileId','25'),(858,178,'en','filename','chapter2.pdf'),(859,178,'','fileStage','19'),(860,178,'','sourceSubmissionFileId','43'),(861,178,'','submissionFileId','48'),(862,178,'','submissionId','6'),(863,178,'','username','dbarnes'),(864,179,'','fileId','24'),(865,179,'en','filename','chapter1.pdf'),(866,179,'','fileStage','19'),(867,179,'','sourceSubmissionFileId','42'),(868,179,'','submissionFileId','49'),(869,179,'','submissionId','6'),(870,179,'','username','dbarnes'),(871,180,'','fileId','24'),(872,180,'en','filename','chapter1.pdf'),(873,180,'','fileStage','19'),(874,180,'','sourceSubmissionFileId','42'),(875,180,'','submissionFileId','49'),(876,180,'','submissionId','6'),(877,180,'','username','dbarnes'),(878,181,'','userFullName','Daniel Barnes'),(879,181,'en','userGroupName','Press editor'),(880,181,'fr_CA','userGroupName','Rédacteur/Rédactrice en chef de la presse'),(881,181,'','username','dbarnes'),(882,182,'','userFullName','Minoti Inoue'),(883,182,'en','userGroupName','Series editor'),(884,182,'fr_CA','userGroupName','Rédacteur/Rédactrice en chef de la série'),(885,182,'','username','minoue'),(886,186,'','fileId','28'),(887,186,'en','filename','intro.pdf'),(888,186,'','fileStage','2'),(889,186,'','submissionFileId','50'),(890,186,'','submissionId','7'),(891,186,'','username','dkennepohl'),(892,187,'','fileId','28'),(893,187,'en','filename','intro.pdf'),(894,187,'','fileStage','2'),(895,187,'','submissionFileId','50'),(896,187,'','submissionId','7'),(897,187,'','username','dkennepohl'),(898,188,'','fileId','28'),(899,188,'en','filename','intro.pdf'),(900,188,'','fileStage','2'),(901,188,'','submissionFileId','50'),(902,188,'','submissionId','7'),(903,188,'','username','dkennepohl'),(904,189,'','fileId','29'),(905,189,'en','filename','chapter1.pdf'),(906,189,'','fileStage','2'),(907,189,'','submissionFileId','51'),(908,189,'','submissionId','7'),(909,189,'','username','dkennepohl'),(910,190,'','fileId','29'),(911,190,'en','filename','chapter1.pdf'),(912,190,'','fileStage','2'),(913,190,'','submissionFileId','51'),(914,190,'','submissionId','7'),(915,190,'','username','dkennepohl'),(916,191,'','fileId','29'),(917,191,'en','filename','chapter1.pdf'),(918,191,'','fileStage','2'),(919,191,'','submissionFileId','51'),(920,191,'','submissionId','7'),(921,191,'','username','dkennepohl'),(922,192,'','fileId','30'),(923,192,'en','filename','chapter2.pdf'),(924,192,'','fileStage','2'),(925,192,'','submissionFileId','52'),(926,192,'','submissionId','7'),(927,192,'','username','dkennepohl'),(928,193,'','fileId','30'),(929,193,'en','filename','chapter2.pdf'),(930,193,'','fileStage','2'),(931,193,'','submissionFileId','52'),(932,193,'','submissionId','7'),(933,193,'','username','dkennepohl'),(934,194,'','fileId','30'),(935,194,'en','filename','chapter2.pdf'),(936,194,'','fileStage','2'),(937,194,'','submissionFileId','52'),(938,194,'','submissionId','7'),(939,194,'','username','dkennepohl'),(940,195,'','fileId','31'),(941,195,'en','filename','chapter3.pdf'),(942,195,'','fileStage','2'),(943,195,'','submissionFileId','53'),(944,195,'','submissionId','7'),(945,195,'','username','dkennepohl'),(946,196,'','fileId','31'),(947,196,'en','filename','chapter3.pdf'),(948,196,'','fileStage','2'),(949,196,'','submissionFileId','53'),(950,196,'','submissionId','7'),(951,196,'','username','dkennepohl'),(952,197,'','fileId','31'),(953,197,'en','filename','chapter3.pdf'),(954,197,'','fileStage','2'),(955,197,'','submissionFileId','53'),(956,197,'','submissionId','7'),(957,197,'','username','dkennepohl'),(958,198,'','fileId','32'),(959,198,'en','filename','chapter4.pdf'),(960,198,'','fileStage','2'),(961,198,'','submissionFileId','54'),(962,198,'','submissionId','7'),(963,198,'','username','dkennepohl'),(964,199,'','fileId','32'),(965,199,'en','filename','chapter4.pdf'),(966,199,'','fileStage','2'),(967,199,'','submissionFileId','54'),(968,199,'','submissionId','7'),(969,199,'','username','dkennepohl'),(970,200,'','fileId','32'),(971,200,'en','filename','chapter4.pdf'),(972,200,'','fileStage','2'),(973,200,'','submissionFileId','54'),(974,200,'','submissionId','7'),(975,200,'','username','dkennepohl'),(976,203,'','fileId','32'),(977,203,'en','filename','chapter4.pdf'),(978,203,'','fileStage','4'),(979,203,'','sourceSubmissionFileId','54'),(980,203,'','submissionFileId','55'),(981,203,'','submissionId','7'),(982,203,'','username','dbarnes'),(983,204,'','fileId','32'),(984,204,'en','filename','chapter4.pdf'),(985,204,'','fileStage','4'),(986,204,'','sourceSubmissionFileId','54'),(987,204,'','submissionFileId','55'),(988,204,'','submissionId','7'),(989,204,'','username','dbarnes'),(990,205,'','fileId','31'),(991,205,'en','filename','chapter3.pdf'),(992,205,'','fileStage','4'),(993,205,'','sourceSubmissionFileId','53'),(994,205,'','submissionFileId','56'),(995,205,'','submissionId','7'),(996,205,'','username','dbarnes'),(997,206,'','fileId','31'),(998,206,'en','filename','chapter3.pdf'),(999,206,'','fileStage','4'),(1000,206,'','sourceSubmissionFileId','53'),(1001,206,'','submissionFileId','56'),(1002,206,'','submissionId','7'),(1003,206,'','username','dbarnes'),(1004,207,'','fileId','30'),(1005,207,'en','filename','chapter2.pdf'),(1006,207,'','fileStage','4'),(1007,207,'','sourceSubmissionFileId','52'),(1008,207,'','submissionFileId','57'),(1009,207,'','submissionId','7'),(1010,207,'','username','dbarnes'),(1011,208,'','fileId','30'),(1012,208,'en','filename','chapter2.pdf'),(1013,208,'','fileStage','4'),(1014,208,'','sourceSubmissionFileId','52'),(1015,208,'','submissionFileId','57'),(1016,208,'','submissionId','7'),(1017,208,'','username','dbarnes'),(1018,209,'','fileId','29'),(1019,209,'en','filename','chapter1.pdf'),(1020,209,'','fileStage','4'),(1021,209,'','sourceSubmissionFileId','51'),(1022,209,'','submissionFileId','58'),(1023,209,'','submissionId','7'),(1024,209,'','username','dbarnes'),(1025,210,'','fileId','29'),(1026,210,'en','filename','chapter1.pdf'),(1027,210,'','fileStage','4'),(1028,210,'','sourceSubmissionFileId','51'),(1029,210,'','submissionFileId','58'),(1030,210,'','submissionId','7'),(1031,210,'','username','dbarnes'),(1032,211,'','fileId','28'),(1033,211,'en','filename','intro.pdf'),(1034,211,'','fileStage','4'),(1035,211,'','sourceSubmissionFileId','50'),(1036,211,'','submissionFileId','59'),(1037,211,'','submissionId','7'),(1038,211,'','username','dbarnes'),(1039,212,'','fileId','28'),(1040,212,'en','filename','intro.pdf'),(1041,212,'','fileStage','4'),(1042,212,'','sourceSubmissionFileId','50'),(1043,212,'','submissionFileId','59'),(1044,212,'','submissionId','7'),(1045,212,'','username','dbarnes'),(1046,213,'','reviewerName','Adela Gallego'),(1047,213,'','round','1'),(1048,213,'','stageId','3'),(1049,213,'','submissionId','7'),(1050,215,'','userFullName','Maria Fritz'),(1051,215,'en','userGroupName','Copyeditor'),(1052,215,'fr_CA','userGroupName','Réviseur-e'),(1053,215,'','username','mfritz'),(1054,217,'','fileId','33'),(1055,217,'en','filename','note.pdf'),(1056,217,'','fileStage','2'),(1057,217,'','submissionFileId','60'),(1058,217,'','submissionId','8'),(1059,217,'','username','dbarnes'),(1060,218,'','fileId','33'),(1061,218,'en','filename','note.pdf'),(1062,218,'','fileStage','2'),(1063,218,'','submissionFileId','60'),(1064,218,'','submissionId','8'),(1065,218,'','username','dbarnes'),(1066,219,'','fileId','33'),(1067,219,'en','filename','note.pdf'),(1068,219,'','fileStage','2'),(1069,219,'','submissionFileId','60'),(1070,219,'','submissionId','8'),(1071,219,'','username','dbarnes'),(1072,223,'','fileId','34'),(1073,223,'en','filename','chapter1.pdf'),(1074,223,'','fileStage','2'),(1075,223,'','submissionFileId','61'),(1076,223,'','submissionId','9'),(1077,223,'','username','fperini'),(1078,224,'','fileId','34'),(1079,224,'en','filename','chapter1.pdf'),(1080,224,'','fileStage','2'),(1081,224,'','submissionFileId','61'),(1082,224,'','submissionId','9'),(1083,224,'','username','fperini'),(1084,225,'','fileId','34'),(1085,225,'en','filename','chapter1.pdf'),(1086,225,'','fileStage','2'),(1087,225,'','submissionFileId','61'),(1088,225,'','submissionId','9'),(1089,225,'','username','fperini'),(1090,226,'','fileId','35'),(1091,226,'en','filename','chapter2.pdf'),(1092,226,'','fileStage','2'),(1093,226,'','submissionFileId','62'),(1094,226,'','submissionId','9'),(1095,226,'','username','fperini'),(1096,227,'','fileId','35'),(1097,227,'en','filename','chapter2.pdf'),(1098,227,'','fileStage','2'),(1099,227,'','submissionFileId','62'),(1100,227,'','submissionId','9'),(1101,227,'','username','fperini'),(1102,228,'','fileId','35'),(1103,228,'en','filename','chapter2.pdf'),(1104,228,'','fileStage','2'),(1105,228,'','submissionFileId','62'),(1106,228,'','submissionId','9'),(1107,228,'','username','fperini'),(1108,229,'','fileId','36'),(1109,229,'en','filename','chapter3.pdf'),(1110,229,'','fileStage','2'),(1111,229,'','submissionFileId','63'),(1112,229,'','submissionId','9'),(1113,229,'','username','fperini'),(1114,230,'','fileId','36'),(1115,230,'en','filename','chapter3.pdf'),(1116,230,'','fileStage','2'),(1117,230,'','submissionFileId','63'),(1118,230,'','submissionId','9'),(1119,230,'','username','fperini'),(1120,231,'','fileId','36'),(1121,231,'en','filename','chapter3.pdf'),(1122,231,'','fileStage','2'),(1123,231,'','submissionFileId','63'),(1124,231,'','submissionId','9'),(1125,231,'','username','fperini'),(1126,232,'','fileId','37'),(1127,232,'en','filename','chapter4.pdf'),(1128,232,'','fileStage','2'),(1129,232,'','submissionFileId','64'),(1130,232,'','submissionId','9'),(1131,232,'','username','fperini'),(1132,233,'','fileId','37'),(1133,233,'en','filename','chapter4.pdf'),(1134,233,'','fileStage','2'),(1135,233,'','submissionFileId','64'),(1136,233,'','submissionId','9'),(1137,233,'','username','fperini'),(1138,234,'','fileId','37'),(1139,234,'en','filename','chapter4.pdf'),(1140,234,'','fileStage','2'),(1141,234,'','submissionFileId','64'),(1142,234,'','submissionId','9'),(1143,234,'','username','fperini'),(1144,235,'','fileId','38'),(1145,235,'en','filename','chapter5.pdf'),(1146,235,'','fileStage','2'),(1147,235,'','submissionFileId','65'),(1148,235,'','submissionId','9'),(1149,235,'','username','fperini'),(1150,236,'','fileId','38'),(1151,236,'en','filename','chapter5.pdf'),(1152,236,'','fileStage','2'),(1153,236,'','submissionFileId','65'),(1154,236,'','submissionId','9'),(1155,236,'','username','fperini'),(1156,237,'','fileId','38'),(1157,237,'en','filename','chapter5.pdf'),(1158,237,'','fileStage','2'),(1159,237,'','submissionFileId','65'),(1160,237,'','submissionId','9'),(1161,237,'','username','fperini'),(1162,240,'','fileId','38'),(1163,240,'en','filename','chapter5.pdf'),(1164,240,'','fileStage','19'),(1165,240,'','sourceSubmissionFileId','65'),(1166,240,'','submissionFileId','66'),(1167,240,'','submissionId','9'),(1168,240,'','username','dbarnes'),(1169,241,'','fileId','38'),(1170,241,'en','filename','chapter5.pdf'),(1171,241,'','fileStage','19'),(1172,241,'','sourceSubmissionFileId','65'),(1173,241,'','submissionFileId','66'),(1174,241,'','submissionId','9'),(1175,241,'','username','dbarnes'),(1176,242,'','fileId','37'),(1177,242,'en','filename','chapter4.pdf'),(1178,242,'','fileStage','19'),(1179,242,'','sourceSubmissionFileId','64'),(1180,242,'','submissionFileId','67'),(1181,242,'','submissionId','9'),(1182,242,'','username','dbarnes'),(1183,243,'','fileId','37'),(1184,243,'en','filename','chapter4.pdf'),(1185,243,'','fileStage','19'),(1186,243,'','sourceSubmissionFileId','64'),(1187,243,'','submissionFileId','67'),(1188,243,'','submissionId','9'),(1189,243,'','username','dbarnes'),(1190,244,'','fileId','36'),(1191,244,'en','filename','chapter3.pdf'),(1192,244,'','fileStage','19'),(1193,244,'','sourceSubmissionFileId','63'),(1194,244,'','submissionFileId','68'),(1195,244,'','submissionId','9'),(1196,244,'','username','dbarnes'),(1197,245,'','fileId','36'),(1198,245,'en','filename','chapter3.pdf'),(1199,245,'','fileStage','19'),(1200,245,'','sourceSubmissionFileId','63'),(1201,245,'','submissionFileId','68'),(1202,245,'','submissionId','9'),(1203,245,'','username','dbarnes'),(1204,246,'','fileId','35'),(1205,246,'en','filename','chapter2.pdf'),(1206,246,'','fileStage','19'),(1207,246,'','sourceSubmissionFileId','62'),(1208,246,'','submissionFileId','69'),(1209,246,'','submissionId','9'),(1210,246,'','username','dbarnes'),(1211,247,'','fileId','35'),(1212,247,'en','filename','chapter2.pdf'),(1213,247,'','fileStage','19'),(1214,247,'','sourceSubmissionFileId','62'),(1215,247,'','submissionFileId','69'),(1216,247,'','submissionId','9'),(1217,247,'','username','dbarnes'),(1218,248,'','fileId','34'),(1219,248,'en','filename','chapter1.pdf'),(1220,248,'','fileStage','19'),(1221,248,'','sourceSubmissionFileId','61'),(1222,248,'','submissionFileId','70'),(1223,248,'','submissionId','9'),(1224,248,'','username','dbarnes'),(1225,249,'','fileId','34'),(1226,249,'en','filename','chapter1.pdf'),(1227,249,'','fileStage','19'),(1228,249,'','sourceSubmissionFileId','61'),(1229,249,'','submissionFileId','70'),(1230,249,'','submissionId','9'),(1231,249,'','username','dbarnes'),(1232,252,'','fileId','39'),(1233,252,'en','filename','intro.pdf'),(1234,252,'','fileStage','2'),(1235,252,'','submissionFileId','71'),(1236,252,'','submissionId','10'),(1237,252,'','username','jbrower'),(1238,253,'','fileId','39'),(1239,253,'en','filename','intro.pdf'),(1240,253,'','fileStage','2'),(1241,253,'','submissionFileId','71'),(1242,253,'','submissionId','10'),(1243,253,'','username','jbrower'),(1244,254,'','fileId','39'),(1245,254,'en','filename','intro.pdf'),(1246,254,'','fileStage','2'),(1247,254,'','submissionFileId','71'),(1248,254,'','submissionId','10'),(1249,254,'','username','jbrower'),(1250,255,'','fileId','40'),(1251,255,'en','filename','chapter1.pdf'),(1252,255,'','fileStage','2'),(1253,255,'','submissionFileId','72'),(1254,255,'','submissionId','10'),(1255,255,'','username','jbrower'),(1256,256,'','fileId','40'),(1257,256,'en','filename','chapter1.pdf'),(1258,256,'','fileStage','2'),(1259,256,'','submissionFileId','72'),(1260,256,'','submissionId','10'),(1261,256,'','username','jbrower'),(1262,257,'','fileId','40'),(1263,257,'en','filename','chapter1.pdf'),(1264,257,'','fileStage','2'),(1265,257,'','submissionFileId','72'),(1266,257,'','submissionId','10'),(1267,257,'','username','jbrower'),(1268,258,'','fileId','41'),(1269,258,'en','filename','chapter2.pdf'),(1270,258,'','fileStage','2'),(1271,258,'','submissionFileId','73'),(1272,258,'','submissionId','10'),(1273,258,'','username','jbrower'),(1274,259,'','fileId','41'),(1275,259,'en','filename','chapter2.pdf'),(1276,259,'','fileStage','2'),(1277,259,'','submissionFileId','73'),(1278,259,'','submissionId','10'),(1279,259,'','username','jbrower'),(1280,260,'','fileId','41'),(1281,260,'en','filename','chapter2.pdf'),(1282,260,'','fileStage','2'),(1283,260,'','submissionFileId','73'),(1284,260,'','submissionId','10'),(1285,260,'','username','jbrower'),(1286,261,'','fileId','42'),(1287,261,'en','filename','chapter3.pdf'),(1288,261,'','fileStage','2'),(1289,261,'','submissionFileId','74'),(1290,261,'','submissionId','10'),(1291,261,'','username','jbrower'),(1292,262,'','fileId','42'),(1293,262,'en','filename','chapter3.pdf'),(1294,262,'','fileStage','2'),(1295,262,'','submissionFileId','74'),(1296,262,'','submissionId','10'),(1297,262,'','username','jbrower'),(1298,263,'','fileId','42'),(1299,263,'en','filename','chapter3.pdf'),(1300,263,'','fileStage','2'),(1301,263,'','submissionFileId','74'),(1302,263,'','submissionId','10'),(1303,263,'','username','jbrower'),(1304,264,'','fileId','43'),(1305,264,'en','filename','chapter4.pdf'),(1306,264,'','fileStage','2'),(1307,264,'','submissionFileId','75'),(1308,264,'','submissionId','10'),(1309,264,'','username','jbrower'),(1310,265,'','fileId','43'),(1311,265,'en','filename','chapter4.pdf'),(1312,265,'','fileStage','2'),(1313,265,'','submissionFileId','75'),(1314,265,'','submissionId','10'),(1315,265,'','username','jbrower'),(1316,266,'','fileId','43'),(1317,266,'en','filename','chapter4.pdf'),(1318,266,'','fileStage','2'),(1319,266,'','submissionFileId','75'),(1320,266,'','submissionId','10'),(1321,266,'','username','jbrower'),(1322,267,'','fileId','44'),(1323,267,'en','filename','chapter5.pdf'),(1324,267,'','fileStage','2'),(1325,267,'','submissionFileId','76'),(1326,267,'','submissionId','10'),(1327,267,'','username','jbrower'),(1328,268,'','fileId','44'),(1329,268,'en','filename','chapter5.pdf'),(1330,268,'','fileStage','2'),(1331,268,'','submissionFileId','76'),(1332,268,'','submissionId','10'),(1333,268,'','username','jbrower'),(1334,269,'','fileId','44'),(1335,269,'en','filename','chapter5.pdf'),(1336,269,'','fileStage','2'),(1337,269,'','submissionFileId','76'),(1338,269,'','submissionId','10'),(1339,269,'','username','jbrower'),(1340,270,'','fileId','45'),(1341,270,'en','filename','conclusion.pdf'),(1342,270,'','fileStage','2'),(1343,270,'','submissionFileId','77'),(1344,270,'','submissionId','10'),(1345,270,'','username','jbrower'),(1346,271,'','fileId','45'),(1347,271,'en','filename','conclusion.pdf'),(1348,271,'','fileStage','2'),(1349,271,'','submissionFileId','77'),(1350,271,'','submissionId','10'),(1351,271,'','username','jbrower'),(1352,272,'','fileId','45'),(1353,272,'en','filename','conclusion.pdf'),(1354,272,'','fileStage','2'),(1355,272,'','submissionFileId','77'),(1356,272,'','submissionId','10'),(1357,272,'','username','jbrower'),(1358,273,'','fileId','46'),(1359,273,'en','filename','bibliography.pdf'),(1360,273,'','fileStage','2'),(1361,273,'','submissionFileId','78'),(1362,273,'','submissionId','10'),(1363,273,'','username','jbrower'),(1364,274,'','fileId','46'),(1365,274,'en','filename','bibliography.pdf'),(1366,274,'','fileStage','2'),(1367,274,'','submissionFileId','78'),(1368,274,'','submissionId','10'),(1369,274,'','username','jbrower'),(1370,275,'','fileId','46'),(1371,275,'en','filename','bibliography.pdf'),(1372,275,'','fileStage','2'),(1373,275,'','submissionFileId','78'),(1374,275,'','submissionId','10'),(1375,275,'','username','jbrower'),(1376,276,'','fileId','47'),(1377,276,'en','filename','index.pdf'),(1378,276,'','fileStage','2'),(1379,276,'','submissionFileId','79'),(1380,276,'','submissionId','10'),(1381,276,'','username','jbrower'),(1382,277,'','fileId','47'),(1383,277,'en','filename','index.pdf'),(1384,277,'','fileStage','2'),(1385,277,'','submissionFileId','79'),(1386,277,'','submissionId','10'),(1387,277,'','username','jbrower'),(1388,278,'','fileId','47'),(1389,278,'en','filename','index.pdf'),(1390,278,'','fileStage','2'),(1391,278,'','submissionFileId','79'),(1392,278,'','submissionId','10'),(1393,278,'','username','jbrower'),(1394,282,'','fileId','48'),(1395,282,'en','filename','intro.pdf'),(1396,282,'','fileStage','2'),(1397,282,'','submissionFileId','80'),(1398,282,'','submissionId','11'),(1399,282,'','username','jlockehart'),(1400,283,'','fileId','48'),(1401,283,'en','filename','intro.pdf'),(1402,283,'','fileStage','2'),(1403,283,'','submissionFileId','80'),(1404,283,'','submissionId','11'),(1405,283,'','username','jlockehart'),(1406,284,'','fileId','48'),(1407,284,'en','filename','intro.pdf'),(1408,284,'','fileStage','2'),(1409,284,'','submissionFileId','80'),(1410,284,'','submissionId','11'),(1411,284,'','username','jlockehart'),(1412,285,'','fileId','49'),(1413,285,'en','filename','poems.pdf'),(1414,285,'','fileStage','2'),(1415,285,'','submissionFileId','81'),(1416,285,'','submissionId','11'),(1417,285,'','username','jlockehart'),(1418,286,'','fileId','49'),(1419,286,'en','filename','poems.pdf'),(1420,286,'','fileStage','2'),(1421,286,'','submissionFileId','81'),(1422,286,'','submissionId','11'),(1423,286,'','username','jlockehart'),(1424,287,'','fileId','49'),(1425,287,'en','filename','poems.pdf'),(1426,287,'','fileStage','2'),(1427,287,'','submissionFileId','81'),(1428,287,'','submissionId','11'),(1429,287,'','username','jlockehart'),(1430,290,'','fileId','49'),(1431,290,'en','filename','poems.pdf'),(1432,290,'','fileStage','19'),(1433,290,'','sourceSubmissionFileId','81'),(1434,290,'','submissionFileId','82'),(1435,290,'','submissionId','11'),(1436,290,'','username','dbarnes'),(1437,291,'','fileId','49'),(1438,291,'en','filename','poems.pdf'),(1439,291,'','fileStage','19'),(1440,291,'','sourceSubmissionFileId','81'),(1441,291,'','submissionFileId','82'),(1442,291,'','submissionId','11'),(1443,291,'','username','dbarnes'),(1444,292,'','fileId','48'),(1445,292,'en','filename','intro.pdf'),(1446,292,'','fileStage','19'),(1447,292,'','sourceSubmissionFileId','80'),(1448,292,'','submissionFileId','83'),(1449,292,'','submissionId','11'),(1450,292,'','username','dbarnes'),(1451,293,'','fileId','48'),(1452,293,'en','filename','intro.pdf'),(1453,293,'','fileStage','19'),(1454,293,'','sourceSubmissionFileId','80'),(1455,293,'','submissionFileId','83'),(1456,293,'','submissionId','11'),(1457,293,'','username','dbarnes'),(1458,294,'','reviewerName','Aisla McCrae'),(1459,294,'','round','1'),(1460,294,'','stageId','2'),(1461,294,'','submissionId','11'),(1462,296,'','reviewerName','Adela Gallego'),(1463,296,'','round','1'),(1464,296,'','stageId','3'),(1465,296,'','submissionId','11'),(1466,297,'','reviewerName','Gonzalo Favio'),(1467,297,'','round','1'),(1468,297,'','stageId','3'),(1469,297,'','submissionId','11'),(1470,298,'','reviewAssignmentId','10'),(1471,298,'','reviewerName','Adela Gallego'),(1472,298,'','round','1'),(1473,298,'','submissionId','11'),(1474,299,'','reviewAssignmentId','10'),(1475,299,'','reviewerName','Adela Gallego'),(1476,299,'','round','1'),(1477,299,'','submissionId','11'),(1478,300,'','reviewAssignmentId','11'),(1479,300,'','reviewerName','Gonzalo Favio'),(1480,300,'','round','1'),(1481,300,'','submissionId','11'),(1482,301,'','reviewAssignmentId','11'),(1483,301,'','reviewerName','Gonzalo Favio'),(1484,301,'','round','1'),(1485,301,'','submissionId','11'),(1486,303,'','recipientCount','2'),(1487,303,'','subject','Thank you for your review'),(1488,306,'','fileId','50'),(1489,306,'en','filename','chapter1.pdf'),(1490,306,'','fileStage','2'),(1491,306,'','submissionFileId','84'),(1492,306,'','submissionId','12'),(1493,306,'','username','lelder'),(1494,307,'','fileId','50'),(1495,307,'en','filename','chapter1.pdf'),(1496,307,'','fileStage','2'),(1497,307,'','submissionFileId','84'),(1498,307,'','submissionId','12'),(1499,307,'','username','lelder'),(1500,308,'','fileId','50'),(1501,308,'en','filename','chapter1.pdf'),(1502,308,'','fileStage','2'),(1503,308,'','submissionFileId','84'),(1504,308,'','submissionId','12'),(1505,308,'','username','lelder'),(1506,309,'','fileId','51'),(1507,309,'en','filename','chapter2.pdf'),(1508,309,'','fileStage','2'),(1509,309,'','submissionFileId','85'),(1510,309,'','submissionId','12'),(1511,309,'','username','lelder'),(1512,310,'','fileId','51'),(1513,310,'en','filename','chapter2.pdf'),(1514,310,'','fileStage','2'),(1515,310,'','submissionFileId','85'),(1516,310,'','submissionId','12'),(1517,310,'','username','lelder'),(1518,311,'','fileId','51'),(1519,311,'en','filename','chapter2.pdf'),(1520,311,'','fileStage','2'),(1521,311,'','submissionFileId','85'),(1522,311,'','submissionId','12'),(1523,311,'','username','lelder'),(1524,312,'','fileId','52'),(1525,312,'en','filename','chapter3.pdf'),(1526,312,'','fileStage','2'),(1527,312,'','submissionFileId','86'),(1528,312,'','submissionId','12'),(1529,312,'','username','lelder'),(1530,313,'','fileId','52'),(1531,313,'en','filename','chapter3.pdf'),(1532,313,'','fileStage','2'),(1533,313,'','submissionFileId','86'),(1534,313,'','submissionId','12'),(1535,313,'','username','lelder'),(1536,314,'','fileId','52'),(1537,314,'en','filename','chapter3.pdf'),(1538,314,'','fileStage','2'),(1539,314,'','submissionFileId','86'),(1540,314,'','submissionId','12'),(1541,314,'','username','lelder'),(1542,317,'','fileId','52'),(1543,317,'en','filename','chapter3.pdf'),(1544,317,'','fileStage','19'),(1545,317,'','sourceSubmissionFileId','86'),(1546,317,'','submissionFileId','87'),(1547,317,'','submissionId','12'),(1548,317,'','username','dbarnes'),(1549,318,'','fileId','52'),(1550,318,'en','filename','chapter3.pdf'),(1551,318,'','fileStage','19'),(1552,318,'','sourceSubmissionFileId','86'),(1553,318,'','submissionFileId','87'),(1554,318,'','submissionId','12'),(1555,318,'','username','dbarnes'),(1556,319,'','fileId','51'),(1557,319,'en','filename','chapter2.pdf'),(1558,319,'','fileStage','19'),(1559,319,'','sourceSubmissionFileId','85'),(1560,319,'','submissionFileId','88'),(1561,319,'','submissionId','12'),(1562,319,'','username','dbarnes'),(1563,320,'','fileId','51'),(1564,320,'en','filename','chapter2.pdf'),(1565,320,'','fileStage','19'),(1566,320,'','sourceSubmissionFileId','85'),(1567,320,'','submissionFileId','88'),(1568,320,'','submissionId','12'),(1569,320,'','username','dbarnes'),(1570,321,'','fileId','50'),(1571,321,'en','filename','chapter1.pdf'),(1572,321,'','fileStage','19'),(1573,321,'','sourceSubmissionFileId','84'),(1574,321,'','submissionFileId','89'),(1575,321,'','submissionId','12'),(1576,321,'','username','dbarnes'),(1577,322,'','fileId','50'),(1578,322,'en','filename','chapter1.pdf'),(1579,322,'','fileStage','19'),(1580,322,'','sourceSubmissionFileId','84'),(1581,322,'','submissionFileId','89'),(1582,322,'','submissionId','12'),(1583,322,'','username','dbarnes'),(1584,323,'','reviewerName','Julie Janssen'),(1585,323,'','round','1'),(1586,323,'','stageId','2'),(1587,323,'','submissionId','12'),(1588,324,'','reviewerName','Paul Hudson'),(1589,324,'','round','1'),(1590,324,'','stageId','2'),(1591,324,'','submissionId','12'),(1592,325,'','reviewerName','Aisla McCrae'),(1593,325,'','round','1'),(1594,325,'','stageId','2'),(1595,325,'','submissionId','12'),(1596,326,'','reviewAssignmentId','13'),(1597,326,'','reviewerName','Paul Hudson'),(1598,326,'','round','1'),(1599,326,'','submissionId','12'),(1600,327,'','reviewAssignmentId','13'),(1601,327,'','reviewerName','Paul Hudson'),(1602,327,'','round','1'),(1603,327,'','submissionId','12'),(1604,330,'','fileId','53'),(1605,330,'en','filename','chapter1.pdf'),(1606,330,'','fileStage','2'),(1607,330,'','submissionFileId','90'),(1608,330,'','submissionId','13'),(1609,330,'','username','mally'),(1610,331,'','fileId','53'),(1611,331,'en','filename','chapter1.pdf'),(1612,331,'','fileStage','2'),(1613,331,'','submissionFileId','90'),(1614,331,'','submissionId','13'),(1615,331,'','username','mally'),(1616,332,'','fileId','53'),(1617,332,'en','filename','chapter1.pdf'),(1618,332,'','fileStage','2'),(1619,332,'','submissionFileId','90'),(1620,332,'','submissionId','13'),(1621,332,'','username','mally'),(1622,333,'','fileId','54'),(1623,333,'en','filename','chapter2.pdf'),(1624,333,'','fileStage','2'),(1625,333,'','submissionFileId','91'),(1626,333,'','submissionId','13'),(1627,333,'','username','mally'),(1628,334,'','fileId','54'),(1629,334,'en','filename','chapter2.pdf'),(1630,334,'','fileStage','2'),(1631,334,'','submissionFileId','91'),(1632,334,'','submissionId','13'),(1633,334,'','username','mally'),(1634,335,'','fileId','54'),(1635,335,'en','filename','chapter2.pdf'),(1636,335,'','fileStage','2'),(1637,335,'','submissionFileId','91'),(1638,335,'','submissionId','13'),(1639,335,'','username','mally'),(1640,336,'','fileId','55'),(1641,336,'en','filename','chapter3.pdf'),(1642,336,'','fileStage','2'),(1643,336,'','submissionFileId','92'),(1644,336,'','submissionId','13'),(1645,336,'','username','mally'),(1646,337,'','fileId','55'),(1647,337,'en','filename','chapter3.pdf'),(1648,337,'','fileStage','2'),(1649,337,'','submissionFileId','92'),(1650,337,'','submissionId','13'),(1651,337,'','username','mally'),(1652,338,'','fileId','55'),(1653,338,'en','filename','chapter3.pdf'),(1654,338,'','fileStage','2'),(1655,338,'','submissionFileId','92'),(1656,338,'','submissionId','13'),(1657,338,'','username','mally'),(1658,341,'','fileId','55'),(1659,341,'en','filename','chapter3.pdf'),(1660,341,'','fileStage','19'),(1661,341,'','sourceSubmissionFileId','92'),(1662,341,'','submissionFileId','93'),(1663,341,'','submissionId','13'),(1664,341,'','username','dbarnes'),(1665,342,'','fileId','55'),(1666,342,'en','filename','chapter3.pdf'),(1667,342,'','fileStage','19'),(1668,342,'','sourceSubmissionFileId','92'),(1669,342,'','submissionFileId','93'),(1670,342,'','submissionId','13'),(1671,342,'','username','dbarnes'),(1672,343,'','fileId','54'),(1673,343,'en','filename','chapter2.pdf'),(1674,343,'','fileStage','19'),(1675,343,'','sourceSubmissionFileId','91'),(1676,343,'','submissionFileId','94'),(1677,343,'','submissionId','13'),(1678,343,'','username','dbarnes'),(1679,344,'','fileId','54'),(1680,344,'en','filename','chapter2.pdf'),(1681,344,'','fileStage','19'),(1682,344,'','sourceSubmissionFileId','91'),(1683,344,'','submissionFileId','94'),(1684,344,'','submissionId','13'),(1685,344,'','username','dbarnes'),(1686,345,'','fileId','53'),(1687,345,'en','filename','chapter1.pdf'),(1688,345,'','fileStage','19'),(1689,345,'','sourceSubmissionFileId','90'),(1690,345,'','submissionFileId','95'),(1691,345,'','submissionId','13'),(1692,345,'','username','dbarnes'),(1693,346,'','fileId','53'),(1694,346,'en','filename','chapter1.pdf'),(1695,346,'','fileStage','19'),(1696,346,'','sourceSubmissionFileId','90'),(1697,346,'','submissionFileId','95'),(1698,346,'','submissionId','13'),(1699,346,'','username','dbarnes'),(1700,347,'','reviewerName','Paul Hudson'),(1701,347,'','round','1'),(1702,347,'','stageId','2'),(1703,347,'','submissionId','13'),(1704,349,'','reviewerName','Adela Gallego'),(1705,349,'','round','1'),(1706,349,'','stageId','3'),(1707,349,'','submissionId','13'),(1708,350,'','reviewerName','Al Zacharia'),(1709,350,'','round','1'),(1710,350,'','stageId','3'),(1711,350,'','submissionId','13'),(1712,351,'','reviewerName','Gonzalo Favio'),(1713,351,'','round','1'),(1714,351,'','stageId','3'),(1715,351,'','submissionId','13'),(1716,352,'','reviewAssignmentId','16'),(1717,352,'','reviewerName','Adela Gallego'),(1718,352,'','round','1'),(1719,352,'','submissionId','13'),(1720,353,'','reviewAssignmentId','16'),(1721,353,'','reviewerName','Adela Gallego'),(1722,353,'','round','1'),(1723,353,'','submissionId','13'),(1724,354,'','reviewAssignmentId','18'),(1725,354,'','reviewerName','Gonzalo Favio'),(1726,354,'','round','1'),(1727,354,'','submissionId','13'),(1728,355,'','reviewAssignmentId','18'),(1729,355,'','reviewerName','Gonzalo Favio'),(1730,355,'','round','1'),(1731,355,'','submissionId','13'),(1732,357,'','recipientCount','2'),(1733,357,'','subject','Thank you for your review'),(1734,360,'','fileId','56'),(1735,360,'en','filename','chapter1.pdf'),(1736,360,'','fileStage','2'),(1737,360,'','submissionFileId','96'),(1738,360,'','submissionId','14'),(1739,360,'','username','mdawson'),(1740,361,'','fileId','56'),(1741,361,'en','filename','chapter1.pdf'),(1742,361,'','fileStage','2'),(1743,361,'','submissionFileId','96'),(1744,361,'','submissionId','14'),(1745,361,'','username','mdawson'),(1746,362,'','fileId','56'),(1747,362,'en','filename','chapter1.pdf'),(1748,362,'','fileStage','2'),(1749,362,'','submissionFileId','96'),(1750,362,'','submissionId','14'),(1751,362,'','username','mdawson'),(1752,363,'','fileId','57'),(1753,363,'en','filename','chapter2.pdf'),(1754,363,'','fileStage','2'),(1755,363,'','submissionFileId','97'),(1756,363,'','submissionId','14'),(1757,363,'','username','mdawson'),(1758,364,'','fileId','57'),(1759,364,'en','filename','chapter2.pdf'),(1760,364,'','fileStage','2'),(1761,364,'','submissionFileId','97'),(1762,364,'','submissionId','14'),(1763,364,'','username','mdawson'),(1764,365,'','fileId','57'),(1765,365,'en','filename','chapter2.pdf'),(1766,365,'','fileStage','2'),(1767,365,'','submissionFileId','97'),(1768,365,'','submissionId','14'),(1769,365,'','username','mdawson'),(1770,366,'','fileId','58'),(1771,366,'en','filename','chapter3.pdf'),(1772,366,'','fileStage','2'),(1773,366,'','submissionFileId','98'),(1774,366,'','submissionId','14'),(1775,366,'','username','mdawson'),(1776,367,'','fileId','58'),(1777,367,'en','filename','chapter3.pdf'),(1778,367,'','fileStage','2'),(1779,367,'','submissionFileId','98'),(1780,367,'','submissionId','14'),(1781,367,'','username','mdawson'),(1782,368,'','fileId','58'),(1783,368,'en','filename','chapter3.pdf'),(1784,368,'','fileStage','2'),(1785,368,'','submissionFileId','98'),(1786,368,'','submissionId','14'),(1787,368,'','username','mdawson'),(1788,369,'','fileId','59'),(1789,369,'en','filename','chapter4.pdf'),(1790,369,'','fileStage','2'),(1791,369,'','submissionFileId','99'),(1792,369,'','submissionId','14'),(1793,369,'','username','mdawson'),(1794,370,'','fileId','59'),(1795,370,'en','filename','chapter4.pdf'),(1796,370,'','fileStage','2'),(1797,370,'','submissionFileId','99'),(1798,370,'','submissionId','14'),(1799,370,'','username','mdawson'),(1800,371,'','fileId','59'),(1801,371,'en','filename','chapter4.pdf'),(1802,371,'','fileStage','2'),(1803,371,'','submissionFileId','99'),(1804,371,'','submissionId','14'),(1805,371,'','username','mdawson'),(1806,372,'','fileId','60'),(1807,372,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1808,372,'','fileStage','2'),(1809,372,'','submissionFileId','100'),(1810,372,'','submissionId','14'),(1811,372,'','username','mdawson'),(1812,373,'','fileId','60'),(1813,373,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1814,373,'','fileStage','2'),(1815,373,'','submissionFileId','100'),(1816,373,'','submissionId','14'),(1817,373,'','username','mdawson'),(1818,374,'','fileId','60'),(1819,374,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1820,374,'','fileStage','2'),(1821,374,'','submissionFileId','100'),(1822,374,'','submissionId','14'),(1823,374,'','username','mdawson'),(1824,375,'','fileId','61'),(1825,375,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1826,375,'','fileStage','2'),(1827,375,'','submissionFileId','101'),(1828,375,'','submissionId','14'),(1829,375,'','username','mdawson'),(1830,376,'','fileId','61'),(1831,376,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1832,376,'','fileStage','2'),(1833,376,'','submissionFileId','101'),(1834,376,'','submissionId','14'),(1835,376,'','username','mdawson'),(1836,377,'','fileId','61'),(1837,377,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1838,377,'','fileStage','2'),(1839,377,'','submissionFileId','101'),(1840,377,'','submissionId','14'),(1841,377,'','username','mdawson'),(1842,380,'','fileId','61'),(1843,380,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1844,380,'','fileStage','19'),(1845,380,'','sourceSubmissionFileId','101'),(1846,380,'','submissionFileId','102'),(1847,380,'','submissionId','14'),(1848,380,'','username','dbarnes'),(1849,381,'','fileId','61'),(1850,381,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1851,381,'','fileStage','19'),(1852,381,'','sourceSubmissionFileId','101'),(1853,381,'','submissionFileId','102'),(1854,381,'','submissionId','14'),(1855,381,'','username','dbarnes'),(1856,382,'','fileId','60'),(1857,382,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1858,382,'','fileStage','19'),(1859,382,'','sourceSubmissionFileId','100'),(1860,382,'','submissionFileId','103'),(1861,382,'','submissionId','14'),(1862,382,'','username','dbarnes'),(1863,383,'','fileId','60'),(1864,383,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1865,383,'','fileStage','19'),(1866,383,'','sourceSubmissionFileId','100'),(1867,383,'','submissionFileId','103'),(1868,383,'','submissionId','14'),(1869,383,'','username','dbarnes'),(1870,384,'','fileId','59'),(1871,384,'en','filename','chapter4.pdf'),(1872,384,'','fileStage','19'),(1873,384,'','sourceSubmissionFileId','99'),(1874,384,'','submissionFileId','104'),(1875,384,'','submissionId','14'),(1876,384,'','username','dbarnes'),(1877,385,'','fileId','59'),(1878,385,'en','filename','chapter4.pdf'),(1879,385,'','fileStage','19'),(1880,385,'','sourceSubmissionFileId','99'),(1881,385,'','submissionFileId','104'),(1882,385,'','submissionId','14'),(1883,385,'','username','dbarnes'),(1884,386,'','fileId','58'),(1885,386,'en','filename','chapter3.pdf'),(1886,386,'','fileStage','19'),(1887,386,'','sourceSubmissionFileId','98'),(1888,386,'','submissionFileId','105'),(1889,386,'','submissionId','14'),(1890,386,'','username','dbarnes'),(1891,387,'','fileId','58'),(1892,387,'en','filename','chapter3.pdf'),(1893,387,'','fileStage','19'),(1894,387,'','sourceSubmissionFileId','98'),(1895,387,'','submissionFileId','105'),(1896,387,'','submissionId','14'),(1897,387,'','username','dbarnes'),(1898,388,'','fileId','57'),(1899,388,'en','filename','chapter2.pdf'),(1900,388,'','fileStage','19'),(1901,388,'','sourceSubmissionFileId','97'),(1902,388,'','submissionFileId','106'),(1903,388,'','submissionId','14'),(1904,388,'','username','dbarnes'),(1905,389,'','fileId','57'),(1906,389,'en','filename','chapter2.pdf'),(1907,389,'','fileStage','19'),(1908,389,'','sourceSubmissionFileId','97'),(1909,389,'','submissionFileId','106'),(1910,389,'','submissionId','14'),(1911,389,'','username','dbarnes'),(1912,390,'','fileId','56'),(1913,390,'en','filename','chapter1.pdf'),(1914,390,'','fileStage','19'),(1915,390,'','sourceSubmissionFileId','96'),(1916,390,'','submissionFileId','107'),(1917,390,'','submissionId','14'),(1918,390,'','username','dbarnes'),(1919,391,'','fileId','56'),(1920,391,'en','filename','chapter1.pdf'),(1921,391,'','fileStage','19'),(1922,391,'','sourceSubmissionFileId','96'),(1923,391,'','submissionFileId','107'),(1924,391,'','submissionId','14'),(1925,391,'','username','dbarnes'),(1926,392,'','reviewerName','Julie Janssen'),(1927,392,'','round','1'),(1928,392,'','stageId','2'),(1929,392,'','submissionId','14'),(1930,394,'','reviewerName','Al Zacharia'),(1931,394,'','round','1'),(1932,394,'','stageId','3'),(1933,394,'','submissionId','14'),(1934,396,'','userFullName','Maria Fritz'),(1935,396,'en','userGroupName','Copyeditor'),(1936,396,'fr_CA','userGroupName','Réviseur-e'),(1937,396,'','username','mfritz'),(1938,398,'','userFullName','Graham Cox'),(1939,398,'en','userGroupName','Layout Editor'),(1940,398,'fr_CA','userGroupName','Responsable de la mise en page'),(1941,398,'','username','gcox'),(1942,399,'','userFullName','Sabine Kumar'),(1943,399,'en','userGroupName','Proofreader'),(1944,399,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),(1945,399,'','username','skumar'),(1946,400,'en','publicationFormatName','PDF'),(1947,400,'fr_CA','publicationFormatName',''),(1948,401,'','fileId','61'),(1949,401,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1950,401,'','fileStage','10'),(1951,401,'','sourceSubmissionFileId','101'),(1952,401,'','submissionFileId','108'),(1953,401,'','submissionId','14'),(1954,401,'','username','dbarnes'),(1955,402,'','fileId','61'),(1956,402,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1957,402,'','fileStage','10'),(1958,402,'','sourceSubmissionFileId','101'),(1959,402,'','submissionFileId','108'),(1960,402,'','submissionId','14'),(1961,402,'','username','dbarnes'),(1962,403,'','fileId','60'),(1963,403,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1964,403,'','fileStage','10'),(1965,403,'','sourceSubmissionFileId','100'),(1966,403,'','submissionFileId','109'),(1967,403,'','submissionId','14'),(1968,403,'','username','dbarnes'),(1969,404,'','fileId','60'),(1970,404,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1971,404,'','fileStage','10'),(1972,404,'','sourceSubmissionFileId','100'),(1973,404,'','submissionFileId','109'),(1974,404,'','submissionId','14'),(1975,404,'','username','dbarnes'),(1976,405,'','fileId','59'),(1977,405,'en','filename','chapter4.pdf'),(1978,405,'','fileStage','10'),(1979,405,'','sourceSubmissionFileId','99'),(1980,405,'','submissionFileId','110'),(1981,405,'','submissionId','14'),(1982,405,'','username','dbarnes'),(1983,406,'','fileId','59'),(1984,406,'en','filename','chapter4.pdf'),(1985,406,'','fileStage','10'),(1986,406,'','sourceSubmissionFileId','99'),(1987,406,'','submissionFileId','110'),(1988,406,'','submissionId','14'),(1989,406,'','username','dbarnes'),(1990,407,'','fileId','58'),(1991,407,'en','filename','chapter3.pdf'),(1992,407,'','fileStage','10'),(1993,407,'','sourceSubmissionFileId','98'),(1994,407,'','submissionFileId','111'),(1995,407,'','submissionId','14'),(1996,407,'','username','dbarnes'),(1997,408,'','fileId','58'),(1998,408,'en','filename','chapter3.pdf'),(1999,408,'','fileStage','10'),(2000,408,'','sourceSubmissionFileId','98'),(2001,408,'','submissionFileId','111'),(2002,408,'','submissionId','14'),(2003,408,'','username','dbarnes'),(2004,409,'','fileId','57'),(2005,409,'en','filename','chapter2.pdf'),(2006,409,'','fileStage','10'),(2007,409,'','sourceSubmissionFileId','97'),(2008,409,'','submissionFileId','112'),(2009,409,'','submissionId','14'),(2010,409,'','username','dbarnes'),(2011,410,'','fileId','57'),(2012,410,'en','filename','chapter2.pdf'),(2013,410,'','fileStage','10'),(2014,410,'','sourceSubmissionFileId','97'),(2015,410,'','submissionFileId','112'),(2016,410,'','submissionId','14'),(2017,410,'','username','dbarnes'),(2018,411,'','fileId','56'),(2019,411,'en','filename','chapter1.pdf'),(2020,411,'','fileStage','10'),(2021,411,'','sourceSubmissionFileId','96'),(2022,411,'','submissionFileId','113'),(2023,411,'','submissionId','14'),(2024,411,'','username','dbarnes'),(2025,412,'','fileId','56'),(2026,412,'en','filename','chapter1.pdf'),(2027,412,'','fileStage','10'),(2028,412,'','sourceSubmissionFileId','96'),(2029,412,'','submissionFileId','113'),(2030,412,'','submissionId','14'),(2031,412,'','username','dbarnes'),(2032,413,'en','publicationFormatName','PDF'),(2033,413,'fr_CA','publicationFormatName',''),(2034,414,'en','publicationFormatName','PDF'),(2035,414,'fr_CA','publicationFormatName',''),(2036,415,'','fileId','56'),(2037,415,'en','filename','chapter1.pdf'),(2038,415,'','fileStage','10'),(2039,415,'','sourceSubmissionFileId','96'),(2040,415,'','submissionFileId','113'),(2041,415,'','submissionId','14'),(2042,415,'','username','dbarnes'),(2043,416,'en','filename','chapter1.pdf'),(2044,416,'','userFullName','Daniel Barnes'),(2045,416,'','username','dbarnes'),(2046,417,'','fileId','56'),(2047,417,'en','filename','chapter1.pdf'),(2048,417,'','fileStage','10'),(2049,417,'','sourceSubmissionFileId','96'),(2050,417,'','submissionFileId','113'),(2051,417,'','submissionId','14'),(2052,417,'','username','dbarnes'),(2053,418,'','fileId','57'),(2054,418,'en','filename','chapter2.pdf'),(2055,418,'','fileStage','10'),(2056,418,'','sourceSubmissionFileId','97'),(2057,418,'','submissionFileId','112'),(2058,418,'','submissionId','14'),(2059,418,'','username','dbarnes'),(2060,419,'en','filename','chapter2.pdf'),(2061,419,'','userFullName','Daniel Barnes'),(2062,419,'','username','dbarnes'),(2063,420,'','fileId','57'),(2064,420,'en','filename','chapter2.pdf'),(2065,420,'','fileStage','10'),(2066,420,'','sourceSubmissionFileId','97'),(2067,420,'','submissionFileId','112'),(2068,420,'','submissionId','14'),(2069,420,'','username','dbarnes'),(2070,421,'','fileId','58'),(2071,421,'en','filename','chapter3.pdf'),(2072,421,'','fileStage','10'),(2073,421,'','sourceSubmissionFileId','98'),(2074,421,'','submissionFileId','111'),(2075,421,'','submissionId','14'),(2076,421,'','username','dbarnes'),(2077,422,'en','filename','chapter3.pdf'),(2078,422,'','userFullName','Daniel Barnes'),(2079,422,'','username','dbarnes'),(2080,423,'','fileId','58'),(2081,423,'en','filename','chapter3.pdf'),(2082,423,'','fileStage','10'),(2083,423,'','sourceSubmissionFileId','98'),(2084,423,'','submissionFileId','111'),(2085,423,'','submissionId','14'),(2086,423,'','username','dbarnes'),(2087,424,'','fileId','59'),(2088,424,'en','filename','chapter4.pdf'),(2089,424,'','fileStage','10'),(2090,424,'','sourceSubmissionFileId','99'),(2091,424,'','submissionFileId','110'),(2092,424,'','submissionId','14'),(2093,424,'','username','dbarnes'),(2094,425,'en','filename','chapter4.pdf'),(2095,425,'','userFullName','Daniel Barnes'),(2096,425,'','username','dbarnes'),(2097,426,'','fileId','59'),(2098,426,'en','filename','chapter4.pdf'),(2099,426,'','fileStage','10'),(2100,426,'','sourceSubmissionFileId','99'),(2101,426,'','submissionFileId','110'),(2102,426,'','submissionId','14'),(2103,426,'','username','dbarnes'),(2104,427,'','fileId','60'),(2105,427,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(2106,427,'','fileStage','10'),(2107,427,'','sourceSubmissionFileId','100'),(2108,427,'','submissionFileId','109'),(2109,427,'','submissionId','14'),(2110,427,'','username','dbarnes'),(2111,428,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(2112,428,'','userFullName','Daniel Barnes'),(2113,428,'','username','dbarnes'),(2114,429,'','fileId','60'),(2115,429,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(2116,429,'','fileStage','10'),(2117,429,'','sourceSubmissionFileId','100'),(2118,429,'','submissionFileId','109'),(2119,429,'','submissionId','14'),(2120,429,'','username','dbarnes'),(2121,430,'','fileId','61'),(2122,430,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(2123,430,'','fileStage','10'),(2124,430,'','sourceSubmissionFileId','101'),(2125,430,'','submissionFileId','108'),(2126,430,'','submissionId','14'),(2127,430,'','username','dbarnes'),(2128,431,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(2129,431,'','userFullName','Daniel Barnes'),(2130,431,'','username','dbarnes'),(2131,432,'','fileId','61'),(2132,432,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(2133,432,'','fileStage','10'),(2134,432,'','sourceSubmissionFileId','101'),(2135,432,'','submissionFileId','108'),(2136,432,'','submissionId','14'),(2137,432,'','username','dbarnes'),(2138,436,'','fileId','62'),(2139,436,'en','filename','chapter1.pdf'),(2140,436,'','fileStage','2'),(2141,436,'','submissionFileId','114'),(2142,436,'','submissionId','15'),(2143,436,'','username','mforan'),(2144,437,'','fileId','62'),(2145,437,'en','filename','chapter1.pdf'),(2146,437,'','fileStage','2'),(2147,437,'','submissionFileId','114'),(2148,437,'','submissionId','15'),(2149,437,'','username','mforan'),(2150,438,'','fileId','62'),(2151,438,'en','filename','chapter1.pdf'),(2152,438,'','fileStage','2'),(2153,438,'','submissionFileId','114'),(2154,438,'','submissionId','15'),(2155,438,'','username','mforan'),(2156,439,'','fileId','63'),(2157,439,'en','filename','chapter2.pdf'),(2158,439,'','fileStage','2'),(2159,439,'','submissionFileId','115'),(2160,439,'','submissionId','15'),(2161,439,'','username','mforan'),(2162,440,'','fileId','63'),(2163,440,'en','filename','chapter2.pdf'),(2164,440,'','fileStage','2'),(2165,440,'','submissionFileId','115'),(2166,440,'','submissionId','15'),(2167,440,'','username','mforan'),(2168,441,'','fileId','63'),(2169,441,'en','filename','chapter2.pdf'),(2170,441,'','fileStage','2'),(2171,441,'','submissionFileId','115'),(2172,441,'','submissionId','15'),(2173,441,'','username','mforan'),(2174,442,'','fileId','64'),(2175,442,'en','filename','chapter3.pdf'),(2176,442,'','fileStage','2'),(2177,442,'','submissionFileId','116'),(2178,442,'','submissionId','15'),(2179,442,'','username','mforan'),(2180,443,'','fileId','64'),(2181,443,'en','filename','chapter3.pdf'),(2182,443,'','fileStage','2'),(2183,443,'','submissionFileId','116'),(2184,443,'','submissionId','15'),(2185,443,'','username','mforan'),(2186,444,'','fileId','64'),(2187,444,'en','filename','chapter3.pdf'),(2188,444,'','fileStage','2'),(2189,444,'','submissionFileId','116'),(2190,444,'','submissionId','15'),(2191,444,'','username','mforan'),(2192,447,'','fileId','64'),(2193,447,'en','filename','chapter3.pdf'),(2194,447,'','fileStage','4'),(2195,447,'','sourceSubmissionFileId','116'),(2196,447,'','submissionFileId','117'),(2197,447,'','submissionId','15'),(2198,447,'','username','dbarnes'),(2199,448,'','fileId','64'),(2200,448,'en','filename','chapter3.pdf'),(2201,448,'','fileStage','4'),(2202,448,'','sourceSubmissionFileId','116'),(2203,448,'','submissionFileId','117'),(2204,448,'','submissionId','15'),(2205,448,'','username','dbarnes'),(2206,449,'','fileId','63'),(2207,449,'en','filename','chapter2.pdf'),(2208,449,'','fileStage','4'),(2209,449,'','sourceSubmissionFileId','115'),(2210,449,'','submissionFileId','118'),(2211,449,'','submissionId','15'),(2212,449,'','username','dbarnes'),(2213,450,'','fileId','63'),(2214,450,'en','filename','chapter2.pdf'),(2215,450,'','fileStage','4'),(2216,450,'','sourceSubmissionFileId','115'),(2217,450,'','submissionFileId','118'),(2218,450,'','submissionId','15'),(2219,450,'','username','dbarnes'),(2220,451,'','fileId','62'),(2221,451,'en','filename','chapter1.pdf'),(2222,451,'','fileStage','4'),(2223,451,'','sourceSubmissionFileId','114'),(2224,451,'','submissionFileId','119'),(2225,451,'','submissionId','15'),(2226,451,'','username','dbarnes'),(2227,452,'','fileId','62'),(2228,452,'en','filename','chapter1.pdf'),(2229,452,'','fileStage','4'),(2230,452,'','sourceSubmissionFileId','114'),(2231,452,'','submissionFileId','119'),(2232,452,'','submissionId','15'),(2233,452,'','username','dbarnes'),(2234,455,'','fileId','65'),(2235,455,'en','filename','foreward.pdf'),(2236,455,'','fileStage','2'),(2237,455,'','submissionFileId','120'),(2238,455,'','submissionId','16'),(2239,455,'','username','mpower'),(2240,456,'','fileId','65'),(2241,456,'en','filename','foreward.pdf'),(2242,456,'','fileStage','2'),(2243,456,'','submissionFileId','120'),(2244,456,'','submissionId','16'),(2245,456,'','username','mpower'),(2246,457,'','fileId','65'),(2247,457,'en','filename','foreward.pdf'),(2248,457,'','fileStage','2'),(2249,457,'','submissionFileId','120'),(2250,457,'','submissionId','16'),(2251,457,'','username','mpower'),(2252,458,'','fileId','66'),(2253,458,'en','filename','preface.pdf'),(2254,458,'','fileStage','2'),(2255,458,'','submissionFileId','121'),(2256,458,'','submissionId','16'),(2257,458,'','username','mpower'),(2258,459,'','fileId','66'),(2259,459,'en','filename','preface.pdf'),(2260,459,'','fileStage','2'),(2261,459,'','submissionFileId','121'),(2262,459,'','submissionId','16'),(2263,459,'','username','mpower'),(2264,460,'','fileId','66'),(2265,460,'en','filename','preface.pdf'),(2266,460,'','fileStage','2'),(2267,460,'','submissionFileId','121'),(2268,460,'','submissionId','16'),(2269,460,'','username','mpower'),(2270,461,'','fileId','67'),(2271,461,'en','filename','cases.pdf'),(2272,461,'','fileStage','2'),(2273,461,'','submissionFileId','122'),(2274,461,'','submissionId','16'),(2275,461,'','username','mpower'),(2276,462,'','fileId','67'),(2277,462,'en','filename','cases.pdf'),(2278,462,'','fileStage','2'),(2279,462,'','submissionFileId','122'),(2280,462,'','submissionId','16'),(2281,462,'','username','mpower'),(2282,463,'','fileId','67'),(2283,463,'en','filename','cases.pdf'),(2284,463,'','fileStage','2'),(2285,463,'','submissionFileId','122'),(2286,463,'','submissionId','16'),(2287,463,'','username','mpower'),(2288,464,'','fileId','68'),(2289,464,'en','filename','conclusion.pdf'),(2290,464,'','fileStage','2'),(2291,464,'','submissionFileId','123'),(2292,464,'','submissionId','16'),(2293,464,'','username','mpower'),(2294,465,'','fileId','68'),(2295,465,'en','filename','conclusion.pdf'),(2296,465,'','fileStage','2'),(2297,465,'','submissionFileId','123'),(2298,465,'','submissionId','16'),(2299,465,'','username','mpower'),(2300,466,'','fileId','68'),(2301,466,'en','filename','conclusion.pdf'),(2302,466,'','fileStage','2'),(2303,466,'','submissionFileId','123'),(2304,466,'','submissionId','16'),(2305,466,'','username','mpower'),(2306,467,'','fileId','69'),(2307,467,'en','filename','bibliography.pdf'),(2308,467,'','fileStage','2'),(2309,467,'','submissionFileId','124'),(2310,467,'','submissionId','16'),(2311,467,'','username','mpower'),(2312,468,'','fileId','69'),(2313,468,'en','filename','bibliography.pdf'),(2314,468,'','fileStage','2'),(2315,468,'','submissionFileId','124'),(2316,468,'','submissionId','16'),(2317,468,'','username','mpower'),(2318,469,'','fileId','69'),(2319,469,'en','filename','bibliography.pdf'),(2320,469,'','fileStage','2'),(2321,469,'','submissionFileId','124'),(2322,469,'','submissionId','16'),(2323,469,'','username','mpower'),(2324,472,'','fileId','69'),(2325,472,'en','filename','bibliography.pdf'),(2326,472,'','fileStage','4'),(2327,472,'','sourceSubmissionFileId','124'),(2328,472,'','submissionFileId','125'),(2329,472,'','submissionId','16'),(2330,472,'','username','dbarnes'),(2331,473,'','fileId','69'),(2332,473,'en','filename','bibliography.pdf'),(2333,473,'','fileStage','4'),(2334,473,'','sourceSubmissionFileId','124'),(2335,473,'','submissionFileId','125'),(2336,473,'','submissionId','16'),(2337,473,'','username','dbarnes'),(2338,474,'','fileId','68'),(2339,474,'en','filename','conclusion.pdf'),(2340,474,'','fileStage','4'),(2341,474,'','sourceSubmissionFileId','123'),(2342,474,'','submissionFileId','126'),(2343,474,'','submissionId','16'),(2344,474,'','username','dbarnes'),(2345,475,'','fileId','68'),(2346,475,'en','filename','conclusion.pdf'),(2347,475,'','fileStage','4'),(2348,475,'','sourceSubmissionFileId','123'),(2349,475,'','submissionFileId','126'),(2350,475,'','submissionId','16'),(2351,475,'','username','dbarnes'),(2352,476,'','fileId','67'),(2353,476,'en','filename','cases.pdf'),(2354,476,'','fileStage','4'),(2355,476,'','sourceSubmissionFileId','122'),(2356,476,'','submissionFileId','127'),(2357,476,'','submissionId','16'),(2358,476,'','username','dbarnes'),(2359,477,'','fileId','67'),(2360,477,'en','filename','cases.pdf'),(2361,477,'','fileStage','4'),(2362,477,'','sourceSubmissionFileId','122'),(2363,477,'','submissionFileId','127'),(2364,477,'','submissionId','16'),(2365,477,'','username','dbarnes'),(2366,478,'','fileId','66'),(2367,478,'en','filename','preface.pdf'),(2368,478,'','fileStage','4'),(2369,478,'','sourceSubmissionFileId','121'),(2370,478,'','submissionFileId','128'),(2371,478,'','submissionId','16'),(2372,478,'','username','dbarnes'),(2373,479,'','fileId','66'),(2374,479,'en','filename','preface.pdf'),(2375,479,'','fileStage','4'),(2376,479,'','sourceSubmissionFileId','121'),(2377,479,'','submissionFileId','128'),(2378,479,'','submissionId','16'),(2379,479,'','username','dbarnes'),(2380,480,'','fileId','65'),(2381,480,'en','filename','foreward.pdf'),(2382,480,'','fileStage','4'),(2383,480,'','sourceSubmissionFileId','120'),(2384,480,'','submissionFileId','129'),(2385,480,'','submissionId','16'),(2386,480,'','username','dbarnes'),(2387,481,'','fileId','65'),(2388,481,'en','filename','foreward.pdf'),(2389,481,'','fileStage','4'),(2390,481,'','sourceSubmissionFileId','120'),(2391,481,'','submissionFileId','129'),(2392,481,'','submissionId','16'),(2393,481,'','username','dbarnes'),(2394,482,'','reviewerName','Adela Gallego'),(2395,482,'','round','1'),(2396,482,'','stageId','3'),(2397,482,'','submissionId','16'),(2398,483,'','reviewerName','Al Zacharia'),(2399,483,'','round','1'),(2400,483,'','stageId','3'),(2401,483,'','submissionId','16'),(2402,484,'','reviewerName','Gonzalo Favio'),(2403,484,'','round','1'),(2404,484,'','stageId','3'),(2405,484,'','submissionId','16'),(2406,485,'','reviewAssignmentId','21'),(2407,485,'','reviewerName','Adela Gallego'),(2408,485,'','round','1'),(2409,485,'','submissionId','16'),(2410,486,'','reviewAssignmentId','21'),(2411,486,'','reviewerName','Adela Gallego'),(2412,486,'','round','1'),(2413,486,'','submissionId','16'),(2414,489,'','fileId','70'),(2415,489,'en','filename','preface.pdf'),(2416,489,'','fileStage','2'),(2417,489,'','submissionFileId','130'),(2418,489,'','submissionId','17'),(2419,489,'','username','msmith'),(2420,490,'','fileId','70'),(2421,490,'en','filename','preface.pdf'),(2422,490,'','fileStage','2'),(2423,490,'','submissionFileId','130'),(2424,490,'','submissionId','17'),(2425,490,'','username','msmith'),(2426,491,'','fileId','70'),(2427,491,'en','filename','preface.pdf'),(2428,491,'','fileStage','2'),(2429,491,'','submissionFileId','130'),(2430,491,'','submissionId','17'),(2431,491,'','username','msmith'),(2432,492,'','fileId','71'),(2433,492,'en','filename','introduction.pdf'),(2434,492,'','fileStage','2'),(2435,492,'','submissionFileId','131'),(2436,492,'','submissionId','17'),(2437,492,'','username','msmith'),(2438,493,'','fileId','71'),(2439,493,'en','filename','introduction.pdf'),(2440,493,'','fileStage','2'),(2441,493,'','submissionFileId','131'),(2442,493,'','submissionId','17'),(2443,493,'','username','msmith'),(2444,494,'','fileId','71'),(2445,494,'en','filename','introduction.pdf'),(2446,494,'','fileStage','2'),(2447,494,'','submissionFileId','131'),(2448,494,'','submissionId','17'),(2449,494,'','username','msmith'),(2450,495,'','fileId','72'),(2451,495,'en','filename','chapter1.pdf'),(2452,495,'','fileStage','2'),(2453,495,'','submissionFileId','132'),(2454,495,'','submissionId','17'),(2455,495,'','username','msmith'),(2456,496,'','fileId','72'),(2457,496,'en','filename','chapter1.pdf'),(2458,496,'','fileStage','2'),(2459,496,'','submissionFileId','132'),(2460,496,'','submissionId','17'),(2461,496,'','username','msmith'),(2462,497,'','fileId','72'),(2463,497,'en','filename','chapter1.pdf'),(2464,497,'','fileStage','2'),(2465,497,'','submissionFileId','132'),(2466,497,'','submissionId','17'),(2467,497,'','username','msmith'),(2468,498,'','fileId','73'),(2469,498,'en','filename','chapter2.pdf'),(2470,498,'','fileStage','2'),(2471,498,'','submissionFileId','133'),(2472,498,'','submissionId','17'),(2473,498,'','username','msmith'),(2474,499,'','fileId','73'),(2475,499,'en','filename','chapter2.pdf'),(2476,499,'','fileStage','2'),(2477,499,'','submissionFileId','133'),(2478,499,'','submissionId','17'),(2479,499,'','username','msmith'),(2480,500,'','fileId','73'),(2481,500,'en','filename','chapter2.pdf'),(2482,500,'','fileStage','2'),(2483,500,'','submissionFileId','133'),(2484,500,'','submissionId','17'),(2485,500,'','username','msmith'),(2486,501,'','fileId','74'),(2487,501,'en','filename','chapter3.pdf'),(2488,501,'','fileStage','2'),(2489,501,'','submissionFileId','134'),(2490,501,'','submissionId','17'),(2491,501,'','username','msmith'),(2492,502,'','fileId','74'),(2493,502,'en','filename','chapter3.pdf'),(2494,502,'','fileStage','2'),(2495,502,'','submissionFileId','134'),(2496,502,'','submissionId','17'),(2497,502,'','username','msmith'),(2498,503,'','fileId','74'),(2499,503,'en','filename','chapter3.pdf'),(2500,503,'','fileStage','2'),(2501,503,'','submissionFileId','134'),(2502,503,'','submissionId','17'),(2503,503,'','username','msmith'),(2504,504,'','fileId','75'),(2505,504,'en','filename','chapter4.pdf'),(2506,504,'','fileStage','2'),(2507,504,'','submissionFileId','135'),(2508,504,'','submissionId','17'),(2509,504,'','username','msmith'),(2510,505,'','fileId','75'),(2511,505,'en','filename','chapter4.pdf'),(2512,505,'','fileStage','2'),(2513,505,'','submissionFileId','135'),(2514,505,'','submissionId','17'),(2515,505,'','username','msmith'),(2516,506,'','fileId','75'),(2517,506,'en','filename','chapter4.pdf'),(2518,506,'','fileStage','2'),(2519,506,'','submissionFileId','135'),(2520,506,'','submissionId','17'),(2521,506,'','username','msmith'),(2522,509,'','fileId','75'),(2523,509,'en','filename','chapter4.pdf'),(2524,509,'','fileStage','19'),(2525,509,'','sourceSubmissionFileId','135'),(2526,509,'','submissionFileId','136'),(2527,509,'','submissionId','17'),(2528,509,'','username','dbarnes'),(2529,510,'','fileId','75'),(2530,510,'en','filename','chapter4.pdf'),(2531,510,'','fileStage','19'),(2532,510,'','sourceSubmissionFileId','135'),(2533,510,'','submissionFileId','136'),(2534,510,'','submissionId','17'),(2535,510,'','username','dbarnes'),(2536,511,'','fileId','74'),(2537,511,'en','filename','chapter3.pdf'),(2538,511,'','fileStage','19'),(2539,511,'','sourceSubmissionFileId','134'),(2540,511,'','submissionFileId','137'),(2541,511,'','submissionId','17'),(2542,511,'','username','dbarnes'),(2543,512,'','fileId','74'),(2544,512,'en','filename','chapter3.pdf'),(2545,512,'','fileStage','19'),(2546,512,'','sourceSubmissionFileId','134'),(2547,512,'','submissionFileId','137'),(2548,512,'','submissionId','17'),(2549,512,'','username','dbarnes'),(2550,513,'','fileId','73'),(2551,513,'en','filename','chapter2.pdf'),(2552,513,'','fileStage','19'),(2553,513,'','sourceSubmissionFileId','133'),(2554,513,'','submissionFileId','138'),(2555,513,'','submissionId','17'),(2556,513,'','username','dbarnes'),(2557,514,'','fileId','73'),(2558,514,'en','filename','chapter2.pdf'),(2559,514,'','fileStage','19'),(2560,514,'','sourceSubmissionFileId','133'),(2561,514,'','submissionFileId','138'),(2562,514,'','submissionId','17'),(2563,514,'','username','dbarnes'),(2564,515,'','fileId','72'),(2565,515,'en','filename','chapter1.pdf'),(2566,515,'','fileStage','19'),(2567,515,'','sourceSubmissionFileId','132'),(2568,515,'','submissionFileId','139'),(2569,515,'','submissionId','17'),(2570,515,'','username','dbarnes'),(2571,516,'','fileId','72'),(2572,516,'en','filename','chapter1.pdf'),(2573,516,'','fileStage','19'),(2574,516,'','sourceSubmissionFileId','132'),(2575,516,'','submissionFileId','139'),(2576,516,'','submissionId','17'),(2577,516,'','username','dbarnes'),(2578,517,'','fileId','71'),(2579,517,'en','filename','introduction.pdf'),(2580,517,'','fileStage','19'),(2581,517,'','sourceSubmissionFileId','131'),(2582,517,'','submissionFileId','140'),(2583,517,'','submissionId','17'),(2584,517,'','username','dbarnes'),(2585,518,'','fileId','71'),(2586,518,'en','filename','introduction.pdf'),(2587,518,'','fileStage','19'),(2588,518,'','sourceSubmissionFileId','131'),(2589,518,'','submissionFileId','140'),(2590,518,'','submissionId','17'),(2591,518,'','username','dbarnes'),(2592,519,'','fileId','70'),(2593,519,'en','filename','preface.pdf'),(2594,519,'','fileStage','19'),(2595,519,'','sourceSubmissionFileId','130'),(2596,519,'','submissionFileId','141'),(2597,519,'','submissionId','17'),(2598,519,'','username','dbarnes'),(2599,520,'','fileId','70'),(2600,520,'en','filename','preface.pdf'),(2601,520,'','fileStage','19'),(2602,520,'','sourceSubmissionFileId','130'),(2603,520,'','submissionFileId','141'),(2604,520,'','submissionId','17'),(2605,520,'','username','dbarnes'),(2606,521,'','reviewerName','Julie Janssen'),(2607,521,'','round','1'),(2608,521,'','stageId','2'),(2609,521,'','submissionId','17'),(2610,522,'','reviewerName','Paul Hudson'),(2611,522,'','round','1'),(2612,522,'','stageId','2'),(2613,522,'','submissionId','17');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A log of all failed jobs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features` (
  `feature_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `seq` bigint NOT NULL,
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `press_features_unique` (`assoc_type`,`assoc_id`,`submission_id`),
  KEY `features_submission_id` (`submission_id`),
  CONSTRAINT `features_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Information about which submissions are featured in the press.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3 COMMENT='Records information in the database about files tracked by the system, linking them to the local filesystem.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'presses/1/monographs/1/67650017b4a53.pdf','application/pdf'),(2,'presses/1/monographs/1/676500189d55a.pdf','application/pdf'),(3,'presses/1/monographs/1/676500198e344.pdf','application/pdf'),(4,'presses/1/monographs/2/6765004f9d7c3.pdf','application/pdf'),(5,'presses/1/monographs/2/6765005092b23.pdf','application/pdf'),(6,'presses/1/monographs/2/676500518e3b6.pdf','application/pdf'),(7,'presses/1/monographs/2/6765005294f9a.pdf','application/pdf'),(9,'presses/1/monographs/3/676500c93f139.pdf','application/pdf'),(10,'presses/1/monographs/3/676500ca22ce6.pdf','application/pdf'),(11,'presses/1/monographs/3/676500cb0a5db.pdf','application/pdf'),(12,'presses/1/monographs/3/676500cbeca47.pdf','application/pdf'),(13,'presses/1/monographs/3/676500ccd7bba.pdf','application/pdf'),(14,'presses/1/monographs/4/676500f14bfcf.pdf','application/pdf'),(15,'presses/1/monographs/4/676500f2414a0.pdf','application/pdf'),(16,'presses/1/monographs/4/676500f32b271.pdf','application/pdf'),(17,'presses/1/monographs/4/676500f41930b.pdf','application/pdf'),(18,'presses/1/monographs/5/6765014604307.pdf','application/pdf'),(19,'presses/1/monographs/5/67650146ddb00.pdf','application/pdf'),(20,'presses/1/monographs/5/67650147cf88e.pdf','application/pdf'),(21,'presses/1/monographs/5/67650148be075.pdf','application/pdf'),(22,'presses/1/monographs/5/67650149b0978.pdf','application/pdf'),(23,'presses/1/monographs/5/6765014aac38c.pdf','application/pdf'),(24,'presses/1/monographs/6/676501c2ea4b6.pdf','application/pdf'),(25,'presses/1/monographs/6/676501c3cea29.pdf','application/pdf'),(26,'presses/1/monographs/6/676501c4bc51d.pdf','application/pdf'),(27,'presses/1/monographs/6/676501c5a9f15.pdf','application/pdf'),(28,'presses/1/monographs/7/676502098e26e.pdf','application/pdf'),(29,'presses/1/monographs/7/6765020a76e55.pdf','application/pdf'),(30,'presses/1/monographs/7/6765020b62b4b.pdf','application/pdf'),(31,'presses/1/monographs/7/6765020c55df9.pdf','application/pdf'),(32,'presses/1/monographs/7/6765020d4b527.pdf','application/pdf'),(33,'presses/1/monographs/8/6765024dd3350.pdf','application/pdf'),(34,'presses/1/monographs/9/676502578d5ad.pdf','application/pdf'),(35,'presses/1/monographs/9/6765025875a08.pdf','application/pdf'),(36,'presses/1/monographs/9/6765025962d2e.pdf','application/pdf'),(37,'presses/1/monographs/9/6765025a51b28.pdf','application/pdf'),(38,'presses/1/monographs/9/6765025b4ac23.pdf','application/pdf'),(39,'presses/1/monographs/10/6765028ec2394.pdf','application/pdf'),(40,'presses/1/monographs/10/6765028fa9061.pdf','application/pdf'),(41,'presses/1/monographs/10/6765029093bf9.pdf','application/pdf'),(42,'presses/1/monographs/10/676502918e512.pdf','application/pdf'),(43,'presses/1/monographs/10/67650292809e3.pdf','application/pdf'),(44,'presses/1/monographs/10/6765029379aee.pdf','application/pdf'),(45,'presses/1/monographs/10/6765029477f17.pdf','application/pdf'),(46,'presses/1/monographs/10/676502957eac6.pdf','application/pdf'),(47,'presses/1/monographs/10/676502968b029.pdf','application/pdf'),(48,'presses/1/monographs/11/676502d5239a4.pdf','application/pdf'),(49,'presses/1/monographs/11/676502d61843d.pdf','application/pdf'),(50,'presses/1/monographs/12/6765032496f5f.pdf','application/pdf'),(51,'presses/1/monographs/12/676503257e7b5.pdf','application/pdf'),(52,'presses/1/monographs/12/6765032669c79.pdf','application/pdf'),(53,'presses/1/monographs/13/676503614d5c9.pdf','application/pdf'),(54,'presses/1/monographs/13/67650362422da.pdf','application/pdf'),(55,'presses/1/monographs/13/676503632e278.pdf','application/pdf'),(56,'presses/1/monographs/14/676503bfcd15b.pdf','application/pdf'),(57,'presses/1/monographs/14/676503c0bc1f6.pdf','application/pdf'),(58,'presses/1/monographs/14/676503c1a6161.pdf','application/pdf'),(59,'presses/1/monographs/14/676503c296d8f.pdf','application/pdf'),(60,'presses/1/monographs/14/676503c38c284.pdf','application/pdf'),(61,'presses/1/monographs/14/676503c4bc1e5.pdf','application/pdf'),(62,'presses/1/monographs/15/6765044788833.pdf','application/pdf'),(63,'presses/1/monographs/15/67650448763d7.pdf','application/pdf'),(64,'presses/1/monographs/15/676504496163d.pdf','application/pdf'),(65,'presses/1/monographs/16/6765046e82800.pdf','application/pdf'),(66,'presses/1/monographs/16/6765046f6aee2.pdf','application/pdf'),(67,'presses/1/monographs/16/6765047052bda.pdf','application/pdf'),(68,'presses/1/monographs/16/676504713cea0.pdf','application/pdf'),(69,'presses/1/monographs/16/676504723d134.pdf','application/pdf'),(70,'presses/1/monographs/17/676504b6c3a84.pdf','application/pdf'),(71,'presses/1/monographs/17/676504b7afaa5.pdf','application/pdf'),(72,'presses/1/monographs/17/676504b8a026b.pdf','application/pdf'),(73,'presses/1/monographs/17/676504b9875d4.pdf','application/pdf'),(74,'presses/1/monographs/17/676504ba7a657.pdf','application/pdf'),(75,'presses/1/monographs/17/676504bb70763.pdf','application/pdf');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_groups` (
  `filter_group_id` bigint NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='Filter groups are used to organized filters into named sets, which can be retrieved by the application for invocation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'publicationFormat=>dc11','plugins.metadata.dc11.publicationFormatAdapter.displayName','plugins.metadata.dc11.publicationFormatAdapter.description','class::classes.publicationFormat.PublicationFormat','metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(PUBLICATION_FORMAT)'),(2,'monograph=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(3,'native-xml=>monograph','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(4,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(5,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(6,'publication-format=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publicationFormat.PublicationFormat','xml::schema(plugins/importexport/native/native.xsd)'),(7,'native-xml=>PublicationFormat','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publicationFormat.PublicationFormat[]'),(8,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(9,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),(10,'monograph=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission','xml::schema(plugins/importexport/onix30/ONIX_BookProduct_3.0_reference.xsd)'),(11,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]'),(13,'chapter=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.monograph.Chapter[]','xml::schema(plugins/importexport/native/native.xsd)'),(14,'native-xml=>chapter','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Chapter[]'),(15,'monographs=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/onix30/ONIX_BookProduct_3.0_reference.xsd)'),(16,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(17,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(18,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(19,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_settings` (
  `filter_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`filter_setting_id`),
  UNIQUE KEY `filter_settings_unique` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`),
  CONSTRAINT `filter_settings_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about filters, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_settings`
--

LOCK TABLES `filter_settings` WRITE;
/*!40000 ALTER TABLE `filter_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filters` (
  `filter_id` bigint NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint NOT NULL,
  `context_id` bigint DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint NOT NULL DEFAULT '0',
  `parent_filter_id` bigint DEFAULT NULL,
  `seq` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`filter_id`),
  KEY `filters_filter_group_id` (`filter_group_id`),
  KEY `filters_context_id` (`context_id`),
  KEY `filters_parent_filter_id` (`parent_filter_id`),
  CONSTRAINT `filters_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `filters_filter_group_id_foreign` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_groups` (`filter_group_id`) ON DELETE CASCADE,
  CONSTRAINT `filters_parent_filter_id_foreign` FOREIGN KEY (`parent_filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='Filters represent a transformation of a supported piece of data from one form to another, such as a PHP object into an XML document.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,NULL,'Extract metadata from a(n) PublicationFormat','APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaPublicationFormatAdapter',0,NULL,0),(2,2,NULL,'Native XML submission export','APP\\plugins\\importexport\\native\\filter\\MonographNativeXmlFilter',0,NULL,0),(3,3,NULL,'Native XML submission import','APP\\plugins\\importexport\\native\\filter\\NativeXmlMonographFilter',0,NULL,0),(4,4,NULL,'Native XML author export','APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter',0,NULL,0),(5,5,NULL,'Native XML author import','APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter',0,NULL,0),(6,6,NULL,'Native XML representation export','APP\\plugins\\importexport\\native\\filter\\PublicationFormatNativeXmlFilter',0,NULL,0),(7,7,NULL,'Native XML representation import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFormatFilter',0,NULL,0),(8,9,NULL,'Native XML submission file import','APP\\plugins\\importexport\\native\\filter\\NativeXmlMonographFileFilter',0,NULL,0),(9,8,NULL,'Native XML submission file export','PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter',0,NULL,0),(10,10,NULL,'ONIX 3.0 XML monograph export','APP\\plugins\\importexport\\onix30\\filter\\MonographONIX30XmlFilter',0,NULL,0),(11,11,NULL,'Native XML Publication export','APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter',0,NULL,0),(12,12,NULL,'Native XML publication import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter',0,NULL,0),(13,13,NULL,'Native XML chapter export','APP\\plugins\\importexport\\native\\filter\\ChapterNativeXmlFilter',0,NULL,0),(14,14,NULL,'Native XML Chapter import','APP\\plugins\\importexport\\native\\filter\\NativeXmlChapterFilter',0,NULL,0),(15,15,NULL,'ONIX 3.0 XML monograph export','APP\\plugins\\importexport\\onix30\\filter\\MonographONIX30XmlFilter',0,NULL,0),(16,16,NULL,'User XML user export','PKP\\plugins\\importexport\\users\\filter\\PKPUserUserXmlFilter',0,NULL,0),(17,17,NULL,'User XML user import','PKP\\plugins\\importexport\\users\\filter\\UserXmlPKPUserFilter',0,NULL,0),(18,18,NULL,'Native XML user group export','PKP\\plugins\\importexport\\users\\filter\\UserGroupNativeXmlFilter',0,NULL,0),(19,19,NULL,'Native XML user group import','PKP\\plugins\\importexport\\users\\filter\\NativeXmlUserGroupFilter',0,NULL,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre_settings` (
  `genre_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `genre_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`genre_setting_id`),
  UNIQUE KEY `genre_settings_unique` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`),
  CONSTRAINT `genre_settings_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COMMENT='More data about file genres, including localized properties such as the genre name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT INTO `genre_settings` VALUES (1,1,'en','name','Appendix','string'),(2,1,'fr_CA','name','Annexe','string'),(3,2,'en','name','Bibliography','string'),(4,2,'fr_CA','name','Bibliographie','string'),(5,3,'en','name','Book Manuscript','string'),(6,3,'fr_CA','name','Manuscrit de livre','string'),(7,4,'en','name','Chapter Manuscript','string'),(8,4,'fr_CA','name','Manuscrit de chapitre','string'),(9,5,'en','name','Glossary','string'),(10,5,'fr_CA','name','Glossaire','string'),(11,6,'en','name','Index','string'),(12,6,'fr_CA','name','Index','string'),(13,7,'en','name','Preface','string'),(14,7,'fr_CA','name','Préface','string'),(15,8,'en','name','Prospectus','string'),(16,8,'fr_CA','name','Prospectus','string'),(17,9,'en','name','Table','string'),(18,9,'fr_CA','name','Tableau','string'),(19,10,'en','name','Figure','string'),(20,10,'fr_CA','name','Figure','string'),(21,11,'en','name','Photo','string'),(22,11,'fr_CA','name','Photographie','string'),(23,12,'en','name','Illustration','string'),(24,12,'fr_CA','name','Illustration','string'),(25,13,'en','name','Other','string'),(26,13,'fr_CA','name','Autre','string'),(27,14,'en','name','Image','string'),(28,14,'fr_CA','name','Image','string'),(29,15,'en','name','HTML Stylesheet','string'),(30,15,'fr_CA','name','Feuille de style HTML','string');
/*!40000 ALTER TABLE `genre_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `seq` bigint NOT NULL,
  `enabled` smallint NOT NULL DEFAULT '1',
  `category` bigint NOT NULL DEFAULT '1',
  `dependent` smallint NOT NULL DEFAULT '0',
  `supplementary` smallint NOT NULL DEFAULT '0',
  `required` smallint NOT NULL DEFAULT '0' COMMENT 'Whether or not at least one file of this genre is required for a new submission.',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `genres_context_id` (`context_id`),
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COMMENT='The types of submission files configured for each context, such as Article Text, Data Set, Transcript, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,1,0,1,1,0,1,0,'APPENDIX'),(2,1,1,1,1,0,1,0,'BIBLIOGRAPHY'),(3,1,2,1,1,0,0,1,'MANUSCRIPT'),(4,1,3,1,1,0,0,0,'CHAPTER'),(5,1,4,1,1,0,1,0,'GLOSSARY'),(6,1,5,1,1,0,1,0,'INDEX'),(7,1,6,1,1,0,1,0,'PREFACE'),(8,1,7,1,3,0,1,0,'PROSPECTUS'),(9,1,8,1,2,0,1,0,'TABLE'),(10,1,9,1,2,0,1,0,'FIGURE'),(11,1,10,1,2,0,1,0,'PHOTO'),(12,1,11,1,2,0,1,0,'ILLUSTRATION'),(13,1,15,1,3,0,1,0,'OTHER'),(14,1,13,1,2,1,0,0,'IMAGE'),(15,1,14,1,1,1,0,0,'STYLE');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highlight_settings`
--

DROP TABLE IF EXISTS `highlight_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `highlight_settings` (
  `highlight_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `highlight_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`highlight_setting_id`),
  UNIQUE KEY `highlight_settings_unique` (`highlight_id`,`locale`,`setting_name`),
  KEY `highlight_settings_highlight_id` (`highlight_id`),
  CONSTRAINT `highlight_settings_highlight_id_foreign` FOREIGN KEY (`highlight_id`) REFERENCES `highlights` (`highlight_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about highlights, including localized properties like title and description.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highlight_settings`
--

LOCK TABLES `highlight_settings` WRITE;
/*!40000 ALTER TABLE `highlight_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `highlight_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highlights`
--

DROP TABLE IF EXISTS `highlights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `highlights` (
  `highlight_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `sequence` bigint NOT NULL,
  `url` varchar(2047) NOT NULL,
  PRIMARY KEY (`highlight_id`),
  KEY `highlights_context_id` (`context_id`),
  CONSTRAINT `highlights_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Highlights are featured items that can be presented to users, for example on the homepage.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highlights`
--

LOCK TABLES `highlights` WRITE;
/*!40000 ALTER TABLE `highlights` DISABLE KEYS */;
/*!40000 ALTER TABLE `highlights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identification_codes`
--

DROP TABLE IF EXISTS `identification_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identification_codes` (
  `identification_code_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `code` varchar(40) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`identification_code_id`),
  KEY `identification_codes_publication_format_id` (`publication_format_id`),
  KEY `identification_codes_key` (`identification_code_id`,`publication_format_id`,`code`),
  CONSTRAINT `identification_codes_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='ONIX identification codes for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identification_codes`
--

LOCK TABLES `identification_codes` WRITE;
/*!40000 ALTER TABLE `identification_codes` DISABLE KEYS */;
INSERT INTO `identification_codes` VALUES (1,1,'02','951-98548-9-4'),(2,1,'15','978-951-98548-9-2');
/*!40000 ALTER TABLE `identification_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution_ip`
--

DROP TABLE IF EXISTS `institution_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_ip` (
  `institution_ip_id` bigint NOT NULL AUTO_INCREMENT,
  `institution_id` bigint NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint NOT NULL,
  `ip_end` bigint DEFAULT NULL,
  PRIMARY KEY (`institution_ip_id`),
  KEY `institution_ip_institution_id` (`institution_id`),
  KEY `institution_ip_start` (`ip_start`),
  KEY `institution_ip_end` (`ip_end`),
  CONSTRAINT `institution_ip_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Records IP address ranges and associates them with institutions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_ip`
--

LOCK TABLES `institution_ip` WRITE;
/*!40000 ALTER TABLE `institution_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution_settings`
--

DROP TABLE IF EXISTS `institution_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_settings` (
  `institution_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institution_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`institution_setting_id`),
  UNIQUE KEY `institution_settings_unique` (`institution_id`,`locale`,`setting_name`),
  KEY `institution_settings_institution_id` (`institution_id`),
  CONSTRAINT `institution_settings_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about institutions, including localized properties like names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_settings`
--

LOCK TABLES `institution_settings` WRITE;
/*!40000 ALTER TABLE `institution_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutions`
--

DROP TABLE IF EXISTS `institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutions` (
  `institution_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `ror` varchar(255) DEFAULT NULL COMMENT 'ROR (Research Organization Registry) ID',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`institution_id`),
  KEY `institutions_context_id` (`context_id`),
  CONSTRAINT `institutions_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Institutions for statistics and subscriptions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitations` (
  `invitation_id` bigint NOT NULL AUTO_INCREMENT,
  `key_hash` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `inviter_id` bigint DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `payload` json DEFAULT NULL,
  `status` enum('INITIALIZED','PENDING','ACCEPTED','DECLINED','CANCELLED') NOT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT 'When present, the email address of the invitation recipient; when null, user_id must be set and the email can be fetched from the users table.',
  `context_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`invitation_id`),
  KEY `invitations_user_id` (`user_id`),
  KEY `invitations_inviter_id` (`inviter_id`),
  KEY `invitations_context_id` (`context_id`),
  KEY `invitations_status_context_id_user_id_type_index` (`status`,`context_id`,`user_id`,`type`),
  KEY `invitations_expiry_date_index` (`expiry_date`),
  CONSTRAINT `invitations_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `invitations_inviter_id_foreign` FOREIGN KEY (`inviter_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COMMENT='Invitations are sent to request a person (by email) to allow them to accept or reject an operation or position, such as a board membership or a submission peer review.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
INSERT INTO `invitations` VALUES (2,'$2y$10$eJIfxob7eAZ0KZOxxz1v3OMz7QHc33UjqA1wtaamerUkTkM.1rVyG','userRoleAssignment',NULL,1,'2024-12-23 05:16:58','{\"password\": \"$2y$10$esyAr4KSB2ymRYGb63FMwOaCGURS8T6rOjIb4egxmytHwfor4H0be\", \"username\": \"rvaca\", \"emailBody\": null, \"givenName\": {\"en\": \"Ramiro\", \"fr_CA\": \"Ramiro\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Vaca\", \"fr_CA\": \"Vaca\"}, \"affiliation\": {\"en\": \"Universidad Nacional Autónoma de México\", \"fr_CA\": \"Mexico\"}, \"userCountry\": \"MX\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 2}], \"sendEmailAddress\": \"rvaca@mailinator.com\"}','ACCEPTED','rvaca@mailinator.com',1,'2024-12-20 05:16:58','2024-12-20 05:17:08'),(4,'$2y$10$UfddMIZpbGUVIcqDnXa4f.mCnAUmmjoai80BU8Y0J1HeO9A87EZBy','userRoleAssignment',NULL,1,'2024-12-23 05:17:19','{\"password\": \"$2y$10$FGeuHgSOcuC/k4242JJelOQxE2VSjqiPZ1jZh4Jmv.OBmWGkBfi4a\", \"username\": \"dbarnes\", \"emailBody\": null, \"givenName\": {\"en\": \"Daniel\", \"fr_CA\": \"Daniel\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Barnes\", \"fr_CA\": \"Barnes\"}, \"affiliation\": {\"en\": \"University of Melbourne\", \"fr_CA\": \"Australia\"}, \"userCountry\": \"AU\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 3}], \"sendEmailAddress\": \"dbarnes@mailinator.com\"}','ACCEPTED','dbarnes@mailinator.com',1,'2024-12-20 05:17:19','2024-12-20 05:17:28'),(6,'$2y$10$uOpmR6AQn2SQ2sJ3.wwQC.NmO4SFVWkWIvu5AXwkQLp5LzlqPJYsO','userRoleAssignment',NULL,1,'2024-12-23 05:17:40','{\"password\": \"$2y$10$R85qfD2Bn7K0DfzGBulg4OanybuLwmrZz1txkJ9os7T6NhSZbfH3K\", \"username\": \"dbuskins\", \"emailBody\": null, \"givenName\": {\"en\": \"David\", \"fr_CA\": \"David\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Buskins\", \"fr_CA\": \"Buskins\"}, \"affiliation\": {\"en\": \"University of Chicago\", \"fr_CA\": \"United States\"}, \"userCountry\": \"US\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 5}], \"sendEmailAddress\": \"dbuskins@mailinator.com\"}','ACCEPTED','dbuskins@mailinator.com',1,'2024-12-20 05:17:40','2024-12-20 05:17:50'),(8,'$2y$10$VEis.aPn3crLsmkayIaYAecRatQDWvkXOEZpbRbNF/8lqpwBO.P6W','userRoleAssignment',NULL,1,'2024-12-23 05:18:02','{\"password\": \"$2y$10$4cB.pslyOMVWx7bijN.1nu7S2EcPTik56Dci.NBuJgM6yeOsqzIQS\", \"username\": \"sberardo\", \"emailBody\": null, \"givenName\": {\"en\": \"Stephanie\", \"fr_CA\": \"Stephanie\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Berardo\", \"fr_CA\": \"Berardo\"}, \"affiliation\": {\"en\": \"University of Toronto\", \"fr_CA\": \"Canada\"}, \"userCountry\": \"CA\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 5}], \"sendEmailAddress\": \"sberardo@mailinator.com\"}','ACCEPTED','sberardo@mailinator.com',1,'2024-12-20 05:18:02','2024-12-20 05:18:13'),(10,'$2y$10$3Ed757q.zHhOw786RIMtN.76Ar9vk7gDUEedjwFEjfmfrtucSAYGy','userRoleAssignment',NULL,1,'2024-12-23 05:18:26','{\"password\": \"$2y$10$.SvZucefs2bwrGFSjtE2kuL6FZ20lDLXIWaE1WNpzIdbGCmXDyOTG\", \"username\": \"minoue\", \"emailBody\": null, \"givenName\": {\"en\": \"Minoti\", \"fr_CA\": \"Minoti\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Inoue\", \"fr_CA\": \"Inoue\"}, \"affiliation\": {\"en\": \"Kyoto University\", \"fr_CA\": \"Japan\"}, \"userCountry\": \"JP\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 5}], \"sendEmailAddress\": \"minoue@mailinator.com\"}','ACCEPTED','minoue@mailinator.com',1,'2024-12-20 05:18:25','2024-12-20 05:18:37'),(12,'$2y$10$Ebgo1nrsXmTX2kw0jyhvROhcpV7v5MvDekoTqekcTi8Mnhp8YszSm','userRoleAssignment',NULL,1,'2024-12-23 05:18:51','{\"password\": \"$2y$10$skjFbIpIrQnFMBHSFazw3u20SxozFcjjJssZ87KbECtBRddXeV2Py\", \"username\": \"jjanssen\", \"emailBody\": null, \"givenName\": {\"en\": \"Julie\", \"fr_CA\": \"Julie\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Janssen\", \"fr_CA\": \"Janssen\"}, \"affiliation\": {\"en\": \"Utrecht University\", \"fr_CA\": \"Netherlands\"}, \"userCountry\": \"NL\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 17}], \"sendEmailAddress\": \"jjanssen@mailinator.com\"}','ACCEPTED','jjanssen@mailinator.com',1,'2024-12-20 05:18:51','2024-12-20 05:19:04'),(14,'$2y$10$dFgN8x./ZxDOedpPVaN1QOEsL54TFRE5Cg4BlOtT74jPb28UbjlPW','userRoleAssignment',NULL,1,'2024-12-23 05:19:17','{\"password\": \"$2y$10$gce1hZG2JJYmzsfuWvra6eiSSgfB1NIuA7Kw1G809/f5.NbV06SAS\", \"username\": \"phudson\", \"emailBody\": null, \"givenName\": {\"en\": \"Paul\", \"fr_CA\": \"Paul\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Hudson\", \"fr_CA\": \"Hudson\"}, \"affiliation\": {\"en\": \"McGill University\", \"fr_CA\": \"Canada\"}, \"userCountry\": \"CA\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 17}], \"sendEmailAddress\": \"phudson@mailinator.com\"}','ACCEPTED','phudson@mailinator.com',1,'2024-12-20 05:19:17','2024-12-20 05:19:30'),(16,'$2y$10$OGg0uKJdYL2UOgnoTPoxQOeENzKuByon08eu3TqH2A0bguwW2sA0e','userRoleAssignment',NULL,1,'2024-12-23 05:19:45','{\"password\": \"$2y$10$NnFVWEeX.M1g15d19VapdO.zdzZ3QluuLYNp3yUGuUso/mk23kHJ2\", \"username\": \"amccrae\", \"emailBody\": null, \"givenName\": {\"en\": \"Aisla\", \"fr_CA\": \"Aisla\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"McCrae\", \"fr_CA\": \"McCrae\"}, \"affiliation\": {\"en\": \"University of Manitoba\", \"fr_CA\": \"Canada\"}, \"userCountry\": \"CA\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 17}], \"sendEmailAddress\": \"amccrae@mailinator.com\"}','ACCEPTED','amccrae@mailinator.com',1,'2024-12-20 05:19:45','2024-12-20 05:20:00'),(18,'$2y$10$H4K6u.RDP.wX4CwYRRoXd.OxEclDLHY9QKm51.Qb9cc2gUsuekAZ.','userRoleAssignment',NULL,1,'2024-12-23 05:20:15','{\"password\": \"$2y$10$YbR66VWbvnwW/kr7Fv2H9eBqGVj0szRd5CpT5G98mVfp4Yfjbx6qC\", \"username\": \"agallego\", \"emailBody\": null, \"givenName\": {\"en\": \"Adela\", \"fr_CA\": \"Adela\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Gallego\", \"fr_CA\": \"Gallego\"}, \"affiliation\": {\"en\": \"State University of New York\", \"fr_CA\": \"United States\"}, \"userCountry\": \"US\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 18}], \"sendEmailAddress\": \"agallego@mailinator.com\"}','ACCEPTED','agallego@mailinator.com',1,'2024-12-20 05:20:15','2024-12-20 05:20:31'),(20,'$2y$10$AKoL8pIt0dwKAiVGiWxe/Oc81oqb/mDiFeGmE/g/vOl.HkJcYuAu.','userRoleAssignment',NULL,1,'2024-12-23 05:20:49','{\"password\": \"$2y$10$y7cgjnrWKgG6nwiiN70NJeliWwqh/BeYEfdBNy/d6Lw3GErFnzUmm\", \"username\": \"alzacharia\", \"emailBody\": null, \"givenName\": {\"en\": \"Al\", \"fr_CA\": \"Al\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Zacharia\", \"fr_CA\": \"Zacharia\"}, \"affiliation\": {\"en\": \"KNUST\", \"fr_CA\": \"Ghana\"}, \"userCountry\": \"GH\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 18}], \"sendEmailAddress\": \"alzacharia@mailinator.com\"}','ACCEPTED','alzacharia@mailinator.com',1,'2024-12-20 05:20:48','2024-12-20 05:21:05'),(22,'$2y$10$H.lowsfNin2uK1pwfpFlQuYihlc8g5Xp1lTP4GJDl2ICDkYiud1ky','userRoleAssignment',NULL,1,'2024-12-23 05:21:22','{\"password\": \"$2y$10$GW8AOeDAuboV8VPE5yP4n.4vCNASXhw/r209IY52dKlDT4zvNgMFG\", \"username\": \"gfavio\", \"emailBody\": null, \"givenName\": {\"en\": \"Gonzalo\", \"fr_CA\": \"Gonzalo\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Favio\", \"fr_CA\": \"Favio\"}, \"affiliation\": {\"en\": \"Madrid\", \"fr_CA\": \"Spain\"}, \"userCountry\": \"ES\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 18}], \"sendEmailAddress\": \"gfavio@mailinator.com\"}','ACCEPTED','gfavio@mailinator.com',1,'2024-12-20 05:21:22','2024-12-20 05:21:40'),(24,'$2y$10$E7h5i6CvbBZtWHIiItx0o.mTok9Avx/GPsqzQWLwZXIptOUtaAaEC','userRoleAssignment',NULL,1,'2024-12-23 05:21:58','{\"password\": \"$2y$10$cDLDMKOIE3L1ThxqSH/fQe2TaHEj/93TGBZ1uXbiYYyTxaKFueYVi\", \"username\": \"mfritz\", \"emailBody\": null, \"givenName\": {\"en\": \"Maria\", \"fr_CA\": \"Maria\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Fritz\", \"fr_CA\": \"Fritz\"}, \"affiliation\": {\"en\": \"Ghent University\", \"fr_CA\": \"Belgium\"}, \"userCountry\": \"BE\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 6}], \"sendEmailAddress\": \"mfritz@mailinator.com\"}','ACCEPTED','mfritz@mailinator.com',1,'2024-12-20 05:21:58','2024-12-20 05:22:16'),(26,'$2y$10$Lrz72pngqmsI1aZbRtQFL.LoZl10OoAKsbHS/9Citjj4nB5.Z/NdK','userRoleAssignment',NULL,1,'2024-12-23 05:22:36','{\"password\": \"$2y$10$u/2Fn927vJPvrVNmGHcWv.S41iF6G3iRuaJ6zzQ587qpu/ChkIe1i\", \"username\": \"svogt\", \"emailBody\": null, \"givenName\": {\"en\": \"Sarah\", \"fr_CA\": \"Sarah\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Vogt\", \"fr_CA\": \"Vogt\"}, \"affiliation\": {\"en\": \"Universidad de Chile\", \"fr_CA\": \"Chile\"}, \"userCountry\": \"CL\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 6}], \"sendEmailAddress\": \"svogt@mailinator.com\"}','ACCEPTED','svogt@mailinator.com',1,'2024-12-20 05:22:35','2024-12-20 05:22:55'),(28,'$2y$10$1jwDsvAPzS/hM5U27836kO/gtdOQqO7N.qAfxh.dBxm8eExxZHOMW','userRoleAssignment',NULL,1,'2024-12-23 05:23:16','{\"password\": \"$2y$10$4xAU0K4mwv4UiJ/8GBhgLeKTDBYmudhcqmBbrht7LezMc/PqfFpWa\", \"username\": \"gcox\", \"emailBody\": null, \"givenName\": {\"en\": \"Graham\", \"fr_CA\": \"Graham\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Cox\", \"fr_CA\": \"Cox\"}, \"affiliation\": {\"en\": \"Duke University\", \"fr_CA\": \"United States\"}, \"userCountry\": \"US\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 10}], \"sendEmailAddress\": \"gcox@mailinator.com\"}','ACCEPTED','gcox@mailinator.com',1,'2024-12-20 05:23:15','2024-12-20 05:23:37'),(30,'$2y$10$MeHSd6FPzRCMXyN8g0fj4u7ZsVEuTgUqL7afF9nNNYMYUB0rIzNjm','userRoleAssignment',NULL,1,'2024-12-23 05:23:58','{\"password\": \"$2y$10$9jfkLtRZBPhPSRoMEBivGemFYSroqs1YMppVCpprTwMBrc6jlYT36\", \"username\": \"shellier\", \"emailBody\": null, \"givenName\": {\"en\": \"Stephen\", \"fr_CA\": \"Stephen\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Hellier\", \"fr_CA\": \"Hellier\"}, \"affiliation\": {\"en\": \"University of Cape Town\", \"fr_CA\": \"South Africa\"}, \"userCountry\": \"ZA\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 10}], \"sendEmailAddress\": \"shellier@mailinator.com\"}','ACCEPTED','shellier@mailinator.com',1,'2024-12-20 05:23:57','2024-12-20 05:24:21'),(32,'$2y$10$VUwZ8FDtZRAI7bPepXvY0OeidbTFE/38h7182ld315waW3Gl3LaF6','userRoleAssignment',NULL,1,'2024-12-23 05:24:43','{\"password\": \"$2y$10$PkEikt4KqE0gXyBT2Tbb..T4a3rEml6hdvd0C6co1SyLz8F3gROaK\", \"username\": \"cturner\", \"emailBody\": null, \"givenName\": {\"en\": \"Catherine\", \"fr_CA\": \"Catherine\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Turner\", \"fr_CA\": \"Turner\"}, \"affiliation\": {\"en\": \"Imperial College London\", \"fr_CA\": \"United Kingdom\"}, \"userCountry\": \"GB\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 12}], \"sendEmailAddress\": \"cturner@mailinator.com\"}','ACCEPTED','cturner@mailinator.com',1,'2024-12-20 05:24:42','2024-12-20 05:25:07'),(34,'$2y$10$dpKIC9yDg4MElkPVBT29nupbQOX0HNtAVGq2KuS0JOqkKhmPFmHXy','userRoleAssignment',NULL,1,'2024-12-23 05:25:31','{\"password\": \"$2y$10$XS7rGh9AVa.03/O5w0m11uv165wOmnRaBXm59u9AXC7hpwhQ.9/IS\", \"username\": \"skumar\", \"emailBody\": null, \"givenName\": {\"en\": \"Sabine\", \"fr_CA\": \"Sabine\"}, \"userOrcid\": null, \"familyName\": {\"en\": \"Kumar\", \"fr_CA\": \"Kumar\"}, \"affiliation\": {\"en\": \"National University of Singapore\", \"fr_CA\": \"Singapore\"}, \"userCountry\": \"SG\", \"emailSubject\": null, \"passwordHashed\": true, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2024-12-20\", \"userGroupId\": 12}], \"sendEmailAddress\": \"skumar@mailinator.com\"}','ACCEPTED','skumar@mailinator.com',1,'2024-12-20 05:25:30','2024-12-20 05:25:56');
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Job batches allow jobs to be collected into groups for managed processing.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='All pending or in-progress jobs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_file_settings`
--

DROP TABLE IF EXISTS `library_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_file_settings` (
  `library_file_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  PRIMARY KEY (`library_file_setting_id`),
  UNIQUE KEY `library_file_settings_unique` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_file_id` (`file_id`),
  CONSTRAINT `library_file_settings_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `library_files` (`file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about library files, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_file_settings`
--

LOCK TABLES `library_file_settings` WRITE;
/*!40000 ALTER TABLE `library_file_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_files`
--

DROP TABLE IF EXISTS `library_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_files` (
  `file_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint NOT NULL,
  `type` smallint NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint DEFAULT NULL,
  `public_access` smallint DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`),
  CONSTRAINT `library_files_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `library_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Library files can be associated with the context (press/server/journal) or with individual submissions, and are typically forms, agreements, and other administrative documents that are not part of the scholarly content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_files`
--

LOCK TABLES `library_files` WRITE;
/*!40000 ALTER TABLE `library_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markets`
--

DROP TABLE IF EXISTS `markets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `markets` (
  `market_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `countries_included` text,
  `countries_excluded` text,
  `regions_included` text,
  `regions_excluded` text,
  `market_date_role` varchar(40) NOT NULL,
  `market_date_format` varchar(40) NOT NULL,
  `market_date` varchar(255) NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `price_type_code` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `tax_rate_code` varchar(255) DEFAULT NULL,
  `tax_type_code` varchar(255) DEFAULT NULL,
  `agent_id` bigint DEFAULT NULL,
  `supplier_id` bigint DEFAULT NULL,
  PRIMARY KEY (`market_id`),
  KEY `markets_publication_format_id` (`publication_format_id`),
  KEY `format_markets_pkey` (`market_id`,`publication_format_id`),
  CONSTRAINT `markets_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ONIX market information for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markets`
--

LOCK TABLES `markets` WRITE;
/*!40000 ALTER TABLE `markets` DISABLE KEYS */;
/*!40000 ALTER TABLE `markets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_context`
--

DROP TABLE IF EXISTS `metrics_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_context` (
  `metrics_context_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric` int NOT NULL,
  PRIMARY KEY (`metrics_context_id`),
  KEY `metrics_context_load_id` (`load_id`),
  KEY `metrics_context_context_id` (`context_id`),
  CONSTRAINT `metrics_context_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics for views of the homepage.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_context`
--

LOCK TABLES `metrics_context` WRITE;
/*!40000 ALTER TABLE `metrics_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_daily`
--

DROP TABLE IF EXISTS `metrics_counter_submission_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_daily` (
  `metrics_counter_submission_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric_book_investigations` int NOT NULL,
  `metric_book_investigations_unique` int NOT NULL,
  `metric_book_requests` int NOT NULL,
  `metric_book_requests_unique` int NOT NULL,
  `metric_chapter_investigations` int NOT NULL,
  `metric_chapter_investigations_unique` int NOT NULL,
  `metric_chapter_requests` int NOT NULL,
  `metric_chapter_requests_unique` int NOT NULL,
  `metric_title_investigations_unique` int NOT NULL,
  `metric_title_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_daily_id`),
  UNIQUE KEY `msd_uc_load_id_context_id_submission_id_date` (`load_id`,`context_id`,`submission_id`,`date`),
  KEY `msd_load_id` (`load_id`),
  KEY `metrics_counter_submission_daily_context_id` (`context_id`),
  KEY `metrics_counter_submission_daily_submission_id` (`submission_id`),
  KEY `msd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_daily`
--

LOCK TABLES `metrics_counter_submission_daily` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_institution_daily`
--

DROP TABLE IF EXISTS `metrics_counter_submission_institution_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_institution_daily` (
  `metrics_counter_submission_institution_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric_book_investigations` int NOT NULL,
  `metric_book_investigations_unique` int NOT NULL,
  `metric_book_requests` int NOT NULL,
  `metric_book_requests_unique` int NOT NULL,
  `metric_chapter_investigations` int NOT NULL,
  `metric_chapter_investigations_unique` int NOT NULL,
  `metric_chapter_requests` int NOT NULL,
  `metric_chapter_requests_unique` int NOT NULL,
  `metric_title_investigations_unique` int NOT NULL,
  `metric_title_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_institution_daily_id`),
  UNIQUE KEY `msid_uc_load_id_context_id_submission_id_institution_id_date` (`load_id`,`context_id`,`submission_id`,`institution_id`,`date`),
  KEY `msid_load_id` (`load_id`),
  KEY `msid_context_id` (`context_id`),
  KEY `msid_submission_id` (`submission_id`),
  KEY `msid_institution_id` (`institution_id`),
  KEY `msid_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msid_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_institution_daily`
--

LOCK TABLES `metrics_counter_submission_institution_daily` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_institution_monthly`
--

DROP TABLE IF EXISTS `metrics_counter_submission_institution_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_institution_monthly` (
  `metrics_counter_submission_institution_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  `month` int NOT NULL,
  `metric_book_investigations` int NOT NULL,
  `metric_book_investigations_unique` int NOT NULL,
  `metric_book_requests` int NOT NULL,
  `metric_book_requests_unique` int NOT NULL,
  `metric_chapter_investigations` int NOT NULL,
  `metric_chapter_investigations_unique` int NOT NULL,
  `metric_chapter_requests` int NOT NULL,
  `metric_chapter_requests_unique` int NOT NULL,
  `metric_title_investigations_unique` int NOT NULL,
  `metric_title_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_institution_monthly_id`),
  UNIQUE KEY `msim_uc_context_id_submission_id_institution_id_month` (`context_id`,`submission_id`,`institution_id`,`month`),
  KEY `msim_context_id` (`context_id`),
  KEY `msim_submission_id` (`submission_id`),
  KEY `msim_institution_id` (`institution_id`),
  KEY `msim_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msim_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_institution_monthly`
--

LOCK TABLES `metrics_counter_submission_institution_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_monthly`
--

DROP TABLE IF EXISTS `metrics_counter_submission_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_monthly` (
  `metrics_counter_submission_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `month` int NOT NULL,
  `metric_book_investigations` int NOT NULL,
  `metric_book_investigations_unique` int NOT NULL,
  `metric_book_requests` int NOT NULL,
  `metric_book_requests_unique` int NOT NULL,
  `metric_chapter_investigations` int NOT NULL,
  `metric_chapter_investigations_unique` int NOT NULL,
  `metric_chapter_requests` int NOT NULL,
  `metric_chapter_requests_unique` int NOT NULL,
  `metric_title_investigations_unique` int NOT NULL,
  `metric_title_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_monthly_id`),
  UNIQUE KEY `msm_uc_context_id_submission_id_month` (`context_id`,`submission_id`,`month`),
  KEY `metrics_counter_submission_monthly_context_id` (`context_id`),
  KEY `metrics_counter_submission_monthly_submission_id` (`submission_id`),
  KEY `msm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_monthly`
--

LOCK TABLES `metrics_counter_submission_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_series`
--

DROP TABLE IF EXISTS `metrics_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_series` (
  `metrics_series_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `series_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric` int NOT NULL,
  PRIMARY KEY (`metrics_series_id`),
  KEY `metrics_series_load_id` (`load_id`),
  KEY `metrics_series_context_id` (`context_id`),
  KEY `metrics_series_series_id` (`series_id`),
  KEY `metrics_series_context_id_series_id` (`context_id`,`series_id`),
  CONSTRAINT `metrics_series_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_series_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics for views of published submissions in each series.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_series`
--

LOCK TABLES `metrics_series` WRITE;
/*!40000 ALTER TABLE `metrics_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_submission`
--

DROP TABLE IF EXISTS `metrics_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission` (
  `metrics_submission_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `file_type` bigint DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `date` date NOT NULL,
  `metric` int NOT NULL,
  PRIMARY KEY (`metrics_submission_id`),
  KEY `ms_load_id` (`load_id`),
  KEY `metrics_submission_context_id` (`context_id`),
  KEY `metrics_submission_submission_id` (`submission_id`),
  KEY `metrics_submission_chapter_id` (`chapter_id`),
  KEY `metrics_submission_representation_id` (`representation_id`),
  KEY `metrics_submission_submission_file_id` (`submission_file_id`),
  KEY `ms_context_id_submission_id_assoc_type_file_type` (`context_id`,`submission_id`,`assoc_type`,`file_type`),
  CONSTRAINT `metrics_submission_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_submission`
--

LOCK TABLES `metrics_submission` WRITE;
/*!40000 ALTER TABLE `metrics_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_submission_geo_daily`
--

DROP TABLE IF EXISTS `metrics_submission_geo_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission_geo_daily` (
  `metrics_submission_geo_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `metric` int NOT NULL,
  `metric_unique` int NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_daily_id`),
  UNIQUE KEY `msgd_uc_load_context_submission_c_r_c_date` (`load_id`,`context_id`,`submission_id`,`country`,`region`,`city`(80),`date`),
  KEY `msgd_load_id` (`load_id`),
  KEY `metrics_submission_geo_daily_context_id` (`context_id`),
  KEY `metrics_submission_geo_daily_submission_id` (`submission_id`),
  KEY `msgd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msgd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics by country, region and city for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_submission_geo_daily`
--

LOCK TABLES `metrics_submission_geo_daily` WRITE;
/*!40000 ALTER TABLE `metrics_submission_geo_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_submission_geo_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_submission_geo_monthly`
--

DROP TABLE IF EXISTS `metrics_submission_geo_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission_geo_monthly` (
  `metrics_submission_geo_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `month` int NOT NULL,
  `metric` int NOT NULL,
  `metric_unique` int NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_monthly_id`),
  UNIQUE KEY `msgm_uc_context_submission_c_r_c_month` (`context_id`,`submission_id`,`country`,`region`,`city`(80),`month`),
  KEY `metrics_submission_geo_monthly_context_id` (`context_id`),
  KEY `metrics_submission_geo_monthly_submission_id` (`submission_id`),
  KEY `msgm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msgm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics by country, region and city for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_submission_geo_monthly`
--

LOCK TABLES `metrics_submission_geo_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_submission_geo_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_submission_geo_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_assignment_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_assignment_setting_id`),
  UNIQUE KEY `navigation_menu_item_assignment_settings_unique` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_assignment_settings_n_m_i_a_id` (`navigation_menu_item_assignment_id`),
  CONSTRAINT `assignment_settings_navigation_menu_item_assignment_id` FOREIGN KEY (`navigation_menu_item_assignment_id`) REFERENCES `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about navigation menu item assignments to navigation menus, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignment_settings`
--

LOCK TABLES `navigation_menu_item_assignment_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignments`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint NOT NULL,
  `navigation_menu_item_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `seq` bigint DEFAULT '0',
  PRIMARY KEY (`navigation_menu_item_assignment_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_id` (`navigation_menu_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_item_id` (`navigation_menu_item_id`),
  KEY `navigation_menu_item_assignments_parent_id` (`parent_id`),
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_id_foreign` FOREIGN KEY (`navigation_menu_id`) REFERENCES `navigation_menus` (`navigation_menu_id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_item_id_foreign` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_menu_item_assignments_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COMMENT='Links navigation menu items to navigation menus.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

LOCK TABLES `navigation_menu_item_assignments` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignments` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignments` VALUES (1,1,1,NULL,0),(2,1,2,NULL,1),(3,1,3,NULL,2),(4,1,4,3,0),(5,1,5,3,1),(6,1,6,3,2),(7,1,7,3,3),(8,2,8,NULL,0),(9,2,9,NULL,1),(10,2,10,NULL,2),(11,2,11,10,0),(12,2,12,10,1),(13,2,13,10,2),(14,2,14,10,3),(15,3,15,NULL,0),(16,3,16,NULL,1),(17,3,17,NULL,2),(18,3,18,17,0),(19,3,19,17,1),(20,3,20,17,2),(21,3,21,17,3),(22,3,22,17,4);
/*!40000 ALTER TABLE `navigation_menu_item_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_setting_id`),
  UNIQUE KEY `navigation_menu_item_settings_unique` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_settings_navigation_menu_id` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COMMENT='More data about navigation menu items, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_settings`
--

LOCK TABLES `navigation_menu_item_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_settings` VALUES (1,1,'','titleLocaleKey','navigation.register','string'),(2,2,'','titleLocaleKey','navigation.login','string'),(3,3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,4,'','titleLocaleKey','navigation.dashboard','string'),(5,5,'','titleLocaleKey','common.viewProfile','string'),(6,6,'','titleLocaleKey','navigation.admin','string'),(7,7,'','titleLocaleKey','user.logOut','string'),(8,8,'','titleLocaleKey','navigation.register','string'),(9,9,'','titleLocaleKey','navigation.login','string'),(10,10,'','titleLocaleKey','{$loggedInUsername}','string'),(11,11,'','titleLocaleKey','navigation.dashboard','string'),(12,12,'','titleLocaleKey','common.viewProfile','string'),(13,13,'','titleLocaleKey','navigation.admin','string'),(14,14,'','titleLocaleKey','user.logOut','string'),(15,15,'','titleLocaleKey','navigation.catalog','string'),(16,16,'','titleLocaleKey','manager.announcements','string'),(17,17,'','titleLocaleKey','navigation.about','string'),(18,18,'','titleLocaleKey','about.aboutContext','string'),(19,19,'','titleLocaleKey','about.submissions','string'),(20,20,'','titleLocaleKey','common.editorialMasthead','string'),(21,21,'','titleLocaleKey','manager.setup.privacyStatement','string'),(22,22,'','titleLocaleKey','about.contact','string'),(23,23,'','titleLocaleKey','common.search','string');
/*!40000 ALTER TABLE `navigation_menu_item_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_items`
--

DROP TABLE IF EXISTS `navigation_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`),
  KEY `navigation_menu_items_context_id` (`context_id`),
  CONSTRAINT `navigation_menu_items_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COMMENT='Navigation menu items are single elements within a navigation menu.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_items`
--

LOCK TABLES `navigation_menu_items` WRITE;
/*!40000 ALTER TABLE `navigation_menu_items` DISABLE KEYS */;
INSERT INTO `navigation_menu_items` VALUES (1,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(2,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(3,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(6,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(7,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),(8,1,NULL,'NMI_TYPE_USER_REGISTER'),(9,1,NULL,'NMI_TYPE_USER_LOGIN'),(10,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(11,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(12,1,NULL,'NMI_TYPE_USER_PROFILE'),(13,1,NULL,'NMI_TYPE_ADMINISTRATION'),(14,1,NULL,'NMI_TYPE_USER_LOGOUT'),(15,1,NULL,'NMI_TYPE_CATALOG'),(16,1,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(17,1,NULL,'NMI_TYPE_ABOUT'),(18,1,NULL,'NMI_TYPE_ABOUT'),(19,1,NULL,'NMI_TYPE_SUBMISSIONS'),(20,1,NULL,'NMI_TYPE_MASTHEAD'),(21,1,NULL,'NMI_TYPE_PRIVACY'),(22,1,NULL,'NMI_TYPE_CONTACT'),(23,1,NULL,'NMI_TYPE_SEARCH');
/*!40000 ALTER TABLE `navigation_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menus`
--

DROP TABLE IF EXISTS `navigation_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`),
  KEY `navigation_menus_context_id` (`context_id`),
  CONSTRAINT `navigation_menus_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Navigation menus on the website are installed with the software as a default set, and can be customized.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menus`
--

LOCK TABLES `navigation_menus` WRITE;
/*!40000 ALTER TABLE `navigation_menus` DISABLE KEYS */;
INSERT INTO `navigation_menus` VALUES (1,NULL,'user','User Navigation Menu'),(2,1,'user','User Navigation Menu'),(3,1,'primary','Primary Navigation Menu');
/*!40000 ALTER TABLE `navigation_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_releases`
--

DROP TABLE IF EXISTS `new_releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_releases` (
  `new_release_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  PRIMARY KEY (`new_release_id`),
  UNIQUE KEY `new_releases_unique` (`assoc_type`,`assoc_id`,`submission_id`),
  KEY `new_releases_submission_id` (`submission_id`),
  CONSTRAINT `new_releases_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Information about which submissions in the press are considered new releases.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_releases`
--

LOCK TABLES `new_releases` WRITE;
/*!40000 ALTER TABLE `new_releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`note_id`),
  KEY `notes_user_id` (`user_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Notes allow users to annotate associated entities, such as submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1048586,1,6,'2024-12-20 05:34:48','2024-12-20 05:34:48','Editor Recommendation','<p>Dear Daniel Barnes, David Buskins,</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission The Information Literacy User’s Guide.</p><p>My recommendation is: Accept Submission.</p><p>Please visit the submission\'s <a href=\"http://localhost/index.php/publicknowledge/en/workflow/access/6\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_settings` (
  `notification_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` bigint NOT NULL,
  `locale` varchar(28) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`notification_setting_id`),
  UNIQUE KEY `notification_settings_unique` (`notification_id`,`locale`,`setting_name`),
  KEY `notification_settings_notification_id` (`notification_id`),
  CONSTRAINT `notification_settings_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COMMENT='More data about notifications, including localized properties.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_settings`
--

LOCK TABLES `notification_settings` WRITE;
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_subscription_settings`
--

DROP TABLE IF EXISTS `notification_subscription_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `user_id` bigint NOT NULL,
  `context_id` bigint DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`),
  KEY `notification_subscription_settings_user_id` (`user_id`),
  KEY `notification_subscription_settings_context` (`context_id`),
  CONSTRAINT `notification_subscription_settings_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `notification_subscription_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='Which email notifications a user has chosen to unsubscribe from.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
INSERT INTO `notification_subscription_settings` VALUES (1,'blocked_emailed_notification','8',19,1,'int'),(2,'blocked_emailed_notification','8',20,1,'int'),(3,'blocked_emailed_notification','8',21,1,'int'),(4,'blocked_emailed_notification','8',22,1,'int'),(5,'blocked_emailed_notification','8',23,1,'int'),(6,'blocked_emailed_notification','8',24,1,'int'),(7,'blocked_emailed_notification','8',25,1,'int'),(8,'blocked_emailed_notification','8',26,1,'int'),(9,'blocked_emailed_notification','8',27,1,'int'),(10,'blocked_emailed_notification','8',28,1,'int'),(11,'blocked_emailed_notification','8',29,1,'int'),(12,'blocked_emailed_notification','8',30,1,'int'),(13,'blocked_emailed_notification','8',31,1,'int'),(14,'blocked_emailed_notification','8',32,1,'int'),(15,'blocked_emailed_notification','8',33,1,'int'),(16,'blocked_emailed_notification','8',34,1,'int');
/*!40000 ALTER TABLE `notification_subscription_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `level` bigint NOT NULL,
  `type` bigint NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint DEFAULT NULL,
  `assoc_id` bigint DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id` (`context_id`),
  KEY `notifications_user_id` (`user_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id_level` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`),
  CONSTRAINT `notifications_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8mb3 COMMENT='User notifications created during certain operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (16,1,4,2,16777217,'2024-12-20 05:27:04',NULL,1048585,1),(17,1,NULL,2,16777243,'2024-12-20 05:27:04',NULL,1048585,1),(18,1,NULL,2,16777245,'2024-12-20 05:27:04',NULL,1048585,1),(19,1,NULL,2,16777236,'2024-12-20 05:27:12',NULL,523,1),(20,1,12,3,16777227,'2024-12-20 05:27:16',NULL,517,1),(22,1,19,2,16777230,'2024-12-20 05:27:21',NULL,1048585,1),(23,1,4,2,16777251,'2024-12-20 05:27:21',NULL,1048585,1),(33,1,NULL,3,16777220,'2024-12-20 05:29:07',NULL,1048585,2),(34,1,NULL,3,16777222,'2024-12-20 05:29:07',NULL,1048585,2),(35,1,NULL,3,16777223,'2024-12-20 05:29:07',NULL,1048585,2),(36,1,NULL,3,16777224,'2024-12-20 05:29:07',NULL,1048585,2),(37,1,1,3,16777247,'2024-12-20 05:29:07',NULL,1048585,2),(38,1,2,3,16777247,'2024-12-20 05:29:07',NULL,1048585,2),(39,1,3,3,16777247,'2024-12-20 05:29:07',NULL,1048585,2),(40,1,NULL,2,16777243,'2024-12-20 05:29:07',NULL,1048585,2),(41,1,NULL,2,16777245,'2024-12-20 05:29:07',NULL,1048585,2),(42,1,NULL,2,16777236,'2024-12-20 05:29:23',NULL,523,2),(43,1,11,3,16777227,'2024-12-20 05:29:31',NULL,517,2),(45,1,12,3,16777227,'2024-12-20 05:29:35',NULL,517,3),(57,1,NULL,3,16777220,'2024-12-20 05:30:15',NULL,1048585,3),(58,1,NULL,3,16777222,'2024-12-20 05:30:15',NULL,1048585,3),(59,1,NULL,3,16777223,'2024-12-20 05:30:15',NULL,1048585,3),(60,1,NULL,3,16777224,'2024-12-20 05:30:15',NULL,1048585,3),(61,1,1,3,16777247,'2024-12-20 05:30:15',NULL,1048585,3),(62,1,2,3,16777247,'2024-12-20 05:30:15',NULL,1048585,3),(63,1,3,3,16777247,'2024-12-20 05:30:16',NULL,1048585,3),(64,1,NULL,2,16777243,'2024-12-20 05:30:16',NULL,1048585,3),(65,1,NULL,2,16777245,'2024-12-20 05:30:16',NULL,1048585,3),(74,1,3,2,16777217,'2024-12-20 05:30:50',NULL,1048585,4),(75,1,NULL,2,16777243,'2024-12-20 05:30:50',NULL,1048585,4),(76,1,NULL,2,16777245,'2024-12-20 05:30:50','2024-12-20 05:31:32',1048585,4),(77,1,NULL,2,16777236,'2024-12-20 05:30:58',NULL,523,3),(79,1,9,3,16777227,'2024-12-20 05:31:04',NULL,517,4),(81,1,NULL,2,16777236,'2024-12-20 05:31:08',NULL,523,4),(83,1,11,3,16777227,'2024-12-20 05:31:13',NULL,517,5),(88,1,22,2,16777235,'2024-12-20 05:31:29',NULL,1048585,4),(89,1,3,2,16777254,'2024-12-20 05:31:29',NULL,1048585,4),(103,1,NULL,3,16777220,'2024-12-20 05:32:27',NULL,1048585,5),(104,1,NULL,3,16777222,'2024-12-20 05:32:27',NULL,1048585,5),(105,1,NULL,3,16777223,'2024-12-20 05:32:27',NULL,1048585,5),(106,1,NULL,3,16777224,'2024-12-20 05:32:27',NULL,1048585,5),(107,1,1,3,16777247,'2024-12-20 05:32:27',NULL,1048585,5),(108,1,2,3,16777247,'2024-12-20 05:32:27',NULL,1048585,5),(109,1,3,3,16777247,'2024-12-20 05:32:27',NULL,1048585,5),(112,1,NULL,2,16777236,'2024-12-20 05:32:37',NULL,523,5),(114,1,8,3,16777227,'2024-12-20 05:32:43',NULL,517,6),(116,1,NULL,2,16777236,'2024-12-20 05:32:48',NULL,523,6),(118,1,12,3,16777227,'2024-12-20 05:32:53',NULL,517,7),(122,1,23,2,16777235,'2024-12-20 05:33:09',NULL,1048585,5),(125,1,NULL,2,16777246,'2024-12-20 05:33:35','2024-12-20 05:33:45',1048585,5),(134,1,4,2,16777217,'2024-12-20 05:34:19',NULL,1048585,6),(135,1,NULL,2,16777243,'2024-12-20 05:34:19',NULL,1048585,6),(136,1,NULL,2,16777245,'2024-12-20 05:34:19',NULL,1048585,6),(137,1,NULL,2,16777236,'2024-12-20 05:34:28',NULL,523,7),(138,1,24,2,16777229,'2024-12-20 05:34:28',NULL,1048585,6),(141,1,3,3,16777249,'2024-12-20 05:34:48',NULL,1048586,1),(142,1,4,3,16777249,'2024-12-20 05:34:48',NULL,1048586,1),(153,1,3,2,16777217,'2024-12-20 05:35:37',NULL,1048585,7),(154,1,NULL,2,16777243,'2024-12-20 05:35:38',NULL,1048585,7),(155,1,NULL,2,16777245,'2024-12-20 05:35:38',NULL,1048585,7),(156,1,NULL,2,16777236,'2024-12-20 05:35:47',NULL,523,8),(157,1,10,3,16777227,'2024-12-20 05:35:53',NULL,517,8),(159,1,25,2,16777230,'2024-12-20 05:35:58',NULL,1048585,7),(160,1,3,2,16777251,'2024-12-20 05:35:58','2024-12-20 05:36:02',1048585,7),(162,1,1,3,16777247,'2024-12-20 05:36:14',NULL,1048585,8),(163,1,2,3,16777247,'2024-12-20 05:36:15',NULL,1048585,8),(164,1,3,3,16777247,'2024-12-20 05:36:15',NULL,1048585,8),(165,1,NULL,2,16777243,'2024-12-20 05:36:15',NULL,1048585,8),(166,1,NULL,2,16777245,'2024-12-20 05:36:15',NULL,1048585,8),(177,1,4,2,16777217,'2024-12-20 05:36:55',NULL,1048585,9),(178,1,NULL,2,16777243,'2024-12-20 05:36:55',NULL,1048585,9),(179,1,NULL,2,16777245,'2024-12-20 05:36:55',NULL,1048585,9),(180,1,NULL,2,16777236,'2024-12-20 05:37:05',NULL,523,9),(181,1,26,2,16777229,'2024-12-20 05:37:05',NULL,1048585,9),(200,1,NULL,3,16777220,'2024-12-20 05:38:19',NULL,1048585,10),(201,1,NULL,3,16777222,'2024-12-20 05:38:19',NULL,1048585,10),(202,1,NULL,3,16777223,'2024-12-20 05:38:19',NULL,1048585,10),(203,1,NULL,3,16777224,'2024-12-20 05:38:19',NULL,1048585,10),(204,1,1,3,16777247,'2024-12-20 05:38:19',NULL,1048585,10),(205,1,2,3,16777247,'2024-12-20 05:38:19',NULL,1048585,10),(206,1,3,3,16777247,'2024-12-20 05:38:19',NULL,1048585,10),(207,1,NULL,2,16777243,'2024-12-20 05:38:19',NULL,1048585,10),(208,1,NULL,2,16777245,'2024-12-20 05:38:19',NULL,1048585,10),(213,1,NULL,3,16777220,'2024-12-20 05:38:39',NULL,1048585,11),(214,1,NULL,3,16777222,'2024-12-20 05:38:39',NULL,1048585,11),(215,1,NULL,3,16777223,'2024-12-20 05:38:40',NULL,1048585,11),(216,1,NULL,3,16777224,'2024-12-20 05:38:40',NULL,1048585,11),(217,1,1,3,16777247,'2024-12-20 05:38:40',NULL,1048585,11),(218,1,2,3,16777247,'2024-12-20 05:38:40',NULL,1048585,11),(219,1,3,3,16777247,'2024-12-20 05:38:40',NULL,1048585,11),(220,1,NULL,2,16777243,'2024-12-20 05:38:40',NULL,1048585,11),(221,1,NULL,2,16777245,'2024-12-20 05:38:40',NULL,1048585,11),(222,1,NULL,2,16777236,'2024-12-20 05:38:48',NULL,523,10),(224,1,9,3,16777227,'2024-12-20 05:38:54',NULL,517,9),(226,1,NULL,2,16777236,'2024-12-20 05:38:58',NULL,523,11),(232,1,28,2,16777230,'2024-12-20 05:39:36',NULL,1048585,11),(239,1,NULL,3,16777220,'2024-12-20 05:40:08',NULL,1048585,12),(240,1,NULL,3,16777222,'2024-12-20 05:40:08',NULL,1048585,12),(241,1,NULL,3,16777223,'2024-12-20 05:40:08',NULL,1048585,12),(242,1,NULL,3,16777224,'2024-12-20 05:40:08',NULL,1048585,12),(243,1,1,3,16777247,'2024-12-20 05:40:08',NULL,1048585,12),(244,1,2,3,16777247,'2024-12-20 05:40:08',NULL,1048585,12),(245,1,3,3,16777247,'2024-12-20 05:40:08',NULL,1048585,12),(246,1,NULL,2,16777243,'2024-12-20 05:40:08',NULL,1048585,12),(247,1,NULL,2,16777245,'2024-12-20 05:40:08',NULL,1048585,12),(248,1,NULL,2,16777236,'2024-12-20 05:40:17',NULL,523,12),(249,1,29,2,16777229,'2024-12-20 05:40:18',NULL,1048585,12),(250,1,7,3,16777227,'2024-12-20 05:40:24',NULL,517,12),(254,1,9,3,16777227,'2024-12-20 05:40:30',NULL,517,14),(262,1,NULL,3,16777220,'2024-12-20 05:41:07',NULL,1048585,13),(263,1,NULL,3,16777222,'2024-12-20 05:41:07',NULL,1048585,13),(264,1,NULL,3,16777223,'2024-12-20 05:41:07',NULL,1048585,13),(265,1,NULL,3,16777224,'2024-12-20 05:41:07',NULL,1048585,13),(266,1,1,3,16777247,'2024-12-20 05:41:07',NULL,1048585,13),(267,1,2,3,16777247,'2024-12-20 05:41:07',NULL,1048585,13),(268,1,3,3,16777247,'2024-12-20 05:41:07',NULL,1048585,13),(269,1,NULL,2,16777243,'2024-12-20 05:41:07',NULL,1048585,13),(270,1,NULL,2,16777245,'2024-12-20 05:41:07',NULL,1048585,13),(271,1,NULL,2,16777236,'2024-12-20 05:41:17',NULL,523,13),(273,1,8,3,16777227,'2024-12-20 05:41:23',NULL,517,15),(275,1,NULL,2,16777236,'2024-12-20 05:41:27',NULL,523,14),(279,1,11,3,16777227,'2024-12-20 05:41:36',NULL,517,17),(283,1,30,2,16777230,'2024-12-20 05:42:11',NULL,1048585,13),(293,1,3,2,16777217,'2024-12-20 05:42:52',NULL,1048585,14),(296,1,NULL,2,16777236,'2024-12-20 05:43:03',NULL,523,15),(298,1,7,3,16777227,'2024-12-20 05:43:10',NULL,517,19),(300,1,NULL,2,16777236,'2024-12-20 05:43:15',NULL,523,16),(302,1,11,3,16777227,'2024-12-20 05:43:22',NULL,517,20),(307,1,31,2,16777235,'2024-12-20 05:43:39',NULL,1048585,14),(308,1,3,2,16777254,'2024-12-20 05:43:39',NULL,1048585,14),(311,1,NULL,2,16777246,'2024-12-20 05:44:30',NULL,1048585,14),(318,1,NULL,3,16777220,'2024-12-20 05:44:56',NULL,1048585,15),(319,1,NULL,3,16777222,'2024-12-20 05:44:56',NULL,1048585,15),(320,1,NULL,3,16777223,'2024-12-20 05:44:56',NULL,1048585,15),(321,1,NULL,3,16777224,'2024-12-20 05:44:56',NULL,1048585,15),(322,1,1,3,16777247,'2024-12-20 05:44:56',NULL,1048585,15),(323,1,2,3,16777247,'2024-12-20 05:44:56',NULL,1048585,15),(324,1,3,3,16777247,'2024-12-20 05:44:56',NULL,1048585,15),(325,1,NULL,2,16777243,'2024-12-20 05:44:56',NULL,1048585,15),(326,1,NULL,2,16777245,'2024-12-20 05:44:56',NULL,1048585,15),(327,1,NULL,2,16777236,'2024-12-20 05:45:05',NULL,523,17),(338,1,NULL,3,16777220,'2024-12-20 05:45:48',NULL,1048585,16),(339,1,NULL,3,16777222,'2024-12-20 05:45:48',NULL,1048585,16),(340,1,NULL,3,16777223,'2024-12-20 05:45:48',NULL,1048585,16),(341,1,NULL,3,16777224,'2024-12-20 05:45:48',NULL,1048585,16),(342,1,1,3,16777247,'2024-12-20 05:45:48',NULL,1048585,16),(343,1,2,3,16777247,'2024-12-20 05:45:48',NULL,1048585,16),(344,1,3,3,16777247,'2024-12-20 05:45:48',NULL,1048585,16),(345,1,NULL,2,16777243,'2024-12-20 05:45:48',NULL,1048585,16),(346,1,NULL,2,16777245,'2024-12-20 05:45:48',NULL,1048585,16),(347,1,NULL,2,16777236,'2024-12-20 05:45:58',NULL,523,18),(350,1,11,3,16777227,'2024-12-20 05:46:08',NULL,517,22),(352,1,12,3,16777227,'2024-12-20 05:46:10',NULL,517,23),(366,1,NULL,3,16777220,'2024-12-20 05:47:11',NULL,1048585,17),(367,1,NULL,3,16777222,'2024-12-20 05:47:11',NULL,1048585,17),(368,1,NULL,3,16777223,'2024-12-20 05:47:11',NULL,1048585,17),(369,1,NULL,3,16777224,'2024-12-20 05:47:11',NULL,1048585,17),(370,1,1,3,16777247,'2024-12-20 05:47:11',NULL,1048585,17),(371,1,2,3,16777247,'2024-12-20 05:47:11',NULL,1048585,17),(372,1,3,3,16777247,'2024-12-20 05:47:12',NULL,1048585,17),(373,1,NULL,2,16777243,'2024-12-20 05:47:12',NULL,1048585,17),(374,1,NULL,2,16777245,'2024-12-20 05:47:12',NULL,1048585,17),(375,1,NULL,2,16777236,'2024-12-20 05:47:23',NULL,523,19),(376,1,34,2,16777229,'2024-12-20 05:47:24',NULL,1048585,17),(377,1,7,3,16777227,'2024-12-20 05:47:31',NULL,517,24),(379,1,8,3,16777227,'2024-12-20 05:47:34',NULL,517,25);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oai_resumption_tokens` (
  `oai_resumption_token_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `expire` bigint NOT NULL,
  `record_offset` int NOT NULL,
  `params` text,
  PRIMARY KEY (`oai_resumption_token_id`),
  UNIQUE KEY `oai_resumption_tokens_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAI resumption tokens are used to allow for pagination of large result sets into manageable pieces.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_resumption_tokens`
--

LOCK TABLES `oai_resumption_tokens` WRITE;
/*!40000 ALTER TABLE `oai_resumption_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_resumption_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_settings`
--

DROP TABLE IF EXISTS `plugin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_settings` (
  `plugin_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint DEFAULT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`plugin_setting_id`),
  UNIQUE KEY `plugin_settings_unique` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_context_id` (`context_id`),
  KEY `plugin_settings_plugin_name` (`plugin_name`),
  CONSTRAINT `plugin_settings_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COMMENT='More data about plugins, including localized properties. This table is frequently used to store plugin-specific configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES (1,'defaultthemeplugin',NULL,'enabled','1','bool'),(2,'usageeventplugin',NULL,'enabled','1','bool'),(3,'tinymceplugin',NULL,'enabled','1','bool'),(4,'languagetoggleblockplugin',NULL,'enabled','1','bool'),(5,'languagetoggleblockplugin',NULL,'seq','4','int'),(6,'languagetoggleblockplugin',NULL,'context','1','int'),(7,'developedbyblockplugin',NULL,'enabled','0','bool'),(8,'developedbyblockplugin',NULL,'seq','0','int'),(9,'developedbyblockplugin',NULL,'context','1','int'),(10,'tinymceplugin',1,'enabled','1','bool'),(11,'defaultthemeplugin',1,'enabled','1','bool'),(12,'languagetoggleblockplugin',1,'enabled','1','bool'),(13,'languagetoggleblockplugin',1,'seq','4','int'),(14,'languagetoggleblockplugin',1,'context','1','int'),(15,'browseblockplugin',1,'enabled','1','bool'),(16,'browseblockplugin',1,'seq','1','int'),(17,'browseblockplugin',1,'context','1','int'),(18,'browseblockplugin',1,'browseNewReleases','1','bool'),(19,'browseblockplugin',1,'browseCategories','1','bool'),(20,'browseblockplugin',1,'browseSeries','1','bool'),(21,'developedbyblockplugin',1,'enabled','0','bool'),(22,'developedbyblockplugin',1,'seq','0','int'),(23,'developedbyblockplugin',1,'context','1','int'),(24,'informationblockplugin',1,'enabled','1','bool'),(25,'informationblockplugin',1,'seq','7','int'),(26,'informationblockplugin',1,'context','1','int'),(27,'htmlmonographfileplugin',1,'enabled','1','bool'),(28,'dublincoremetaplugin',1,'enabled','1','bool'),(29,'pdfjsviewerplugin',1,'enabled','1','bool'),(30,'googlescholarplugin',1,'enabled','1','bool'),(31,'webfeedplugin',1,'enabled','1','bool'),(32,'webfeedplugin',1,'displayPage','homepage','string'),(33,'webfeedplugin',1,'displayItems','1','bool'),(34,'webfeedplugin',1,'recentItems','30','int'),(35,'webfeedplugin',1,'includeIdentifiers','0','bool'),(36,'defaultthemeplugin',1,'typography','notoSans','string'),(37,'defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),(38,'defaultthemeplugin',1,'baseColour','#1E6292','string'),(39,'defaultthemeplugin',1,'showCatalogSeriesListing','false','string'),(40,'defaultthemeplugin',1,'displayStats','none','string');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `press_settings`
--

DROP TABLE IF EXISTS `press_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `press_settings` (
  `press_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `press_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  PRIMARY KEY (`press_setting_id`),
  UNIQUE KEY `press_settings_unique` (`press_id`,`locale`,`setting_name`),
  KEY `press_settings_press_id` (`press_id`),
  CONSTRAINT `press_settings_press_id_foreign` FOREIGN KEY (`press_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3 COMMENT='More data about presses, including localized properties such as policies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `press_settings`
--

LOCK TABLES `press_settings` WRITE;
/*!40000 ALTER TABLE `press_settings` DISABLE KEYS */;
INSERT INTO `press_settings` VALUES (1,1,'en','acronym','JPK'),(3,1,'en','authorGuidelines','<p>Authors are invited to make a submission to this press. Those submissions considered to be a good fit will be sent for peer review before determining whether they will be accepted or rejected.</p><p>Before making a submission, authors are responsible for obtaining permission to publish any material included with the submission, such as photos, documents and datasets. All authors identified on the submission must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p>An editor may desk reject a submission if it does not meet minimum standards of quality. Before submitting, please ensure that the scope and outline of the book are structured and articulated properly. The title should be concise and the abstract should be able to stand on its own. This will increase the likelihood of reviewers agreeing to review the book. When you\'re satisfied that your submission meets this standard, please follow the checklist below to prepare your submission.</p>'),(4,1,'fr_CA','authorGuidelines','##default.contextSettings.authorGuidelines##'),(5,1,'en','authorInformation','Interested in submitting to this press? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Press</a> page for the press\' section policies and <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the 5 step process.'),(6,1,'fr_CA','authorInformation','Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href=\"http://localhost/index.php/publicknowledge/about\">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Lignes directrices à l\'intention des auteurs-es</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> auprès de la presse avant d\'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href=\"http://localhost/index.php/index/login\">d\'ouvrir une session</a> pour débuter la procédure en 5 étapes.'),(7,1,'en','beginSubmissionHelp','<p>Thank you for submitting to the Public Knowledge Press. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our editors evaluate your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>'),(8,1,'fr_CA','beginSubmissionHelp','<p>Merci de votre soumission à la revue Public Knowledge Press. Il vous sera demandé de téléverser des fichiers, identifier des co-auteur.trice.s et fournir des informations comme le titre et le résumé.<p><p>Si vous ne l\'avez pas encore fait, merci de consulter nos <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Recommandations pour la soumission</a>. Lorsque vous remplissez les formulaires, merci de fournir autant de détails que possible pour aider nos éditeur.trice.s à évaluer votre travail. </p><p>Une fois que vous avez commencé, vous pouvez enregistrer votre soumission et y revenir plus tard. Vous pourrez alors réviser et modifier toutes les informations voulues avant de soumettre le tout.</p>'),(9,1,'','contactEmail','rvaca@mailinator.com'),(10,1,'','contactName','Ramiro Vaca'),(11,1,'en','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission, as well as a copy of all editorial decisions recorded against this submission.</p><p>If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the editor at a later step in the submission process.</p>'),(12,1,'fr_CA','contributorsHelp','<p>Ajouter des informations relatives à tous les contributeurs.trices à cette soumission. Les contributeurs.trices ajouté.e.s ici se verront envoyer un courriel de confirmation de la soumission ainsi qu\'une copie de toutes les décisions éditoriales enregistrées pour cette soumission.</p><p>Si un.e contributeur.trice ne peut être contacté.e par courriel parce qu\'il ou elle doit demeurer anonyme ou n\'a pas de compte de messagerie, veuillez ne pas entrer de courriel fictif. Vous pouvez ajouter des informations sur ce ou cette contributeur.trice à une étape ultérieure du processus de soumission.</p>'),(13,1,'','country','IS'),(14,1,'','defaultReviewMode','2'),(15,1,'en','description','<p>Public Knowledge Press is a publisher dedicated to the subject of public access to science.</p>'),(16,1,'fr_CA','description','<p>Le Press de Public Knowledge est une presse sur le thème de l\'accès du public à la science.</p>'),(17,1,'en','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>'),(18,1,'fr_CA','detailsHelp','<p>Veuillez fournir les informations suivantes afin de nous aider à gérer votre soumission dans notre système.</p>'),(19,1,'','emailSignature','<br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(20,1,'','enableDois','1'),(21,1,'','doiSuffixType','default'),(22,1,'','registrationAgency',''),(23,1,'','disableSubmissions','0'),(24,1,'','editorialStatsEmail','1'),(25,1,'en','forTheEditorsHelp','<p>Please provide the following details in order to help our editorial team manage your submission.</p><p>When entering metadata, provide entries that you think would be most helpful to the person managing your submission. This information can be changed before publication.</p>'),(26,1,'fr_CA','forTheEditorsHelp','<p>S\'il vous plaît, fournissez les détails suivants afin d\'aider l\'équipe éditoriale à gérer votre soumission.</p><p>Dans vos métadonnées, assurez vous de fournir des informations que vous pensez pouvoir être utile à la personne qui gérera votre soumission. Cette information peut être changée avant publication.</p>'),(27,1,'','itemsPerPage','25'),(28,1,'','keywords','request'),(29,1,'en','librarianInformation','We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"https://pkp.sfu.ca/omp\">Open Monograph Press</a>).'),(30,1,'fr_CA','librarianInformation','Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d\'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l\'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).'),(31,1,'en','name','Public Knowledge Press'),(32,1,'fr_CA','name','Press de la connaissance du public'),(33,1,'','notifyAllAuthors','1'),(34,1,'','numPageLinks','10'),(35,1,'','numWeeksPerResponse','4'),(36,1,'','numWeeksPerReview','4'),(37,1,'','numReviewersPerSubmission','0'),(38,1,'en','openAccessPolicy','This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.'),(39,1,'fr_CA','openAccessPolicy','Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l\'échelle mondiale.'),(40,1,'','orcidCity',''),(41,1,'','orcidClientId',''),(42,1,'','orcidClientSecret',''),(43,1,'','orcidEnabled','0'),(44,1,'','orcidLogLevel','ERROR'),(45,1,'','orcidSendMailToAuthorsOnPublication','0'),(46,1,'en','privacyStatement','<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>'),(47,1,'fr_CA','privacyStatement','<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d\'autres fins ou transmis à une tierce partie.</p>'),(48,1,'en','readerInformation','We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.'),(49,1,'fr_CA','readerInformation','Nous encourageons les lecteurs à s\'abonner au service d\'avis de publication de cette presse. Utilisez le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">d\'inscription</a> situé en haut de la page d\'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d\'affirmer qu\'elle compte un certain nombre de lecteurs. Consultez <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">l\'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d\'autres fins.'),(50,1,'en','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p><p>Once you complete your submission, a member of our editorial team will be assigned to review it. Please ensure the details you have entered here are as accurate as possible.</p>'),(51,1,'fr_CA','reviewHelp','<p>Révisez l\'information que vous avez fourni avant de finaliser votre soumission. Vous pouvez modifier chaque détails affichés en cliquant sur le bouton d\'édition en haut de chaque section.</p><p>Une fois votre soumission transmise, un membre de l\'équipe éditoriale lui sera assigné afin de l\'évaluer. S\'il vous plaît, assurez vous que les détails fournis sont le plus exactes possibles.</p>'),(52,1,'','submissionAcknowledgement','allAuthors'),(53,1,'en','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously published, nor is it before another press for consideration.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to publish all photos, datasets and other material provided with this submission.</li></ul>'),(54,1,'fr_CA','submissionChecklist','##default.contextSettings.checklist##'),(55,1,'','submitWithCategories','0'),(56,1,'','supportedAddedSubmissionLocales','[\"en\",\"fr_CA\"]'),(57,1,'','supportedDefaultSubmissionLocale','en'),(58,1,'','supportedFormLocales','[\"en\",\"fr_CA\"]'),(59,1,'','supportedLocales','[\"en\",\"fr_CA\"]'),(60,1,'','supportedSubmissionLocales','[\"en\",\"fr_CA\"]'),(61,1,'','supportedSubmissionMetadataLocales','[\"en\",\"fr_CA\"]'),(62,1,'','themePluginPath','default'),(63,1,'','type','enable'),(64,1,'en','uploadFilesHelp','<p>Provide any files our editorial team may need to evaluate your submission. In addition to the main work, you may wish to submit data sets, conflict of interest statements, or other supplementary files if these will be helpful for our editors.</p>'),(65,1,'fr_CA','uploadFilesHelp','<p> Fournir tous les fichiers dont notre équipe éditoriale pourrait avoir besoin pour évaluer votre soumission. En plus du fichier principal, vous pouvez soumettre des ensembles de données, une déclaration relative au conflit d\'intérêt ou tout autre fichier potentiellement utile pour nos éditeur.trice.s.</p>'),(66,1,'','enableGeoUsageStats','disabled'),(67,1,'','enableInstitutionUsageStats','0'),(68,1,'','isSushiApiPublic','1'),(69,1,'','coverThumbnailsMaxWidth','106'),(70,1,'','coverThumbnailsMaxHeight','100'),(71,1,'','enabledDoiTypes','[\"publication\"]'),(72,1,'','doiCreationTime','copyEditCreationTime'),(73,1,'','paymentPluginName','ManualPayment'),(74,1,'','doiVersioning','0'),(75,1,'en','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">'),(76,1,'en','searchDescription','Public Knowledge Press is a publisher dedicated to the subject of public access to science.'),(77,1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada'),(78,1,'','supportEmail','rvaca@mailinator.com'),(79,1,'','supportName','Ramiro Vaca');
/*!40000 ALTER TABLE `press_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presses`
--

DROP TABLE IF EXISTS `presses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presses` (
  `press_id` bigint NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `primary_locale` varchar(28) NOT NULL,
  `enabled` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`press_id`),
  UNIQUE KEY `press_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='A list of presses managed by the system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presses`
--

LOCK TABLES `presses` WRITE;
/*!40000 ALTER TABLE `presses` DISABLE KEYS */;
INSERT INTO `presses` VALUES (1,'publicknowledge',1,'en',1);
/*!40000 ALTER TABLE `presses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_categories`
--

DROP TABLE IF EXISTS `publication_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_categories` (
  `publication_category_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`publication_category_id`),
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`),
  KEY `publication_categories_publication_id` (`publication_id`),
  KEY `publication_categories_category_id` (`category_id`),
  CONSTRAINT `publication_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `publication_categories_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Associates publications (and thus submissions) with categories.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_categories`
--

LOCK TABLES `publication_categories` WRITE;
/*!40000 ALTER TABLE `publication_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_dates`
--

DROP TABLE IF EXISTS `publication_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_dates` (
  `publication_date_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `role` varchar(40) NOT NULL,
  `date_format` varchar(40) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`publication_date_id`),
  KEY `publication_dates_publication_format_id` (`publication_format_id`),
  KEY `format_publication_dates_pkey` (`publication_date_id`,`publication_format_id`,`role`),
  CONSTRAINT `publication_dates_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ONIX publication dates for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_dates`
--

LOCK TABLES `publication_dates` WRITE;
/*!40000 ALTER TABLE `publication_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_format_settings`
--

DROP TABLE IF EXISTS `publication_format_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_format_settings` (
  `publication_format_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`publication_format_setting_id`),
  UNIQUE KEY `publication_format_settings_unique` (`publication_format_id`,`locale`,`setting_name`),
  KEY `publication_format_id_key` (`publication_format_id`),
  CONSTRAINT `publication_format_settings_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='More data about publication formats, including localized properties.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_format_settings`
--

LOCK TABLES `publication_format_settings` WRITE;
/*!40000 ALTER TABLE `publication_format_settings` DISABLE KEYS */;
INSERT INTO `publication_format_settings` VALUES (1,1,'en','name','PDF','string'),(2,1,'fr_CA','name','','string'),(3,2,'en','name','PDF','string'),(4,2,'fr_CA','name','','string'),(5,3,'en','name','PDF','string'),(6,3,'fr_CA','name','','string');
/*!40000 ALTER TABLE `publication_format_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_formats`
--

DROP TABLE IF EXISTS `publication_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_formats` (
  `publication_format_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `physical_format` smallint DEFAULT '1',
  `entry_key` varchar(64) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `file_size` varchar(255) DEFAULT NULL,
  `front_matter` varchar(255) DEFAULT NULL,
  `back_matter` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `height_unit_code` varchar(255) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `width_unit_code` varchar(255) DEFAULT NULL,
  `thickness` varchar(255) DEFAULT NULL,
  `thickness_unit_code` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `weight_unit_code` varchar(255) DEFAULT NULL,
  `product_composition_code` varchar(255) DEFAULT NULL,
  `product_form_detail_code` varchar(255) DEFAULT NULL,
  `country_manufacture_code` varchar(255) DEFAULT NULL,
  `imprint` varchar(255) DEFAULT NULL,
  `product_availability_code` varchar(255) DEFAULT NULL,
  `technical_protection_code` varchar(255) DEFAULT NULL,
  `returnable_indicator_code` varchar(255) DEFAULT NULL,
  `remote_url` varchar(2047) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL,
  `is_approved` smallint NOT NULL DEFAULT '0',
  `is_available` smallint NOT NULL DEFAULT '0',
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`publication_format_id`),
  KEY `publication_formats_publication_id` (`publication_id`),
  KEY `publication_formats_doi_id` (`doi_id`),
  CONSTRAINT `publication_formats_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publication_formats_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Publication formats are representations of a publication in a particular format, e.g. PDF, hardcover, etc. Each publication format may contain many chapters.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_formats`
--

LOCK TABLES `publication_formats` WRITE;
/*!40000 ALTER TABLE `publication_formats` DISABLE KEYS */;
INSERT INTO `publication_formats` VALUES (1,4,0,'DA',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://file-examples-com.github.io/uploads/2017/10/file-sample_150kB.pdf',NULL,0,0,NULL),(2,5,0,'DA',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(3,14,0,'DA',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL);
/*!40000 ALTER TABLE `publication_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_settings`
--

DROP TABLE IF EXISTS `publication_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_settings` (
  `publication_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`publication_setting_id`),
  UNIQUE KEY `publication_settings_unique` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_settings_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COMMENT='More data about publications, including localized properties such as the title and abstract.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (1,1,'en','abstract','The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.'),(2,1,'en','title','The ABCs of Human Survival: A Paradigm for Global Citizenship'),(3,2,'en','title','The West and Beyond: New Perspectives on an Imagined Region'),(4,2,'en','abstract','<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>'),(5,3,'en','abstract','Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.'),(6,3,'en','title','The Political Economy of Workplace Injury in Canada'),(7,4,'en','abstract','What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.'),(8,4,'en','title','How Canadians Communicate: Contexts of Canadian Popular Culture'),(9,5,'en','abstract','Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.'),(10,5,'en','title','Bomb Canada and Other Unkind Remarks in the American Media'),(11,5,'en','copyrightHolder','Public Knowledge Press'),(12,5,'fr_CA','copyrightHolder','Press de la connaissance du public'),(13,5,'','copyrightYear','2024'),(14,6,'en','abstract','Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.'),(15,6,'en','title','The Information Literacy User’s Guide'),(16,7,'en','abstract','Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.'),(17,7,'en','title','Accessible Elements: Teaching Science Online and at a Distance'),(18,8,'en','abstract','A Note From The Publisher'),(19,8,'en','title','Editorial'),(20,9,'en','abstract','In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.'),(21,9,'en','title','Enabling Openness: The future of the information society in Latin America and the Caribbean'),(22,10,'en','abstract','While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.'),(23,10,'en','title','Lost Tracks: Buffalo National Park, 1909-1939'),(24,11,'en','abstract','Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.'),(25,11,'en','title','Dreamwork'),(26,12,'en','abstract','Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.'),(27,12,'en','title','Connecting ICTs to Development'),(28,13,'en','abstract','This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.'),(29,13,'en','title','Mobile Learning: Transforming the Delivery of Education and Training'),(30,14,'en','abstract','From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.'),(31,14,'en','title','From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots'),(32,14,'en','copyrightHolder','Public Knowledge Press'),(33,14,'fr_CA','copyrightHolder','Press de la connaissance du public'),(34,14,'','copyrightYear','2024'),(35,15,'en','abstract','A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.'),(36,15,'en','title','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978'),(37,16,'en','abstract','Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.'),(38,16,'en','title','A Designer\'s Log: Case Studies in Instructional Design'),(39,17,'en','abstract','The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.'),(40,17,'en','title','Open Development: Networked Innovations in International Development');
/*!40000 ALTER TABLE `publication_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `publication_id` bigint NOT NULL AUTO_INCREMENT,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `primary_contact_id` bigint DEFAULT NULL,
  `publication_date_type` varchar(32) DEFAULT 'pub',
  `publication_type` varchar(32) DEFAULT 'publication',
  `seq` double NOT NULL DEFAULT '0',
  `series_id` bigint DEFAULT NULL,
  `series_position` varchar(255) DEFAULT NULL,
  `submission_id` bigint NOT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint DEFAULT NULL,
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_primary_contact_id` (`primary_contact_id`),
  KEY `publications_section_id` (`series_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_doi_id` (`doi_id`),
  CONSTRAINT `publications_author_id` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COMMENT='Each publication is one version of a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,NULL,'2024-12-20 05:26:45',1,'pub','publication',0,1,NULL,1,1,NULL,1,NULL),(2,NULL,'2024-12-20 05:27:44',2,'pub','publication',0,NULL,NULL,2,1,NULL,1,NULL),(3,NULL,'2024-12-20 05:29:43',11,'pub','publication',0,NULL,NULL,3,1,NULL,1,NULL),(4,NULL,'2024-12-20 05:30:23',12,'pub','publication',0,3,NULL,4,1,NULL,1,NULL),(5,'2024-12-20','2024-12-20 05:33:46',16,'pub','publication',0,NULL,NULL,5,3,NULL,1,NULL),(6,NULL,'2024-12-20 05:33:52',17,'pub','publication',0,1,NULL,6,1,NULL,1,NULL),(7,NULL,'2024-12-20 05:35:03',21,'pub','publication',0,4,NULL,7,1,NULL,1,NULL),(8,NULL,'2024-12-20 05:36:11',NULL,'pub','publication',0,NULL,NULL,8,1,NULL,1,NULL),(9,NULL,'2024-12-20 05:36:21',26,'pub','publication',0,1,NULL,9,1,NULL,1,NULL),(10,NULL,'2024-12-20 05:37:16',31,'pub','publication',0,NULL,NULL,10,1,NULL,1,NULL),(11,NULL,'2024-12-20 05:38:27',32,'pub','publication',0,NULL,NULL,11,1,NULL,1,NULL),(12,NULL,'2024-12-20 05:39:46',33,'pub','publication',0,NULL,NULL,12,1,NULL,1,NULL),(13,NULL,'2024-12-20 05:40:47',41,'pub','publication',0,NULL,NULL,13,1,NULL,1,NULL),(14,'2024-12-20','2024-12-20 05:44:30',45,'pub','publication',0,5,NULL,14,3,NULL,1,NULL),(15,NULL,'2024-12-20 05:44:37',48,'pub','publication',0,NULL,NULL,15,1,NULL,1,NULL),(16,NULL,'2024-12-20 05:45:16',49,'pub','publication',0,NULL,NULL,16,1,NULL,1,NULL),(17,NULL,'2024-12-20 05:46:28',50,'pub','publication',0,NULL,NULL,17,1,NULL,1,NULL);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `query_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Discussions, usually related to a submission, created by editors, authors and other editorial staff.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,1048585,6,2,1,'2024-12-20 05:34:48','2024-12-20 05:34:48',0);
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_participants`
--

DROP TABLE IF EXISTS `query_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_participants` (
  `query_participant_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `query_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`query_participant_id`),
  UNIQUE KEY `query_participants_unique` (`query_id`,`user_id`),
  KEY `query_participants_query_id` (`query_id`),
  KEY `query_participants_user_id` (`user_id`),
  CONSTRAINT `query_participants_query_id_foreign` FOREIGN KEY (`query_id`) REFERENCES `queries` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `query_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='The users assigned to a discussion.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_participants`
--

LOCK TABLES `query_participants` WRITE;
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
INSERT INTO `query_participants` VALUES (1,1,3),(2,1,4);
/*!40000 ALTER TABLE `query_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queued_payments`
--

DROP TABLE IF EXISTS `queued_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of queued (unfilled) payments, i.e. payments that have not yet been completed via an online payment system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queued_payments`
--

LOCK TABLES `queued_payments` WRITE;
/*!40000 ALTER TABLE `queued_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `queued_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representatives`
--

DROP TABLE IF EXISTS `representatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `representatives` (
  `representative_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `role` varchar(40) NOT NULL,
  `representative_id_type` varchar(255) DEFAULT NULL,
  `representative_id_value` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `is_supplier` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`representative_id`),
  KEY `representatives_submission_id` (`submission_id`),
  KEY `format_representatives_pkey` (`representative_id`,`submission_id`),
  CONSTRAINT `representatives_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ONIX representatives for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representatives`
--

LOCK TABLES `representatives` WRITE;
/*!40000 ALTER TABLE `representatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `representatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignments`
--

DROP TABLE IF EXISTS `review_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_assignments` (
  `review_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `reviewer_id` bigint NOT NULL,
  `competing_interests` text,
  `recommendation` smallint DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint NOT NULL DEFAULT '0',
  `declined` smallint NOT NULL DEFAULT '0',
  `cancelled` smallint NOT NULL DEFAULT '0',
  `date_cancelled` datetime DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint DEFAULT NULL,
  `review_round_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `review_method` smallint NOT NULL DEFAULT '1',
  `round` smallint NOT NULL DEFAULT '1',
  `step` smallint NOT NULL DEFAULT '1',
  `review_form_id` bigint DEFAULT NULL,
  `considered` smallint DEFAULT NULL,
  `request_resent` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignment_reviewer_round` (`review_round_id`,`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`),
  CONSTRAINT `review_assignments_review_form_id_foreign` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`),
  CONSTRAINT `review_assignments_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`),
  CONSTRAINT `review_assignments_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `review_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COMMENT='Data about peer review assignments for all submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES (1,1,12,NULL,NULL,'2024-12-20 05:27:16','2024-12-20 05:27:16',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:27:16',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,NULL,0),(2,2,11,NULL,NULL,'2024-12-20 05:29:31','2024-12-20 05:29:31',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:29:31',0,0,0,NULL,NULL,NULL,NULL,2,3,1,1,1,NULL,NULL,0),(3,2,12,NULL,NULL,'2024-12-20 05:29:35','2024-12-20 05:29:35',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:29:35',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,NULL,0),(4,4,9,NULL,NULL,'2024-12-20 05:31:04','2024-12-20 05:31:04',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:31:04',0,0,0,NULL,NULL,NULL,NULL,3,2,2,1,1,NULL,NULL,0),(5,4,11,NULL,NULL,'2024-12-20 05:31:13','2024-12-20 05:31:13',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:31:13',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,NULL,0),(6,5,8,NULL,NULL,'2024-12-20 05:32:43','2024-12-20 05:32:43',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:32:43',0,0,0,NULL,NULL,NULL,NULL,5,2,2,1,1,NULL,NULL,0),(7,5,12,NULL,NULL,'2024-12-20 05:32:53','2024-12-20 05:32:53',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:32:53',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,NULL,0),(8,7,10,NULL,NULL,'2024-12-20 05:35:53','2024-12-20 05:35:53',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:35:53',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,1,NULL,NULL,0),(9,11,9,NULL,NULL,'2024-12-20 05:38:54','2024-12-20 05:38:54',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:38:54',0,0,0,NULL,NULL,NULL,NULL,10,2,2,1,1,NULL,NULL,0),(10,11,10,NULL,0,'2024-12-20 05:39:03','2024-12-20 05:39:03','2024-12-20 05:39:12','2024-12-20 05:39:16','2024-12-20 05:39:36','2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:39:36',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,4,NULL,NULL,0),(11,11,12,NULL,0,'2024-12-20 05:39:06','2024-12-20 05:39:06','2024-12-20 05:39:21','2024-12-20 05:39:25','2024-12-20 05:39:36','2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:39:36',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,4,NULL,NULL,0),(12,12,7,NULL,NULL,'2024-12-20 05:40:24','2024-12-20 05:40:24',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:40:24',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,NULL,0),(13,12,8,NULL,0,'2024-12-20 05:40:26','2024-12-20 05:40:27','2024-12-20 05:40:36','2024-12-20 05:40:40',NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:40:40',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,4,NULL,NULL,0),(14,12,9,NULL,NULL,'2024-12-20 05:40:30','2024-12-20 05:40:30',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:40:30',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,NULL,0),(15,13,8,NULL,NULL,'2024-12-20 05:41:23','2024-12-20 05:41:23',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:41:23',0,0,0,NULL,NULL,NULL,NULL,13,2,2,1,1,NULL,NULL,0),(16,13,10,NULL,0,'2024-12-20 05:41:33','2024-12-20 05:41:33','2024-12-20 05:41:45','2024-12-20 05:41:49','2024-12-20 05:42:10','2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:42:10',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,4,NULL,NULL,0),(17,13,11,NULL,NULL,'2024-12-20 05:41:36','2024-12-20 05:41:36',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:41:36',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,NULL,0),(18,13,12,NULL,0,'2024-12-20 05:41:39','2024-12-20 05:41:39','2024-12-20 05:41:54','2024-12-20 05:41:58','2024-12-20 05:42:10','2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:42:10',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,4,NULL,NULL,0),(19,14,7,NULL,NULL,'2024-12-20 05:43:10','2024-12-20 05:43:10',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:43:10',0,0,0,NULL,NULL,NULL,NULL,15,2,2,1,1,NULL,NULL,0),(20,14,11,NULL,NULL,'2024-12-20 05:43:21','2024-12-20 05:43:22',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:43:22',0,0,0,NULL,NULL,NULL,NULL,16,3,2,1,1,NULL,NULL,0),(21,16,10,NULL,0,'2024-12-20 05:46:05','2024-12-20 05:46:05','2024-12-20 05:46:17','2024-12-20 05:46:21',NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:46:21',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,4,NULL,NULL,0),(22,16,11,NULL,NULL,'2024-12-20 05:46:08','2024-12-20 05:46:08',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:46:08',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,NULL,0),(23,16,12,NULL,NULL,'2024-12-20 05:46:10','2024-12-20 05:46:11',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:46:11',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,NULL,0),(24,17,7,NULL,NULL,'2024-12-20 05:47:31','2024-12-20 05:47:31',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:47:31',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,NULL,0),(25,17,8,NULL,NULL,'2024-12-20 05:47:34','2024-12-20 05:47:35',NULL,NULL,NULL,'2025-01-17 00:00:00','2025-01-17 00:00:00','2024-12-20 05:47:35',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,NULL,0);
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_files`
--

DROP TABLE IF EXISTS `review_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_files` (
  `review_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_id` bigint NOT NULL,
  `submission_file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`review_file_id`),
  UNIQUE KEY `review_files_unique` (`review_id`,`submission_file_id`),
  KEY `review_files_review_id` (`review_id`),
  KEY `review_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_files_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3 COMMENT='A list of the submission files made available to each assigned reviewer.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
INSERT INTO `review_files` VALUES (1,1,4),(2,1,5),(3,1,6),(4,2,12),(5,2,13),(6,2,14),(7,2,15),(8,3,12),(9,3,13),(10,3,14),(11,3,15),(12,4,25),(13,4,26),(14,4,27),(15,4,28),(16,6,35),(17,6,36),(18,6,37),(19,6,38),(20,6,39),(21,6,40),(25,8,55),(26,8,56),(22,8,57),(23,8,58),(24,8,59),(28,9,82),(27,9,83),(29,12,87),(30,12,88),(31,12,89),(32,13,87),(33,13,88),(34,13,89),(35,14,87),(36,14,88),(37,14,89),(38,15,93),(39,15,94),(40,15,95),(46,19,102),(41,19,103),(42,19,104),(43,19,105),(44,19,106),(45,19,107),(51,21,125),(47,21,126),(48,21,127),(49,21,128),(50,21,129),(56,22,125),(52,22,126),(53,22,127),(54,22,128),(55,22,129),(61,23,125),(57,23,126),(58,23,127),(59,23,128),(60,23,129),(62,24,136),(63,24,137),(64,24,138),(65,24,139),(66,24,140),(67,24,141),(68,25,136),(69,25,137),(70,25,138),(71,25,139),(72,25,140),(73,25,141);
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_element_setting_id`),
  UNIQUE KEY `review_form_element_settings_unique` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`),
  CONSTRAINT `review_form_element_settings_review_form_element_id` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about review form elements, including localized content such as question text.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_element_settings`
--

LOCK TABLES `review_form_element_settings` WRITE;
/*!40000 ALTER TABLE `review_form_element_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_element_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_elements`
--

DROP TABLE IF EXISTS `review_form_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint NOT NULL,
  `seq` double DEFAULT NULL,
  `element_type` bigint DEFAULT NULL,
  `required` smallint DEFAULT NULL,
  `included` smallint DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_elements_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Each review form element represents a single question on a review form.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_elements`
--

LOCK TABLES `review_form_elements` WRITE;
/*!40000 ALTER TABLE `review_form_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_responses`
--

DROP TABLE IF EXISTS `review_form_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_responses` (
  `review_form_response_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint NOT NULL,
  `review_id` bigint NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  PRIMARY KEY (`review_form_response_id`),
  KEY `review_form_responses_review_form_element_id` (`review_form_element_id`),
  KEY `review_form_responses_review_id` (`review_id`),
  KEY `review_form_responses_unique` (`review_form_element_id`,`review_id`),
  CONSTRAINT `review_form_responses_review_form_element_id_foreign` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE,
  CONSTRAINT `review_form_responses_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Each review form response records a reviewer''s answer to a review form element associated with a peer review.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_responses`
--

LOCK TABLES `review_form_responses` WRITE;
/*!40000 ALTER TABLE `review_form_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_settings`
--

DROP TABLE IF EXISTS `review_form_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_settings` (
  `review_form_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_setting_id`),
  UNIQUE KEY `review_form_settings_unique` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_settings_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about review forms, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_settings`
--

LOCK TABLES `review_form_settings` WRITE;
/*!40000 ALTER TABLE `review_form_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_forms`
--

DROP TABLE IF EXISTS `review_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_forms` (
  `review_form_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `seq` double DEFAULT NULL,
  `is_active` smallint DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review forms provide custom templates for peer reviews with several types of questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_forms`
--

LOCK TABLES `review_forms` WRITE;
/*!40000 ALTER TABLE `review_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_round_files`
--

DROP TABLE IF EXISTS `review_round_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_round_files` (
  `review_round_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `review_round_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `submission_file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`review_round_file_id`),
  UNIQUE KEY `review_round_files_unique` (`submission_id`,`review_round_id`,`submission_file_id`),
  KEY `review_round_files_submission_id` (`submission_id`),
  KEY `review_round_files_review_round_id` (`review_round_id`),
  KEY `review_round_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_round_files_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3 COMMENT='Records the files made available to reviewers for a round of reviews. These can be further customized on a per review basis with review_files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
INSERT INTO `review_round_files` VALUES (1,1,1,3,4),(2,1,1,3,5),(3,1,1,3,6),(4,2,2,3,12),(5,2,2,3,13),(6,2,2,3,14),(7,2,2,3,15),(8,4,3,2,25),(9,4,3,2,26),(10,4,3,2,27),(11,4,3,2,28),(12,5,5,2,35),(13,5,5,2,36),(14,5,5,2,37),(15,5,5,2,38),(16,5,5,2,39),(17,5,5,2,40),(18,6,7,2,46),(19,6,7,2,47),(20,6,7,2,48),(21,6,7,2,49),(22,7,8,3,55),(23,7,8,3,56),(24,7,8,3,57),(25,7,8,3,58),(26,7,8,3,59),(27,9,9,2,66),(28,9,9,2,67),(29,9,9,2,68),(30,9,9,2,69),(31,9,9,2,70),(32,11,10,2,82),(33,11,10,2,83),(34,12,12,2,87),(35,12,12,2,88),(36,12,12,2,89),(37,13,13,2,93),(38,13,13,2,94),(39,13,13,2,95),(40,14,15,2,102),(41,14,15,2,103),(42,14,15,2,104),(43,14,15,2,105),(44,14,15,2,106),(45,14,15,2,107),(46,15,17,3,117),(47,15,17,3,118),(48,15,17,3,119),(49,16,18,3,125),(50,16,18,3,126),(51,16,18,3,127),(52,16,18,3,128),(53,16,18,3,129),(54,17,19,2,136),(55,17,19,2,137),(56,17,19,2,138),(57,17,19,2,139),(58,17,19,2,140),(59,17,19,2,141);
/*!40000 ALTER TABLE `review_round_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_rounds`
--

DROP TABLE IF EXISTS `review_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_rounds` (
  `review_round_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `stage_id` bigint DEFAULT NULL,
  `round` smallint NOT NULL,
  `review_revision` bigint DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`),
  CONSTRAINT `review_rounds_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='Peer review assignments are organized into multiple rounds on a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
INSERT INTO `review_rounds` VALUES (1,1,3,1,NULL,4),(2,2,3,1,NULL,7),(3,4,2,1,NULL,4),(4,4,3,1,NULL,4),(5,5,2,1,NULL,4),(6,5,3,1,NULL,4),(7,6,2,1,NULL,14),(8,7,3,1,NULL,4),(9,9,2,1,NULL,6),(10,11,2,1,NULL,4),(11,11,3,1,NULL,4),(12,12,2,1,NULL,8),(13,13,2,1,NULL,4),(14,13,3,1,NULL,4),(15,14,2,1,NULL,4),(16,14,3,1,NULL,4),(17,15,3,1,NULL,6),(18,16,3,1,NULL,8),(19,17,2,1,NULL,7);
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_rights`
--

DROP TABLE IF EXISTS `sales_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_rights` (
  `sales_rights_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `type` varchar(40) NOT NULL,
  `row_setting` smallint NOT NULL DEFAULT '0',
  `countries_included` text,
  `countries_excluded` text,
  `regions_included` text,
  `regions_excluded` text,
  PRIMARY KEY (`sales_rights_id`),
  KEY `sales_rights_publication_format_id` (`publication_format_id`),
  KEY `format_sales_rights_pkey` (`sales_rights_id`,`publication_format_id`),
  CONSTRAINT `sales_rights_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ONIX sales rights for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_rights`
--

LOCK TABLES `sales_rights` WRITE;
/*!40000 ALTER TABLE `sales_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `series_id` bigint NOT NULL AUTO_INCREMENT,
  `press_id` bigint NOT NULL,
  `review_form_id` bigint DEFAULT NULL,
  `seq` double DEFAULT '0',
  `featured` smallint NOT NULL DEFAULT '0',
  `editor_restricted` smallint NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL,
  `image` text,
  `is_inactive` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`series_id`),
  UNIQUE KEY `series_path` (`press_id`,`path`),
  KEY `series_press_id` (`press_id`),
  KEY `series_review_form_id` (`review_form_id`),
  CONSTRAINT `series_press_id` FOREIGN KEY (`press_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `series_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='A list of press series, into which submissions can be organized.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,1,NULL,0,0,0,'lis','[]',0),(2,1,NULL,0,0,0,'pe','[]',0),(3,1,NULL,0,0,0,'his','[]',0),(4,1,NULL,0,0,0,'ed','[]',0),(5,1,NULL,0,0,0,'psy','[]',0);
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_categories`
--

DROP TABLE IF EXISTS `series_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series_categories` (
  `series_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  UNIQUE KEY `series_categories_id` (`series_id`,`category_id`),
  KEY `series_categories_series_id` (`series_id`),
  KEY `series_categories_category_id` (`category_id`),
  CONSTRAINT `series_categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `series_categories_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of relationships between series and category information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_categories`
--

LOCK TABLES `series_categories` WRITE;
/*!40000 ALTER TABLE `series_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `series_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_settings`
--

DROP TABLE IF EXISTS `series_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series_settings` (
  `series_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `series_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  PRIMARY KEY (`series_setting_id`),
  UNIQUE KEY `series_settings_unique` (`series_id`,`locale`,`setting_name`),
  KEY `series_settings_series_id` (`series_id`),
  CONSTRAINT `series_settings_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 COMMENT='More data about series, including localized properties such as series titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_settings`
--

LOCK TABLES `series_settings` WRITE;
/*!40000 ALTER TABLE `series_settings` DISABLE KEYS */;
INSERT INTO `series_settings` VALUES (1,1,'en','title','Library & Information Studies'),(2,1,'fr_CA','title',''),(3,1,'en','description',''),(4,1,'fr_CA','description',''),(5,1,'','onlineIssn',''),(6,1,'en','prefix',''),(7,1,'fr_CA','prefix',''),(8,1,'','printIssn',''),(9,1,'','sortOption','title-ASC'),(10,1,'en','subtitle',''),(11,1,'fr_CA','subtitle',''),(12,2,'en','title','Political Economy'),(13,2,'fr_CA','title',''),(14,2,'en','description',''),(15,2,'fr_CA','description',''),(16,2,'','onlineIssn',''),(17,2,'en','prefix',''),(18,2,'fr_CA','prefix',''),(19,2,'','printIssn',''),(20,2,'','sortOption','title-ASC'),(21,2,'en','subtitle',''),(22,2,'fr_CA','subtitle',''),(23,3,'en','title','History'),(24,3,'fr_CA','title',''),(25,3,'en','description',''),(26,3,'fr_CA','description',''),(27,3,'','onlineIssn',''),(28,3,'en','prefix',''),(29,3,'fr_CA','prefix',''),(30,3,'','printIssn',''),(31,3,'','sortOption','title-ASC'),(32,3,'en','subtitle',''),(33,3,'fr_CA','subtitle',''),(34,4,'en','title','Education'),(35,4,'fr_CA','title',''),(36,4,'en','description',''),(37,4,'fr_CA','description',''),(38,4,'','onlineIssn',''),(39,4,'en','prefix',''),(40,4,'fr_CA','prefix',''),(41,4,'','printIssn',''),(42,4,'','sortOption','title-ASC'),(43,4,'en','subtitle',''),(44,4,'fr_CA','subtitle',''),(45,5,'en','title','Psychology'),(46,5,'fr_CA','title',''),(47,5,'en','description',''),(48,5,'fr_CA','description',''),(49,5,'','onlineIssn',''),(50,5,'en','prefix',''),(51,5,'fr_CA','prefix',''),(52,5,'','printIssn',''),(53,5,'','sortOption','title-ASC'),(54,5,'en','subtitle',''),(55,5,'fr_CA','subtitle','');
/*!40000 ALTER TABLE `series_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `last_activity` int NOT NULL,
  `payload` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`),
  CONSTRAINT `sessions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Session data for logged-in users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('03m3l79Oumk2Rz3ohOooQrlYveTqjsGkcazIlo1T',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671744,'YToyOntzOjY6Il90b2tlbiI7czo0MDoidzBpUTJWTmhtRU1ESEhMTFBUa0NmTzRheEpOdDdNN1MwSG9WR0tEVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('116abYLZJ1qwvf3jWYEGGlvk42pNey9P6O5gMZqR',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671933,'YToyOntzOjY6Il90b2tlbiI7czo0MDoib09meTJyM3J1ZGtsZUdTYm1GeG5ROEFOeDJNeDhaUWtnRUpGMTFpMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('1EdLaZUuBJkkgUFwC8c2TI5sf7pZAGtL6bDgZfSu',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671971,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzJKMUp3ZmJaaGMyeDJnZWVFRFZ1ZVRYbVNHWktra0g3R3AyZXVWTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('2dPx2AB7EiAIp2t8crahWl7tViddRO29eP9ITkwH',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672748,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRDRXMm5mcjREeUp6T1ZCNnFCaXlVbmh3UlJPeWdrSGU2MVNKaGtNYSI7czo4OiJ1c2VybmFtZSI7czo2OiJjYWxsYW4iO3M6NToiZW1haWwiO3M6MjE6ImNhbGxhbkBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('2gIUeAwXUy4q8etVntSsBEfDU9ZL0U7LO3w43ScH',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671821,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiS2JVT1ZrZGNoRExIUVRkTjhEcHhZWVNnWGVOTnNlV0VDRExZaUs2dCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('2oUvxtbTsd6xpzeNXl16EiHEdWGKAJKTvd3tD4O7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672822,'YToyOntzOjY6Il90b2tlbiI7czo0MDoibE9RRHFkTnYweTZNdHdBOVNsbFZ2Sm1VdzZNVk9BZEN6c1ZTbGIwNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('3FgF2JdOTKvnpw7sbw2WxGMpmJbVNi9zw2mxJNtN',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673656,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMUU4czRrSHNtUDloU1ZLbjlsd0ZRTXExWGxNbnRLbmZUWnFXTXVqWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRueXh4dkR6NmNHbUVad3NtL0ExWnV1NDRUeGFOVGRvSGlpWlZ4ZzF5WHdCQVI5RzY0TE9kZSI7fQ=='),('6S2m8HfhPlHhwKHm2XHSqfZOlIgnkqvmtUyB9P2q',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672101,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXhVQkltc3k1YkVvWVkxZWhYell1ZDFpZnBuZFdVU0prZDBFWEtWVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('6w20aB8VbZdPJVS086cC66kPHmmtPwQsfr7PgV97',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672938,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRmlYUkhZTFY0RlB0akNqd3pqV3pBUEdWSWoyOXpuVExWbGtpSDFWOSI7czo4OiJ1c2VybmFtZSI7czoxMDoiZGtlbm5lcG9obCI7czo1OiJlbWFpbCI7czoyNToiZGtlbm5lcG9obEBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('7Hdn1GgbCBAa9oqfbVDpMcGgYDq259tUy5mxiXTv',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672066,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXZLeHZsU29CaEU5U0tXVExTS0xKZnlybHlyVlJBSGdBaEpXMzFMNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('7ZivnzosLCbjYKJdtwkpQxWmfKXf4cPlwsQZO7Dv',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672310,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWNXTndqY2Q5SzgzTHlsQXRpbTBLb2xCeHJZNm10REhUWU5pM2NRNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('8qxpmlalB1UewSTNgsDzoqVlVg1JpqvGdPiXFe8o',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673335,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoia29RSGJrNkd4am55MmpmbmI3MW00aUFBTDNTd1puNW9tQ2ZvdXVJaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRHZDJoSi5jSjBHVkd2amRHMWdQeExPYmVFdzF0WHoxNXZIUkJPYlBGT0ZyY1NjS1VqZDVVTyI7fQ=='),('8zhWF4qz7z6QVy4mYHp8StolhSbgtPu825i1dg4R',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672815,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiaW9JZjNsbGo4SkJPcldSS2dhQlZ3WTJ6NFJyUmdEUGZua21TS3JpaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ0TlRqQThEbi9wa3FvU0NNenRhYnJ1YjZxS2xRc1NuV0plUzF5YmhkeC8yMi8wM1NmN1pQSyI7fQ=='),('8zUR72lwgPSZg1cdlHa3cLheFjSvwaoDgxRLShII',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672199,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRDg0bzNObHpuMnpXOGFvYVNmSGQ4UlZoNElQbEVKRDN3RGx4NlVxbCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('97EVZEsMJPMmAApcfDU4r7tbWLLbDFbJPqUTxCVs',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672381,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoidmV3amFQTE5jUXlFRk1QV3BmcTlHU1NncmgwSGdxZWJldjZBcXdScCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDBTNHd3Yi9OZUQ4TXZkR25HeEtBUC5qa0E2OWhrSHJkUnhkcFdDay9aZXBPcVF3cmNVRmxtIjt9'),('AcgIvQS5sDp88WAsxqqX6999twDZs1TMH37TScvK',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673121,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVG1tandMMEFheEV4WnEzVW42UEhJSnc1eElXUzBmeTRkM0JWS3lNdiI7czo4OiJ1c2VybmFtZSI7czoxMDoiamxvY2tlaGFydCI7czo1OiJlbWFpbCI7czoyNToiamxvY2tlaGFydEBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('Av7rB09hk9lpa1eOlkyRnhVVAWXnX7yNopa2M3XZ',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671960,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZ1VmM3VRdzhhZ2t1bjdLNWh0TG95aTQ0MnFkMm9zWXFTajNnbngzbSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('aZKGiu0EXY6lvpFhfx2KVsvss6xbFjo0RhEoBCft',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671802,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoid1FCUldNcHVzZmhGVW5uNnJsclE3MjZqSk0xcnZWdFFjN0RyaTRpUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHlnVlBiRngwNzFCSFFMVkFTdkwzR2VyNlJIVGNQbEhqckhnWGdBWlczNHBVSUtTT0N2Y2NHIjt9'),('B09480gL0dGeFKGYfWucEo3OY74Wih2dVaTFb5sC',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672821,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWVVwaFhsSm9BeVhmNmpHcHRkcnhXczBONHRzUnh0VnNBRnRTYnBRciI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('C1R0jnQ4JsA1eIdZtbMYtMaKdgZDTIaKd3HPgARY',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673510,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiRXh3eUR1aXJGQWhiV0tKWkZ4eXFsbndMb0N3NVo5dmg3ZjVDUEtqVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRuWG1VZnFYNEc5blNSU3FEaURVdHJPNnlkenc0c3ZxOTN5SkxySkQxNkdHUVA3NlNycG9ZUyI7fQ=='),('c1YrBuGeXsvUZf0quKvvQsk1dtixFQYhz1m15LJo',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671959,'YToyOntzOjY6Il90b2tlbiI7czo0MDoibms4bWdaeXRrOWZKYXZveEJVaGhNMXV0RW9kVVBZVFpXOXNGakhMWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('CPC8s2GsfAVXgs6RMx21Fm8MW0eYxSgVwRcNkXzM',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671841,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSnNJaEhnQ1R1T2xpSXZ2aXJHQ1BFTVQwRG9KNTNEcTBIeXBKaHlPeSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('CujhDj2Vl9fVC8afK63t6STJy01gnVjktkjc4aQV',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672616,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoicmNwUW9vT1Z6aWU5U2tlT1c1cWNsR2FyTXA5NUtCek5PMXNhbkhDRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czoxMDoiYmJhcm5ldHNvbiI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MjE7czo2OiJ1c2VySWQiO2k6MjE7czo1OiJlbWFpbCI7czoyNToiYmJhcm5ldHNvbkBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRzWjNQQy5PQWRyZWpyeGZWWllCODMuNS9BTHpvVFBvVWFXdkFBWXBIWVgwd2g1Q2d1Um4zMiI7fQ=='),('cxvvHwvEy78GFTwHA9hpfDiidaOeohTJz2okpb1X',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672879,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRlk4NDhzTUZTMGNrcXFoUXUzMTlRYUk3WHRLQUt6cUpnQ2s0M25xTyI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('DeiBJuz5kmBvPe2IGmXxxl8660m04o3Rz9DMV7Wk',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673581,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidmhwVk01aXhLQ3U5RXl3bURxUU5VcXlDdUxhbTYydDdyMDlUS0RVZyI7czo4OiJ1c2VybmFtZSI7czo4OiJhZ2FsbGVnbyI7czo1OiJlbWFpbCI7czoyMzoiYWdhbGxlZ29AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('DLuiZH5i7rPiboZZdNAOa4rL1mNESRUUyPWW9gFj',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672826,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSzd5VGhCVzZWTzd6ZGpVMWRaemxqRllWR1B1a1poOThoV1RpbUNnVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQyMEpkZVNycGtKSUVMMVBmRjU0YXJ1akV6dExxdW1SWVJ3ZlBLL3QwdldXQ0dvS0ZvS2dzQyI7fQ=='),('eElZLsdA3zjcmBDYIE8ULC7K0TMnXiIeiv14NqSP',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673549,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVzAyNnA4TjNIQUdoR2hBTW5ONXpHZEhzclZtY1MwTlhIbG1PdnV4aiI7czo4OiJ1c2VybmFtZSI7czo2OiJtcG93ZXIiO3M6NToiZW1haWwiO3M6MjE6Im1wb3dlckBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('eJoV00sPB1hPVxRHpXsgO0lOOeloraUHzYSnQB7g',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673633,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiT1N5RGlxblFWTk1saDlienlJR3NqZVNrbjVmWWt5SGswVWUzMEk2RSI7czo4OiJ1c2VybmFtZSI7czo2OiJtc21pdGgiO3M6NToiZW1haWwiO3M6MjE6Im1zbWl0aEBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('EXdMDriuKdlf7fNfzh5VxHALyzpANTmnYMURx1tf',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673300,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaHBSYmRpZjJraE41VDlmWkplazFQcGRhN09IdnkwcHVsNFZjR0JsTSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('eyixlGl6x52FyVnxRvy7ErdC6YtVv4GgKPJDSM68',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673030,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoia2V6cEs3Y3hRT1haYTA3bHNsMFBYaHJ1WVVUMnFSTVdyakFweUtPUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRhSjVPandiYXhCTnppcnczOUtITlJPbjZUczVlZHowUEhoYlpnSVl6bUk1Qi53RlJMOEp2aSI7fQ=='),('G2BKePrDgKZHXxoMwJ551boxUDDoTX1BEnHsGvJe',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672051,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRUVsWTJJcXg5M0JWM0hWN1VGSDdFdlY4OEh5TTBCSWlpemVJb2xTWCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('G2LKEWK3dSjNo2yyvfOKYtZRw3pj9sYyLjxsIkSN',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672975,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiUklNakxEY0pTcDNmQlp1WnhNbFVKRndOUXdqcThOYVBRZXBua3lxOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRuSU5qaE4zQm5xZDQ5QnJHbjFkVFcuaUhLekpKNEg1aGZ2VWU4Sy9BQlZHbUR2M0lLZngzeSI7czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('glU5dbG4vT0vuCu5ZUMMxyyi82OIJ5EjdLo5barU',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671788,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiNDJwSlFCVXZnTXpCRFFvR0xlNVdRa1NqdTZqdzhxVDhEeXNGS28zRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGpISnhrdURJSTJJOVl4UkNXNWlIVk80dkh0VWRaZklJY3A3ZzlRVU80TTZGaWxhR3gwNE0uIjt9'),('HACsmGOXQMbel7GLaMc6Gpt5amiSXP8TCiIaqULy',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672018,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUjN0c0xSZlZZR0lCODcwZm4yM1p5ek94Yjd5TU03NzJCbjhMRUx1YiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('i7nDCV2UFEvBRV4HElgClwdwgwEwgFlOPffQZ2ZB',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671918,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVJrak5wS2JrQ0VxaTVNN1ZRelN6VDNUamRtMFFyNkExUEJOMXNvdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('IaRYKLyggqkapmGBsDCV9gPktBt24Iyol1MQWFko',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672576,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTXJ0aXlEZ0FLQ2xsaDlQU3ZkTFpSSUpBc3ZZSVlrSGVLWHNOVkJ3bCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ5NHNiU3d6bldsdkVrOFNFUkFuWHlPa0Q2Wi4vcHFFVVBWaG4vZGlSUWxvZlMvUE9MZlZmbSI7fQ=='),('iiaODNnNXgPvpWHDaomKZz9fpQoUUcQr094ZtnEc',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672001,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTgyZmVwSFBOUzdRNmxDQkU3c1JINXptaklnSlNlZkFLNTZGd05YRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('iY3qVrVQWtSkeaopoyiS59Sy0SS5A8f0Zh5HL42F',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671893,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXFPYmppUlpyRHo2VFNSd090MjlVZVpMQmJ5eFFJeEdDWWg0N2pSWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('iyk0R6spsntvuNOXL9dJnwAWiKfDPv7bM78xv9mQ',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672358,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjFhaTN4eGVFempzNWwyQ1NEMGdRWnVBVDc0ZW56S2kzcFBhRm95TiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('jGY7NtTmBCW6NIy5s7QZAQMFt8UG6fnbQBG0wuWp',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673373,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSEdadE8xQUE4TXc0TjJzZ2Q3Q2w5T0RjMk9IdzhDMzhmNXhXS2NQYSI7czo4OiJ1c2VybmFtZSI7czo3OiJtZGF3c29uIjtzOjU6ImVtYWlsIjtzOjIyOiJtZGF3c29uQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('JnE4zibuvec4M96Gc38AkXv5ZulNmwPKIXcssbMA',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673209,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZ1hlUlRzTlV0dEU0UEV2c3hrVFVhUURYaDBUZFVGM0FLV2dxVlcwWSI7czo4OiJ1c2VybmFtZSI7czo2OiJsZWxkZXIiO3M6NToiZW1haWwiO3M6MjE6ImxlbGRlckBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('K6X4rOPba4oRg6WhboxVOulshgPnTtoMYOPKBEZ8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672359,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjR3akxqZHFWZnMzYUlnU2NUUnVnVUlkakQ0cnVVd1dtREFOdkFKcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('KM7H2q5SVLGVbxoadjaqinvrOlmCctMnxgxZPZ1q',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673240,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieHRQRFBLc2M1TE92YU1xWDQwcVFCRHMycnNoMzI0TWZWZ05lVjRrTCI7czo4OiJ1c2VybmFtZSI7czo3OiJwaHVkc29uIjtzOjU6ImVtYWlsIjtzOjIyOiJwaHVkc29uQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('kMCLYDdgR4E5lIyG5CzCS8EnaXRbFxjBtxPZA1Cn',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673156,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOUJoQWhjM0Z6QXNmQ0xFaERRcGZXV3NFbVh4V1d0dVdVVEFIRmFiSSI7czo4OiJ1c2VybmFtZSI7czo4OiJhZ2FsbGVnbyI7czo1OiJlbWFpbCI7czoyMzoiYWdhbGxlZ29AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('KxQoRebdJR9rDpK9vJXHvYmjmqwiKvzfIGHSeWGj',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672896,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiRFZSWkh0d1BXVm4xSHlueEozTHN0OW9CTGd5SWlxOGVJYUVrSG82eCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRxNUkxdnp5YkhWVW5ZTHdWZTYxYkhPQnQ2RzROME1RVjhQWjc1NWd3bi55TFdSOFJJeHRSSyI7fQ=='),('LbGMXOc0LnawYWACmJG1lyv2o9cTlkzyWxRObfZY',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671828,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekZRR0VIeHVWQ1E4Ym5Ha3dBZG1yMkxheG5ZcFdXVWNsQnJHMTRmOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('LfZaulzztHYLe90dUIQf9CHRjVBkIt7NhSVi6XDQ',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673165,'YToyOntzOjY6Il90b2tlbiI7czo0MDoidmdOV3liY0I5UHROZmQyOU9YTUdyeVlYWmdzQzRSQUFwOVhSYTRGbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('LIub1mDlLlo2eFmD4EHFmvbiDOeQx8cATyWfSanx',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673309,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicm9oS2ltd2hBYUhBbkg1b0diNnFLQmJ6b1FHakxGaXpIMXd6ZG1mSiI7czo4OiJ1c2VybmFtZSI7czo4OiJhZ2FsbGVnbyI7czo1OiJlbWFpbCI7czoyMzoiYWdhbGxlZ29AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('MgHNmbu8Mbhxc4beSzmBjMnu21EhwMUDgvZwUMcM',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673497,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOFNoNmpUaGlOejlGZDNsaG1EN0NxVVZCYzhiSTNRR0ZSVDRkbmQ1diI7czo4OiJ1c2VybmFtZSI7czo2OiJtZm9yYW4iO3M6NToiZW1haWwiO3M6MjE6Im1mb3JhbkBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('MUVqWrEl7qghtGPsbJLS7QMA1Jwev0r0EKouqJB3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672892,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZ3dQa0lSRnZQRXEyczQ4STBaWG1HVHVteWxBN0tlVU1mVlY4UHlZaCI7czo4OiJ1c2VybmFtZSI7czo2OiJtaW5vdWUiO3M6NToiZW1haWwiO3M6MjE6Im1pbm91ZUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('n9yUHKCRMeoVzS11nsWYEk6T9IXM8HC7rN7poNkB',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673147,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSFdTODlNQW5wT3o5cXZ1elViWFBzQ3ZOdzhrZ0ZsUFBoZ1NnaXFKYyI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('Nfo7wRqZqRIdXxfIz9bADceaNkbUngIPngUEOCCT',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673016,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWFhqbHhxcjFGd2lVRGJGNVg4dEwzeVlUWkFKSHJtUnZOUU9UOEFQeiI7czo4OiJ1c2VybmFtZSI7czo3OiJmcGVyaW5pIjtzOjU6ImVtYWlsIjtzOjIyOiJmcGVyaW5pQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('NfVmzog0s314KGobXG0a4iQIhJZ6d9t58c0TQtib',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671945,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1dmc2dTanhaM3p3V09SV3prNHhHTDZsbWhjaWRiYzZnc0dKWVBxSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('Nt6lOfn0Pf4QtSiI9fwST8a1STjITvLUadhuEz11',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671862,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZGloRWp3MVpJTXpNd1ZBUFpRQ1ZZYzFrWXFJTnI4dWRqUTE2R3JTVyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('osUhQFgnEwUVCGYmTPMdKBJNhhmq7tFBJm0V20HD',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672158,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiY09FUzF6N05XVlVzek1OYUs5TWVGWFQwOUk0dkNvSXRsOHB3TUFoMSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('P2WIJ4Kng6dWPKl4qab8qKbAPXZQWbNG4UhP42gx',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672701,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiYUZXbnc3OFdLSG4xcWJmSGptNUZ0TkV3ZDZkRUpFTnNqU2xkODJnQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRHQnJ0UktRWFo4V3NUQldmY00zTnMueDFvOVVrWUVsWjduNE8zb0FtOXdkakVYbi83STZDMiI7fQ=='),('p3QBkBDAnwi088fpqiQlEnH4YSfA0v5Bk98ajEHG',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673100,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiVGJ4ajdPUHhlQ0JtMDFjREhYZTh6czVoTHpJNGNSWlhwd2hOcVpKQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo3OiJqYnJvd2VyIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aToyNztzOjY6InVzZXJJZCI7aToyNztzOjU6ImVtYWlsIjtzOjIyOiJqYnJvd2VyQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJEVVcC5Ra01xRVIxei5wMzltaUphVmVKRG9qMGVwRjJ2cmR5RnpRMy5iQ3FXYk93TTFLcndpIjt9'),('Pa8U0QYhjoJtzV4IpqsVJAoafFoGZC7jBY6lyfO1',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672286,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidnBvYlNzT3pmTDdJOXRRbnNUWFVEQ0M5SXZmRUpSdHltV0wzb1VJUSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('pCvpYDPhijEE5dfsIFRIDM0nKIdQVLysD4jw4M7B',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671766,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSE1XYlZBNXBkenR6Y2xNSnhQVnVVR21Xc1VvMEVONkRWbkhuM09xOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJE16UG56TXBabkQzTUpaWDdPRkE3YmVvUlJmdzljbDh3Z0UzejAzMHU3UC4uSXVJOGJmaU9PIjt9'),('ppdXY1AuyQmmUfT2BiOPYqgpDwSpRdCWxKiV821A',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673319,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSk5qaHI5VzlwNGxjOXk3SVBwTEpJMVhHbTRIcTMyNElYMDhrTVpFWiI7czo4OiJ1c2VybmFtZSI7czo2OiJnZmF2aW8iO3M6NToiZW1haWwiO3M6MjE6ImdmYXZpb0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('PXpSVsIRBSjT5iLGxo4FKuxbv6jzMfh8xqvKVBB1',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671796,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiQmdYR1NwQXBtbUQ3S05tdTdBN0pTcUV1YXZ2bk50dUhKbXB3QkJSdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDBIN29RbHVUdWFsNzQ3dUkuaGpzUS4vTlR2cjg0S1QxaUk1UXMuR2ZrY2RkSnBHdFhBSDRtIjt9'),('q0iyll3TkMQ0cED3YLTLCXxP3kFoSfeBA5J2Zryp',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672085,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTzd3cVhGRWtQNmllbTQ4VGJmOUI1ekFRRGFSUklRTU9pcmJRb0RuZSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('q72SrMlTqaX2NiTV638kDcaN8wptPrbk1Z6WqKUo',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673572,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidmdVanJpejVDN2tnb2Q5UkFqRzdvV2hkUHRDV1pxOFNsTWJ2b2lLVyI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('qCdnGmASRZyZT5Js5qFVNcGiv5CdUlFKanaPusdO',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672033,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDFRb2VUa2NuMHRVUHBqTWFxaHRGWmNLUmZ0cXRHTzF4RTM0cUJBZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('QcPAKHjPLCs4Avh3nQePHkqFR10nUQ9Jb8ud8fr8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672334,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaW5admo4aGt3NWRFcnNnT2JkcTVxQVRxR3JLMmZUZGJJSUt1MENJNCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('qlonuxK6rU6qQDdgTDAa6drJyAxeScMwjnfxhky7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671933,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiS1ZuZjJ3UTFud3paWWs3VlY4SGU5WnJJRWNaNGVvcWJvN3RDbWROQyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('rcRz0irkGPCyKgeUSf9pEnjj7imuXJYLZjGFTm7C',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673180,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiQWN0UVE2eUxBM3I1ZlR1UjZKMlFJTDkyZ3Rnc2RBVnRUQVV1dzNDZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRyN0tmeU40Sy8xQkZaZnM3S1ZmRWcuMk8yTGhWMW9xc3YxMExEc2NaLzE2ZUdJcUpWLlRjMiI7fQ=='),('RtKlZUvdTDDRFHznFqTVEZY3KFvEKZISIdB65xdF',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673231,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiU0xOMlFFOTZWaUc0WUQxM2tud0hkZjZTc2gySjUzSnlHQzc4RHVWVCI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('siM5Mo458IJvkNv7V03ozg0hQPxlylLfmz1yNZ48',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671871,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHBneWpPOEw2UkROYXAwOVNjZFptbE05TVNZM3VmT284b2R4c1VTRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('sPMT2nd9E17HaEE4xKWvrwuZKwUqCB8IdcqY9XUd',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672860,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaUh2QTJ0TTN2dG1CNFoySHRLQWRQdHNldW5NVGVwT29icVhKOGYxQyI7czo4OiJ1c2VybmFtZSI7czo5OiJkYmVybm5hcmQiO3M6NToiZW1haWwiO3M6MjQ6ImRiZXJubmFyZEBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('sVURLgN0vYRuGkSJmMytYHOo81dOEFuX45DbVPiJ',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671908,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTjJSOTZkZjV5dEhnajBvdGxNN1p5MkE2ZGo3SGJwNFZsWEMyTVkyciI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('swY1c7ORauu5rTu3AaIwOZcfypwsJiQYJqSb2Rq6',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672425,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiT21DSlpsU3FBY2hJa0JMUDlBSFhQRkFzNFpQa3E5RWtVdnlNVTZYVCI7czo4OiJ1c2VybmFtZSI7czo2OiJhY2xhcmsiO3M6NToiZW1haWwiO3M6MjE6ImFjbGFya0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('sZarceVtz2YAzRgTBKjiCFpn0CcsDMdB2hcdeNFD',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672553,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSldsd1lsRFlLMG9BNmFFemN4empLZ25qZThVT2NBM3RaSnNOcHB0NiI7czo4OiJ1c2VybmFtZSI7czo3OiJhZmlua2VsIjtzOjU6ImVtYWlsIjtzOjIyOiJhZmlua2VsQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('sZvnJ9TlzkzzCtVfu2fFYVHPAnHktLrfGDVGovZf',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671849,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXJkb3dSMHoycjAyaEpjaG40eVZwWmxXVVdFeWpWaXk4emp5V2NzOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('T0CqSsZwLAWnOpcrfQw12YgDBduJ2ik3j1xLMpYv',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672219,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTJBeWRGejhjamxuOU9xcXVSRDl4aExsU1JGclkzMEFSRlVmb2pTciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('tkzbLuMK3Vu6AN7L3Id2hdIsO8WH5aVzKmTp4Uxt',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672138,'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnpNaFBmb3BieWRydTcyU0FOWFlVS0hxbXNZVkU1aFZHa29NOWpPeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('UDDS71p1c5lJyAu2fLqzSYoVKTCFjHyCoIwB3vhZ',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671988,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoia2VGZGswcW5HekdKMlN5V1RMcm1tQm9mczhtVnhvVnVvOUhNeFlHUiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('ukg0mhTUARx5cMPqNN1BompefHQJGhs8tgkDBF30',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672177,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXludHdzbzhLcmVPalZzcTgxSHdxRUJCclU2QUV1T1VzRHllRmFWMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('UwDYfLGGhbl1GQPIflihbBGGlS2fyO0IOq2zsZs4',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672121,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieHByaU5GTHhSbW0zb2xkNTVOdWdDdFRUNVRoemx0ZDRCVThKU0FxbiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('V2hQ33AP59GuhY1n5uR36xfyxNRyp9xfZ6LHbrU4',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672651,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRHNBaXpLN2hyM29wOGVHT1QyN3g3anV4VGw2bHN2cFR2blhqY0JjTyI7czo4OiJ1c2VybmFtZSI7czo2OiJiYmVhdHkiO3M6NToiZW1haWwiO3M6MjE6ImJiZWF0eUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('vYMQ8AuXJ32Qd3pBsY3ddIwCMrIP9fRx1kaoHanI',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671885,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoianBFNURnS0QzZEp3dXlsWTVzQ1dhWlhpbURSdmU5OW5LZ1FYdnkxdyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('VZG4QswS0id1I0RAUdpGWULn4itU4AdJIObzBNAU',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673470,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiVnBpa0JPcDNkTUFIbHl5bU9FTjJHVGNwcU14UHhvS2pwTDdpNjRuaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCREWHVET2tkSG1TUEdjRVVSdHMvdlkuSVBzV0paMi5FaEVVcW5NRnFxZWNMQTdKTGpPUDZUVyI7fQ=='),('wP3M0bujCFHNAAET9fs4CWv2Y2KW1LZtkrZBYCRF',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672965,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoianB5ZW5MVDNwWE5LSHNXak5veXgzUTQ2RGlvaTBBMVZzWUZTTGI2ZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR4RE5LYU45Z1lXSTRuV2xkSzd0Zmwub3RhQnE3NkEwUzM4aWNUTEhKb1JFdGk3VjAwaXBoVyI7fQ=='),('wpmW5mFd974UlvkrfJ5NNOmb7xSWIQyNjLKgvcC5',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672263,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3pWZnlzdnR1c1hXYThGanBiQmlOajNKd1dkWVZnUkFhREtEUnBlciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('wSJYvxPGXn0WbpyWPrN3jLwrWUL5UP4uhFIkzYcI',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672242,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQU1pRkZHSmRKc1lYV2pVaVNzRmF2UGcxMGlSZVlZM1E5aFI2TEN0RiI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('Xuq7qgT4pFYFkBJ7nEiL7543AQi4MDGmVJ4MEA1R',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671781,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiT2pTTDlCalExOEhLNXhpQTUya29kOTF3cHFSZWkycklvVk9TWjZkcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJER0OTd6VUNWNHFYNU8wU2p6cG1GOC5IRjQ3by9mSUUzY2JlNU9ELzBYY1pUMzY2ajBscS9DIjt9'),('YC5bVz4540OGjiflmcPNxMsE2KwuWBsTm23sDV2a',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734671744,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUEVJU1VvTzRweWlCbUpoSXdUTTRLUHJyZTR1T3c1NFNOWlI1TzR1UyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('yeCvE6lWS5YZpBbFdfdBWClQ8CBfnUsunnfKqp3E',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672399,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoib0FVbTJhamVzMDRKdjRPNE02N1NLVnc3Yk1yajdUS3ZyM0RLcXpjcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDhJV3Qxd0p1SFRkM1JYekFRNWJrcy5sMUZWYkc3anhLQ0N0RUJ4Q0lKV1BnMEdKU2pCQ3IuIjt9'),('yrFEbLOYaY0LyAlELzSSOPkswoUfoUl1dFF7NuUE',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673165,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiM0o1SDRTb21oeHRMZTB2TU03aFdDV1ZzQTc2QTJla0ZweWxuVUF1USI7czo4OiJ1c2VybmFtZSI7czo2OiJnZmF2aW8iO3M6NToiZW1haWwiO3M6MjE6ImdmYXZpb0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('ZelGmw8f9YqQKuKFojFk5zbc0fQPhEOfFz0Qv4A9',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734672446,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiV3Fucjc2ejdKejd5alh2WDZpWWpoMG9oWGF5aEs2YmwycFJKdmIxSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ4RVFwWTltbVY3V0hqOVlNbFJZZ09lWXAuRW55bUlab3R3Y01IWTZiTHc5U2NNQmNtb0tnQyI7fQ=='),('zUGb8l1rrs7bBZa0JFj5BfdW8I870GRKeB6gUlwx',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1734673268,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRU1YSDFuUGE1WDFRREZCS0ZJQ0w4andDbjNFR1NQSmpFVW5IbTNPSyI7czo4OiJ1c2VybmFtZSI7czo1OiJtYWxseSI7czo1OiJlbWFpbCI7czoyMDoibWFsbHlAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `site_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `redirect_context_id` bigint DEFAULT NULL COMMENT 'If not null, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(28) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint NOT NULL DEFAULT '6',
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_context_id` (`redirect_context_id`),
  CONSTRAINT `site_redirect_context_id_foreign` FOREIGN KEY (`redirect_context_id`) REFERENCES `presses` (`press_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='A singleton table describing basic information about the site.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,NULL,'en',6,'[\"en\",\"fr_CA\"]','[\"en\",\"fr_CA\"]',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `site_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_value` mediumtext,
  PRIMARY KEY (`site_setting_id`),
  UNIQUE KEY `site_settings_unique` (`setting_name`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COMMENT='More data about the site, including localized properties such as its name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'contactEmail','en','pkpadmin@mailinator.com'),(2,'contactName','en','Open Monograph Press'),(3,'contactName','fr_CA','Open Monograph Press'),(4,'compressStatsLogs','','0'),(5,'enableGeoUsageStats','','disabled'),(6,'enableInstitutionUsageStats','','0'),(7,'keepDailyUsageStats','','0'),(8,'isSiteSushiPlatform','','0'),(9,'isSushiApiPublic','','1'),(10,'disableSharedReviewerStatistics','','0'),(11,'orcidClientId','',''),(12,'orcidClientSecret','',''),(13,'orcidEnabled','','0'),(14,'themePluginPath','','default'),(15,'uniqueSiteId','','BD8B0F6B-0C9A-417F-A527-5CAF3E7F0A86');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_assignments`
--

DROP TABLE IF EXISTS `stage_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint NOT NULL DEFAULT '0',
  `can_change_metadata` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  CONSTRAINT `stage_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COMMENT='Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,13,19,'2024-12-20 05:26:45',0,0),(2,1,5,4,'2024-12-20 05:27:04',0,1),(3,1,6,14,'2024-12-20 05:27:26',0,0),(4,2,13,20,'2024-12-20 05:27:34',0,0),(5,3,13,21,'2024-12-20 05:29:42',0,0),(6,4,13,22,'2024-12-20 05:30:22',0,0),(7,4,3,3,'2024-12-20 05:30:49',0,1),(8,4,6,13,'2024-12-20 05:31:24',0,0),(9,4,10,15,'2024-12-20 05:31:35',0,0),(10,5,13,23,'2024-12-20 05:31:47',0,0),(11,5,6,14,'2024-12-20 05:33:04',0,0),(12,5,10,16,'2024-12-20 05:33:16',0,0),(13,5,12,17,'2024-12-20 05:33:20',0,0),(14,6,13,24,'2024-12-20 05:33:52',0,0),(15,6,5,4,'2024-12-20 05:34:19',0,1),(16,6,3,3,'2024-12-20 05:34:34',0,1),(17,6,5,6,'2024-12-20 05:34:38',1,1),(18,7,13,25,'2024-12-20 05:35:03',0,0),(19,7,3,3,'2024-12-20 05:35:37',0,1),(20,7,6,13,'2024-12-20 05:36:04',0,0),(21,8,3,3,'2024-12-20 05:36:11',0,1),(22,9,13,26,'2024-12-20 05:36:21',0,0),(23,9,5,4,'2024-12-20 05:36:55',0,1),(24,10,13,27,'2024-12-20 05:37:16',0,0),(25,11,13,28,'2024-12-20 05:38:26',0,0),(26,12,13,29,'2024-12-20 05:39:46',0,0),(27,13,13,30,'2024-12-20 05:40:46',0,0),(28,14,13,31,'2024-12-20 05:42:21',0,0),(29,14,3,3,'2024-12-20 05:42:52',0,1),(30,14,6,13,'2024-12-20 05:43:34',0,0),(31,14,10,15,'2024-12-20 05:43:46',0,0),(32,14,12,18,'2024-12-20 05:43:50',0,0),(33,15,13,32,'2024-12-20 05:44:37',0,0),(34,16,13,33,'2024-12-20 05:45:16',0,0),(35,17,13,34,'2024-12-20 05:46:28',0,0);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `static_page_settings` (
  `static_page_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `static_page_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`static_page_setting_id`),
  UNIQUE KEY `static_page_settings_unique` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`),
  CONSTRAINT `static_page_settings_static_page_id` FOREIGN KEY (`static_page_id`) REFERENCES `static_pages` (`static_page_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_page_settings`
--

LOCK TABLES `static_page_settings` WRITE;
/*!40000 ALTER TABLE `static_page_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_page_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_pages`
--

DROP TABLE IF EXISTS `static_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `static_pages` (
  `static_page_id` bigint NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `context_id` bigint NOT NULL,
  PRIMARY KEY (`static_page_id`),
  KEY `static_pages_context_id` (`context_id`),
  CONSTRAINT `static_pages_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_pages`
--

LOCK TABLES `static_pages` WRITE;
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subeditor_submission_group`
--

DROP TABLE IF EXISTS `subeditor_submission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subeditor_submission_group` (
  `subeditor_submission_group_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  PRIMARY KEY (`subeditor_submission_group_id`),
  UNIQUE KEY `section_editors_unique` (`context_id`,`assoc_id`,`assoc_type`,`user_id`,`user_group_id`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`),
  KEY `subeditor_submission_group_user_group_id` (`user_group_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  CONSTRAINT `section_editors_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='Subeditor assignments to e.g. sections and categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES (1,1,1,530,4,5),(2,1,2,530,5,5),(3,1,3,530,3,3),(4,1,4,530,3,3),(5,1,5,530,3,3);
/*!40000 ALTER TABLE `subeditor_submission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapter_authors`
--

DROP TABLE IF EXISTS `submission_chapter_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_chapter_authors` (
  `author_id` bigint NOT NULL,
  `chapter_id` bigint NOT NULL,
  `primary_contact` smallint NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `chapter_authors_pkey` (`author_id`,`chapter_id`),
  KEY `submission_chapter_authors_author_id` (`author_id`),
  KEY `submission_chapter_authors_chapter_id` (`chapter_id`),
  CONSTRAINT `submission_chapter_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_chapter_authors_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='The list of authors associated with each submission chapter.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_authors`
--

LOCK TABLES `submission_chapter_authors` WRITE;
/*!40000 ALTER TABLE `submission_chapter_authors` DISABLE KEYS */;
INSERT INTO `submission_chapter_authors` VALUES (1,1,0,0),(1,2,0,0),(1,3,0,0),(5,4,0,0),(6,5,0,0),(7,6,0,0),(8,7,0,0),(9,7,0,1),(11,8,0,0),(11,9,0,0),(11,10,0,0),(11,11,0,0),(11,12,0,0),(12,13,0,0),(13,14,0,0),(14,15,0,0),(15,16,0,0),(16,17,0,0),(16,18,0,0),(16,19,0,0),(16,20,0,0),(16,21,0,0),(16,22,0,0),(17,23,0,0),(18,24,0,0),(19,25,0,0),(20,26,0,0),(21,27,0,0),(22,28,0,0),(23,29,0,0),(24,30,0,0),(25,31,0,0),(26,32,0,0),(27,33,0,0),(28,34,0,0),(29,35,0,0),(30,36,0,0),(31,37,0,0),(31,38,0,0),(31,39,0,0),(31,40,0,0),(31,41,0,0),(31,42,0,0),(31,43,0,0),(31,44,0,0),(31,45,0,0),(32,46,0,0),(32,47,0,0),(35,48,0,0),(36,48,0,1),(37,49,0,0),(38,49,0,1),(39,50,0,0),(40,50,0,1),(42,51,0,0),(43,52,0,0),(44,53,0,0),(45,54,0,0),(45,57,0,0),(46,55,0,0),(47,56,0,0),(48,58,0,0),(48,59,0,0),(48,60,0,0),(49,61,0,0),(49,62,0,0),(49,63,0,0),(49,64,0,0),(49,65,0,0),(50,67,0,0),(50,68,0,0),(51,66,0,0),(52,67,0,1),(52,68,0,1),(53,69,0,0),(54,69,0,1),(55,70,0,0),(56,70,0,1),(57,71,0,0);
/*!40000 ALTER TABLE `submission_chapter_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapter_settings`
--

DROP TABLE IF EXISTS `submission_chapter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_chapter_settings` (
  `submission_chapter_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chapter_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`submission_chapter_setting_id`),
  UNIQUE KEY `submission_chapter_settings_unique` (`chapter_id`,`locale`,`setting_name`),
  KEY `submission_chapter_settings_chapter_id` (`chapter_id`),
  CONSTRAINT `submission_chapter_settings_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=711 DEFAULT CHARSET=utf8mb3 COMMENT='More information about submission chapters, including localized properties such as chapter titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_settings`
--

LOCK TABLES `submission_chapter_settings` WRITE;
/*!40000 ALTER TABLE `submission_chapter_settings` DISABLE KEYS */;
INSERT INTO `submission_chapter_settings` VALUES (1,1,'en','title','Choosing the Future','string'),(2,1,'fr_CA','title','','string'),(3,1,'en','subtitle','','string'),(4,1,'fr_CA','subtitle','','string'),(5,1,'en','abstract','','string'),(6,1,'fr_CA','abstract','','string'),(7,1,'','datePublished',NULL,'string'),(8,1,'','pages','','string'),(9,1,'','isPageEnabled','0','bool'),(10,1,'','licenseUrl',NULL,'string'),(11,2,'en','title','Axioms','string'),(12,2,'fr_CA','title','','string'),(13,2,'en','subtitle','','string'),(14,2,'fr_CA','subtitle','','string'),(15,2,'en','abstract','','string'),(16,2,'fr_CA','abstract','','string'),(17,2,'','datePublished',NULL,'string'),(18,2,'','pages','','string'),(19,2,'','isPageEnabled','0','bool'),(20,2,'','licenseUrl',NULL,'string'),(21,3,'en','title','Paradigm Shift','string'),(22,3,'fr_CA','title','','string'),(23,3,'en','subtitle','','string'),(24,3,'fr_CA','subtitle','','string'),(25,3,'en','abstract','','string'),(26,3,'fr_CA','abstract','','string'),(27,3,'','datePublished',NULL,'string'),(28,3,'','pages','','string'),(29,3,'','isPageEnabled','0','bool'),(30,3,'','licenseUrl',NULL,'string'),(31,4,'en','title','Critical History in Western Canada 1900–2000','string'),(32,4,'fr_CA','title','','string'),(33,4,'en','subtitle','','string'),(34,4,'fr_CA','subtitle','','string'),(35,4,'en','abstract','','string'),(36,4,'fr_CA','abstract','','string'),(37,4,'','datePublished',NULL,'string'),(38,4,'','pages','','string'),(39,4,'','isPageEnabled','0','bool'),(40,4,'','licenseUrl','','string'),(41,5,'en','title','Vernacular Currents in Western Canadian Historiography: The Passion and Prose of Katherine Hughes, F.G. Roe, and Roy Ito','string'),(42,5,'fr_CA','title','','string'),(43,5,'en','subtitle','','string'),(44,5,'fr_CA','subtitle','','string'),(45,5,'en','abstract','','string'),(46,5,'fr_CA','abstract','','string'),(47,5,'','datePublished',NULL,'string'),(48,5,'','pages','','string'),(49,5,'','isPageEnabled','0','bool'),(50,5,'','licenseUrl','','string'),(51,6,'en','title','Cree Intellectual Traditions in History','string'),(52,6,'fr_CA','title','','string'),(53,6,'en','subtitle','','string'),(54,6,'fr_CA','subtitle','','string'),(55,6,'en','abstract','','string'),(56,6,'fr_CA','abstract','','string'),(57,6,'','datePublished',NULL,'string'),(58,6,'','pages','','string'),(59,6,'','isPageEnabled','0','bool'),(60,6,'','licenseUrl','','string'),(61,7,'en','title','Visualizing Space, Race, and History in the North: Photographic Narratives of the Athabasca-Mackenzie River Basin','string'),(62,7,'fr_CA','title','','string'),(63,7,'en','subtitle','','string'),(64,7,'fr_CA','subtitle','','string'),(65,7,'en','abstract','','string'),(66,7,'fr_CA','abstract','','string'),(67,7,'','datePublished',NULL,'string'),(68,7,'','pages','','string'),(69,7,'','isPageEnabled','0','bool'),(70,7,'','licenseUrl','','string'),(71,8,'en','title','Introduction','string'),(72,8,'fr_CA','title','','string'),(73,8,'en','subtitle','','string'),(74,8,'fr_CA','subtitle','','string'),(75,8,'en','abstract','','string'),(76,8,'fr_CA','abstract','','string'),(77,8,'','datePublished',NULL,'string'),(78,8,'','pages','','string'),(79,8,'','isPageEnabled','0','bool'),(80,8,'','licenseUrl',NULL,'string'),(81,9,'en','title','Part One. Employment Relationships in Canada','string'),(82,9,'fr_CA','title','','string'),(83,9,'en','subtitle','','string'),(84,9,'fr_CA','subtitle','','string'),(85,9,'en','abstract','','string'),(86,9,'fr_CA','abstract','','string'),(87,9,'','datePublished',NULL,'string'),(88,9,'','pages','','string'),(89,9,'','isPageEnabled','0','bool'),(90,9,'','licenseUrl',NULL,'string'),(91,10,'en','title','Part Two. Preventing Workplace Injury','string'),(92,10,'fr_CA','title','','string'),(93,10,'en','subtitle','','string'),(94,10,'fr_CA','subtitle','','string'),(95,10,'en','abstract','','string'),(96,10,'fr_CA','abstract','','string'),(97,10,'','datePublished',NULL,'string'),(98,10,'','pages','','string'),(99,10,'','isPageEnabled','0','bool'),(100,10,'','licenseUrl',NULL,'string'),(101,11,'en','title','Part Three. Critique of OHS in Canada','string'),(102,11,'fr_CA','title','','string'),(103,11,'en','subtitle','','string'),(104,11,'fr_CA','subtitle','','string'),(105,11,'en','abstract','','string'),(106,11,'fr_CA','abstract','','string'),(107,11,'','datePublished',NULL,'string'),(108,11,'','pages','','string'),(109,11,'','isPageEnabled','0','bool'),(110,11,'','licenseUrl',NULL,'string'),(111,12,'en','title','Part Four. Political Economy of Preventing Workplace Injury','string'),(112,12,'fr_CA','title','','string'),(113,12,'en','subtitle','','string'),(114,12,'fr_CA','subtitle','','string'),(115,12,'en','abstract','','string'),(116,12,'fr_CA','abstract','','string'),(117,12,'','datePublished',NULL,'string'),(118,12,'','pages','','string'),(119,12,'','isPageEnabled','0','bool'),(120,12,'','licenseUrl',NULL,'string'),(121,13,'en','title','Introduction: Contexts of Popular Culture','string'),(122,13,'fr_CA','title','','string'),(123,13,'en','subtitle','','string'),(124,13,'fr_CA','subtitle','','string'),(125,13,'en','abstract','','string'),(126,13,'fr_CA','abstract','','string'),(127,13,'','datePublished',NULL,'string'),(128,13,'','pages','','string'),(129,13,'','isPageEnabled','0','bool'),(130,13,'','licenseUrl',NULL,'string'),(131,14,'en','title','Chapter 1. A Future for Media Studies: Cultural Labour, Cultural Relations, Cultural Politics','string'),(132,14,'fr_CA','title','','string'),(133,14,'en','subtitle','','string'),(134,14,'fr_CA','subtitle','','string'),(135,14,'en','abstract','','string'),(136,14,'fr_CA','abstract','','string'),(137,14,'','datePublished',NULL,'string'),(138,14,'','pages','','string'),(139,14,'','isPageEnabled','0','bool'),(140,14,'','licenseUrl',NULL,'string'),(141,15,'en','title','Chapter 2. Log On, Goof Off, and Look Up: Facebook and the Rhythms of Canadian Internet Use','string'),(142,15,'fr_CA','title','','string'),(143,15,'en','subtitle','','string'),(144,15,'fr_CA','subtitle','','string'),(145,15,'en','abstract','','string'),(146,15,'fr_CA','abstract','','string'),(147,15,'','datePublished',NULL,'string'),(148,15,'','pages','','string'),(149,15,'','isPageEnabled','0','bool'),(150,15,'','licenseUrl',NULL,'string'),(151,16,'en','title','Chapter 3. Hawkers and Public Space: Free Commuter Newspapers in Canada','string'),(152,16,'fr_CA','title','','string'),(153,16,'en','subtitle','','string'),(154,16,'fr_CA','subtitle','','string'),(155,16,'en','abstract','','string'),(156,16,'fr_CA','abstract','','string'),(157,16,'','datePublished',NULL,'string'),(158,16,'','pages','','string'),(159,16,'','isPageEnabled','0','bool'),(160,16,'','licenseUrl',NULL,'string'),(161,17,'en','title','Prologue','string'),(162,17,'fr_CA','title','','string'),(163,17,'en','subtitle','','string'),(164,17,'fr_CA','subtitle','','string'),(165,17,'en','abstract','','string'),(166,17,'fr_CA','abstract','','string'),(167,17,'','datePublished',NULL,'string'),(168,17,'','pages','','string'),(169,17,'','isPageEnabled','0','bool'),(170,17,'','licenseUrl',NULL,'string'),(171,18,'en','title','Chapter 1: The First Five Years: 1867-1872','string'),(172,18,'fr_CA','title','','string'),(173,18,'en','subtitle','','string'),(174,18,'fr_CA','subtitle','','string'),(175,18,'en','abstract','','string'),(176,18,'fr_CA','abstract','','string'),(177,18,'','datePublished',NULL,'string'),(178,18,'','pages','','string'),(179,18,'','isPageEnabled','0','bool'),(180,18,'','licenseUrl',NULL,'string'),(181,19,'en','title','Chapter 2: Free Trade or \"Freedom\": 1911','string'),(182,19,'fr_CA','title','','string'),(183,19,'en','subtitle','','string'),(184,19,'fr_CA','subtitle','','string'),(185,19,'en','abstract','','string'),(186,19,'fr_CA','abstract','','string'),(187,19,'','datePublished',NULL,'string'),(188,19,'','pages','','string'),(189,19,'','isPageEnabled','0','bool'),(190,19,'','licenseUrl',NULL,'string'),(191,20,'en','title','Chapter 3: Castro, Nukes & the Cold War: 1953-1968','string'),(192,20,'fr_CA','title','','string'),(193,20,'en','subtitle','','string'),(194,20,'fr_CA','subtitle','','string'),(195,20,'en','abstract','','string'),(196,20,'fr_CA','abstract','','string'),(197,20,'','datePublished',NULL,'string'),(198,20,'','pages','','string'),(199,20,'','isPageEnabled','0','bool'),(200,20,'','licenseUrl',NULL,'string'),(201,21,'en','title','Chapter 4: Enter the Intellect: 1968-1984','string'),(202,21,'fr_CA','title','','string'),(203,21,'en','subtitle','','string'),(204,21,'fr_CA','subtitle','','string'),(205,21,'en','abstract','','string'),(206,21,'fr_CA','abstract','','string'),(207,21,'','datePublished',NULL,'string'),(208,21,'','pages','','string'),(209,21,'','isPageEnabled','0','bool'),(210,21,'','licenseUrl',NULL,'string'),(211,22,'en','title','Epilogue','string'),(212,22,'fr_CA','title','','string'),(213,22,'en','subtitle','','string'),(214,22,'fr_CA','subtitle','','string'),(215,22,'en','abstract','','string'),(216,22,'fr_CA','abstract','','string'),(217,22,'','datePublished',NULL,'string'),(218,22,'','pages','','string'),(219,22,'','isPageEnabled','0','bool'),(220,22,'','licenseUrl',NULL,'string'),(221,23,'en','title','Identify: Understanding Your Information Need','string'),(222,23,'fr_CA','title','','string'),(223,23,'en','subtitle','','string'),(224,23,'fr_CA','subtitle','','string'),(225,23,'en','abstract','','string'),(226,23,'fr_CA','abstract','','string'),(227,23,'','datePublished',NULL,'string'),(228,23,'','pages','','string'),(229,23,'','isPageEnabled','0','bool'),(230,23,'','licenseUrl',NULL,'string'),(231,24,'en','title','Scope: Knowing What Is Available','string'),(232,24,'fr_CA','title','','string'),(233,24,'en','subtitle','','string'),(234,24,'fr_CA','subtitle','','string'),(235,24,'en','abstract','','string'),(236,24,'fr_CA','abstract','','string'),(237,24,'','datePublished',NULL,'string'),(238,24,'','pages','','string'),(239,24,'','isPageEnabled','0','bool'),(240,24,'','licenseUrl',NULL,'string'),(241,25,'en','title','Plan: Developing Research Strategies','string'),(242,25,'fr_CA','title','','string'),(243,25,'en','subtitle','','string'),(244,25,'fr_CA','subtitle','','string'),(245,25,'en','abstract','','string'),(246,25,'fr_CA','abstract','','string'),(247,25,'','datePublished',NULL,'string'),(248,25,'','pages','','string'),(249,25,'','isPageEnabled','0','bool'),(250,25,'','licenseUrl',NULL,'string'),(251,26,'en','title','Gather: Finding What You Need','string'),(252,26,'fr_CA','title','','string'),(253,26,'en','subtitle','','string'),(254,26,'fr_CA','subtitle','','string'),(255,26,'en','abstract','','string'),(256,26,'fr_CA','abstract','','string'),(257,26,'','datePublished',NULL,'string'),(258,26,'','pages','','string'),(259,26,'','isPageEnabled','0','bool'),(260,26,'','licenseUrl',NULL,'string'),(261,27,'en','title','Introduction','string'),(262,27,'fr_CA','title','','string'),(263,27,'en','subtitle','','string'),(264,27,'fr_CA','subtitle','','string'),(265,27,'en','abstract','','string'),(266,27,'fr_CA','abstract','','string'),(267,27,'','datePublished',NULL,'string'),(268,27,'','pages','','string'),(269,27,'','isPageEnabled','0','bool'),(270,27,'','licenseUrl',NULL,'string'),(271,28,'en','title','Chapter 1: Interactions Affording Distance Science Education','string'),(272,28,'fr_CA','title','','string'),(273,28,'en','subtitle','','string'),(274,28,'fr_CA','subtitle','','string'),(275,28,'en','abstract','','string'),(276,28,'fr_CA','abstract','','string'),(277,28,'','datePublished',NULL,'string'),(278,28,'','pages','','string'),(279,28,'','isPageEnabled','0','bool'),(280,28,'','licenseUrl',NULL,'string'),(281,29,'en','title','Chapter 2: Learning Science at a Distance: Instructional Dialogues and Resources','string'),(282,29,'fr_CA','title','','string'),(283,29,'en','subtitle','','string'),(284,29,'fr_CA','subtitle','','string'),(285,29,'en','abstract','','string'),(286,29,'fr_CA','abstract','','string'),(287,29,'','datePublished',NULL,'string'),(288,29,'','pages','','string'),(289,29,'','isPageEnabled','0','bool'),(290,29,'','licenseUrl',NULL,'string'),(291,30,'en','title','Chapter 3: Leadership Strategies for Coordinating Distance Education Instructional Development Teams','string'),(292,30,'fr_CA','title','','string'),(293,30,'en','subtitle','','string'),(294,30,'fr_CA','subtitle','','string'),(295,30,'en','abstract','','string'),(296,30,'fr_CA','abstract','','string'),(297,30,'','datePublished',NULL,'string'),(298,30,'','pages','','string'),(299,30,'','isPageEnabled','0','bool'),(300,30,'','licenseUrl',NULL,'string'),(301,31,'en','title','Chapter 4: Toward New Models of Flexible Education to Enhance Quality in Australian Higher Education','string'),(302,31,'fr_CA','title','','string'),(303,31,'en','subtitle','','string'),(304,31,'fr_CA','subtitle','','string'),(305,31,'en','abstract','','string'),(306,31,'fr_CA','abstract','','string'),(307,31,'','datePublished',NULL,'string'),(308,31,'','pages','','string'),(309,31,'','isPageEnabled','0','bool'),(310,31,'','licenseUrl',NULL,'string'),(311,32,'en','title','Internet, openness and the future of the information society in LAC','string'),(312,32,'fr_CA','title','','string'),(313,32,'en','subtitle','','string'),(314,32,'fr_CA','subtitle','','string'),(315,32,'en','abstract','','string'),(316,32,'fr_CA','abstract','','string'),(317,32,'','datePublished',NULL,'string'),(318,32,'','pages','','string'),(319,32,'','isPageEnabled','0','bool'),(320,32,'','licenseUrl',NULL,'string'),(321,33,'en','title','Imagining the Internet: Open, closed or in between?','string'),(322,33,'fr_CA','title','','string'),(323,33,'en','subtitle','','string'),(324,33,'fr_CA','subtitle','','string'),(325,33,'en','abstract','','string'),(326,33,'fr_CA','abstract','','string'),(327,33,'','datePublished',NULL,'string'),(328,33,'','pages','','string'),(329,33,'','isPageEnabled','0','bool'),(330,33,'','licenseUrl',NULL,'string'),(331,34,'en','title','The internet in LAC will remain free, public and open over the next 10 years','string'),(332,34,'fr_CA','title','','string'),(333,34,'en','subtitle','','string'),(334,34,'fr_CA','subtitle','','string'),(335,34,'en','abstract','','string'),(336,34,'fr_CA','abstract','','string'),(337,34,'','datePublished',NULL,'string'),(338,34,'','pages','','string'),(339,34,'','isPageEnabled','0','bool'),(340,34,'','licenseUrl',NULL,'string'),(341,35,'en','title','Free Internet?','string'),(342,35,'fr_CA','title','','string'),(343,35,'en','subtitle','','string'),(344,35,'fr_CA','subtitle','','string'),(345,35,'en','abstract','','string'),(346,35,'fr_CA','abstract','','string'),(347,35,'','datePublished',NULL,'string'),(348,35,'','pages','','string'),(349,35,'','isPageEnabled','0','bool'),(350,35,'','licenseUrl',NULL,'string'),(351,36,'en','title','Risks and challenges for freedom of expression on the internet','string'),(352,36,'fr_CA','title','','string'),(353,36,'en','subtitle','','string'),(354,36,'fr_CA','subtitle','','string'),(355,36,'en','abstract','','string'),(356,36,'fr_CA','abstract','','string'),(357,36,'','datePublished',NULL,'string'),(358,36,'','pages','','string'),(359,36,'','isPageEnabled','0','bool'),(360,36,'','licenseUrl',NULL,'string'),(361,37,'en','title','Introduction','string'),(362,37,'fr_CA','title','','string'),(363,37,'en','subtitle','','string'),(364,37,'fr_CA','subtitle','','string'),(365,37,'en','abstract','','string'),(366,37,'fr_CA','abstract','','string'),(367,37,'','datePublished',NULL,'string'),(368,37,'','pages','','string'),(369,37,'','isPageEnabled','0','bool'),(370,37,'','licenseUrl',NULL,'string'),(371,38,'en','title','CHAPTER ONE: Where the Buffalo Roamed','string'),(372,38,'fr_CA','title','','string'),(373,38,'en','subtitle','','string'),(374,38,'fr_CA','subtitle','','string'),(375,38,'en','abstract','','string'),(376,38,'fr_CA','abstract','','string'),(377,38,'','datePublished',NULL,'string'),(378,38,'','pages','','string'),(379,38,'','isPageEnabled','0','bool'),(380,38,'','licenseUrl',NULL,'string'),(381,39,'en','title','CHAPTER TWO: Bison Conservation and Buffalo National Park','string'),(382,39,'fr_CA','title','','string'),(383,39,'en','subtitle','','string'),(384,39,'fr_CA','subtitle','','string'),(385,39,'en','abstract','','string'),(386,39,'fr_CA','abstract','','string'),(387,39,'','datePublished',NULL,'string'),(388,39,'','pages','','string'),(389,39,'','isPageEnabled','0','bool'),(390,39,'','licenseUrl',NULL,'string'),(391,40,'en','title','CHAPTER THREE: A Well-Run Ranch','string'),(392,40,'fr_CA','title','','string'),(393,40,'en','subtitle','','string'),(394,40,'fr_CA','subtitle','','string'),(395,40,'en','abstract','','string'),(396,40,'fr_CA','abstract','','string'),(397,40,'','datePublished',NULL,'string'),(398,40,'','pages','','string'),(399,40,'','isPageEnabled','0','bool'),(400,40,'','licenseUrl',NULL,'string'),(401,41,'en','title','CHAPTER FOUR: Zookeepers and Animal Breeders','string'),(402,41,'fr_CA','title','','string'),(403,41,'en','subtitle','','string'),(404,41,'fr_CA','subtitle','','string'),(405,41,'en','abstract','','string'),(406,41,'fr_CA','abstract','','string'),(407,41,'','datePublished',NULL,'string'),(408,41,'','pages','','string'),(409,41,'','isPageEnabled','0','bool'),(410,41,'','licenseUrl',NULL,'string'),(411,42,'en','title','CHAPTER FIVE: \"Evolving the Arctic Cow\"','string'),(412,42,'fr_CA','title','','string'),(413,42,'en','subtitle','','string'),(414,42,'fr_CA','subtitle','','string'),(415,42,'en','abstract','','string'),(416,42,'fr_CA','abstract','','string'),(417,42,'','datePublished',NULL,'string'),(418,42,'','pages','','string'),(419,42,'','isPageEnabled','0','bool'),(420,42,'','licenseUrl',NULL,'string'),(421,43,'en','title','CONCLUSION: The Forgotten Park','string'),(422,43,'fr_CA','title','','string'),(423,43,'en','subtitle','','string'),(424,43,'fr_CA','subtitle','','string'),(425,43,'en','abstract','','string'),(426,43,'fr_CA','abstract','','string'),(427,43,'','datePublished',NULL,'string'),(428,43,'','pages','','string'),(429,43,'','isPageEnabled','0','bool'),(430,43,'','licenseUrl',NULL,'string'),(431,44,'en','title','Bibliography','string'),(432,44,'fr_CA','title','','string'),(433,44,'en','subtitle','','string'),(434,44,'fr_CA','subtitle','','string'),(435,44,'en','abstract','','string'),(436,44,'fr_CA','abstract','','string'),(437,44,'','datePublished',NULL,'string'),(438,44,'','pages','','string'),(439,44,'','isPageEnabled','0','bool'),(440,44,'','licenseUrl',NULL,'string'),(441,45,'en','title','Index','string'),(442,45,'fr_CA','title','','string'),(443,45,'en','subtitle','','string'),(444,45,'fr_CA','subtitle','','string'),(445,45,'en','abstract','','string'),(446,45,'fr_CA','abstract','','string'),(447,45,'','datePublished',NULL,'string'),(448,45,'','pages','','string'),(449,45,'','isPageEnabled','0','bool'),(450,45,'','licenseUrl',NULL,'string'),(451,46,'en','title','Introduction','string'),(452,46,'fr_CA','title','','string'),(453,46,'en','subtitle','','string'),(454,46,'fr_CA','subtitle','','string'),(455,46,'en','abstract','','string'),(456,46,'fr_CA','abstract','','string'),(457,46,'','datePublished',NULL,'string'),(458,46,'','pages','','string'),(459,46,'','isPageEnabled','0','bool'),(460,46,'','licenseUrl',NULL,'string'),(461,47,'en','title','Poems','string'),(462,47,'fr_CA','title','','string'),(463,47,'en','subtitle','','string'),(464,47,'fr_CA','subtitle','','string'),(465,47,'en','abstract','','string'),(466,47,'fr_CA','abstract','','string'),(467,47,'','datePublished',NULL,'string'),(468,47,'','pages','','string'),(469,47,'','isPageEnabled','0','bool'),(470,47,'','licenseUrl',NULL,'string'),(471,48,'en','title','Catalyzing Access through Social and Technical Innovation','string'),(472,48,'fr_CA','title','','string'),(473,48,'en','subtitle','','string'),(474,48,'fr_CA','subtitle','','string'),(475,48,'en','abstract','','string'),(476,48,'fr_CA','abstract','','string'),(477,48,'','datePublished',NULL,'string'),(478,48,'','pages','','string'),(479,48,'','isPageEnabled','0','bool'),(480,48,'','licenseUrl',NULL,'string'),(481,49,'en','title','Catalyzing Access via Telecommunications Policy','string'),(482,49,'fr_CA','title','','string'),(483,49,'en','subtitle','','string'),(484,49,'fr_CA','subtitle','','string'),(485,49,'en','abstract','','string'),(486,49,'fr_CA','abstract','','string'),(487,49,'','datePublished',NULL,'string'),(488,49,'','pages','','string'),(489,49,'','isPageEnabled','0','bool'),(490,49,'','licenseUrl',NULL,'string'),(491,50,'en','title','Access to Knowledge as a New Paradigm for Research on ICTs and Intellectual Property','string'),(492,50,'fr_CA','title','','string'),(493,50,'en','subtitle','','string'),(494,50,'fr_CA','subtitle','','string'),(495,50,'en','abstract','','string'),(496,50,'fr_CA','abstract','','string'),(497,50,'','datePublished',NULL,'string'),(498,50,'','pages','','string'),(499,50,'','isPageEnabled','0','bool'),(500,50,'','licenseUrl',NULL,'string'),(501,51,'en','title','Current State of Mobile Learning','string'),(502,51,'fr_CA','title','','string'),(503,51,'en','subtitle','','string'),(504,51,'fr_CA','subtitle','','string'),(505,51,'en','abstract','','string'),(506,51,'fr_CA','abstract','','string'),(507,51,'','datePublished',NULL,'string'),(508,51,'','pages','','string'),(509,51,'','isPageEnabled','0','bool'),(510,51,'','licenseUrl',NULL,'string'),(511,52,'en','title','A Model for Framing Mobile Learning','string'),(512,52,'fr_CA','title','','string'),(513,52,'en','subtitle','','string'),(514,52,'fr_CA','subtitle','','string'),(515,52,'en','abstract','','string'),(516,52,'fr_CA','abstract','','string'),(517,52,'','datePublished',NULL,'string'),(518,52,'','pages','','string'),(519,52,'','isPageEnabled','0','bool'),(520,52,'','licenseUrl',NULL,'string'),(521,53,'en','title','Mobile Distance Learning with PDAs: Development and Testing of Pedagogical and System Solutions Supporting Mobile Distance Learners','string'),(522,53,'fr_CA','title','','string'),(523,53,'en','subtitle','','string'),(524,53,'fr_CA','subtitle','','string'),(525,53,'en','abstract','','string'),(526,53,'fr_CA','abstract','','string'),(527,53,'','datePublished',NULL,'string'),(528,53,'','pages','','string'),(529,53,'','isPageEnabled','0','bool'),(530,53,'','licenseUrl',NULL,'string'),(531,54,'en','title','Chapter 1: Mind Control—Internal or External?','string'),(532,54,'fr_CA','title','','string'),(533,54,'en','subtitle','','string'),(534,54,'fr_CA','subtitle','','string'),(535,54,'en','abstract','','string'),(536,54,'fr_CA','abstract','','string'),(537,54,'','datePublished',NULL,'string'),(538,54,'','pages','','string'),(539,54,'','isPageEnabled','1','bool'),(540,54,'','licenseUrl',NULL,'string'),(541,55,'en','title','Chapter 2: Classical Music and the Classical Mind','string'),(542,55,'fr_CA','title','','string'),(543,55,'en','subtitle','','string'),(544,55,'fr_CA','subtitle','','string'),(545,55,'en','abstract','','string'),(546,55,'fr_CA','abstract','','string'),(547,55,'','datePublished',NULL,'string'),(548,55,'','pages','','string'),(549,55,'','isPageEnabled','0','bool'),(550,55,'','licenseUrl',NULL,'string'),(551,56,'en','title','Chapter 3: Situated Cognition and Bricolage','string'),(552,56,'fr_CA','title','','string'),(553,56,'en','subtitle','','string'),(554,56,'fr_CA','subtitle','','string'),(555,56,'en','abstract','','string'),(556,56,'fr_CA','abstract','','string'),(557,56,'','datePublished',NULL,'string'),(558,56,'','pages','','string'),(559,56,'','isPageEnabled','0','bool'),(560,56,'','licenseUrl',NULL,'string'),(561,57,'en','title','Chapter 4: Braitenberg’s Vehicle 2','string'),(562,57,'fr_CA','title','','string'),(563,57,'en','subtitle','','string'),(564,57,'fr_CA','subtitle','','string'),(565,57,'en','abstract','','string'),(566,57,'fr_CA','abstract','','string'),(567,57,'','datePublished',NULL,'string'),(568,57,'','pages','','string'),(569,57,'','isPageEnabled','0','bool'),(570,57,'','licenseUrl',NULL,'string'),(571,58,'en','title','Setting the Stage','string'),(572,58,'fr_CA','title','','string'),(573,58,'en','subtitle','','string'),(574,58,'fr_CA','subtitle','','string'),(575,58,'en','abstract','','string'),(576,58,'fr_CA','abstract','','string'),(577,58,'','datePublished',NULL,'string'),(578,58,'','pages','','string'),(579,58,'','isPageEnabled','0','bool'),(580,58,'','licenseUrl',NULL,'string'),(581,59,'en','title','Going It Alone, 1945-1954','string'),(582,59,'fr_CA','title','','string'),(583,59,'en','subtitle','','string'),(584,59,'fr_CA','subtitle','','string'),(585,59,'en','abstract','','string'),(586,59,'fr_CA','abstract','','string'),(587,59,'','datePublished',NULL,'string'),(588,59,'','pages','','string'),(589,59,'','isPageEnabled','0','bool'),(590,59,'','licenseUrl',NULL,'string'),(591,60,'en','title','Establishing the Pattern, 1955-1962','string'),(592,60,'fr_CA','title','','string'),(593,60,'en','subtitle','','string'),(594,60,'fr_CA','subtitle','','string'),(595,60,'en','abstract','','string'),(596,60,'fr_CA','abstract','','string'),(597,60,'','datePublished',NULL,'string'),(598,60,'','pages','','string'),(599,60,'','isPageEnabled','0','bool'),(600,60,'','licenseUrl',NULL,'string'),(601,61,'en','title','Foreward','string'),(602,61,'fr_CA','title','','string'),(603,61,'en','subtitle','','string'),(604,61,'fr_CA','subtitle','','string'),(605,61,'en','abstract','','string'),(606,61,'fr_CA','abstract','','string'),(607,61,'','datePublished',NULL,'string'),(608,61,'','pages','','string'),(609,61,'','isPageEnabled','0','bool'),(610,61,'','licenseUrl',NULL,'string'),(611,62,'en','title','Preface','string'),(612,62,'fr_CA','title','','string'),(613,62,'en','subtitle','','string'),(614,62,'fr_CA','subtitle','','string'),(615,62,'en','abstract','','string'),(616,62,'fr_CA','abstract','','string'),(617,62,'','datePublished',NULL,'string'),(618,62,'','pages','','string'),(619,62,'','isPageEnabled','0','bool'),(620,62,'','licenseUrl',NULL,'string'),(621,63,'en','title','The Case Studies','string'),(622,63,'fr_CA','title','','string'),(623,63,'en','subtitle','','string'),(624,63,'fr_CA','subtitle','','string'),(625,63,'en','abstract','','string'),(626,63,'fr_CA','abstract','','string'),(627,63,'','datePublished',NULL,'string'),(628,63,'','pages','','string'),(629,63,'','isPageEnabled','0','bool'),(630,63,'','licenseUrl',NULL,'string'),(631,64,'en','title','Conclusion','string'),(632,64,'fr_CA','title','','string'),(633,64,'en','subtitle','','string'),(634,64,'fr_CA','subtitle','','string'),(635,64,'en','abstract','','string'),(636,64,'fr_CA','abstract','','string'),(637,64,'','datePublished',NULL,'string'),(638,64,'','pages','','string'),(639,64,'','isPageEnabled','0','bool'),(640,64,'','licenseUrl',NULL,'string'),(641,65,'en','title','Bibliography','string'),(642,65,'fr_CA','title','','string'),(643,65,'en','subtitle','','string'),(644,65,'fr_CA','subtitle','','string'),(645,65,'en','abstract','','string'),(646,65,'fr_CA','abstract','','string'),(647,65,'','datePublished',NULL,'string'),(648,65,'','pages','','string'),(649,65,'','isPageEnabled','0','bool'),(650,65,'','licenseUrl',NULL,'string'),(651,66,'en','title','Preface','string'),(652,66,'fr_CA','title','','string'),(653,66,'en','subtitle','','string'),(654,66,'fr_CA','subtitle','','string'),(655,66,'en','abstract','','string'),(656,66,'fr_CA','abstract','','string'),(657,66,'','datePublished',NULL,'string'),(658,66,'','pages','','string'),(659,66,'','isPageEnabled','0','bool'),(660,66,'','licenseUrl',NULL,'string'),(661,67,'en','title','Introduction','string'),(662,67,'fr_CA','title','','string'),(663,67,'en','subtitle','','string'),(664,67,'fr_CA','subtitle','','string'),(665,67,'en','abstract','','string'),(666,67,'fr_CA','abstract','','string'),(667,67,'','datePublished',NULL,'string'),(668,67,'','pages','','string'),(669,67,'','isPageEnabled','0','bool'),(670,67,'','licenseUrl',NULL,'string'),(671,68,'en','title','The Emergence of Open Development in a Network Society','string'),(672,68,'fr_CA','title','','string'),(673,68,'en','subtitle','','string'),(674,68,'fr_CA','subtitle','','string'),(675,68,'en','abstract','','string'),(676,68,'fr_CA','abstract','','string'),(677,68,'','datePublished',NULL,'string'),(678,68,'','pages','','string'),(679,68,'','isPageEnabled','0','bool'),(680,68,'','licenseUrl',NULL,'string'),(681,69,'en','title','Enacting Openness in ICT4D Research','string'),(682,69,'fr_CA','title','','string'),(683,69,'en','subtitle','','string'),(684,69,'fr_CA','subtitle','','string'),(685,69,'en','abstract','','string'),(686,69,'fr_CA','abstract','','string'),(687,69,'','datePublished',NULL,'string'),(688,69,'','pages','','string'),(689,69,'','isPageEnabled','0','bool'),(690,69,'','licenseUrl',NULL,'string'),(691,70,'en','title','Transparency and Development: Ethical Consumption through Web 2.0 and the Internet of Things','string'),(692,70,'fr_CA','title','','string'),(693,70,'en','subtitle','','string'),(694,70,'fr_CA','subtitle','','string'),(695,70,'en','abstract','','string'),(696,70,'fr_CA','abstract','','string'),(697,70,'','datePublished',NULL,'string'),(698,70,'','pages','','string'),(699,70,'','isPageEnabled','0','bool'),(700,70,'','licenseUrl',NULL,'string'),(701,71,'en','title','Open Educational Resources: Opportunities and Challenges for the Developing World','string'),(702,71,'fr_CA','title','','string'),(703,71,'en','subtitle','','string'),(704,71,'fr_CA','subtitle','','string'),(705,71,'en','abstract','','string'),(706,71,'fr_CA','abstract','','string'),(707,71,'','datePublished',NULL,'string'),(708,71,'','pages','','string'),(709,71,'','isPageEnabled','0','bool'),(710,71,'','licenseUrl',NULL,'string');
/*!40000 ALTER TABLE `submission_chapter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapters`
--

DROP TABLE IF EXISTS `submission_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_chapters` (
  `chapter_id` bigint NOT NULL AUTO_INCREMENT,
  `primary_contact_id` bigint DEFAULT NULL,
  `publication_id` bigint NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `source_chapter_id` bigint DEFAULT NULL,
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`chapter_id`),
  KEY `chapters_chapter_id` (`chapter_id`),
  KEY `submission_chapters_primary_contact_id` (`primary_contact_id`),
  KEY `submission_chapters_publication_id` (`publication_id`),
  KEY `submission_chapters_source_chapter_id` (`source_chapter_id`),
  KEY `submission_chapters_doi_id_foreign` (`doi_id`),
  CONSTRAINT `submission_chapters_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_chapters_primary_contact_id_foreign` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_chapters_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_chapters_source_chapter_id_foreign` FOREIGN KEY (`source_chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 COMMENT='A list of chapters for each submission (when submissions are divided into chapters).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapters`
--

LOCK TABLES `submission_chapters` WRITE;
/*!40000 ALTER TABLE `submission_chapters` DISABLE KEYS */;
INSERT INTO `submission_chapters` VALUES (1,NULL,1,1,1,NULL),(2,NULL,1,2,2,NULL),(3,NULL,1,3,3,NULL),(4,NULL,2,1,4,NULL),(5,NULL,2,2,5,NULL),(6,NULL,2,3,6,NULL),(7,NULL,2,4,7,NULL),(8,NULL,3,1,8,NULL),(9,NULL,3,2,9,NULL),(10,NULL,3,3,10,NULL),(11,NULL,3,4,11,NULL),(12,NULL,3,5,12,NULL),(13,NULL,4,1,13,NULL),(14,NULL,4,2,14,NULL),(15,NULL,4,3,15,NULL),(16,NULL,4,4,16,NULL),(17,NULL,5,1,17,NULL),(18,NULL,5,2,18,NULL),(19,NULL,5,3,19,NULL),(20,NULL,5,4,20,NULL),(21,NULL,5,5,21,NULL),(22,NULL,5,6,22,NULL),(23,NULL,6,1,23,NULL),(24,NULL,6,2,24,NULL),(25,NULL,6,3,25,NULL),(26,NULL,6,4,26,NULL),(27,NULL,7,1,27,NULL),(28,NULL,7,2,28,NULL),(29,NULL,7,3,29,NULL),(30,NULL,7,4,30,NULL),(31,NULL,7,5,31,NULL),(32,NULL,9,1,32,NULL),(33,NULL,9,2,33,NULL),(34,NULL,9,3,34,NULL),(35,NULL,9,4,35,NULL),(36,NULL,9,5,36,NULL),(37,NULL,10,1,37,NULL),(38,NULL,10,2,38,NULL),(39,NULL,10,3,39,NULL),(40,NULL,10,4,40,NULL),(41,NULL,10,5,41,NULL),(42,NULL,10,6,42,NULL),(43,NULL,10,7,43,NULL),(44,NULL,10,8,44,NULL),(45,NULL,10,9,45,NULL),(46,NULL,11,1,46,NULL),(47,NULL,11,2,47,NULL),(48,NULL,12,1,48,NULL),(49,NULL,12,2,49,NULL),(50,NULL,12,3,50,NULL),(51,NULL,13,1,51,NULL),(52,NULL,13,2,52,NULL),(53,NULL,13,3,53,NULL),(54,NULL,14,1,54,NULL),(55,NULL,14,2,55,NULL),(56,NULL,14,3,56,NULL),(57,NULL,14,4,57,NULL),(58,NULL,15,1,58,NULL),(59,NULL,15,2,59,NULL),(60,NULL,15,3,60,NULL),(61,NULL,16,1,61,NULL),(62,NULL,16,2,62,NULL),(63,NULL,16,3,63,NULL),(64,NULL,16,4,64,NULL),(65,NULL,16,5,65,NULL),(66,NULL,17,1,66,NULL),(67,NULL,17,2,67,NULL),(68,NULL,17,3,68,NULL),(69,NULL,17,4,69,NULL),(70,NULL,17,5,70,NULL),(71,NULL,17,6,71,NULL);
/*!40000 ALTER TABLE `submission_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_comments`
--

DROP TABLE IF EXISTS `submission_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_comments` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT,
  `comment_type` bigint DEFAULT NULL,
  `role_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `author_id` bigint NOT NULL,
  `comment_title` text NOT NULL,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`),
  KEY `submission_comments_author_id` (`author_id`),
  CONSTRAINT `submission_comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_comments_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='Comments on a submission, e.g. peer review comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
INSERT INTO `submission_comments` VALUES (1,1,4096,11,10,10,'','<p>I recommend that the author revise this submission.</p>','2024-12-20 05:39:16',NULL,1),(2,1,4096,11,11,12,'','<p>I recommend that the author resubmit this submission.</p>','2024-12-20 05:39:25',NULL,1),(3,1,4096,12,13,8,'','<p>I recommend declining this submission.</p>','2024-12-20 05:40:40',NULL,1),(4,1,4096,13,16,10,'','<p>I recommend requiring revisions.</p>','2024-12-20 05:41:49',NULL,1),(5,1,4096,13,18,12,'','<p>I recommend resubmitting.</p>','2024-12-20 05:41:58',NULL,1),(6,1,4096,16,21,10,'','<p>I recommend that the author revise this submission.</p>','2024-12-20 05:46:21',NULL,1);
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_revisions`
--

DROP TABLE IF EXISTS `submission_file_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint unsigned NOT NULL,
  `file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `submission_file_revisions_submission_file_id` (`submission_file_id`),
  KEY `submission_file_revisions_file_id` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb3 COMMENT='Revisions map submission_file entries to files on the data store.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,3),(5,5,2),(6,6,1),(7,7,4),(8,8,5),(9,9,6),(10,10,7),(12,12,7),(13,13,6),(14,14,5),(15,15,4),(16,16,9),(17,17,10),(18,18,11),(19,19,12),(20,20,13),(21,21,14),(22,22,15),(23,23,16),(24,24,17),(25,25,17),(26,26,16),(27,27,15),(28,28,14),(29,29,18),(30,30,19),(31,31,20),(32,32,21),(33,33,22),(34,34,23),(35,35,23),(36,36,22),(37,37,21),(38,38,20),(39,39,18),(40,40,19),(41,41,23),(42,42,24),(43,43,25),(44,44,26),(45,45,27),(46,46,27),(47,47,26),(48,48,25),(49,49,24),(50,50,28),(51,51,29),(52,52,30),(53,53,31),(54,54,32),(55,55,32),(56,56,31),(57,57,30),(58,58,29),(59,59,28),(60,60,33),(61,61,34),(62,62,35),(63,63,36),(64,64,37),(65,65,38),(66,66,38),(67,67,37),(68,68,36),(69,69,35),(70,70,34),(71,71,39),(72,72,40),(73,73,41),(74,74,42),(75,75,43),(76,76,44),(77,77,45),(78,78,46),(79,79,47),(80,80,48),(81,81,49),(82,82,49),(83,83,48),(84,84,50),(85,85,51),(86,86,52),(87,87,52),(88,88,51),(89,89,50),(90,90,53),(91,91,54),(92,92,55),(93,93,55),(94,94,54),(95,95,53),(96,96,56),(97,97,57),(98,98,58),(99,99,59),(100,100,60),(101,101,61),(102,102,61),(103,103,60),(104,104,59),(105,105,58),(106,106,57),(107,107,56),(108,108,61),(109,109,60),(110,110,59),(111,111,58),(112,112,57),(113,113,56),(114,114,62),(115,115,63),(116,116,64),(117,117,64),(118,118,63),(119,119,62),(120,120,65),(121,121,66),(122,122,67),(123,123,68),(124,124,69),(125,125,69),(126,126,68),(127,127,67),(128,128,66),(129,129,65),(130,130,70),(131,131,71),(132,132,72),(133,133,73),(134,134,74),(135,135,75),(136,136,75),(137,137,74),(138,138,73),(139,139,72),(140,140,71),(141,141,70);
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint unsigned NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`submission_file_setting_id`),
  UNIQUE KEY `submission_file_settings_unique` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_submission_file_id` (`submission_file_id`),
  CONSTRAINT `submission_file_settings_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8mb3 COMMENT='Localized data about submission files like published metadata.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,1,'en','name','chapter1.pdf'),(2,2,'en','name','chapter2.pdf'),(3,3,'en','name','chapter3.pdf'),(4,1,'','chapterId','1'),(5,2,'','chapterId','2'),(6,3,'','chapterId','3'),(7,4,'en','name','chapter3.pdf'),(8,4,'','chapterId','3'),(9,5,'en','name','chapter2.pdf'),(10,5,'','chapterId','2'),(11,6,'en','name','chapter1.pdf'),(12,6,'','chapterId','1'),(13,7,'en','name','chapter1.pdf'),(14,8,'en','name','chapter2.pdf'),(15,9,'en','name','chapter3.pdf'),(16,10,'en','name','chapter4.pdf'),(18,7,'','chapterId','4'),(19,8,'','chapterId','5'),(20,9,'','chapterId','6'),(21,10,'','chapterId','7'),(22,12,'en','name','chapter4.pdf'),(23,12,'','chapterId','7'),(24,13,'en','name','chapter3.pdf'),(25,13,'','chapterId','6'),(26,14,'en','name','chapter2.pdf'),(27,14,'','chapterId','5'),(28,15,'en','name','chapter1.pdf'),(29,15,'','chapterId','4'),(30,16,'en','name','chapter1.pdf'),(31,17,'en','name','chapter2.pdf'),(32,18,'en','name','chapter3.pdf'),(33,19,'en','name','chapter4.pdf'),(34,20,'en','name','chapter5.pdf'),(35,16,'','chapterId','8'),(36,17,'','chapterId','9'),(37,18,'','chapterId','10'),(38,19,'','chapterId','11'),(39,20,'','chapterId','12'),(40,21,'en','name','chapter1.pdf'),(41,22,'en','name','chapter2.pdf'),(42,23,'en','name','chapter3.pdf'),(43,24,'en','name','intro.pdf'),(44,24,'','chapterId','13'),(45,21,'','chapterId','14'),(46,22,'','chapterId','15'),(47,23,'','chapterId','16'),(48,25,'en','name','intro.pdf'),(49,25,'','chapterId','13'),(50,26,'en','name','chapter3.pdf'),(51,26,'','chapterId','16'),(52,27,'en','name','chapter2.pdf'),(53,27,'','chapterId','15'),(54,28,'en','name','chapter1.pdf'),(55,28,'','chapterId','14'),(56,29,'en','name','prologue.pdf'),(57,30,'en','name','chapter1.pdf'),(58,31,'en','name','chapter2.pdf'),(59,32,'en','name','chapter3.pdf'),(60,33,'en','name','chapter4.pdf'),(61,34,'en','name','epilogue.pdf'),(62,29,'','chapterId','17'),(63,30,'','chapterId','18'),(64,31,'','chapterId','19'),(65,32,'','chapterId','20'),(66,33,'','chapterId','21'),(67,34,'','chapterId','22'),(68,35,'en','name','epilogue.pdf'),(69,35,'','chapterId','22'),(70,36,'en','name','chapter4.pdf'),(71,36,'','chapterId','21'),(72,37,'en','name','chapter3.pdf'),(73,37,'','chapterId','20'),(74,38,'en','name','chapter2.pdf'),(75,38,'','chapterId','19'),(76,39,'en','name','prologue.pdf'),(77,39,'','chapterId','17'),(78,40,'en','name','chapter1.pdf'),(79,40,'','chapterId','18'),(80,41,'en','name','epilogue.pdf'),(81,41,'','chapterId','22'),(82,42,'en','name','chapter1.pdf'),(83,43,'en','name','chapter2.pdf'),(84,44,'en','name','chapter3.pdf'),(85,45,'en','name','chapter4.pdf'),(86,42,'','chapterId','23'),(87,43,'','chapterId','24'),(88,44,'','chapterId','25'),(89,45,'','chapterId','26'),(90,46,'en','name','chapter4.pdf'),(91,46,'','chapterId','26'),(92,47,'en','name','chapter3.pdf'),(93,47,'','chapterId','25'),(94,48,'en','name','chapter2.pdf'),(95,48,'','chapterId','24'),(96,49,'en','name','chapter1.pdf'),(97,49,'','chapterId','23'),(98,50,'en','name','intro.pdf'),(99,51,'en','name','chapter1.pdf'),(100,52,'en','name','chapter2.pdf'),(101,53,'en','name','chapter3.pdf'),(102,54,'en','name','chapter4.pdf'),(103,50,'','chapterId','27'),(104,51,'','chapterId','28'),(105,52,'','chapterId','29'),(106,53,'','chapterId','30'),(107,54,'','chapterId','31'),(108,55,'en','name','chapter4.pdf'),(109,55,'','chapterId','31'),(110,56,'en','name','chapter3.pdf'),(111,56,'','chapterId','30'),(112,57,'en','name','chapter2.pdf'),(113,57,'','chapterId','29'),(114,58,'en','name','chapter1.pdf'),(115,58,'','chapterId','28'),(116,59,'en','name','intro.pdf'),(117,59,'','chapterId','27'),(118,60,'en','name','note.pdf'),(119,61,'en','name','chapter1.pdf'),(120,62,'en','name','chapter2.pdf'),(121,63,'en','name','chapter3.pdf'),(122,64,'en','name','chapter4.pdf'),(123,65,'en','name','chapter5.pdf'),(124,61,'','chapterId','32'),(125,62,'','chapterId','33'),(126,63,'','chapterId','34'),(127,64,'','chapterId','35'),(128,65,'','chapterId','36'),(129,66,'en','name','chapter5.pdf'),(130,66,'','chapterId','36'),(131,67,'en','name','chapter4.pdf'),(132,67,'','chapterId','35'),(133,68,'en','name','chapter3.pdf'),(134,68,'','chapterId','34'),(135,69,'en','name','chapter2.pdf'),(136,69,'','chapterId','33'),(137,70,'en','name','chapter1.pdf'),(138,70,'','chapterId','32'),(139,71,'en','name','intro.pdf'),(140,72,'en','name','chapter1.pdf'),(141,73,'en','name','chapter2.pdf'),(142,74,'en','name','chapter3.pdf'),(143,75,'en','name','chapter4.pdf'),(144,76,'en','name','chapter5.pdf'),(145,77,'en','name','conclusion.pdf'),(146,78,'en','name','bibliography.pdf'),(147,79,'en','name','index.pdf'),(148,71,'','chapterId','37'),(149,72,'','chapterId','38'),(150,73,'','chapterId','39'),(151,74,'','chapterId','40'),(152,75,'','chapterId','41'),(153,76,'','chapterId','42'),(154,77,'','chapterId','43'),(155,78,'','chapterId','44'),(156,79,'','chapterId','45'),(157,80,'en','name','intro.pdf'),(158,81,'en','name','poems.pdf'),(159,80,'','chapterId','46'),(160,81,'','chapterId','47'),(161,82,'en','name','poems.pdf'),(162,82,'','chapterId','47'),(163,83,'en','name','intro.pdf'),(164,83,'','chapterId','46'),(165,84,'en','name','chapter1.pdf'),(166,85,'en','name','chapter2.pdf'),(167,86,'en','name','chapter3.pdf'),(168,84,'','chapterId','48'),(169,85,'','chapterId','49'),(170,86,'','chapterId','50'),(171,87,'en','name','chapter3.pdf'),(172,87,'','chapterId','50'),(173,88,'en','name','chapter2.pdf'),(174,88,'','chapterId','49'),(175,89,'en','name','chapter1.pdf'),(176,89,'','chapterId','48'),(177,90,'en','name','chapter1.pdf'),(178,91,'en','name','chapter2.pdf'),(179,92,'en','name','chapter3.pdf'),(180,90,'','chapterId','51'),(181,91,'','chapterId','52'),(182,92,'','chapterId','53'),(183,93,'en','name','chapter3.pdf'),(184,93,'','chapterId','53'),(185,94,'en','name','chapter2.pdf'),(186,94,'','chapterId','52'),(187,95,'en','name','chapter1.pdf'),(188,95,'','chapterId','51'),(189,96,'en','name','chapter1.pdf'),(190,97,'en','name','chapter2.pdf'),(191,98,'en','name','chapter3.pdf'),(192,99,'en','name','chapter4.pdf'),(193,100,'en','name','Segmentation of Vascular Ultrasound Imag.pdf'),(194,101,'en','name','The Canadian Nutrient File: Nutrient Val.pdf'),(196,96,'','chapterId','54'),(197,97,'','chapterId','55'),(198,98,'','chapterId','56'),(199,99,'','chapterId','57'),(200,102,'en','name','The Canadian Nutrient File: Nutrient Val.pdf'),(201,103,'en','name','Segmentation of Vascular Ultrasound Imag.pdf'),(202,104,'en','name','chapter4.pdf'),(203,104,'','chapterId','57'),(204,105,'en','name','chapter3.pdf'),(205,105,'','chapterId','56'),(206,106,'en','name','chapter2.pdf'),(207,106,'','chapterId','55'),(208,107,'en','name','chapter1.pdf'),(209,107,'','chapterId','54'),(210,108,'en','name','The Canadian Nutrient File: Nutrient Val.pdf'),(211,109,'en','name','Segmentation of Vascular Ultrasound Imag.pdf'),(212,110,'en','name','chapter4.pdf'),(213,110,'','chapterId','57'),(214,111,'en','name','chapter3.pdf'),(215,111,'','chapterId','56'),(216,112,'en','name','chapter2.pdf'),(217,112,'','chapterId','55'),(218,113,'en','name','chapter1.pdf'),(219,113,'','chapterId','54'),(220,114,'en','name','chapter1.pdf'),(221,115,'en','name','chapter2.pdf'),(222,116,'en','name','chapter3.pdf'),(223,114,'','chapterId','58'),(224,115,'','chapterId','59'),(225,116,'','chapterId','60'),(226,117,'en','name','chapter3.pdf'),(227,117,'','chapterId','60'),(228,118,'en','name','chapter2.pdf'),(229,118,'','chapterId','59'),(230,119,'en','name','chapter1.pdf'),(231,119,'','chapterId','58'),(232,120,'en','name','foreward.pdf'),(233,121,'en','name','preface.pdf'),(234,122,'en','name','cases.pdf'),(235,123,'en','name','conclusion.pdf'),(236,124,'en','name','bibliography.pdf'),(237,120,'','chapterId','61'),(238,121,'','chapterId','62'),(239,122,'','chapterId','63'),(240,123,'','chapterId','64'),(241,124,'','chapterId','65'),(242,125,'en','name','bibliography.pdf'),(243,125,'','chapterId','65'),(244,126,'en','name','conclusion.pdf'),(245,126,'','chapterId','64'),(246,127,'en','name','cases.pdf'),(247,127,'','chapterId','63'),(248,128,'en','name','preface.pdf'),(249,128,'','chapterId','62'),(250,129,'en','name','foreward.pdf'),(251,129,'','chapterId','61'),(252,130,'en','name','preface.pdf'),(253,131,'en','name','introduction.pdf'),(254,132,'en','name','chapter1.pdf'),(255,133,'en','name','chapter2.pdf'),(256,134,'en','name','chapter3.pdf'),(257,135,'en','name','chapter4.pdf'),(258,130,'','chapterId','66'),(259,131,'','chapterId','67'),(260,132,'','chapterId','68'),(261,133,'','chapterId','69'),(262,134,'','chapterId','70'),(263,135,'','chapterId','71'),(264,136,'en','name','chapter4.pdf'),(265,136,'','chapterId','71'),(266,137,'en','name','chapter3.pdf'),(267,137,'','chapterId','70'),(268,138,'en','name','chapter2.pdf'),(269,138,'','chapterId','69'),(270,139,'en','name','chapter1.pdf'),(271,139,'','chapterId','68'),(272,140,'en','name','introduction.pdf'),(273,140,'','chapterId','67'),(274,141,'en','name','preface.pdf'),(275,141,'','chapterId','66');
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_files` (
  `submission_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `file_id` bigint unsigned NOT NULL,
  `source_submission_file_id` bigint unsigned DEFAULT NULL,
  `genre_id` bigint DEFAULT NULL,
  `file_stage` bigint NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` smallint DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_user_id` bigint DEFAULT NULL,
  `assoc_type` bigint DEFAULT NULL,
  `assoc_id` bigint DEFAULT NULL,
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`submission_file_id`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_file_id` (`file_id`),
  KEY `submission_files_genre_id` (`genre_id`),
  KEY `submission_files_uploader_user_id` (`uploader_user_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  KEY `submission_files_source_submission_file_id` (`source_submission_file_id`),
  KEY `submission_files_doi_id` (`doi_id`),
  CONSTRAINT `submission_files_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_files_source_submission_file_id_foreign` FOREIGN KEY (`source_submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_uploader_user_id_foreign` FOREIGN KEY (`uploader_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb3 COMMENT='All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:26:47','2024-12-20 05:26:47',19,NULL,NULL,NULL),(2,1,2,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:26:48','2024-12-20 05:26:48',19,NULL,NULL,NULL),(3,1,3,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:26:49','2024-12-20 05:26:49',19,NULL,NULL,NULL),(4,1,3,3,3,4,NULL,NULL,NULL,'2024-12-20 05:27:12','2024-12-20 05:27:12',19,523,1,NULL),(5,1,2,2,3,4,NULL,NULL,NULL,'2024-12-20 05:27:12','2024-12-20 05:27:12',19,523,1,NULL),(6,1,1,1,3,4,NULL,NULL,NULL,'2024-12-20 05:27:12','2024-12-20 05:27:12',19,523,1,NULL),(7,2,4,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:27:43','2024-12-20 05:27:43',20,NULL,NULL,NULL),(8,2,5,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:27:44','2024-12-20 05:27:44',20,NULL,NULL,NULL),(9,2,6,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:27:45','2024-12-20 05:27:45',20,NULL,NULL,NULL),(10,2,7,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:27:46','2024-12-20 05:27:46',20,NULL,NULL,NULL),(12,2,7,10,3,4,NULL,NULL,NULL,'2024-12-20 05:29:24','2024-12-20 05:29:24',20,523,2,NULL),(13,2,6,9,3,4,NULL,NULL,NULL,'2024-12-20 05:29:24','2024-12-20 05:29:24',20,523,2,NULL),(14,2,5,8,3,4,NULL,NULL,NULL,'2024-12-20 05:29:24','2024-12-20 05:29:24',20,523,2,NULL),(15,2,4,7,3,4,NULL,NULL,NULL,'2024-12-20 05:29:24','2024-12-20 05:29:24',20,523,2,NULL),(16,3,9,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:29:45','2024-12-20 05:29:45',21,NULL,NULL,NULL),(17,3,10,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:29:46','2024-12-20 05:29:46',21,NULL,NULL,NULL),(18,3,11,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:29:47','2024-12-20 05:29:47',21,NULL,NULL,NULL),(19,3,12,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:29:47','2024-12-20 05:29:48',21,NULL,NULL,NULL),(20,3,13,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:29:48','2024-12-20 05:29:49',21,NULL,NULL,NULL),(21,4,14,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:30:25','2024-12-20 05:30:25',22,NULL,NULL,NULL),(22,4,15,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:30:26','2024-12-20 05:30:26',22,NULL,NULL,NULL),(23,4,16,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:30:27','2024-12-20 05:30:27',22,NULL,NULL,NULL),(24,4,17,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:30:28','2024-12-20 05:30:28',22,NULL,NULL,NULL),(25,4,17,24,3,19,NULL,NULL,NULL,'2024-12-20 05:30:59','2024-12-20 05:30:59',22,523,3,NULL),(26,4,16,23,3,19,NULL,NULL,NULL,'2024-12-20 05:30:59','2024-12-20 05:30:59',22,523,3,NULL),(27,4,15,22,3,19,NULL,NULL,NULL,'2024-12-20 05:30:59','2024-12-20 05:30:59',22,523,3,NULL),(28,4,14,21,3,19,NULL,NULL,NULL,'2024-12-20 05:30:59','2024-12-20 05:30:59',22,523,3,NULL),(29,5,18,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:31:50','2024-12-20 05:31:50',23,NULL,NULL,NULL),(30,5,19,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:31:50','2024-12-20 05:31:51',23,NULL,NULL,NULL),(31,5,20,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:31:51','2024-12-20 05:31:52',23,NULL,NULL,NULL),(32,5,21,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:31:52','2024-12-20 05:31:53',23,NULL,NULL,NULL),(33,5,22,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:31:53','2024-12-20 05:31:53',23,NULL,NULL,NULL),(34,5,23,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:31:54','2024-12-20 05:31:54',23,NULL,NULL,NULL),(35,5,23,34,3,19,NULL,NULL,NULL,'2024-12-20 05:32:37','2024-12-20 05:32:37',23,523,5,NULL),(36,5,22,33,3,19,NULL,NULL,NULL,'2024-12-20 05:32:37','2024-12-20 05:32:37',23,523,5,NULL),(37,5,21,32,3,19,NULL,NULL,NULL,'2024-12-20 05:32:37','2024-12-20 05:32:37',23,523,5,NULL),(38,5,20,31,3,19,NULL,NULL,NULL,'2024-12-20 05:32:37','2024-12-20 05:32:37',23,523,5,NULL),(39,5,18,29,3,19,NULL,NULL,NULL,'2024-12-20 05:32:37','2024-12-20 05:32:37',23,523,5,NULL),(40,5,19,30,3,19,NULL,NULL,NULL,'2024-12-20 05:32:37','2024-12-20 05:32:37',23,523,5,NULL),(41,5,23,34,3,10,'0','openAccess',1,'2024-12-20 05:33:26','2024-12-20 05:33:33',23,521,2,NULL),(42,6,24,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:33:54','2024-12-20 05:33:55',24,NULL,NULL,NULL),(43,6,25,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:33:55','2024-12-20 05:33:56',24,NULL,NULL,NULL),(44,6,26,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:33:56','2024-12-20 05:33:57',24,NULL,NULL,NULL),(45,6,27,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:33:57','2024-12-20 05:33:57',24,NULL,NULL,NULL),(46,6,27,45,3,19,NULL,NULL,NULL,'2024-12-20 05:34:28','2024-12-20 05:34:28',24,523,7,NULL),(47,6,26,44,3,19,NULL,NULL,NULL,'2024-12-20 05:34:28','2024-12-20 05:34:28',24,523,7,NULL),(48,6,25,43,3,19,NULL,NULL,NULL,'2024-12-20 05:34:28','2024-12-20 05:34:28',24,523,7,NULL),(49,6,24,42,3,19,NULL,NULL,NULL,'2024-12-20 05:34:28','2024-12-20 05:34:28',24,523,7,NULL),(50,7,28,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:35:05','2024-12-20 05:35:05',25,NULL,NULL,NULL),(51,7,29,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:35:06','2024-12-20 05:35:06',25,NULL,NULL,NULL),(52,7,30,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:35:07','2024-12-20 05:35:07',25,NULL,NULL,NULL),(53,7,31,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:35:08','2024-12-20 05:35:08',25,NULL,NULL,NULL),(54,7,32,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:35:09','2024-12-20 05:35:09',25,NULL,NULL,NULL),(55,7,32,54,3,4,NULL,NULL,NULL,'2024-12-20 05:35:47','2024-12-20 05:35:47',25,523,8,NULL),(56,7,31,53,3,4,NULL,NULL,NULL,'2024-12-20 05:35:47','2024-12-20 05:35:47',25,523,8,NULL),(57,7,30,52,3,4,NULL,NULL,NULL,'2024-12-20 05:35:48','2024-12-20 05:35:48',25,523,8,NULL),(58,7,29,51,3,4,NULL,NULL,NULL,'2024-12-20 05:35:48','2024-12-20 05:35:48',25,523,8,NULL),(59,7,28,50,3,4,NULL,NULL,NULL,'2024-12-20 05:35:48','2024-12-20 05:35:48',25,523,8,NULL),(60,8,33,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:36:13','2024-12-20 05:36:14',3,NULL,NULL,NULL),(61,9,34,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:36:23','2024-12-20 05:36:23',26,NULL,NULL,NULL),(62,9,35,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:36:24','2024-12-20 05:36:24',26,NULL,NULL,NULL),(63,9,36,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:36:25','2024-12-20 05:36:25',26,NULL,NULL,NULL),(64,9,37,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:36:26','2024-12-20 05:36:26',26,NULL,NULL,NULL),(65,9,38,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:36:27','2024-12-20 05:36:27',26,NULL,NULL,NULL),(66,9,38,65,3,19,NULL,NULL,NULL,'2024-12-20 05:37:05','2024-12-20 05:37:05',26,523,9,NULL),(67,9,37,64,3,19,NULL,NULL,NULL,'2024-12-20 05:37:06','2024-12-20 05:37:06',26,523,9,NULL),(68,9,36,63,3,19,NULL,NULL,NULL,'2024-12-20 05:37:06','2024-12-20 05:37:06',26,523,9,NULL),(69,9,35,62,3,19,NULL,NULL,NULL,'2024-12-20 05:37:06','2024-12-20 05:37:06',26,523,9,NULL),(70,9,34,61,3,19,NULL,NULL,NULL,'2024-12-20 05:37:06','2024-12-20 05:37:06',26,523,9,NULL),(71,10,39,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:37:18','2024-12-20 05:37:19',27,NULL,NULL,NULL),(72,10,40,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:37:19','2024-12-20 05:37:19',27,NULL,NULL,NULL),(73,10,41,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:37:20','2024-12-20 05:37:20',27,NULL,NULL,NULL),(74,10,42,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:37:21','2024-12-20 05:37:21',27,NULL,NULL,NULL),(75,10,43,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:37:22','2024-12-20 05:37:22',27,NULL,NULL,NULL),(76,10,44,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:37:23','2024-12-20 05:37:23',27,NULL,NULL,NULL),(77,10,45,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:37:24','2024-12-20 05:37:24',27,NULL,NULL,NULL),(78,10,46,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:37:25','2024-12-20 05:37:25',27,NULL,NULL,NULL),(79,10,47,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:37:26','2024-12-20 05:37:26',27,NULL,NULL,NULL),(80,11,48,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:38:29','2024-12-20 05:38:29',28,NULL,NULL,NULL),(81,11,49,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:38:30','2024-12-20 05:38:30',28,NULL,NULL,NULL),(82,11,49,81,3,19,NULL,NULL,NULL,'2024-12-20 05:38:48','2024-12-20 05:38:48',28,523,10,NULL),(83,11,48,80,3,19,NULL,NULL,NULL,'2024-12-20 05:38:49','2024-12-20 05:38:49',28,523,10,NULL),(84,12,50,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:39:48','2024-12-20 05:39:48',29,NULL,NULL,NULL),(85,12,51,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:39:49','2024-12-20 05:39:49',29,NULL,NULL,NULL),(86,12,52,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:39:50','2024-12-20 05:39:50',29,NULL,NULL,NULL),(87,12,52,86,3,19,NULL,NULL,NULL,'2024-12-20 05:40:18','2024-12-20 05:40:18',29,523,12,NULL),(88,12,51,85,3,19,NULL,NULL,NULL,'2024-12-20 05:40:18','2024-12-20 05:40:18',29,523,12,NULL),(89,12,50,84,3,19,NULL,NULL,NULL,'2024-12-20 05:40:18','2024-12-20 05:40:18',29,523,12,NULL),(90,13,53,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:40:49','2024-12-20 05:40:49',30,NULL,NULL,NULL),(91,13,54,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:40:50','2024-12-20 05:40:50',30,NULL,NULL,NULL),(92,13,55,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:40:51','2024-12-20 05:40:51',30,NULL,NULL,NULL),(93,13,55,92,3,19,NULL,NULL,NULL,'2024-12-20 05:41:17','2024-12-20 05:41:17',30,523,13,NULL),(94,13,54,91,3,19,NULL,NULL,NULL,'2024-12-20 05:41:17','2024-12-20 05:41:17',30,523,13,NULL),(95,13,53,90,3,19,NULL,NULL,NULL,'2024-12-20 05:41:17','2024-12-20 05:41:17',30,523,13,NULL),(96,14,56,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:42:23','2024-12-20 05:42:24',31,NULL,NULL,NULL),(97,14,57,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:42:24','2024-12-20 05:42:25',31,NULL,NULL,NULL),(98,14,58,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:42:25','2024-12-20 05:42:25',31,NULL,NULL,NULL),(99,14,59,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:42:26','2024-12-20 05:42:26',31,NULL,NULL,NULL),(100,14,60,NULL,13,2,NULL,NULL,NULL,'2024-12-20 05:42:27','2024-12-20 05:42:28',31,NULL,NULL,NULL),(101,14,61,NULL,9,2,NULL,NULL,NULL,'2024-12-20 05:42:28','2024-12-20 05:42:29',31,NULL,NULL,NULL),(102,14,61,101,9,19,NULL,NULL,NULL,'2024-12-20 05:43:03','2024-12-20 05:43:03',31,523,15,NULL),(103,14,60,100,13,19,NULL,NULL,NULL,'2024-12-20 05:43:04','2024-12-20 05:43:04',31,523,15,NULL),(104,14,59,99,3,19,NULL,NULL,NULL,'2024-12-20 05:43:04','2024-12-20 05:43:04',31,523,15,NULL),(105,14,58,98,3,19,NULL,NULL,NULL,'2024-12-20 05:43:04','2024-12-20 05:43:04',31,523,15,NULL),(106,14,57,97,3,19,NULL,NULL,NULL,'2024-12-20 05:43:04','2024-12-20 05:43:04',31,523,15,NULL),(107,14,56,96,3,19,NULL,NULL,NULL,'2024-12-20 05:43:04','2024-12-20 05:43:04',31,523,15,NULL),(108,14,61,101,9,10,'0','openAccess',1,'2024-12-20 05:44:00','2024-12-20 05:44:28',31,521,3,NULL),(109,14,60,100,13,10,'0','openAccess',1,'2024-12-20 05:44:00','2024-12-20 05:44:24',31,521,3,NULL),(110,14,59,99,3,10,'0','openAccess',1,'2024-12-20 05:44:00','2024-12-20 05:44:19',31,521,3,NULL),(111,14,58,98,3,10,'0','openAccess',1,'2024-12-20 05:44:00','2024-12-20 05:44:15',31,521,3,NULL),(112,14,57,97,3,10,'0','openAccess',1,'2024-12-20 05:44:00','2024-12-20 05:44:11',31,521,3,NULL),(113,14,56,96,3,10,'0','openAccess',1,'2024-12-20 05:44:00','2024-12-20 05:44:07',31,521,3,NULL),(114,15,62,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:44:39','2024-12-20 05:44:39',32,NULL,NULL,NULL),(115,15,63,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:44:40','2024-12-20 05:44:40',32,NULL,NULL,NULL),(116,15,64,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:44:41','2024-12-20 05:44:41',32,NULL,NULL,NULL),(117,15,64,116,3,4,NULL,NULL,NULL,'2024-12-20 05:45:06','2024-12-20 05:45:06',32,523,17,NULL),(118,15,63,115,3,4,NULL,NULL,NULL,'2024-12-20 05:45:06','2024-12-20 05:45:06',32,523,17,NULL),(119,15,62,114,3,4,NULL,NULL,NULL,'2024-12-20 05:45:06','2024-12-20 05:45:06',32,523,17,NULL),(120,16,65,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:45:18','2024-12-20 05:45:18',33,NULL,NULL,NULL),(121,16,66,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:45:19','2024-12-20 05:45:19',33,NULL,NULL,NULL),(122,16,67,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:45:20','2024-12-20 05:45:20',33,NULL,NULL,NULL),(123,16,68,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:45:21','2024-12-20 05:45:21',33,NULL,NULL,NULL),(124,16,69,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:45:22','2024-12-20 05:45:22',33,NULL,NULL,NULL),(125,16,69,124,3,4,NULL,NULL,NULL,'2024-12-20 05:45:58','2024-12-20 05:45:58',33,523,18,NULL),(126,16,68,123,3,4,NULL,NULL,NULL,'2024-12-20 05:45:59','2024-12-20 05:45:59',33,523,18,NULL),(127,16,67,122,3,4,NULL,NULL,NULL,'2024-12-20 05:45:59','2024-12-20 05:45:59',33,523,18,NULL),(128,16,66,121,3,4,NULL,NULL,NULL,'2024-12-20 05:45:59','2024-12-20 05:45:59',33,523,18,NULL),(129,16,65,120,3,4,NULL,NULL,NULL,'2024-12-20 05:45:59','2024-12-20 05:45:59',33,523,18,NULL),(130,17,70,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:46:30','2024-12-20 05:46:31',34,NULL,NULL,NULL),(131,17,71,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:46:31','2024-12-20 05:46:31',34,NULL,NULL,NULL),(132,17,72,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:46:32','2024-12-20 05:46:32',34,NULL,NULL,NULL),(133,17,73,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:46:33','2024-12-20 05:46:33',34,NULL,NULL,NULL),(134,17,74,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:46:34','2024-12-20 05:46:34',34,NULL,NULL,NULL),(135,17,75,NULL,3,2,NULL,NULL,NULL,'2024-12-20 05:46:35','2024-12-20 05:46:35',34,NULL,NULL,NULL),(136,17,75,135,3,19,NULL,NULL,NULL,'2024-12-20 05:47:24','2024-12-20 05:47:24',34,523,19,NULL),(137,17,74,134,3,19,NULL,NULL,NULL,'2024-12-20 05:47:24','2024-12-20 05:47:24',34,523,19,NULL),(138,17,73,133,3,19,NULL,NULL,NULL,'2024-12-20 05:47:24','2024-12-20 05:47:24',34,523,19,NULL),(139,17,72,132,3,19,NULL,NULL,NULL,'2024-12-20 05:47:24','2024-12-20 05:47:24',34,523,19,NULL),(140,17,71,131,3,19,NULL,NULL,NULL,'2024-12-20 05:47:24','2024-12-20 05:47:24',34,523,19,NULL),(141,17,70,130,3,19,NULL,NULL,NULL,'2024-12-20 05:47:24','2024-12-20 05:47:24',34,523,19,NULL);
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_keyword_list`
--

DROP TABLE IF EXISTS `submission_search_keyword_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3 COMMENT='A list of all keywords used in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (83,'acting'),(108,'affect'),(102,'agent'),(104,'agents'),(55,'alberta'),(2,'allan'),(10,'american'),(20,'americans'),(17,'anti'),(58,'athabasca'),(96,'behaviour'),(32,'bilateral'),(6,'bomb'),(42,'book'),(15,'border'),(62,'brains'),(56,'brian'),(61,'bricks'),(60,'calgary'),(5,'california'),(7,'canada'),(47,'canadian'),(36,'canadianism'),(105,'capable'),(1,'chantal'),(76,'characteristics'),(78,'classical'),(64,'cognitive'),(49,'communication'),(45,'complex'),(25,'confederation'),(72,'construction'),(16,'continent'),(89,'control'),(50,'cultural'),(54,'dawson'),(90,'development'),(75,'discussing'),(77,'distinguish'),(87,'distributed'),(19,'documented'),(57,'dupuis'),(27,'election'),(63,'embodied'),(85,'embodiment'),(81,'emphasis'),(103,'environment'),(30,'events'),(23,'examines'),(28,'examining'),(98,'examples'),(106,'exhibiting'),(86,'exploration'),(95,'exploring'),(70,'foundational'),(41,'hilarious'),(35,'history'),(71,'ideas'),(99,'illustrate'),(69,'illustrates'),(84,'importance'),(37,'informative'),(52,'international'),(68,'introduces'),(100,'key'),(44,'layer'),(66,'lego'),(29,'major'),(11,'media'),(53,'michael'),(74,'mindstorms'),(14,'nations'),(22,'neighbour'),(21,'northern'),(88,'notions'),(97,'numerous'),(26,'obama'),(73,'observation'),(79,'places'),(51,'political'),(24,'portrayed'),(39,'provoking'),(110,'psychology'),(33,'relations'),(46,'relationship'),(9,'remarks'),(80,'renewed'),(43,'reveals'),(67,'robots'),(65,'science'),(107,'sense'),(82,'sensing'),(18,'sentiment'),(93,'simple'),(4,'southern'),(13,'states'),(48,'studies'),(92,'synthesizing'),(94,'systems'),(31,'tested'),(101,'theme'),(91,'theories'),(38,'thought'),(40,'times'),(34,'tracks'),(12,'united'),(3,'university'),(8,'unkind'),(59,'wilson'),(109,'world');
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_object_keywords` (
  `submission_search_object_keyword_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `object_id` bigint NOT NULL,
  `keyword_id` bigint NOT NULL,
  `pos` int NOT NULL COMMENT 'Word position of the keyword in the object.',
  PRIMARY KEY (`submission_search_object_keyword_id`),
  UNIQUE KEY `submission_search_object_keywords_unique` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_object_id` (`object_id`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`),
  CONSTRAINT `submission_search_object_keywords_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `submission_search_keyword_list` (`keyword_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_search_object_keywords_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `submission_search_objects` (`object_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb3 COMMENT='Relationships between search objects and keywords in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (68,9,1,0),(69,9,2,1),(70,9,3,2),(71,9,4,3),(72,9,5,4),(73,10,6,0),(74,10,7,1),(75,10,8,2),(76,10,9,3),(77,10,10,4),(78,10,11,5),(79,11,7,0),(80,11,12,1),(81,11,13,2),(82,11,14,3),(83,11,15,4),(84,11,16,5),(85,11,17,6),(86,11,10,7),(87,11,18,8),(88,11,7,9),(89,11,19,10),(90,11,20,11),(91,11,21,12),(92,11,22,13),(93,11,2,14),(94,11,23,15),(95,11,10,16),(96,11,11,17),(97,11,24,18),(98,11,7,19),(99,11,25,20),(100,11,26,21),(101,11,27,22),(102,11,28,23),(103,11,29,24),(104,11,30,25),(105,11,31,26),(106,11,32,27),(107,11,33,28),(108,11,6,29),(109,11,7,30),(110,11,34,31),(111,11,35,32),(112,11,17,33),(113,11,36,34),(114,11,37,35),(115,11,38,36),(116,11,39,37),(117,11,40,38),(118,11,41,39),(119,11,42,40),(120,11,43,41),(121,11,44,42),(122,11,45,43),(123,11,46,44),(124,11,7,45),(125,11,12,46),(126,11,13,47),(127,13,47,0),(128,13,48,1),(129,13,49,2),(130,13,50,3),(131,13,48,4),(132,13,51,5),(133,13,52,6),(134,13,48,7),(135,17,53,0),(136,17,54,1),(137,17,3,2),(138,17,55,3),(139,17,56,4),(140,17,57,5),(141,17,58,6),(142,17,3,7),(143,17,53,8),(144,17,59,9),(145,17,3,10),(146,17,60,11),(147,18,61,0),(148,18,62,1),(149,18,63,2),(150,18,64,3),(151,18,65,4),(152,18,66,5),(153,18,67,6),(154,19,61,0),(155,19,62,1),(156,19,68,2),(157,19,63,3),(158,19,64,4),(159,19,65,5),(160,19,69,6),(161,19,70,7),(162,19,71,8),(163,19,72,9),(164,19,73,10),(165,19,66,11),(166,19,74,12),(167,19,67,13),(168,19,75,14),(169,19,76,15),(170,19,77,16),(171,19,63,17),(172,19,64,18),(173,19,65,19),(174,19,78,20),(175,19,64,21),(176,19,65,22),(177,19,61,23),(178,19,62,24),(179,19,79,25),(180,19,80,26),(181,19,81,27),(182,19,82,28),(183,19,83,29),(184,19,84,30),(185,19,85,31),(186,19,86,32),(187,19,87,33),(188,19,88,34),(189,19,89,35),(190,19,90,36),(191,19,91,37),(192,19,92,38),(193,19,93,39),(194,19,94,40),(195,19,95,41),(196,19,96,42),(197,19,97,43),(198,19,98,44),(199,19,99,45),(200,19,100,46),(201,19,101,47),(202,19,84,48),(203,19,102,49),(204,19,103,50),(205,19,93,51),(206,19,104,52),(207,19,66,53),(208,19,67,54),(209,19,105,55),(210,19,106,56),(211,19,45,57),(212,19,96,58),(213,19,107,59),(214,19,108,60),(215,19,109,61),(216,21,110,0);
/*!40000 ALTER TABLE `submission_search_object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_objects`
--

DROP TABLE IF EXISTS `submission_search_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_objects` (
  `object_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `type` int NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)',
  PRIMARY KEY (`object_id`),
  KEY `submission_search_objects_submission_id` (`submission_id`),
  CONSTRAINT `submission_search_object_submission` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COMMENT='A list of all search objects indexed in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (9,5,1,NULL),(10,5,2,NULL),(11,5,4,NULL),(12,5,16,NULL),(13,5,17,NULL),(14,5,8,NULL),(15,5,32,NULL),(16,5,64,NULL),(17,14,1,NULL),(18,14,2,NULL),(19,14,4,NULL),(20,14,16,NULL),(21,14,17,NULL),(22,14,8,NULL),(23,14,32,NULL),(24,14,64,NULL);
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_settings` (
  `submission_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`submission_setting_id`),
  UNIQUE KEY `submission_settings_unique` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  CONSTRAINT `submission_settings_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Localized data about submissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_settings`
--

LOCK TABLES `submission_settings` WRITE;
/*!40000 ALTER TABLE `submission_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `submission_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `current_publication_id` bigint DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint NOT NULL DEFAULT '1',
  `locale` varchar(28) DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  `submission_progress` varchar(50) NOT NULL DEFAULT 'start',
  `work_type` smallint DEFAULT '0',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`),
  CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COMMENT='All submissions submitted to the context, including incomplete, declined and unpublished submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2024-12-20 05:27:26','2024-12-20 05:27:04','2024-12-20 05:27:04',4,'en',1,'',0),(2,1,2,'2024-12-20 05:29:35','2024-12-20 05:29:07','2024-12-20 05:29:07',3,'en',1,'',1),(3,1,3,'2024-12-20 05:30:16','2024-12-20 05:30:15','2024-12-20 05:30:15',1,'en',1,'',0),(4,1,4,'2024-12-20 05:31:41','2024-12-20 05:30:49','2024-12-20 05:30:49',5,'en',1,'',0),(5,1,5,'2024-12-20 05:33:46','2024-12-20 05:32:27','2024-12-20 05:32:27',5,'en',3,'',0),(6,1,6,'2024-12-20 05:34:48','2024-12-20 05:34:19','2024-12-20 05:34:19',2,'en',1,'',0),(7,1,7,'2024-12-20 05:36:04','2024-12-20 05:35:37','2024-12-20 05:35:37',4,'en',1,'',0),(8,1,8,'2024-12-20 05:36:15','2024-12-20 05:36:14','2024-12-20 05:36:14',1,'en',1,'',0),(9,1,9,'2024-12-20 05:37:06','2024-12-20 05:36:55','2024-12-20 05:36:55',2,'en',1,'',0),(10,1,10,'2024-12-20 05:38:19','2024-12-20 05:38:19','2024-12-20 05:38:19',1,'en',1,'',0),(11,1,11,'2024-12-20 05:39:36','2024-12-20 05:38:39','2024-12-20 05:38:39',4,'en',1,'',0),(12,1,12,'2024-12-20 05:40:40','2024-12-20 05:40:08','2024-12-20 05:40:08',2,'en',1,'',0),(13,1,13,'2024-12-20 05:42:11','2024-12-20 05:41:07','2024-12-20 05:41:07',4,'en',1,'',0),(14,1,14,'2024-12-20 05:44:30','2024-12-20 05:42:52','2024-12-20 05:42:52',5,'en',3,'',0),(15,1,15,'2024-12-20 05:45:06','2024-12-20 05:44:56','2024-12-20 05:44:56',3,'en',1,'',0),(16,1,16,'2024-12-20 05:46:21','2024-12-20 05:45:48','2024-12-20 05:45:48',3,'en',1,'',0),(17,1,17,'2024-12-20 05:47:34','2024-12-20 05:47:11','2024-12-20 05:47:11',2,'en',1,'',0);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_files`
--

DROP TABLE IF EXISTS `temporary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporary_files` (
  `file_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`),
  CONSTRAINT `temporary_files_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary files, e.g. where files are kept during an upload process before they are moved somewhere more appropriate.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_files`
--

LOCK TABLES `temporary_files` WRITE;
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_institution_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_institution_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_institution_temporary_records` (
  `usage_stats_temp_institution_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `line_number` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  PRIMARY KEY (`usage_stats_temp_institution_id`),
  UNIQUE KEY `usi_load_id_line_number_institution_id` (`load_id`,`line_number`,`institution_id`),
  KEY `usi_institution_id` (`institution_id`),
  CONSTRAINT `usi_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats by institution. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_institution_temporary_records`
--

LOCK TABLES `usage_stats_institution_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_institution_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_institution_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_total_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_total_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_total_temporary_records` (
  `usage_stats_temp_total_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `canonical_url` varchar(255) NOT NULL,
  `series_id` bigint DEFAULT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint DEFAULT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_total_id`),
  KEY `ust_series_id` (`series_id`),
  KEY `ust_context_id` (`context_id`),
  KEY `ust_submission_id` (`submission_id`),
  KEY `ust_chapter_id` (`chapter_id`),
  KEY `ust_representation_id` (`representation_id`),
  KEY `ust_submission_file_id` (`submission_file_id`),
  KEY `ust_load_id_context_id_ip` (`load_id`,`context_id`,`ip`),
  CONSTRAINT `ust_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats totals based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_total_temporary_records`
--

LOCK TABLES `usage_stats_total_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_total_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_total_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_item_investigations_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_item_investigations_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_item_investigations_temporary_records` (
  `usage_stats_temp_unique_item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_item_id`),
  KEY `usii_context_id` (`context_id`),
  KEY `usii_submission_id` (`submission_id`),
  KEY `usii_chapter_id` (`chapter_id`),
  KEY `usii_representation_id` (`representation_id`),
  KEY `usii_submission_file_id` (`submission_file_id`),
  KEY `usii_load_id_context_id_ip` (`load_id`,`context_id`,`ip`),
  CONSTRAINT `usii_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats on unique downloads based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_item_investigations_temporary_records`
--

LOCK TABLES `usage_stats_unique_item_investigations_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_item_investigations_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_item_investigations_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_item_requests_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_item_requests_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_item_requests_temporary_records` (
  `usage_stats_temp_item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_item_id`),
  KEY `usir_context_id` (`context_id`),
  KEY `usir_submission_id` (`submission_id`),
  KEY `usir_chapter_id` (`chapter_id`),
  KEY `usir_representation_id` (`representation_id`),
  KEY `usir_submission_file_id` (`submission_file_id`),
  KEY `usir_load_id_context_id_ip` (`load_id`,`context_id`,`ip`),
  CONSTRAINT `usir_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats on unique views based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_item_requests_temporary_records`
--

LOCK TABLES `usage_stats_unique_item_requests_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_item_requests_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_item_requests_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_title_investigations_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_title_investigations_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_title_investigations_temporary_records` (
  `usage_stats_temp_unique_investigations_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_investigations_id`),
  KEY `usti_context_id` (`context_id`),
  KEY `usti_submission_id` (`submission_id`),
  KEY `usti_chapter_id` (`chapter_id`),
  KEY `usti_representation_id` (`representation_id`),
  KEY `usti_submission_file_id` (`submission_file_id`),
  KEY `usti_load_id_context_id_ip` (`load_id`,`context_id`,`ip`),
  CONSTRAINT `usti_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats for views and downloads from institutions based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_title_investigations_temporary_records`
--

LOCK TABLES `usage_stats_unique_title_investigations_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_title_investigations_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_title_investigations_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_title_requests_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_title_requests_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_title_requests_temporary_records` (
  `usage_stats_temp_unique_requests_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_requests_id`),
  KEY `ustr_context_id` (`context_id`),
  KEY `ustr_submission_id` (`submission_id`),
  KEY `ustr_chapter_id` (`chapter_id`),
  KEY `ustr_representation_id` (`representation_id`),
  KEY `ustr_submission_file_id` (`submission_file_id`),
  KEY `ustr_load_id_context_id_ip` (`load_id`,`context_id`,`ip`),
  CONSTRAINT `ustr_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats for unique title requests. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_title_requests_temporary_records`
--

LOCK TABLES `usage_stats_unique_title_requests_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_title_requests_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_title_requests_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_settings`
--

DROP TABLE IF EXISTS `user_group_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_settings` (
  `user_group_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`user_group_setting_id`),
  UNIQUE KEY `user_group_settings_unique` (`user_group_id`,`locale`,`setting_name`),
  KEY `user_group_settings_user_group_id` (`user_group_id`),
  CONSTRAINT `user_group_settings_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3 COMMENT='More data about user groups, including localized properties such as the name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,2,'','nameLocaleKey','default.groups.name.manager'),(2,2,'','abbrevLocaleKey','default.groups.abbrev.manager'),(3,2,'en','name','Press manager'),(4,2,'en','abbrev','PM'),(5,2,'fr_CA','name','Gestionnaire de la presse'),(6,2,'fr_CA','abbrev','MP'),(7,3,'','nameLocaleKey','default.groups.name.editor'),(8,3,'','abbrevLocaleKey','default.groups.abbrev.editor'),(9,3,'en','name','Press editor'),(10,3,'en','abbrev','PE'),(11,3,'fr_CA','name','Rédacteur/Rédactrice en chef de la presse'),(12,3,'fr_CA','abbrev','RP'),(13,4,'','nameLocaleKey','default.groups.name.productionEditor'),(14,4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor'),(15,4,'en','name','Production editor'),(16,4,'en','abbrev','ProdE'),(17,4,'fr_CA','name','Directeur-trice de production'),(18,4,'fr_CA','abbrev','DirProd'),(19,5,'','nameLocaleKey','default.groups.name.sectionEditor'),(20,5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor'),(21,5,'en','name','Series editor'),(22,5,'en','abbrev','AcqE'),(23,5,'fr_CA','name','Rédacteur/Rédactrice en chef de la série'),(24,5,'fr_CA','abbrev','RS'),(25,6,'','nameLocaleKey','default.groups.name.copyeditor'),(26,6,'','abbrevLocaleKey','default.groups.abbrev.copyeditor'),(27,6,'en','name','Copyeditor'),(28,6,'en','abbrev','CE'),(29,6,'fr_CA','name','Réviseur-e'),(30,6,'fr_CA','abbrev','RÉV'),(31,7,'','nameLocaleKey','default.groups.name.designer'),(32,7,'','abbrevLocaleKey','default.groups.abbrev.designer'),(33,7,'en','name','Designer'),(34,7,'en','abbrev','Design'),(35,7,'fr_CA','name','Designer'),(36,7,'fr_CA','abbrev','Design'),(37,8,'','nameLocaleKey','default.groups.name.funding'),(38,8,'','abbrevLocaleKey','default.groups.abbrev.funding'),(39,8,'en','name','Funding coordinator'),(40,8,'en','abbrev','FC'),(41,8,'fr_CA','name','Coordonnateur-trice du financement'),(42,8,'fr_CA','abbrev','CF'),(43,9,'','nameLocaleKey','default.groups.name.indexer'),(44,9,'','abbrevLocaleKey','default.groups.abbrev.indexer'),(45,9,'en','name','Indexer'),(46,9,'en','abbrev','IND'),(47,9,'fr_CA','name','Indexeur-e'),(48,9,'fr_CA','abbrev','Indx'),(49,10,'','nameLocaleKey','default.groups.name.layoutEditor'),(50,10,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor'),(51,10,'en','name','Layout Editor'),(52,10,'en','abbrev','LE'),(53,10,'fr_CA','name','Responsable de la mise en page'),(54,10,'fr_CA','abbrev','RespMP'),(55,11,'','nameLocaleKey','default.groups.name.marketing'),(56,11,'','abbrevLocaleKey','default.groups.abbrev.marketing'),(57,11,'en','name','Marketing and sales coordinator'),(58,11,'en','abbrev','MS'),(59,11,'fr_CA','name','Coordonnateur-trice des ventes et du marketing'),(60,11,'fr_CA','abbrev','CVM'),(61,12,'','nameLocaleKey','default.groups.name.proofreader'),(62,12,'','abbrevLocaleKey','default.groups.abbrev.proofreader'),(63,12,'en','name','Proofreader'),(64,12,'en','abbrev','PR'),(65,12,'fr_CA','name','Correcteur-trice d\'épreuves'),(66,12,'fr_CA','abbrev','CorEp'),(67,13,'','nameLocaleKey','default.groups.name.author'),(68,13,'','abbrevLocaleKey','default.groups.abbrev.author'),(69,13,'en','name','Author'),(70,13,'en','abbrev','AU'),(71,13,'fr_CA','name','Auteur-e'),(72,13,'fr_CA','abbrev','AU'),(73,14,'','nameLocaleKey','default.groups.name.volumeEditor'),(74,14,'','abbrevLocaleKey','default.groups.abbrev.volumeEditor'),(75,14,'en','name','Volume editor'),(76,14,'en','abbrev','VE'),(77,14,'fr_CA','name','Rédacteur/Rédactrice en chef du volume'),(78,14,'fr_CA','abbrev','RV'),(79,15,'','nameLocaleKey','default.groups.name.chapterAuthor'),(80,15,'','abbrevLocaleKey','default.groups.abbrev.chapterAuthor'),(81,15,'en','name','Chapter Author'),(82,15,'en','abbrev','CA'),(83,15,'fr_CA','name','Auteur du chapitre'),(84,15,'fr_CA','abbrev','AC'),(85,16,'','nameLocaleKey','default.groups.name.translator'),(86,16,'','abbrevLocaleKey','default.groups.abbrev.translator'),(87,16,'en','name','Translator'),(88,16,'en','abbrev','Trans'),(89,16,'fr_CA','name','Traducteur-trice'),(90,16,'fr_CA','abbrev','Trad'),(91,17,'','nameLocaleKey','default.groups.name.internalReviewer'),(92,17,'','abbrevLocaleKey','default.groups.abbrev.internalReviewer'),(93,17,'en','name','Internal Reviewer'),(94,17,'en','abbrev','IR'),(95,17,'fr_CA','name','Évaluateur-trice interne'),(96,17,'fr_CA','abbrev','EvalInt'),(97,18,'','nameLocaleKey','default.groups.name.externalReviewer'),(98,18,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer'),(99,18,'en','name','External Reviewer'),(100,18,'en','abbrev','ER'),(101,18,'fr_CA','name','Évaluateur-trice externe'),(102,18,'fr_CA','abbrev','EvEx'),(103,19,'','nameLocaleKey','default.groups.name.reader'),(104,19,'','abbrevLocaleKey','default.groups.abbrev.reader'),(105,19,'en','name','Reader'),(106,19,'en','abbrev','Read'),(107,19,'fr_CA','name','Lecteur-trice'),(108,19,'fr_CA','abbrev','Lect'),(109,14,'','recommendOnly','0');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_stage` (
  `user_group_stage_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  `stage_id` bigint NOT NULL,
  PRIMARY KEY (`user_group_stage_id`),
  UNIQUE KEY `user_group_stage_unique` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`),
  CONSTRAINT `user_group_stage_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_stage_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COMMENT='Which stages of the editorial workflow the user_groups can access.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
INSERT INTO `user_group_stage` VALUES (1,1,3,1),(2,1,3,2),(3,1,3,3),(4,1,3,4),(5,1,3,5),(6,1,4,4),(7,1,4,5),(8,1,5,1),(9,1,5,2),(10,1,5,3),(11,1,5,4),(12,1,5,5),(13,1,6,4),(14,1,7,5),(15,1,8,1),(16,1,8,2),(17,1,8,3),(18,1,9,5),(19,1,10,5),(20,1,11,4),(21,1,12,5),(22,1,13,1),(23,1,13,2),(24,1,13,3),(25,1,13,4),(26,1,13,5),(41,1,14,1),(42,1,14,2),(43,1,14,3),(44,1,14,4),(45,1,14,5),(32,1,15,4),(33,1,15,5),(34,1,16,1),(35,1,16,2),(36,1,16,3),(37,1,16,4),(38,1,16,5),(39,1,17,2),(40,1,18,3);
/*!40000 ALTER TABLE `user_group_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `user_group_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `role_id` bigint NOT NULL,
  `is_default` smallint NOT NULL DEFAULT '0',
  `show_title` smallint NOT NULL DEFAULT '1',
  `permit_self_registration` smallint NOT NULL DEFAULT '0',
  `permit_metadata_edit` smallint NOT NULL DEFAULT '0',
  `permit_settings` smallint NOT NULL DEFAULT '0',
  `masthead` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_role_id` (`role_id`),
  CONSTRAINT `user_groups_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='All defined user roles in a context, such as Author, Reviewer, Section Editor and Journal Manager.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,NULL,1,1,1,0,0,1,0),(2,1,16,1,1,0,1,1,0),(3,1,16,1,1,0,1,1,1),(4,1,16,1,1,0,1,1,0),(5,1,17,1,1,0,1,0,1),(6,1,4097,1,1,0,0,0,0),(7,1,4097,1,1,0,0,0,0),(8,1,4097,1,1,0,0,0,0),(9,1,4097,1,1,0,0,0,0),(10,1,4097,1,1,0,0,0,0),(11,1,4097,1,1,0,0,0,0),(12,1,4097,1,1,0,0,0,0),(13,1,65536,1,1,1,0,0,0),(14,1,65536,1,1,1,0,0,0),(15,1,65536,1,1,1,0,0,0),(16,1,65536,1,1,0,0,0,0),(17,1,4096,1,1,0,0,0,0),(18,1,4096,1,1,1,0,0,1),(19,1,1048576,1,1,1,0,0,0);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interests` (
  `user_interest_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `controlled_vocab_entry_id` bigint NOT NULL,
  PRIMARY KEY (`user_interest_id`),
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`),
  KEY `user_interests_user_id` (`user_id`),
  KEY `user_interests_controlled_vocab_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `user_interests_controlled_vocab_entry_id_foreign` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE,
  CONSTRAINT `user_interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Associates users with user interests (which are stored in the controlled vocabulary tables).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interests`
--

LOCK TABLES `user_interests` WRITE;
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `user_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`user_setting_id`),
  UNIQUE KEY `user_settings_unique` (`user_id`,`locale`,`setting_name`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb3 COMMENT='More data about users, including localized properties like their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,1,'en','familyName','admin'),(2,1,'en','givenName','admin'),(3,2,'en','affiliation','Universidad Nacional Autónoma de México'),(4,2,'fr_CA','affiliation','Mexico'),(5,2,'en','familyName','Vaca'),(6,2,'fr_CA','familyName','Vaca'),(7,2,'en','givenName','Ramiro'),(8,2,'fr_CA','givenName','Ramiro'),(9,3,'en','affiliation','University of Melbourne'),(10,3,'fr_CA','affiliation','Australia'),(11,3,'en','familyName','Barnes'),(12,3,'fr_CA','familyName','Barnes'),(13,3,'en','givenName','Daniel'),(14,3,'fr_CA','givenName','Daniel'),(15,4,'en','affiliation','University of Chicago'),(16,4,'fr_CA','affiliation','United States'),(17,4,'en','familyName','Buskins'),(18,4,'fr_CA','familyName','Buskins'),(19,4,'en','givenName','David'),(20,4,'fr_CA','givenName','David'),(21,5,'en','affiliation','University of Toronto'),(22,5,'fr_CA','affiliation','Canada'),(23,5,'en','familyName','Berardo'),(24,5,'fr_CA','familyName','Berardo'),(25,5,'en','givenName','Stephanie'),(26,5,'fr_CA','givenName','Stephanie'),(27,6,'en','affiliation','Kyoto University'),(28,6,'fr_CA','affiliation','Japan'),(29,6,'en','familyName','Inoue'),(30,6,'fr_CA','familyName','Inoue'),(31,6,'en','givenName','Minoti'),(32,6,'fr_CA','givenName','Minoti'),(33,7,'en','affiliation','Utrecht University'),(34,7,'fr_CA','affiliation','Netherlands'),(35,7,'en','familyName','Janssen'),(36,7,'fr_CA','familyName','Janssen'),(37,7,'en','givenName','Julie'),(38,7,'fr_CA','givenName','Julie'),(39,8,'en','affiliation','McGill University'),(40,8,'fr_CA','affiliation','Canada'),(41,8,'en','familyName','Hudson'),(42,8,'fr_CA','familyName','Hudson'),(43,8,'en','givenName','Paul'),(44,8,'fr_CA','givenName','Paul'),(45,9,'en','affiliation','University of Manitoba'),(46,9,'fr_CA','affiliation','Canada'),(47,9,'en','familyName','McCrae'),(48,9,'fr_CA','familyName','McCrae'),(49,9,'en','givenName','Aisla'),(50,9,'fr_CA','givenName','Aisla'),(51,10,'en','affiliation','State University of New York'),(52,10,'fr_CA','affiliation','United States'),(53,10,'en','familyName','Gallego'),(54,10,'fr_CA','familyName','Gallego'),(55,10,'en','givenName','Adela'),(56,10,'fr_CA','givenName','Adela'),(57,11,'en','affiliation','KNUST'),(58,11,'fr_CA','affiliation','Ghana'),(59,11,'en','familyName','Zacharia'),(60,11,'fr_CA','familyName','Zacharia'),(61,11,'en','givenName','Al'),(62,11,'fr_CA','givenName','Al'),(63,12,'en','affiliation','Madrid'),(64,12,'fr_CA','affiliation','Spain'),(65,12,'en','familyName','Favio'),(66,12,'fr_CA','familyName','Favio'),(67,12,'en','givenName','Gonzalo'),(68,12,'fr_CA','givenName','Gonzalo'),(69,13,'en','affiliation','Ghent University'),(70,13,'fr_CA','affiliation','Belgium'),(71,13,'en','familyName','Fritz'),(72,13,'fr_CA','familyName','Fritz'),(73,13,'en','givenName','Maria'),(74,13,'fr_CA','givenName','Maria'),(75,14,'en','affiliation','Universidad de Chile'),(76,14,'fr_CA','affiliation','Chile'),(77,14,'en','familyName','Vogt'),(78,14,'fr_CA','familyName','Vogt'),(79,14,'en','givenName','Sarah'),(80,14,'fr_CA','givenName','Sarah'),(81,15,'en','affiliation','Duke University'),(82,15,'fr_CA','affiliation','United States'),(83,15,'en','familyName','Cox'),(84,15,'fr_CA','familyName','Cox'),(85,15,'en','givenName','Graham'),(86,15,'fr_CA','givenName','Graham'),(87,16,'en','affiliation','University of Cape Town'),(88,16,'fr_CA','affiliation','South Africa'),(89,16,'en','familyName','Hellier'),(90,16,'fr_CA','familyName','Hellier'),(91,16,'en','givenName','Stephen'),(92,16,'fr_CA','givenName','Stephen'),(93,17,'en','affiliation','Imperial College London'),(94,17,'fr_CA','affiliation','United Kingdom'),(95,17,'en','familyName','Turner'),(96,17,'fr_CA','familyName','Turner'),(97,17,'en','givenName','Catherine'),(98,17,'fr_CA','givenName','Catherine'),(99,18,'en','affiliation','National University of Singapore'),(100,18,'fr_CA','affiliation','Singapore'),(101,18,'en','familyName','Kumar'),(102,18,'fr_CA','familyName','Kumar'),(103,18,'en','givenName','Sabine'),(104,18,'fr_CA','givenName','Sabine'),(105,19,'en','affiliation','University of Calgary'),(106,19,'en','familyName','Clark'),(107,19,'en','givenName','Arthur'),(108,20,'en','affiliation','Athabasca University'),(109,20,'en','familyName','Finkel'),(110,20,'en','givenName','Alvin'),(111,21,'en','affiliation','Athabasca University'),(112,21,'en','familyName','Barnetson'),(113,21,'en','givenName','Bob'),(114,22,'en','affiliation','University of British Columbia'),(115,22,'en','familyName','Beaty'),(116,22,'en','givenName','Bart'),(117,23,'en','affiliation','University of Southern California'),(118,23,'en','familyName','Allan'),(119,23,'en','givenName','Chantal'),(120,24,'en','affiliation','SUNY'),(121,24,'en','familyName','Bernnard'),(122,24,'en','givenName','Deborah'),(123,25,'en','affiliation','Athabasca University'),(124,25,'en','familyName','Kennepohl'),(125,25,'en','givenName','Dietmar'),(126,26,'en','affiliation','University of Sussex'),(127,26,'en','familyName','Perini'),(128,26,'en','givenName','Fernando'),(129,27,'en','affiliation','Buffalo National Park Foundation'),(130,27,'en','familyName','Brower'),(131,27,'en','givenName','Jennifer'),(132,28,'en','affiliation','University of Alberta'),(133,28,'en','familyName','Locke Hart'),(134,28,'en','givenName','Jonathan'),(135,29,'en','affiliation','International Development Research Centre'),(136,29,'en','familyName','Elder'),(137,29,'en','givenName','Laurent'),(138,30,'en','affiliation','Athabasca University'),(139,30,'en','familyName','Ally'),(140,30,'en','givenName','Mohamed'),(141,31,'en','affiliation','University of Alberta'),(142,31,'en','familyName','Dawson'),(143,31,'en','givenName','Michael'),(144,32,'en','affiliation','University of Calgary'),(145,32,'en','familyName','Foran'),(146,32,'en','givenName','Max'),(147,33,'en','affiliation','London School of Economics'),(148,33,'en','familyName','Power'),(149,33,'en','givenName','Michael'),(150,34,'en','affiliation','International Development Research Centre'),(151,34,'en','familyName','Smith'),(152,34,'en','givenName','Matthew');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_groups` (
  `user_user_group_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `masthead` smallint DEFAULT NULL,
  PRIMARY KEY (`user_user_group_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`),
  CONSTRAINT `user_user_groups_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `user_user_groups_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 COMMENT='Maps users to their assigned user_groups.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES (1,1,1,'2024-12-20 05:15:43',NULL,NULL),(2,2,1,NULL,NULL,NULL),(3,2,2,'2024-12-20 00:00:00',NULL,1),(4,3,3,'2024-12-20 00:00:00',NULL,1),(5,5,4,'2024-12-20 00:00:00',NULL,1),(6,5,5,'2024-12-20 00:00:00',NULL,1),(7,5,6,'2024-12-20 00:00:00',NULL,1),(8,17,7,'2024-12-20 00:00:00',NULL,1),(9,17,8,'2024-12-20 00:00:00',NULL,1),(10,17,9,'2024-12-20 00:00:00',NULL,1),(11,18,10,'2024-12-20 00:00:00',NULL,1),(12,18,11,'2024-12-20 00:00:00',NULL,1),(13,18,12,'2024-12-20 00:00:00',NULL,1),(14,6,13,'2024-12-20 00:00:00',NULL,1),(15,6,14,'2024-12-20 00:00:00',NULL,1),(16,10,15,'2024-12-20 00:00:00',NULL,1),(17,10,16,'2024-12-20 00:00:00',NULL,1),(18,12,17,'2024-12-20 00:00:00',NULL,1),(19,12,18,'2024-12-20 00:00:00',NULL,1),(20,19,19,'2024-12-20 05:26:43',NULL,NULL),(21,13,19,'2024-12-20 05:26:45',NULL,NULL),(22,19,20,'2024-12-20 05:27:30',NULL,NULL),(23,13,20,'2024-12-20 05:27:34',NULL,NULL),(24,19,21,'2024-12-20 05:29:40',NULL,NULL),(25,13,21,'2024-12-20 05:29:42',NULL,NULL),(26,19,22,'2024-12-20 05:30:20',NULL,NULL),(27,13,22,'2024-12-20 05:30:22',NULL,NULL),(28,19,23,'2024-12-20 05:31:45',NULL,NULL),(29,13,23,'2024-12-20 05:31:47',NULL,NULL),(30,19,24,'2024-12-20 05:33:50',NULL,NULL),(31,13,24,'2024-12-20 05:33:52',NULL,NULL),(32,19,25,'2024-12-20 05:35:00',NULL,NULL),(33,13,25,'2024-12-20 05:35:02',NULL,NULL),(34,19,26,'2024-12-20 05:36:19',NULL,NULL),(35,13,26,'2024-12-20 05:36:21',NULL,NULL),(36,19,27,'2024-12-20 05:37:14',NULL,NULL),(37,13,27,'2024-12-20 05:37:16',NULL,NULL),(38,19,28,'2024-12-20 05:38:24',NULL,NULL),(39,13,28,'2024-12-20 05:38:26',NULL,NULL),(40,19,29,'2024-12-20 05:39:44',NULL,NULL),(41,13,29,'2024-12-20 05:39:46',NULL,NULL),(42,19,30,'2024-12-20 05:40:44',NULL,NULL),(43,13,30,'2024-12-20 05:40:46',NULL,NULL),(44,19,31,'2024-12-20 05:42:19',NULL,NULL),(45,13,31,'2024-12-20 05:42:21',NULL,NULL),(46,19,32,'2024-12-20 05:44:35',NULL,NULL),(47,13,32,'2024-12-20 05:44:37',NULL,NULL),(48,19,33,'2024-12-20 05:45:14',NULL,NULL),(49,13,33,'2024-12-20 05:45:16',NULL,NULL),(50,19,34,'2024-12-20 05:46:26',NULL,NULL),(51,13,34,'2024-12-20 05:46:28',NULL,NULL);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) NOT NULL DEFAULT '[]',
  `gossip` text,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `must_change_password` smallint DEFAULT NULL,
  `auth_id` bigint DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` smallint DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COMMENT='All registered users, including authentication data and profile data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$8IWt1wJuHTd3RXzAQ5bks.l1FVbG7jxKCCtEBxCIJWPg0GJSjBCr.','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2024-12-20 05:15:43',NULL,'2024-12-20 05:26:23',NULL,NULL,NULL,0,NULL,1,NULL),(2,'rvaca','$2y$10$esyAr4KSB2ymRYGb63FMwOaCGURS8T6rOjIb4egxmytHwfor4H0be','rvaca@mailinator.com',NULL,NULL,NULL,NULL,'MX','[]',NULL,NULL,'2024-12-20 05:17:08',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(3,'dbarnes','$2y$10$nyxxvDz6cGmEZwsm/A1Zuu44TxaNTdoHiiZVxg1yXwBAR9G64LOde','dbarnes@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2024-12-20 05:17:28',NULL,'2024-12-20 05:47:13',NULL,NULL,NULL,0,NULL,1,NULL),(4,'dbuskins','$2y$10$R85qfD2Bn7K0DfzGBulg4OanybuLwmrZz1txkJ9os7T6NhSZbfH3K','dbuskins@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2024-12-20 05:17:50',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(5,'sberardo','$2y$10$4cB.pslyOMVWx7bijN.1nu7S2EcPTik56Dci.NBuJgM6yeOsqzIQS','sberardo@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:18:13',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(6,'minoue','$2y$10$maq1.xOxmhKM5Pa/24jtFuVH6lxZV4X1439ZyU.5fauouXEJuQWMC','minoue@mailinator.com',NULL,NULL,NULL,NULL,'JP','[]',NULL,NULL,'2024-12-20 05:18:37',NULL,'2024-12-20 05:34:40',NULL,NULL,NULL,0,NULL,1,NULL),(7,'jjanssen','$2y$10$skjFbIpIrQnFMBHSFazw3u20SxozFcjjJssZ87KbECtBRddXeV2Py','jjanssen@mailinator.com',NULL,NULL,NULL,NULL,'NL','[]',NULL,NULL,'2024-12-20 05:19:04',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(8,'phudson','$2y$10$2qBNYpPGg4X108reba/DoOtrjKvmqBR9722ggQzO8RpNPckQyDvDW','phudson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:19:30',NULL,'2024-12-20 05:40:32',NULL,NULL,NULL,0,NULL,1,NULL),(9,'amccrae','$2y$10$NnFVWEeX.M1g15d19VapdO.zdzZ3QluuLYNp3yUGuUso/mk23kHJ2','amccrae@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:20:00',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(10,'agallego','$2y$10$pq3B1.HmSF92n18MSDY28Ou3rdLjSTWvrZpDozibwe0gPZCFBZQIa','agallego@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2024-12-20 05:20:31',NULL,'2024-12-20 05:46:12',NULL,NULL,NULL,0,NULL,1,NULL),(11,'alzacharia','$2y$10$y7cgjnrWKgG6nwiiN70NJeliWwqh/BeYEfdBNy/d6Lw3GErFnzUmm','alzacharia@mailinator.com',NULL,NULL,NULL,NULL,'GH','[]',NULL,NULL,'2024-12-20 05:21:05',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(12,'gfavio','$2y$10$3zVt6dQTwdIIwEZE11rDV.OqHD8m6dzKF6D/3J.hqVyOXZVbLVHEu','gfavio@mailinator.com',NULL,NULL,NULL,NULL,'ES','[]',NULL,NULL,'2024-12-20 05:21:40',NULL,'2024-12-20 05:41:50',NULL,NULL,NULL,0,NULL,1,NULL),(13,'mfritz','$2y$10$cDLDMKOIE3L1ThxqSH/fQe2TaHEj/93TGBZ1uXbiYYyTxaKFueYVi','mfritz@mailinator.com',NULL,NULL,NULL,NULL,'BE','[]',NULL,NULL,'2024-12-20 05:22:16',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(14,'svogt','$2y$10$u/2Fn927vJPvrVNmGHcWv.S41iF6G3iRuaJ6zzQ587qpu/ChkIe1i','svogt@mailinator.com',NULL,NULL,NULL,NULL,'CL','[]',NULL,NULL,'2024-12-20 05:22:55',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(15,'gcox','$2y$10$4xAU0K4mwv4UiJ/8GBhgLeKTDBYmudhcqmBbrht7LezMc/PqfFpWa','gcox@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2024-12-20 05:23:36',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(16,'shellier','$2y$10$9jfkLtRZBPhPSRoMEBivGemFYSroqs1YMppVCpprTwMBrc6jlYT36','shellier@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2024-12-20 05:24:21',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(17,'cturner','$2y$10$PkEikt4KqE0gXyBT2Tbb..T4a3rEml6hdvd0C6co1SyLz8F3gROaK','cturner@mailinator.com',NULL,NULL,NULL,NULL,'GB','[]',NULL,NULL,'2024-12-20 05:25:07',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(18,'skumar','$2y$10$XS7rGh9AVa.03/O5w0m11uv165wOmnRaBXm59u9AXC7hpwhQ.9/IS','skumar@mailinator.com',NULL,NULL,NULL,NULL,'SG','[]',NULL,NULL,'2024-12-20 05:25:56',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(19,'aclark','$2y$10$ddB/L0yyPmT9DVpDXA290.V1HFmpq7lMP/zpgvTg5Bb5VR/xlipZu','aclark@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:26:42',NULL,'2024-12-20 05:26:43',NULL,NULL,NULL,0,NULL,1,NULL),(20,'afinkel','$2y$10$k09Es/M/9.GQkhnSOk59WeABIcKOrwxpi39Mb3lP4aP1gnwqLHk9i','afinkel@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:27:30',NULL,'2024-12-20 05:27:31',NULL,NULL,NULL,0,NULL,1,NULL),(21,'bbarnetson','$2y$10$sZ3PC.OAdrejrxfVZYB83.5/ALzoTPoUaWvAAYpHYX0wh5CguRn32','bbarnetson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:29:40',NULL,'2024-12-20 05:29:40',NULL,NULL,NULL,0,NULL,1,NULL),(22,'bbeaty','$2y$10$05rhNnVxWPJtil4n8H6cLuR1VIerFNAVjRBJP1wyk0twOAgg0Ccr2','bbeaty@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:30:20',NULL,'2024-12-20 05:30:20',NULL,NULL,NULL,0,NULL,1,NULL),(23,'callan','$2y$10$7vtUXAtWq76Xo8U8y2dvWOexf9.C19NuN5PSedTgrDN84CY8Yhipe','callan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:31:45',NULL,'2024-12-20 05:31:45',NULL,NULL,NULL,0,NULL,1,NULL),(24,'dbernnard','$2y$10$N/OvdPEw09mKGJJcH0H2kupb4gLfr1AUpZWKPIovCnasYL/Q9Nl5u','dbernnard@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2024-12-20 05:33:50',NULL,'2024-12-20 05:33:50',NULL,NULL,NULL,0,NULL,1,NULL),(25,'dkennepohl','$2y$10$wLQqyBJfz7gpG9fxIW1O1enn2P6EldN9FT5NJWS1KTVpuveRuL9r6','dkennepohl@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:35:00',NULL,'2024-12-20 05:35:01',NULL,NULL,NULL,0,NULL,1,NULL),(26,'fperini','$2y$10$xA7GQZo1IBKYfnEpIeGXh.96TYSAbDgQI/3qNsmj1ivzy90imSR5y','fperini@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:36:19',NULL,'2024-12-20 05:36:19',NULL,NULL,NULL,0,NULL,1,NULL),(27,'jbrower','$2y$10$EUp.QkMqER1z.p39miJaVeJDoj0epF2vrdyFzQ3.bCqWbOwM1Krwi','jbrower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:37:14',NULL,'2024-12-20 05:37:14',NULL,NULL,NULL,0,NULL,1,NULL),(28,'jlockehart','$2y$10$U7vHwtE1tW7O36bdPaFbsOwW.zYpRcU/IgPSRv.OstnpohO7bmalC','jlockehart@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:38:24',NULL,'2024-12-20 05:38:24',NULL,NULL,NULL,0,NULL,1,NULL),(29,'lelder','$2y$10$tqmrllWq3bvl4eVFO42tX.CNwaqajE43hjdn3NIPQblt/1cnORKoq','lelder@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:39:43',NULL,'2024-12-20 05:39:44',NULL,NULL,NULL,0,NULL,1,NULL),(30,'mally','$2y$10$75S8g.uZZmKqYgXTi1ug1e3cgtUiDwSbheHaaHMdDwsUQue45RAAS','mally@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:40:44',NULL,'2024-12-20 05:40:44',NULL,NULL,NULL,0,NULL,1,NULL),(31,'mdawson','$2y$10$Z6G3M84PV6dYaanm5rlW0OUgYfIFSMXar1lAk92I1/F.FTWtPxn2a','mdawson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:42:19',NULL,'2024-12-20 05:42:19',NULL,NULL,NULL,0,NULL,1,NULL),(32,'mforan','$2y$10$I1yFmKX3gNcLV7mh6xnx5ugvhA7utIDgOxCr41081gJVl4CUx29v6','mforan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:44:34',NULL,'2024-12-20 05:44:35',NULL,NULL,NULL,0,NULL,1,NULL),(33,'mpower','$2y$10$bNOKgIIpSDVJ7vbPhglZ0u8LkPD.TEsXwd2jGooxWiPl3dvoWU/qq','mpower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:45:13',NULL,'2024-12-20 05:45:14',NULL,NULL,NULL,0,NULL,1,NULL),(34,'msmith','$2y$10$7G7pGkhnfMN.9k62G2BQeebITozUsaBWkMVez06Ix8pYDpHV7p8Ee','msmith@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2024-12-20 05:46:26',NULL,'2024-12-20 05:46:26',NULL,NULL,NULL,0,NULL,1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `version_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `major` int NOT NULL DEFAULT '0' COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int NOT NULL DEFAULT '0' COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int NOT NULL DEFAULT '0' COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int NOT NULL DEFAULT '0' COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itself',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise',
  PRIMARY KEY (`version_id`),
  UNIQUE KEY `versions_unique` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COMMENT='Describes the installation and upgrade version history for the application and all installed plugins.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.metadata','dc11','',0,0),(2,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.pubIds','urn','\\APP\\plugins\\pubIds\\urn\\URNPubIdPlugin',0,0),(3,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(4,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.blocks','browse','\\APP\\plugins\\blocks\\browse\\BrowseBlockPlugin',1,0),(5,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(6,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(7,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(8,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(9,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(10,0,1,0,0,'2024-12-20 05:15:43',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(11,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(12,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(13,1,2,0,0,'2024-12-20 05:15:43',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(14,1,2,0,0,'2024-12-20 05:15:43',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(15,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(16,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.generic','usageEvent','',0,1),(17,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(18,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(19,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.themes','default','DefaultThemePlugin',1,0),(20,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.importexport','csv','',0,0),(21,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.importexport','native','',0,0),(22,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.importexport','onix30','',0,0),(23,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.importexport','users','',0,0),(24,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.oaiMetadataFormats','dc','',0,0),(25,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.paymethod','manual','',0,0),(26,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.paymethod','paypal','',0,0),(27,2,0,1,0,'2024-12-20 05:15:43',1,'plugins.reports','reviewReport','',0,0),(28,1,0,0,0,'2024-12-20 05:15:43',1,'plugins.reports','monographReport','',0,0),(29,3,5,0,0,'2024-12-20 05:15:34',1,'core','omp','',0,1);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-20  5:47:37
