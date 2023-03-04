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
-- Table structure for table `submenus`
--

DROP TABLE IF EXISTS `submenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submenus` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `ActiveSubMenuId` varchar(100) NOT NULL,
  `ControllerName` text,
  `ActionName` varchar(100) NOT NULL,
  `AreaName` varchar(100) DEFAULT NULL,
  `MainMenuId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_SubMenus_MainMenuId` (`MainMenuId`),
  CONSTRAINT `FK_SubMenus_MainMenus_MainMenuId` FOREIGN KEY (`MainMenuId`) REFERENCES `mainmenus` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submenus`
--

LOCK TABLES `submenus` WRITE;
/*!40000 ALTER TABLE `submenus` DISABLE KEYS */;
INSERT INTO `submenus` VALUES (1,'Role','Role','Role','Create','Settings',5),(2,'Role Wise Access','RoleWiseAccess','RoleSubMenu','Add','Settings',5),(3,'Main','Main','Dashboard','Test','Salary',1),(4,'Main','Main','Dashboard','Index','Loan',1),(5,'Main','Main','CpfHome','Index','CPF',1),(6,'Fixed Deduction','FixedDeduction','Deduction','FixedDeduction','Salary',3),(7,'User Permission','UserPermission','UserPermission','Add','Settings',5),(8,'Income Tax','Income Tax','Tax','Add','Settings',8),(9,'Add Chindren','ChildrenInfo','ChildrenInfo','Add','Settings',7),(10,'Chindren List','ChildrenList','ChildrenInfo','List','Settings',7),(11,'Grade Wise Allowance','GradeWiseAllowance','GradeWisePayScale','Add','Salary',2),(12,'Grade Wise Allowance List','GradeWisePayScaleList','GradeWisePayScale','List','Salary',2),(13,'User Specific House Rent','UserHouseRent','UserHouseRent','Add','Salary',3),(14,'User House Rent List','UserHouseRentList','UserHouseRent','List','Salary',3),(15,'Assign Role','UserWiseRole','UserWiseRole','Add','Settings',5),(16,'Add Loan','UserWiseLoanAdd','UserWiseLoan','Add','Loan',4),(17,'Loan List','UserWiseLoanList','UserWiseLoan','List','Loan',4),(18,'User Specific Deduction','UserDeduction','Deduction','AddUserDeduction','Salary',3),(19,'User Specific Deduction List','UserDeductionList','Deduction','List','Salary',3),(20,'User Specific Allowance','User Specific Allowance','UserSpecificAllowance','Add','Salary',2),(21,'User Specific Allowance List','UserSpecificAllowanceList','UserSpecificAllowance','List','Salary',2),(22,'Grade Wise Fixed Deduction','GradeWiseFixedDeduction','GradeWiseFixedDeduction','Add','Settings',3),(23,'Grade Wise Fixed Deduction List','GradeWiseFixedDeductionList','GradeWiseFixedDeduction','List','Settings',3),(24,'Salary Report','Salary','Salary','Calculate','Salary',6),(25,'Bank Report','BankReport','Salary','BankReport','Salary',6),(28,'Investment Report','InvestmentReport','InvestmentInfo','InvestmentReport','CPF',6),(29,'CPF Info Report','CPFInfoReport','CpfInfo','Calculate','CPF',6),(30,'CPF Create','CPFCreate','CpfInfo','CPFCalculate','CPF',6),(31,'Investment Calculate','InvestmentInfoCalculate','InvestmentInfo','InvestmentInfoCalculate','CPF',6),(32,'UserWise FiscalCpf Report','UserWiseFiscalCpfReport','UserWiseFiscalYearCPF','UserWiseFiscalCpfReport','CPF',6),(33,'UserFundReport','UserFundReport','UserFund','UserFundReport','CPF',6),(34,'Deduction Report','CpfDeductionReport','Salary','CpfDeductionReport','Salary',6),(35,'Short Bill Report','ShortBillReport','Salary','ShortBillReport','Salary',6),(36,'PRLInvest Report','PRLInvestmentReport','PRLInvest','PRLInvestmentReport','CPF',6),(37,'Individual Loan Report','IndividualLoanReport','UserWiseLoan','IndividualLoan','Loan',4);
/*!40000 ALTER TABLE `submenus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 13:21:28
