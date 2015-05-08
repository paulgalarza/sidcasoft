-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-03-2015 a las 05:23:17
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

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
(1, 'paul', 1, '', '', NULL, '2015-03-06 04:10:33', '0000-00-00 00:00:00'),
(2, 'Carolina', 2, '', '', NULL, '2015-03-06 04:10:33', '0000-00-00 00:00:00'),
(3, 'Alexis', 1, '', '', NULL, '2015-03-06 04:10:33', '0000-00-00 00:00:00'),
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
(1, 'Empresa 1', '6677112233', 'RUMC9207174U9', 'Blvd. Enrique Cabrera', b'1', 'Carmen García', '2015-03-02 05:06:30', '0000-00-00 00:00:00'),
(2, 'Empresa 2', '6677223344', 'RUMC9207174U9', 'Blvd. Lomas de San Miguel', b'1', 'Daniela Ochoa', '2015-03-02 05:06:30', '0000-00-00 00:00:00'),
(3, 'Empresa 3', '667733333333', NULL, NULL, NULL, NULL, '2015-03-02 05:06:30', '0000-00-00 00:00:00'),
(4, 'Empresa 44', '6677444444', 'VIZL930921RS9', 'Culiacan', b'1', 'Luis', '2015-03-11 11:11:59', '0000-00-00 00:00:00'),
(5, 'Empresa XYZ', '6677777789', 'VIZL930921RS9', 'Culiacan', b'1', 'Luis Eduardo V Z', '2015-03-11 09:02:58', '2015-03-06 11:01:38'),
(6, 'Empresa Y', '6677777777', 'VIZL930921', 'Culiacan', b'1', 'Villela', '2015-03-08 05:43:01', '2015-03-08 05:43:01'),
(7, 'Empresa Z', '6677777777', 'VIZL930921', 'Culiacan', b'1', 'Villela', '2015-03-08 05:43:22', '2015-03-08 05:43:22');

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
(5, 'Catalogos', b'1');

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
  `titulo` varchar(100) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `idRecMat` int(10) NOT NULL,
  `idProceso` int(10) NOT NULL,
  `costoTotal` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `fechaIncial` datetime NOT NULL,
  `fechaFinal` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`idProyecto`, `nombre`, `descripcion`, `idCliente`, `titulo`, `fechaInicio`, `fechaFin`, `idRecMat`, `idProceso`, `costoTotal`, `status`, `fechaIncial`, `fechaFinal`, `updated_at`, `created_at`) VALUES
(1, 'proyecto1', 'este es una prueba', 1, 'proyecto 1', '2014-10-26', '0000-00-00', 1, 1, 500, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-03-06 04:25:46', '0000-00-00 00:00:00'),
(2, 'Proyecto 2', 'Descripcion del proyecto 2', 1, 'Proyecto 2', '2014-10-27', '0000-00-00', 1, 1, 1000, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-03-06 04:25:46', '0000-00-00 00:00:00'),
(3, 'Proyecto 3', 'Descripcion del proyecto 3', 1, 'Proyecto 3', '2014-10-27', '0000-00-00', 1, 1, 1500, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-03-06 04:25:46', '0000-00-00 00:00:00'),
(4, 'Sidcasoft', 'Proyecto para el contol de proyectos', 1, 'Sidcasoft', '2015-01-01', '0000-00-00', 1, 1, 10000, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-03-06 04:25:46', '0000-00-00 00:00:00'),
(5, 'Proyecto XYZ', 'Esto es una prueba creada por Luis Eduardo Villela y modificada por él mismo', 1, 'Prueba modificada', '2015-05-23', '2015-07-02', 1, 1, 1000000, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-03-11 11:02:07', '2015-03-06 11:25:51');

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
(1, 'RCP');

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
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuario`, `password`, `nombre`, `estatus`, `domicilio`, `telefono`, `created_at`, `updated_at`, `remember_token`, `idTipoUsuario`, `email`) VALUES
(1, 'admin', '$2y$10$Lr8BY96yPxSmWp8ECBYpVOWWKFxXPfp6xpzqoljL31QejuhxZBVWe', 'paul', 1, 'Tecnologico de Culiacan', '6677112233', '2015-01-24 11:17:09', '2015-02-08 03:03:32', 'yoZdemr72PDWvAj5G4fbI6DGk4bPcPMteg6r9vtdr4YFKWqmJURxu0U3SnJG', 1, 'paulgalarza@gmail.com'),
(5, 'Luis', '123', 'Luis Eduardo', 1, 'Culiacan', '6677777777', '2015-03-06 10:02:44', '2015-03-06 10:02:44', NULL, 1, 'luisedo21@gmail.com'),
(9, 'Luis Editado', '123', 'Luis Eduardo', 0, 'Culiacan', '6677777890', '2015-03-08 08:01:01', '2015-03-11 11:08:41', NULL, 1, 'luisedo21@gmail.com');

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
 ADD PRIMARY KEY (`idProyecto`), ADD KEY `idCliente` (`idCliente`), ADD KEY `idRecMat` (`idRecMat`), ADD KEY `idProceso` (`idProceso`);

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
MODIFY `idProyecto` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `recursos_materiales`
--
ALTER TABLE `recursos_materiales`
MODIFY `idRecMat` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `idUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
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
ADD CONSTRAINT `proyecto_ibfk_3` FOREIGN KEY (`idRecMat`) REFERENCES `recursos_materiales` (`idRecMat`),
ADD CONSTRAINT `proyecto_ibfk_4` FOREIGN KEY (`idProceso`) REFERENCES `procesos` (`idProceso`),
ADD CONSTRAINT `proyecto_ibfk_5` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

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
