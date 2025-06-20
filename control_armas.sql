-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2025 a las 21:37:43
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
-- Base de datos: `control_armas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarIncautacionCompleta` (IN `p_fecha` DATE, IN `p_id_lugar` INT, IN `p_id_funcionario` INT, IN `p_id_ciudadano` INT, IN `p_numero_serie` VARCHAR(50), IN `p_origen` VARCHAR(100), IN `p_fabricante` VARCHAR(100), IN `p_id_tipo_arma` INT, IN `p_id_estado_arma` INT)   BEGIN
    DECLARE last_incautacion_id INT;
    DECLARE last_arma_id INT;

    START TRANSACTION;

    
    INSERT INTO Incautacion (fecha, id_lugar, id_funcionario, id_ciudadano)
    VALUES (p_fecha, p_id_lugar, p_id_funcionario, p_id_ciudadano);
    SET last_incautacion_id = LAST_INSERT_ID();

    
    INSERT INTO Arma (numero_serie, origen, fabricante, id_tipo_arma, id_estado_arma)
    VALUES (p_numero_serie, p_origen, p_fabricante, p_id_tipo_arma, p_id_estado_arma);
    SET last_arma_id = LAST_INSERT_ID();

    
    INSERT INTO Arma_Incautada (id_arma, id_incautacion)
    VALUES (last_arma_id, last_incautacion_id);

    COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arma`
--

CREATE TABLE `arma` (
  `id_arma` int(11) NOT NULL,
  `numero_serie` varchar(50) NOT NULL,
  `origen` varchar(100) NOT NULL,
  `fabricante` varchar(100) DEFAULT NULL,
  `id_tipo_arma` int(11) DEFAULT NULL,
  `id_estado_arma` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `arma`
--

INSERT INTO `arma` (`id_arma`, `numero_serie`, `origen`, `fabricante`, `id_tipo_arma`, `id_estado_arma`) VALUES
(1, 'ACE123', 'Sucre - Sucre', 'Indumil', 1, 1),
(2, 'ACE234', 'Sucre - Sucre', 'Indumil', 2, 2),
(3, 'ACE874', 'Sucre - Sucre', 'Indumil', 2, 2),
(4, 'ACE547', 'Medellin', 'Indumil', 3, 3),
(5, 'ACE547', 'Medellin', 'Indumil', 3, 3),
(6, 'ACE547', 'Medellin', 'Indumil', 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arma_incautada`
--

