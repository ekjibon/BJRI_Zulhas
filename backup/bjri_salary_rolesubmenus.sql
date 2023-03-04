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
-- Table structure for table `rolesubmenus`
--

DROP TABLE IF EXISTS `rolesubmenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolesubmenus` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` text,
  `SubMenuId` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolesubmenus`
--

LOCK TABLES `rolesubmenus` WRITE;
/*!40000 ALTER TABLE `rolesubmenus` DISABLE KEYS */;
INSERT INTO `rolesubmenus` VALUES (19,'1',1),(20,'1',2),(21,'1',3),(22,'1',4),(23,'1',5),(24,'1',6),(25,'1',7),(26,'1',8),(27,'1',9),(28,'1',10),(29,'1',11),(30,'1',12),(31,'1',13),(32,'1',14),(33,'1',15),(34,'1',16),(35,'1',17),(36,'1',18),(37,'1',19),(38,'1',20),(39,'1',21),(40,'1',24),(41,'1',25),(42,'3',8),(43,'1',22),(44,'1',23),(45,'1',26),(46,'1',27),(47,'1',28),(48,'1',29),(49,'1',30),(50,'1',31),(51,'1',32),(52,'1',33),(53,'1',34),(54,'1',35),(55,'1',36),(56,'1',37);
/*!40000 ALTER TABLE `rolesubmenus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 13:21:29
