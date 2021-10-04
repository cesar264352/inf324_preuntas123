-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-10-2021 a las 09:52:35
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_cesar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id_carrera` int(11) NOT NULL,
  `carrera` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id_carrera`, `carrera`) VALUES
(1, 'INFORMATICA'),
(2, 'ESTADISTICA'),
(3, 'FISICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `cod_ine` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `abreviatura` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `departamento` varchar(15) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`cod_ine`, `abreviatura`, `departamento`) VALUES
('01', 'CH', 'CHUQUISACA'),
('02', 'LP', 'LA PAZ'),
('03', 'CB', 'COCHABAMBA'),
('04', 'OR', 'ORURO'),
('05', 'PT', 'POTOSI'),
('06', 'TJ', 'TARIJA'),
('07', 'SC', 'SANTA CRUZ'),
('08', 'BE', 'BENI'),
('09', 'PD', 'PANDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `id_docente` int(11) NOT NULL,
  `docente_fk` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `materia_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`id_docente`, `docente_fk`, `materia_fk`) VALUES
(1, '8291463', 1),
(2, '9291463', 7),
(3, '8291463', 2),
(4, '8291463', 3),
(5, '9291463', 8),
(6, '9291463', 9),
(7, '7172915', 8),
(8, '7172915', 4),
(9, '7172915', 5),
(10, '7172915', 6),
(11, '7177351', 2),
(12, '7177351', 8),
(13, '7177351', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id_materia` int(11) NOT NULL,
  `sigla` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `carrera_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id_materia`, `sigla`, `carrera_fk`) VALUES
(1, 'INF111', 1),
(2, 'INF112', 1),
(3, 'INF113', 1),
(4, 'EST111', 2),
(5, 'EST112', 2),
(6, 'EST113', 2),
(7, 'FIS101', 3),
(8, 'FIS102', 3),
(9, 'FIS103', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL,
  `id_persona` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `materia_fk` int(11) DEFAULT NULL,
  `nota1` float DEFAULT NULL,
  `nota2` float DEFAULT NULL,
  `nota3` float DEFAULT NULL,
  `notaFinal` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`id_nota`, `id_persona`, `materia_fk`, `nota1`, `nota2`, `nota3`, `notaFinal`) VALUES
(1, '7791463', 1, 78, 87, 90, 46),
(2, '7791463', 3, 65, 87, 87, 91),
(3, '4296574', 4, 66, 67, 78, 87),
(4, '7683920', 8, 34, 45, 56, 78),
(5, '7791463', 2, 66, 76, 78, 89),
(6, '1550748', 3, 67, 90, 89, 92),
(7, '1550748', 1, 56, 78, 67, 66),
(8, '1550748', 2, 55, 45, 43, 48),
(9, '4296574', 5, 43, 44, 56, 48),
(10, '4296574', 6, 56, 67, 67, 71),
(11, '7683920', 7, 45, 56, 54, 52),
(12, '7683920', 9, 67, 56, 54, 68),
(13, '7189379', 2, 56, 87, 86, 82),
(14, '7189379', 3, 56, 89, 83, 81),
(15, '7166630', 1, 67, 87, 81, 82),
(16, '7166630', 2, 45, 36, 48, 47),
(17, '7166630', 3, 89, 67, 56, 82),
(18, '7168216', 1, 45, 67, 89, 78),
(19, '7168216', 3, 34, 56, 51, 53),
(20, '7168135', 4, 89, 83, 85, 88),
(21, '7168135', 5, 73, 62, 86, 81),
(22, '7168135', 6, 43, 46, 49, 48),
(23, '7167200', 5, 98, 96, 91, 94),
(24, '7167200', 6, 71, 68, 53, 69),
(25, '7167345', 7, 78, 64, 56, 71),
(26, '7167345', 8, 56, 51, 51, 52),
(27, '7167345', 9, 64, 73, 54, 65);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `ci` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `paterno` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `materno` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `f_nacimiento` date DEFAULT NULL,
  `departamento_fk` varchar(2) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`ci`, `nombre`, `paterno`, `materno`, `f_nacimiento`, `departamento_fk`) VALUES
('1550748', 'Graciela', 'Blanco', 'Cué', '1991-08-05', '04'),
('4296574', 'CARMEN', 'ESCOBAR', 'TORRES', '1995-10-21', '06'),
('7166630', 'Daniel', 'Díaz', 'Ubieta', '1997-10-28', '05'),
('7167200', 'María', 'Álvarez', 'Tamargo', '1921-02-26', '02'),
('7167345', 'Paula', 'Campo', 'Rilo', '1988-10-08', '04'),
('7168135', 'Jaime', 'Cortés', 'García', '1890-10-10', '04'),
('7168216', 'Julio', 'Astray', 'Sánchez', '1981-03-14', '02'),
('7172915', 'María', 'Álvarez', 'Cuartas', '1991-08-20', '01'),
('7177351', 'Emilio Marcelino', 'Álvarez', 'Rodríguez', '1921-01-15', '02'),
('7189379', 'Moisés', 'Barrera', 'Cuervo', '1881-10-19', '03'),
('7683920', 'Alejandro', 'Peralta', 'Beltran', '1994-03-14', '05'),
('7791463', 'Pedro', 'Beltran', 'Ticona', '1995-10-15', '05'),
('8291463', 'Cesar Gustavo', 'Ibañez', 'Guarachi', '1989-03-22', '02'),
('9291463', 'Juan Carlos', 'Condori', 'Quispe', '1993-10-20', '01'),
('9449444', 'Benito', 'Álvarez', 'García ', '1992-10-06', '01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `rol`) VALUES
(1, 'DOCENTE'),
(2, 'UNIVERSITARIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `password` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `id_persona` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `rol_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `password`, `id_persona`, `rol_fk`) VALUES
(1, 'doc1', '12345', '8291463', 1),
(2, 'doc2', '12345', '9291463', 1),
(3, 'univ1', '12345', '7791463', 2),
(4, 'univ2', '12345', '4296574', 2),
(5, 'univ3', '12345', '7683920', 2),
(6, 'univ4', '12345', '1550748', 2),
(7, 'univ5', '12345', '7189379', 2),
(8, 'univ6', '12345', '7166630', 2),
(9, 'univ7', '12345', '7167200', 2),
(10, 'univ8', '12345', '7167345', 2),
(11, 'univ9', '12345', '7168135', 2),
(12, 'univ10', '12345', '7168216', 2),
(16, 'doc3', '12345', '7172915', 1),
(17, 'doc4', '12345', '7177351', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id_carrera`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`cod_ine`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id_docente`),
  ADD KEY `docente_fk` (`docente_fk`),
  ADD KEY `materia_fk` (`materia_fk`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id_materia`),
  ADD KEY `carrera_fk` (`carrera_fk`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `materia_fk` (`materia_fk`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`ci`),
  ADD KEY `departamento_fk` (`departamento_fk`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `rol_fk` (`rol_fk`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id_carrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id_docente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`docente_fk`) REFERENCES `persona` (`ci`),
  ADD CONSTRAINT `docente_ibfk_2` FOREIGN KEY (`materia_fk`) REFERENCES `materia` (`id_materia`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`carrera_fk`) REFERENCES `carrera` (`id_carrera`);

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`materia_fk`) REFERENCES `materia` (`id_materia`),
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`ci`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`departamento_fk`) REFERENCES `departamento` (`cod_ine`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`ci`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`rol_fk`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
