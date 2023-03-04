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
-- Table structure for table `wing`
--

DROP TABLE IF EXISTS `wing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wing` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedById` varchar(767) DEFAULT NULL,
  `CreatedDateTime` datetime NOT NULL,
  `UpdatedById` varchar(767) DEFAULT NULL,
  `UpdatedDateTime` datetime DEFAULT NULL,
  `Name` text,
  `IsActive` tinyint(1) NOT NULL,
  `NameBangla` text,
  PRIMARY KEY (`Id`),
  KEY `IX_Wing_CreatedById` (`CreatedById`),
  KEY `IX_Wing_UpdatedById` (`UpdatedById`),
  CONSTRAINT `FK_Wing_AspNetUsers_CreatedById` FOREIGN KEY (`CreatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Wing_AspNetUsers_UpdatedById` FOREIGN KEY (`UpdatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wing`
--

LOCK TABLES `wing` WRITE;
/*!40000 ALTER TABLE `wing` DISABLE KEYS */;
INSERT INTO `wing` VALUES (1,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 10:37:59','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 10:41:51','পরিচালক(পরিকল্পনা, প্রশিক্ষন ও যোগাযোগ) দপ্তর',1,NULL),(2,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 10:42:29','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 15:03:52','পরিচালক (প্রশাসন ও অর্থ) দপ্তর',1,NULL),(3,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 10:42:54',NULL,NULL,'পরিচালক(কৃষি) দপ্তর',1,NULL),(4,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 10:43:18',NULL,NULL,'পরিচালক(কারিগরি) দপ্তর',1,NULL),(5,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 10:44:40',NULL,NULL,'পরিচালক(জুট টেক্সটাইল) দপ্তর',1,NULL),(6,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-29 15:01:14','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-06-21 10:37:48','প্রযোজ্য নয় ',1,NULL),(7,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-29 15:05:18','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-18 15:55:35','মহাপরিচালক (দপ্তর)',1,NULL);
/*!40000 ALTER TABLE `wing` ENABLE KEYS */;
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
