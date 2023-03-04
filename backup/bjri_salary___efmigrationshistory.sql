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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20221226124619_Test','3.1.11'),('20221227101232_referenceAdded','3.1.11'),('20221228094013_TableAdded','3.1.11'),('20221228094455_HouseRentTableAdded','3.1.11'),('20221229043735_IsFixedAdded','3.1.11'),('20221229094644_relationshipAdded','3.1.11'),('20230101054137_NewTableAdded','3.1.11'),('20230101122828_LoanHead','3.1.11'),('20230102074116_TaxTableAdded','3.1.11'),('20230104073409_TableModified','3.1.11'),('20230104092821_PayScaleTableModified','3.1.11'),('20230104093444_StationTableModified','3.1.11'),('20230104094144_HouseRentRules','3.1.11'),('20230105084809_AddUtilityType','3.1.11'),('20230105104622_idchange','3.1.11'),('20230108052316_ErrorUpdateDatetime','3.1.11'),('20230108061604_GradewiseFixedDeductionAdded','3.1.11'),('20230108062016_BooleanFiledAdded','3.1.11'),('20230109055944_InterestSlab Model Create','3.1.11'),('20230109074134_Loan Calculation','3.1.11'),('20230110111826_UserSpecificAllowanceTableAdded','3.1.11'),('20230110120035_TransferTableAdded','3.1.11'),('20230115051706_TableChangeMultipleColumn','3.1.11'),('20230115052413_NameErrorSolve','3.1.11'),('20230115112552_AddNewColumnInUserDeductionTable','3.1.11'),('20230117093546_TableColumnRemove','3.1.11'),('20230129063630_addUserInstallmentModal','3.1.11'),('20230129153104_UserWiseModalChange','3.1.11'),('20230130050347_UserWiseLoanModalChange','3.1.11'),('20230131051433_TaxInstallmentInfoModalAdd','3.1.11'),('20230131095858_HugeLogicChange','3.1.11'),('20230131100654_tablenamechaneg','3.1.11'),('20230201105952_CpfRelatedModelAdd','3.1.11'),('20230201110452_ModelAdd','3.1.11'),('20230202185841_CpfInfoModelChange','3.1.11'),('20230207051102_InvestmentModalChange','3.1.11'),('20230212074029_FundModelModify','3.1.11'),('20230214062047_UserwiseLoanModelModify','3.1.11'),('20230214101036_App Table Modified','3.1.11'),('20230219060856_PrlApplicantModelAdd','3.1.11'),('20230219061236_PRLApplicantModelAdded','3.1.11');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
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
