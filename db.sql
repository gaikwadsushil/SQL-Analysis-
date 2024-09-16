CREATE DATABASE  IF NOT EXISTS `banksystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `banksystem`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: banksystem
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `Account_No` int(11) NOT NULL,
  `Branch_id` int(11) DEFAULT NULL,
  `Balance` decimal(10,0) DEFAULT NULL,
  `Acc_Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Account_No`),
  KEY `Branch_id` (`Branch_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Branch_id`) REFERENCES `branch` (`Branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (101,1,100000,'Savings'),(102,2,200000,'Current'),(103,3,500000,'Savings'),(104,4,1000000,'Current'),(105,5,2000000,'Savings'),(106,6,5000000,'Current');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avail`
--

DROP TABLE IF EXISTS `avail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avail` (
  `Avail_id` int(11) NOT NULL,
  `Loan_id` int(11) DEFAULT NULL,
  `Custid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Avail_id`),
  KEY `Loan_id` (`Loan_id`),
  KEY `Custid` (`Custid`),
  CONSTRAINT `avail_ibfk_1` FOREIGN KEY (`Loan_id`) REFERENCES `loan` (`Loan_id`),
  CONSTRAINT `avail_ibfk_2` FOREIGN KEY (`Custid`) REFERENCES `customer` (`Custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avail`
--

LOCK TABLES `avail` WRITE;
/*!40000 ALTER TABLE `avail` DISABLE KEYS */;
INSERT INTO `avail` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6);
/*!40000 ALTER TABLE `avail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `Bank_id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (1,'HDFC Bank','HDFC','Mumbai'),(2,'ICICI Bank','ICICI','Delhi'),(3,'SBI Bank','SBI','Chennai');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `Branch_id` int(11) NOT NULL,
  `Bank_id` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Branch_id`),
  KEY `Bank_id` (`Bank_id`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`Bank_id`) REFERENCES `bank` (`Bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,1,'HDFC Branch 1','Mumbai'),(2,1,'HDFC Branch 2','Delhi'),(3,2,'ICICI Branch 1','Chennai'),(4,2,'ICICI Branch 2','Bangalore'),(5,3,'SBI Branch 1','Kolkata'),(6,3,'SBI Branch 2','Hyderabad');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Custid` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Rahul Sharma','Mumbai','9876543210'),(2,'Priya Patel','Delhi','9876543211'),(3,'Kumar Singh','Chennai','9876543212'),(4,'Neha Gupta','Bangalore','9876543213'),(5,'Rajesh Jain','Kolkata','9876543214'),(6,'Sushil Gaikwad','Hyderabad','9876543215');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit`
--

DROP TABLE IF EXISTS `deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposit` (
  `deposit_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `deposit_amount` decimal(10,0) DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  PRIMARY KEY (`deposit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit`
--

LOCK TABLES `deposit` WRITE;
/*!40000 ALTER TABLE `deposit` DISABLE KEYS */;
INSERT INTO `deposit` VALUES (1,1,101,1000,'2023-04-01'),(2,2,102,500,'2023-04-05'),(3,3,103,2000,'2023-04-10');
/*!40000 ALTER TABLE `deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hold`
--

DROP TABLE IF EXISTS `hold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hold` (
  `Hold_id` int(11) NOT NULL,
  `Account_No` int(11) DEFAULT NULL,
  `Custid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Hold_id`),
  KEY `Account_No` (`Account_No`),
  KEY `Custid` (`Custid`),
  CONSTRAINT `hold_ibfk_1` FOREIGN KEY (`Account_No`) REFERENCES `account` (`Account_No`),
  CONSTRAINT `hold_ibfk_2` FOREIGN KEY (`Custid`) REFERENCES `customer` (`Custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hold`
--

LOCK TABLES `hold` WRITE;
/*!40000 ALTER TABLE `hold` DISABLE KEYS */;
INSERT INTO `hold` VALUES (1,101,1),(2,102,2),(3,103,3),(4,104,4),(5,105,5),(6,106,6);
/*!40000 ALTER TABLE `hold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `Loan_id` int(11) NOT NULL,
  `Loan_type` varchar(255) DEFAULT NULL,
  `Amount` decimal(10,0) DEFAULT NULL,
  `Branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Loan_id`),
  KEY `Branch_id` (`Branch_id`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`Branch_id`) REFERENCES `branch` (`Branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,'Home Loan',5000000,1),(2,'Personal Loan',1000000,2),(3,'Car Loan',2000000,3),(4,'Education Loan',500000,4),(5,'Business Loan',10000000,5),(6,'Gold Loan',500000,6);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer` (
  `Offer_id` int(11) NOT NULL,
  `Loan_id` int(11) DEFAULT NULL,
  `Branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Offer_id`),
  KEY `Loan_id` (`Loan_id`),
  KEY `Branch_id` (`Branch_id`),
  CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`Loan_id`) REFERENCES `loan` (`Loan_id`),
  CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`Branch_id`) REFERENCES `branch` (`Branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6);
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`Loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,100.00,'2022-01-01'),(2,1,200.00,'2022-02-01'),(3,2,50.00,'2022-03-01');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repayment`
--

DROP TABLE IF EXISTS `repayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repayment` (
  `repayment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `repayment_amount` decimal(10,0) DEFAULT NULL,
  `repayment_date` date DEFAULT NULL,
  PRIMARY KEY (`repayment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repayment`
--

LOCK TABLES `repayment` WRITE;
/*!40000 ALTER TABLE `repayment` DISABLE KEYS */;
INSERT INTO `repayment` VALUES (1,1,1,500,'2023-04-03'),(2,2,2,250,'2023-04-08'),(3,3,3,1000,'2023-04-13');
/*!40000 ALTER TABLE `repayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawal`
--

DROP TABLE IF EXISTS `withdrawal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal` (
  `withdrawal_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `withdrawal_amount` decimal(10,0) DEFAULT NULL,
  `withdrawal_date` date DEFAULT NULL,
  PRIMARY KEY (`withdrawal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawal`
--

LOCK TABLES `withdrawal` WRITE;
/*!40000 ALTER TABLE `withdrawal` DISABLE KEYS */;
INSERT INTO `withdrawal` VALUES (1,1,101,200,'2023-04-02'),(2,2,102,100,'2023-04-07'),(3,3,103,500,'2023-04-12');
/*!40000 ALTER TABLE `withdrawal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-16 20:26:58
