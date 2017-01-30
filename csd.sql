-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-01-2017 a las 14:19:57
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `csd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id` bigint(20) NOT NULL,
  `estadio` varchar(255) CHARACTER SET latin1 NOT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 NOT NULL,
  `presupuesto` int(11) NOT NULL,
  `fede` bigint(20) NOT NULL,
  `imagen` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `estadio`, `nombre`, `presupuesto`, `fede`, `imagen`) VALUES
(2, '123', 'Solomon', 123, 1, 'http://st-listas.20minutos.es/images/2013-09/369406/4179285_249px.jpg'),
(3, 'Nobis voluptate laboris ullamco qui officia nesciunt consequuntur voluptas nihil', 'Yetta', 61, 2, ''),
(4, 'asdasd', 'asdasd', 12312312, 2, 'http://st-listas.20minutos.es/images/2013-09/369406/4179250_249px.jpg'),
(5, 'asdasd', 'asdasd', 12312312, 1, 'http://st-listas.20minutos.es/images/2013-09/369406/4179250_249px.jpg'),
(6, 'asdasdasdq', 'asdasdasdqwe', 123123, 2, 'http://www.google.es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_jugador`
--

CREATE TABLE `equipo_jugador` (
  `Equipo_id` bigint(20) NOT NULL,
  `jugador_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `federacion`
--

CREATE TABLE `federacion` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 NOT NULL,
  `pais` varchar(255) CHARACTER SET latin1 NOT NULL,
  `imagen` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `federacion`
--

INSERT INTO `federacion` (`id`, `nombre`, `pais`, `imagen`) VALUES
(1, 'Portia', 'EspaÃ?Â±a', 'http://st-listas.20minutos.es/images/2013-09/369406/4179337_640px.jpg'),
(2, 'Solomon', 'Eum cupidatat harum sed voluptas corporis', 'http://st-listas.20minutos.es/images/2013-09/369406/4179285_249px.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `federacion_equipo`
--

CREATE TABLE `federacion_equipo` (
  `Federacion_id` bigint(20) NOT NULL,
  `equipo_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id` bigint(20) NOT NULL,
  `edad` int(11) NOT NULL,
  `goles` int(11) NOT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 NOT NULL,
  `equi` bigint(20) NOT NULL,
  `imagen` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id`, `edad`, `goles`, `nombre`, `equi`, `imagen`) VALUES
(5, 86, 55, 'Irma', 3, 'http://uscdn02.mundotkm.com/2015/08/cara-31.jpg'),
(8, 86, 55, 'Irma', 3, ''),
(9, 86, 55, 'Irma', 3, ''),
(11, 55, 34, 'Tate', 2, 'http://img.desmotivaciones.es/201304/bailar_2.jpg'),
(12, 18, 95, 'Martha', 3, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_5vym6qwnasg2ff5dbxcg8vod9` (`fede`);

--
-- Indices de la tabla `equipo_jugador`
--
ALTER TABLE `equipo_jugador`
  ADD PRIMARY KEY (`Equipo_id`,`jugador_id`),
  ADD UNIQUE KEY `UK_4poung2uyhljqsoflj8qodyi6` (`jugador_id`);

--
-- Indices de la tabla `federacion`
--
ALTER TABLE `federacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `federacion_equipo`
--
ALTER TABLE `federacion_equipo`
  ADD PRIMARY KEY (`Federacion_id`,`equipo_id`),
  ADD UNIQUE KEY `UK_2l137ilf64sonerigiqbbxn75` (`equipo_id`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gq6txbcbvgr8exbyyh9jneu5c` (`equi`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `federacion`
--
ALTER TABLE `federacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `FK_5vym6qwnasg2ff5dbxcg8vod9` FOREIGN KEY (`fede`) REFERENCES `federacion` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `equipo_jugador`
--
ALTER TABLE `equipo_jugador`
  ADD CONSTRAINT `FK_4poung2uyhljqsoflj8qodyi6` FOREIGN KEY (`jugador_id`) REFERENCES `jugador` (`id`),
  ADD CONSTRAINT `FK_asrvbh3dqn5dgc60is8rs2r3o` FOREIGN KEY (`Equipo_id`) REFERENCES `equipo` (`id`);

--
-- Filtros para la tabla `federacion_equipo`
--
ALTER TABLE `federacion_equipo`
  ADD CONSTRAINT `FK_2l137ilf64sonerigiqbbxn75` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `FK_pcblterqnp09ufmj31xxbxcfa` FOREIGN KEY (`Federacion_id`) REFERENCES `federacion` (`id`);

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `FK_gq6txbcbvgr8exbyyh9jneu5c` FOREIGN KEY (`equi`) REFERENCES `equipo` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
