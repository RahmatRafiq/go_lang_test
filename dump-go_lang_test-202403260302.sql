-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: go_lang_test
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lecturer_id` int DEFAULT NULL,
  `credits` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lecturer` (`lecturer_id`),
  CONSTRAINT `fk_lecturer` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Johnnie',1,1),(2,'Nona',2,3),(3,'Penn',3,1),(4,'Noby',4,2),(5,'Tersina',5,3),(7,'viverra pede',1,4),(8,'nisl duis',2,4),(9,'ultrices aliquet',3,3),(10,'eget',4,3),(11,'id',5,4),(13,'fusce lacus',3,1),(14,'sit',4,4),(15,'vestibulum',2,3),(16,'nonummy',5,2),(17,'turpis eget',5,2),(18,'cubilia',3,1),(19,'nulla nunc',2,3),(20,'quis lectus',2,2),(21,'dui',1,1),(22,'amet cursus',4,1),(23,'id justo',3,1),(24,'ut',5,2),(25,'dolor vel',5,1),(26,'nam',5,4),(27,'vestibulum',2,3);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES (1,'Edie','Suite 83'),(2,'Elberta','PO Box 24236'),(3,'Noreen','Apt 38'),(4,'Charlean','Room 559'),(5,'Silvia','Room 385');
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_course_mid` (`course_id`),
  KEY `fk_student_mid` (`student_id`),
  CONSTRAINT `fk_course_mid` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_student_mid` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (1,4,8,61.00,'2024-02-26','middle_exam'),(2,20,18,22.00,'2024-02-10','final_exam'),(3,1,11,95.00,'2023-08-01','middle_exam'),(4,11,19,52.00,'2023-08-17','middle_exam'),(5,19,25,80.00,'2024-03-19','middle_exam'),(6,27,15,93.00,'2023-09-03','middle_exam'),(7,19,16,6.00,'2023-06-09','middle_exam'),(8,7,22,7.00,'2024-01-20','middle_exam'),(9,18,9,67.00,'2023-07-31','middle_exam'),(10,25,24,69.00,'2023-11-25','middle_exam'),(11,15,10,65.00,'2023-08-01','middle_exam'),(12,7,25,67.00,'2024-02-27','middle_exam'),(13,15,24,47.00,'2023-04-07','middle_exam'),(14,9,8,90.00,'2023-08-05','middle_exam'),(15,24,20,91.00,'2023-09-24','middle_exam'),(16,18,18,33.00,'2024-02-10','middle_exam'),(17,18,10,56.00,'2023-06-09','middle_exam'),(18,22,17,88.00,'2023-12-21','middle_exam'),(20,24,9,75.00,'2023-07-09','middle_exam'),(21,21,13,92.00,'2023-07-08','middle_exam'),(22,25,20,54.00,'2023-12-25','middle_exam'),(23,27,20,20.00,'2023-07-30','middle_exam'),(24,24,23,31.00,'2023-08-15','final_exam'),(25,23,9,28.00,'2023-12-11','final_exam'),(26,18,12,77.00,'2024-01-14','final_exam'),(27,20,20,17.00,'2023-04-02','final_exam'),(28,27,17,64.00,'2023-05-21','final_exam'),(29,22,12,69.00,'2023-07-07','final_exam'),(30,22,21,35.00,'2023-10-27','final_exam'),(31,21,23,91.00,'2023-06-24','final_exam'),(32,21,6,66.00,'2024-02-29','final_exam'),(33,25,6,22.00,'2023-07-15','final_exam'),(34,25,10,85.00,'2023-11-09','final_exam');
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(255) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `starting_year` year DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (6,'Putri Ayu','Jakarta',2020),(7,'Budi Santoso','Surabaya',2019),(8,'Dewi Cahaya','Bandung',2021),(9,'Agus Setiawan','Yogyakarta',2022),(10,'Ratna Sari','Semarang',2023),(11,'Ahmad Fauzi','Medan',2020),(12,'Siti Rahayu','Palembang',2019),(13,'Darma Wijaya','Makassar',2021),(14,'Ani Widya','Denpasar',2022),(15,'Hadi Pratama','Batam',2023),(16,'Citra Mulyani','Padang',2020),(17,'Joko Susilo','Pekanbaru',2019),(18,'Lina Nurhayati','Tangerang',2021),(19,'Rian Hidayat','Bogor',2022),(20,'Dina Safitri','Malang',2023),(21,'Fajar Hadi','Bandar Lampung',2020),(22,'Dwi Prasetyo','Bekasi',2019),(23,'Rini Utami','Cirebon',2021),(24,'Aldi Nugraha','Jambi',2022),(25,'Eva Susanti','Balikpapan',2023);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'go_lang_test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-26  3:02:29
