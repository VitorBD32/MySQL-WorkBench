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
-- Temporary view structure for view `professorespordisciplina`
--

DROP TABLE IF EXISTS `professorespordisciplina`;
/*!50001 DROP VIEW IF EXISTS `professorespordisciplina`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `professorespordisciplina` AS SELECT 
 1 AS `DISCIPLINA`,
 1 AS `COD_PROF`,
 1 AS `COD_DEPT`,
 1 AS `NOME_PROF`,
 1 AS `TEL_PROF`,
 1 AS `EMAIL_PROF`,
 1 AS `CPF_PROF`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `alunosporcurso`
--

DROP TABLE IF EXISTS `alunosporcurso`;
/*!50001 DROP VIEW IF EXISTS `alunosporcurso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alunosporcurso` AS SELECT 
 1 AS `NOME_CURSO`,
 1 AS `COD_ALUNO`,
 1 AS `COD_CURSO`,
 1 AS `NOME_ALUNO`,
 1 AS `CPF_ALUNO`,
 1 AS `DATA_NASC`,
 1 AS `TEL_ALUNO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `departamentosecursos`
--

DROP TABLE IF EXISTS `departamentosecursos`;
/*!50001 DROP VIEW IF EXISTS `departamentosecursos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `departamentosecursos` AS SELECT 
 1 AS `NOME_DEPT`,
 1 AS `COD_CURSO`,
 1 AS `COD_DEPT`,
 1 AS `NOME_CURSO`,
 1 AS `DESCR_CURSO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `matriculasdeumaluno`
--

DROP TABLE IF EXISTS `matriculasdeumaluno`;
/*!50001 DROP VIEW IF EXISTS `matriculasdeumaluno`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `matriculasdeumaluno` AS SELECT 
 1 AS `NOME_ALUNO`,
 1 AS `NOME_DISC`,
 1 AS `COD_MAT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `disciplinasporcurso`
--

DROP TABLE IF EXISTS `disciplinasporcurso`;
/*!50001 DROP VIEW IF EXISTS `disciplinasporcurso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `disciplinasporcurso` AS SELECT 
 1 AS `NOME_CURSO`,
 1 AS `COD_DISC`,
 1 AS `NOME_DISC`,
 1 AS `DESC_DISC`,
 1 AS `CARGA_HORARIA`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `professorespordisciplina`
--

/*!50001 DROP VIEW IF EXISTS `professorespordisciplina`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `professorespordisciplina` AS select `d`.`NOME_DISC` AS `DISCIPLINA`,`p`.`COD_PROF` AS `COD_PROF`,`p`.`COD_DEPT` AS `COD_DEPT`,`p`.`NOME_PROF` AS `NOME_PROF`,`p`.`TEL_PROF` AS `TEL_PROF`,`p`.`EMAIL_PROF` AS `EMAIL_PROF`,`p`.`CPF_PROF` AS `CPF_PROF` from ((`professor` `p` join `matricula_prof` `m`) join `disciplina` `d`) where ((`p`.`COD_PROF` = `m`.`COD_PROF`) and (`d`.`COD_DISC` = `m`.`COD_DISC`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `alunosporcurso`
--

/*!50001 DROP VIEW IF EXISTS `alunosporcurso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alunosporcurso` AS select `c`.`NOME_CURSO` AS `NOME_CURSO`,`a`.`COD_ALUNO` AS `COD_ALUNO`,`a`.`COD_CURSO` AS `COD_CURSO`,`a`.`NOME_ALUNO` AS `NOME_ALUNO`,`a`.`CPF_ALUNO` AS `CPF_ALUNO`,`a`.`DATA_NASC` AS `DATA_NASC`,`a`.`TEL_ALUNO` AS `TEL_ALUNO` from (`aluno` `a` join `curso` `c`) where (`a`.`COD_CURSO` = `c`.`COD_CURSO`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `departamentosecursos`
--

/*!50001 DROP VIEW IF EXISTS `departamentosecursos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `departamentosecursos` AS select `d`.`NOME_DEPT` AS `NOME_DEPT`,`c`.`COD_CURSO` AS `COD_CURSO`,`c`.`COD_DEPT` AS `COD_DEPT`,`c`.`NOME_CURSO` AS `NOME_CURSO`,`c`.`DESCR_CURSO` AS `DESCR_CURSO` from (`departamento` `d` join `curso` `c`) where (`d`.`COD_DEPT` = `c`.`COD_DEPT`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `matriculasdeumaluno`
--

/*!50001 DROP VIEW IF EXISTS `matriculasdeumaluno`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `matriculasdeumaluno` AS select `a`.`NOME_ALUNO` AS `NOME_ALUNO`,`d`.`NOME_DISC` AS `NOME_DISC`,`m`.`COD_MAT` AS `COD_MAT` from ((`aluno` `a` join `disciplina` `d`) join `matricula` `m`) where ((`d`.`COD_DISC` = `m`.`COD_DISC`) and (`a`.`COD_ALUNO` = `m`.`COD_ALUNO`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `disciplinasporcurso`
--

/*!50001 DROP VIEW IF EXISTS `disciplinasporcurso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `disciplinasporcurso` AS select `c`.`NOME_CURSO` AS `NOME_CURSO`,`d`.`COD_DISC` AS `COD_DISC`,`d`.`NOME_DISC` AS `NOME_DISC`,`d`.`DESC_DISC` AS `DESC_DISC`,`d`.`CARGA_HORARIA` AS `CARGA_HORARIA` from ((`disciplina` `d` join `curso` `c`) join `cur_disc` `q`) where ((`d`.`COD_DISC` = `q`.`COD_DISC`) and (`c`.`COD_CURSO` = `q`.`COD_CURSO`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-09 10:55:49
