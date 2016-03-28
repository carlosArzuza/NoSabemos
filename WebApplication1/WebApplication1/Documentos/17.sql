CREATE DATABASE  IF NOT EXISTS `c_digital` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `c_digital`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: c_digital
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dg_categorias`
--

DROP TABLE IF EXISTS `dg_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_categorias` (
  `ID_CAT` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_CAT` varchar(60) DEFAULT NULL,
  `IMAGEN` text,
  `TIPO` text,
  `PADRE` int(11) DEFAULT '0',
  PRIMARY KEY (`ID_CAT`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_categorias`
--

LOCK TABLES `dg_categorias` WRITE;
/*!40000 ALTER TABLE `dg_categorias` DISABLE KEYS */;
INSERT INTO `dg_categorias` VALUES (36,'Carnes',NULL,'1',0),(37,'Carne de Res',NULL,'0',36);
/*!40000 ALTER TABLE `dg_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_clientes`
--

DROP TABLE IF EXISTS `dg_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_clientes` (
  `PERSONA` varchar(12) NOT NULL,
  `DIRECCION` varchar(60) DEFAULT NULL,
  `BARRIO` varchar(60) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PERSONA`),
  CONSTRAINT `dg_clientes_ibfk_1` FOREIGN KEY (`PERSONA`) REFERENCES `dg_persona` (`CEDULA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_clientes`
--

LOCK TABLES `dg_clientes` WRITE;
/*!40000 ALTER TABLE `dg_clientes` DISABLE KEYS */;
INSERT INTO `dg_clientes` VALUES ('1065606838','Calle 45 N 3 45','la nevada','leinerm@gmail.com'),('91060755863','Carrera 45','la nevada','juan@gmail.com');
/*!40000 ALTER TABLE `dg_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_configuracion`
--

DROP TABLE IF EXISTS `dg_configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_configuracion` (
  `ID_CONFIG` int(11) NOT NULL AUTO_INCREMENT,
  `DATO` int(11) DEFAULT NULL,
  `TIPO` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID_CONFIG`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_configuracion`
--

LOCK TABLES `dg_configuracion` WRITE;
/*!40000 ALTER TABLE `dg_configuracion` DISABLE KEYS */;
INSERT INTO `dg_configuracion` VALUES (1,8,'CN'),(2,1,'CP');
/*!40000 ALTER TABLE `dg_configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_establecimientos`
--

DROP TABLE IF EXISTS `dg_establecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_establecimientos` (
  `ID_ESTABL` varchar(20) NOT NULL,
  `NOMBRE_ES` varchar(60) DEFAULT NULL,
  `DIRECCION_ES` varchar(60) DEFAULT NULL,
  `BARRIO_ES` varchar(60) DEFAULT NULL,
  `CUIDAD_ES` varchar(60) DEFAULT NULL,
  `TELEFONO_ES` varchar(11) DEFAULT NULL,
  `TELEFONO_ES2` varchar(11) DEFAULT NULL,
  `ESTADO_ES` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID_ESTABL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_establecimientos`
--

LOCK TABLES `dg_establecimientos` WRITE;
/*!40000 ALTER TABLE `dg_establecimientos` DISABLE KEYS */;
INSERT INTO `dg_establecimientos` VALUES ('12345678-0','restaurantes varo','carrera 9 No 10 - 78','Novalito','Valledupar','3213456789','3215678901',1);
/*!40000 ALTER TABLE `dg_establecimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_impuestos`
--

DROP TABLE IF EXISTS `dg_impuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_impuestos` (
  `ID_IMP` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_IMPU` varchar(50) DEFAULT NULL,
  `ESTADO_IMPU` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID_IMP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_impuestos`
--

LOCK TABLES `dg_impuestos` WRITE;
/*!40000 ALTER TABLE `dg_impuestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `dg_impuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_ingredientes`
--

DROP TABLE IF EXISTS `dg_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_ingredientes` (
  `ID_INGR` int(11) NOT NULL AUTO_INCREMENT,
  `PLATO` int(11) DEFAULT NULL,
  `INGREDIENTE` int(11) DEFAULT NULL,
  `CANTIDAD` double DEFAULT NULL,
  PRIMARY KEY (`ID_INGR`),
  KEY `PLATO` (`PLATO`),
  KEY `INGREDIENTE` (`INGREDIENTE`),
  CONSTRAINT `dg_ingredientes_ibfk_1` FOREIGN KEY (`PLATO`) REFERENCES `dg_platos` (`ID_PLA`) ON DELETE CASCADE,
  CONSTRAINT `dg_ingredientes_ibfk_2` FOREIGN KEY (`INGREDIENTE`) REFERENCES `dg_productos` (`ID_PRO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_ingredientes`
--

LOCK TABLES `dg_ingredientes` WRITE;
/*!40000 ALTER TABLE `dg_ingredientes` DISABLE KEYS */;
INSERT INTO `dg_ingredientes` VALUES (15,36,3,20),(16,37,3,2),(17,37,1,7),(18,37,4,3),(19,37,2,3);
/*!40000 ALTER TABLE `dg_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_ingresos`
--

DROP TABLE IF EXISTS `dg_ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_ingresos` (
  `ID_INS` int(11) NOT NULL AUTO_INCREMENT,
  `INSUMO` int(11) DEFAULT NULL,
  `CANTIDAD` decimal(10,0) DEFAULT NULL,
  `FECHA_IN` date DEFAULT NULL,
  `USUARIO` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ID_INS`),
  KEY `INSUMO` (`INSUMO`),
  CONSTRAINT `dg_ingresos_ibfk_1` FOREIGN KEY (`INSUMO`) REFERENCES `dg_productos` (`ID_PRO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_ingresos`
--

LOCK TABLES `dg_ingresos` WRITE;
/*!40000 ALTER TABLE `dg_ingresos` DISABLE KEYS */;
INSERT INTO `dg_ingresos` VALUES (1,1,20,NULL,'1065635832'),(2,1,10,NULL,'1065635832'),(3,1,12,NULL,'1065635832'),(4,3,20,NULL,NULL),(5,1,30,NULL,NULL),(6,3,70,'2015-09-13',NULL),(7,1,90,'2015-09-13',NULL),(8,4,10,'2015-09-13',NULL),(9,1,60,'2015-09-13',NULL),(10,3,10,'2015-09-13',NULL),(11,3,40,'2015-09-16',NULL),(12,5,100,'2015-09-16',NULL),(13,5,20,'2015-09-16',NULL),(14,4,20,'2015-09-16',NULL),(15,4,40,'2015-09-16',NULL),(16,2,90,'2015-09-16',NULL);
/*!40000 ALTER TABLE `dg_ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_mesas`
--

DROP TABLE IF EXISTS `dg_mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_mesas` (
  `ID_MESA` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_MESA` varchar(45) DEFAULT NULL,
  `MESERO` varchar(12) DEFAULT NULL,
  `ESTADO` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID_MESA`),
  KEY `MESERO` (`MESERO`),
  CONSTRAINT `dg_mesas_ibfk_1` FOREIGN KEY (`MESERO`) REFERENCES `dg_trabajador` (`PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_mesas`
--

LOCK TABLES `dg_mesas` WRITE;
/*!40000 ALTER TABLE `dg_mesas` DISABLE KEYS */;
INSERT INTO `dg_mesas` VALUES (22,'Domicilio 1','1065635832',1),(23,'A1','40978172',1),(24,'A2','13456777777',1),(25,'A3','13456777777',0),(26,'prueba','40978172',0),(27,'Jorge','40978172',0),(28,'1','40978172',0),(29,'s','1065635832',0),(30,'rrr','1065635832',0);
/*!40000 ALTER TABLE `dg_mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_pedido`
--

DROP TABLE IF EXISTS `dg_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_pedido` (
  `ID_PEDIDO` int(11) NOT NULL,
  `MESERO_P` varchar(12) DEFAULT NULL,
  `CLIENTE_P` varchar(12) DEFAULT NULL,
  `LUGAR` varchar(80) DEFAULT NULL,
  `INDICACIONES` varchar(70) DEFAULT NULL,
  `FECHA_P` date DEFAULT NULL,
  `USUARIO` varchar(12) DEFAULT NULL,
  `MESA` int(11) DEFAULT NULL,
  `HORA_I` varchar(15) DEFAULT NULL,
  `ESTADO_PD` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  KEY `MESERO_P` (`MESERO_P`),
  KEY `CLIENTE_P` (`CLIENTE_P`),
  CONSTRAINT `dg_pedido_ibfk_1` FOREIGN KEY (`MESERO_P`) REFERENCES `dg_trabajador` (`PERSONA`),
  CONSTRAINT `dg_pedido_ibfk_2` FOREIGN KEY (`CLIENTE_P`) REFERENCES `dg_clientes` (`PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_pedido`
--

LOCK TABLES `dg_pedido` WRITE;
/*!40000 ALTER TABLE `dg_pedido` DISABLE KEYS */;
INSERT INTO `dg_pedido` VALUES (5,'1065635832','91060755863',NULL,NULL,'2015-09-16','1065635832',22,NULL,'L'),(6,'1065635832','91060755863',NULL,NULL,'2015-09-16','1065635832',23,NULL,'L'),(7,'1065635832','1065606838',NULL,NULL,'2015-09-17','1065635832',24,NULL,'L');
/*!40000 ALTER TABLE `dg_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_pedido_detalle`
--

DROP TABLE IF EXISTS `dg_pedido_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_pedido_detalle` (
  `ID_P_DETALLE` int(11) NOT NULL AUTO_INCREMENT,
  `PEDIDO` int(11) DEFAULT NULL,
  `PLATO` int(11) DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `PRECIO` double DEFAULT NULL,
  `NOTA` varchar(70) DEFAULT NULL,
  `ESTADO_P` varchar(1) DEFAULT NULL,
  `TIPO_P` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_P_DETALLE`),
  KEY `PEDIDO` (`PEDIDO`),
  KEY `PLATO` (`PLATO`),
  CONSTRAINT `dg_pedido_detalle_ibfk_1` FOREIGN KEY (`PEDIDO`) REFERENCES `dg_pedido` (`ID_PEDIDO`) ON DELETE CASCADE,
  CONSTRAINT `dg_pedido_detalle_ibfk_2` FOREIGN KEY (`PLATO`) REFERENCES `dg_platos` (`ID_PLA`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_pedido_detalle`
--

LOCK TABLES `dg_pedido_detalle` WRITE;
/*!40000 ALTER TABLE `dg_pedido_detalle` DISABLE KEYS */;
INSERT INTO `dg_pedido_detalle` VALUES (8,5,36,1,12000,'','L','PL'),(9,5,36,1,12000,'','L','PL'),(10,6,37,1,12000,'','L','PL'),(11,6,37,1,12000,'','L','PL'),(12,7,37,1,12000,'','L','PL');
/*!40000 ALTER TABLE `dg_pedido_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_persona`
--

DROP TABLE IF EXISTS `dg_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_persona` (
  `CEDULA` varchar(12) NOT NULL,
  `NOMBRES` varchar(45) DEFAULT NULL,
  `P_APELLIDO` varchar(50) DEFAULT NULL,
  `S_APELLIDO` varchar(50) DEFAULT NULL,
  `TELEFONO_1` varchar(11) DEFAULT NULL,
  `TELEFONO_2` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_persona`
--

LOCK TABLES `dg_persona` WRITE;
/*!40000 ALTER TABLE `dg_persona` DISABLE KEYS */;
INSERT INTO `dg_persona` VALUES ('1065606838','Leiner','Meriño','Restrepo','3183067338',''),('1065635832','Yeiner','Meriño','Restrepo','5821841','000000000'),('13456777777','Manuel','Daza','Restrpo','5821841','000000000'),('40978172','Jorge','Jival','Orozco','5821841','000000000'),('91060755863','Juan','Lopez','Lopez','5821841','3214567890');
/*!40000 ALTER TABLE `dg_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_platos`
--

DROP TABLE IF EXISTS `dg_platos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_platos` (
  `ID_PLA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_PL` varchar(50) DEFAULT NULL,
  `DESCRIPCION_PL` varchar(50) DEFAULT NULL,
  `CATEGORIA_PL` int(11) DEFAULT NULL,
  `PRECIO_PL` double DEFAULT NULL,
  `IMAGEN_PL` text,
  `TIPO_PL` text,
  PRIMARY KEY (`ID_PLA`),
  KEY `CATEGORIA_PL` (`CATEGORIA_PL`),
  CONSTRAINT `dg_platos_ibfk_1` FOREIGN KEY (`CATEGORIA_PL`) REFERENCES `dg_categorias` (`ID_CAT`) ON DELETE CASCADE,
  CONSTRAINT `dg_platos_ibfk_2` FOREIGN KEY (`CATEGORIA_PL`) REFERENCES `dg_categorias` (`ID_CAT`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_platos`
--

LOCK TABLES `dg_platos` WRITE;
/*!40000 ALTER TABLE `dg_platos` DISABLE KEYS */;
INSERT INTO `dg_platos` VALUES (36,'yy','yy',37,12000,NULL,'PL'),(37,'carne a la marinera','caaa',37,12000,NULL,'PL');
/*!40000 ALTER TABLE `dg_platos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_productos`
--

DROP TABLE IF EXISTS `dg_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_productos` (
  `ID_PRO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(60) DEFAULT NULL,
  `UNI_MEDIDA` int(1) DEFAULT NULL,
  `STOCK` int(11) DEFAULT NULL,
  `PROVEEDOR` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`ID_PRO`),
  KEY `PROVEEDOR_idx` (`PROVEEDOR`),
  CONSTRAINT `PROVEDOR` FOREIGN KEY (`PROVEEDOR`) REFERENCES `dg_proveedor` (`NIT_PROVE`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_productos`
--

LOCK TABLES `dg_productos` WRITE;
/*!40000 ALTER TABLE `dg_productos` DISABLE KEYS */;
INSERT INTO `dg_productos` VALUES (1,'Chorizo',0,20,'123456'),(2,'salchichas ranchera',0,40,'123456'),(3,'Cebolla blanca',1,20,'123456'),(4,'salchicha  para perros',0,40,'123456'),(5,'Mega',0,30,'12345888'),(6,'pony malta',0,50,'12345888');
/*!40000 ALTER TABLE `dg_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_proveedor`
--

DROP TABLE IF EXISTS `dg_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_proveedor` (
  `NIT_PROVE` varchar(13) NOT NULL,
  `NOMBRE_PROVEDOR` varchar(60) DEFAULT NULL,
  `DIRECCION_PROVEDOR` varchar(60) DEFAULT NULL,
  `CUIDAD_PROVEDOR` varchar(60) DEFAULT NULL,
  `ESTADO_PROV` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`NIT_PROVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_proveedor`
--

LOCK TABLES `dg_proveedor` WRITE;
/*!40000 ALTER TABLE `dg_proveedor` DISABLE KEYS */;
INSERT INTO `dg_proveedor` VALUES ('123456','D\'costa','calle 35 a n 4 e 61','valledupar',NULL),('12345888','Postobon','carrera 45','valledupar',NULL);
/*!40000 ALTER TABLE `dg_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_salidas`
--

DROP TABLE IF EXISTS `dg_salidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_salidas` (
  `ID_SALI` int(11) NOT NULL AUTO_INCREMENT,
  `INSUMO_SALI` int(11) DEFAULT NULL,
  `CANTIDAD_SALI` decimal(10,0) DEFAULT NULL,
  `FECHA_SALI` date DEFAULT NULL,
  `USARIO_SALI` varchar(12) DEFAULT NULL,
  `TIPO_SALI` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID_SALI`),
  KEY `INSUMO_SALI` (`INSUMO_SALI`),
  CONSTRAINT `dg_salidas_ibfk_1` FOREIGN KEY (`INSUMO_SALI`) REFERENCES `dg_productos` (`ID_PRO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_salidas`
--

LOCK TABLES `dg_salidas` WRITE;
/*!40000 ALTER TABLE `dg_salidas` DISABLE KEYS */;
INSERT INTO `dg_salidas` VALUES (30,3,40,'2015-09-16',NULL,'T'),(31,3,8,'2015-09-16',NULL,'T'),(33,3,30,'2015-09-16',NULL,'N'),(34,3,20,'2015-09-16',NULL,'N'),(35,3,22,'2015-09-16',NULL,'N'),(37,1,100,'2015-09-16',NULL,'T'),(53,3,20,'2015-09-16',NULL,'C'),(54,3,20,'2015-09-16',NULL,'C'),(55,4,20,'2015-09-16',NULL,'T'),(56,5,50,'2015-09-16',NULL,'T'),(57,2,50,'2015-09-16',NULL,'T'),(58,3,2,'2015-09-16',NULL,'C'),(59,1,7,'2015-09-16',NULL,'C'),(60,4,3,'2015-09-16',NULL,'C'),(61,2,3,'2015-09-16',NULL,'C'),(62,3,2,'2015-09-16',NULL,'C'),(63,1,7,'2015-09-16',NULL,'C'),(64,4,3,'2015-09-16',NULL,'C'),(65,2,3,'2015-09-16',NULL,'C'),(66,1,10,'2015-09-16',NULL,'N'),(67,3,2,'2015-09-17',NULL,'C'),(68,1,7,'2015-09-17',NULL,'C'),(69,4,3,'2015-09-17',NULL,'C'),(70,2,3,'2015-09-17',NULL,'C');
/*!40000 ALTER TABLE `dg_salidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_trabajador`
--

DROP TABLE IF EXISTS `dg_trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_trabajador` (
  `PERSONA` varchar(12) NOT NULL,
  `DIRECCION` varchar(60) DEFAULT NULL,
  `BARRIO` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`PERSONA`),
  CONSTRAINT `dg_trabajador_ibfk_1` FOREIGN KEY (`PERSONA`) REFERENCES `dg_persona` (`CEDULA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_trabajador`
--

LOCK TABLES `dg_trabajador` WRITE;
/*!40000 ALTER TABLE `dg_trabajador` DISABLE KEYS */;
INSERT INTO `dg_trabajador` VALUES ('1065635832','Calle 35 a n 4 e 61','los mayales'),('13456777777','calle 45','los cocos|'),('40978172','carrera 23 n 4 d 61','los fundadores');
/*!40000 ALTER TABLE `dg_trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dg_traslados`
--

DROP TABLE IF EXISTS `dg_traslados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dg_traslados` (
  `ID_TRASL` int(11) NOT NULL AUTO_INCREMENT,
  `INSUMO_TRASL` int(11) DEFAULT NULL,
  `CANTIDAD_TRASL` decimal(10,0) DEFAULT NULL,
  `FECHA_TRASL` date DEFAULT NULL,
  `USARIO_TRASL` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ID_TRASL`),
  KEY `INSUMO_TRASL` (`INSUMO_TRASL`),
  CONSTRAINT `dg_traslados_ibfk_1` FOREIGN KEY (`INSUMO_TRASL`) REFERENCES `dg_productos` (`ID_PRO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dg_traslados`
--

LOCK TABLES `dg_traslados` WRITE;
/*!40000 ALTER TABLE `dg_traslados` DISABLE KEYS */;
INSERT INTO `dg_traslados` VALUES (9,3,40,'2015-09-16',NULL),(10,3,8,'2015-09-16',NULL),(11,1,100,'2015-09-16',NULL),(12,4,20,'2015-09-16',NULL),(13,5,50,'2015-09-16',NULL),(14,2,50,'2015-09-16',NULL);
/*!40000 ALTER TABLE `dg_traslados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `entradascocinaview`
--

DROP TABLE IF EXISTS `entradascocinaview`;
/*!50001 DROP VIEW IF EXISTS `entradascocinaview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `entradascocinaview` (
  `CANTIDAD_TR` tinyint NOT NULL,
  `INSUMO_TRASL` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ingredientesview`
--

DROP TABLE IF EXISTS `ingredientesview`;
/*!50001 DROP VIEW IF EXISTS `ingredientesview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ingredientesview` (
  `NOMBRE_PL` tinyint NOT NULL,
  `ID_INGR` tinyint NOT NULL,
  `PLATO` tinyint NOT NULL,
  `INGREDIENTE` tinyint NOT NULL,
  `CANTIDAD` tinyint NOT NULL,
  `NOMBRE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ingresosview`
--

DROP TABLE IF EXISTS `ingresosview`;
/*!50001 DROP VIEW IF EXISTS `ingresosview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ingresosview` (
  `EXISTENTE` tinyint NOT NULL,
  `ID_ING` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!50001 DROP VIEW IF EXISTS `mesas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `mesas` (
  `CEDULA` tinyint NOT NULL,
  `NOMBRES` tinyint NOT NULL,
  `P_APELLIDO` tinyint NOT NULL,
  `NOM_MESA` tinyint NOT NULL,
  `ESTADO` tinyint NOT NULL,
  `ID_MESA` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `personacliente`
--

DROP TABLE IF EXISTS `personacliente`;
/*!50001 DROP VIEW IF EXISTS `personacliente`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `personacliente` (
  `CEDULA` tinyint NOT NULL,
  `NOMBRES` tinyint NOT NULL,
  `P_APELLIDO` tinyint NOT NULL,
  `S_APELLIDO` tinyint NOT NULL,
  `TELEFONO_1` tinyint NOT NULL,
  `TELEFONO_2` tinyint NOT NULL,
  `DIRECCION` tinyint NOT NULL,
  `BARRIO` tinyint NOT NULL,
  `EMAIL` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `personatrabajador`
--

DROP TABLE IF EXISTS `personatrabajador`;
/*!50001 DROP VIEW IF EXISTS `personatrabajador`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `personatrabajador` (
  `CEDULA` tinyint NOT NULL,
  `NOMBRES` tinyint NOT NULL,
  `P_APELLIDO` tinyint NOT NULL,
  `S_APELLIDO` tinyint NOT NULL,
  `TELEFONO_1` tinyint NOT NULL,
  `TELEFONO_2` tinyint NOT NULL,
  `PERSONA` tinyint NOT NULL,
  `DIRECCION` tinyint NOT NULL,
  `BARRIO` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `platos`
--

DROP TABLE IF EXISTS `platos`;
/*!50001 DROP VIEW IF EXISTS `platos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `platos` (
  `ID_PLA` tinyint NOT NULL,
  `NOMBRE_PL` tinyint NOT NULL,
  `PRECIO` tinyint NOT NULL,
  `ID_CAT` tinyint NOT NULL,
  `NOMBRE_CAT` tinyint NOT NULL,
  `DESCRIPCION_PL` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `s_e_cocinasview`
--

DROP TABLE IF EXISTS `s_e_cocinasview`;
/*!50001 DROP VIEW IF EXISTS `s_e_cocinasview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `s_e_cocinasview` (
  `ID_PRO` tinyint NOT NULL,
  `CANTIDAD_TR` tinyint NOT NULL,
  `NOMBRE` tinyint NOT NULL,
  `UNI_MEDIDA` tinyint NOT NULL,
  `SALIDA_C` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `salida_entradasview`
--

DROP TABLE IF EXISTS `salida_entradasview`;
/*!50001 DROP VIEW IF EXISTS `salida_entradasview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `salida_entradasview` (
  `NOMBRE` tinyint NOT NULL,
  `UNI_MEDIDA` tinyint NOT NULL,
  `STOCK` tinyint NOT NULL,
  `SALIDA_N` tinyint NOT NULL,
  `SALIDA_T` tinyint NOT NULL,
  `EXISTENTE` tinyint NOT NULL,
  `ID_PRO` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `salidascocinaview`
--

DROP TABLE IF EXISTS `salidascocinaview`;
/*!50001 DROP VIEW IF EXISTS `salidascocinaview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `salidascocinaview` (
  `SALIDA_C` tinyint NOT NULL,
  `INSUMO_C` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `salidasnview`
--

DROP TABLE IF EXISTS `salidasnview`;
/*!50001 DROP VIEW IF EXISTS `salidasnview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `salidasnview` (
  `SALIDA_N` tinyint NOT NULL,
  `INSUMO_N` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `trasladosview`
--

DROP TABLE IF EXISTS `trasladosview`;
/*!50001 DROP VIEW IF EXISTS `trasladosview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `trasladosview` (
  `SALIDA_T` tinyint NOT NULL,
  `INSUMO_T` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vpedidos`
--

DROP TABLE IF EXISTS `vpedidos`;
/*!50001 DROP VIEW IF EXISTS `vpedidos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vpedidos` (
  `NOMBRES` tinyint NOT NULL,
  `P_APELLIDO` tinyint NOT NULL,
  `S_APELLIDO` tinyint NOT NULL,
  `TELEFONO_1` tinyint NOT NULL,
  `NOM_MESA` tinyint NOT NULL,
  `ID_PEDIDO` tinyint NOT NULL,
  `CLIENTE_P` tinyint NOT NULL,
  `FECHA_P` tinyint NOT NULL,
  `DIRECCION_P` tinyint NOT NULL,
  `INDICACIONES` tinyint NOT NULL,
  `MESA` tinyint NOT NULL,
  `MESERO_P` tinyint NOT NULL,
  `HORA_I` tinyint NOT NULL,
  `ESTADO_PD` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vplatos_detalle`
--

DROP TABLE IF EXISTS `vplatos_detalle`;
/*!50001 DROP VIEW IF EXISTS `vplatos_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vplatos_detalle` (
  `ID_P_DETALLE` tinyint NOT NULL,
  `PEDIDO` tinyint NOT NULL,
  `PLATO` tinyint NOT NULL,
  `NOMBRE_PL` tinyint NOT NULL,
  `NOTA` tinyint NOT NULL,
  `CANTIDAD` tinyint NOT NULL,
  `PRECIO` tinyint NOT NULL,
  `ESTADO` tinyint NOT NULL,
  `TIPO_P` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `entradascocinaview`
--

/*!50001 DROP TABLE IF EXISTS `entradascocinaview`*/;
/*!50001 DROP VIEW IF EXISTS `entradascocinaview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `entradascocinaview` AS select sum(`dg_traslados`.`CANTIDAD_TRASL`) AS `CANTIDAD_TR`,`dg_traslados`.`INSUMO_TRASL` AS `INSUMO_TRASL` from `dg_traslados` group by `dg_traslados`.`INSUMO_TRASL` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ingredientesview`
--

/*!50001 DROP TABLE IF EXISTS `ingredientesview`*/;
/*!50001 DROP VIEW IF EXISTS `ingredientesview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ingredientesview` AS select `dg_platos`.`NOMBRE_PL` AS `NOMBRE_PL`,`dg_ingredientes`.`ID_INGR` AS `ID_INGR`,`dg_ingredientes`.`PLATO` AS `PLATO`,`dg_ingredientes`.`INGREDIENTE` AS `INGREDIENTE`,`dg_ingredientes`.`CANTIDAD` AS `CANTIDAD`,`dg_productos`.`NOMBRE` AS `NOMBRE` from ((`dg_platos` join `dg_ingredientes` on((`dg_platos`.`ID_PLA` = `dg_ingredientes`.`PLATO`))) join `dg_productos` on((`dg_productos`.`ID_PRO` = `dg_ingredientes`.`INGREDIENTE`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ingresosview`
--

/*!50001 DROP TABLE IF EXISTS `ingresosview`*/;
/*!50001 DROP VIEW IF EXISTS `ingresosview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ingresosview` AS select sum(`dg_ingresos`.`CANTIDAD`) AS `EXISTENTE`,`dg_productos`.`ID_PRO` AS `ID_ING` from (`dg_productos` join `dg_ingresos` on((`dg_productos`.`ID_PRO` = `dg_ingresos`.`INSUMO`))) group by `dg_productos`.`ID_PRO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mesas`
--

/*!50001 DROP TABLE IF EXISTS `mesas`*/;
/*!50001 DROP VIEW IF EXISTS `mesas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mesas` AS select `personatrabajador`.`CEDULA` AS `CEDULA`,`personatrabajador`.`NOMBRES` AS `NOMBRES`,`personatrabajador`.`P_APELLIDO` AS `P_APELLIDO`,`dg_mesas`.`NOM_MESA` AS `NOM_MESA`,`dg_mesas`.`ESTADO` AS `ESTADO`,`dg_mesas`.`ID_MESA` AS `ID_MESA` from (`personatrabajador` join `dg_mesas` on((`personatrabajador`.`CEDULA` = `dg_mesas`.`MESERO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `personacliente`
--

/*!50001 DROP TABLE IF EXISTS `personacliente`*/;
/*!50001 DROP VIEW IF EXISTS `personacliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `personacliente` AS select `dg_persona`.`CEDULA` AS `CEDULA`,`dg_persona`.`NOMBRES` AS `NOMBRES`,`dg_persona`.`P_APELLIDO` AS `P_APELLIDO`,`dg_persona`.`S_APELLIDO` AS `S_APELLIDO`,`dg_persona`.`TELEFONO_1` AS `TELEFONO_1`,`dg_persona`.`TELEFONO_2` AS `TELEFONO_2`,`dg_clientes`.`DIRECCION` AS `DIRECCION`,`dg_clientes`.`BARRIO` AS `BARRIO`,`dg_clientes`.`EMAIL` AS `EMAIL` from (`dg_persona` join `dg_clientes`) where (`dg_persona`.`CEDULA` = `dg_clientes`.`PERSONA`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `personatrabajador`
--

/*!50001 DROP TABLE IF EXISTS `personatrabajador`*/;
/*!50001 DROP VIEW IF EXISTS `personatrabajador`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `personatrabajador` AS select `dg_persona`.`CEDULA` AS `CEDULA`,`dg_persona`.`NOMBRES` AS `NOMBRES`,`dg_persona`.`P_APELLIDO` AS `P_APELLIDO`,`dg_persona`.`S_APELLIDO` AS `S_APELLIDO`,`dg_persona`.`TELEFONO_1` AS `TELEFONO_1`,`dg_persona`.`TELEFONO_2` AS `TELEFONO_2`,`dg_trabajador`.`PERSONA` AS `PERSONA`,`dg_trabajador`.`DIRECCION` AS `DIRECCION`,`dg_trabajador`.`BARRIO` AS `BARRIO` from (`dg_persona` join `dg_trabajador`) where (`dg_persona`.`CEDULA` = `dg_trabajador`.`PERSONA`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `platos`
--

/*!50001 DROP TABLE IF EXISTS `platos`*/;
/*!50001 DROP VIEW IF EXISTS `platos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `platos` AS select `dg_platos`.`ID_PLA` AS `ID_PLA`,`dg_platos`.`NOMBRE_PL` AS `NOMBRE_PL`,`dg_platos`.`PRECIO_PL` AS `PRECIO`,`dg_categorias`.`ID_CAT` AS `ID_CAT`,`dg_categorias`.`NOMBRE_CAT` AS `NOMBRE_CAT`,`dg_platos`.`DESCRIPCION_PL` AS `DESCRIPCION_PL` from (`dg_platos` join `dg_categorias`) where (`dg_categorias`.`ID_CAT` = `dg_platos`.`CATEGORIA_PL`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s_e_cocinasview`
--

/*!50001 DROP TABLE IF EXISTS `s_e_cocinasview`*/;
/*!50001 DROP VIEW IF EXISTS `s_e_cocinasview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s_e_cocinasview` AS select `dg_productos`.`ID_PRO` AS `ID_PRO`,`entradascocinaview`.`CANTIDAD_TR` AS `CANTIDAD_TR`,`dg_productos`.`NOMBRE` AS `NOMBRE`,`dg_productos`.`UNI_MEDIDA` AS `UNI_MEDIDA`,`salidascocinaview`.`SALIDA_C` AS `SALIDA_C` from ((`dg_productos` left join `entradascocinaview` on((`dg_productos`.`ID_PRO` = `entradascocinaview`.`INSUMO_TRASL`))) left join `salidascocinaview` on((`dg_productos`.`ID_PRO` = `salidascocinaview`.`INSUMO_C`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salida_entradasview`
--

/*!50001 DROP TABLE IF EXISTS `salida_entradasview`*/;
/*!50001 DROP VIEW IF EXISTS `salida_entradasview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salida_entradasview` AS select `dg_productos`.`NOMBRE` AS `NOMBRE`,`dg_productos`.`UNI_MEDIDA` AS `UNI_MEDIDA`,`dg_productos`.`STOCK` AS `STOCK`,`salidasnview`.`SALIDA_N` AS `SALIDA_N`,`trasladosview`.`SALIDA_T` AS `SALIDA_T`,`ingresosview`.`EXISTENTE` AS `EXISTENTE`,`dg_productos`.`ID_PRO` AS `ID_PRO` from (((`dg_productos` left join `salidasnview` on((`salidasnview`.`INSUMO_N` = `dg_productos`.`ID_PRO`))) left join `ingresosview` on((`ingresosview`.`ID_ING` = `dg_productos`.`ID_PRO`))) left join `trasladosview` on((`trasladosview`.`INSUMO_T` = `dg_productos`.`ID_PRO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salidascocinaview`
--

/*!50001 DROP TABLE IF EXISTS `salidascocinaview`*/;
/*!50001 DROP VIEW IF EXISTS `salidascocinaview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salidascocinaview` AS select sum(`dg_salidas`.`CANTIDAD_SALI`) AS `SALIDA_C`,`dg_salidas`.`INSUMO_SALI` AS `INSUMO_C` from `dg_salidas` where (`dg_salidas`.`TIPO_SALI` = 'C') group by `dg_salidas`.`INSUMO_SALI` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salidasnview`
--

/*!50001 DROP TABLE IF EXISTS `salidasnview`*/;
/*!50001 DROP VIEW IF EXISTS `salidasnview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salidasnview` AS select sum(`dg_salidas`.`CANTIDAD_SALI`) AS `SALIDA_N`,`dg_salidas`.`INSUMO_SALI` AS `INSUMO_N` from `dg_salidas` where (`dg_salidas`.`TIPO_SALI` = 'N') group by `dg_salidas`.`INSUMO_SALI` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trasladosview`
--

/*!50001 DROP TABLE IF EXISTS `trasladosview`*/;
/*!50001 DROP VIEW IF EXISTS `trasladosview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trasladosview` AS select sum(`dg_salidas`.`CANTIDAD_SALI`) AS `SALIDA_T`,`dg_salidas`.`INSUMO_SALI` AS `INSUMO_T` from `dg_salidas` where (`dg_salidas`.`TIPO_SALI` = 'T') group by `INSUMO_T` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vpedidos`
--

/*!50001 DROP TABLE IF EXISTS `vpedidos`*/;
/*!50001 DROP VIEW IF EXISTS `vpedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vpedidos` AS select `dg_persona`.`NOMBRES` AS `NOMBRES`,`dg_persona`.`P_APELLIDO` AS `P_APELLIDO`,`dg_persona`.`S_APELLIDO` AS `S_APELLIDO`,`dg_persona`.`TELEFONO_1` AS `TELEFONO_1`,`dg_mesas`.`NOM_MESA` AS `NOM_MESA`,`dg_pedido`.`ID_PEDIDO` AS `ID_PEDIDO`,`dg_pedido`.`CLIENTE_P` AS `CLIENTE_P`,`dg_pedido`.`FECHA_P` AS `FECHA_P`,`dg_pedido`.`LUGAR` AS `DIRECCION_P`,`dg_pedido`.`INDICACIONES` AS `INDICACIONES`,`dg_pedido`.`MESA` AS `MESA`,`dg_pedido`.`MESERO_P` AS `MESERO_P`,`dg_pedido`.`HORA_I` AS `HORA_I`,`dg_pedido`.`ESTADO_PD` AS `ESTADO_PD` from ((((`dg_pedido` join `dg_clientes` on((`dg_pedido`.`CLIENTE_P` = `dg_clientes`.`PERSONA`))) join `dg_mesas` on((`dg_pedido`.`MESA` = `dg_mesas`.`ID_MESA`))) join `dg_trabajador` on((`dg_pedido`.`MESERO_P` = `dg_trabajador`.`PERSONA`))) join `dg_persona` on((`dg_persona`.`CEDULA` = `dg_clientes`.`PERSONA`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vplatos_detalle`
--

/*!50001 DROP TABLE IF EXISTS `vplatos_detalle`*/;
/*!50001 DROP VIEW IF EXISTS `vplatos_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vplatos_detalle` AS select `dg_pedido_detalle`.`ID_P_DETALLE` AS `ID_P_DETALLE`,`dg_pedido_detalle`.`PEDIDO` AS `PEDIDO`,`dg_pedido_detalle`.`PLATO` AS `PLATO`,`dg_platos`.`NOMBRE_PL` AS `NOMBRE_PL`,`dg_pedido_detalle`.`NOTA` AS `NOTA`,`dg_pedido_detalle`.`CANTIDAD` AS `CANTIDAD`,`dg_pedido_detalle`.`PRECIO` AS `PRECIO`,`dg_pedido_detalle`.`ESTADO_P` AS `ESTADO`,`dg_pedido_detalle`.`TIPO_P` AS `TIPO_P` from (`dg_pedido_detalle` join `dg_platos`) where (`dg_pedido_detalle`.`PLATO` = `dg_platos`.`ID_PLA`) */;
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

-- Dump completed on 2015-09-17  7:14:10
