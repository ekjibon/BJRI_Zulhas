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
-- Table structure for table `backlogentries`
--

DROP TABLE IF EXISTS `backlogentries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backlogentries` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ApplicantId` text,
  `LeaveTypeId` int NOT NULL,
  `Days` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backlogentries`
--

LOCK TABLES `backlogentries` WRITE;
/*!40000 ALTER TABLE `backlogentries` DISABLE KEYS */;
INSERT INTO `backlogentries` VALUES (1,'9fd9e4b1-b229-4305-b88b-dd35313db200',3,94),(2,'5d0addd9-5b64-42b3-9a99-c2d4ef2f843f',3,286),(3,'905c33b6-7d9e-4b77-ab04-0132a8764ab3',3,536),(4,'8521699b-3213-4abe-9348-a2da31be5944',3,165),(5,'8d3f8b09-160c-4f55-904f-51b4c253fee8',3,39),(6,'c0f39a9d-d4b2-4f52-8810-4b34c518bdac',3,156),(7,'6842bd88-7892-4f47-a333-02e57dc0dec0',3,40),(8,'c759539d-748a-4a5b-bacb-ca1b3b1a0c30',3,90),(9,'df017b50-8f3f-4628-bf34-026dc0e7f67b',3,33),(10,'28c57d3f-ec90-46ab-aab5-8ebad5bd1439',3,42),(11,'deebda61-a975-48e0-9afd-683bb63846e1',3,15),(12,'256d88b7-3e57-4b38-a428-36126594c7bd',3,209),(13,'cf416081-be5c-409e-9351-db6767e02310',3,23),(14,'d8854d5b-a949-464e-8660-74b0102a3232',3,15),(15,'d8767d67-14be-411d-98d3-a96a9e16e520',3,15),(16,'bd4f1822-b7a7-447a-a822-5acdbd8b03f1',3,42),(17,'de8e873a-9de1-41cd-b6b9-368a31a83cf7',3,45),(18,'231535e9-8f86-4d43-84ca-a1a35072f61e',3,15),(19,'be69f8c4-83be-4d4d-98f7-a4da0d84efb3',3,199),(20,'670bb256-c992-4a7e-a536-8f35b590c0ea',3,15),(21,'f65c56e5-a9a1-44fa-97c9-d825e03978d1',3,15),(22,'1e803d56-037a-48f8-8cd5-3b7f4de38e29',3,10),(23,'7dddd974-843b-4f30-929f-f5bb8a0edecf',3,81),(24,'e5d37a88-593e-42bf-bca3-eb87c5848ccd',3,15),(25,'c37b451b-e9fe-453d-a1fb-c88ccd23a10e',3,15),(26,'a5df1925-cc0e-4b55-9508-215194ee81f8',3,15),(27,'2df3c846-8c99-4f72-a9e6-c3d50dade8d8',3,94),(28,'abce8cc2-7b06-4ca7-a80b-fe4e43432a16',3,20),(29,'83e70739-b8fe-409c-b6a5-9fdd3d1aa526',3,80),(30,'ed0bcf8c-5615-4031-a83b-46cfe78d12db',3,38),(31,'a1569a77-28bb-41f1-9012-1e66dcac050b',3,33),(32,'8d666aad-50b5-4125-912d-d4e9a59990e2',3,53),(33,'8e4f0daf-65f1-465c-be58-82ee9d6b4005',3,110),(34,'d2fb65e8-d55e-4970-be43-329d5011ed18',3,69),(35,'927012f7-b75b-4663-9b87-4e1a66fd0062',3,15),(36,'1e84a0f9-f915-4757-ad2c-f06c973148ca',3,53),(37,'e98b8f16-3b16-4e03-9231-96411676cad8',3,375),(38,'ce394ab2-e1f1-4712-9515-1d772db41252',3,50),(39,'0c09c77e-b994-4e4e-ac79-cb6042362e02',3,55),(40,'1bfe5bae-19f6-49c9-a63c-3c4986a7711c',3,7),(41,'1332f501-4ff1-4a20-8999-b4725d358f19',3,39),(42,'4cf24077-867b-40b7-b6b2-dac634d5ab4c',3,56),(43,'8f8e0346-52fb-4f3e-84d1-f4dfe8281f43',3,24),(44,'4a28d8c3-786f-4aab-baa5-069fb5c1aa40',3,13),(45,'b818a9e0-1750-494f-ad3d-0a868aa5a68f',3,195),(46,'1325ce5e-5431-4f76-958a-5002aa512964',3,27),(47,'1a73dfc4-fb5a-4e3b-8371-1cbf436f9899',3,35),(48,'2f7e81bf-8962-4bc6-8cf7-fd85cd7c7ccf',3,55),(49,'7f958b40-dc36-4b26-adfd-d58230693d69',3,30),(50,'63f79c93-54ff-486e-8dc3-fa05805311d3',3,99),(51,'0c09c77e-b994-4e4e-ac79-cb6042362e02',3,1),(52,'0c09c77e-b994-4e4e-ac79-cb6042362e02',3,1),(53,'0c09c77e-b994-4e4e-ac79-cb6042362e02',3,1),(54,'5f481e19-e597-4f5b-ad10-99d0e547abfb',3,15),(55,'b539399d-c511-4d63-8ab3-0e02cc6685b6',3,529),(56,'f4d714f9-e0e2-4279-9b3d-413f086faec1',3,195),(57,'42e4dfce-b7eb-4d5f-ab86-66f4f91aac4a',3,44),(58,'5e7ee98f-d08f-418b-8042-627d5a944b8f',3,49),(59,'33dac069-dc7c-4402-bc4d-6c7883db1989',3,45),(60,'796052e1-ca7b-4da8-8dee-1926b25a6e44',3,80),(61,'5a6064cf-5fc0-429d-8515-6c3fc437dccf',3,5),(62,'af51e474-0529-4089-90c2-f59afeae8c51',3,54),(63,'e4a226c5-9d1a-4c02-92e9-5760b02f7b41',3,237),(64,'2dab6ac5-819e-43ca-9b36-b7e031fd2c38',3,45),(65,'882a23f1-b1a5-4fed-b22e-93b00cfced77',3,15),(66,'608ac69e-de9e-412e-a810-5ff91b43d348',3,15),(67,'b2c0babd-5c4a-4eb2-ab22-ec481a4591bf',3,51),(68,'2dfa1e2d-345b-4fc4-8944-bf1b8d197870',3,43),(69,'a46d7e43-4e8c-435d-9ec5-d2c3ff2789e3',3,627),(70,'e76d71ed-2687-43e0-b33e-52d073dbca9d',3,154),(71,'e4646918-0b9c-417d-9298-a39c54e07f2f',3,19),(72,'5d2fc4de-21dc-40a1-9149-373c736bf3a0',3,734),(73,'eb54de99-6cf9-4afd-b429-de5fb4511b35',3,108),(74,'3a62c701-af9f-4321-8622-df7a5d5a416b',3,434),(75,'eb54de99-6cf9-4afd-b429-de5fb4511b35',3,371),(76,'f14d14ba-e292-4afa-bea3-89edb4122e47',3,15),(77,'14fd207d-ef46-4699-aa82-344e3e303ae0',3,423),(78,'f14d14ba-e292-4afa-bea3-89edb4122e47',3,61),(79,'f491520c-170e-4129-ba50-a1ee7a4d5bb5',3,97),(80,'212285fe-1291-407b-8cad-8ca2ff6d8e00',3,78),(81,'78a8fc23-90ac-4045-ab91-2946d5aa26bf',3,23),(82,'2e96be34-f9ea-47b9-8a22-61eec8b66415',3,223),(83,'7b774248-5283-464b-9863-d15339eeccf8',3,347),(84,'821cfd9c-7ac2-423d-a048-a982f9539176',3,58),(85,'8497e5ed-dedd-4a83-9975-1328096af0ed',3,81),(86,'1714141b-3470-43c0-af70-da0b9dffbb27',3,375),(87,'432e29ca-5456-4ab1-9cc4-58ef0a133a0f',3,20),(88,'2b9408f5-6cb8-4711-b593-5af9cd4857da',3,567),(89,'ac106f53-f089-4af8-a5f8-0afcbdd80d78',3,306),(90,'ce5104b2-be19-4964-9f73-bbbdb8450269',3,41),(91,'56c41066-1346-4c0c-9b4e-681441d2e24e',3,47),(92,'7e5cbe4a-bfcb-46d9-b63f-05087fb194ab',3,338),(93,'925ffe05-e3f5-4f44-887a-cc4fb38abd09',3,15),(94,'c4b46d0a-1306-424f-b192-156f49aca639',3,15),(95,'b1248d1f-e091-4774-b81d-ca7d7e497d74',3,30),(96,'82223021-01b8-43a1-9bce-06f6e3c585d8',3,22),(97,'c716d74b-6fd7-41c2-b06d-a69f02450a58',3,45),(98,'33eb8f98-71c3-4345-a51c-ce30cf7f05c0',3,15),(99,'0fbdcc6e-fd3b-4a58-9065-7b0870a17fe3',3,229),(100,'984281af-4057-41d1-b62e-a1e7ad2b55e9',3,133),(101,'64e5c3e4-f896-4414-b70e-6596a74c3532',3,15),(102,'c5546056-c815-4ae5-b9c5-1955c9092f52',3,15),(103,'9ab37639-2c4f-4fc8-9ec7-30631cc40309',3,115),(104,'73ccae44-17e2-43fd-8042-3beb6702e1a1',3,80),(105,'7a223b31-4d72-4506-b4fe-452fe59717a6',3,15),(106,'9478ea96-34e0-4328-be2e-3aa6de6cfa81',3,95),(107,'2b37a582-0998-4f6f-8312-a3d73ca149d1',3,115),(108,'4cc2bcae-e028-4e9c-bd60-b567b2932701',3,88),(109,'2221ff5a-87b1-435f-91c9-8a5f1d0a9301',3,86),(110,'e07777ea-baba-4dd6-86c8-a1f9c09aa668',3,40),(111,'545cf793-3869-4c68-a090-65ac46566044',3,249),(112,'16d52edf-0977-4504-b6be-35659571462b',3,152),(113,'c48654f4-8358-43d4-89c6-88e715de71d4',3,15),(114,'2b37a582-0998-4f6f-8312-a3d73ca149d1',3,15),(115,'28c63d76-099c-4339-b709-e07dd5d3a3d1',3,15),(116,'3fd93fec-95b3-4415-8ec5-0dfc10455bfc',3,25),(117,'26ee0d00-be80-4878-8036-4fc071cd0a35',3,2072),(118,'fd2393a2-bb56-44d6-8952-93f972935ac1',3,30),(119,'51404f15-e9a1-4f90-a738-eb3a6f25916f',3,105),(120,'ba2dbb19-cffc-4b17-9d23-afb21dd26d9c',3,15),(121,'0e20b5da-25ac-486d-992c-9f0508f1538c',3,36),(122,'58fe1f66-6384-4fd7-a103-ad4e1701ab4a',3,97),(123,'38430e03-37bd-444f-bc75-8c54b9ded253',3,30),(124,'38430e03-37bd-444f-bc75-8c54b9ded253',3,8),(125,'85bf69a2-4ce5-4926-80b6-56d804cf3c8e',3,20),(126,'7bf31c06-1127-466d-a802-bdd20dcac9b0',3,82),(127,'817faa56-5da8-42f0-ad9e-aceef38ba59f',3,94),(128,'d09457dc-413f-4f48-b0a1-665aeca07d0d',3,48),(129,'aacee52c-4400-48e0-92fd-28d45e9f68af',3,60),(130,'6b223bef-6fea-4261-9525-b0e5e1decf36',3,0),(131,'6b223bef-6fea-4261-9525-b0e5e1decf36',3,16),(132,'a8dc6e2b-3ae8-42d2-a36a-ebbd765ce150',3,38),(133,'1052bd0a-8338-4fa2-90d1-5307e7a31c07',3,20),(134,'086dc30d-870e-4a7a-bc41-18b2b6118345',3,15),(135,'4d7a1335-51a2-4274-90f5-0bfe516ccacd',3,0),(136,'446e7293-f116-4288-a334-e7b360352927',3,31),(137,'4d7a1335-51a2-4274-90f5-0bfe516ccacd',3,372),(138,'1a27348a-ca69-44b4-853f-32c353c8a2ca',3,45),(139,'02ab24f0-407f-496a-9c23-24c4acfed633',3,15),(140,'d9c83a18-99c2-427a-b3b0-c927ba7642ba',3,126),(141,'12361a25-3aca-4c04-854b-faf6335cf8d3',3,328),(142,'64f82844-9f97-4ff5-bb32-cbc0d56bea9d',3,51),(143,'38134939-d625-4d75-81e7-5ede4add798a',3,30),(144,'c5ea8b3d-5776-4c66-9756-c78308128225',3,236),(145,'18ab9bd9-e391-40de-889e-c0d14ddc1edb',3,12),(146,'95cbd5a9-9c18-4f83-bf80-38e88ba2acf3',3,38),(147,'12a59e65-f8ee-49da-a996-478546827da4',3,81),(148,'5a2508e3-cd26-4961-8d85-4aed7939a21b',3,4),(149,'9e88daf1-3de1-4fe8-9baa-e9fcfd4574ba',3,29),(150,'7dcec3dc-3819-441f-950a-f3beb99380ea',3,20),(151,'f95e5e37-84d7-4692-b7fc-3fc3b6118453',3,52),(152,'8c220249-6d47-4b9a-99c6-0af9a9763afd',3,58),(153,'9e88daf1-3de1-4fe8-9baa-e9fcfd4574ba',3,250),(154,'176b4d67-9d63-47f4-8a9d-c9a92435a147',3,158),(155,'85bba85a-fbee-4bae-b8ef-28ea36efed82',3,8),(156,'25900004-dea6-4e72-b4da-961cfd09bde1',3,12),(157,'9d0108fc-8ee1-458e-b45d-b02d2574aea6',3,19),(158,'b4f73eed-86ff-41d3-84c5-a9d177146ae9',3,47),(159,'a46ac949-804a-4b1e-96f5-28417bb4940a',3,9),(160,'24cb94f7-594f-4c66-8942-30dce8dab6ff',3,16),(161,'d228e7af-2b22-4d19-bd22-74dfb4a5a9ea',3,15),(162,'59f56f71-ea2c-48e6-984f-d703af753f67',3,15),(163,'40d1b68d-c1dc-4811-9b96-9c9baf954ca7',3,17),(164,'20e4ef0e-dc8a-4271-a308-d887bbda5935',3,8),(165,'39f69971-989a-4ff8-99a0-257dc99545dd',3,35),(166,'10d711f4-d452-476f-93dd-36126f4a1221',3,45),(167,'3cb0415b-9ff0-4344-afcb-ca50f969abd1',3,31),(168,'4a16bda2-67de-4237-a547-acd8b0bbeff6',3,15),(169,'84090f03-a6ec-4618-9c90-e529ee482ca6',3,15),(170,'56412640-9b84-4265-96f8-969dd225dfde',3,45),(171,'7fcd8724-e2d7-46ec-a876-1f2563f0f776',3,51),(172,'d6bc03a2-dae0-4b5f-bcd3-e3eb0e2edfa9',3,21),(173,'4ac32355-6667-44ac-adf7-5981755bec52',3,15),(174,'645ef67c-8f25-40d6-8949-6b9f14b98156',3,15),(175,'c3482278-9b4c-4f09-afbf-7c6f23dbd28a',3,48),(176,'c3482278-9b4c-4f09-afbf-7c6f23dbd28a',3,24),(177,'1e3bac15-e8c1-42ac-890e-e35eb58bc11f',3,15),(178,'6eac113b-35cf-46f1-93a3-96bc387e6f6c',3,228),(179,'7883f3e9-d23b-405c-89e9-0583ed76f41e',3,15),(180,'c22ad585-329b-4630-9815-7942ad4f0891',3,15),(181,'bde8345e-4e58-4db1-bec7-de89d68657cf',3,15),(182,'5b0bf0d8-c8a6-46ba-8399-992cef7f1283',3,9),(183,'d1c234e3-6ff7-4173-9b69-8daade36d7bb',3,15),(184,'ad9b675c-d3fc-48b4-bf1f-607697f2b8c6',3,15),(185,'99e61b37-54b0-4746-bdf4-1781640ef476',3,30),(186,'01b0e5e9-a31b-4954-82b7-fcfa6a468008',3,53),(187,'f4e873d8-b4a7-41eb-84ca-9953acf7949c',3,0),(188,'f4e873d8-b4a7-41eb-84ca-9953acf7949c',3,15),(189,'9046c9a1-388e-4a10-8bc6-679a0dd48ec1',3,15),(190,'7878c250-6075-49e7-904c-8688e418449c',3,97),(191,'a97090ff-a2f7-4b82-a30c-f519e94f554d',3,15),(192,'d9f432d5-ecda-4e2d-84d5-893fb856c010',3,15),(193,'6ff38330-2644-4f40-a7c1-a52f10fafa76',3,65),(194,'7a1683c1-f9ad-4e39-bddd-8f6eab91f644',3,392),(195,'4d87ab57-8e55-4adc-852d-a33c42e2037c',3,39),(196,'82af8319-8a94-4b8b-9942-ec9fe50bdb76',3,31),(197,'9b528a2f-6b6c-40ae-9a4c-ecde487e7d37',3,61),(198,'d49f5c3d-51b1-42df-90f6-8af33c8b78c4',3,235),(199,'e6af57d2-007f-4880-a9aa-0a9840665e10',3,23),(200,'3a5e3eab-6cd6-4c54-9aa3-9d9b42301bc3',3,78),(201,'196b5149-3cc4-46d4-b9b7-33af22ef635d',3,21),(202,'80372cb8-2b68-43bc-886c-4b86ba629525',3,15),(203,'05b9b340-2035-42d6-87d3-a2ac9586bfdd',3,58),(204,'d00e2621-a882-475e-8ec1-fe24589d8355',3,15),(205,'9e201574-eca4-49dc-9d4f-aa0d465c6986',3,294),(206,'92ec6be1-7909-4b72-9f98-d1ea8fb36c32',3,57),(207,'8c45d699-6f90-45f3-b7a7-01dc9884e395',3,21),(208,'8f2f48f3-95e6-4085-b5e0-ba87bee9650d',3,32),(209,'64a002ab-db6b-4831-af31-7b3f35ce023e',3,24),(210,'6a061d5c-5487-403e-9298-2fe29ba0574b',3,15),(211,'c7a81150-8397-4e80-92b1-b04ac772fd1b',3,15),(212,'d87422ee-4606-4edb-ac4b-735ef8c431f6',3,156),(213,'cfa0bc39-4109-40cb-bc64-eed1bf713ca6',3,132),(214,'89e835f8-b35d-479b-903e-1264783bbd66',3,8),(215,'89e835f8-b35d-479b-903e-1264783bbd66',3,8),(216,'89e835f8-b35d-479b-903e-1264783bbd66',3,-8),(217,'050651a7-4c63-4424-b98c-723248c0c5e6',3,74),(218,'75879a85-b4cf-4a41-8b6b-2137cfab3141',3,15),(219,'a2b6a2d2-ed65-49e6-80e4-650df8459fac',3,15),(220,'03c3b4a9-bf7f-4209-ac68-fd1349906678',3,34),(221,'2e1cbe86-d689-4872-a7cc-114b8c56d879',3,15),(222,'9968ddb5-8ae7-49a4-92c5-48d225f27296',3,24),(223,'70b7cf7a-3819-4e63-8164-43056802a221',3,452),(224,'045f880c-5b88-428f-bf0e-78f1aa4055b6',3,53),(225,'3635750f-6542-4e1d-b496-79dbacc4e22c',3,22),(226,'e39ae471-cc14-4fdb-b2f6-51edb92ac799',3,15),(227,'a810b5c2-8cbf-4cc6-a589-ec226d677b3b',3,50),(228,'8143da73-7b95-4de3-85e5-b5af1698dd5b',3,15),(229,'866fef35-2fa6-44ea-b90d-6829e4e0969c',3,12),(230,'639b235a-07ad-4da6-ad89-3bd249c0e0e8',3,46),(231,'c18e4727-e1af-4ce9-9651-2989df8d86bf',3,30),(232,'a94f5e80-9509-453b-8e96-7be851a0a695',3,15),(233,'d18abf7d-838b-44e8-ab15-5d940a8c256d',3,62),(234,'240fd687-e049-41e4-842e-5ae22cffb292',3,15),(235,'15e71f9c-2a90-4ef2-b88e-28f63e0b8fad',3,80),(236,'3057ba69-e229-4c00-91be-e2852f798612',3,15),(237,'24343341-722b-41ee-8ef4-4611b4dc3e66',3,20),(238,'4c5259f1-e7a0-44fc-ad00-c7e36f1a64c4',3,75),(239,'6abb78e1-7e94-4a09-a2c8-71b498bcbb11',3,49),(240,'459c6088-f3c8-4729-97c9-f6bd46f2ce0a',3,15),(241,'e4f0b657-1b68-469b-a5b9-069a8c8894b9',3,15),(242,'438cfdd6-88bc-4b20-8745-489a7246b649',3,213),(243,'1199fb15-3b3d-4d07-bae2-9ffe4972309d',3,32),(244,'62a3d344-e397-422d-8ba8-a7d6003a877a',3,15),(245,'ac96615a-82b5-4912-bac0-059ee53972ba',3,20),(246,'851aa295-129f-44f6-9af1-e653892c73c0',3,142),(247,'c8571cbe-883a-44ed-8b46-218b5c77bd1d',3,90),(248,'a1657786-73c8-475d-ad15-a26f768bf0af',3,316),(249,'17edc59b-b562-421e-80f1-086c1f2e4711',3,45),(250,'17edc59b-b562-421e-80f1-086c1f2e4711',3,45),(251,'1d5c2ebd-e919-4aad-8a8b-e4733f82e2b2',3,15),(252,'11b8a155-6dba-45fc-ada8-60e898658762',3,43),(253,'472257ff-b93c-4b52-9aae-881a0c5eec48',3,288);
/*!40000 ALTER TABLE `backlogentries` ENABLE KEYS */;
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