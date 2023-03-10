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
-- Table structure for table `userhouserents`
--

DROP TABLE IF EXISTS `userhouserents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userhouserents` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedById` varchar(767) DEFAULT NULL,
  `CreatedDateTime` datetime NOT NULL,
  `UpdatedById` varchar(767) DEFAULT NULL,
  `UpdatedDateTime` datetime DEFAULT NULL,
  `AppUserId` varchar(767) DEFAULT NULL,
  `ResidentStatusId` int NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_UserHouseRents_CreatedById` (`CreatedById`),
  KEY `IX_UserHouseRents_UpdatedById` (`UpdatedById`),
  KEY `IX_UserHouseRents_AppUserId` (`AppUserId`),
  KEY `IX_UserHouseRents_ResidentStatusId` (`ResidentStatusId`),
  CONSTRAINT `FK_UserHouseRents_AspNetUsers_AppUserId` FOREIGN KEY (`AppUserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_UserHouseRents_AspNetUsers_CreatedById` FOREIGN KEY (`CreatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_UserHouseRents_AspNetUsers_UpdatedById` FOREIGN KEY (`UpdatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_UserHouseRents_ResidentStatus_ResidentStatusId` FOREIGN KEY (`ResidentStatusId`) REFERENCES `residentstatus` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userhouserents`
--

LOCK TABLES `userhouserents` WRITE;
/*!40000 ALTER TABLE `userhouserents` DISABLE KEYS */;
INSERT INTO `userhouserents` VALUES (1,NULL,'0001-01-01 00:00:00',NULL,NULL,'95cbd5a9-9c18-4f83-bf80-38e88ba2acf3',3,500.00),(2,NULL,'0001-01-01 00:00:00',NULL,NULL,'9ad1e12c-8dd7-4c5b-a5bc-2898bf7ffacd',3,12100.00),(3,NULL,'0001-01-01 00:00:00',NULL,NULL,'1e803d56-037a-48f8-8cd5-3b7f4de38e29',3,6000.00),(4,NULL,'0001-01-01 00:00:00',NULL,NULL,'a99eafdc-88b4-41dc-9a85-3f088d81db9c',3,6000.00),(5,NULL,'0001-01-01 00:00:00',NULL,NULL,'231535e9-8f86-4d43-84ca-a1a35072f61e',3,6000.00),(6,NULL,'0001-01-01 00:00:00',NULL,NULL,'90cbb837-c14c-452b-8c1c-7309fb870d84',3,6000.00),(7,NULL,'0001-01-01 00:00:00',NULL,NULL,'c1a8f27f-e46a-4c4c-8271-d2b9922a5999',3,6000.00),(8,NULL,'0001-01-01 00:00:00',NULL,NULL,'33eb8f98-71c3-4345-a51c-ce30cf7f05c0',3,6000.00),(9,NULL,'0001-01-01 00:00:00',NULL,NULL,'e4a226c5-9d1a-4c02-92e9-5760b02f7b41',3,300.00),(10,NULL,'0001-01-01 00:00:00',NULL,NULL,'1199fb15-3b3d-4d07-bae2-9ffe4972309d',3,500.00),(11,NULL,'0001-01-01 00:00:00',NULL,NULL,'2dfa1e2d-345b-4fc4-8944-bf1b8d197870',3,300.00),(12,NULL,'0001-01-01 00:00:00',NULL,NULL,'0511782c-2acb-4c46-8cf5-c26d09494a82',3,300.00),(13,NULL,'0001-01-01 00:00:00',NULL,NULL,'769ee3a6-85a8-4d08-91b4-2c51c29a79ed',3,300.00),(14,NULL,'0001-01-01 00:00:00',NULL,NULL,'7dcec3dc-3819-441f-950a-f3beb99380ea',3,500.00),(15,NULL,'0001-01-01 00:00:00',NULL,NULL,'95cbd5a9-9c18-4f83-bf80-38e88ba2acf3',3,500.00),(16,NULL,'0001-01-01 00:00:00',NULL,NULL,'ccd16d84-179f-483e-8ea2-743a01a7a139',3,6000.00),(17,NULL,'0001-01-01 00:00:00',NULL,NULL,'176b4d67-9d63-47f4-8a9d-c9a92435a147',3,500.00),(18,NULL,'0001-01-01 00:00:00',NULL,NULL,'c24be0e7-ed2b-4d99-9174-8de03d3f49d2',3,500.00),(19,NULL,'0001-01-01 00:00:00',NULL,NULL,'017cb96d-a175-483d-aab5-b3cd7c12919a',3,500.00),(20,NULL,'0001-01-01 00:00:00',NULL,NULL,'352a369e-e4b4-4f79-acea-cf25971664d9',4,12100.00),(21,NULL,'0001-01-01 00:00:00',NULL,NULL,'89e835f8-b35d-479b-903e-1264783bbd66',3,6000.00),(22,NULL,'0001-01-01 00:00:00',NULL,NULL,'a1657786-73c8-475d-ad15-a26f768bf0af',3,500.00),(23,NULL,'0001-01-01 00:00:00',NULL,NULL,'196b5149-3cc4-46d4-b9b7-33af22ef635d',3,500.00),(24,NULL,'0001-01-01 00:00:00',NULL,NULL,'b283e7d5-c833-4119-9cda-038f9f4bb145',3,300.00),(25,NULL,'0001-01-01 00:00:00',NULL,NULL,'8d6a4370-6024-4205-8c3c-5dfe96993e56',3,300.00),(26,NULL,'0001-01-01 00:00:00',NULL,NULL,'9b528a2f-6b6c-40ae-9a4c-ecde487e7d37',3,500.00),(27,NULL,'0001-01-01 00:00:00',NULL,NULL,'9681f985-cb30-4842-81cb-ed5e795afcfa',3,500.00),(28,NULL,'0001-01-01 00:00:00',NULL,NULL,'c7a81150-8397-4e80-92b1-b04ac772fd1b',3,4500.00),(29,NULL,'0001-01-01 00:00:00',NULL,NULL,'86e0f703-75fd-49d2-b929-81da444079f7',3,500.00),(30,NULL,'0001-01-01 00:00:00',NULL,NULL,'4aa7f058-990a-4955-af2e-1a739a40df3a',4,12100.00),(31,NULL,'0001-01-01 00:00:00',NULL,NULL,'37f61c71-5b00-484a-af6f-fdce29cb360c',4,12100.00),(32,NULL,'0001-01-01 00:00:00',NULL,NULL,'85bf69a2-4ce5-4926-80b6-56d804cf3c8e',4,12100.00),(33,NULL,'0001-01-01 00:00:00',NULL,NULL,'2e1cbe86-d689-4872-a7cc-114b8c56d879',4,12100.00),(34,NULL,'0001-01-01 00:00:00',NULL,NULL,'9e201574-eca4-49dc-9d4f-aa0d465c6986',3,500.00),(35,NULL,'0001-01-01 00:00:00',NULL,NULL,'fa459624-fa0f-4bf0-ab18-d1a5c8e311f4',3,500.00),(36,NULL,'0001-01-01 00:00:00',NULL,NULL,'424edad2-0a40-43cf-a71b-85165489ea0f',3,500.00),(37,NULL,'0001-01-01 00:00:00',NULL,NULL,'46c52042-585f-4066-b2e9-e7d9a7e22ac4',3,300.00),(38,NULL,'0001-01-01 00:00:00',NULL,NULL,'a1657786-73c8-475d-ad15-a26f768bf0af',3,500.00),(39,NULL,'0001-01-01 00:00:00',NULL,NULL,'d9c83a18-99c2-427a-b3b0-c927ba7642ba',3,500.00),(40,NULL,'0001-01-01 00:00:00',NULL,NULL,'3cb0415b-9ff0-4344-afcb-ca50f969abd1',3,500.00);
/*!40000 ALTER TABLE `userhouserents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 13:21:36
