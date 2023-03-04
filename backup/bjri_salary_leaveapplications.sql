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
-- Table structure for table `leaveapplications`
--

DROP TABLE IF EXISTS `leaveapplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaveapplications` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `CreatedById` varchar(767) DEFAULT NULL,
  `CreatedDateTime` datetime NOT NULL,
  `UpdatedById` varchar(767) DEFAULT NULL,
  `UpdatedDateTime` datetime DEFAULT NULL,
  `ApplicantId` varchar(767) DEFAULT NULL,
  `LeaveTypeId` int NOT NULL,
  `FromDate` datetime NOT NULL,
  `ToDate` datetime NOT NULL,
  `Reason` text NOT NULL,
  `Notes` text,
  `NextApprovedPersonId` varchar(767) NOT NULL,
  `IsRejected` tinyint(1) NOT NULL,
  `IsApproved` tinyint(1) NOT NULL,
  `RejectedById` varchar(767) DEFAULT NULL,
  `RejectedDate` datetime DEFAULT NULL,
  `EarnLeaveType` int NOT NULL,
  `IsHalfToFull` tinyint(1) NOT NULL,
  `TotalDays` int NOT NULL,
  `CancellationRemarks` text,
  `IsRead` tinyint(1) NOT NULL,
  `OtherReason` text,
  PRIMARY KEY (`Id`),
  KEY `IX_LeaveApplications_ApplicantId` (`ApplicantId`),
  KEY `IX_LeaveApplications_CreatedById` (`CreatedById`),
  KEY `IX_LeaveApplications_LeaveTypeId` (`LeaveTypeId`),
  KEY `IX_LeaveApplications_NextApprovedPersonId` (`NextApprovedPersonId`),
  KEY `IX_LeaveApplications_RejectedById` (`RejectedById`),
  KEY `IX_LeaveApplications_UpdatedById` (`UpdatedById`),
  CONSTRAINT `FK_LeaveApplications_AspNetUsers_ApplicantId` FOREIGN KEY (`ApplicantId`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_LeaveApplications_AspNetUsers_CreatedById` FOREIGN KEY (`CreatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_LeaveApplications_AspNetUsers_NextApprovedPersonId` FOREIGN KEY (`NextApprovedPersonId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_LeaveApplications_AspNetUsers_RejectedById` FOREIGN KEY (`RejectedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_LeaveApplications_AspNetUsers_UpdatedById` FOREIGN KEY (`UpdatedById`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_LeaveApplications_LeaveType_LeaveTypeId` FOREIGN KEY (`LeaveTypeId`) REFERENCES `leavetype` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaveapplications`
--

LOCK TABLES `leaveapplications` WRITE;
/*!40000 ALTER TABLE `leaveapplications` DISABLE KEYS */;
INSERT INTO `leaveapplications` VALUES (97,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 14:01:57',NULL,NULL,'eb28f6e3-a3fc-4685-9592-c57e64bb4b5f',11,'2020-01-26 00:00:00','2020-02-09 00:00:00','বিনোদন',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,0,0,15,NULL,0,'0'),(98,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:24:41',NULL,NULL,'32c7b5b3-efe1-4069-a351-be7a411bcc9a',11,'2018-11-01 00:00:00','2018-11-15 00:00:00','বিনোদন',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,0,0,15,NULL,0,'0'),(99,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:31:00',NULL,NULL,'74340733-fad7-4b3e-878e-bfd60da82f13',11,'2019-08-25 00:00:00','2019-09-08 00:00:00','বিনোদন',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,0,0,15,NULL,0,'0'),(100,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:34:46',NULL,NULL,'9d4958fa-e0e8-4df6-9819-ff62ab87d5dc',3,'1998-05-25 00:00:00','1998-06-28 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,35,NULL,0,'0'),(101,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:43:44',NULL,NULL,'9d4958fa-e0e8-4df6-9819-ff62ab87d5dc',3,'2013-03-06 00:00:00','2013-03-13 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,8,NULL,0,'0'),(102,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:46:33',NULL,NULL,'96062b50-1b91-4786-9f5e-f4efe39cf435',3,'1997-11-19 00:00:00','1997-11-20 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,2,NULL,0,'0'),(103,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:47:25',NULL,NULL,'96062b50-1b91-4786-9f5e-f4efe39cf435',3,'1997-11-24 00:00:00','1997-11-27 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,4,NULL,0,'0'),(104,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:48:31',NULL,NULL,'96062b50-1b91-4786-9f5e-f4efe39cf435',3,'1997-12-21 00:00:00','1997-12-24 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,4,NULL,0,'0'),(105,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:49:20',NULL,NULL,'96062b50-1b91-4786-9f5e-f4efe39cf435',3,'1999-11-25 00:00:00','1999-11-25 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,1,NULL,0,'0'),(106,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:50:11',NULL,NULL,'96062b50-1b91-4786-9f5e-f4efe39cf435',3,'1999-12-07 00:00:00','1999-12-09 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,3,NULL,0,'0'),(107,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:51:01',NULL,NULL,'96062b50-1b91-4786-9f5e-f4efe39cf435',3,'2005-10-30 00:00:00','2005-10-31 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,2,NULL,0,'0'),(108,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:52:10',NULL,NULL,'96062b50-1b91-4786-9f5e-f4efe39cf435',11,'2019-11-03 00:00:00','2019-11-17 00:00:00','বিনোদন',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,0,0,15,NULL,0,'0'),(109,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:53:07',NULL,NULL,'96062b50-1b91-4786-9f5e-f4efe39cf435',3,'2017-11-28 00:00:00','2017-12-12 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(110,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:57:19',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'1997-09-07 00:00:00','1997-10-02 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,26,NULL,0,'0'),(111,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 15:58:21',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'1998-09-06 00:00:00','1998-10-13 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,38,NULL,0,'0'),(112,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:00:16',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'1999-12-05 00:00:00','1999-12-07 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,3,NULL,0,'0'),(113,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:01:12',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'2000-01-23 00:00:00','2000-02-17 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,26,NULL,0,'0'),(114,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:02:00',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'2001-06-24 00:00:00','2001-07-24 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,31,NULL,0,'0'),(115,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:04:28',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'2005-11-13 00:00:00','2005-12-08 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,26,NULL,0,'0'),(116,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:05:21',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'2007-10-22 00:00:00','2007-11-14 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,24,NULL,0,'0'),(117,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:06:01',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'2008-10-12 00:00:00','2008-10-27 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,16,NULL,0,'0'),(118,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:06:38',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'2008-10-28 00:00:00','2008-11-06 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,10,NULL,0,'0'),(119,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:07:37',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'2009-10-25 00:00:00','2009-11-26 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,33,NULL,0,'0'),(120,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:08:45',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'2010-09-26 00:00:00','2010-11-04 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,40,NULL,0,'0'),(121,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:09:34',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'2011-11-10 00:00:00','2011-12-01 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,22,NULL,0,'0'),(122,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:10:36',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'2012-12-09 00:00:00','2013-01-10 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,33,NULL,0,'0'),(123,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:11:32',NULL,NULL,'6b2b4593-1888-4cb8-80b9-20ca6b4460af',3,'2018-07-14 00:00:00','2018-09-01 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,50,NULL,0,'0'),(124,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:16:53',NULL,NULL,'0517512a-a308-4c80-921d-d73c68227d97',3,'2005-11-20 00:00:00','2005-12-01 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,12,NULL,0,'0'),(125,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:18:03',NULL,NULL,'0517512a-a308-4c80-921d-d73c68227d97',3,'2008-01-07 00:00:00','2008-01-13 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,7,NULL,0,'0'),(126,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:19:15',NULL,NULL,'a99eafdc-88b4-41dc-9a85-3f088d81db9c',3,'2019-09-15 00:00:00','2019-09-29 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(127,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:20:08',NULL,NULL,'a99eafdc-88b4-41dc-9a85-3f088d81db9c',11,'2019-10-06 00:00:00','2019-10-20 00:00:00','বিনোদন',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,0,0,15,NULL,0,'0'),(128,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:21:52',NULL,NULL,'9ceb9a85-94ec-4431-a0d0-106720c4bbee',3,'2002-08-09 00:00:00','2002-08-31 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,23,NULL,0,'0'),(129,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:22:27',NULL,NULL,'9ceb9a85-94ec-4431-a0d0-106720c4bbee',3,'2011-05-05 00:00:00','2011-05-25 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,21,NULL,0,'0'),(130,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:23:16',NULL,NULL,'9ceb9a85-94ec-4431-a0d0-106720c4bbee',3,'2015-08-28 00:00:00','2015-09-04 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,8,NULL,0,'0'),(131,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:23:50',NULL,NULL,'9ceb9a85-94ec-4431-a0d0-106720c4bbee',3,'2019-07-07 00:00:00','2019-07-18 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,12,NULL,0,'0'),(132,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:24:33',NULL,NULL,'9ceb9a85-94ec-4431-a0d0-106720c4bbee',11,'2019-09-05 00:00:00','2019-09-19 00:00:00','বিনোদন',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,0,0,15,NULL,0,'0'),(133,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:25:47',NULL,NULL,'71e02a5b-d23e-4887-989f-0a8f21917f7d',3,'2016-07-11 00:00:00','2016-08-09 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,30,NULL,0,'0'),(134,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:26:31',NULL,NULL,'71e02a5b-d23e-4887-989f-0a8f21917f7d',3,'2016-11-06 00:00:00','2016-11-20 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(135,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:27:12',NULL,NULL,'71e02a5b-d23e-4887-989f-0a8f21917f7d',3,'2017-12-25 00:00:00','2018-01-23 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,30,NULL,0,'0'),(136,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:28:41',NULL,NULL,'71e02a5b-d23e-4887-989f-0a8f21917f7d',3,'2019-12-17 00:00:00','2019-12-31 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(137,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:29:59',NULL,NULL,'1e803d56-037a-48f8-8cd5-3b7f4de38e29',11,'2017-11-05 00:00:00','2017-11-19 00:00:00','বিনোদন',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,0,0,15,NULL,0,'0'),(138,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:30:44',NULL,NULL,'1e803d56-037a-48f8-8cd5-3b7f4de38e29',3,'2019-06-30 00:00:00','2019-07-14 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(139,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:33:10',NULL,NULL,'076ed742-3260-4175-803f-a9731682f43b',3,'2000-09-03 00:00:00','2000-09-13 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,11,NULL,0,'0'),(140,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:33:48',NULL,NULL,'076ed742-3260-4175-803f-a9731682f43b',3,'2005-05-25 00:00:00','2005-05-31 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,7,NULL,0,'0'),(141,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:34:35',NULL,NULL,'076ed742-3260-4175-803f-a9731682f43b',11,'2017-11-19 00:00:00','2017-12-03 00:00:00','বিনোদন',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,0,0,15,NULL,0,'0'),(142,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:35:46',NULL,NULL,'75ddb1f5-37c2-4393-acb8-b62e927fb482',3,'1999-10-11 00:00:00','1999-10-21 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,11,NULL,0,'0'),(143,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:36:27',NULL,NULL,'75ddb1f5-37c2-4393-acb8-b62e927fb482',3,'2001-08-26 00:00:00','2001-09-13 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,19,NULL,0,'0'),(144,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:37:23',NULL,NULL,'75ddb1f5-37c2-4393-acb8-b62e927fb482',3,'2004-10-02 00:00:00','2004-10-21 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,20,NULL,0,'0'),(145,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:38:09',NULL,NULL,'75ddb1f5-37c2-4393-acb8-b62e927fb482',3,'2011-09-11 00:00:00','2011-10-05 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,25,NULL,0,'0'),(146,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:39:21',NULL,NULL,'75ddb1f5-37c2-4393-acb8-b62e927fb482',3,'2012-07-08 00:00:00','2012-08-02 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,26,NULL,0,'0'),(147,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:39:47',NULL,NULL,'75ddb1f5-37c2-4393-acb8-b62e927fb482',3,'2017-11-21 00:00:00','2017-12-05 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(148,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:40:24',NULL,NULL,'75ddb1f5-37c2-4393-acb8-b62e927fb482',3,'2019-07-07 00:00:00','2019-08-22 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,47,NULL,0,'0'),(149,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-24 16:41:23',NULL,NULL,'75ddb1f5-37c2-4393-acb8-b62e927fb482',11,'2019-10-16 00:00:00','2019-10-30 00:00:00','বিনোদন',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,0,0,15,NULL,0,'0'),(150,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 10:53:46',NULL,NULL,'cf7cae9e-386c-4ca9-8aff-df6181676317',3,'2001-12-19 00:00:00','2001-12-27 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,9,NULL,0,'0'),(151,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 10:54:24',NULL,NULL,'cf7cae9e-386c-4ca9-8aff-df6181676317',3,'2018-09-16 00:00:00','2018-09-30 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(152,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 10:55:09',NULL,NULL,'cf7cae9e-386c-4ca9-8aff-df6181676317',3,'2019-11-10 00:00:00','2019-11-20 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,11,NULL,0,'0'),(153,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 10:56:01',NULL,NULL,'cf7cae9e-386c-4ca9-8aff-df6181676317',3,'2010-09-15 00:00:00','2010-09-21 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,7,NULL,0,'0'),(154,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 10:57:39',NULL,NULL,'1e8d3921-22ab-4f57-9ef9-4483c8bc4461',3,'2006-08-06 00:00:00','2006-08-11 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,6,NULL,0,'0'),(155,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 10:58:50',NULL,NULL,'1ffcb9c9-855d-46ec-a898-1656f67f4c7e',3,'2019-01-31 00:00:00','2019-02-14 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(156,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:00:07',NULL,NULL,'21cc6332-1f67-4c89-a7db-76d81a34fc47',3,'2006-10-23 00:00:00','2006-10-31 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,9,NULL,0,'0'),(157,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:00:39',NULL,NULL,'21cc6332-1f67-4c89-a7db-76d81a34fc47',3,'2008-09-30 00:00:00','2008-10-07 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,8,NULL,0,'0'),(158,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:01:24',NULL,NULL,'21cc6332-1f67-4c89-a7db-76d81a34fc47',3,'2010-02-15 00:00:00','2010-02-25 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,11,NULL,0,'0'),(159,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:01:59',NULL,NULL,'21cc6332-1f67-4c89-a7db-76d81a34fc47',3,'2010-11-28 00:00:00','2010-12-02 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,5,NULL,0,'0'),(160,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:02:30',NULL,NULL,'21cc6332-1f67-4c89-a7db-76d81a34fc47',11,'2018-09-06 00:00:00','2018-09-20 00:00:00','বিনোদন',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,0,0,15,NULL,0,'0'),(161,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:05:50',NULL,NULL,'90cbb837-c14c-452b-8c1c-7309fb870d84',3,'2014-11-16 00:00:00','2014-11-27 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,12,NULL,0,'0'),(162,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:06:20',NULL,NULL,'90cbb837-c14c-452b-8c1c-7309fb870d84',3,'2013-11-24 00:00:00','2013-12-05 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,12,NULL,0,'0'),(163,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:20:05',NULL,NULL,'05e4fe1f-8917-4b8b-8850-932175a6f936',3,'2000-03-20 00:00:00','2000-03-23 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,4,NULL,0,'0'),(164,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:20:52',NULL,NULL,'05e4fe1f-8917-4b8b-8850-932175a6f936',3,'2000-11-26 00:00:00','2000-12-21 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,26,NULL,0,'0'),(165,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:21:45',NULL,NULL,'05e4fe1f-8917-4b8b-8850-932175a6f936',3,'2000-12-22 00:00:00','2000-12-26 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,5,NULL,0,'0'),(166,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:22:41',NULL,NULL,'05e4fe1f-8917-4b8b-8850-932175a6f936',3,'2002-06-27 00:00:00','2002-08-05 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,40,NULL,0,'0'),(167,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:25:55',NULL,NULL,'05e4fe1f-8917-4b8b-8850-932175a6f936',3,'2002-08-06 00:00:00','2002-10-24 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,80,NULL,0,'0'),(168,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:27:17',NULL,NULL,'05e4fe1f-8917-4b8b-8850-932175a6f936',3,'2004-01-24 00:00:00','2004-02-19 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,27,NULL,0,'0'),(169,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:28:36',NULL,NULL,'05e4fe1f-8917-4b8b-8850-932175a6f936',3,'2007-01-03 00:00:00','2007-01-04 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,2,NULL,0,'0'),(170,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:29:17',NULL,NULL,'05e4fe1f-8917-4b8b-8850-932175a6f936',3,'2007-02-04 00:00:00','2007-03-13 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,38,NULL,0,'0'),(171,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:30:04',NULL,NULL,'05e4fe1f-8917-4b8b-8850-932175a6f936',3,'2009-11-30 00:00:00','2009-12-22 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,23,NULL,0,'0'),(172,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:30:57',NULL,NULL,'05e4fe1f-8917-4b8b-8850-932175a6f936',3,'2014-08-28 00:00:00','2014-10-09 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,43,NULL,0,'0'),(173,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:32:04',NULL,NULL,'05e4fe1f-8917-4b8b-8850-932175a6f936',3,'2015-08-02 00:00:00','2015-09-10 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,40,NULL,0,'0'),(174,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:32:53',NULL,NULL,'05e4fe1f-8917-4b8b-8850-932175a6f936',3,'2017-11-05 00:00:00','2017-11-09 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,5,NULL,0,'0'),(175,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:33:42',NULL,NULL,'05e4fe1f-8917-4b8b-8850-932175a6f936',11,'2017-12-10 00:00:00','2017-12-24 00:00:00','বিনোদন',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,0,0,15,NULL,0,'0'),(176,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:46:37',NULL,NULL,'6327b59f-d35c-42bf-b1d6-72de3be8d1f3',3,'1997-10-02 00:00:00','1997-10-06 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,5,NULL,0,'0'),(177,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:47:16',NULL,NULL,'6327b59f-d35c-42bf-b1d6-72de3be8d1f3',3,'1998-04-12 00:00:00','1998-04-30 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,19,NULL,0,'0'),(178,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:48:38',NULL,NULL,'6327b59f-d35c-42bf-b1d6-72de3be8d1f3',3,'1998-05-12 00:00:00','1998-06-10 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,30,NULL,0,'0'),(179,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:49:15',NULL,NULL,'6327b59f-d35c-42bf-b1d6-72de3be8d1f3',3,'1999-02-14 00:00:00','1999-03-01 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,16,NULL,0,'0'),(180,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:49:47',NULL,NULL,'6327b59f-d35c-42bf-b1d6-72de3be8d1f3',3,'2000-03-29 00:00:00','2000-03-29 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,1,NULL,0,'0'),(181,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:50:55',NULL,NULL,'6327b59f-d35c-42bf-b1d6-72de3be8d1f3',11,'2017-11-12 00:00:00','2017-11-26 00:00:00','বিনোদন',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,0,0,15,NULL,0,'0'),(182,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 11:52:01',NULL,NULL,'6327b59f-d35c-42bf-b1d6-72de3be8d1f3',3,'2019-08-27 00:00:00','2019-09-10 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(183,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:23:54',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'1999-11-07 00:00:00','1999-11-09 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,3,NULL,0,'0'),(184,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:24:26',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'1999-11-16 00:00:00','1999-11-17 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,2,NULL,0,'0'),(185,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:24:57',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'1999-11-21 00:00:00','1999-11-22 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,2,NULL,0,'0'),(186,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:25:27',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'1999-11-25 00:00:00','1999-11-25 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,1,NULL,0,'0'),(187,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:26:10',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'1999-12-05 00:00:00','1999-12-06 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,2,NULL,0,'0'),(188,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:26:56',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'1999-12-13 00:00:00','1999-12-14 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,2,NULL,0,'0'),(189,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:27:34',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2000-02-02 00:00:00','2000-02-03 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,2,NULL,0,'0'),(190,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:28:16',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2001-04-09 00:00:00','2001-04-12 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,4,NULL,0,'0'),(191,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:29:04',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2001-04-23 00:00:00','2001-04-25 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,3,NULL,0,'0'),(192,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:29:45',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2001-04-29 00:00:00','2001-05-02 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,4,NULL,0,'0'),(193,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:30:29',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2002-09-01 00:00:00','2002-09-04 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,4,NULL,0,'0'),(194,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:31:08',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2005-01-10 00:00:00','2005-01-19 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,10,NULL,0,'0'),(195,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:32:05',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2006-02-26 00:00:00','2006-03-16 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,19,NULL,0,'0'),(196,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:32:52',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2006-11-05 00:00:00','2006-11-09 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,5,NULL,0,'0'),(197,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:33:59',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2007-03-04 00:00:00','2007-03-15 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,12,NULL,0,'0'),(198,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:34:42',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2007-12-23 00:00:00','2007-12-27 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,5,NULL,0,'0'),(199,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:35:20',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2012-05-27 00:00:00','2012-05-31 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,5,NULL,0,'0'),(200,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:38:16',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2014-02-16 00:00:00','2014-02-27 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,12,NULL,0,'0'),(201,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:39:34',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2014-06-15 00:00:00','2014-06-19 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,5,NULL,0,'0'),(202,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:40:18',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2014-06-26 00:00:00','2014-07-10 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(203,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:40:51',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2015-06-22 00:00:00','2015-07-14 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,23,NULL,0,'0'),(204,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:42:12',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2016-10-16 00:00:00','2016-10-14 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,-1,NULL,0,'0'),(205,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:42:58',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2017-05-23 00:00:00','2017-06-22 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,31,NULL,0,'0'),(206,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:43:31',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2017-10-26 00:00:00','2017-11-09 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(207,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:44:03',NULL,NULL,'3c83d73c-165c-420a-958a-05a9c41e801f',3,'2019-10-20 00:00:00','2019-11-03 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(208,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:54:14',NULL,NULL,'63cdb34d-4f38-486f-aaaa-9cd1438803cb',3,'2003-07-01 00:00:00','2003-07-31 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,31,NULL,0,'0'),(209,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:55:14',NULL,NULL,'63cdb34d-4f38-486f-aaaa-9cd1438803cb',3,'2017-12-20 00:00:00','2018-01-04 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,16,NULL,0,'0'),(210,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:55:48',NULL,NULL,'63cdb34d-4f38-486f-aaaa-9cd1438803cb',3,'2017-12-10 00:00:00','2017-12-24 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(211,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:57:44',NULL,NULL,'63cdb34d-4f38-486f-aaaa-9cd1438803cb',3,'2018-12-23 00:00:00','2019-01-09 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,18,NULL,0,'0'),(212,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 12:58:30',NULL,NULL,'63cdb34d-4f38-486f-aaaa-9cd1438803cb',3,'2020-05-31 00:00:00','2020-06-14 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(213,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:22:45',NULL,NULL,'4535986a-a7cd-413c-bc3a-69b3c961c260',3,'2003-09-06 00:00:00','2003-10-20 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,45,NULL,0,'0'),(214,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:23:25',NULL,NULL,'4535986a-a7cd-413c-bc3a-69b3c961c260',3,'2006-05-09 00:00:00','2006-05-09 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,1,NULL,0,'0'),(215,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:24:20',NULL,NULL,'4535986a-a7cd-413c-bc3a-69b3c961c260',3,'2012-04-22 00:00:00','2012-05-22 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,31,NULL,0,'0'),(216,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:24:57',NULL,NULL,'4535986a-a7cd-413c-bc3a-69b3c961c260',3,'2012-06-10 00:00:00','2012-06-28 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,19,NULL,0,'0'),(217,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:25:40',NULL,NULL,'4535986a-a7cd-413c-bc3a-69b3c961c260',3,'2014-03-18 00:00:00','2014-04-17 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,31,NULL,0,'0'),(218,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:26:11',NULL,NULL,'4535986a-a7cd-413c-bc3a-69b3c961c260',3,'2015-11-15 00:00:00','2015-11-19 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,5,NULL,0,'0'),(219,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:27:25',NULL,NULL,'4535986a-a7cd-413c-bc3a-69b3c961c260',3,'2015-12-14 00:00:00','2016-01-21 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,39,NULL,0,'0'),(220,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:29:00',NULL,NULL,'4535986a-a7cd-413c-bc3a-69b3c961c260',3,'2017-07-23 00:00:00','2017-09-16 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,56,NULL,0,'1'),(221,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:29:48',NULL,NULL,'4535986a-a7cd-413c-bc3a-69b3c961c260',3,'2017-09-24 00:00:00','2017-10-08 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(222,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:30:36',NULL,NULL,'4535986a-a7cd-413c-bc3a-69b3c961c260',3,'2018-08-25 00:00:00','2018-09-13 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,20,NULL,0,'0'),(223,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:34:01',NULL,NULL,'4535986a-a7cd-413c-bc3a-69b3c961c260',3,'2019-08-05 00:00:00','2019-08-08 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,4,NULL,0,'0'),(224,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:34:44',NULL,NULL,'4535986a-a7cd-413c-bc3a-69b3c961c260',3,'2017-09-24 00:00:00','2017-10-08 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(225,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 14:35:27',NULL,NULL,'4535986a-a7cd-413c-bc3a-69b3c961c260',3,'2020-09-20 00:00:00','2020-10-04 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(226,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-25 15:44:55',NULL,NULL,'8521699b-3213-4abe-9348-a2da31be5944',3,'2004-10-02 00:00:00','2004-10-03 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,2,NULL,0,'0'),(227,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-29 10:50:47',NULL,NULL,'99514ff4-bd65-4c1f-b5c0-0351c6049222',3,'2019-09-15 00:00:00','2019-09-29 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'1'),(228,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-29 11:38:45',NULL,NULL,'391eb124-6c1f-4e47-bb9b-1502f1f5a3e8',3,'2020-02-02 00:00:00','2020-02-16 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(229,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-29 12:25:50',NULL,NULL,'9c57c293-ce9b-4ba8-b569-2497c0100560',3,'2020-03-12 00:00:00','2020-02-27 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,-13,NULL,0,'0'),(230,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-29 12:33:07',NULL,NULL,'bb86d016-d21f-44a0-89c8-385ae757e112',3,'2019-07-25 00:00:00','2019-07-21 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,-3,NULL,0,'0'),(231,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-31 10:53:12',NULL,NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',3,'2021-03-31 00:00:00','2021-03-31 00:00:00','বিনোদন',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,1,NULL,0,'0'),(232,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','2021-03-31 11:18:27',NULL,NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',3,'2021-04-01 00:00:00','2021-04-01 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,1,NULL,0,'1'),(235,'d7590060-51b8-497b-8785-c23637ac81c1','2021-06-27 16:08:04',NULL,NULL,'d7590060-51b8-497b-8785-c23637ac81c1',3,'2019-03-10 00:00:00','2019-03-24 00:00:00','পারিবারিক কারণ',NULL,'1e3172f6-b93f-4c10-8eb4-eaf7dac659e9',0,1,NULL,NULL,1,0,15,NULL,0,'0'),(236,'8d255c98-36f1-4b03-96e3-49f52e4b00f0','2022-04-04 14:47:40',NULL,NULL,'8d255c98-36f1-4b03-96e3-49f52e4b00f0',3,'2021-12-26 00:00:00','2022-01-06 00:00:00','পারিবারিক কারণ',NULL,'8d255c98-36f1-4b03-96e3-49f52e4b00f0',1,0,'8d255c98-36f1-4b03-96e3-49f52e4b00f0','2022-04-04 14:49:27',1,0,12,'trail',0,'0');
/*!40000 ALTER TABLE `leaveapplications` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 13:21:30