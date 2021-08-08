CREATE DATABASE  IF NOT EXISTS `mechanic_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mechanic_shop`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 192.168.8.130    Database: mechanic_shop
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `car_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `car_status` varchar(255) DEFAULT NULL,
  `proof` varchar(255) DEFAULT NULL,
  `report` varchar(255) DEFAULT NULL,
  `total_cost` double NOT NULL,
  `booking_booking_id` int DEFAULT NULL,
  `insurance_reg_number` int DEFAULT NULL,
  `mechanic_stuff_number` int DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  UNIQUE KEY `car_id` (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (10,'New Car',NULL,NULL,5535.61,10,215784490,NULL),(11,'New Car',NULL,NULL,15505.92,11,215784491,NULL),(12,'New Car',NULL,NULL,4651.78,12,215784492,NULL),(13,'New Car',NULL,NULL,5535.61,13,215784493,NULL),(14,'New Car',NULL,NULL,500,14,215784494,NULL),(15,'New Car',NULL,NULL,4651.78,15,215784495,NULL),(16,'New Car',NULL,NULL,500,16,215784496,NULL),(17,'New Car',NULL,NULL,500,17,215784497,NULL),(18,'New Car',NULL,NULL,4651.78,18,215784498,NULL),(19,'New Car',NULL,NULL,5535.61,19,215784499,NULL);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_booking`
--

