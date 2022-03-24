-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: db_avistamiento_marino
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `categoria_toxinica`
--

DROP TABLE IF EXISTS `categoria_toxinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_toxinica` (
  `id_categoria_toxinica` int NOT NULL AUTO_INCREMENT,
  `reino` varchar(100) DEFAULT NULL,
  `filo` varchar(100) DEFAULT NULL,
  `clase` varchar(100) DEFAULT NULL,
  `orden` varchar(100) DEFAULT NULL,
  `familia` varchar(100) DEFAULT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `especie` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_categoria_toxinica`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_toxinica`
--

LOCK TABLES `categoria_toxinica` WRITE;
/*!40000 ALTER TABLE `categoria_toxinica` DISABLE KEYS */;
INSERT INTO `categoria_toxinica` VALUES (1,'animal','chordata','mammalia','	Artiodactyla','Balaenopteridae','Balaenoptera','musculus'),(2,'Animalia','Chordata','Actinopterygii','Cypriniformes','Cyprinidae','Danio','rerio');
/*!40000 ALTER TABLE `categoria_toxinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_avistamiento`
--

DROP TABLE IF EXISTS `tabla_avistamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_avistamiento` (
  `id_tabla_avistamiento` int NOT NULL AUTO_INCREMENT,
  `nombre_cientifico` varchar(100) NOT NULL,
  `lugar` varchar(100) NOT NULL,
  `coordenada` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `nota` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tabla_avistamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_avistamiento`
--

LOCK TABLES `tabla_avistamiento` WRITE;
/*!40000 ALTER TABLE `tabla_avistamiento` DISABLE KEYS */;
INSERT INTO `tabla_avistamiento` VALUES (1,'Balaenoptera musculus','Santa marta','11 14 50','Alvaro narvaez','sin nota'),(2,'Danio rerio','Santa Marta','11 14 50','Alvaro','sin nota');
/*!40000 ALTER TABLE `tabla_avistamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_especie_marina`
--

DROP TABLE IF EXISTS `tabla_especie_marina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_especie_marina` (
  `id_tabla_especie_marina` int NOT NULL AUTO_INCREMENT,
  `nombre_comun` varchar(100) NOT NULL,
  `nombre_cientifico` varchar(100) NOT NULL,
  `id_categoria_toxinica` int NOT NULL,
  `id_tabla_avistamiento` int DEFAULT NULL,
  `id_tabla_lugares` int DEFAULT NULL,
  PRIMARY KEY (`id_tabla_especie_marina`),
  KEY `tabla_especie_marina_FK` (`id_categoria_toxinica`),
  KEY `tabla_especie_marina_FK_1` (`id_tabla_avistamiento`),
  KEY `tabla_especie_marina_FK_2` (`id_tabla_lugares`),
  CONSTRAINT `tabla_especie_marina_FK` FOREIGN KEY (`id_categoria_toxinica`) REFERENCES `categoria_toxinica` (`id_categoria_toxinica`),
  CONSTRAINT `tabla_especie_marina_FK_1` FOREIGN KEY (`id_tabla_avistamiento`) REFERENCES `tabla_avistamiento` (`id_tabla_avistamiento`),
  CONSTRAINT `tabla_especie_marina_FK_2` FOREIGN KEY (`id_tabla_lugares`) REFERENCES `tabla_lugares` (`id_tabla_lugares`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_especie_marina`
--

LOCK TABLES `tabla_especie_marina` WRITE;
/*!40000 ALTER TABLE `tabla_especie_marina` DISABLE KEYS */;
INSERT INTO `tabla_especie_marina` VALUES (1,'ballena azul','Balaenoptera musculus',1,1,1),(4,'pez cebra','Danio rerio',2,2,3);
/*!40000 ALTER TABLE `tabla_especie_marina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_lugares`
--

DROP TABLE IF EXISTS `tabla_lugares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_lugares` (
  `id_tabla_lugares` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `nombre_lugar` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tabla_lugares`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_lugares`
--

LOCK TABLES `tabla_lugares` WRITE;
/*!40000 ALTER TABLE `tabla_lugares` DISABLE KEYS */;
INSERT INTO `tabla_lugares` VALUES (1,'colombia','magdalena','santa marta','taganga'),(2,'colombia','magdalena','santa marta','rodadero'),(3,'colombia','magdalena','santa marta','playa salguero'),(4,'colombia','sucre','tolu','bahia'),(5,'colombia','sucre','tolu','playa blanca'),(6,'colomabia','magdalena','santa marta','rodadero');
/*!40000 ALTER TABLE `tabla_lugares` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-23 23:16:49
