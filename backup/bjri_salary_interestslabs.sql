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
-- Table structure for table `interestslabs`
--

DROP TABLE IF EXISTS `interestslabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interestslabs` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedById` varchar(767) DEFAULT NULL,
  `CreatedDateTime` datetime NOT NULL,
  `UpdatedById` varchar(767) DEFAULT NULL,
  `UpdatedDateTime` datetime DEFAULT NULL,
  `FromAmount` decimal(18,2) NOT NULL,
  `ToAmount` decimal(18,2) NOT NULL,
  `InterestRate` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_InterestSlabs_CreatedById` (`CreatedById`),
  KEY `IX_InterestSlabs_UpdatedById` (`UpdatedById`),
  CONSTRAINT `FK_InterestSlabs_AspNetUsers_CreatedById` FOREIGN KEY (`CreatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_InterestSlabs_AspNetUsers_UpdatedById` FOREIGN KEY (`UpdatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interestslabs`
--

LOCK TABLES `interestslabs` WRITE;
/*!40000 ALTER TABLE `interestslabs` DISABLE KEYS */;
INSERT INTO `interestslabs` VALUES (1,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,1.00,1500000.00,10.00),(2,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2022-12-27 10:57:54',NULL,NULL,1500001.00,3000000.00,12.00);
/*!40000 ALTER TABLE `interestslabs` ENABLE KEYS */;
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
