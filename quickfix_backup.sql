-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: quickfix-db.mysql.database.azure.com    Database: quickfix
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `activity_statuses`
--

DROP TABLE IF EXISTS `activity_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_statuses`
--

LOCK TABLES `activity_statuses` WRITE;
/*!40000 ALTER TABLE `activity_statuses` DISABLE KEYS */;
INSERT INTO `activity_statuses` VALUES (1,'Pending request'),(2,'Active'),(3,'Inactive'),(4,'Access denied');
/*!40000 ALTER TABLE `activity_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `category_description` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Water Supply','Lack of water supply in the residence.'),(2,'Electrical Failures','Persistent electrical failures in the residence\'s wiring.'),(3,'Heating System','Malfunction in the residence\'s heating system.'),(4,'Cooling system','Inadequate cooling system in the residence.'),(5,'Garbage Collection','Missed garbage collection in the residence.'),(6,'Roof Leakage','Leakage issues in the residence\'s roof.'),(7,'Infestation','Pest infestation problem in the residence.'),(8,'Plumbing','related to plumbing systems, including issues with pipes, drains, faucets, toilets, and other water-related fixtures.'),(9,'Maintenance','Related with repairing services'),(10,'Noise','Excessive noice caused by neighboors'),(11,'Security','No description provided'),(12,'Parking','No description provided');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `complaint_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `complaint_title` varchar(255) NOT NULL,
  `complaint_description` text NOT NULL,
  `complaint_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `complaint_status` enum('Open','In Progress','Closed') DEFAULT 'Open',
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (36,1,1,'Water Supply','There has been a consistent lack of water supply in my apartment for the past week. Despite multiple reports, the issue has not been resolved, and it\'s causing significant inconvenience.\n','2023-11-14 18:36:58','Open'),(37,1,2,'Electrical Failures','We are facing persistent electrical failures in the residence\'s wiring. The power outage occurs frequently, posing a safety risk and disrupting our daily activities.\n','2023-11-14 18:36:58','Open'),(38,1,3,'Heating System','The heating system in our residence is malfunctioning, making it unbearable during the colder months. We urgently need a repair to restore proper functionality.\n','2023-11-14 18:36:58','Open'),(51,2,2,'Maintenance request','We\'ve been experiencing problems with our electricity installation, we urgently need someone to fix it.','2023-11-20 08:58:43','Open'),(65,2,4,'Title','Description','2023-11-21 21:42:01','Open'),(66,2,2,'Some title','Some desc','2023-11-26 00:42:25','Open');
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints_history`
--

DROP TABLE IF EXISTS `complaints_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_id` int DEFAULT NULL,
  `complaint_id` int NOT NULL,
  `status_id` int NOT NULL,
  `admin_id` int NOT NULL,
  `employee_comment` text NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `employee_id` (`employee_id`),
  KEY `complaint_id` (`complaint_id`),
  KEY `status_id` (`status_id`),
  KEY `fk_admin_id` (`admin_id`),
  CONSTRAINT `complaints_history_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `complaints_history_ibfk_2` FOREIGN KEY (`complaint_id`) REFERENCES `complaints_test` (`id`),
  CONSTRAINT `complaints_history_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `complaints_status` (`id`),
  CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints_history`
--

LOCK TABLES `complaints_history` WRITE;
/*!40000 ALTER TABLE `complaints_history` DISABLE KEYS */;
INSERT INTO `complaints_history` VALUES (1,'Your complaint was assigned to an employee.','2023-12-07 22:28:18',13,1,2,1,'Fix this');
/*!40000 ALTER TABLE `complaints_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints_status`
--

DROP TABLE IF EXISTS `complaints_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints_status`
--

LOCK TABLES `complaints_status` WRITE;
/*!40000 ALTER TABLE `complaints_status` DISABLE KEYS */;
INSERT INTO `complaints_status` VALUES (1,'Open'),(2,'Assigned'),(3,'In progress'),(4,'Closed'),(5,'Rejected');
/*!40000 ALTER TABLE `complaints_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints_test`
--

DROP TABLE IF EXISTS `complaints_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints_test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `submitted_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_category_id` (`category_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints_test`
--

LOCK TABLES `complaints_test` WRITE;
/*!40000 ALTER TABLE `complaints_test` DISABLE KEYS */;
INSERT INTO `complaints_test` VALUES (1,1,3,'Example of complaint','A very long description to show the space required for the complaint description','2023-12-06 03:06:51'),(2,1,1,'No water','I have no water since yesterday','2024-01-06 09:07:34'),(3,2,10,'I can\'t sleep','My neighbors are doing a lot of noise, please send staff.','2024-01-06 23:42:43');
/*!40000 ALTER TABLE `complaints_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residences`
--

DROP TABLE IF EXISTS `residences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `residences` (
  `residence_id` int NOT NULL AUTO_INCREMENT,
  `residential_id` int NOT NULL,
  `owner_user_id` int DEFAULT NULL,
  `tenant_user_id` int DEFAULT NULL,
  `zip_code` int NOT NULL,
  `street_name` varchar(255) NOT NULL,
  `street_number` int NOT NULL,
  `details` varchar(255) NOT NULL,
  `status` enum('occupied','available') DEFAULT 'available',
  PRIMARY KEY (`residence_id`),
  KEY `residential_id` (`residential_id`),
  KEY `owner_user_id` (`owner_user_id`),
  KEY `tenant_user_id` (`tenant_user_id`),
  CONSTRAINT `residences_ibfk_1` FOREIGN KEY (`residential_id`) REFERENCES `residentials` (`residential_id`),
  CONSTRAINT `residences_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `residences_ibfk_3` FOREIGN KEY (`tenant_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residences`
--

LOCK TABLES `residences` WRITE;
/*!40000 ALTER TABLE `residences` DISABLE KEYS */;
INSERT INTO `residences` VALUES (1,1,9,40,20299,'Lisitea',162,'no description provided','occupied'),(2,1,9,1,20299,'Lisitea',160,'No description provided','available'),(3,3,9,8,20326,'Av. Bosque Sereno',163,'No desciption','available');
/*!40000 ALTER TABLE `residences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residentials`
--

DROP TABLE IF EXISTS `residentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `residentials` (
  `residential_id` int NOT NULL AUTO_INCREMENT,
  `residential_name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  PRIMARY KEY (`residential_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residentials`
--

LOCK TABLES `residentials` WRITE;
/*!40000 ALTER TABLE `residentials` DISABLE KEYS */;
INSERT INTO `residentials` VALUES (1,'Lunaria','Mexico','Aguascalientes','Aguascalientes'),(2,'Santa Mónica','Mexico','Aguascalientes','Aguascalientes'),(3,'Bosque sereno','Mexico','Aguascalientes','Aguascalientes'),(4,'Punta del cielo','Mexico','Aguascalientes','Aguascalientes');
/*!40000 ALTER TABLE `residentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'resident'),(2,'admin'),(3,'dev'),(5,'test'),(6,'employee'),(7,'owner'),(8,'tenant'),(9,'example role'),(10,'example role 1');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `status_id` int DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_status_id` (`status_id`),
  CONSTRAINT `fk_status_id` FOREIGN KEY (`status_id`) REFERENCES `activity_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juan','Hernandez','quickfixdev1@gmail.com','4491882083',2,'https://lh3.googleusercontent.com/a/ACg8ocLmAdSXyBH3NEiQzFeLZMBIMdx4zKoK1OPPqf4dlJKs_g=s96-c'),(2,'resident','user','quickfixresident@gmail.com','2345556789',2,'https://lh3.googleusercontent.com/a/ACg8ocJkeZVMyuSwq67dvRWKMJlffl_bTUGK6x7VWvjyvPsADQ=s96-c'),(4,'Gerardo','Díaz','gerardodiaz@cetis155.edu.mx','+52 1 449 100 8056',2,NULL),(8,'tenant','user','tenant@gmail.com','2345556789',2,NULL),(9,'owner','user','owner@gmail.com','2345556789',2,NULL),(11,'admin','user','quickfixadmon1@gmail.com','4491882083',2,'https://lh3.googleusercontent.com/a/ACg8ocLor2ok3cxxhnEM07l5hmWiNB6CmMLzKS9HGCEK1zybbw=s96-c'),(12,'user for','test','quickfixtesting@gmail.com','4491882083',2,NULL),(13,'employee','user','employee@gmail.com','2345556789',2,NULL),(14,'Martin','Contreras','martin.contreras.romo@cetis155.edu.mx','5214491118793',2,NULL),(15,'admin','User','email@example.com','1234324324',4,NULL),(16,'admin','User','email@example.com','1234324324',4,NULL),(17,'admin','User','email@example.com','1234324324',4,NULL),(18,'admin','User','email@example.com','1234324324',4,NULL),(19,'admin','User','email@example.com','1234324324',4,NULL),(20,'admin','User','email@example.com','1234324324',4,NULL),(21,'admin','User','email@example.com','1234324324',4,NULL),(22,'admin','User','email@example.com','1234324324',4,NULL),(23,'req','test','r@sum.com','01010101010',4,NULL),(24,'req','test','r@sum.com','01010101010',4,NULL),(25,'req','test','r@sum.com','01010101010',4,NULL),(26,'req','test','r@sum.com','01010101010',4,NULL),(27,'req','test','r@sum.com','01010101010',4,NULL),(28,'req','test','r@sum.com','01010101010',4,NULL),(29,'req','test','r@sum.com','01010101010',4,NULL),(30,'req','User','re@sum.com','1212121212',4,NULL),(31,'req','User','re@sum.com','1212121212',4,NULL),(32,'requ','test','req@sum.com','12121232123',4,NULL),(33,'requ','test','req@sum.com','12121232123',4,NULL),(34,'requ','test','req@sum.com','12121232123',4,NULL),(35,'requ','test','req@sum.com','12121232123',4,NULL),(36,'requ','test','requ@sum.com','13',4,NULL),(37,'requ','test','requ@sum.com','13',4,NULL),(38,'requ','test','requ@sum.com','13',4,NULL),(39,'create','test','email@example.com','1230981230',2,NULL),(40,'test','user','email@example.com','1234324324',2,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `users_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (2,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(11,2),(1,3),(4,3),(12,3),(14,3),(40,5),(13,6),(9,7),(8,8);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-22 19:39:31
