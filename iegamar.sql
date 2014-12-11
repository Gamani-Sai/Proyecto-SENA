-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2014 a las 19:40:06
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `iegamar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_llegada_tarde`
--

CREATE TABLE IF NOT EXISTS `control_llegada_tarde` (
  `Id_llegada_tarde` int(11) NOT NULL,
  `Fecha` varchar(255) DEFAULT NULL,
  `Hora` varchar(255) DEFAULT NULL,
  `Identificacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_llegada_tarde`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cuentas_usuario`
--

CREATE TABLE IF NOT EXISTS `tbl_cuentas_usuario` (
  `Id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Tipo_rol` varchar(255) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_cuenta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tbl_cuentas_usuario`
--

INSERT INTO `tbl_cuentas_usuario` (`Id_cuenta`, `Login`, `Password`, `Tipo_rol`, `Estado`) VALUES
(1, 'Admin', 'Iegamar', 'Super', 'Habilitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_cunetaxprestamo`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_cunetaxprestamo` (
  `Id_cuenta` int(11) DEFAULT NULL,
  `Id_prestamo` int(11) DEFAULT NULL,
  `Tipo` varchar(40) DEFAULT NULL,
  KEY `tbl_dtlls_estudiente*prestamo` (`Id_cuenta`),
  KEY `Id_prestamo` (`Id_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_empleadosxcuentas`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_empleadosxcuentas` (
  `Identificacion` varchar(11) DEFAULT NULL,
  `Id_cuenta` int(11) DEFAULT NULL,
  KEY `tbl_dtlls_empleados*cuentas` (`Identificacion`),
  KEY `Id_cuenta` (`Id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_empleadxprestamo`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_empleadxprestamo` (
  `Identificacion` varchar(11) DEFAULT NULL,
  `Id_prestamo` int(11) DEFAULT NULL,
  KEY `tbl_dtlls_empleado*prestamo` (`Identificacion`),
  KEY `Id_prestamo` (`Id_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_estudiantesxcuentas`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_estudiantesxcuentas` (
  `Identificacion` varchar(40) DEFAULT NULL,
  `Id_cuenta` int(11) DEFAULT NULL,
  KEY `tbl_dtlls_estudiantes*cuentas` (`Id_cuenta`),
  KEY `Identificacion` (`Identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_estudiantexprestamo`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_estudiantexprestamo` (
  `Identificacion` varchar(225) DEFAULT NULL,
  `Id_prestamo` int(11) DEFAULT NULL,
  KEY `tbl_dtlls_empleado*prestamo` (`Identificacion`),
  KEY `Id_prestamo` (`Id_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_movimiento`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_movimiento` (
  `Id_movimientos` int(11) DEFAULT NULL,
  `Seriales` varchar(40) DEFAULT NULL,
  KEY `movimiento` (`Id_movimientos`),
  KEY `Seriales` (`Seriales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_prestamo`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_prestamo` (
  `Id_prestamo` int(11) NOT NULL,
  `Seriales` varchar(40) NOT NULL,
  KEY `Id_prestamo` (`Id_prestamo`),
  KEY `Seriales` (`Seriales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_reserva`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_reserva` (
  `Id_reserva` int(11) NOT NULL,
  `Seriales` varchar(40) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  KEY `Id_reserva` (`Id_reserva`),
  KEY `Seriales` (`Seriales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_elementos`
--

CREATE TABLE IF NOT EXISTS `tbl_elementos` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_elemento` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleado`
--

CREATE TABLE IF NOT EXISTS `tbl_empleado` (
  `Identificacion` varchar(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(255) DEFAULT NULL,
  `Huella` varchar(255) DEFAULT NULL,
  `Fecha_nacimiento` varchar(255) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  `Perfil_profesional` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estudiante`
--

CREATE TABLE IF NOT EXISTS `tbl_estudiante` (
  `Identificacion` varchar(40) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellido` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(255) DEFAULT NULL,
  `Huella` varchar(255) DEFAULT NULL,
  `Fecha` varchar(255) DEFAULT NULL,
  `Id_grado` int(11) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Identificacion`),
  KEY `tbl_estudiante` (`Id_grado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_grado`
--

CREATE TABLE IF NOT EXISTS `tbl_grado` (
  `Id_grado` int(11) NOT NULL AUTO_INCREMENT,
  `Grado` varchar(255) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_grado`),
  UNIQUE KEY `UQ_Grado` (`Grado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_movimiento_elementos`
--

CREATE TABLE IF NOT EXISTS `tbl_movimiento_elementos` (
  `Id_movimiento` int(11) NOT NULL,
  `Tipo_movimiento` varchar(255) DEFAULT NULL,
  `Fecha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_movimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_prestamo`
--

CREATE TABLE IF NOT EXISTS `tbl_prestamo` (
  `Id_prestamo` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_prestamo` varchar(255) DEFAULT NULL,
  `Hora_prestamo` varchar(255) DEFAULT NULL,
  `Fecha_devolucion` varchar(255) DEFAULT NULL,
  `Hora_devolucion` varchar(255) DEFAULT NULL,
  `Tipo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reserva`
--

CREATE TABLE IF NOT EXISTS `tbl_reserva` (
  `Id_reserva` int(11) NOT NULL,
  `Fecha_reserva` varchar(255) DEFAULT NULL,
  `Hora_reserva` varchar(255) DEFAULT NULL,
  `Fecha_entrega` varchar(255) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  `Identificacion` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`Id_reserva`),
  KEY `Identificacion` (`Identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_seriales`
--

CREATE TABLE IF NOT EXISTS `tbl_seriales` (
  `Seriales` varchar(40) NOT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  `Codigo` int(11) DEFAULT NULL,
  `Anomalia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Seriales`),
  KEY `Codigo` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_dtlls_cunetaxprestamo`
--
ALTER TABLE `tbl_dtlls_cunetaxprestamo`
  ADD CONSTRAINT `tbl_dtlls_cunetaxprestamo_ibfk_2` FOREIGN KEY (`Id_prestamo`) REFERENCES `tbl_prestamo` (`Id_prestamo`),
  ADD CONSTRAINT `tbl_dtlls_cunetaxprestamo_ibfk_1` FOREIGN KEY (`Id_cuenta`) REFERENCES `tbl_cuentas_usuario` (`Id_cuenta`);

--
-- Filtros para la tabla `tbl_dtlls_empleadosxcuentas`
--
ALTER TABLE `tbl_dtlls_empleadosxcuentas`
  ADD CONSTRAINT `tbl_dtlls_empleadosxcuentas_ibfk_1` FOREIGN KEY (`Id_cuenta`) REFERENCES `tbl_cuentas_usuario` (`Id_cuenta`),
  ADD CONSTRAINT `aa` FOREIGN KEY (`Identificacion`) REFERENCES `tbl_empleado` (`Identificacion`);

--
-- Filtros para la tabla `tbl_dtlls_empleadxprestamo`
--
ALTER TABLE `tbl_dtlls_empleadxprestamo`
  ADD CONSTRAINT `tbl_dtlls_empleadxprestamo_ibfk_1` FOREIGN KEY (`Identificacion`) REFERENCES `tbl_empleado` (`Identificacion`),
  ADD CONSTRAINT `tbl_dtlls_empleadxprestamo_ibfk_2` FOREIGN KEY (`Id_prestamo`) REFERENCES `tbl_prestamo` (`Id_prestamo`);

--
-- Filtros para la tabla `tbl_dtlls_estudiantesxcuentas`
--
ALTER TABLE `tbl_dtlls_estudiantesxcuentas`
  ADD CONSTRAINT `tbl_dtlls_estudiantesxcuentas_ibfk_1` FOREIGN KEY (`Id_cuenta`) REFERENCES `tbl_cuentas_usuario` (`Id_cuenta`),
  ADD CONSTRAINT `tbl_dtlls_estudiantes*cuentas` FOREIGN KEY (`Identificacion`) REFERENCES `tbl_estudiante` (`Identificacion`);

--
-- Filtros para la tabla `tbl_dtlls_estudiantexprestamo`
--
ALTER TABLE `tbl_dtlls_estudiantexprestamo`
  ADD CONSTRAINT `tbl_dtlls_estudiantexprestamo_ibfk_1` FOREIGN KEY (`Identificacion`) REFERENCES `tbl_estudiante` (`Identificacion`),
  ADD CONSTRAINT `tbl_dtlls_estudiantexprestamo_ibfk_2` FOREIGN KEY (`Id_prestamo`) REFERENCES `tbl_prestamo` (`Id_prestamo`);

--
-- Filtros para la tabla `tbl_dtlls_movimiento`
--
ALTER TABLE `tbl_dtlls_movimiento`
  ADD CONSTRAINT `movimiento` FOREIGN KEY (`Id_movimientos`) REFERENCES `tbl_movimiento_elementos` (`Id_movimiento`),
  ADD CONSTRAINT `tbl_dtlls_movimiento_ibfk_1` FOREIGN KEY (`Seriales`) REFERENCES `tbl_seriales` (`Seriales`);

--
-- Filtros para la tabla `tbl_dtlls_prestamo`
--
ALTER TABLE `tbl_dtlls_prestamo`
  ADD CONSTRAINT `tbl_dtlls_prestamo_ibfk_3` FOREIGN KEY (`Seriales`) REFERENCES `tbl_seriales` (`Seriales`),
  ADD CONSTRAINT `tbl_dtlls_prestamo_ibfk_4` FOREIGN KEY (`Id_prestamo`) REFERENCES `tbl_prestamo` (`Id_prestamo`);

--
-- Filtros para la tabla `tbl_dtlls_reserva`
--
ALTER TABLE `tbl_dtlls_reserva`
  ADD CONSTRAINT `tbl_dtlls_reserva_ibfk_1` FOREIGN KEY (`Seriales`) REFERENCES `tbl_seriales` (`Seriales`);

--
-- Filtros para la tabla `tbl_estudiante`
--
ALTER TABLE `tbl_estudiante`
  ADD CONSTRAINT `tbl_estudiante` FOREIGN KEY (`Id_grado`) REFERENCES `tbl_grado` (`Id_grado`);

--
-- Filtros para la tabla `tbl_reserva`
--
ALTER TABLE `tbl_reserva`
  ADD CONSTRAINT `tbl_reserva` FOREIGN KEY (`Id_reserva`) REFERENCES `tbl_dtlls_reserva` (`Id_reserva`),
  ADD CONSTRAINT `tbl_reserva_ibfk_1` FOREIGN KEY (`Identificacion`) REFERENCES `tbl_empleado` (`Identificacion`);

--
-- Filtros para la tabla `tbl_seriales`
--
ALTER TABLE `tbl_seriales`
  ADD CONSTRAINT `tbl_seriales_ibfk_1` FOREIGN KEY (`Codigo`) REFERENCES `tbl_elementos` (`Codigo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
