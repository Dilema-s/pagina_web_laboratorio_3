-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2017 a las 17:27:20
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dvd`
--

CREATE TABLE `dvd` (
  `id_dvd` int(11) NOT NULL,
  `titulo` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `director` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `publicado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `anio` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `genero` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `baja` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `dvd`
--

INSERT INTO `dvd` (`id_dvd`, `titulo`, `director`, `publicado`, `anio`, `genero`, `descripcion`, `estado`, `baja`) VALUES
(1, 'Rapido y furioso 7', 'Wan, James', 'Universal Pictures (Estados Unidos)', '2015', 7, '137 min.', 1, 0),
(2, 'cccc', 'cccc', 'ccc', '200', 7, 'cccc', 0, 1),
(3, 'Nueve reinas', 'Bielinsky, Fabián', 'AVH (Buenos Aires)', '2000', 11, 'CINEMATOGRAFIA(ARGENTINA) - ESTAFA', 1, 0),
(4, 'Friends', 'Crane, David', 'AVH (Buenos Aires)', '2005', 12, '1 videocasete (DVD, PAL)(ca 150 min. son. col.', 1, 0),
(5, 'Troya', 'Petersen, Wolfgang', 'AVH (Buenos Aires)', '2010', 11, 'GRECIA-HISTORIA | MITOLOGIA GRIEGA', 1, 0),
(6, 'Un novio para mi mujer', 'Taratuto, Juan', 'Patagonik (Buenos Aires)', '2008', 14, ' 1 videocasete (DVD, PAL)(100 min. son. col.', 1, 0),
(7, 'La Rosa Púrpura del Cairo', 'Allen, Woody', 'Gativideo (Buenos Aires)', '2005', 12, '1 videocasete (DVD, PAL)(72 min. son. col.', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `estado`) VALUES
(1, 'Disponible'),
(2, 'Prestado'),
(3, 'Reservado'),
(4, 'Baja'),
(5, 'Finalizada'),
(6, 'Cancelada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `genero` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `baja` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `genero`, `baja`) VALUES
(5, 'NEUROCIENCIA', 1),
(6, 'NEUROCIENCIA', 0),
(7, 'LITERATURA ARGENTINA', 0),
(8, 'LITERATURA NORTEAMERICANA', 0),
(9, 'ACCIÓN', 0),
(10, 'INFORMÁTICA', 0),
(11, 'SUSPENSO', 0),
(12, 'COMEDIA', 0),
(13, 'LITERATURA URUGUAYA', 0),
(14, 'COMEDIA ROMANTICA', 0),
(15, 'FILOSOFIA', 0),
(16, 'TERROR', 0),
(17, 'VERSOS', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id_libro` int(11) NOT NULL,
  `titulo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `autor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `genero` int(11) NOT NULL,
  `editor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `anio` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `baja` tinyint(1) NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id_libro`, `titulo`, `autor`, `genero`, `editor`, `anio`, `descripcion`, `baja`, `estado`) VALUES
(1, 'Los pasajeros del Anna C.', 'Alcoba, Laura', 7, 'Edhasa (Buenos Aires) 1a. ed.', '2012', '288 p.', 0, 2),
(2, 'Cuentos de la selva', 'Quiroga, Horacio', 7, 'Losada (Buenos Aires) 18a ed', '1977', '120 p.', 0, 2),
(3, 'La historia del loco', 'Katzenbach, John', 8, 'Ediciones B (Barcelona) 1a ed', '2004', '495 p.', 1, 3),
(4, 'Usar el cerebro', 'Manes, Facundo', 6, 'Planeta 2° ed. (impreso en Buenos Aires)', '2014', '364 páginas.', 0, 1),
(5, 'Guía del Basic', 'Reffin Smith, Brian', 10, 'Lagos (Madrid)', '1983', '48 p. LENGUAJES ARTIFICIALES PARA MAQUINAS', 0, 1),
(6, 'Nueve reinas', 'Bielinsky, Fabián', 11, 'AVH (Buenos Aires)', '2000', 'CINEMATOGRAFIA(ARGENTINA)', 1, 1),
(7, 'hhh', 'hhhh', 6, 'hhhh', '444', 'tttt', 1, 1),
(8, 'ssss', 'sssss', 10, 'ssss', '222', 'wwwwww', 0, 1),
(9, 'Espejos', 'Galeano, Eduardo', 13, '1a. ed. Siglo XXI (Buenos Aires) ', '2008', '376 p.', 0, 1),
(10, 'Así habló Zarathustra', 'Nietzsche, Friedrich', 15, 'RBA Coleccionables (Barcelona)', '2002', '1a. ed.', 0, 1),
(11, 'Humano, demasiado humano', 'Nietzsche, Friedrich', 15, 'Grafidco (Buenos Aires)', '2004', '287 p.', 0, 1),
(12, 'Martín Fierro', 'Hernández, José', 17, 'Atlantida (Buenos Aires)', '1947', '3a ed', 0, 1),
(13, '¿Qué es el ser nacional?', 'Hernández Arregui, Juan José', 6, 'Catálogos (Buenos Aires)', '2002', '249 p.', 0, 1),
(14, 'Los restos del día', 'Ishiguro, Kazuo', 11, 'Anagrama (Argentina)', '2017', 'Hernández Francés, Ángel Luis -- tr.', 0, 1),
(15, 'El gigante enterrado', 'Ishiguro, Kazuo', 11, 'Anagrama (CABA)', '2016', 'LITERATURA | LITERATURA INGLESA -- NARRATIVA INGLESA', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `id_item` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `baja` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `id_item`, `id_usuario`, `fecha`, `baja`) VALUES
(1, 'Los pasajeros de Anna C.', 1, '2017-06-27', 1),
(2, 'Los pasajeros de Anna C.', 1, '2017-06-27', 1),
(3, 'Los pasajeros del Anna C.', 1, '2017-06-28', 1),
(4, 'Cuentos de la selva', 1, '2017-06-29', 1),
(5, 'La historia del loco', 1, '2017-06-29', 1),
(6, 'Usar el cerebro', 1, '2017-06-29', 1),
(7, 'Cuentos de la selva', 1, '2017-06-29', 1),
(8, 'Cuentos de la selva', 1, '2017-06-29', 1),
(9, 'La historia del loco', 1, '2017-06-29', 1),
(10, 'Cuentos de la selva', 1, '2017-06-29', 1),
(11, 'Cuentos de la selva', 1, '2017-06-29', 1),
(12, 'Usar el cerebro', 1, '2017-06-29', 1),
(13, 'La historia del loco', 1, '2017-06-29', 1),
(14, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(15, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(16, 'Cuentos de la selva', 1, '2017-06-29', 1),
(17, 'La historia del loco', 1, '2017-06-29', 1),
(18, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(19, 'Cuentos de la selva', 1, '2017-06-29', 1),
(20, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(21, 'Cuentos de la selva', 1, '2017-06-29', 1),
(22, 'La historia del loco', 1, '2017-06-29', 1),
(23, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(24, 'Cuentos de la selva', 1, '2017-06-29', 1),
(25, 'Cuentos de la selva', 1, '2017-06-29', 1),
(26, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(27, 'Cuentos de la selva', 1, '2017-06-29', 1),
(28, 'Cuentos de la selva', 1, '2017-06-29', 1),
(29, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(30, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(31, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(32, 'Cuentos de la selva', 1, '2017-06-29', 1),
(33, 'Cuentos de la selva', 1, '2017-06-29', 1),
(34, 'Cuentos de la selva', 1, '2017-06-29', 1),
(35, 'Cuentos de la selva', 1, '2017-06-29', 1),
(36, 'Cuentos de la selva', 1, '2017-06-29', 1),
(37, 'Cuentos de la selva', 1, '2017-06-29', 1),
(38, 'La historia del loco', 1, '2017-06-29', 1),
(39, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(40, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(41, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(42, 'Cuentos de la selva', 1, '2017-06-29', 1),
(43, 'La historia del loco', 1, '2017-06-29', 1),
(44, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(45, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(46, 'Cuentos de la selva', 1, '2017-06-29', 1),
(47, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(48, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(49, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(50, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(51, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(52, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(53, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(54, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(55, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(56, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(57, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(58, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(59, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(60, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(61, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(62, 'Cuentos de la selva', 1, '2017-06-29', 1),
(63, 'La historia del loco', 1, '2017-06-29', 1),
(64, 'Usar el cerebro', 1, '2017-06-29', 1),
(65, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(66, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(67, 'Cuentos de la selva', 1, '2017-06-29', 1),
(68, 'Los pasajeros del Anna C.', 1, '2017-06-29', 1),
(69, 'La historia del loco', 1, '2017-06-29', 1),
(70, 'Rapido y furioso 7', 1, '2017-06-29', 1),
(71, 'Usar el cerebro', 1, '2017-10-04', 1),
(72, 'Los pasajeros del Anna C.', 6, '2017-12-04', 1),
(73, 'Guía del Basic', 6, '2017-12-04', 1),
(74, 'Los pasajeros del Anna C.', 6, '2017-12-04', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apllido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `num_documento` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `calle` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `numero` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `mail` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `localidad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contrasenia` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `baja` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`id_usuario`, `nombre`, `apllido`, `num_documento`, `calle`, `numero`, `mail`, `localidad`, `contrasenia`, `baja`) VALUES
(1, 'Mati', 'Ferrero', '31566730', 'España', '58', 'matiferrero073@gmail.com', 'BI', 'admin', 1),
(2, 'Nati', 'Morizon', '28042728', 'Ruta 70', '58', 'naty@gmail.com', 'Bella Italia', 'nati123', 1),
(3, 'Lizy', 'Ferrero', '12121212', 'La cucha', '123', 'lizy@gmail.com', 'Rafaela', '1234', 1),
(4, 'dddd', 'dddd', '33333', 'dddd', '4444', 'ddddd@ddd', 'dddd', 'dddddd', 1),
(5, 'Cabeza', 'De Termo', '124356', 'aca', '121', 'termo@gmail.com', 'rerer', '1234', 1),
(6, 'Lolo', 'Contrera', '12121234', 'España', '58', 'matiferrero@gmail.com', 'BI', 'lolo', 1),
(7, 'Blanquito', 'Martinez', '43234654', 'Atras', '56', 'blanquitoMartinez@yahoo.com.ar', 'BI', 'blanqui', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dvd`
--
ALTER TABLE `dvd`
  ADD PRIMARY KEY (`id_dvd`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `genero` (`genero`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dvd`
--
ALTER TABLE `dvd`
  MODIFY `id_dvd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`genero`) REFERENCES `genero` (`id_genero`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
