-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Fast_Food_Managment_System
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

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
-- Table structure for table `Batch`
--

DROP TABLE IF EXISTS `Batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Batch` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Batch`
--

LOCK TABLES `Batch` WRITE;
/*!40000 ALTER TABLE `Batch` DISABLE KEYS */;
INSERT INTO `Batch` VALUES (1,'maaggi',2,'2016-01-11'),(2,'momose',2,'2016-01-12'),(3,'samosa',3,'2016-01-13'),(4,'dosa',1,'2016-01-14'),(5,'panir',2,'2016-01-15'),(6,'roti',5,'2016-02-15'),(7,'cholabhatura',2,'2016-02-16'),(8,'coldrink',2,'2016-02-17'),(9,'chiken',2,'2016-02-18'),(10,'pasta',1,'2016-02-18');
/*!40000 ALTER TABLE `Batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bill` (
  `order_id` int(11) NOT NULL,
  `bill_date` date NOT NULL,
  `pament_mode` varchar(20) NOT NULL,
  `bill_amount` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_test11` (`customer_id`),
  CONSTRAINT `Bill_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
  CONSTRAINT `fk_test11` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill`
--

LOCK TABLES `Bill` WRITE;
/*!40000 ALTER TABLE `Bill` DISABLE KEYS */;
INSERT INTO `Bill` VALUES (1,'2016-10-01','card',100,1),(2,'2016-10-02','card',100,2),(3,'2016-10-03','case',200,3),(4,'2016-10-04','case',20,4),(5,'2016-10-05','atm',2000,5),(6,'2016-10-06','atm',300,6),(7,'2016-10-07','card',500,7),(8,'0000-00-00','card',1000,8),(9,'0000-00-00','card',7000,9),(10,'0000-00-00','card',7000,9),(11,'0000-00-00','card',7000,9),(12,'0000-00-00','card',8000,9),(13,'2016-10-01','card',7000,9),(14,'2016-10-01','card',8000,9),(15,'2016-10-01','card',10000,9),(16,'2016-10-02','card',5000,9),(17,'2016-10-02','card',20000,9);
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Chef`
--

DROP TABLE IF EXISTS `Chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Chef` (
  `chef_id` int(11) NOT NULL AUTO_INCREMENT,
  `chef_name` varchar(20) NOT NULL,
  `chef_salary` int(11) NOT NULL,
  `chef_adress` varchar(20) NOT NULL,
  `phone_no` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`chef_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chef`
--

LOCK TABLES `Chef` WRITE;
/*!40000 ALTER TABLE `Chef` DISABLE KEYS */;
INSERT INTO `Chef` VALUES (1,'ravi',2000,'varanasi',9137737326),(2,'teja',2010,'lanka',9947737326),(3,'sani',2050,'lanka',9647737336),(4,'aviraj',200,'lanka',9447737336),(5,'shekh',5000,'bhu',9547737336),(6,'niraj',5000,'bhu',9547737337),(7,'raja',5000,'bhu',9747737367),(8,'rahul',4000,'lanka',9847737367),(9,'Raj',20000,'BHU',9698237828),(12,'santa',30000,'BHU',8937979954),(15,'pradeep',20000,'BHU',9161484826),(16,'pradeep',20000,'BHU',9161484826),(60,'raja',30000,'lanka',9876543210),(61,'Ravi',4000,'Lanka_Varanasi',9698237828),(62,'Avijit',1000,'BHU',9161727623),(63,'Bharat',2000,'Varansi',9698237828);
/*!40000 ALTER TABLE `Chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contains`
--

DROP TABLE IF EXISTS `Contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contains` (
  `food_id` int(11) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  PRIMARY KEY (`food_id`,`item_name`),
  KEY `fk_test6` (`item_name`),
  CONSTRAINT `Contains_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `Food` (`food_id`),
  CONSTRAINT `Contains_ibfk_2` FOREIGN KEY (`item_name`) REFERENCES `Items` (`item_name`),
  CONSTRAINT `fk_test5` FOREIGN KEY (`food_id`) REFERENCES `Food` (`food_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_test6` FOREIGN KEY (`item_name`) REFERENCES `Items` (`item_name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contains`
--

LOCK TABLES `Contains` WRITE;
/*!40000 ALTER TABLE `Contains` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Coocks`
--

DROP TABLE IF EXISTS `Coocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coocks` (
  `food_id` int(11) NOT NULL,
  `chef_id` int(11) NOT NULL,
  KEY `fk_test4` (`chef_id`),
  KEY `fk_test15` (`food_id`),
  CONSTRAINT `fk_test15` FOREIGN KEY (`food_id`) REFERENCES `Food` (`food_id`) ON DELETE CASCADE,
  CONSTRAINT `Coocks_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `Food` (`food_id`),
  CONSTRAINT `Coocks_ibfk_2` FOREIGN KEY (`chef_id`) REFERENCES `Chef` (`chef_id`),
  CONSTRAINT `fk_test12` FOREIGN KEY (`food_id`) REFERENCES `Food` (`food_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_test3` FOREIGN KEY (`food_id`) REFERENCES `Food` (`food_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_test4` FOREIGN KEY (`chef_id`) REFERENCES `Chef` (`chef_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coocks`
--

LOCK TABLES `Coocks` WRITE;
/*!40000 ALTER TABLE `Coocks` DISABLE KEYS */;
INSERT INTO `Coocks` VALUES (3,5),(5,7),(6,8),(7,8),(8,8);
/*!40000 ALTER TABLE `Coocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(20) NOT NULL,
  `phone_no` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'aviji',9161484826),(2,'avi',9161484828),(3,'aviash',9161484829),(4,'abhishek',9961484829),(5,'abhiram',9261484829),(6,'sivendra',9861484829),(7,'anubhav',9161484829),(8,'gaurav',7860931206),(9,'Manji',9889962132),(10,'avin',9161484826),(11,'avin1',9161484826),(12,'Avijit',138792319),(13,'avinash2',9161484826),(14,'Avijit1',9161484826),(15,'Avijit1',9161484826);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food`
--

DROP TABLE IF EXISTS `Food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Food` (
  `food_name` varchar(20) NOT NULL,
  `food_price` int(11) NOT NULL,
  `food_id` int(11) NOT NULL AUTO_INCREMENT,
  `vat_nv` char(4) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122216 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food`
--

LOCK TABLES `Food` WRITE;
/*!40000 ALTER TABLE `Food` DISABLE KEYS */;
INSERT INTO `Food` VALUES ('chowmin',50,3,'3.0'),('burger',30,5,'3.0'),('rasgula',20,6,'3.0'),('pasta',40,7,'2.0'),('dosa',50,8,'3.0'),('Chart',20,9,'3.5'),('Chart',20,10,'3.5'),('Momos',20,13,'2.4'),('sdfffd',12,1220,'3.1'),('assssssd',21,2323,'2.3'),('sdfffd',12,122210,'3.1'),('sdfffd',12,122213,'3.1'),('chomin',20,122214,'4.2'),('Momos',50,122215,'3.0');
/*!40000 ALTER TABLE `Food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items`
--

DROP TABLE IF EXISTS `Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Items` (
  `item_name` varchar(20) NOT NULL,
  `item_price` float NOT NULL,
  `item_stock` int(11) NOT NULL,
  `veg_nonveg` char(8) NOT NULL,
  PRIMARY KEY (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items`
--

LOCK TABLES `Items` WRITE;
/*!40000 ALTER TABLE `Items` DISABLE KEYS */;
INSERT INTO `Items` VALUES ('burger',20,10,'veg'),('chandra',100,3,'None'),('Chiken',100,4,'None'),('chikenbutter',200,10,'non_veg'),('chikendopyaja',20,5,'non_veg'),('chikenshoup',20,1,'non_veg'),('chikentika',100,20,'non_veg'),('Coldrink',30,4,'None'),('maaggi',40,100,'veg'),('pasta1',2,10,'None'),('pasta2',2,10,'None'),('pasta3',2,10,'None'),('pasta4',2,10,'None'),('pasta5',2,10,'None'),('pasta8',2,10,'None'),('pata',30,10,'veg'),('Piza',30,4,'None'),('rasgula',200,20,'veg'),('rayata',100,5,'veg'),('Rice',100,10,'None'),('role',20,5,'veg'),('sauce',2,10,'None');
/*!40000 ALTER TABLE `Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Item`
--

DROP TABLE IF EXISTS `Order_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_Item` (
  `order_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  KEY `fk_test7` (`food_id`),
  KEY `fk_test8` (`order_id`),
  CONSTRAINT `fk_test7` FOREIGN KEY (`food_id`) REFERENCES `Food` (`food_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_test8` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `Order_Item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  CONSTRAINT `Order_Item_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `Food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Item`
--

LOCK TABLES `Order_Item` WRITE;
/*!40000 ALTER TABLE `Order_Item` DISABLE KEYS */;
INSERT INTO `Order_Item` VALUES (3,5),(4,5),(4,6),(5,6),(6,7),(7,8);
/*!40000 ALTER TABLE `Order_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `order_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `waiter_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_test1` (`waiter_id`),
  KEY `fk_test2` (`customer_id`),
  CONSTRAINT `fk_test1` FOREIGN KEY (`waiter_id`) REFERENCES `Waiter` (`waiter_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_test2` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`) ON DELETE CASCADE,
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`waiter_id`) REFERENCES `Waiter` (`waiter_id`),
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (2,2,12,3,4),(3,3,14,4,5),(4,3,20,5,6),(5,4,20,6,7),(6,5,50,6,8),(7,7,80,7,7);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Purchase`
--

DROP TABLE IF EXISTS `Purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Purchase` (
  `item_name` varchar(20) NOT NULL,
  `b_id` int(11) NOT NULL,
  KEY `fk_test9` (`b_id`),
  KEY `fk_test14` (`item_name`),
  CONSTRAINT `fk_test14` FOREIGN KEY (`item_name`) REFERENCES `Items` (`item_name`) ON DELETE CASCADE,
  CONSTRAINT `fk_test10` FOREIGN KEY (`item_name`) REFERENCES `Items` (`item_name`) ON DELETE CASCADE,
  CONSTRAINT `fk_test9` FOREIGN KEY (`b_id`) REFERENCES `Batch` (`b_id`) ON DELETE CASCADE,
  CONSTRAINT `Purchase_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `Items` (`item_name`),
  CONSTRAINT `Purchase_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `Batch` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Purchase`
--

LOCK TABLES `Purchase` WRITE;
/*!40000 ALTER TABLE `Purchase` DISABLE KEYS */;
INSERT INTO `Purchase` VALUES ('burger',1),('burger',1),('rayata',2),('maaggi',3),('rasgula',4),('role',5),('chikenbutter',6),('chikendopyaja',7),('chikentika',8),('chikenshoup',9),('pata',10);
/*!40000 ALTER TABLE `Purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Waiter`
--

DROP TABLE IF EXISTS `Waiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Waiter` (
  `waiter_id` int(11) NOT NULL AUTO_INCREMENT,
  `waiter_name` varchar(20) NOT NULL,
  `waiter_salary` int(11) NOT NULL,
  `waiter_aderess` varchar(20) NOT NULL,
  `phone_no` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`waiter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Waiter`
--

LOCK TABLES `Waiter` WRITE;
/*!40000 ALTER TABLE `Waiter` DISABLE KEYS */;
INSERT INTO `Waiter` VALUES (4,'raju',1000,'lanka',9665781821),(5,'vinod',1000,'lanka',9765781821),(6,'vinay',1000,'lanka',9965781821),(7,'vinayak',1000,'lanka',9165781821),(8,'shekhar',1000,'lanka',9265781821),(10,'Raj',10000,'None',9161727623),(12,'avi',20000,'BHU',9889962132),(15,'rajat',1200,'lanka',1234567890),(17,'avi',2000,'BHU',9161484826),(18,'avi',2000,'BHU',9161484826),(19,'avi',10000,'BHU',9161727623),(20,'avi',3000,'BHU',9698237828),(21,'avi',10000,'BHU',9161727623),(22,'Satish',5000,'Varansi',9698237828),(23,'Satish',5000,'Varansi',9698237828),(24,'Satish',5000,'Varansi',9698237828),(25,'Rajesh',1000,'Varansi',9161727625),(26,'Rajesh',1000,'Varansi',9161727625);
/*!40000 ALTER TABLE `Waiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add page',8,'add_page'),(23,'Can change page',8,'change_page'),(24,'Can delete page',8,'delete_page');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$R6EFRP01fXfP$79WC7kKi4XO3FEwhqhY5s4oVbYzKw6IHGhYo+TwJcEs=','2016-10-20 18:35:25',1,'avinash','','','avinash.kumar.cse14@itbhu.ac.in',1,1,'2016-10-20 18:35:25'),(2,'pbkdf2_sha256$12000$HLzoNVKHFYtm$geqA1aIyeNXSa2c5QY2mUHtYAXIHjFoUgBOy6He13gc=','2016-10-22 06:58:05',0,'avinash1','','','',0,1,'2016-10-22 06:58:05'),(3,'pbkdf2_sha256$12000$KuHgcA8OYEFs$8ykky+cRtL7o+V8jef/Qzxsb0UTXumVGvtmRUhiLmm0=','2016-10-22 07:32:32',0,'afgssjjj','','','',0,1,'2016-10-22 07:32:32'),(5,'pbkdf2_sha256$12000$dUJJ1jxcuAC4$JP+nKJAwOI6qjZOr2Wb8aHSP8UZvboMIcVdHCUYKKTc=','2016-10-23 11:51:25',0,'g2','','','',0,1,'2016-10-23 11:51:25'),(6,'pbkdf2_sha256$12000$7RyKq3O4ScgD$iNCQHO6srlhlI1KBqGhmEXaa074m6+rVPJDoICv0O70=','2016-10-23 11:53:05',0,'g21','','','',0,1,'2016-10-23 11:53:05'),(7,'pbkdf2_sha256$12000$yMEh0jOrEt3F$oV2YcdEIcotrxKf/pFVB78j+EZuLQPzTez59cWNSenc=','2016-10-23 11:54:09',0,'g22','','','',0,1,'2016-10-23 11:54:09'),(8,'pbkdf2_sha256$12000$2VldPpUb3KYR$P/pxzme0hqiBGDc4GEGJfu+Xn9CaPkLJTygOQVWk1ZY=','2016-10-23 11:54:44',0,'g23','','','',0,1,'2016-10-23 11:54:44'),(9,'pbkdf2_sha256$12000$jtOnhBVjQjaS$LHeuwi4qOgYpgWBzbAanuoPYQBO1avzscpLJ3eB+XIg=','2016-10-23 12:00:30',0,'avi','','','',0,1,'2016-10-23 12:00:30'),(10,'pbkdf2_sha256$12000$t3R84nnJFQxE$gLAZ/LLjfWrTxWceNPFO5MPw/haG08L11D5jT731uW4=','2016-10-23 12:12:27',0,'man','','','',0,1,'2016-10-23 12:12:27'),(11,'pbkdf2_sha256$12000$RdGLYz4222XU$dbNIfQRoCD0lpnO2R1rIcM1eNQC4ZiXL+YcmKjD6ayM=','2016-10-23 12:29:50',0,'man1','','','',0,1,'2016-10-23 12:29:35'),(12,'pbkdf2_sha256$12000$RHziaxQyYPbR$BvkkAURbQawdFe6e8tfyZ3Rzz6KttAVbxoWYgPzeqOw=','2016-10-26 09:56:40',0,'avijit','','','',0,1,'2016-10-24 09:23:23'),(13,'pbkdf2_sha256$12000$DECiVzjmkzYb$vt+3HfcUVpIBYDW0VJpYfQ1byGf0FE+qscX5AtGzl3c=','2016-10-26 06:50:43',0,'avinash2','','','',0,1,'2016-10-26 06:50:14'),(14,'pbkdf2_sha256$12000$ozHBogfqBsB1$GXxtPJkT5Y2Trx/Pn2FkDNV/csrNzXz13QJUakr0YqU=','2016-10-26 09:55:30',0,'avijit2','','','',0,1,'2016-10-26 09:55:30'),(15,'pbkdf2_sha256$12000$OhD6J0ZhlOTI$FIYWWQVu+fbNkxNx9UBwBfgW2PH7vlpIneADN+Foqis=','2016-10-26 09:56:26',0,'avijit3','','','',0,1,'2016-10-26 09:56:26');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'category','newletter','category'),(8,'page','newletter','page');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('zcvy5lc6vgydt82h6wf5vabhuzizij72','OWRlNWZiOWFhNTY4M2RkYTMwNzExZTczMDE0OGQ4MGYyM2U2MTFkZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTJ9','2016-11-09 09:56:40');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newletter_category`
--

DROP TABLE IF EXISTS `newletter_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newletter_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newletter_category`
--

LOCK TABLES `newletter_category` WRITE;
/*!40000 ALTER TABLE `newletter_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `newletter_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newletter_page`
--

DROP TABLE IF EXISTS `newletter_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newletter_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(200) NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `newletter_page_6f33f001` (`category_id`),
  CONSTRAINT `category_id_refs_id_08e53476` FOREIGN KEY (`category_id`) REFERENCES `newletter_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newletter_page`
--

LOCK TABLES `newletter_page` WRITE;
/*!40000 ALTER TABLE `newletter_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `newletter_page` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-26 16:06:47
