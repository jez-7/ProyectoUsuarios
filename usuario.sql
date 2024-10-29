-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2024 a las 15:55:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_usuarios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `apellido`, `email`, `nombre`, `password`, `telefono`) VALUES
(1, 'zamora', 'emanuel@gmail.com', 'emanuel', 'emanuel123', '2613348759'),
(2, 'Perez', 'pedro@gmail.com', 'Pedro', '$argon2id$v=19$m=1024,t=1,p=1$+yK1QHs4+OoA7AgUnsL9uA$tgqIFt8YmKbnqZDDPn2miXNI3Ih+SH7EuZcvKmRM3DY', '2613398473'),
(3, 'Perez', 'maria@gmail.com', 'Maria', '$argon2id$v=19$m=1024,t=1,p=1$FHlrCbelF4TVluK5uysH7w$3OlP8o6F5bV3yrJft/ytM0uA7A14ESflk2wtuwRSEqM', '2618893746'),
(4, 'Sanchez', 'juan@gmail.com', 'Juan', '$argon2id$v=19$m=1024,t=1,p=1$5G5LelEPJZjLRpQ6iVUbcw$K3r/O7FmRX/a4V98Tf+sANklBUMH86+wCQksILfyV0E', '2619987635'),
(5, 'Ramirez', 'joaco@gmail.com', 'Joaquin', '$argon2id$v=19$m=1024,t=1,p=1$r1oEO4p7SiE703AjyDWJsQ$RbxLTuwSbMViZZdqR3vqb0owC3ccepbkdYCunFjB01A', '2619834839');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
