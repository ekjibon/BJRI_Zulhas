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
-- Table structure for table `payscales`
--

DROP TABLE IF EXISTS `payscales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payscales` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` text,
  `IsAvailable` tinyint(1) NOT NULL DEFAULT '0',
  `Type` int NOT NULL DEFAULT '0',
  `IsUserSpecific` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payscales`
--

LOCK TABLES `payscales` WRITE;
/*!40000 ALTER TABLE `payscales` DISABLE KEYS */;
INSERT INTO `payscales` VALUES (1,'BasicAllowance',1,3,0),(2,'MedicalAllowance',1,0,0),(3,'HouseRentAllowance',1,1,0),(4,'DearnessAllowance',0,0,0),(5,'MobileCellphoneAllowance',1,0,0),(6,'TelephoneAllowance',1,0,0),(7,'ChargeAllowance',1,4,0),(8,'EducationAllowance',1,2,0),(9,'HonoraryAllowance',1,0,0),(10,'TravelingAllowance',1,0,0),(11,'AdvanceAllowance',1,0,0),(12,'TransportAllowance',1,5,0),(13,'PrantikSubidha',1,0,1),(14,'BonusRefund',1,0,1),(15,'OthersAllowance',1,0,1),(16,'TiffinAllowance',1,0,0),(17,'WashAllowance',1,6,0),(18,'ArrearsBasic',1,0,1),(19,'FestivalAllowance',1,0,0);
/*!40000 ALTER TABLE `payscales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 13:21:34
