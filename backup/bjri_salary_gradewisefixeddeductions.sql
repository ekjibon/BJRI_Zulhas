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
-- Table structure for table `gradewisefixeddeductions`
--

DROP TABLE IF EXISTS `gradewisefixeddeductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gradewisefixeddeductions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedById` varchar(767) DEFAULT NULL,
  `CreatedDateTime` datetime NOT NULL,
  `UpdatedById` varchar(767) DEFAULT NULL,
  `UpdatedDateTime` datetime DEFAULT NULL,
  `DeductionId` int NOT NULL,
  `FromGradeId` int NOT NULL,
  `ToGradeId` int NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_GradeWiseFixedDeductions_CreatedById` (`CreatedById`),
  KEY `IX_GradeWiseFixedDeductions_DeductionId` (`DeductionId`),
  KEY `IX_GradeWiseFixedDeductions_FromGradeId` (`FromGradeId`),
  KEY `IX_GradeWiseFixedDeductions_ToGradeId` (`ToGradeId`),
  KEY `IX_GradeWiseFixedDeductions_UpdatedById` (`UpdatedById`),
  CONSTRAINT `FK_GradeWiseFixedDeductions_AspNetUsers_CreatedById` FOREIGN KEY (`CreatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_GradeWiseFixedDeductions_AspNetUsers_UpdatedById` FOREIGN KEY (`UpdatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_GradeWiseFixedDeductions_Deductions_DeductionId` FOREIGN KEY (`DeductionId`) REFERENCES `deductions` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_GradeWiseFixedDeductions_Grades_FromGradeId` FOREIGN KEY (`FromGradeId`) REFERENCES `grades` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_GradeWiseFixedDeductions_Grades_ToGradeId` FOREIGN KEY (`ToGradeId`) REFERENCES `grades` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradewisefixeddeductions`
--

LOCK TABLES `gradewisefixeddeductions` WRITE;
/*!40000 ALTER TABLE `gradewisefixeddeductions` DISABLE KEYS */;
INSERT INTO `gradewisefixeddeductions` VALUES (12,NULL,'0001-01-01 00:00:00',NULL,NULL,6,1,10,100.00),(13,NULL,'0001-01-01 00:00:00',NULL,NULL,8,1,9,100.00),(14,NULL,'0001-01-01 00:00:00',NULL,NULL,8,10,20,50.00);
/*!40000 ALTER TABLE `gradewisefixeddeductions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 13:21:32
