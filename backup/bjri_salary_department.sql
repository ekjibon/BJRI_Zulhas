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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedById` varchar(767) DEFAULT NULL,
  `CreatedDateTime` datetime NOT NULL,
  `UpdatedById` varchar(767) DEFAULT NULL,
  `UpdatedDateTime` datetime DEFAULT NULL,
  `Name` text,
  `WingId` int DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `NameBangla` text,
  PRIMARY KEY (`Id`),
  KEY `IX_Department_CreatedById` (`CreatedById`),
  KEY `IX_Department_UpdatedById` (`UpdatedById`),
  KEY `IX_Department_WingId` (`WingId`),
  CONSTRAINT `FK_Department_AspNetUsers_CreatedById` FOREIGN KEY (`CreatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Department_AspNetUsers_UpdatedById` FOREIGN KEY (`UpdatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Department_Wing_WingId` FOREIGN KEY (`WingId`) REFERENCES `wing` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','0001-01-01 00:00:00','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-06-21 10:28:43','প্রযোজ্য নয় ',1,0,NULL),(2,NULL,'0001-01-01 00:00:00','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-23 16:24:32','প্রযোজ্য নয়',2,0,NULL),(3,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 10:49:26','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-06-21 10:28:57','প্রযোজ্য নয় ',3,1,NULL),(4,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 10:49:36','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-06-21 10:29:12','প্রযোজ্য নয় ',4,1,NULL),(5,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 10:49:47','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-23 16:24:25','প্রযোজ্য নয়',5,1,NULL),(6,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 10:51:16',NULL,NULL,'পরিকল্পনা, প্রশিক্ষন ও যোগাযোগ বিভাগ',1,1,NULL),(7,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 10:55:41',NULL,NULL,'উপ-পরিঃ(প্রশাসন) দপ্তর',2,1,NULL),(8,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 10:56:08','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 11:34:30','উপ-পরিঃ (হিসাব ও অর্থ) দপ্তর',2,1,NULL),(9,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 11:14:22',NULL,NULL,'প্রজনন বিভাগ',3,1,NULL),(10,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 11:15:45',NULL,NULL,'জেনেটিক রিসোর্সেস এন্ড সীড বিভাগ',3,1,NULL),(11,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 11:16:09',NULL,NULL,'কৃষিতত্ত্ব বিভাগ',3,1,NULL),(12,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 11:16:48',NULL,NULL,'পেস্ট ম্যানেজমেন্ট বিভাগ',3,1,NULL),(13,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 11:17:27',NULL,NULL,'ফাইবার কোয়ালিটি ইম্প্রুভমেন্ট বিভাগ',3,1,NULL),(14,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 11:19:34',NULL,NULL,'জুট ফার্মিং সিস্টেমস বিভাগ',3,1,NULL),(15,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 11:35:08',NULL,NULL,'রসায়ন বিভাগ',4,1,NULL),(16,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 11:35:34',NULL,NULL,'মেকানিক্যাল প্রোসেসিং বিভাগ',4,1,NULL),(17,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 11:36:03',NULL,NULL,'টেক্সটাইল ফিজিক্স বিভাগ',4,1,NULL),(18,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 11:36:40',NULL,NULL,'পাইলট প্লান্ট এন্ড প্রসেসিং বিভাগ',4,1,NULL),(19,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 11:38:00',NULL,NULL,'ডাইং এন্ড প্রিন্টিং বিভাগ',4,1,NULL),(20,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-20 11:56:19',NULL,NULL,'প্রশাসন দপ্তর',5,1,NULL),(21,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-22 11:21:36','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-23 16:24:00','প্রযোজ্য নয়',1,1,NULL),(22,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-02-25 15:42:07',NULL,NULL,'প্রযোজ্য নয়',4,1,NULL),(23,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-14 12:31:37',NULL,NULL,'কীটতত্ত্ব বিভাগ',3,1,NULL),(24,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-15 11:12:43','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-15 11:15:40','খামার ব্যবস্থাপনা ইউনিট',3,1,NULL),(25,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-15 16:23:50','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 10:39:07','পাটের কৃষি পরীক্ষা কেন্দ্র, জাগীর, মানিকগঞ্জ',3,1,NULL),(26,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-16 12:47:48','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 10:42:27','পাট বীজ উৎপাদন ও গবেষণা কেন্দ্র, নশিপুর, দিনাজপুর',3,1,NULL),(27,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-23 16:21:36',NULL,NULL,'প্রযোজ্য নয়',3,1,NULL),(28,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 13:40:43','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:08:49','পাইলট প্লান্ট এন্ড প্রসেসিং বিভাগ',4,1,NULL),(29,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 14:42:25','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:13:05','টেক্সটাইল ফিজিক্স বিভাগ',4,1,NULL),(30,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:17:09',NULL,NULL,'মাইক্রোবায়ােলজি এন্ড বায়ােকেমিঃ শাখা   ',4,1,NULL),(31,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-29 14:10:13',NULL,NULL,'প্রোডাক্ট ডেভলপমেন্ট বিভাগ',5,1,NULL),(32,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-29 15:08:30','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 10:09:23','অডিট শাখা',7,1,NULL),(33,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-29 15:10:06',NULL,NULL,'প্রোযোজ্য নয়',7,1,NULL),(34,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-29 15:34:21','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 14:58:23','মহাপরিচালক মহোদয়ের একান্ত শাখা',7,1,NULL),(35,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-04-01 12:02:48','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-22 23:52:06','প্রযোজ্য নয়',6,1,NULL),(36,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-04-01 12:25:39','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 10:44:45','পাট গবেষণা আঞ্চলিক কেন্দ্র, চান্দিনা, কুমিল্লা',3,1,NULL),(37,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-04-01 12:25:53','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 10:44:18','পাট গবেষণা আঞ্চলিক কেন্দ্র, কিশোরগঞ্জ',3,1,NULL),(38,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-04-01 12:26:13','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 10:45:23','পাট গবেষণা আঞ্চলিক কেন্দ্র, ফরিদপুর',3,1,NULL),(39,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-04-01 15:06:34','1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 10:06:26','কৃষি অর্থনীতি বিভাগ',1,1,NULL),(40,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-06-21 12:48:21',NULL,NULL,'প্রযোজ্য নয়',3,1,NULL),(41,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-17 18:33:40',NULL,NULL,'teeeee',6,1,'terere'),(42,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 10:46:07',NULL,NULL,'পাট গবেষণা আঞ্চলিক কেন্দ্র, রংপুর',3,1,'পাট গবেষণা আঞ্চলিক কেন্দ্র, রংপুর'),(43,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 10:47:20',NULL,NULL,'পাট গবেষণা  উপকেন্দ্র, তারাবো, নারায়ণগঞ্জ',3,1,'পাট গবেষণা  উপকেন্দ্র, তারাবো, নারায়ণগঞ্জ'),(44,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 10:47:57',NULL,NULL,'পাট গবেষণা  উপকেন্দ্র, মনিরামপুর, যশোর',3,1,'পাট গবেষণা  উপকেন্দ্র, মনিরামপুর, যশোর'),(45,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 10:48:58',NULL,NULL,'পাট গবেষণা  উপকেন্দ্র, কলাপাড়া, পটুয়াখালী',3,1,'পাট গবেষণা  উপকেন্দ্র, কলাপাড়া, পটুয়াখালী'),(46,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-19 15:00:12',NULL,NULL,'পরিচালক (প্রশাসন ও অর্থ)',7,1,'পরিচালক (প্রশাসন ও অর্থ)'),(47,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2023-01-23 12:12:09',NULL,NULL,'ফিজিওলজি বিভাগ',3,1,'ফিজিওলজি বিভাগ');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 13:21:33
