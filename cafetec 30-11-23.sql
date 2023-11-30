-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2023 a las 00:11:03
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

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
(40, 'Fruta', 3, 15, 1, 15, 'l19141198@queretaro.tecnm.mx'),
(41, 'Chilaquiles', 3, 35, 1, 35, 'l19141198@queretaro.tecnm.mx');

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
(2, 'Baguette', 45, 'Baguette de jamón caliente', '5 min', '2', '../../../assets/img/comidas/baguete.jpg'),
(3, 'Agua fresca', 15, 'Rica agua fresca. Horchata, jamaica o tamarindo.', 'Inmediato', '1', '../../../assets/img/comidas/aguaFresca.jpg'),
(4, 'Chilaquiles', 35, 'Ricos chilaquiles con salsa roja o verde, puede ir con pollo o huevo', '15 min', '3', '../../../assets/img/comidas/chilaquiles.jpg'),
(5, 'Croissant jamón', 20, 'Delicioso croissant con relleno de jamón, queso y lechuga. Caliente a la plancha', '10 min', '2', '../../../assets/img/comidas/croissantJamon.jpg'),
(6, 'Croissant peperonies', 20, 'Delicios croissant relleno de peperonie, queso y lechuga. Caliente a la plancha', '10 min', '2', '../../../assets/img/comidas/croissantPeperonies.jpg'),
(7, 'Fruta', 15, 'Delicioso y fresco vaso de fruta, para un desalluno saludable o una comida fresca', '10 min', '3', '../../../assets/img/comidas/fruta.jpg'),
(8, 'Gelatina', 15, 'Un postre ligero y delicioso, un vaso de gelatina puede ser de piña, fresa o limón', 'inmediato', '1', '../../../assets/img/comidas/gelatina.jpg'),
(9, 'Guajolote', 35, 'Deliciosa comida tradicional queretana; guajolote de jamón, lechuga, crema, papas y zanahorias', '20 min', '1', '../../../assets/img/comidas/guajolote.jpeg'),
(10, 'Maruchan', 15, 'Diversos sabores en sopa maruchan, disfruta de una deliciosa sopa caliente', 'Inmediato', '2', '../../../assets/img/comidas/maruchan.jpg'),
(11, 'Nachos', 25, 'Crujientes y sabrosos nachos', '10 min', '3', '../../../assets/img/comidas/nachos.jpg'),
(12, 'Panque', 20, 'Panque de chocolate o frutos rojos, ideal como proste o un pequeño desayuno', 'Inmediato', '1', '../../../assets/img/comidas/panque.jpg'),
(13, 'Papas a la francesa', 30, 'Tradicionales papas a la francesa, condimentadas con sal y pimienta', '20 min', '1', '../../../assets/img/comidas/papas.jpg'),
(14, 'Rebanada de pastel', 25, 'Deliciosa rebanada de pastel, ideal como postre o pequeño desayuno', 'Inmediato', '2', '../../../assets/img/comidas/pastel.jpg'),
(15, 'Rebanada de pizza', 15, 'Caliente y crujiente rebanada de pizza, puede ser de peperonie, hawaiana o salchichas', 'Inmediato', '3', '../../../assets/img/comidas/pizza.jpg'),
(16, 'Sushi', 60, 'Rollo de sushi, ideal como comida ligera y fresca.', 'Inmediato', '2', '../../../assets/img/comidas/sushi.jpg'),
(17, 'Torta', 25, 'Torta de milanesa, rellena de lechuga, jitomate y cebolla con una crujiente y sabrosa milanesa', '15 min', '1', '../../../assets/img/comidas/torta.jpg');

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
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
