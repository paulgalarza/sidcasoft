-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: laravel
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actividad` (
  `idActividad` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  PRIMARY KEY (`idActividad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,'actividad1','0000-00-00','0000-00-00');
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `estatus` bit(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idCliente`),
  KEY `idEmpresa` (`idEmpresa`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Paul Alfonso Galarza Cervantes',1,'','',NULL,'2015-03-18 06:25:16','0000-00-00 00:00:00'),(2,'Carolina Russell Morales',2,'','',NULL,'2015-03-18 06:25:16','0000-00-00 00:00:00'),(3,'Clarissa Medina',1,'','',NULL,'2015-03-18 06:26:00','0000-00-00 00:00:00'),(4,'Cliente 10',3,'9991223344','hxkjdkj@jhcjhdcujdk.com',NULL,'2015-03-11 04:12:55','2015-03-11 11:12:55'),(5,'Cliente 4',4,'','',NULL,'2015-03-06 04:10:33','0000-00-00 00:00:00'),(8,'Luis Eduardo',5,'6677777789','luisedo21@gmail.com',NULL,'2015-03-11 02:14:33','2015-03-11 09:14:33'),(9,'Cliente 9',2,'','',NULL,'2015-03-06 04:10:33','0000-00-00 00:00:00'),(10,'Cliente 10',3,'6672223344','cliente10@gmail.com','','2015-03-06 04:10:33','0000-00-00 00:00:00'),(11,'Cliente 11',4,'6677889911','cliente11@gmail.com','','2015-03-06 04:10:33','0000-00-00 00:00:00'),(12,'Cliente 12',3,'6677889911','cliente12@gmail.com',NULL,'2015-03-06 04:10:33','0000-00-00 00:00:00'),(13,'Cliente 13',4,'','',NULL,'2015-03-06 04:10:33','0000-00-00 00:00:00'),(14,'Cliente 14',3,'','',NULL,'2015-03-06 04:10:33','0000-00-00 00:00:00'),(15,'Cliente 15',2,'','',NULL,'2015-03-06 04:10:33','0000-00-00 00:00:00'),(16,'Luis',5,'6699999999','luisedo21@gmail.com',NULL,'2015-03-07 04:19:00','2015-03-06 11:10:37');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `RFC` varchar(13) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `estatus` bit(1) DEFAULT NULL,
  `encargado` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Instituto Tecnologico de Culiacan','6677112233','RUMC9207174U9','Blvd. Enrique Cabrera','','Carmen García','2015-03-18 06:28:32','0000-00-00 00:00:00'),(2,'ClickBalance','6677223344','RUMC9207174U9','Blvd. Lomas de San Miguel','','Daniela Ochoa','2015-03-18 06:10:17','0000-00-00 00:00:00'),(3,'Sukarne','667733333333',NULL,NULL,NULL,NULL,'2015-03-18 06:10:17','0000-00-00 00:00:00'),(4,'Coppel','6677444444','VIZL930921RS9','Culiacan','','Luis','2015-03-18 06:10:17','0000-00-00 00:00:00'),(5,'Empresa XYZ','6677777789','VIZL930921RS9','Culiacan','','Luis Eduardo V Z','2015-03-11 09:02:58','2015-03-06 11:01:38'),(6,'Empresa Y','6677777777','VIZL930921','Culiacan','','Villela','2015-03-08 05:43:01','2015-03-08 05:43:01'),(7,'Empresa Z','6677777777','VIZL930921','Culiacan','','Villela','2015-03-08 05:43:22','2015-03-08 05:43:22');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatus`
--

DROP TABLE IF EXISTS `estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estatus` (
  `idEstatus` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idEstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus`
--

LOCK TABLES `estatus` WRITE;
/*!40000 ALTER TABLE `estatus` DISABLE KEYS */;
INSERT INTO `estatus` VALUES (1,'Propuesto'),(2,'Aprobado'),(3,'Cancelado');
/*!40000 ALTER TABLE `estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2015_01_17_072632_create_users_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `idPage` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `navbar` bit(1) DEFAULT b'0',
  PRIMARY KEY (`idPage`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Proyectos',''),(2,'Usuarios',''),(3,'Empresas',''),(4,'Clientes',''),(5,'Documentos','');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagesbyuser`
--

DROP TABLE IF EXISTS `pagesbyuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagesbyuser` (
  `idTipoUsuario` int(11) NOT NULL,
  `idPage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagesbyuser`
--

LOCK TABLES `pagesbyuser` WRITE;
/*!40000 ALTER TABLE `pagesbyuser` DISABLE KEYS */;
INSERT INTO `pagesbyuser` VALUES (1,1),(1,2),(1,3),(1,4),(1,5);
/*!40000 ALTER TABLE `pagesbyuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procesos`
--

DROP TABLE IF EXISTS `procesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procesos` (
  `idProceso` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `idActividad` int(10) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  PRIMARY KEY (`idProceso`),
  KEY `idActividad` (`idActividad`),
  CONSTRAINT `procesos_ibfk_1` FOREIGN KEY (`idActividad`) REFERENCES `actividad` (`idActividad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procesos`
--

LOCK TABLES `procesos` WRITE;
/*!40000 ALTER TABLE `procesos` DISABLE KEYS */;
INSERT INTO `procesos` VALUES (1,'proceso 1',1,'0000-00-00','0000-00-00'),(2,'proceso 2',1,'2014-01-01','2015-01-01'),(3,'proceso 3',1,'2014-02-02','2014-02-02');
/*!40000 ALTER TABLE `procesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `idProveedor` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `RFC` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'russell','infonavit humaya','RUMC9207174U9','6671026353');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `idProyecto` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `idCliente` int(10) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `idRecMat` int(10) NOT NULL,
  `idProceso` int(10) NOT NULL,
  `costoTotal` double DEFAULT NULL,
  `idEstatus` int(11) NOT NULL,
  `fechaIncial` datetime NOT NULL,
  `fechaFinal` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProyecto`),
  KEY `idCliente` (`idCliente`),
  KEY `idRecMat` (`idRecMat`),
  KEY `idProceso` (`idProceso`),
  KEY `idEmpresa` (`idEmpresa`),
  KEY `idEmpresa_2` (`idEmpresa`),
  KEY `status` (`idEstatus`),
  CONSTRAINT `proyecto_ibfk_3` FOREIGN KEY (`idRecMat`) REFERENCES `recursos_materiales` (`idRecMat`),
  CONSTRAINT `proyecto_ibfk_4` FOREIGN KEY (`idProceso`) REFERENCES `procesos` (`idProceso`),
  CONSTRAINT `proyecto_ibfk_5` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `proyecto_ibfk_6` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`),
  CONSTRAINT `proyecto_ibfk_7` FOREIGN KEY (`idEstatus`) REFERENCES `estatus` (`idEstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (1,'Sistema Gestion de Indicadores','Los indicadores clave de rendimiento (KPI) ayudan a las empresas a entender lo bien que se está realizando el trabajo en relación con sus metas y objetivos estratégicos. En un sentido más amplio, un KPI proporciona la información de rendimiento más importante que permite a las partes interesadas saber si se va por buen camino.',1,2,'KPI','2014-10-26','2015-11-30',1,1,500,2,'0000-00-00 00:00:00','0000-00-00 00:00:00','2015-03-18 06:09:00','0000-00-00 00:00:00'),(2,'Sistema de control de Inventarios','Son destinatarias directas tanto las organizaciones solidarias como las personas a las que se invita a participar, en este caso, la población de Bizkaia; y son destinatarias indirectas las personas usuarias de los programas desarrollados por las entidades.',1,3,'Proyecto 2','2014-10-27','0000-00-00',1,1,1000,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','2015-03-18 06:27:48','0000-00-00 00:00:00'),(3,'ERP','Bootstrap easily and efficiently scales your websites and applications with a single code base, from phones to tablets to desktops with CSS media queries.',1,4,'Proyecto 3','2014-10-27','0000-00-00',1,1,1500,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','2015-03-18 06:31:13','0000-00-00 00:00:00'),(4,'Sidcasoft','Proyecto para el contol de proyectos software',1,1,'Sidcasoft','2015-03-18','2015-12-12',1,2,10000,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','2015-03-18 06:27:59','0000-00-00 00:00:00'),(5,'Proyecto XYZ','Esto es una prueba creada por Luis Eduardo Villela y modificada por él mismo',1,1,'Prueba modificada','2015-05-23','2015-07-02',1,1,1000000,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','2015-03-17 01:41:50','2015-03-06 11:25:51'),(6,'Proyecto DEF','Esto es una prueba del proyecto nuevo con una empresa asignada',8,5,'Proyecto DEF','2015-03-17','2015-03-21',1,1,100,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','2015-03-17 09:12:12','2015-03-17 09:12:12');
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recursos_materiales`
--

DROP TABLE IF EXISTS `recursos_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recursos_materiales` (
  `idRecMat` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `idProveedor` int(10) NOT NULL,
  PRIMARY KEY (`idRecMat`),
  KEY `idProveedor` (`idProveedor`),
  CONSTRAINT `recursos_materiales_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recursos_materiales`
--

LOCK TABLES `recursos_materiales` WRITE;
/*!40000 ALTER TABLE `recursos_materiales` DISABLE KEYS */;
INSERT INTO `recursos_materiales` VALUES (1,'hojas blancas',1),(2,'Lapices',1),(3,'Plumones',1);
/*!40000 ALTER TABLE `recursos_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'RCP');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `estatus` tinyint(1) NOT NULL,
  `domicilio` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idTipoUsuario` int(11) NOT NULL DEFAULT '0',
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idTipoUsuario` (`idTipoUsuario`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','$2y$10$Lr8BY96yPxSmWp8ECBYpVOWWKFxXPfp6xpzqoljL31QejuhxZBVWe','paul',1,'Tecnologico de Culiacan','6677112233','2015-01-24 11:17:09','2015-02-08 03:03:32','yoZdemr72PDWvAj5G4fbI6DGk4bPcPMteg6r9vtdr4YFKWqmJURxu0U3SnJG',1,'paulgalarza@gmail.com'),(5,'Luis','123','Luis Eduardo',1,'Culiacan','6677777777','2015-03-06 10:02:44','2015-03-06 10:02:44',NULL,1,'luisedo21@gmail.com'),(9,'Luis Editado','123','Luis Eduardo',0,'Culiacan','6677777890','2015-03-08 08:01:01','2015-03-11 11:08:41',NULL,1,'luisedo21@gmail.com'),(10,'Carolina','123456789','Carolina Russell',0,'Ruben Jaramillo','6677112233','2015-03-13 12:11:45','2015-03-13 12:11:45',NULL,1,'carolinarusssell.cr@gmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17 23:33:59
