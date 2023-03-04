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
-- Table structure for table `transferhistories`
--

DROP TABLE IF EXISTS `transferhistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferhistories` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedById` varchar(767) DEFAULT NULL,
  `CreatedDateTime` datetime NOT NULL,
  `UpdatedById` varchar(767) DEFAULT NULL,
  `UpdatedDateTime` datetime DEFAULT NULL,
  `AppUserId` varchar(767) DEFAULT NULL,
  `FromStationId` int NOT NULL,
  `ToStationId` int NOT NULL,
  `TransferDate` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_TransferHistories_AppUserId` (`AppUserId`),
  KEY `IX_TransferHistories_CreatedById` (`CreatedById`),
  KEY `IX_TransferHistories_FromStationId` (`FromStationId`),
  KEY `IX_TransferHistories_ToStationId` (`ToStationId`),
  KEY `IX_TransferHistories_UpdatedById` (`UpdatedById`),
  CONSTRAINT `FK_TransferHistories_AspNetUsers_AppUserId` FOREIGN KEY (`AppUserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_TransferHistories_AspNetUsers_CreatedById` FOREIGN KEY (`CreatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_TransferHistories_AspNetUsers_UpdatedById` FOREIGN KEY (`UpdatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_TransferHistories_Stations_FromStationId` FOREIGN KEY (`FromStationId`) REFERENCES `stations` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_TransferHistories_Stations_ToStationId` FOREIGN KEY (`ToStationId`) REFERENCES `stations` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferhistories`
--

LOCK TABLES `transferhistories` WRITE;
/*!40000 ALTER TABLE `transferhistories` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferhistories` ENABLE KEYS */;
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
