-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: industrybuying
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apis_contact`
--

DROP TABLE IF EXISTS `apis_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apis_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `is_spam` tinyint(1) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_no` (`phone_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apis_contact`
--

LOCK TABLES `apis_contact` WRITE;
/*!40000 ALTER TABLE `apis_contact` DISABLE KEYS */;
INSERT INTO `apis_contact` VALUES (1,'vitanshu','8517984216',1,'cld@gmail.com'),(2,'vit','9907769989',1,NULL),(3,'vitansh','8882678181',1,NULL);
/*!40000 ALTER TABLE `apis_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apis_userconact`
--

DROP TABLE IF EXISTS `apis_userconact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apis_userconact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apis_userconact_user_id_contact_id_cee89ef4_uniq` (`user_id`,`contact_id`),
  KEY `apis_userconact_contact_id_8d558f63_fk_apis_contact_id` (`contact_id`),
  CONSTRAINT `apis_userconact_contact_id_8d558f63_fk_apis_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `apis_contact` (`id`),
  CONSTRAINT `apis_userconact_user_id_9949d057_fk_apis_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `apis_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apis_userconact`
--

LOCK TABLES `apis_userconact` WRITE;
/*!40000 ALTER TABLE `apis_userconact` DISABLE KEYS */;
/*!40000 ALTER TABLE `apis_userconact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apis_userprofile`
--

DROP TABLE IF EXISTS `apis_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apis_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone_no` (`phone_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apis_userprofile`
--

LOCK TABLES `apis_userprofile` WRITE;
/*!40000 ALTER TABLE `apis_userprofile` DISABLE KEYS */;
INSERT INTO `apis_userprofile` VALUES (1,'',NULL,0,'','','','',0,1,'2020-07-26 05:21:55.320736','8517984216','vitanshu'),(3,'',NULL,0,'vitanshusahu-cb','','','',0,1,'2020-07-26 05:22:54.251113','9907769989','vitanshu sahu'),(4,'',NULL,0,'vitanshusharma-cs','','','',0,1,'2020-07-26 05:25:30.213727','7697378185','vitanshu sharma'),(5,'',NULL,0,'vitanshu-vf','','','vitanshu.sahu@gmail.com',0,1,'2020-07-26 05:40:35.215050','8882678181','vitanshu'),(6,'',NULL,0,'vitanshu-oy','','','vitanshu.sahu@gmail.com',0,1,'2020-07-26 08:22:40.364063','9754476855','vitanshu'),(7,'pbkdf2_sha256$180000$PL3AydkbwtuW$aJT9A12/VyShFb8byS9+pZdOOe/ERbFSsTRBgHYtZnE=','2020-07-26 08:40:29.415141',1,'cld','','','cld@gmail.com',1,1,'2020-07-26 08:34:37.854320','',''),(9,'pbkdf2_sha256$180000$Qjtf22ujOpPF$rovSIb0FTj9RRgMWVB3uuxw37Q5a2mMNTtkUrSpUfRk=','2020-07-26 08:38:25.667180',1,'cld1','','','cld1@gmail.com',1,1,'2020-07-26 08:38:10.116623','8319560985','');
/*!40000 ALTER TABLE `apis_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apis_userprofile_groups`
--

DROP TABLE IF EXISTS `apis_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apis_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apis_userprofile_groups_userprofile_id_group_id_21396ddd_uniq` (`userprofile_id`,`group_id`),
  KEY `apis_userprofile_groups_group_id_98079c75_fk_auth_group_id` (`group_id`),
  CONSTRAINT `apis_userprofile_gro_userprofile_id_654d58b3_fk_apis_user` FOREIGN KEY (`userprofile_id`) REFERENCES `apis_userprofile` (`id`),
  CONSTRAINT `apis_userprofile_groups_group_id_98079c75_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apis_userprofile_groups`
--

LOCK TABLES `apis_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `apis_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `apis_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apis_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `apis_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apis_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apis_userprofile_user_pe_userprofile_id_permissio_97751289_uniq` (`userprofile_id`,`permission_id`),
  KEY `apis_userprofile_use_permission_id_708a7a40_fk_auth_perm` (`permission_id`),
  CONSTRAINT `apis_userprofile_use_permission_id_708a7a40_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `apis_userprofile_use_userprofile_id_393e23ed_fk_apis_user` FOREIGN KEY (`userprofile_id`) REFERENCES `apis_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apis_userprofile_user_permissions`
--

LOCK TABLES `apis_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `apis_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `apis_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add user',4,'add_userprofile'),(14,'Can change user',4,'change_userprofile'),(15,'Can delete user',4,'delete_userprofile'),(16,'Can view user',4,'view_userprofile'),(17,'Can add log entry',5,'add_logentry'),(18,'Can change log entry',5,'change_logentry'),(19,'Can delete log entry',5,'delete_logentry'),(20,'Can view log entry',5,'view_logentry'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add contact',7,'add_contact'),(26,'Can change contact',7,'change_contact'),(27,'Can delete contact',7,'delete_contact'),(28,'Can view contact',7,'view_contact'),(29,'Can add user conact',8,'add_userconact'),(30,'Can change user conact',8,'change_userconact'),(31,'Can delete user conact',8,'delete_userconact'),(32,'Can view user conact',8,'view_userconact');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_apis_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_apis_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `apis_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (5,'admin','logentry'),(7,'apis','contact'),(8,'apis','userconact'),(4,'apis','userprofile'),(2,'auth','group'),(1,'auth','permission'),(3,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-07-26 03:23:59.302838'),(2,'contenttypes','0002_remove_content_type_name','2020-07-26 03:23:59.392080'),(3,'auth','0001_initial','2020-07-26 03:23:59.484069'),(4,'auth','0002_alter_permission_name_max_length','2020-07-26 03:23:59.671211'),(5,'auth','0003_alter_user_email_max_length','2020-07-26 03:23:59.691636'),(6,'auth','0004_alter_user_username_opts','2020-07-26 03:23:59.711513'),(7,'auth','0005_alter_user_last_login_null','2020-07-26 03:23:59.722714'),(8,'auth','0006_require_contenttypes_0002','2020-07-26 03:23:59.726019'),(9,'auth','0007_alter_validators_add_error_messages','2020-07-26 03:23:59.734460'),(10,'auth','0008_alter_user_username_max_length','2020-07-26 03:23:59.758463'),(11,'auth','0009_alter_user_last_name_max_length','2020-07-26 03:23:59.773452'),(12,'auth','0010_alter_group_name_max_length','2020-07-26 03:23:59.789225'),(13,'auth','0011_update_proxy_permissions','2020-07-26 03:23:59.801439'),(14,'apis','0001_initial','2020-07-26 03:30:39.997041'),(15,'apis','0002_userprofile','2020-07-26 03:36:46.372022'),(16,'admin','0001_initial','2020-07-26 03:36:49.835496'),(17,'admin','0002_logentry_remove_auto_add','2020-07-26 03:36:49.960429'),(18,'admin','0003_logentry_add_action_flag_choices','2020-07-26 03:36:49.990524'),(19,'sessions','0001_initial','2020-07-26 03:36:50.016830'),(20,'apis','0003_contact_userconact','2020-07-26 03:55:31.250636'),(21,'apis','0004_userprofile_name','2020-07-26 04:12:13.861227'),(22,'apis','0005_contact_is_spam','2020-07-26 05:59:56.960201'),(23,'apis','0006_contact_email','2020-07-26 08:05:11.808573');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-26 14:27:50
