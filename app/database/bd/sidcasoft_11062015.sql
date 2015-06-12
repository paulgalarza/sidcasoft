-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2015 a las 21:24:09
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `laravel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE IF NOT EXISTS `actividad` (
`idActividad` int(10) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`idActividad`, `descripcion`, `fechaInicio`, `fechaFin`) VALUES
(1, 'actividad1', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
`idCliente` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `estatus` bit(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `idEmpresa`, `telefono`, `email`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'Paul Alfonso Galarza Cervantes', 1, '', '', NULL, '2015-03-18 06:25:16', '0000-00-00 00:00:00'),
(2, 'Carolina Russell Morales', 2, '', '', NULL, '2015-03-18 06:25:16', '0000-00-00 00:00:00'),
(3, 'Clarissa Medina', 1, '', '', NULL, '2015-03-18 06:26:00', '0000-00-00 00:00:00'),
(4, 'Cliente 10', 3, '9991223344', 'hxkjdkj@jhcjhdcujdk.com', NULL, '2015-03-11 04:12:55', '2015-03-11 11:12:55'),
(5, 'Cliente 4', 4, '', '', NULL, '2015-03-06 04:10:33', '0000-00-00 00:00:00'),
(8, 'Luis Eduardo', 5, '6677777789', 'luisedo21@gmail.com', NULL, '2015-03-11 02:14:33', '2015-03-11 09:14:33'),
(9, 'Cliente 9', 2, '', '', NULL, '2015-03-06 04:10:33', '0000-00-00 00:00:00'),
(10, 'Cliente 10', 3, '6672223344', 'cliente10@gmail.com', b'1', '2015-03-06 04:10:33', '0000-00-00 00:00:00'),
(11, 'Cliente 11', 4, '6677889911', 'cliente11@gmail.com', b'1', '2015-03-06 04:10:33', '0000-00-00 00:00:00'),
(12, 'Cliente 12', 3, '6677889911', 'cliente12@gmail.com', NULL, '2015-03-06 04:10:33', '0000-00-00 00:00:00'),
(13, 'Cliente 13', 4, '', '', NULL, '2015-03-06 04:10:33', '0000-00-00 00:00:00'),
(14, 'Cliente 14', 3, '', '', NULL, '2015-03-06 04:10:33', '0000-00-00 00:00:00'),
(15, 'Cliente 15', 2, '', '', NULL, '2015-03-06 04:10:33', '0000-00-00 00:00:00'),
(16, 'Luis', 5, '6699999999', 'luisedo21@gmail.com', NULL, '2015-03-07 04:19:00', '2015-03-06 11:10:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
`idEmpresa` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `RFC` varchar(13) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `estatus` bit(1) DEFAULT NULL,
  `encargado` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idEmpresa`, `nombre`, `telefono`, `RFC`, `direccion`, `estatus`, `encargado`, `updated_at`, `created_at`) VALUES
(1, 'Instituto Tecnologico de Culiacan', '6677112233', 'RUMC9207174U9', 'Blvd. Enrique Cabrera', b'1', 'Carmen García', '2015-03-18 06:28:32', '0000-00-00 00:00:00'),
(2, 'ClickBalance', '6677223344', 'RUMC9207174U9', 'Blvd. Lomas de San Miguel', b'1', 'Daniela Ochoa', '2015-03-18 06:10:17', '0000-00-00 00:00:00'),
(3, 'Sukarne', '667733333333', NULL, NULL, NULL, NULL, '2015-03-18 06:10:17', '0000-00-00 00:00:00'),
(4, 'Coppel', '6677444444', 'VIZL930921RS9', 'Culiacan', b'1', 'Luis', '2015-03-18 06:10:17', '0000-00-00 00:00:00'),
(5, 'Empresa XYZ', '6677777789', 'VIZL930921RS9', 'Culiacan', b'1', 'Luis Eduardo V Z', '2015-03-11 09:02:58', '2015-03-06 11:01:38'),
(6, 'Empresa Y', '6677777777', 'VIZL930921', 'Culiacan', b'1', 'Villela', '2015-03-08 05:43:01', '2015-03-08 05:43:01'),
(7, 'Empresa Z', '6677777777', 'VIZL930921', 'Culiacan', b'1', 'Villela', '2015-03-08 05:43:22', '2015-03-08 05:43:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE IF NOT EXISTS `estatus` (
  `idEstatus` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`idEstatus`, `nombre`) VALUES
