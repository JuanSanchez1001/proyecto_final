-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2023 a las 03:19:08
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cafetec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `nombre_producto` varchar(25) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `cantidad` int(10) DEFAULT NULL,
  `total` int(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `nombre_producto`, `local`, `precio`, `cantidad`, `total`, `email`) VALUES
(1, 'sandwich', 1, 20, 0, NULL, ''),
(18, 'baguette', 1, 50, 0, NULL, ''),
(28, 'Sandwich', 1, 20, 0, NULL, NULL),
(32, 'Sandwich', 1, 20, 1, NULL, NULL),
(34, 'Sandwich', 1, 20, 1, NULL, 'l19141198@queretaro.tecnm.mx'),
(35, 'Sandwich', 1, 20, 3, 60, 'l19141198@queretaro.tecnm.mx'),
(36, 'Baguette', 2, 45, 2, 90, 'l19141198@queretaro.tecnm.mx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(25) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `tiempo` varchar(15) DEFAULT NULL,
  `local` varchar(5) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `precio`, `descripcion`, `tiempo`, `local`, `img_url`) VALUES
(1, 'Sandwich', 20, 'Delicioso sandwich de jamon', '5 min', '1', '../../../assets/img/comidas/sandwich.jpg'),
(2, 'Baguette', 45, 'Baguette de jamón caliente', '5 min', '2', '../../../assets/img/comidas/baguete.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `no_control` varchar(12) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`no_control`, `password`, `email`, `rol`) VALUES
('19141198', '123', 'l19141198@queretaro.tecnm.mx', 'user'),
('local1', '123', 'admin@queretaro.tecnm.mx', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`no_control`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
