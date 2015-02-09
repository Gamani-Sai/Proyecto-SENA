-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-02-2015 a las 14:05:40
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

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
  `Identificacion` varchar(25) DEFAULT NULL,
  `Fecha` varchar(255) DEFAULT NULL,
  `Hora` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `control_llegada_tarde`
--

INSERT INTO `control_llegada_tarde` (`Id_llegada_tarde`, `Identificacion`, `Fecha`, `Hora`) VALUES
(1, '88', '2015/02/08', '04:08:40'),
(2, '1234567891', '2015/02/08', '05:09:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cuentas_usuario`
--

CREATE TABLE IF NOT EXISTS `tbl_cuentas_usuario` (
`Id_cuenta` int(11) NOT NULL,
  `Login` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Tipo_rol` varchar(255) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `tbl_cuentas_usuario`
--

INSERT INTO `tbl_cuentas_usuario` (`Id_cuenta`, `Login`, `Password`, `Tipo_rol`, `Estado`) VALUES
(1, 'Admin', 'iegamar', 'Super', 'Habilitado'),
(2, '', '', 'Estudiante', 'Habilitado'),
(3, 'Andres', '123', 'Estudiante', 'Habilitado'),
(9, 'Duvan', '123', 'Estudiante', 'Habilitado'),
(10, 'Cleiman', '1', 'Super', 'Habilitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_cunetaxprestamo`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_cunetaxprestamo` (
  `Id_cuenta` int(11) DEFAULT NULL,
  `Id_prestamo` int(11) DEFAULT NULL,
  `Tipo` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_dtlls_cunetaxprestamo`
--

INSERT INTO `tbl_dtlls_cunetaxprestamo` (`Id_cuenta`, `Id_prestamo`, `Tipo`) VALUES
(3, 1, 'Prestador'),
(3, 2, 'Prestador'),
(3, 3, 'Prestador'),
(3, 1, 'Devolucion'),
(3, 2, 'Devolucion'),
(9, 3, 'Devolucion'),
(3, 4, 'Prestador'),
(3, 5, 'Prestador'),
(3, 5, 'Devolucion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_empleadosxcuentas`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_empleadosxcuentas` (
  `Identificacion` varchar(11) DEFAULT NULL,
  `Id_cuenta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_empleadxprestamo`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_empleadxprestamo` (
  `Identificacion` varchar(11) DEFAULT NULL,
  `Id_prestamo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_dtlls_empleadxprestamo`
--

INSERT INTO `tbl_dtlls_empleadxprestamo` (`Identificacion`, `Id_prestamo`) VALUES
('981234251', 2),
('981234251', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_estudiantesxcuentas`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_estudiantesxcuentas` (
  `Identificacion` varchar(40) DEFAULT NULL,
  `Id_cuenta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_dtlls_estudiantesxcuentas`
--

INSERT INTO `tbl_dtlls_estudiantesxcuentas` (`Identificacion`, `Id_cuenta`) VALUES
(NULL, 2),
('1234567891', 3),
('1234567891', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_estudiantexprestamo`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_estudiantexprestamo` (
  `Identificacion` varchar(225) DEFAULT NULL,
  `Id_prestamo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_dtlls_estudiantexprestamo`
--

INSERT INTO `tbl_dtlls_estudiantexprestamo` (`Identificacion`, `Id_prestamo`) VALUES
('1234567891', 1),
('49684944', 4),
('12345678910', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_movimiento`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_movimiento` (
  `Id_movimientos` int(11) DEFAULT NULL,
  `Seriales` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_prestamo`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_prestamo` (
  `Id_prestamo` int(11) NOT NULL,
  `Seriales` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_dtlls_prestamo`
--

INSERT INTO `tbl_dtlls_prestamo` (`Id_prestamo`, `Seriales`) VALUES
(1, '2132121312'),
(3, '2132121313'),
(4, ''),
(5, '2132121310'),
(5, '2132121314');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dtlls_reserva`
--

CREATE TABLE IF NOT EXISTS `tbl_dtlls_reserva` (
  `Id_reserva` int(11) NOT NULL,
  `Seriales` varchar(40) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_elementos`
--

CREATE TABLE IF NOT EXISTS `tbl_elementos` (
`Codigo` int(11) NOT NULL,
  `Nombre_elemento` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tbl_elementos`
--

INSERT INTO `tbl_elementos` (`Codigo`, `Nombre_elemento`, `Descripcion`) VALUES
(1, 'Dell Inspiron N4050', 'Portatil'),
(2, '', ''),
(3, '', ''),
(4, 'dll', 'portatil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleado`
--

CREATE TABLE IF NOT EXISTS `tbl_empleado` (
  `Identificacion` varchar(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellido` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(255) DEFAULT NULL,
  `Foto` varchar(100) DEFAULT NULL,
  `Fecha_nacimiento` varchar(255) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  `Perfil_profesional` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_empleado`
--

INSERT INTO `tbl_empleado` (`Identificacion`, `Nombre`, `Apellido`, `Direccion`, `Telefono`, `Foto`, `Fecha_nacimiento`, `Estado`, `Perfil_profesional`) VALUES
('88', 'Fernando', 'Runner', 'Cr3434', '555', 'http://localhost:8070/Fotos/mendeleiev.gif', '2007', 'Habilitado', 'Quimica'),
('981234251', 'Camilo Andres', 'Rojo Giraldo', 'cr2 n 56 11', '2221901', 'http://localhost:8070/Fotos/Werner.jpg', '03 Febrero 1998', 'Habilitado', 'Matematicas');

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
  `Foto` varchar(100) DEFAULT NULL,
  `Fecha` varchar(255) DEFAULT NULL,
  `Id_grado` int(11) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_estudiante`
--

INSERT INTO `tbl_estudiante` (`Identificacion`, `Nombre`, `Apellido`, `Direccion`, `Telefono`, `Foto`, `Fecha`, `Id_grado`, `Estado`) VALUES
('1234567891', 'Anderson', 'Lopez', 'cll34 n34-95', '2221901', 'http://localhost:8070/Fotos/Naruto.jpg', '11 Abril 2007', 1, 'Habilitado'),
('12345678910', 'Lucas', 'Zapata', 'VCPDKMVPWR', '483948204', 'http://localhost:8070/Fotos/Luffy.jpg', '15 Abril 1998', 1, 'Habilitado'),
('483776284', 'Sandra', 'Correa', 'VCPDKMVPWR', '483948204', 'ho', '08 Diciembre 2014', 1, 'Habilitado'),
('49684944', 'Felipe', 'Gutierrez', 'VCPDKMVPWR', '483948204', 'hol', '15 Octubre 2014', 1, 'Habilitado'),
('8788', 'Juan', 'Flecha', 'Cr3434', '555', 'hi', '2007', 1, 'Habilitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_grado`
--

CREATE TABLE IF NOT EXISTS `tbl_grado` (
`Id_grado` int(11) NOT NULL,
  `Grado` varchar(255) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tbl_grado`
--

INSERT INTO `tbl_grado` (`Id_grado`, `Grado`, `Estado`) VALUES
(1, '6-1', 'Habilitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_movimiento_elementos`
--

CREATE TABLE IF NOT EXISTS `tbl_movimiento_elementos` (
  `Id_movimiento` int(11) NOT NULL,
  `Tipo_movimiento` varchar(255) DEFAULT NULL,
  `Fecha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_prestamo`
--

CREATE TABLE IF NOT EXISTS `tbl_prestamo` (
`Id_prestamo` int(11) NOT NULL,
  `Fecha_prestamo` varchar(255) DEFAULT NULL,
  `Hora_prestamo` varchar(255) DEFAULT NULL,
  `Fecha_devolucion` varchar(255) DEFAULT NULL,
  `Hora_devolucion` varchar(255) DEFAULT NULL,
  `Tipo` varchar(40) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tbl_prestamo`
--

INSERT INTO `tbl_prestamo` (`Id_prestamo`, `Fecha_prestamo`, `Hora_prestamo`, `Fecha_devolucion`, `Hora_devolucion`, `Tipo`) VALUES
(1, '2014-12-15', '19:46', '2014-12-15', '19:56', 'Estudiante'),
(2, '2014-12-15', '19:46', '2014-12-15', '19:56', 'Profesores'),
(3, '2014-12-15', '19:46', '2014-12-15', '19:56', 'Profesores'),
(4, '2015-01-08', '12:05', 'No Asinado', 'No Asinado', 'Estudiante'),
(5, '2015-01-08', '12:06', '2015-01-08', '12:07', 'Estudiante');

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
  `Identificacion` varchar(11) DEFAULT NULL
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
  `Estado_anomalia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_seriales`
--

INSERT INTO `tbl_seriales` (`Seriales`, `Estado`, `Codigo`, `Anomalia`, `Estado_anomalia`) VALUES
('', 'Prestamo', 4, NULL, ''),
('2132121310', 'Disponible', 1, 'se Daño lo daño eliana\n                            ', 'Visto'),
('2132121311', 'Disponible', 1, '', ''),
('2132121312', 'Disponible', 1, 'malo\n                            ', 'Visto'),
('2132121313', 'Disponible', 1, '', ''),
('2132121314', 'Disponible', 1, NULL, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `control_llegada_tarde`
--
ALTER TABLE `control_llegada_tarde`
 ADD PRIMARY KEY (`Id_llegada_tarde`);

--
-- Indices de la tabla `tbl_cuentas_usuario`
--
ALTER TABLE `tbl_cuentas_usuario`
 ADD PRIMARY KEY (`Id_cuenta`), ADD UNIQUE KEY `Login` (`Login`);

--
-- Indices de la tabla `tbl_dtlls_cunetaxprestamo`
--
ALTER TABLE `tbl_dtlls_cunetaxprestamo`
 ADD KEY `tbl_dtlls_estudiente*prestamo` (`Id_cuenta`), ADD KEY `Id_prestamo` (`Id_prestamo`);

--
-- Indices de la tabla `tbl_dtlls_empleadosxcuentas`
--
ALTER TABLE `tbl_dtlls_empleadosxcuentas`
 ADD KEY `tbl_dtlls_empleados*cuentas` (`Identificacion`), ADD KEY `Id_cuenta` (`Id_cuenta`);

--
-- Indices de la tabla `tbl_dtlls_empleadxprestamo`
--
ALTER TABLE `tbl_dtlls_empleadxprestamo`
 ADD KEY `tbl_dtlls_empleado*prestamo` (`Identificacion`), ADD KEY `Id_prestamo` (`Id_prestamo`);

--
-- Indices de la tabla `tbl_dtlls_estudiantesxcuentas`
--
ALTER TABLE `tbl_dtlls_estudiantesxcuentas`
 ADD KEY `tbl_dtlls_estudiantes*cuentas` (`Id_cuenta`), ADD KEY `Identificacion` (`Identificacion`);

--
-- Indices de la tabla `tbl_dtlls_estudiantexprestamo`
--
ALTER TABLE `tbl_dtlls_estudiantexprestamo`
 ADD KEY `tbl_dtlls_empleado*prestamo` (`Identificacion`), ADD KEY `Id_prestamo` (`Id_prestamo`);

--
-- Indices de la tabla `tbl_dtlls_movimiento`
--
ALTER TABLE `tbl_dtlls_movimiento`
 ADD KEY `movimiento` (`Id_movimientos`), ADD KEY `Seriales` (`Seriales`);

--
-- Indices de la tabla `tbl_dtlls_prestamo`
--
ALTER TABLE `tbl_dtlls_prestamo`
 ADD KEY `Id_prestamo` (`Id_prestamo`), ADD KEY `Seriales` (`Seriales`);

--
-- Indices de la tabla `tbl_dtlls_reserva`
--
ALTER TABLE `tbl_dtlls_reserva`
 ADD KEY `Id_reserva` (`Id_reserva`), ADD KEY `Seriales` (`Seriales`);

--
-- Indices de la tabla `tbl_elementos`
--
ALTER TABLE `tbl_elementos`
 ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
 ADD PRIMARY KEY (`Identificacion`), ADD UNIQUE KEY `IDFOTO` (`Foto`);

--
-- Indices de la tabla `tbl_estudiante`
--
ALTER TABLE `tbl_estudiante`
 ADD PRIMARY KEY (`Identificacion`), ADD UNIQUE KEY `IDOC` (`Foto`), ADD KEY `tbl_estudiante` (`Id_grado`);

--
-- Indices de la tabla `tbl_grado`
--
ALTER TABLE `tbl_grado`
 ADD PRIMARY KEY (`Id_grado`), ADD UNIQUE KEY `UQ_Grado` (`Grado`);

--
-- Indices de la tabla `tbl_movimiento_elementos`
--
ALTER TABLE `tbl_movimiento_elementos`
 ADD PRIMARY KEY (`Id_movimiento`);

--
-- Indices de la tabla `tbl_prestamo`
--
ALTER TABLE `tbl_prestamo`
 ADD PRIMARY KEY (`Id_prestamo`);

--
-- Indices de la tabla `tbl_reserva`
--
ALTER TABLE `tbl_reserva`
 ADD PRIMARY KEY (`Id_reserva`), ADD KEY `Identificacion` (`Identificacion`);

--
-- Indices de la tabla `tbl_seriales`
--
ALTER TABLE `tbl_seriales`
 ADD PRIMARY KEY (`Seriales`), ADD KEY `Codigo` (`Codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `control_llegada_tarde`
--
ALTER TABLE `control_llegada_tarde`
MODIFY `Id_llegada_tarde` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_cuentas_usuario`
--
ALTER TABLE `tbl_cuentas_usuario`
MODIFY `Id_cuenta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `tbl_elementos`
--
ALTER TABLE `tbl_elementos`
MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tbl_grado`
--
ALTER TABLE `tbl_grado`
MODIFY `Id_grado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_prestamo`
--
ALTER TABLE `tbl_prestamo`
MODIFY `Id_prestamo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_dtlls_cunetaxprestamo`
--
ALTER TABLE `tbl_dtlls_cunetaxprestamo`
ADD CONSTRAINT `tbl_dtlls_cunetaxprestamo_ibfk_1` FOREIGN KEY (`Id_cuenta`) REFERENCES `tbl_cuentas_usuario` (`Id_cuenta`),
ADD CONSTRAINT `tbl_dtlls_cunetaxprestamo_ibfk_2` FOREIGN KEY (`Id_prestamo`) REFERENCES `tbl_prestamo` (`Id_prestamo`);

--
-- Filtros para la tabla `tbl_dtlls_empleadosxcuentas`
--
ALTER TABLE `tbl_dtlls_empleadosxcuentas`
ADD CONSTRAINT `aa` FOREIGN KEY (`Identificacion`) REFERENCES `tbl_empleado` (`Identificacion`),
ADD CONSTRAINT `tbl_dtlls_empleadosxcuentas_ibfk_1` FOREIGN KEY (`Id_cuenta`) REFERENCES `tbl_cuentas_usuario` (`Id_cuenta`);

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
ADD CONSTRAINT `tbl_dtlls_estudiantes*cuentas` FOREIGN KEY (`Identificacion`) REFERENCES `tbl_estudiante` (`Identificacion`),
ADD CONSTRAINT `tbl_dtlls_estudiantesxcuentas_ibfk_1` FOREIGN KEY (`Id_cuenta`) REFERENCES `tbl_cuentas_usuario` (`Id_cuenta`);

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
