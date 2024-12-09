-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: teste3
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `COD_ALUNO` int NOT NULL,
  `COD_CURSO` int NOT NULL,
  `NOME_ALUNO` varchar(45) DEFAULT NULL,
  `CPF_ALUNO` char(14) DEFAULT NULL,
  `DATA_NASC` date DEFAULT NULL,
  `TEL_ALUNO` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`COD_ALUNO`,`COD_CURSO`),
  KEY `COD_CURSO` (`COD_CURSO`),
  CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`COD_CURSO`) REFERENCES `curso` (`COD_CURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1003,666,'José Silva','123.456.789-00','2000-05-15','(00) 1234-5678'),(2005,666,'Maria Souza','987.654.321-00','1999-10-20','(00) 9876-5432'),(2316,333,'Ana Pereira','876.543.210-00','2000-12-05','(00) 8765-4321'),(3313,666,'Carlos Santos','456.789.123-00','2001-03-10','(00) 4567-8901'),(4494,333,'Fernanda Oliveira','321.654.987-00','2002-08-25','(00) 3210-9876'),(5132,333,'João Lima','234.567.890-00','2003-01-30','(00) 2345-6789');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-09 10:55:47