DROP TABLE IF EXISTS `client_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_booking` (
  `booking_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `car_year` int NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `insurance` int NOT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `service_type` varchar(255) DEFAULT NULL,
  `sleep_over` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `booking_id` (`booking_id`),
  UNIQUE KEY `UK_q90srnppyr9j6aupr8ri00ewj` (`email`),
  UNIQUE KEY `UK_d8j68hvywj52rqmayw807xo13` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_booking`
--

LOCK TABLES `client_booking` WRITE;
/*!40000 ALTER TABLE `client_booking` DISABLE KEYS */;
INSERT INTO `client_booking` VALUES (10,'Sunnyside','155 Troye Street','Toyota',2017,'Pretoria','mkhonkosi28@gmail.com','Tholinhlanhla',215784490,'Hlophe','Not starting engine','Yaris','0728108800','Engine Maintenance','yes','South Africa','0002'),(11,'Ivy Park','6 Prince Street','BMW',2019,'Polokwane','tgramashala@gmail.com','Thapelo',215784491,'Ramashala','Faulty Gearbox','X4','0728043265','Air Condition Services','yes','South Africa','0700'),(12,'Soshanguve','3862 malibongwe street','Mercedes-Benz',2014,'Pretoria','moimakatlego2@gmail.com','Katlego',215784492,'Moima','New Radiator','AMG','0797794520','Wheel Alignment','yes','South Africa','0102'),(13,'Sunnyside','6397 Phola Park','Volkswagen',2018,'Piet Retief','sbunkosi@gmail.com','Sbusiso',215784493,'Nkosi','Not starting engine','Polo R','0716363184','Replacement','yes','South Africa','2380'),(14,'Sunnyside','144 Mayo Street','Audi',2018,'Johannesburg','khumalovp@gmail.com','Vusi',215784494,'Khumalo','Not starting engine','A3','0637778547','Engine Maintenance','yes','South Africa','0002'),(15,'Sunnyside','170 Troye Drive','Mazda',2016,'Piet Retief','mikekhumalo@gmail.com','Mike',215784495,'Khumalo','Not starting engine','Mazda 3','0613232458','Transmission Repair','yes','South Africa','2380'),(16,'Fauna Park','23 McDonalds Street','Nissan',2018,' Polokwane','matomeraphadu@gmail.com','Matome',215784496,'Raphadu','Not starting engine','Qashqai','0814615789','Transmission Repair','yes','South Africa','0700'),(17,'Bendor Park','172 Tsar Street','Toyata',2018,' Polokwane','katlegopeterSeakamela@gmail.com','Katlego',215784497,'Seakamela','Gear Box','Rush','0728763047','Gear box repair','yes','South Africa','0700'),(18,'Acardia','404 Pretorious','BMW',2018,' Pretoria','mtselepe@gmail.com','Martin',215784498,'Selepe','Wheel Alignment','3 Series','0848403969','Wheel alignment repair','yes','South Africa','0002'),(19,'Pretoria Central','127 Visagie','Mazda',2019,' Pretoria','KaraboTshoke@gmail.com','Karabo',215784499,'Tshoke','Air conditioner','mazda 2','0814617685','Air conditioner Repair','yes','South Africa','0002');
/*!40000 ALTER TABLE `client_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_company`
--

DROP TABLE IF EXISTS `insurance_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_company` (
  `reg_number` int NOT NULL,
  `active` int NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `permissions` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reg_number`),
  UNIQUE KEY `UK_mhw5qa0af099q2rpen2javj48` (`email`),
  UNIQUE KEY `UK_n3oohg8rq01dqxfgnt582y28b` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_company`
--

LOCK TABLES `insurance_company` WRITE;
/*!40000 ALTER TABLE `insurance_company` DISABLE KEYS */;
INSERT INTO `insurance_company` VALUES (215784490,1,'155 Troye Str','TrioTouch','Pritoria','Trio Touch','South Africa','info@triotouch.ac.za','$2a$10$SjQ.AgLBfIDClZAJKGuihufGUDS/iaLywSCAclQ6RZeQigIoOLgvq','INSURANCE','0112520660','INSURANCE','yes','0041'),(215784491,1,'6 Prince street','Gigaba','Johannesburg','Gigaba','South Africa','info@gigaba.ac.za','$2a$10$IyoOeIEgJPvkWwpTHBNsJu6YbmjEioRHnT5Ie.Y4eaw1W1iYP0jt6','INSURANCE','0112520601','INSURANCE','yes','0020'),(215784492,1,'404 Pretrious','Khoza_Sons','Pritoria','Khoza and Sons','South Africa','info@khozaandsons.ac.za','$2a$10$nrQ7wusHWtgEXv.T5YyspewC6cc7K/HTGc7Q7D.D0NBOmd5uy2nqe','INSURANCE','0112529664','INSURANCE','yes','0012'),(215784493,1,'156 Troye Str','Marobela','Johannesburg','Marobela','South Africa','info@marobela.ac.za','$2a$10$GlY9MPIUJqkM.l3qeWeAze9z5U4KIaQM.58wOoT/O/jYQzHmktn12','INSURANCE','0112520668','INSURANCE','yes','0002'),(215784494,1,'153 Celliers Street','InsuranceSys','Pritoria','InsuranceSys','South Africa','info@insurancesys.ac.za','$2a$10$.C3dRjQYG9Lx16QcKWemxeQKynpIzb.TyePCtG4.2hkrzkv6Me5re','INSURANCE','0112570670','INSURANCE','yes','0009'),(215784495,1,'111 Troye Str','AmazonInsu','Johannesburg','AmazonInsu','South Africa','info@amazoninsu.ac.za','$2a$10$00Wra57qjstATMoxLKa0iOMoobZgC.siQZQf1TK9ZmOwpS/O/t4h2','INSURANCE','0112523669','INSURANCE','yes','0008'),(215784496,1,'248 Lilian Street','InsuMeNow','Piet Retief','InsuMeNow','South Africa','info@insumenow.ac.za','$2a$10$ro3970BKUzuHYnWqsF1JbOSUmCb1R94kuRJ3e8izpty9auretZ5HK','INSURANCE','0112523781','INSURANCE','yes','2380'),(215784497,1,'296 Mandela Street','MyCarPlan','Johannesburg','MyCarPlan','South Africa','info@mycarplan.ac.za','$2a$10$jF6ztDEf7HtaPkVErZmLdOvQ2ppgY9UxMRqsT3AFUy2MsVyqErFWu','INSURANCE','0112533745','INSURANCE','yes','0004'),(215784498,1,'101 Malebo Street','best_car_insurance','Piet Retief','Best Car Insurance','South Africa','info@bestcarinsurance.ac.za','$2a$10$zRXQPp7T9V5q4fmtWBjlgexIxlhXteqBno0zEhJkRDSzbKpFb55lS','INSURANCE','0112515446','INSURANCE','yes','2380'),(215784499,1,'125 Sapelo Street','car_home','Pritoria','Car Home','South Africa','info@carhome.ac.za','$2a$10$Jw1tr1nia56c0ITKicGQ/e9KivbYzpb0PWYuGaCBEi.EmOOW/f8ne','INSURANCE','0112584421','INSURANCE','yes','0002');
/*!40000 ALTER TABLE `insurance_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mechanic`
--

DROP TABLE IF EXISTS `mechanic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mechanic` (
  `stuff_number` int NOT NULL,
  `active` int NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `permissions` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(45) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stuff_number`),
  UNIQUE KEY `UK_mhnxvegebk8ojpw89epuypi13` (`email`),
  UNIQUE KEY `UK_exonbsqipjywpmug966lj4fnr` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mechanic`
--

LOCK TABLES `mechanic` WRITE;
/*!40000 ALTER TABLE `mechanic` DISABLE KEYS */;
INSERT INTO `mechanic` VALUES (214612976,1,NULL,'tgramashala@gmail.com','Thapelo','Male','Ramashala','$2a$10$o3GgrWUg0tFhDwRy8X0Eie.Uk3Xv8ga8x0NOJn53n2q9tH/iIeD1e','ADMIN, MECHANIC','0729698263',NULL,'ADMIN, MECHANIC','true'),(215000524,1,NULL,'Moimakatlego2@gmail.com ','Katlego','Female','Moima','$2a$10$G1f94W0IsaAnrkQ88AP5y.U7m0V7vJ0tBqmX.HLSbwJDBkp66PUiS','ADMIN, MECHANIC','0715406987',NULL,'ADMIN, MECHANIC','true'),(215667308,1,NULL,'mkhonkosi28@gmail.com','Tholinhlanhla','Male','Hlophe','$2a$10$ZO6WXiTYmhevR749kFolhOOoK/GlWhJisA6odFNmtquW7yrpdobYO','ADMIN, MECHANIC','0728108800',NULL,'ADMIN, MECHANIC','true'),(216770100,1,NULL,'thabisomanamela@gmail.com','Thabiso','Male','Manamela','$2a$10$d7n7XHUrTNBE2oJ5GtO0ReeQAmMkiZ/4nVsmp4BN86m7v0ucnvDlC','MECHANIC','0728108801',NULL,'MECHANIC','true'),(216770101,1,NULL,'mnothomasangu@gmail.com','Mnotho','Male','Masangu','$2a$10$niQQWadYEczG0UULZvb3PO0Jus7srtseTYj9/BFtv9dXOtv3XvQ1K','MECHANIC','0728108802',NULL,'MECHANIC','true'),(216770102,1,NULL,'GeorgeNgobeni89@gmail.com ','George','Female','Ngobeni','$2a$10$hsULw1CpyT62X8VZNdPOjOgB9eeLSbCr9IulaBnyi3AC5YPXc5LB6','MECHANIC','0728108803',NULL,'MECHANIC','true'),(216770103,1,NULL,'thabithaakipelu@gmail.com','Thabitha','Female','Akinpelu','$2a$10$PS6MZme5qhAvtarsHUqibuSd9XUz5QyKVSuIm4iBPW2LYabSNde4C','MECHANIC','0728108804',NULL,'MECHANIC','true'),(216770104,1,NULL,'tshego1996@gmail.com','Tshego','Male','Madiba','$2a$10$uf/D0dPMx24Vv5t.7fQyxukGvy40sEfzesI.aXm8OP0hdHxsBvMKW','MECHANIC','0728108805',NULL,'MECHANIC','true'),(216770105,1,NULL,'mikekhumalo@gmail.com','Mike','Male','Khumalo','$2a$10$AwKH8uG2BkrV0AZRZijDXePKgPDDZU2TAGnG06E1lBjsbhOnI2eYG','MECHANIC','0728108806',NULL,'MECHANIC','true'),(217450985,1,NULL,'moloromalepe17@gmail.com','Stephanie','Female','Malepe','$2a$10$MWqehYr.0xI/PxkjY33iW.9IYWMGW.7xIWmoReatBWFZv8/9NYYFW','ADMIN, MECHANIC','0672476347',NULL,'ADMIN, MECHANIC','true');
/*!40000 ALTER TABLE `mechanic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_date` date DEFAULT NULL,
  `car_car_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (10,'2020-01-23',19),(11,'2020-02-01',18),(12,'2020-05-11',17),(13,'2020-09-22',16),(14,'2020-09-12',15),(15,'2020-09-20',14),(16,'2020-10-30',13),(17,'2020-11-14',12),(18,'2020-11-06',11),(19,'2020-11-03',10);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL,
  `price` double NOT NULL,
  `service_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (2020,5535.61,'Engine Maintenance'),(2021,500,'Wheel Alignment'),(2022,15505.92,'Air Condition Services'),(2023,4651.78,'Transmission Repair And Replacement');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_mechanic`
--

DROP TABLE IF EXISTS `service_mechanic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_mechanic` (
  `service_id` int NOT NULL,
  `mechanic_stuff_number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_mechanic`
--

LOCK TABLES `service_mechanic` WRITE;
/*!40000 ALTER TABLE `service_mechanic` DISABLE KEYS */;
INSERT INTO `service_mechanic` VALUES (2020,215667308),(2021,215667308),(2022,214612976),(2023,214612976),(2020,215000524),(2021,215000524),(2022,217450985),(2023,217450985),(2020,216770100),(2021,216770101),(2022,216770102),(2023,216770103),(2020,216770104),(2021,216770105);
/*!40000 ALTER TABLE `service_mechanic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mechanic_shop'
--

--
-- Dumping routines for database 'mechanic_shop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-25  4:28:35
