-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: florist's
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add color',7,'add_color'),(26,'Can change color',7,'change_color'),(27,'Can delete color',7,'delete_color'),(28,'Can view color',7,'view_color'),(29,'Can add flower',8,'add_flower'),(30,'Can change flower',8,'change_flower'),(31,'Can delete flower',8,'delete_flower'),(32,'Can view flower',8,'view_flower'),(33,'Can add flower color',9,'add_flowercolor'),(34,'Can change flower color',9,'change_flowercolor'),(35,'Can delete flower color',9,'delete_flowercolor'),(36,'Can view flower color',9,'view_flowercolor'),(37,'Can add customer',10,'add_customer'),(38,'Can change customer',10,'change_customer'),(39,'Can delete customer',10,'delete_customer'),(40,'Can view customer',10,'view_customer'),(41,'Can add individual',11,'add_individual'),(42,'Can change individual',11,'change_individual'),(43,'Can delete individual',11,'delete_individual'),(44,'Can view individual',11,'view_individual'),(45,'Can add firm',12,'add_firm'),(46,'Can change firm',12,'change_firm'),(47,'Can delete firm',12,'delete_firm'),(48,'Can view firm',12,'view_firm'),(49,'Can add order',13,'add_order'),(50,'Can change order',13,'change_order'),(51,'Can delete order',13,'delete_order'),(52,'Can view order',13,'view_order'),(53,'Can add order flower',14,'add_orderflower'),(54,'Can change order flower',14,'change_orderflower'),(55,'Can delete order flower',14,'delete_orderflower'),(56,'Can view order flower',14,'view_orderflower'),(57,'Can add delivery',15,'add_delivery'),(58,'Can change delivery',15,'change_delivery'),(59,'Can delete delivery',15,'delete_delivery'),(60,'Can view delivery',15,'view_delivery'),(61,'Can add delivery name',16,'add_deliveryname'),(62,'Can change delivery name',16,'change_deliveryname'),(63,'Can delete delivery name',16,'delete_deliveryname'),(64,'Can view delivery name',16,'view_deliveryname'),(65,'Can add payment type',17,'add_paymenttype'),(66,'Can change payment type',17,'change_paymenttype'),(67,'Can delete payment type',17,'delete_paymenttype'),(68,'Can view payment type',17,'view_paymenttype'),(69,'Can add status',18,'add_status'),(70,'Can change status',18,'change_status'),(71,'Can delete status',18,'delete_status'),(72,'Can view status',18,'view_status'),(73,'Can add employee',19,'add_employee'),(74,'Can change employee',19,'change_employee'),(75,'Can delete employee',19,'delete_employee'),(76,'Can view employee',19,'view_employee');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `color_id` int NOT NULL AUTO_INCREMENT,
  `color_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'Czerwony'),(2,'Niebieski'),(3,'Żółty'),(4,'Zielony'),(5,'Biały'),(6,'Różowy'),(7,'Fioletowy'),(8,'Pomarańczowy'),(9,'Brązowy'),(10,'Czarny'),(11,'Szary'),(12,'Błękitny'),(13,'Turkusowy'),(14,'Burgundowy'),(15,'Limonkowy'),(16,'lawentowy');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_contact` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'+48-123-456-789','ul. Lipowa 10, Warszawa, 00-001'),(2,'+48-234-567-890','ul. Długa 15, Kraków, 31-002'),(3,'+48-345-678-901','ul. Wiśniowa 8, Poznań, 60-003'),(4,'+48-456-789-012','ul. Słoneczna 20, Wrocław, 50-004'),(5,'+48-567-890-123','ul. Krótka 5, Gdańsk, 80-005'),(6,'+48-678-901-234','ul. Miodowa 11, Łódź, 90-006'),(7,'+48-789-012-345','ul. Jaśminowa 7, Szczecin, 70-007'),(8,'+48-890-123-456','ul. Zielona 3, Lublin, 20-008'),(9,'+48-901-234-567','ul. Polna 4, Katowice, 40-009'),(10,'+48-012-345-678','ul. Leśna 9, Białystok, 15-010'),(11,'+48-111-222-333','ul. Żytnia 12, Toruń, 87-100'),(12,'+48-222-333-444','ul. Chmielna 21, Bydgoszcz, 85-020'),(13,'+48-333-444-555','ul. Różana 16, Rzeszów, 35-030'),(14,'+48-444-555-666','ul. Spacerowa 18, Opole, 45-040'),(15,'+48-555-666-777','ul. Ogrodowa 13, Zielona Góra, 65-050');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_id` int NOT NULL,
  `delivery_data` date DEFAULT NULL,
  `delivery_name_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `delivery_name_id` (`delivery_name_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`delivery_name_id`) REFERENCES `deliveryname` (`delivery_name_id`),
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'2024-10-01',1,3),(2,'2024-10-02',2,2),(3,'2024-10-03',3,5),(4,'2024-10-03',1,1),(5,'2024-10-04',2,4),(6,'2024-10-05',3,3),(7,'2024-10-05',1,5),(8,'2024-10-06',2,1),(9,'2024-10-06',3,2),(10,'2024-10-07',1,3),(11,'2024-10-07',2,5),(12,'2024-10-08',3,1),(13,'2024-10-08',1,4),(14,'2024-10-09',2,2),(15,'2024-10-09',3,5);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryname`
--

DROP TABLE IF EXISTS `deliveryname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryname` (
  `delivery_name_id` int NOT NULL,
  `firm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`delivery_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryname`
--

LOCK TABLES `deliveryname` WRITE;
/*!40000 ALTER TABLE `deliveryname` DISABLE KEYS */;
INSERT INTO `deliveryname` VALUES (1,'InPost'),(2,'DPD'),(3,'DHL'),(4,'FeDex'),(5,'UPS'),(6,'Poczta Polska'),(7,'GLS'),(8,'ORLEN Paczka');
/*!40000 ALTER TABLE `deliveryname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'shop_app','color'),(10,'shop_app','customer'),(15,'shop_app','delivery'),(16,'shop_app','deliveryname'),(19,'shop_app','employee'),(12,'shop_app','firm'),(8,'shop_app','flower'),(9,'shop_app','flowercolor'),(11,'shop_app','individual'),(13,'shop_app','order'),(14,'shop_app','orderflower'),(17,'shop_app','paymenttype'),(18,'shop_app','status');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-12-01 16:31:42.357501'),(2,'auth','0001_initial','2024-12-01 16:31:42.673389'),(3,'admin','0001_initial','2024-12-01 16:31:42.747182'),(4,'admin','0002_logentry_remove_auto_add','2024-12-01 16:31:42.752182'),(5,'admin','0003_logentry_add_action_flag_choices','2024-12-01 16:31:42.768493'),(6,'contenttypes','0002_remove_content_type_name','2024-12-01 16:31:42.824691'),(7,'auth','0002_alter_permission_name_max_length','2024-12-01 16:31:42.856276'),(8,'auth','0003_alter_user_email_max_length','2024-12-01 16:31:42.874414'),(9,'auth','0004_alter_user_username_opts','2024-12-01 16:31:42.880570'),(10,'auth','0005_alter_user_last_login_null','2024-12-01 16:31:42.921326'),(11,'auth','0006_require_contenttypes_0002','2024-12-01 16:31:42.924423'),(12,'auth','0007_alter_validators_add_error_messages','2024-12-01 16:31:42.930533'),(13,'auth','0008_alter_user_username_max_length','2024-12-01 16:31:42.972302'),(14,'auth','0009_alter_user_last_name_max_length','2024-12-01 16:31:43.014007'),(15,'auth','0010_alter_group_name_max_length','2024-12-01 16:31:43.027848'),(16,'auth','0011_update_proxy_permissions','2024-12-01 16:31:43.033845'),(17,'auth','0012_alter_user_first_name_max_length','2024-12-01 16:31:43.073500'),(18,'sessions','0001_initial','2024-12-01 16:31:43.097993');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supervisor_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `supervisor_id` (`supervisor_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `employee` (`employee_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Anna Kwiatkowska','Właścicielka',NULL),(2,'Krzysztof Zając','Kierownik Sklepu',1),(3,'Ewa Słowik','Florystka',1),(4,'Marek Nowak','Sprzedawca',2),(5,'Julia Kowalska','Sprzedawczyni',2),(6,'Tomasz Gajewski','Asystent Florysty',3),(7,'Ola Nowicka','Asystentka Sprzedaży',2),(8,'Piotr Woźniak','Kierownik Zamówień',1),(9,'Kasia Sienkiewicz','Specjalista ds. Kwiatów',8),(10,'Ania Wróblewska','Asystentka Kwiaciarni',8),(11,'Michał Pawlak','Doradca Klienta',2),(12,'Magdalena Wysocka','Asystentka Florysty',3),(13,'Jakub Król','Kierownik Obsługi Klienta',1),(14,'Patrycja Adamczyk','Specjalistka ds. Roślin',13),(15,'Sebastian Olszewski','Asystent Sprzedaży',13);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firm`
--

DROP TABLE IF EXISTS `firm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firm` (
  `customer_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NIP` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `firm_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firm`
--

LOCK TABLES `firm` WRITE;
/*!40000 ALTER TABLE `firm` DISABLE KEYS */;
INSERT INTO `firm` VALUES (8,'CD Projekt S.A.','1234567890'),(9,'Poczta Polska S.A.','2345678901'),(10,'PKN Orlen S.A.','3456789012'),(11,'LPP S.A.','4567890123'),(12,'KGHM Polska Miedź S.A.','5678901234');
/*!40000 ALTER TABLE `firm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flower`
--

DROP TABLE IF EXISTS `flower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flower` (
  `flower_id` int NOT NULL,
  `flower_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`flower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flower`
