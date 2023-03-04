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
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(127) NOT NULL,
  `RoleId` varchar(127) NOT NULL,
  `AppUserId` varchar(767) DEFAULT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_AppUserId` (`AppUserId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_AppUserId` FOREIGN KEY (`AppUserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
INSERT INTO `aspnetuserroles` VALUES ('00553689-2336-4425-b3cf-06b476281a54','3',NULL),('00930bb5-4afe-49ad-b468-67499cb517dd','3',NULL),('00d1cbae-13e1-4d77-accd-5d68e233bdd0','3',NULL),('0134a893-6704-4344-9134-31ae1ffea21c','3',NULL),('0134a893-6704-4344-9134-31ae1ffea21c','5071dc57-5034-4ce4-8d63-d279881e2855',NULL),('0138660b-7106-4c83-b96c-32be4e740bfc','3',NULL),('0138660b-7106-4c83-b96c-32be4e740bfc','f494ec21-d695-42e8-b735-2aebc039676c',NULL),('017cb96d-a175-483d-aab5-b3cd7c12919a','3',NULL),('01b0e5e9-a31b-4954-82b7-fcfa6a468008','3',NULL),('02ab24f0-407f-496a-9c23-24c4acfed633','3',NULL),('037ce132-27c6-414e-a59e-102c4bbae4f0','3',NULL),('03c3b4a9-bf7f-4209-ac68-fd1349906678','3',NULL),('045f880c-5b88-428f-bf0e-78f1aa4055b6','3',NULL),('0479b3de-53a5-4217-aa83-12a47e1cf52f','3',NULL),('050651a7-4c63-4424-b98c-723248c0c5e6','3',NULL),('0511782c-2acb-4c46-8cf5-c26d09494a82','3',NULL),('0517512a-a308-4c80-921d-d73c68227d97','3',NULL),('05b9b340-2035-42d6-87d3-a2ac9586bfdd','3',NULL),('05e4fe1f-8917-4b8b-8850-932175a6f936','3',NULL),('0689cee0-1c38-4e7b-ab72-1f75c72d99fb','3',NULL),('074c2a4d-f1d9-4ee0-b782-db47b2fe7244','3',NULL),('076ed742-3260-4175-803f-a9731682f43b','3',NULL),('078c9c0a-60ce-43ca-975b-e42a57b29fbe','3',NULL),('07d9f5ef-6957-48f9-adb6-36331a1be798','3',NULL),('07e0acf0-ea39-48df-8dcf-2d630c0bfd42','3',NULL),('086dc30d-870e-4a7a-bc41-18b2b6118345','3',NULL),('08d4020d-a3be-41f9-93ed-3d99f5f895b9','3',NULL),('0a8d22c1-b529-42d8-961c-29cab05c0ab5','3',NULL),('0c09c77e-b994-4e4e-ac79-cb6042362e02','3',NULL),('0dff8651-f04b-4174-9bd9-1e8ffc35b0ee','3',NULL),('0e20b5da-25ac-486d-992c-9f0508f1538c','3',NULL),('0f75722d-0906-4fee-85b7-eb92b605a662','3',NULL),('0fbdcc6e-fd3b-4a58-9065-7b0870a17fe3','3',NULL),('1052bd0a-8338-4fa2-90d1-5307e7a31c07','3',NULL),('10b2d6e0-bce7-4103-ad0a-efd4326b5c6f','3',NULL),('10d711f4-d452-476f-93dd-36126f4a1221','3',NULL),('10ee309f-b70d-438b-a00b-2aabd28515b4','3',NULL),('10f9851d-d474-42b9-ab64-8ae964a746b6','3',NULL),('1199fb15-3b3d-4d07-bae2-9ffe4972309d','3',NULL),('11b8a155-6dba-45fc-ada8-60e898658762','3',NULL),('11dc994d-9f67-4e13-9dd1-d86424833b2c','3',NULL),('12361a25-3aca-4c04-854b-faf6335cf8d3','3',NULL),('12a59e65-f8ee-49da-a996-478546827da4','3',NULL),('1325ce5e-5431-4f76-958a-5002aa512964','3',NULL),('1332f501-4ff1-4a20-8999-b4725d358f19','3',NULL),('14fd207d-ef46-4699-aa82-344e3e303ae0','3',NULL),('1544e36c-1989-4b45-a2fe-cc82f3c93b10','3',NULL),('15e71f9c-2a90-4ef2-b88e-28f63e0b8fad','3',NULL),('16d52edf-0977-4504-b6be-35659571462b','3',NULL),('1704416b-86d1-4be7-b574-98b6d144027f','3',NULL),('1714141b-3470-43c0-af70-da0b9dffbb27','3',NULL),('173b655f-3896-400c-a24e-9d93405aca4d','3',NULL),('176b4d67-9d63-47f4-8a9d-c9a92435a147','3',NULL),('17edc59b-b562-421e-80f1-086c1f2e4711','3',NULL),('18ab9bd9-e391-40de-889e-c0d14ddc1edb','3',NULL),('18cb7167-5f32-4959-a8bf-61805247d725','3',NULL),('196b5149-3cc4-46d4-b9b7-33af22ef635d','3',NULL),('1a27348a-ca69-44b4-853f-32c353c8a2ca','3',NULL),('1a41db37-7bc2-4f66-bc0d-608de5d1979d','3',NULL),('1a73dfc4-fb5a-4e3b-8371-1cbf436f9899','3',NULL),('1abce373-b022-47c3-973f-400d9d9a8b01','3',NULL),('1b235c3c-714d-4b13-9a70-e609a606666e','3',NULL),('1bfe5bae-19f6-49c9-a63c-3c4986a7711c','3',NULL),('1c9ba8e4-84c0-4b07-94c1-ce0e5f6a2c49','3',NULL),('1d5c2ebd-e919-4aad-8a8b-e4733f82e2b2','3',NULL),('1e3172f6-b93f-4c10-8eb4-eaf7dac659e9','1',NULL),('1e3bac15-e8c1-42ac-890e-e35eb58bc11f','3',NULL),('1e803d56-037a-48f8-8cd5-3b7f4de38e29','3',NULL),('1e84a0f9-f915-4757-ad2c-f06c973148ca','3',NULL),('1e8d3921-22ab-4f57-9ef9-4483c8bc4461','3',NULL),('1ffcb9c9-855d-46ec-a898-1656f67f4c7e','3',NULL),('20b5917a-37f2-4f06-ab08-5d1292a99b98','3',NULL),('20e4ef0e-dc8a-4271-a308-d887bbda5935','3',NULL),('212285fe-1291-407b-8cad-8ca2ff6d8e00','3',NULL),('21cc6332-1f67-4c89-a7db-76d81a34fc47','3',NULL),('2221ff5a-87b1-435f-91c9-8a5f1d0a9301','3',NULL),('231535e9-8f86-4d43-84ca-a1a35072f61e','3',NULL),('23d979b5-6da3-4f9c-9e9f-bef897c1a103','3',NULL),('240fd687-e049-41e4-842e-5ae22cffb292','3',NULL),('24343341-722b-41ee-8ef4-4611b4dc3e66','3',NULL),('24ca3295-ab03-4551-83ec-78564f871a08','3',NULL),('24cb94f7-594f-4c66-8942-30dce8dab6ff','3',NULL),('256d88b7-3e57-4b38-a428-36126594c7bd','3',NULL),('25900004-dea6-4e72-b4da-961cfd09bde1','3',NULL),('26ee0d00-be80-4878-8036-4fc071cd0a35','3',NULL),('27461738-2bc4-4983-8d7d-535c6f8aedbd','3',NULL),('27a7d6db-6bc9-412e-8d46-1174e99d56e1','3',NULL),('27a82c13-869b-4aa6-8ba8-a0d6fd6e0353','3',NULL),('2867535c-1b2b-4c94-a947-e2396f14aa45','3',NULL),('28c57d3f-ec90-46ab-aab5-8ebad5bd1439','3',NULL),('28c63d76-099c-4339-b709-e07dd5d3a3d1','3',NULL),('2a17807c-3080-4440-b487-3cfc8e300019','3',NULL),('2b37a582-0998-4f6f-8312-a3d73ca149d1','3',NULL),('2b9408f5-6cb8-4711-b593-5af9cd4857da','3',NULL),('2d633322-1690-41ca-8d51-c9a633252579','3',NULL),('2dab6ac5-819e-43ca-9b36-b7e031fd2c38','3',NULL),('2df3c846-8c99-4f72-a9e6-c3d50dade8d8','3',NULL),('2dfa1e2d-345b-4fc4-8944-bf1b8d197870','3',NULL),('2e1cbe86-d689-4872-a7cc-114b8c56d879','3',NULL),('2e96be34-f9ea-47b9-8a22-61eec8b66415','3',NULL),('2f7e81bf-8962-4bc6-8cf7-fd85cd7c7ccf','3',NULL),('30569f70-41bd-4177-8626-9f94c84d74b6','3',NULL),('3057ba69-e229-4c00-91be-e2852f798612','3',NULL),('30d3952b-bb2f-4d3b-aa25-5c59b2552b3d','3',NULL),('31ee01e6-2554-4f60-8488-9de31e06684f','3',NULL),('32c7b5b3-efe1-4069-a351-be7a411bcc9a','3',NULL),('33dac069-dc7c-4402-bc4d-6c7883db1989','3',NULL),('33eb8f98-71c3-4345-a51c-ce30cf7f05c0','3',NULL),('352a369e-e4b4-4f79-acea-cf25971664d9','3',NULL),('35970d79-f811-462b-989e-a80bdeab66d5','3',NULL),('3635750f-6542-4e1d-b496-79dbacc4e22c','3',NULL),('37f61c71-5b00-484a-af6f-fdce29cb360c','3',NULL),('3804e7db-afb2-4b35-8d41-5a94b8f3ee95','3',NULL),('38134939-d625-4d75-81e7-5ede4add798a','3',NULL),('38430e03-37bd-444f-bc75-8c54b9ded253','3',NULL),('3908a9a1-56df-4059-a504-69e49f27896c','3',NULL),('391eb124-6c1f-4e47-bb9b-1502f1f5a3e8','3',NULL),('39f69971-989a-4ff8-99a0-257dc99545dd','3',NULL),('3a5e3eab-6cd6-4c54-9aa3-9d9b42301bc3','3',NULL),('3a62c701-af9f-4321-8622-df7a5d5a416b','3',NULL),('3a6790a2-6fa2-4e43-b3b5-39300f26dffc','3',NULL),('3c542272-e369-4ed3-b821-c6d3e6807a72','3',NULL),('3c83d73c-165c-420a-958a-05a9c41e801f','3',NULL),('3cb0415b-9ff0-4344-afcb-ca50f969abd1','3',NULL),('3cd1d58e-42f1-4844-ab1d-f4cadeb541eb','3',NULL),('3d8bf98b-8126-44af-ad14-53c3b4641f0e','3',NULL),('3dfef74d-9fcf-4e18-9052-665c72bfaf56','3',NULL),('3fd93fec-95b3-4415-8ec5-0dfc10455bfc','3',NULL),('406032e8-41e4-448a-b69a-46e2de2f27a9','3',NULL),('40d1b68d-c1dc-4811-9b96-9c9baf954ca7','3',NULL),('41970e81-9783-4c86-b8ce-9b890cd29fbc','3',NULL),('41ad7081-34ff-4a62-b5a2-e910597b74ce','3',NULL),('424edad2-0a40-43cf-a71b-85165489ea0f','3',NULL),('429b50e4-20ff-4b5e-9a67-c5d0058b8666','3',NULL),('42e4dfce-b7eb-4d5f-ab86-66f4f91aac4a','3',NULL),('432e29ca-5456-4ab1-9cc4-58ef0a133a0f','3',NULL),('438cfdd6-88bc-4b20-8745-489a7246b649','3',NULL),('44059ebf-367a-45be-9320-747a4933d247','3',NULL),('444a9d31-a2cc-49d8-a46b-c1e247c83f8c','3',NULL),('446e7293-f116-4288-a334-e7b360352927','3',NULL),('4535986a-a7cd-413c-bc3a-69b3c961c260','3',NULL),('459c6088-f3c8-4729-97c9-f6bd46f2ce0a','3',NULL),('460db4bf-d37f-4acd-83f4-da64491990f4','3',NULL),('46c52042-585f-4066-b2e9-e7d9a7e22ac4','3',NULL),('472257ff-b93c-4b52-9aae-881a0c5eec48','3',NULL),('48392f75-7ac2-4cad-8c5a-3ddee19e66d7','3',NULL),('49666817-d04f-43ae-b053-003dbd73f753','3',NULL),('4a16bda2-67de-4237-a547-acd8b0bbeff6','3',NULL),('4a28d8c3-786f-4aab-baa5-069fb5c1aa40','3',NULL),('4a5dbcef-e96c-4899-8ff5-70009d864e8b','3',NULL),('4aa7f058-990a-4955-af2e-1a739a40df3a','3',NULL),('4ac32355-6667-44ac-adf7-5981755bec52','3',NULL),('4b6d01cc-8987-453d-b704-34332b210170','3',NULL),('4b8c5c48-7b2f-46cc-8dda-9f8373461ad0','3',NULL),('4b942ce9-9594-4f86-ae25-c83fa3becfe7','3',NULL),('4c5259f1-e7a0-44fc-ad00-c7e36f1a64c4','3',NULL),('4c8e15e2-9316-44c8-808f-35b0659979fe','3',NULL),('4cc2bcae-e028-4e9c-bd60-b567b2932701','3',NULL),('4cf24077-867b-40b7-b6b2-dac634d5ab4c','3',NULL),('4d7a1335-51a2-4274-90f5-0bfe516ccacd','3',NULL),('4d87ab57-8e55-4adc-852d-a33c42e2037c','3',NULL),('4e7ca2e5-ed81-45a1-90b3-8d6011a1917f','3',NULL),('4e8570e5-6e72-4a7d-bb05-574bc0907db5','3',NULL),('4f19404f-01e9-41f6-bd82-bd64f231ebf4','3',NULL),('51404f15-e9a1-4f90-a738-eb3a6f25916f','3',NULL),('545cf793-3869-4c68-a090-65ac46566044','3',NULL),('55bb3c09-fe43-461e-a041-80b85e5cea1a','3',NULL),('56412640-9b84-4265-96f8-969dd225dfde','3',NULL),('56c41066-1346-4c0c-9b4e-681441d2e24e','3',NULL),('5714054a-7f81-4ab9-bc80-f136bdbbaf63','3',NULL),('57307e0f-2f31-4c97-aa33-07a59ee8a0a7','3',NULL),('57f1320c-627b-4af9-b8f5-0418f69a300f','3',NULL),('5876dd8d-26fb-4027-a7a3-a5c00316fe23','3',NULL),('58fe1f66-6384-4fd7-a103-ad4e1701ab4a','3',NULL),('59490634-9dba-44ec-8172-c79b1f53d220','3',NULL),('59f56f71-ea2c-48e6-984f-d703af753f67','3',NULL),('5a2508e3-cd26-4961-8d85-4aed7939a21b','3',NULL),('5a6064cf-5fc0-429d-8515-6c3fc437dccf','3',NULL),('5b0bf0d8-c8a6-46ba-8399-992cef7f1283','3',NULL),('5d0addd9-5b64-42b3-9a99-c2d4ef2f843f','3',NULL),('5d2fc4de-21dc-40a1-9149-373c736bf3a0','3',NULL),('5d4afd4f-62c6-4d18-bf87-28c9d8374a09','3',NULL),('5e7ee98f-d08f-418b-8042-627d5a944b8f','3',NULL),('5f481e19-e597-4f5b-ad10-99d0e547abfb','3',NULL),('5f7efe58-ae86-4b17-be5e-02946541d241','3',NULL),('60770ad8-9ad6-478c-b9e2-56bf8b05a518','3',NULL),('608ac69e-de9e-412e-a810-5ff91b43d348','3',NULL),('6093fbf3-4c00-461a-b57d-2df51720508f','3',NULL),('611897a1-8965-45b9-a924-65272f9f7cc5','3',NULL),('61d6b71a-5834-4df0-be9f-516dde8f5873','3',NULL),('62a3d344-e397-422d-8ba8-a7d6003a877a','3',NULL),('62b26f29-f012-4e77-8148-78d8d5292e81','3',NULL),('631e8855-49f4-4ec0-b819-c67c73bf2c5a','3',NULL),('6327b59f-d35c-42bf-b1d6-72de3be8d1f3','3',NULL),('639b235a-07ad-4da6-ad89-3bd249c0e0e8','3',NULL),('63cdb34d-4f38-486f-aaaa-9cd1438803cb','3',NULL),('63dad622-d411-43e8-a006-986a17bfca08','3',NULL),('63f79c93-54ff-486e-8dc3-fa05805311d3','3',NULL),('645ef67c-8f25-40d6-8949-6b9f14b98156','3',NULL),('64a002ab-db6b-4831-af31-7b3f35ce023e','3',NULL),('64e5c3e4-f896-4414-b70e-6596a74c3532','3',NULL),('64f82844-9f97-4ff5-bb32-cbc0d56bea9d','3',NULL),('6619d6d2-0b86-4dc4-b16e-1d13ef4b272b','3',NULL),('665f9de0-5c93-4482-9398-5f7ff526aac9','3',NULL),('670bb256-c992-4a7e-a536-8f35b590c0ea','3',NULL),('67445d0d-aad2-4c51-8a7b-a89aaf34ebdc','3',NULL),('67bc7099-fa76-405b-8506-9eb6d22b8f3a','3',NULL),('681ac0f5-1844-4b90-8693-152480139091','3',NULL),('6842bd88-7892-4f47-a333-02e57dc0dec0','3',NULL),('684c9f8a-9c87-41b9-93db-82335a6e4e0f','3',NULL),('68ec1355-2dfa-411a-ba52-17da068f5b46','3',NULL),('6a061d5c-5487-403e-9298-2fe29ba0574b','3',NULL),('6abb78e1-7e94-4a09-a2c8-71b498bcbb11','3',NULL),('6b223bef-6fea-4261-9525-b0e5e1decf36','3',NULL),('6b2b4593-1888-4cb8-80b9-20ca6b4460af','3',NULL),('6be4c37f-bbd8-4240-b08e-ecb850998d5f','3',NULL),('6bf18bf5-c7c9-465c-96f1-4ada05d5adfc','3',NULL),('6c345a5f-0972-4a1c-821e-6c504fd1de57','3',NULL),('6eac113b-35cf-46f1-93a3-96bc387e6f6c','3',NULL),('6f701cb5-ca6c-45bb-ae91-78884bf34334','3',NULL),('6ff38330-2644-4f40-a7c1-a52f10fafa76','3',NULL),('7094b0d6-77b8-4a82-b156-5310000d2f7a','3',NULL),('70b7cf7a-3819-4e63-8164-43056802a221','3',NULL),('711ee2e6-99ce-4be2-ad07-b465811b5326','3',NULL),('7126bd84-8519-4693-9544-b480f6302a4f','3',NULL),('71e02a5b-d23e-4887-989f-0a8f21917f7d','3',NULL),('7256ce6e-5d66-4886-890b-100eedb22a1b','3',NULL),('7306b7c5-3465-4345-be9a-7f35a875376f','3',NULL),('73ccae44-17e2-43fd-8042-3beb6702e1a1','3',NULL),('74340733-fad7-4b3e-878e-bfd60da82f13','3',NULL),('752dbd11-9669-46a4-9967-9b6b0d368d68','3',NULL),('75879a85-b4cf-4a41-8b6b-2137cfab3141','3',NULL),('758e581d-795d-4049-836a-3f3bb972158a','3',NULL),('75ddb1f5-37c2-4393-acb8-b62e927fb482','3',NULL),('762c3aa9-26f7-4aab-ac43-5df4e8bb369a','3',NULL),('769ee3a6-85a8-4d08-91b4-2c51c29a79ed','3',NULL),('779a1d87-93f1-4a5d-888b-4cf7251f2eb6','3',NULL),('7878c250-6075-49e7-904c-8688e418449c','3',NULL),('7883f3e9-d23b-405c-89e9-0583ed76f41e','3',NULL),('78a8fc23-90ac-4045-ab91-2946d5aa26bf','3',NULL),('7919f108-3b64-4d61-896d-a4cc8ef72ccd','3',NULL),('796052e1-ca7b-4da8-8dee-1926b25a6e44','3',NULL),('7a05c79e-4eb0-4883-8848-5158dcfd5bc3','3',NULL),('7a1683c1-f9ad-4e39-bddd-8f6eab91f644','3',NULL),('7a223b31-4d72-4506-b4fe-452fe59717a6','3',NULL),('7b774248-5283-464b-9863-d15339eeccf8','3',NULL),('7bf31c06-1127-466d-a802-bdd20dcac9b0','3',NULL),('7c8dc716-6cc5-4fae-88a0-276d77c22024','3',NULL),('7dcec3dc-3819-441f-950a-f3beb99380ea','3',NULL),('7dddd974-843b-4f30-929f-f5bb8a0edecf','3',NULL),('7e300ba5-cfd5-448e-8570-d5041dbf1c6e','3',NULL),('7e5cbe4a-bfcb-46d9-b63f-05087fb194ab','3',NULL),('7f958b40-dc36-4b26-adfd-d58230693d69','3',NULL),('7fcd8724-e2d7-46ec-a876-1f2563f0f776','3',NULL),('80372cb8-2b68-43bc-886c-4b86ba629525','3',NULL),('8143da73-7b95-4de3-85e5-b5af1698dd5b','3',NULL),('817faa56-5da8-42f0-ad9e-aceef38ba59f','3',NULL),('821cfd9c-7ac2-423d-a048-a982f9539176','3',NULL),('82223021-01b8-43a1-9bce-06f6e3c585d8','3',NULL),('8296365c-18fd-401f-a5f3-20957a36492c','3',NULL),('82af8319-8a94-4b8b-9942-ec9fe50bdb76','3',NULL),('83a41e85-ea6f-460e-8c00-e97398017e16','3',NULL),('83e70739-b8fe-409c-b6a5-9fdd3d1aa526','3',NULL),('84090f03-a6ec-4618-9c90-e529ee482ca6','3',NULL),('8497e5ed-dedd-4a83-9975-1328096af0ed','3',NULL),('851aa295-129f-44f6-9af1-e653892c73c0','3',NULL),('8521699b-3213-4abe-9348-a2da31be5944','3',NULL),('85bba85a-fbee-4bae-b8ef-28ea36efed82','3',NULL),('85bc64b0-26d7-4ac3-a34c-60c460a62c22','3',NULL),('85bf69a2-4ce5-4926-80b6-56d804cf3c8e','3',NULL),('866fef35-2fa6-44ea-b90d-6829e4e0969c','3',NULL),('86e0f703-75fd-49d2-b929-81da444079f7','3',NULL),('882a23f1-b1a5-4fed-b22e-93b00cfced77','3',NULL),('89e835f8-b35d-479b-903e-1264783bbd66','3',NULL),('8c220249-6d47-4b9a-99c6-0af9a9763afd','3',NULL),('8c2a91d4-9889-4aaf-add5-a561b1dc30dd','3',NULL),('8c45d699-6f90-45f3-b7a7-01dc9884e395','3',NULL),('8c7cbc4a-cb73-4f71-8849-537b671abced','3',NULL),('8c9dad3b-d4d3-4e72-85d9-dd5bce155c50','3',NULL),('8d255c98-36f1-4b03-96e3-49f52e4b00f0','3',NULL),('8d3f8b09-160c-4f55-904f-51b4c253fee8','3',NULL),('8d666aad-50b5-4125-912d-d4e9a59990e2','3',NULL),('8d6a4370-6024-4205-8c3c-5dfe96993e56','3',NULL),('8d869594-c0ef-46e9-b4d1-9d9da2be8717','3',NULL),('8e4d7b4e-dd7d-4b56-b4b8-63db85d86133','3',NULL),('8e4f0daf-65f1-465c-be58-82ee9d6b4005','3',NULL),('8e69092f-ab17-4e3e-b3f4-9b365355cc94','3',NULL),('8ec355ae-e789-4fdb-868b-402dccdd6a3b','3',NULL),('8f2f48f3-95e6-4085-b5e0-ba87bee9650d','3',NULL),('8f8e0346-52fb-4f3e-84d1-f4dfe8281f43','3',NULL),('9046c9a1-388e-4a10-8bc6-679a0dd48ec1','3',NULL),('905c33b6-7d9e-4b77-ab04-0132a8764ab3','3',NULL),('90cbb837-c14c-452b-8c1c-7309fb870d84','3',NULL),('916b3309-1e39-40bd-9bdd-148d0ac18d10','3',NULL),('925ffe05-e3f5-4f44-887a-cc4fb38abd09','3',NULL),('927012f7-b75b-4663-9b87-4e1a66fd0062','3',NULL),('92af63e8-f129-4e0c-af89-32c2f4a5ba65','3',NULL),('92ea2f24-2b7d-421f-aca4-30ed613e2ea6','3',NULL),('92ec6be1-7909-4b72-9f98-d1ea8fb36c32','3',NULL),('93108532-712e-48bb-b89c-16e92c53bbeb','3',NULL),('9314b76b-fcbc-4c7e-9f2c-fdb757d00d81','3',NULL),('931ea9de-6f83-4e5e-a636-f88d7d02ed33','3',NULL),('93e3460c-c2be-4224-a0ef-20814b4501aa','3',NULL),('940cfd24-5173-41e7-af61-c1b725bc312a','3',NULL),('941914b1-ef23-433e-bc89-c94524dd0ebd','3',NULL),('9478ea96-34e0-4328-be2e-3aa6de6cfa81','3',NULL),('95cbd5a9-9c18-4f83-bf80-38e88ba2acf3','3',NULL),('95f94d6d-ceb4-4129-8c08-4bb0efd1066b','3',NULL),('96062b50-1b91-4786-9f5e-f4efe39cf435','3',NULL),('967eab0f-839b-4087-afc7-fbe233f53133','3',NULL),('9681f985-cb30-4842-81cb-ed5e795afcfa','3',NULL),('984281af-4057-41d1-b62e-a1e7ad2b55e9','3',NULL),('99514ff4-bd65-4c1f-b5c0-0351c6049222','3',NULL),('9963a385-864d-49b1-b1b4-e78aaa416144','3',NULL),('9968ddb5-8ae7-49a4-92c5-48d225f27296','3',NULL),('99e61b37-54b0-4746-bdf4-1781640ef476','3',NULL),('9ab37639-2c4f-4fc8-9ec7-30631cc40309','3',NULL),('9ac39324-6300-4be5-a737-e6a695049ef1','3',NULL),('9ad1e12c-8dd7-4c5b-a5bc-2898bf7ffacd','3',NULL),('9b528a2f-6b6c-40ae-9a4c-ecde487e7d37','3',NULL),('9b63822b-b9e7-4d31-be27-7d21ffe0189c','3',NULL),('9b9e16b9-11fb-441a-b124-dee837fc4000','3',NULL),('9be87170-d9b1-47cf-b976-2f5a43e70fb0','3',NULL),('9c2bf431-16f4-4518-a600-8d27664460ff','3',NULL),('9c57c293-ce9b-4ba8-b569-2497c0100560','3',NULL),('9c711079-d23b-46e8-8c5b-9ca742ef7f86','3',NULL),('9ceb9a85-94ec-4431-a0d0-106720c4bbee','3',NULL),('9d0108fc-8ee1-458e-b45d-b02d2574aea6','3',NULL),('9d4958fa-e0e8-4df6-9819-ff62ab87d5dc','3',NULL),('9dd26841-3e1c-497f-bc24-3dde76c2aa4d','3',NULL),('9e201574-eca4-49dc-9d4f-aa0d465c6986','3',NULL),('9e73f33f-8d74-4132-88db-23b346388597','3',NULL),('9e88daf1-3de1-4fe8-9baa-e9fcfd4574ba','3',NULL),('9f1e8298-4c89-45ac-b087-9add4df8ebcf','3',NULL),('9fd9e4b1-b229-4305-b88b-dd35313db200','3',NULL),('a06ed1d0-f3d6-4e9e-bcd6-71fe33a7c718','3',NULL),('a1569a77-28bb-41f1-9012-1e66dcac050b','3',NULL),('a1657786-73c8-475d-ad15-a26f768bf0af','3',NULL),('a172da49-981d-4815-82db-6c8aaae4adf0','3',NULL),('a2300405-282f-41d6-8b66-fe100159a2ef','3',NULL),('a2934727-5e38-46e7-aaf3-7d0ecafd92cb','3',NULL),('a2b6a2d2-ed65-49e6-80e4-650df8459fac','3',NULL),('a33097bb-5f6c-4fe5-ad6b-db0a96b076a8','3',NULL),('a426bea0-5c40-4b56-8b26-a804f5901b62','3',NULL),('a46ac949-804a-4b1e-96f5-28417bb4940a','3',NULL),('a46d7e43-4e8c-435d-9ec5-d2c3ff2789e3','3',NULL),('a4ad72fa-d5c6-4976-8c5f-6a8b997d5026','3',NULL),('a5839150-71b8-44fe-a716-591e953057a8','3',NULL),('a5df1925-cc0e-4b55-9508-215194ee81f8','3',NULL),('a61563c1-6b7c-4cae-ae83-c4317d7bccc7','3',NULL),('a76cf0cd-49c5-435f-a9ce-30a1562ea28e','3',NULL),('a810b5c2-8cbf-4cc6-a589-ec226d677b3b','3',NULL),('a860215c-0173-4cef-9b79-48870976da53','3',NULL),('a8dc6e2b-3ae8-42d2-a36a-ebbd765ce150','3',NULL),('a8f02b5c-54f0-43bb-b89d-044e1f06d756','3',NULL),('a94f5e80-9509-453b-8e96-7be851a0a695','3',NULL),('a97090ff-a2f7-4b82-a30c-f519e94f554d','3',NULL),('a99eafdc-88b4-41dc-9a85-3f088d81db9c','3',NULL),('aaaab485-050a-48de-b65a-80c4b30e21c5','3',NULL),('aacee52c-4400-48e0-92fd-28d45e9f68af','3',NULL),('ab3ab131-aa84-423e-8ded-97691116796a','3',NULL),('ab79ff8c-5a6b-4c9a-bfcb-740f7f87f323','3',NULL),('abce8cc2-7b06-4ca7-a80b-fe4e43432a16','3',NULL),('ac106f53-f089-4af8-a5f8-0afcbdd80d78','3',NULL),('ac8c5f6b-c826-46df-bd0a-156c885734a3','3',NULL),('ac96615a-82b5-4912-bac0-059ee53972ba','3',NULL),('ad9b675c-d3fc-48b4-bf1f-607697f2b8c6','3',NULL),('ae0db664-f11d-4dbf-bfb3-bee6edaf9f01','3',NULL),('ae4b80e2-07b2-474d-802d-aa263e7e3112','3',NULL),('af51e474-0529-4089-90c2-f59afeae8c51','3',NULL),('af776f31-a2a6-46a3-9960-5e15981db925','3',NULL),('b017d2e8-bd8f-4b44-a4b0-0b9318fbdf1f','3',NULL),('b1248d1f-e091-4774-b81d-ca7d7e497d74','3',NULL),('b283e7d5-c833-4119-9cda-038f9f4bb145','3',NULL),('b2c0babd-5c4a-4eb2-ab22-ec481a4591bf','3',NULL),('b3136b5a-d69c-4878-bba2-ce68c71ac19c','3',NULL),('b3513414-18fd-4b20-8fb1-ae8004145f24','3',NULL),('b3526380-03ef-4517-aca7-6e38b626bbeb','3',NULL),('b452d7a2-8999-4419-a221-2d859aa45ded','3',NULL),('b4e400aa-507c-475f-a37a-c4aae095f62b','3',NULL),('b4f73eed-86ff-41d3-84c5-a9d177146ae9','3',NULL),('b539399d-c511-4d63-8ab3-0e02cc6685b6','3',NULL),('b5fa66b2-f580-4866-9341-302750584efb','3',NULL),('b60863c4-1402-4fef-8f9c-d5a95a456bb4','3',NULL),('b6b89b81-2da0-4f6a-bd79-216faf4ca908','3',NULL),('b7cc7d4b-f9a9-4c66-8e7c-721db553cb64','3',NULL),('b818a9e0-1750-494f-ad3d-0a868aa5a68f','3',NULL),('b8627277-c474-4eb0-a0ee-8e947c3072f4','3',NULL),('b88b8b2b-15a2-49ad-a4c6-cdffd099b5a9','3',NULL),('ba2dbb19-cffc-4b17-9d23-afb21dd26d9c','3',NULL),('baca63cb-923d-46f8-8d30-78179cbffa8a','3',NULL),('bb86d016-d21f-44a0-89c8-385ae757e112','3',NULL),('bbde2577-fcf3-4da2-8470-62cbd53f36fa','3',NULL),('bd4f1822-b7a7-447a-a822-5acdbd8b03f1','3',NULL),('bd8213ee-0e31-4d33-aec5-516ab8bb9c90','3',NULL),('bde8345e-4e58-4db1-bec7-de89d68657cf','3',NULL),('be69f8c4-83be-4d4d-98f7-a4da0d84efb3','3',NULL),('c0f39a9d-d4b2-4f52-8810-4b34c518bdac','3',NULL),('c18e4727-e1af-4ce9-9651-2989df8d86bf','3',NULL),('c1a8f27f-e46a-4c4c-8271-d2b9922a5999','3',NULL),('c22ad585-329b-4630-9815-7942ad4f0891','3',NULL),('c24be0e7-ed2b-4d99-9174-8de03d3f49d2','3',NULL),('c3482278-9b4c-4f09-afbf-7c6f23dbd28a','3',NULL),('c37b451b-e9fe-453d-a1fb-c88ccd23a10e','3',NULL),('c3cafb9a-f9fd-42e6-8810-ca242e890b7f','3',NULL),('c48654f4-8358-43d4-89c6-88e715de71d4','3',NULL),('c4b46d0a-1306-424f-b192-156f49aca639','3',NULL),('c5374473-61ce-4fb5-8b83-82fbc6fd433b','3',NULL),('c5546056-c815-4ae5-b9c5-1955c9092f52','3',NULL),('c5ea8b3d-5776-4c66-9756-c78308128225','3',NULL),('c635b782-c0b2-4313-97e0-123dd7ee9bf1','3',NULL),('c68e3186-77e8-4407-bdcc-1d033b257bbc','3',NULL),('c716d74b-6fd7-41c2-b06d-a69f02450a58','3',NULL),('c759539d-748a-4a5b-bacb-ca1b3b1a0c30','3',NULL),('c7a81150-8397-4e80-92b1-b04ac772fd1b','3',NULL),('c8571cbe-883a-44ed-8b46-218b5c77bd1d','3',NULL),('c87b9469-6e9b-4424-9a87-2172132b8f33','3',NULL),('ca282544-ad17-4a1a-bb81-32bc76f01307','3',NULL),('cb51423e-812c-49a8-93bb-be267aa4fda7','3',NULL),('cb725032-e135-44f3-8882-c6c9ce9907e9','3',NULL),('cba55615-0a53-4fb7-b0ac-8ad3c45874a2','3',NULL),('ccaea3f4-f436-4e64-b44d-f7ecb2d79bc9','3',NULL),('ccd16d84-179f-483e-8ea2-743a01a7a139','3',NULL),('cd8754c5-dd48-4814-9207-e37580edc616','3',NULL),('ce394ab2-e1f1-4712-9515-1d772db41252','3',NULL),('ce5104b2-be19-4964-9f73-bbbdb8450269','3',NULL),('cf416081-be5c-409e-9351-db6767e02310','3',NULL),('cf7cae9e-386c-4ca9-8aff-df6181676317','3',NULL),('cfa0bc39-4109-40cb-bc64-eed1bf713ca6','3',NULL),('cfd01b47-fe63-4141-a440-f9eb67035c8b','3',NULL),('d00e2621-a882-475e-8ec1-fe24589d8355','3',NULL),('d0231039-96bb-456e-a79b-d08926152812','3',NULL),('d060f21a-a313-4bd8-b833-643a37fe8d41','3',NULL),('d09457dc-413f-4f48-b0a1-665aeca07d0d','3',NULL),('d123d687-e2e2-4bb2-85e5-c9b57f9539d1','3',NULL),('d18abf7d-838b-44e8-ab15-5d940a8c256d','3',NULL),('d1c234e3-6ff7-4173-9b69-8daade36d7bb','3',NULL),('d228e7af-2b22-4d19-bd22-74dfb4a5a9ea','3',NULL),('d2fb65e8-d55e-4970-be43-329d5011ed18','3',NULL),('d44c0e97-68c1-4cb1-ac48-59898c613d3b','3',NULL),('d49f5c3d-51b1-42df-90f6-8af33c8b78c4','3',NULL),('d546182e-9c93-475e-bdeb-5a536062805c','3',NULL),('d5d2e04f-f648-441e-af78-a0aa2a9ba7ec','3',NULL),('d6052a03-c00f-4b20-8759-fc05c69875bc','3',NULL),('d6bc03a2-dae0-4b5f-bcd3-e3eb0e2edfa9','3',NULL),('d7590060-51b8-497b-8785-c23637ac81c1','3',NULL),('d7d79f88-2e93-4227-bea7-ca76d87038cf','3',NULL),('d87422ee-4606-4edb-ac4b-735ef8c431f6','3',NULL),('d8767d67-14be-411d-98d3-a96a9e16e520','3',NULL),('d8854d5b-a949-464e-8660-74b0102a3232','3',NULL),('d92ab891-1aa9-459b-aad6-7d36fee648d4','3',NULL),('d9c83a18-99c2-427a-b3b0-c927ba7642ba','3',NULL),('d9d08ce7-2be0-4040-a79c-42ae353f2ce2','3',NULL),('d9f432d5-ecda-4e2d-84d5-893fb856c010','3',NULL),('da2ab79d-28d4-47e3-95f0-61957f678e82','3',NULL),('da99d54e-92c2-444c-b29b-a87f57a2cf30','3',NULL),('dc1088c8-d1b6-4452-bf86-2efd0af57fa6','3',NULL),('dc1a4c05-57e0-42d9-8bad-368ba145c2bf','3',NULL),('dca11eed-ef0d-4938-8103-163a19390d58','3',NULL),('de273bc7-0d53-4630-aa76-56a4d5fc6a04','3',NULL),('de8e873a-9de1-41cd-b6b9-368a31a83cf7','3',NULL),('deebda61-a975-48e0-9afd-683bb63846e1','3',NULL),('df017b50-8f3f-4628-bf34-026dc0e7f67b','3',NULL),('e07777ea-baba-4dd6-86c8-a1f9c09aa668','3',NULL),('e1cc1edf-a1b8-41f5-b69e-4e7dd8dec51f','3',NULL),('e2bfe834-be70-4787-a7a6-e9874fe62107','3',NULL),('e36ca475-ec14-453f-a113-b21448827b5b','3',NULL),('e39ae471-cc14-4fdb-b2f6-51edb92ac799','3',NULL),('e3c2bcb9-f56e-4d1f-9e06-21efdf877f9b','3',NULL),('e41b99a5-3288-490d-a804-6e2817237dbd','3',NULL),('e4646918-0b9c-417d-9298-a39c54e07f2f','3',NULL),('e47eca1a-0727-4da3-b74d-5ce132f4e2de','3',NULL),('e4a226c5-9d1a-4c02-92e9-5760b02f7b41','3',NULL),('e4f0b657-1b68-469b-a5b9-069a8c8894b9','3',NULL),('e5502253-090a-437a-ac87-f7514ce1fac0','3',NULL),('e5d37a88-593e-42bf-bca3-eb87c5848ccd','3',NULL),('e68d5c69-24a7-4c88-9ffe-28e5e0942790','3',NULL),('e6af57d2-007f-4880-a9aa-0a9840665e10','3',NULL),('e6fb4510-b0b7-47c1-ba9a-96e11fab1589','3',NULL),('e71fed55-c07f-4fd6-aafe-0646181e3e40','3',NULL),('e76d71ed-2687-43e0-b33e-52d073dbca9d','3',NULL),('e89fb1f9-e0f5-4769-a006-fb04251c6440','3',NULL),('e98b8f16-3b16-4e03-9231-96411676cad8','3',NULL),('e99aa89b-4e2b-4d06-91d5-cadb2800640b','3',NULL),('e9f59a89-e33e-4be2-89ef-5c85878a5dad','3',NULL),('ea3fc8dd-46dd-4fba-b53c-b9d3976d972a','3',NULL),('ea41afa7-33b3-4ef4-be61-faec85b62e06','3',NULL),('eb28f6e3-a3fc-4685-9592-c57e64bb4b5f','3',NULL),('eb54de99-6cf9-4afd-b429-de5fb4511b35','3',NULL),('ebc1ee7b-56e5-46c3-80c6-e39c3f81cf32','3',NULL),('ed0bcf8c-5615-4031-a83b-46cfe78d12db','3',NULL),('ed1b7bac-6e8a-4015-a5b9-530391d3bcbe','3',NULL),('f14d14ba-e292-4afa-bea3-89edb4122e47','3',NULL),('f17fa6c8-3db6-4baf-a2fb-801757f81877','3',NULL),('f22e90a4-793f-419b-a9ec-f5805235cdac','3',NULL),('f265cf53-e1c0-46b1-a185-958e15cebcf8','3',NULL),('f32ce23d-285e-4913-b876-79d0c8cc5ddb','3',NULL),('f491520c-170e-4129-ba50-a1ee7a4d5bb5','3',NULL),('f4c1bc38-5a14-4dad-91a4-fa282be012cf','3',NULL),('f4d714f9-e0e2-4279-9b3d-413f086faec1','3',NULL),('f4e873d8-b4a7-41eb-84ca-9953acf7949c','3',NULL),('f512a51a-e5c3-4b9d-9ddb-788bd127b542','3',NULL),('f65c56e5-a9a1-44fa-97c9-d825e03978d1','3',NULL),('f80a55e9-a2f3-4fad-8cf2-4dfd599fef61','3',NULL),('f95e5e37-84d7-4692-b7fc-3fc3b6118453','3',NULL),('fa257842-3175-46ab-87b9-a13d68497107','3',NULL),('fa459624-fa0f-4bf0-ab18-d1a5c8e311f4','3',NULL),('fab7290b-9e76-4caf-9612-1ebeedaf5e88','3',NULL),('fd2393a2-bb56-44d6-8952-93f972935ac1','3',NULL),('fd7be155-ddec-4947-b3de-43c09adcee04','3',NULL),('fe606cd8-e8ab-421c-9986-07eac2b0e180','3',NULL),('ff71a47f-d94f-45ad-9a0e-812545e6dd23','3',NULL);
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
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