(1, 'Propuesto'),
(2, 'Aprobado'),
(3, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2015_01_17_072632_create_users_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
`idPage` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `navbar` bit(1) DEFAULT b'0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`idPage`, `descripcion`, `navbar`) VALUES
(1, 'Proyectos', b'1'),
(2, 'Usuarios', b'1'),
(3, 'Empresas', b'1'),
(4, 'Clientes', b'1'),
(5, 'Documentos', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagesbyuser`
--

CREATE TABLE IF NOT EXISTS `pagesbyuser` (
  `idTipoUsuario` int(11) NOT NULL,
  `idPage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagesbyuser`
--

INSERT INTO `pagesbyuser` (`idTipoUsuario`, `idPage`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesos`
--

CREATE TABLE IF NOT EXISTS `procesos` (
`idProceso` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `idActividad` int(10) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `procesos`
--

INSERT INTO `procesos` (`idProceso`, `nombre`, `idActividad`, `fechaInicio`, `fechaFin`) VALUES
(1, 'proceso 1', 1, '0000-00-00', '0000-00-00'),
(2, 'proceso 2', 1, '2014-01-01', '2015-01-01'),
(3, 'proceso 3', 1, '2014-02-02', '2014-02-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
`idProveedor` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `RFC` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `nombre`, `direccion`, `RFC`, `telefono`) VALUES
(1, 'russell', 'infonavit humaya', 'RUMC9207174U9', '6671026353');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE IF NOT EXISTS `proyecto` (
`idProyecto` int(10) NOT NULL,
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
  `status` int(11) NOT NULL,
  `usuarioRAP` int(10) unsigned NOT NULL,
  `usuarioRCP` int(10) unsigned NOT NULL,
  `usuarioAnalista` int(10) unsigned NOT NULL,
  `usuarioArquitecto` int(10) unsigned NOT NULL,
  `usuarioDesarrollador` int(10) unsigned NOT NULL,
  `usuarioTester` int(10) unsigned NOT NULL,
  `fechaIncial` datetime NOT NULL,
  `fechaFinal` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`idProyecto`, `nombre`, `descripcion`, `idCliente`, `idEmpresa`, `titulo`, `fechaInicio`, `fechaFin`, `idRecMat`, `idProceso`, `costoTotal`, `status`, `usuarioRAP`, `usuarioRCP`, `usuarioAnalista`, `usuarioArquitecto`, `usuarioDesarrollador`, `usuarioTester`, `fechaIncial`, `fechaFinal`, `updated_at`, `created_at`) VALUES
(1, 'Sistema Gestion de Indicadores', 'Los indicadores clave de rendimiento (KPI) ayudan a las empresas a entender lo bien que se está realizando el trabajo en relación con sus metas y objetivos estratégicos. En un sentido más amplio, un KPI proporciona la información de rendimiento más importante que permite a las partes interesadas saber si se va por buen camino.', 1, 2, 'KPI', '2014-10-26', '2015-11-30', 1, 1, 500, 1, 1, 5, 9, 10, 11, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-04-16 19:08:18', '0000-00-00 00:00:00'),
(2, 'Sistema de control de Inventarios', 'Son destinatarias directas tanto las organizaciones solidarias como las personas a las que se invita a participar, en este caso, la población de Bizkaia; y son destinatarias indirectas las personas usuarias de los programas desarrollados por las entidades.', 1, 3, 'Proyecto 2', '2014-10-27', '0000-00-00', 1, 1, 1000, 1, 1, 5, 9, 10, 11, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-04-16 19:08:32', '0000-00-00 00:00:00'),
(3, 'ERP', 'Bootstrap easily and efficiently scales your websites and applications with a single code base, from phones to tablets to desktops with CSS media queries.', 1, 4, 'Proyecto 3', '2014-10-27', '0000-00-00', 1, 1, 1500, 2, 1, 5, 9, 10, 11, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-04-16 19:08:34', '0000-00-00 00:00:00'),
(4, 'Sidcasoft', 'Proyecto para el contol de proyectos software', 1, 1, 'Sidcasoft', '2015-03-18', '2015-12-12', 1, 2, 10000, 2, 1, 5, 9, 10, 11, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-04-16 19:08:36', '0000-00-00 00:00:00'),
(5, 'Proyecto XYZ', 'Esto es una prueba creada por Luis Eduardo Villela y modificada por él mismo', 1, 1, 'Prueba modificada', '2015-05-23', '2015-07-02', 1, 1, 1000000, 0, 1, 5, 9, 10, 11, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-04-16 19:08:38', '2015-03-06 11:25:51'),
(6, 'Proyecto DEF', 'Esto es una prueba del proyecto nuevo con una empresa asignada', 8, 5, 'Proyecto DEF', '2015-03-17', '2015-03-21', 1, 1, 100, 0, 1, 5, 9, 10, 11, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-04-16 19:08:45', '2015-03-17 09:12:12'),
(7, 'Sistema de cargas', 'Mejoras al sistema de cargas del ITC', 3, 1, 'Sistema de cargas', '2015-04-02', '0000-00-00', 1, 1, NULL, 1, 1, 5, 9, 10, 11, 12, '0000-00-00 00:00:00', NULL, '2015-04-16 19:08:47', '2015-03-22 08:07:47'),
(8, 'Sistema Checadores', 'Sistema que usarán los checadores del ITC', 8, 1, 'Checadores', '2015-05-01', '0000-00-00', 1, 2, NULL, 1, 1, 5, 9, 10, 11, 12, '0000-00-00 00:00:00', '2015-05-10 06:00:00', '2015-04-16 19:08:49', '2015-04-17 00:19:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos_materiales`
--

CREATE TABLE IF NOT EXISTS `recursos_materiales` (
`idRecMat` int(10) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `idProveedor` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `recursos_materiales`
--

INSERT INTO `recursos_materiales` (`idRecMat`, `descripcion`, `idProveedor`) VALUES
(1, 'hojas blancas', 1),
(2, 'Lapices', 1),
(3, 'Plumones', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE IF NOT EXISTS `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idTipoUsuario`, `descripcion`) VALUES
(1, 'RCP'),
(2, 'RAP'),
(3, 'Analista'),
(4, 'Arquitecto'),
(5, 'Desarrollador'),
(6, 'Tester');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
`idUsuario` int(10) unsigned NOT NULL,
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
  `ProyectoAsignado` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuario`, `password`, `nombre`, `estatus`, `domicilio`, `telefono`, `created_at`, `updated_at`, `remember_token`, `idTipoUsuario`, `email`, `ProyectoAsignado`) VALUES
(1, 'admin', '$2y$10$Lr8BY96yPxSmWp8ECBYpVOWWKFxXPfp6xpzqoljL31QejuhxZBVWe', 'paul', 1, 'Tecnologico de Culiacan', '6677112233', '2015-01-24 11:17:09', '2015-02-08 03:03:32', 'yoZdemr72PDWvAj5G4fbI6DGk4bPcPMteg6r9vtdr4YFKWqmJURxu0U3SnJG', 1, 'paulgalarza@gmail.com', NULL),
(5, 'Luis Eduardo', '123', 'Luis Eduardo', 1, 'Culiacan', '6677777777', '2015-03-06 10:02:44', '2015-04-17 00:45:49', NULL, 2, 'luisedo21@gmail.com', NULL),
(9, 'Luis Editado', '123', 'Luis Eduardo', 0, 'Culiacan', '6677777890', '2015-03-08 08:01:01', '2015-04-17 00:46:00', NULL, 3, 'luisedo21@gmail.com', NULL),
(10, 'Carolina', '123456789', 'Carolina Russell', 0, 'Ruben Jaramillo', '6677112233', '2015-03-13 12:11:45', '2015-04-17 00:46:05', NULL, 4, 'carolinarusssell.cr@gmail.com', NULL),
(11, 'Martín Nevarez', '123', 'Martín Nevarez', 1, 'Costa Rica', '6877777777', '2015-04-17 00:46:42', '2015-04-17 00:46:42', NULL, 5, 'martin@martin.com', NULL),
(12, 'Michelle', '123', 'Michelle Soots', 1, 'Culiacan', '6677778899', '2015-04-17 00:47:09', '2015-04-17 00:47:09', NULL, 6, 'michelle@soots.com', 7),
(13, 'Edgar', '123', 'Edgar Domínguez', 1, 'Culiacan', '6677778899', '2015-04-17 00:47:09', '2015-04-17 00:47:09', NULL, 6, 'edgar@dominguez.com', 8),
(14, 'Carlos', '123', 'Carlos A', 1, 'Culiacan', '6677777789', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 1, 'carlos@carlos.com', NULL),
(15, 'Evelyn', '123', 'Evelyn Z', 2, 'Culiacan', '6677777723', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 2, 'evelyn@evelyn.com', NULL),
(16, 'Abraham', '123', 'Abraham', 3, 'Culiacan', '6677777723', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 3, 'abraham@abraham.com', NULL),
(17, 'Ana', '123', 'Ana Lidia', 4, 'Culiacan', '6677423325', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 4, 'ana@ana.com', NULL),
(18, 'Lucero', '123', 'Lucero', 5, 'Culiacan', '6677745613', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 5, 'lucero@lucero.com', NULL),
(19, 'Roberto', '123', 'Roberto', 6, 'Culiacan', '6677094052', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 6, 'roberto@roberto.com', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
 ADD PRIMARY KEY (`idActividad`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`idCliente`), ADD KEY `idEmpresa` (`idEmpresa`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
 ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `estatus`
--
ALTER TABLE `estatus`
 ADD PRIMARY KEY (`idEstatus`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
 ADD PRIMARY KEY (`idPage`);

--
-- Indices de la tabla `procesos`
--
ALTER TABLE `procesos`
 ADD PRIMARY KEY (`idProceso`), ADD KEY `idActividad` (`idActividad`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
 ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
 ADD PRIMARY KEY (`idProyecto`), ADD KEY `idCliente` (`idCliente`), ADD KEY `idRecMat` (`idRecMat`), ADD KEY `idProceso` (`idProceso`), ADD KEY `idEmpresa` (`idEmpresa`), ADD KEY `idEmpresa_2` (`idEmpresa`), ADD KEY `usuarioRAP` (`usuarioRAP`), ADD KEY `usuarioRCP` (`usuarioRCP`), ADD KEY `usuarioArquitecto` (`usuarioArquitecto`), ADD KEY `usuarioArquitecto_2` (`usuarioArquitecto`), ADD KEY `usuarioDesarrollador` (`usuarioDesarrollador`), ADD KEY `usuarioTester` (`usuarioTester`), ADD KEY `usuarioAnalista` (`usuarioAnalista`);

--
-- Indices de la tabla `recursos_materiales`
--
ALTER TABLE `recursos_materiales`
 ADD PRIMARY KEY (`idRecMat`), ADD KEY `idProveedor` (`idProveedor`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
 ADD PRIMARY KEY (`idTipoUsuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`idUsuario`), ADD KEY `idTipoUsuario` (`idTipoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
MODIFY `idActividad` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
MODIFY `idCliente` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
MODIFY `idPage` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `procesos`
--
ALTER TABLE `procesos`
MODIFY `idProceso` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
MODIFY `idProveedor` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
MODIFY `idProyecto` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `recursos_materiales`
--
ALTER TABLE `recursos_materiales`
MODIFY `idRecMat` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `idUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`);

--
-- Filtros para la tabla `procesos`
--
ALTER TABLE `procesos`
ADD CONSTRAINT `procesos_ibfk_1` FOREIGN KEY (`idActividad`) REFERENCES `actividad` (`idActividad`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
ADD CONSTRAINT `proyecto_ibfk_10` FOREIGN KEY (`usuarioArquitecto`) REFERENCES `usuarios` (`idUsuario`),
ADD CONSTRAINT `proyecto_ibfk_11` FOREIGN KEY (`usuarioDesarrollador`) REFERENCES `usuarios` (`idUsuario`),
ADD CONSTRAINT `proyecto_ibfk_12` FOREIGN KEY (`usuarioTester`) REFERENCES `usuarios` (`idUsuario`),
ADD CONSTRAINT `proyecto_ibfk_3` FOREIGN KEY (`idRecMat`) REFERENCES `recursos_materiales` (`idRecMat`),
ADD CONSTRAINT `proyecto_ibfk_4` FOREIGN KEY (`idProceso`) REFERENCES `procesos` (`idProceso`),
ADD CONSTRAINT `proyecto_ibfk_5` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
ADD CONSTRAINT `proyecto_ibfk_6` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`),
ADD CONSTRAINT `proyecto_ibfk_7` FOREIGN KEY (`usuarioRAP`) REFERENCES `usuarios` (`idUsuario`),
ADD CONSTRAINT `proyecto_ibfk_8` FOREIGN KEY (`usuarioRCP`) REFERENCES `usuarios` (`idUsuario`),
ADD CONSTRAINT `proyecto_ibfk_9` FOREIGN KEY (`usuarioAnalista`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `recursos_materiales`
--
ALTER TABLE `recursos_materiales`
ADD CONSTRAINT `recursos_materiales_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