--

LOCK TABLES `flower` WRITE;
/*!40000 ALTER TABLE `flower` DISABLE KEYS */;
INSERT INTO `flower` VALUES (1,'Lycoris',12.5),(2,'Magnolia',30),(3,'Rafflesia',10),(4,'Viola',12),(5,'Gloriosa',9),(6,'Taraxacum',8),(7,'Grevillea',13.2),(8,'Clitoria',10),(9,'Iris',20),(10,'Antirrhium',35),(11,'Asclepias',11.5),(12,'Datura',12),(13,'Cattleya',4.5),(14,'Camassia',10),(15,'Erica',5.5);
/*!40000 ALTER TABLE `flower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowercolors`
--

DROP TABLE IF EXISTS `flowercolors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flowercolors` (
  `flower_id` int NOT NULL,
  `color_id` int NOT NULL,
  PRIMARY KEY (`flower_id`,`color_id`),
  KEY `color_id` (`color_id`),
  CONSTRAINT `flowercolors_ibfk_1` FOREIGN KEY (`flower_id`) REFERENCES `flower` (`flower_id`),
  CONSTRAINT `flowercolors_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `colors` (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowercolors`
--

LOCK TABLES `flowercolors` WRITE;
/*!40000 ALTER TABLE `flowercolors` DISABLE KEYS */;
INSERT INTO `flowercolors` VALUES (1,1),(6,1),(2,2),(3,3),(12,4),(2,5),(5,6),(1,7),(4,8),(4,9),(10,10),(11,11),(7,12),(7,13),(8,14),(9,15);
/*!40000 ALTER TABLE `flowercolors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `individual`
--

DROP TABLE IF EXISTS `individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individual` (
  `customer_id` int NOT NULL,
  `individual_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `individual_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individual`
--

LOCK TABLES `individual` WRITE;
/*!40000 ALTER TABLE `individual` DISABLE KEYS */;
INSERT INTO `individual` VALUES (1,'Jan','Kowalski'),(2,'Anna','Nowak'),(3,'Piotr','Wiśniewski'),(4,'Katarzyna','Wójcik'),(5,'Tomasz','Kowalczyk'),(6,'Agnieszka','Kamińska'),(7,'Marek','Lewandowski'),(13,'Ewa','Nowicka'),(14,'Adam','Zieliński'),(15,'Magdalena','Wiśniewska');
/*!40000 ALTER TABLE `individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderflower`
--

DROP TABLE IF EXISTS `orderflower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderflower` (
  `order_id` int NOT NULL,
  `flower_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_id`,`flower_id`),
  KEY `flower_id` (`flower_id`),
  CONSTRAINT `orderflower_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `orderflower_ibfk_2` FOREIGN KEY (`flower_id`) REFERENCES `flower` (`flower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderflower`
--

LOCK TABLES `orderflower` WRITE;
/*!40000 ALTER TABLE `orderflower` DISABLE KEYS */;
INSERT INTO `orderflower` VALUES (1,1,2),(1,2,1),(2,3,5),(2,4,3),(3,1,5),(3,2,5),(3,5,1),(3,6,4),(4,7,2),(4,8,1),(5,9,6),(5,10,1),(6,11,3),(6,12,2),(7,13,1),(7,14,4),(8,1,2),(8,15,5),(9,2,3),(9,3,1),(9,5,3),(10,4,2),(10,5,5),(11,6,1),(11,7,3),(12,8,1),(12,9,2),(13,10,1),(13,11,4),(14,12,2),(14,13,3),(15,14,1);
/*!40000 ALTER TABLE `orderflower` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_orderflower` AFTER INSERT ON `orderflower` FOR EACH ROW BEGIN

    DECLARE v_calculated_total FLOAT;



    -- Oblicz nową całkowitą cenę zamówienia

    SELECT ROUND(SUM(f.price * od.quantity), 2) INTO v_calculated_total

    FROM orderflower AS od

    JOIN flower AS f ON od.flower_id = f.flower_id

    WHERE od.order_id = NEW.order_id;



    -- Zaktualizuj `total_amount` w tabeli `orders`

    UPDATE orders

    SET total_amount = v_calculated_total

    WHERE order_id = NEW.order_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_orderflower` AFTER UPDATE ON `orderflower` FOR EACH ROW BEGIN

    DECLARE v_calculated_total FLOAT;



    -- Obliczam nową cenę zamówineia

    SELECT ROUND(SUM(f.price * od.quantity), 2) INTO v_calculated_total

    FROM orderflower AS od

    JOIN flower AS f ON od.flower_id = f.flower_id

    WHERE od.order_id = NEW.order_id;



    -- Aktualizacja `total_amount` w tabeli `orders`

    UPDATE orders

    SET total_amount = v_calculated_total

    WHERE order_id = NEW.order_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_orderflower_delete` AFTER DELETE ON `orderflower` FOR EACH ROW BEGIN

    -- Zmienna do przechowywania liczby rekordów z danym order_id w orderflower

    DECLARE v_order_exists INT;

    -- Zmienna do przechowywania delivery_id

    DECLARE v_delivery_id INT;

    -- Zmienna do przechowywania liczby zamówień powiązanych z danym delivery_id

    DECLARE v_delivery_exists INT;



    -- Zapytanie sprawdzające, czy są jeszcze jakieś rekordy w orderflower z danym order_id

    SELECT COUNT(*) INTO v_order_exists

    FROM orderflower

    WHERE order_id = OLD.order_id;



    -- Jeśli brak rekordów w orderflower dla tego order_id, to usuwamy powiązane rekordy

    IF v_order_exists = 0 THEN

        -- Pobierz delivery_id powiązane z tym order_id

        SELECT delivery_id INTO v_delivery_id

        FROM orders

        WHERE order_id = OLD.order_id;



        -- Usuń rekord z tabeli orders

        DELETE FROM orders

        WHERE order_id = OLD.order_id;



        -- Sprawdź, czy inne zamówienia są powiązane z tym samym delivery_id

        SELECT COUNT(*) INTO v_delivery_exists

        FROM orders

        WHERE delivery_id = v_delivery_id;



        -- Jeśli nie ma innych zamówień powiązanych z tą dostawą, usuń rekord z tabeli delivery

        IF v_delivery_exists = 0 THEN

            DELETE FROM delivery

            WHERE delivery_id = v_delivery_id;

        END IF;

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `total_amount` float NOT NULL,
  `order_date` datetime NOT NULL,
  `customer_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `delivery_id` int DEFAULT NULL,
  `payment_type_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `delivery_id` (`delivery_id`),
  KEY `payment_type_id` (`payment_type_id`) USING BTREE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`payment_type_id`) REFERENCES `paymenttype` (`payment_type_id`),
  CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,55,'2024-10-01 10:00:00',1,2,1,1),(2,86,'2024-10-02 12:30:00',2,3,2,2),(3,253.5,'2024-10-03 15:00:00',3,4,3,3),(4,36.4,'2024-10-04 14:45:00',4,5,4,4),(5,155,'2024-10-05 09:15:00',5,6,5,5),(6,58.5,'2024-10-06 11:30:00',6,7,6,6),(7,44.5,'2024-10-07 13:00:00',7,8,7,7),(8,52.5,'2024-10-08 16:00:00',8,9,8,8),(9,100,'2024-10-09 17:00:00',9,10,9,9),(10,69,'2024-10-10 10:30:00',10,11,10,1),(11,47.6,'2024-10-11 12:00:00',11,12,11,2),(12,50,'2024-10-12 15:30:00',12,13,12,3),(13,81,'2024-10-13 16:45:00',13,14,13,4),(14,37.5,'2024-10-14 11:15:00',14,15,14,5),(15,15.5,'2024-10-15 09:00:00',15,1,15,6);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_order` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN

    DECLARE v_contact_exists INT;



    -- Sprawdzam czy klient ma kontakt

    SELECT COUNT(*) INTO v_contact_exists

    FROM customer

    WHERE customer_id = NEW.customer_id AND customer_contact IS NOT NULL;



    IF v_contact_exists = 0 THEN

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer contact is required to place an order.';

    END IF;



    -- Sprawdzenie, czy wszystkie wymagane pola są wypełnione (pod procedure)

    IF NEW.customer_id IS NULL OR NEW.employee_id IS NULL OR NEW.delivery_id IS NULL OR NEW.payment_type_id IS NULL THEN

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'All fields (customer, employee, delivery, payment type) must be filled.';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `paymenttype`
--

DROP TABLE IF EXISTS `paymenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymenttype` (
  `payment_type_id` int NOT NULL,
  `payment_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`payment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenttype`
--

LOCK TABLES `paymenttype` WRITE;
/*!40000 ALTER TABLE `paymenttype` DISABLE KEYS */;
INSERT INTO `paymenttype` VALUES (1,'BLIK'),(2,'Karta Płatnicza'),(3,'Przelew Tradycyjny'),(4,'PayPal'),(5,'Portfel Elektroniczny'),(6,'Płatność Odroczona'),(7,'Płatność Cykliczna'),(8,'Przelewy24'),(9,'Gotówka'),(10,'skibidi');
/*!40000 ALTER TABLE `paymenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_app_color`
--

DROP TABLE IF EXISTS `shop_app_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_app_color` (
  `color_id` int NOT NULL AUTO_INCREMENT,
  `color_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_app_color`
--

LOCK TABLES `shop_app_color` WRITE;
/*!40000 ALTER TABLE `shop_app_color` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_app_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_app_customer`
--

DROP TABLE IF EXISTS `shop_app_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_app_customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_contact` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_app_customer`
--

LOCK TABLES `shop_app_customer` WRITE;
/*!40000 ALTER TABLE `shop_app_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_app_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_app_delivery`
--

DROP TABLE IF EXISTS `shop_app_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_app_delivery` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `delivery_data` date DEFAULT NULL,
  `delivery_name_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `shop_app_delivery_delivery_name_id_13bc36dd_fk_shop_app_` (`delivery_name_id`),
  KEY `shop_app_delivery_status_id_660562e7_fk_shop_app_` (`status_id`),
  CONSTRAINT `shop_app_delivery_delivery_name_id_13bc36dd_fk_shop_app_` FOREIGN KEY (`delivery_name_id`) REFERENCES `shop_app_deliveryname` (`delivery_name_id`),
  CONSTRAINT `shop_app_delivery_status_id_660562e7_fk_shop_app_` FOREIGN KEY (`status_id`) REFERENCES `shop_app_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_app_delivery`
--

LOCK TABLES `shop_app_delivery` WRITE;
/*!40000 ALTER TABLE `shop_app_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_app_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_app_deliveryname`
--

DROP TABLE IF EXISTS `shop_app_deliveryname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_app_deliveryname` (
  `delivery_name_id` int NOT NULL AUTO_INCREMENT,
  `firm_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`delivery_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_app_deliveryname`
--

LOCK TABLES `shop_app_deliveryname` WRITE;
/*!40000 ALTER TABLE `shop_app_deliveryname` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_app_deliveryname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_app_firm`
--

DROP TABLE IF EXISTS `shop_app_firm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_app_firm` (
  `customer_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NIP` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `shop_app_firm_customer_id_a2d5bb71_fk_shop_app_` FOREIGN KEY (`customer_id`) REFERENCES `shop_app_customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_app_firm`
--

LOCK TABLES `shop_app_firm` WRITE;
/*!40000 ALTER TABLE `shop_app_firm` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_app_firm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_app_flower`
--

DROP TABLE IF EXISTS `shop_app_flower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_app_flower` (
  `flower_id` int NOT NULL AUTO_INCREMENT,
  `flower_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`flower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_app_flower`
--

LOCK TABLES `shop_app_flower` WRITE;
/*!40000 ALTER TABLE `shop_app_flower` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_app_flower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_app_flowercolor`
--

DROP TABLE IF EXISTS `shop_app_flowercolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_app_flowercolor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `color_id` int NOT NULL,
  `flower_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_app_flowercolor_flower_id_color_id_12cbc5fd_uniq` (`flower_id`,`color_id`),
  KEY `shop_app_flowercolor_color_id_67220c45_fk_shop_app_` (`color_id`),
  CONSTRAINT `shop_app_flowercolor_color_id_67220c45_fk_shop_app_` FOREIGN KEY (`color_id`) REFERENCES `shop_app_color` (`color_id`),
  CONSTRAINT `shop_app_flowercolor_flower_id_6de18af4_fk_shop_app_` FOREIGN KEY (`flower_id`) REFERENCES `shop_app_flower` (`flower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_app_flowercolor`
--

LOCK TABLES `shop_app_flowercolor` WRITE;
/*!40000 ALTER TABLE `shop_app_flowercolor` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_app_flowercolor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_app_individual`
--

DROP TABLE IF EXISTS `shop_app_individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_app_individual` (
  `customer_id` int NOT NULL,
  `individual_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `shop_app_individual_customer_id_678323a2_fk_shop_app_` FOREIGN KEY (`customer_id`) REFERENCES `shop_app_customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_app_individual`
--

LOCK TABLES `shop_app_individual` WRITE;
/*!40000 ALTER TABLE `shop_app_individual` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_app_individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_app_order`
--

DROP TABLE IF EXISTS `shop_app_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_app_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `total_amount` double NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `customer_id` int DEFAULT NULL,
  `delivery_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `payment_type_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `shop_app_order_customer_id_c133e969_fk_shop_app_` (`customer_id`),
  KEY `shop_app_order_delivery_id_017d5a0f_fk_shop_app_` (`delivery_id`),
  KEY `shop_app_order_employee_id_cc82f30f_fk_shop_app_` (`employee_id`),
  KEY `shop_app_order_payment_type_id_302abb3c_fk_shop_app_` (`payment_type_id`),
  CONSTRAINT `shop_app_order_customer_id_c133e969_fk_shop_app_` FOREIGN KEY (`customer_id`) REFERENCES `shop_app_customer` (`customer_id`),
  CONSTRAINT `shop_app_order_delivery_id_017d5a0f_fk_shop_app_` FOREIGN KEY (`delivery_id`) REFERENCES `shop_app_delivery` (`delivery_id`),
  CONSTRAINT `shop_app_order_employee_id_cc82f30f_fk_shop_app_` FOREIGN KEY (`employee_id`) REFERENCES `shop_app_employee` (`employee_id`),
  CONSTRAINT `shop_app_order_payment_type_id_302abb3c_fk_shop_app_` FOREIGN KEY (`payment_type_id`) REFERENCES `shop_app_paymenttype` (`payment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_app_order`
--

LOCK TABLES `shop_app_order` WRITE;
/*!40000 ALTER TABLE `shop_app_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_app_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_app_orderflower`
--

DROP TABLE IF EXISTS `shop_app_orderflower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_app_orderflower` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `flower_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_app_orderflower_order_id_flower_id_69795c6c_uniq` (`order_id`,`flower_id`),
  KEY `shop_app_orderflower_flower_id_1d0112f7_fk_shop_app_` (`flower_id`),
  CONSTRAINT `shop_app_orderflower_flower_id_1d0112f7_fk_shop_app_` FOREIGN KEY (`flower_id`) REFERENCES `shop_app_flower` (`flower_id`),
  CONSTRAINT `shop_app_orderflower_order_id_fc5d956e_fk_shop_app_` FOREIGN KEY (`order_id`) REFERENCES `shop_app_order` (`order_id`),
  CONSTRAINT `shop_app_orderflower_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_app_orderflower`
--

LOCK TABLES `shop_app_orderflower` WRITE;
/*!40000 ALTER TABLE `shop_app_orderflower` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_app_orderflower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_app_paymenttype`
--

DROP TABLE IF EXISTS `shop_app_paymenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_app_paymenttype` (
  `payment_type_id` int NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`payment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_app_paymenttype`
--

LOCK TABLES `shop_app_paymenttype` WRITE;
/*!40000 ALTER TABLE `shop_app_paymenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_app_paymenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_app_status`
--

DROP TABLE IF EXISTS `shop_app_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_app_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_app_status`
--

LOCK TABLES `shop_app_status` WRITE;
/*!40000 ALTER TABLE `shop_app_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_app_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` int NOT NULL,
  `status_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Dostarczono przesyłkę'),(2,'Opłacono zamówienie'),(3,'Przygotowane przez sprzedawcę'),(4,'Anulowano zamówienie'),(5,'W drodze do klienta'),(6,'Oczekuje na opłacenie'),(7,'Zatwierdzone przez sprzedawcę'),(8,'Odwołane przez klienta'),(9,'Odbiór osobisty zrealizowany'),(10,'Zamówienie wstrzymane przez sprzedawcę'),(11,'skibidi');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 10:54:24
