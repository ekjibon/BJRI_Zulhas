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
-- Table structure for table `gradwisepayscales`
--

DROP TABLE IF EXISTS `gradwisepayscales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gradwisepayscales` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedById` varchar(767) DEFAULT NULL,
  `CreatedDateTime` datetime NOT NULL,
  `UpdatedById` varchar(767) DEFAULT NULL,
  `UpdatedDateTime` datetime DEFAULT NULL,
  `GradeId` int NOT NULL,
  `PayScaleId` int NOT NULL,
  `IsFixed` tinyint(1) NOT NULL,
  `Percentage` decimal(18,2) DEFAULT NULL,
  `FixedAmount` decimal(18,2) DEFAULT NULL,
  `MaximumAmount` decimal(18,2) DEFAULT NULL,
  `MinimumAmount` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_GradWisePayScales_CreatedById` (`CreatedById`),
  KEY `IX_GradWisePayScales_UpdatedById` (`UpdatedById`),
  KEY `IX_GradWisePayScales_GradeId` (`GradeId`),
  KEY `IX_GradWisePayScales_PayScaleId` (`PayScaleId`),
  CONSTRAINT `FK_GradWisePayScales_AspNetUsers_CreatedById` FOREIGN KEY (`CreatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_GradWisePayScales_AspNetUsers_UpdatedById` FOREIGN KEY (`UpdatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_GradWisePayScales_Grades_GradeId` FOREIGN KEY (`GradeId`) REFERENCES `grades` (`Id`),
  CONSTRAINT `FK_GradWisePayScales_PayScales_PayScaleId` FOREIGN KEY (`PayScaleId`) REFERENCES `payscales` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradwisepayscales`
--

LOCK TABLES `gradwisepayscales` WRITE;
/*!40000 ALTER TABLE `gradwisepayscales` DISABLE KEYS */;
INSERT INTO `gradwisepayscales` VALUES (1,NULL,'0001-01-01 00:00:00',NULL,NULL,1,2,1,NULL,1500.00,NULL,NULL),(2,NULL,'0001-01-01 00:00:00',NULL,NULL,2,2,1,NULL,1500.00,NULL,NULL),(3,NULL,'0001-01-01 00:00:00',NULL,NULL,3,2,1,NULL,1500.00,NULL,NULL),(4,NULL,'0001-01-01 00:00:00',NULL,NULL,4,2,1,NULL,1500.00,NULL,NULL),(5,NULL,'0001-01-01 00:00:00',NULL,NULL,5,2,1,NULL,1500.00,NULL,NULL),(6,NULL,'0001-01-01 00:00:00',NULL,NULL,6,2,1,NULL,1500.00,NULL,NULL),(7,NULL,'0001-01-01 00:00:00',NULL,NULL,7,2,1,NULL,1500.00,NULL,NULL),(8,NULL,'0001-01-01 00:00:00',NULL,NULL,8,2,1,NULL,1500.00,NULL,NULL),(9,NULL,'0001-01-01 00:00:00',NULL,NULL,9,2,1,NULL,1500.00,NULL,NULL),(10,NULL,'0001-01-01 00:00:00',NULL,NULL,10,2,1,NULL,1500.00,NULL,NULL),(11,NULL,'0001-01-01 00:00:00',NULL,NULL,11,2,1,NULL,1500.00,NULL,NULL),(12,NULL,'0001-01-01 00:00:00',NULL,NULL,12,2,1,NULL,1500.00,NULL,NULL),(13,NULL,'0001-01-01 00:00:00',NULL,NULL,13,2,1,NULL,1500.00,NULL,NULL),(14,NULL,'0001-01-01 00:00:00',NULL,NULL,14,2,1,NULL,1500.00,NULL,NULL),(15,NULL,'0001-01-01 00:00:00',NULL,NULL,15,2,1,NULL,1500.00,NULL,NULL),(16,NULL,'0001-01-01 00:00:00',NULL,NULL,16,2,1,NULL,1500.00,NULL,NULL),(17,NULL,'0001-01-01 00:00:00',NULL,NULL,17,2,1,NULL,1500.00,NULL,NULL),(18,NULL,'0001-01-01 00:00:00',NULL,NULL,18,2,1,NULL,1500.00,NULL,NULL),(19,NULL,'0001-01-01 00:00:00',NULL,NULL,19,2,1,NULL,1500.00,NULL,NULL),(20,NULL,'0001-01-01 00:00:00',NULL,NULL,20,2,1,NULL,1500.00,NULL,NULL),(21,NULL,'0001-01-01 00:00:00',NULL,NULL,4,5,1,NULL,1000.00,NULL,NULL),(22,NULL,'0001-01-01 00:00:00',NULL,NULL,4,6,1,NULL,2000.00,NULL,NULL),(23,NULL,'0001-01-01 00:00:00',NULL,NULL,3,5,1,NULL,1500.00,NULL,NULL),(24,NULL,'0001-01-01 00:00:00',NULL,NULL,3,6,1,NULL,2800.00,NULL,NULL),(25,NULL,'0001-01-01 00:00:00',NULL,NULL,2,5,1,NULL,1500.00,NULL,NULL),(26,NULL,'0001-01-01 00:00:00',NULL,NULL,2,6,1,NULL,2800.00,NULL,NULL),(27,NULL,'0001-01-01 00:00:00',NULL,NULL,1,5,1,NULL,1500.00,NULL,NULL),(28,NULL,'0001-01-01 00:00:00',NULL,NULL,1,6,1,NULL,2800.00,NULL,NULL),(30,NULL,'0001-01-01 00:00:00',NULL,NULL,11,16,1,NULL,200.00,NULL,NULL),(31,NULL,'0001-01-01 00:00:00',NULL,NULL,12,16,1,NULL,200.00,NULL,NULL),(32,NULL,'0001-01-01 00:00:00',NULL,NULL,13,16,1,NULL,200.00,NULL,NULL),(33,NULL,'0001-01-01 00:00:00',NULL,NULL,14,16,1,NULL,200.00,NULL,NULL),(34,NULL,'0001-01-01 00:00:00',NULL,NULL,15,16,1,NULL,200.00,NULL,NULL),(35,NULL,'0001-01-01 00:00:00',NULL,NULL,16,16,1,NULL,200.00,NULL,NULL),(36,NULL,'0001-01-01 00:00:00',NULL,NULL,17,16,1,NULL,200.00,NULL,NULL),(37,NULL,'0001-01-01 00:00:00',NULL,NULL,18,16,1,NULL,200.00,NULL,NULL),(38,NULL,'0001-01-01 00:00:00',NULL,NULL,19,16,1,NULL,200.00,NULL,NULL),(39,NULL,'0001-01-01 00:00:00',NULL,NULL,20,16,1,NULL,200.00,NULL,NULL);
/*!40000 ALTER TABLE `gradwisepayscales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 13:21:31
