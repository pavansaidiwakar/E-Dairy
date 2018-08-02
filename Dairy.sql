CREATE DATABASE  IF NOT EXISTS `diary` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `diary`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: diary
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `pin` int(6) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin1',' Pavan','4321','9876543212','admin1@gmail.com','1997-12-14','Marathahalli',560045),('admin2','Nithin','4321','9066857806','admin2@gmail.com','1997-09-24','Kengeri',560059);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_orders`
--

DROP TABLE IF EXISTS `bulk_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_orders` (
  `bulk_id` int(11) NOT NULL AUTO_INCREMENT,
  `purpose` varchar(200) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(45) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `cp_name` varchar(20) NOT NULL,
  `cp_email` varchar(45) NOT NULL,
  `cp_mobile` varchar(10) NOT NULL,
  `approved` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bulk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_orders`
--

LOCK TABLES `bulk_orders` WRITE;
/*!40000 ALTER TABLE `bulk_orders` DISABLE KEYS */;
INSERT INTO `bulk_orders` VALUES (1,'marriage','rvce','Bengaluru Rural','577004','nithin','nhk@g.com','9066857806',1),(2,'birthday','rvcec','bangalore','577004','sachin','as@gmail.com','9088776654',1),(3,'inauguration','bmsce','kengeri','560059','pavan','ap@g.com','9099887766',1),(4,'pooja','bnmit','banalore','578899','harish','as@j.com','9098776655',0),(5,'birthday','jnnce','mysore','578899','kedar','af@g.com','9099887766',1),(6,'marriage','kengeri ','Bengaluru Rural','577004','nithin','ndsnmmsd27@gmail.com','9874562587',0),(7,'New Year Party','MG Road','Bengaluru','560040','Ram','ram@gmail.com','9834652772',1);
/*!40000 ALTER TABLE `bulk_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `name` varchar(50) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `main_mobile` double NOT NULL,
  `dob` varchar(10) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(15) NOT NULL,
  `pincode` int(6) unsigned NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('gandhi','gandhi@g.com','1234',9878965434,'2017-11-01','M','rvce ','Bengaluru North',560059),('manu shree','manunutheti@gmail.com','manuktm0007',9035687989,'2000-10-04',NULL,'vidyaranyapura','Bengaluru North',560097),('manya','manya@gmail.com','1234',7894561232,'2017-11-17',NULL,'malleshwaram','Bengaluru',560045),('pavan','npsd99@gmail.com','1234',9876543214,'2017-11-08',NULL,'bengaluru\r\nkarnataka','Bengaluru',560059),('ramesh','p1@g.com','1234',9876543212,'2017-11-01',NULL,'rvce','Bengaluru',561478),('nithin','p2@g.com','1234',9.08765455678797e19,'2017-11-03',NULL,'rvce','Bengaluru North',560057),('pavan','p@g.com','1234',9876543210,'2017-01-03','M','rvce','Bengaluru',560059),('Raj','raj@g.com','1234',9087654321,'24/12/1996','M','bengaluru','Bengaluru',560059),('raj','raj@gmail.com','1234',9012345678,'24/09/1997','M','rvce','Bengaluru',560059),('ram','ram@g.com','1234',9087654321,'24/12/1996','F','bengaluru','Bengaluru',560059),('vignesh','vignesh@gmail.com','1234',9632587415,'1956-11-10','M','nagarabhavi','Bengaluru',560013),('vishwanath','vishwa@gmail.com','1234',9876543691,'1996-06-12',NULL,'marathahalli','Bengaluru East',568974),('virat','vk2@g.com','1234',9632587415,'2016-07-28','M','rvce','Bengaluru',560087);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_subscription`
--

DROP TABLE IF EXISTS `customer_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_subscription` (
  `cust_email` varchar(45) NOT NULL,
  `sub_id` varchar(10) NOT NULL,
  `delivery` varchar(10) DEFAULT NULL,
  `outlet` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_subscription`
--

LOCK TABLES `customer_subscription` WRITE;
/*!40000 ALTER TABLE `customer_subscription` DISABLE KEYS */;
INSERT INTO `customer_subscription` VALUES ('p@g.com','1','db003','o001'),('vignesh@gmail.com','2','3','o004'),('npsd99@gmail.com','3','2','o002');
/*!40000 ALTER TABLE `customer_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `dbid` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `oid` varchar(10) NOT NULL,
  PRIMARY KEY (`dbid`),
  KEY `oid_idx` (`oid`),
  CONSTRAINT `oid` FOREIGN KEY (`oid`) REFERENCES `outlet` (`oid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES ('db001','Ravi','20/1/1990','9876234510','4th T Block, Jayanagar, Bengaluru','o004'),('db002','Raju','20/1/1990','7895634567','Yelahanka, Bengaluru','o002'),('db003','Venkatesh','20/1/1990','9807864578','R V College','o001'),('db004','Ramesh','20/1/1990','8881456785','Kengeri','o003'),('db005','Suresh','20/1/1990','8147774980','Vijayangar','o006'),('db006','Ganesh','20/1/1990','9743447534','Yeshwanthpur','o005');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery1`
--

DROP TABLE IF EXISTS `delivery1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery1` (
  `staff_id` int(11) NOT NULL,
  `oid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery1`
--

LOCK TABLES `delivery1` WRITE;
/*!40000 ALTER TABLE `delivery1` DISABLE KEYS */;
INSERT INTO `delivery1` VALUES (2,'o002'),(3,'o004');
/*!40000 ALTER TABLE `delivery1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_email` varchar(45) NOT NULL,
  `feedback_text` varchar(200) NOT NULL,
  `resolved` int(11) DEFAULT '0',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'p@g.com','packaging can be taken care of properly,good.',1),(2,'nhk@g.com','give offers for regular customers.',1),(3,'gandhi@g.com','deliver in the early morning',1),(4,'npsd99@gmail.com','i\'m not getting the products i mentioned in subscription',0),(5,'gandhi@g.com','nice products',1),(6,'p@g.com','how many days are remaining from my subscription?',0);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outlet`
--

DROP TABLE IF EXISTS `outlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outlet` (
  `oid` varchar(10) NOT NULL,
  `area` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `pin` int(6) NOT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outlet`
--

LOCK TABLES `outlet` WRITE;
/*!40000 ALTER TABLE `outlet` DISABLE KEYS */;
INSERT INTO `outlet` VALUES ('o001','R V College','7896457348',560045),('o002','Yelahanka','9874635467',560059),('o003','Kengeri','9872364758',560060),('o004','4th T Block, jayanagar, Bengaluru','9827381234',560013),('o005','Yeshwanthpur','771257873',560074),('o006','Vijayanagar','8595346783',560071);
/*!40000 ALTER TABLE `outlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_variants` (
  `prodid` varchar(10) NOT NULL,
  `variants` varchar(10) NOT NULL,
  `price` varchar(10) NOT NULL,
  PRIMARY KEY (`prodid`,`variants`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variants`
--

LOCK TABLES `product_variants` WRITE;
/*!40000 ALTER TABLE `product_variants` DISABLE KEYS */;
INSERT INTO `product_variants` VALUES ('ch001','150','200'),('fp001','1000','20'),('fp001','500','10'),('fp002','100','100'),('fp002','200','200'),('fp002','300','300'),('fp003','500','100'),('fp004','250','50'),('fp004','500','100'),('fp005','250','70'),('fp005','400','120'),('fp005','800','350'),('fp006','1000','400'),('gb001','100','200'),('gb001','200','400'),('gb001','300','600'),('gb002','250','100'),('gb002','500','200'),('ic001','100','50'),('ic002','100','50'),('ic002','50','30'),('ic003','100','50'),('ic004','100','50'),('ic005','100','10'),('ic005','200','20'),('ml001','1000','40'),('ml001','500','20'),('ml002','1000','50'),('ml002','500','25'),('ml003','1000','35'),('ml003','500','20'),('ml004','1000','30'),('ml004','500','15'),('ml005','1000','36'),('ml005','500','18'),('ml006','1000','60'),('ml006','500','30'),('mp001','200','200'),('mp001','300','150'),('mp002','300','4000'),('mp003','250','150'),('ms001','200','250'),('ms001','250','300'),('ms002','200','250'),('ms003','200','250'),('ms004','100','200'),('ms005','300','500'),('np001','250','50'),('np001','500','100'),('op001','100','250'),('op001','150','300'),('op002','100','200'),('op003','250','90'),('op003','500','120'),('op004','250','400'),('op004','500','800'),('op005','150','30'),('op006','500','200');
/*!40000 ALTER TABLE `product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `pid` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(30) NOT NULL,
  `shelf_life` int(11) NOT NULL,
  `image_link` varchar(100) DEFAULT 'assets/img/default.png',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('ch001','Eclairs Chocolate Pack','Chocolates',30,'assets/img/Chocolate.png'),('fp001','Curd','Fermented Products',3,'assets/img/setcurd.jpeg'),('fp002','Butter Milk','Fermented Products',4,'assets/img/butter-milk.jpg'),('fp003','Sweet Lassi','Fermented Products',10,'assets/img/sweet-lassi.png'),('fp004','Mango Lassi','Fermented Products',10,'assets/img/mangolassi.jpeg'),('fp005','Yogurt','Fermented Products',10,'assets/img/yogurt.png'),('fp006','Shrikhand Elaichi Flavoured','Fermented Products',15,'assets/img/shirkhand.jpeg'),('gb001','Butter Salted','Ghee and Butter',30,'assets/img/butter_salted.jpeg'),('gb002','Butter Unsalted','Ghee and Butter',30,'assets/img/butter_unsalted.jpeg'),('ic001','Black Current','Ice-Creams',30,'assets/img/Black_Currant.png'),('ic002','Butter Scotch','Ice-Creams',30,'assets/img/Butter_Scotch.png'),('ic003','Chocolate','Ice-Creams',30,'assets/img/chocolate_ice.png'),('ic004','Kaju Draksh','Ice-Creams',30,'assets/img/Kaju_Draks.png'),('ic005','Mango','Ice-Creams',20,'assets/img/Mango.png'),('ml001','Pasteurised Toned Milk','Milk',2,'assets/img/pasteurised-toned-milk.png'),('ml002','Double Toned Milk','Milk',2,'assets/img/double-toned-milk.png'),('ml003','Homogenised Cow\'s Pure Milk','Milk',2,'assets/img/homogenised-cow\'s-milk.png'),('ml004','Special Toned Milk','Milk',2,'assets/img/nsm_0.png'),('ml005','Shubham Gold Milk','Milk',2,'assets/img/shubham-gold.png'),('ml006','Homogenised Toned Milk','Milk',2,'assets/img/homogenised-toned-milk.png'),('mp001','Badam Milk Mix','Milk Products',20,'assets/img/badammilk_mix.jpg'),('mp002','Dairy Whitener','Milk Products',20,'assets/img/dairywhitener.jpeg'),('mp003','Skimmed Milk Powder','Milk Products',30,'assets/img/skimmed_milk.png'),('ms001','Badam Burfi','Sweets',30,'assets/img/badamburfi.jpeg'),('ms002','Besan Laddoo','Sweets',30,'assets/img/besanladoo.jpeg'),('ms003','Cashew Burfi','Sweets',30,'assets/img/cashew_burfi.jpg'),('ms004','Chocolate Burfi','Sweets',30,'assets/img/chocolate_burfi.jpg'),('ms005','Mysore Pak','Sweets',30,'assets/img/mysorepak.jpeg'),('np001','dairymilk','Chocolate',120,NULL),('op001','Cheese','Other Products',15,'assets/img/cheese.jpeg'),('op002','Diced Paneer','Other Products',15,'assets/img/diced_paneer.jpg'),('op003','Flaovoured Milk','Other Products',20,'assets/img/strawberry.jpeg'),('op004','Paneer','Other Products',20,'assets/img/panner.jpeg'),('op005','Good Life Tetra','Other Products',10,'assets/img/milk.jpeg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products1`
--

DROP TABLE IF EXISTS `products1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products1` (
  `pid` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(30) NOT NULL,
  `shelf_life` int(11) NOT NULL,
  `image_link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products1`
--

LOCK TABLES `products1` WRITE;
/*!40000 ALTER TABLE `products1` DISABLE KEYS */;
INSERT INTO `products1` VALUES ('fp001','Curd','Fermented Products',3,'curd.jpg'),('fp002','Butter Milk','Fermented Products',4,'butter-milk.jpg'),('fp003','Sweet Lassi','Fermented Products',10,'sweet-lassi.png'),('fp004','Mango Lassi','Fermented Products',10,'mango-lassi'),('fp005','Yogurt','Fermented Products',10,'yogurt.png'),('fp006','Shrikhand Elaichi Flavoured','Fermented Products',15,'shrikhand-elaichi-flavoured.png'),('gb001','Butter Salted','Ghee and Butter',30,'butter-salted.png'),('ml001','Pasteurised Toned Milk','Milk',2,'pasteurised-toned-milk.png'),('ml002','Double Toned Milk','Milk',2,'double-toned-milk.png'),('ml003','Homogenised Cow\'s  Milk','Milk',2,'homogenised-cow\'s-milk.png'),('ml004','Special Toned Milk','Milk',2,'special-toned-milk.png'),('ml005','Shubham Gold Milk','Milk',2,'shubham-gold-milk.png'),('ml006','Homogenised Toned Milk','Milk',2,'homogenised-toned-milk.png');
/*!40000 ALTER TABLE `products1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `name` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `dept` varchar(15) NOT NULL,
  `salary` int(7) NOT NULL,
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('tyson','1234','9876543211','st1@g.com','2015-11-11','brigade road','maintainence',55000,1),('warner','1234','9988774455','st2@g.com','1976-05-14','abids','delivery',25000,2),('mukesh','1234','9955662244','st3@g.com','1965-05-15','kengeri','delivery',25000,3),('rajesh','1234','9966112255','st4@g.com','1987-04-23','nagarabhavi','marketing',80000,4),('jadeja','1234','9874561234','jaddu@gmail.com','2017-11-10','rajasthan','Deputy Manager',800001,6),('Mallikarjuna','1234','9876543212','mallikarjuna@gmail.com','2017-11-08','karnataka','Marketing',55000,7),('rama','1234','9874561234','hello@gmail.com','2015-12-12','majestic','Marketing',50000,8),('Dilip','1234','9876543456','dilip12@gmail.com','1985-11-29','Jayanagar','Delivery',30000,9),('Nagaraj','1234','9847584859','nagaraj1@gmail.com','1978-08-26','Vijayanagar','Maintainenece',50000,10);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `sid` varchar(10) NOT NULL,
  `productid` varchar(10) NOT NULL,
  `variant` varchar(10) NOT NULL,
  `quantity` int(5) NOT NULL,
  `period` int(2) NOT NULL,
  `added_date` timestamp(5) NOT NULL DEFAULT CURRENT_TIMESTAMP(5),
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sid`,`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES ('1','fp003','500',3,5,'2017-11-12 22:02:21.19121','[1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 3, 0, 0, 0, 0]'),('1','fp006','1000',1,8,'2017-11-12 22:02:21.19121','[1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0]'),('1','ml001','500',2,50,'2017-11-12 22:02:21.28528','[30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]'),('1','ml006','500',4,50,'2017-11-12 22:02:21.28628','[30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]'),('2','fp002','100',1,2,'2017-11-29 13:33:45.79603','[1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0]'),('2','ml001','1000',1,1,'2017-11-29 13:33:45.89682','[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]'),('2','mp001','200',2,20,'2017-11-29 13:33:45.94974','[2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0]'),('2','op004','250',1,5,'2017-11-29 13:33:46.01580','[1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0]'),('3','ch001','150',1,30,'2017-11-29 14:38:52.09465','[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]'),('3','fp001','1000',3,30,'2017-11-29 14:38:52.22984','[3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]');
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `cust_email` varchar(45) NOT NULL,
  `type` varchar(40) NOT NULL,
  `id` varchar(10) NOT NULL,
  `amount` int(11) NOT NULL,
  `paid_date` timestamp(5) NOT NULL DEFAULT CURRENT_TIMESTAMP(5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES ('p@g.com','instant order','1',100,'2017-11-26 14:19:33.90215'),('p@g.com','instant order','2',630,'2017-11-26 14:36:47.42300'),('nitessh@gmail.com','instant order','3',3530,'2017-11-26 14:50:31.09250'),('p@g.com','instant order','4',560,'2017-11-26 16:23:45.42640'),('p@g.com','instant order','5',2840,'2017-11-28 10:06:42.84084'),('p@g.com','instant order','6',1430,'2017-11-28 17:29:21.59171'),('p@g.com','instant order','7',780,'2017-11-29 10:02:29.41170');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions_details`
--

DROP TABLE IF EXISTS `transactions_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions_details` (
  `inst_id` varchar(10) NOT NULL,
  `prodid` varchar(10) NOT NULL,
  `variant` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_details`
--

LOCK TABLES `transactions_details` WRITE;
/*!40000 ALTER TABLE `transactions_details` DISABLE KEYS */;
INSERT INTO `transactions_details` VALUES ('1','fp001','1000',3),('1','ml001','1000',1),('2','gb001','100',5),('2','ic001','100',1),('3','ch001','150',17),('3','ic003','100',1),('4','ch001','150',2),('4','fp001','1000',1),('4','fp002','100',1),('4','fp003','500',1),('5','ch001','150',12),('5','ms004','100',1),('5','ms005','300',1),('5','op003','500',1),('6','gb001','300',1),('6','mp001','300',1),('6','mp002','300',1),('6','ms002','200',1),('6','ms005','300',1),('7','mp002','300',1),('7','mp003','250',1),('7','ms002','200',1),('7','ms003','200',1);
/*!40000 ALTER TABLE `transactions_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-30  5:45:40
