-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vendas
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
-- Table structure for table `tblclientes`
--

DROP TABLE IF EXISTS `tblclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblclientes` (
  `cpf_cnpj` varchar(20) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `rg_ie` varchar(15) DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `valor_imposto` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`cpf_cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblclientes`
--

LOCK TABLES `tblclientes` WRITE;
/*!40000 ALTER TABLE `tblclientes` DISABLE KEYS */;
INSERT INTO `tblclientes` VALUES ('123.456.789-00','Pedro da Silva','Rua Vergueiro 1234','4.567.890','f',2500,250,2750),('234.567.890-11','Maria Pereira','Rua São Bento 345','5.6787.901','f',3000,300,3300),('345.678.901-22','Leonora Alvez','Rua Parati 654','6.789.012','f',1500,150,1650),('56.789.123/0001-00','Virtual Tecnologia S/A','Av. Brasil 3456','567.890.123','j',35000,7000,42000),('67.890.234/0001-11','J&M Associados Ltda.','Rua Paraná 765','678.901.234','j',15000,3000,18000),('89.012.345/0001-22','Alvorada Empreendimentos S/A','Av. Constantino Alves 876','890.123.456','j',50000,10000,60000);
/*!40000 ALTER TABLE `tblclientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-09 10:55:50
