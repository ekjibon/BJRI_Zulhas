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
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedById` varchar(767) DEFAULT NULL,
  `CreatedDateTime` datetime NOT NULL,
  `UpdatedById` varchar(767) DEFAULT NULL,
  `UpdatedDateTime` datetime DEFAULT NULL,
  `Name` text,
  PRIMARY KEY (`Id`),
  KEY `IX_Grades_CreatedById` (`CreatedById`),
  KEY `IX_Grades_UpdatedById` (`UpdatedById`),
  CONSTRAINT `FK_Grades_AspNetUsers_CreatedById` FOREIGN KEY (`CreatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Grades_AspNetUsers_UpdatedById` FOREIGN KEY (`UpdatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-1'),(2,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-2'),(3,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-3'),(4,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-4'),(5,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-5'),(6,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-6'),(7,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-7'),(8,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-8'),(9,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-9'),(10,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-10'),(11,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-11'),(12,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-12'),(13,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-13'),(14,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-14'),(15,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-15'),(16,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-16'),(17,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-17'),(18,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-18'),(19,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-19'),(20,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,'Grade-20');
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 13:21:28
