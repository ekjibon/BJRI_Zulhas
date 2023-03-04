-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: bjri_salary
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedById` varchar(767) DEFAULT NULL,
  `CreatedDateTime` datetime NOT NULL,
  `UpdatedById` varchar(767) DEFAULT NULL,
  `UpdatedDateTime` datetime DEFAULT NULL,
  `Name` text,
  `Address` text,
  `StationType` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `IX_Stations_CreatedById` (`CreatedById`),
  KEY `IX_Stations_UpdatedById` (`UpdatedById`),
  CONSTRAINT `FK_Stations_AspNetUsers_CreatedById` FOREIGN KEY (`CreatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Stations_AspNetUsers_UpdatedById` FOREIGN KEY (`UpdatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'0134a893-6704-4344-9134-31ae1ffea21c','2023-01-01 16:13:35',NULL,NULL,'Dhaka','Dhaka',0),(2,'0134a893-6704-4344-9134-31ae1ffea21c','2023-01-01 16:13:35',NULL,NULL,'Rangpur','Rangpur',1),(3,'0134a893-6704-4344-9134-31ae1ffea21c','2023-01-01 16:13:35',NULL,NULL,'Kishoreganj','Kishoreganj',2),(4,'0134a893-6704-4344-9134-31ae1ffea21c','2023-01-01 16:13:35',NULL,NULL,'Manikganj','Manikganj',2),(5,'0134a893-6704-4344-9134-31ae1ffea21c','2023-01-01 16:13:35',NULL,NULL,'Faridpur','Faridpur',2),(6,'0134a893-6704-4344-9134-31ae1ffea21c','2023-01-01 16:13:35',NULL,NULL,'Manirampur','Manirampur',2),(7,'0134a893-6704-4344-9134-31ae1ffea21c','2023-01-01 16:13:35',NULL,NULL,'Cumilla','Cumilla',2),(8,'0134a893-6704-4344-9134-31ae1ffea21c','2023-01-01 16:13:35',NULL,NULL,'Narayanganj','Narayanganj',2),(9,'0134a893-6704-4344-9134-31ae1ffea21c','2023-01-01 16:13:35',NULL,NULL,'Patuakhali','Patuakhali',2),(10,'0134a893-6704-4344-9134-31ae1ffea21c','2023-01-01 16:13:35',NULL,NULL,'Jamalpur','Jamalpur',2),(11,'0134a893-6704-4344-9134-31ae1ffea21c','2023-01-01 16:13:35',NULL,NULL,'Dinajpur','Dinajpur',2);
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 13:21:35
