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
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(127) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES ('00923eb7-5810-46d8-9477-2ed23604d811','dsgdf','DSGDF','1c38a016-8d84-4f1a-a9ea-9df3f435d316'),('1','Super Admin','Super Admin','1'),('2','Admin','Admin','2'),('3','User','User','3'),('5071dc57-5034-4ce4-8d63-d279881e2855','test','TEST','8c3c450f-10a4-4326-90b0-38154d27f244'),('66fb7e36-1121-4e26-80ad-e58f9eab01c3','test 2','TEST 2','339668d0-8c40-4452-b99a-2a0b790daeac'),('7314a1f9-4f4d-4182-b4a4-98a3dd119cbf','dfedg','DFEDG','49f56988-56b4-4e3e-b425-6d8d297d3bce'),('8595f59a-7182-48ae-a0b6-b12664737f8a','dgfh','DGFH','cdfa34bf-3dde-4ddb-a30e-03fb989c1764'),('85d0f3b4-6b1c-4698-94db-f9ebb5a965bd','sssss','SSSSS','089e1655-9d9e-4689-8342-a328622b993b'),('8daeb685-9bc2-45de-a738-63d24e9cb28e','gdgd','GDGD','d4036794-ff6a-4935-8dca-79ddedbc7ffc'),('b8163bcd-ffc5-4126-afb0-0a545ccfece5','e564esresf','E564ESRESF','391f1add-7584-4e5b-8316-32d021b7ab20'),('ef9abc46-9435-4c7b-acfd-4d5618c5e9bf','4wetertr','4WETERTR','83d86645-1f2a-4d7b-9042-111f159bf719'),('f494ec21-d695-42e8-b735-2aebc039676c','User1','USER1','ea5a039e-a845-46e4-b62e-d960917b8756');
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
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