CREATE TABLE `arma_incautada` (
  `id_arma_incautada` int(11) NOT NULL,
  `id_arma` int(11) DEFAULT NULL,
  `id_incautacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `arma_incautada`
--

INSERT INTO `arma_incautada` (`id_arma_incautada`, `id_arma`, `id_incautacion`) VALUES
(1, 2, 6),
(2, 3, 7),
(3, 4, 8),
(4, 5, 9),
(5, 6, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_judicial`
--

CREATE TABLE `caso_judicial` (
  `id_caso` int(11) NOT NULL,
  `id_arma` int(11) DEFAULT NULL,
  `expediente` varchar(100) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE `ciudadano` (
  `id_ciudadano` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `documento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudadano`
--

INSERT INTO `ciudadano` (`id_ciudadano`, `nombre`, `tipo`, `documento`) VALUES
(1, 'Carlos Pérez', 'Voluntario', '12345678'),
(2, 'Ana Torres', 'Obligatorio', '23456789'),
(3, 'Luis Martínez', 'Voluntario', '34567890'),
(4, 'María López', 'Obligatorio', '45678901'),
(5, 'Jorge Ramírez', 'Voluntario', '56789012'),
(6, 'Natalia Ruiz', 'Obligatorio', '67890123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deposito`
--

CREATE TABLE `deposito` (
  `id_deposito` int(11) NOT NULL,
  `id_lugar` int(11) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disposicion_final`
--

CREATE TABLE `disposicion_final` (
  `id_disposicion` int(11) NOT NULL,
  `id_arma` int(11) DEFAULT NULL,
  `metodo` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `certificado` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_arma`
--

CREATE TABLE `estado_arma` (
  `id_estado_arma` int(11) NOT NULL,
  `condicion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_arma`
--

INSERT INTO `estado_arma` (`id_estado_arma`, `condicion`) VALUES
(1, 'Operativa'),
(2, 'Defectuosa'),
(3, 'Dañada'),
(4, 'Desarmada'),
(5, 'En reparación'),
(6, 'Inservible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `agencia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `nombre`, `cargo`, `agencia`) VALUES
(1, 'Laura Gómez', 'Inspector', 'ONU'),
(2, 'Pedro Jiménez', 'Analista', 'Gobierno Local'),
(3, 'Marta Cifuentes', 'Supervisor', 'Policía'),
(4, 'David Rojas', 'Auditor', 'ONU'),
(5, 'Sofía Vega', 'Técnico Forense', 'Gobierno Local'),
(6, 'Carlos Méndez', 'Investigador', 'Fuerzas Armadas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incautacion`
--

CREATE TABLE `incautacion` (
  `id_incautacion` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_lugar` int(11) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_ciudadano` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `incautacion`
--

INSERT INTO `incautacion` (`id_incautacion`, `fecha`, `id_lugar`, `id_funcionario`, `id_ciudadano`) VALUES
(6, '2025-06-20', 2, 2, 2),
(7, '2025-06-19', 1, 1, 1),
(8, '2025-06-18', 3, 1, 1),
(9, '2025-06-18', 3, 1, 1),
(10, '2025-06-18', 3, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar`
--

CREATE TABLE `lugar` (
  `id_lugar` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `coordenadas_gps` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lugar`
--

INSERT INTO `lugar` (`id_lugar`, `nombre`, `tipo`, `coordenadas_gps`) VALUES
(1, 'Incautación Bogotá', 'Incautación', '4.6100,-74.0700'),
(2, 'Incautación Bogotá', 'Incautación', '4.6100,-74.0700'),
(3, 'Depósito Argelina', 'Depósito', '4.7000,-74.1000'),
(4, 'Incautación Medellín', 'Depósito', '4.3333,-54.123'),
(5, 'Depósito Villavicencio', 'Incautacion', '5.8000,-32.2000'),
(6, 'Incautación Cali', 'Depósito', '4.3856,-74.333'),
(7, 'Incautación Armenia', 'Depósito', '9.633,-12.653');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_arma`
--

CREATE TABLE `tipo_arma` (
  `id_tipo_arma` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_arma`
--

INSERT INTO `tipo_arma` (`id_tipo_arma`, `nombre`) VALUES
(1, 'Ligera'),
(2, 'Convencional'),
(3, 'Mina Antipersonal'),
(4, 'Química'),
(5, 'Nuclear'),
(6, 'Improvisada');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arma`
--
ALTER TABLE `arma`
  ADD PRIMARY KEY (`id_arma`);

--
-- Indices de la tabla `arma_incautada`
--
ALTER TABLE `arma_incautada`
  ADD PRIMARY KEY (`id_arma_incautada`),
  ADD KEY `id_arma` (`id_arma`),
  ADD KEY `id_incautacion` (`id_incautacion`);

--
-- Indices de la tabla `caso_judicial`
--
ALTER TABLE `caso_judicial`
  ADD PRIMARY KEY (`id_caso`),
  ADD KEY `id_arma` (`id_arma`);

--
-- Indices de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD PRIMARY KEY (`id_ciudadano`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- Indices de la tabla `deposito`
--
ALTER TABLE `deposito`
  ADD PRIMARY KEY (`id_deposito`),
  ADD KEY `id_lugar` (`id_lugar`);

--
-- Indices de la tabla `disposicion_final`
--
ALTER TABLE `disposicion_final`
  ADD PRIMARY KEY (`id_disposicion`),
  ADD KEY `id_arma` (`id_arma`);

--
-- Indices de la tabla `estado_arma`
--
ALTER TABLE `estado_arma`
  ADD PRIMARY KEY (`id_estado_arma`);

--
-- Indices de la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Indices de la tabla `incautacion`
--
ALTER TABLE `incautacion`
  ADD PRIMARY KEY (`id_incautacion`),
  ADD KEY `id_lugar` (`id_lugar`),
  ADD KEY `id_funcionario` (`id_funcionario`),
  ADD KEY `id_ciudadano` (`id_ciudadano`);

--
-- Indices de la tabla `lugar`
--
ALTER TABLE `lugar`
  ADD PRIMARY KEY (`id_lugar`);

--
-- Indices de la tabla `tipo_arma`
--
ALTER TABLE `tipo_arma`
  ADD PRIMARY KEY (`id_tipo_arma`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `arma`
--
ALTER TABLE `arma`
  MODIFY `id_arma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `arma_incautada`
--
ALTER TABLE `arma_incautada`
  MODIFY `id_arma_incautada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `caso_judicial`
--
ALTER TABLE `caso_judicial`
  MODIFY `id_caso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  MODIFY `id_ciudadano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `deposito`
--
ALTER TABLE `deposito`
  MODIFY `id_deposito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `disposicion_final`
--
ALTER TABLE `disposicion_final`
  MODIFY `id_disposicion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_arma`
--
ALTER TABLE `estado_arma`
  MODIFY `id_estado_arma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `incautacion`
--
ALTER TABLE `incautacion`
  MODIFY `id_incautacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `lugar`
--
ALTER TABLE `lugar`
  MODIFY `id_lugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipo_arma`
--
ALTER TABLE `tipo_arma`
  MODIFY `id_tipo_arma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arma_incautada`
--
ALTER TABLE `arma_incautada`
  ADD CONSTRAINT `arma_incautada_ibfk_1` FOREIGN KEY (`id_arma`) REFERENCES `arma` (`id_arma`),
  ADD CONSTRAINT `arma_incautada_ibfk_2` FOREIGN KEY (`id_incautacion`) REFERENCES `incautacion` (`id_incautacion`);

--
-- Filtros para la tabla `caso_judicial`
--
ALTER TABLE `caso_judicial`
  ADD CONSTRAINT `caso_judicial_ibfk_1` FOREIGN KEY (`id_arma`) REFERENCES `arma` (`id_arma`);

--
-- Filtros para la tabla `deposito`
--
ALTER TABLE `deposito`
  ADD CONSTRAINT `deposito_ibfk_1` FOREIGN KEY (`id_lugar`) REFERENCES `lugar` (`id_lugar`);

--
-- Filtros para la tabla `disposicion_final`
--
ALTER TABLE `disposicion_final`
  ADD CONSTRAINT `disposicion_final_ibfk_1` FOREIGN KEY (`id_arma`) REFERENCES `arma` (`id_arma`);

--
-- Filtros para la tabla `incautacion`
--
ALTER TABLE `incautacion`
  ADD CONSTRAINT `incautacion_ibfk_1` FOREIGN KEY (`id_lugar`) REFERENCES `lugar` (`id_lugar`),
  ADD CONSTRAINT `incautacion_ibfk_2` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  ADD CONSTRAINT `incautacion_ibfk_3` FOREIGN KEY (`id_ciudadano`) REFERENCES `ciudadano` (`id_ciudadano`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
