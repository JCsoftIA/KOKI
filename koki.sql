-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-12-2018 a las 05:36:37
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `koki`
--
CREATE DATABASE IF NOT EXISTS `koki` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `koki`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `condicion`, `created_at`, `updated_at`) VALUES
(1, 'LACTEOS', 'TODO TIPO DE LACTEOS', 1, '2018-12-16 07:50:58', '2018-12-16 07:50:58'),
(2, 'CUADERNOS', 'TODO TIPO DE CUADERNOS', 1, '2018-12-16 07:51:18', '2018-12-16 07:51:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingresos`
--

DROP TABLE IF EXISTS `detalle_ingresos`;
CREATE TABLE `detalle_ingresos` (
  `id` int(10) UNSIGNED NOT NULL,
  `idingreso` int(10) UNSIGNED NOT NULL,
  `idproducto` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_ingresos`
--

INSERT INTO `detalle_ingresos` (`id`, `idingreso`, `idproducto`, `cantidad`, `precio`) VALUES
(11, 10, 2, 112, '2.00'),
(12, 10, 1, 132, '3.00');

--
-- Disparadores `detalle_ingresos`
--
DROP TRIGGER IF EXISTS `tr_updStockIngreso`;
DELIMITER $$
CREATE TRIGGER `tr_updStockIngreso` AFTER INSERT ON `detalle_ingresos` FOR EACH ROW BEGIN
 UPDATE productos SET stock = stock + NEW.cantidad 
 WHERE productos.id = NEW.idproducto;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
CREATE TABLE `detalle_ventas` (
  `id` int(10) UNSIGNED NOT NULL,
  `idventa` int(10) UNSIGNED NOT NULL,
  `idproducto` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `idventa`, `idproducto`, `cantidad`, `precio`, `descuento`) VALUES
(1, 1, 2, 22, '4.00', '0.00'),
(2, 1, 1, 2, '3.40', '0.00'),
(3, 2, 1, 1, '3.40', '0.00');

--
-- Disparadores `detalle_ventas`
--
DROP TRIGGER IF EXISTS `tr_updStockVenta`;
DELIMITER $$
CREATE TRIGGER `tr_updStockVenta` AFTER INSERT ON `detalle_ventas` FOR EACH ROW BEGIN
 UPDATE productos SET stock = stock - NEW.cantidad 
 WHERE productos.id = NEW.idproducto;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
CREATE TABLE `ingresos` (
  `id` int(10) UNSIGNED NOT NULL,
  `idproveedor` int(10) UNSIGNED NOT NULL,
  `idusuario` int(10) UNSIGNED NOT NULL,
  `tipo_comprobante` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serie_comprobante` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_comprobante` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `idproveedor`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total`, `estado`, `created_at`, `updated_at`) VALUES
(10, 5, 1, 'BOLETA', '123', '123', '2018-12-15 00:00:00', '0.18', '620.00', 'Registrado', '2018-12-16 09:49:32', '2018-12-16 09:49:32');

--
-- Disparadores `ingresos`
--
DROP TRIGGER IF EXISTS `tr_updStockIngresoAnular`;
DELIMITER $$
CREATE TRIGGER `tr_updStockIngresoAnular` AFTER UPDATE ON `ingresos` FOR EACH ROW BEGIN
  UPDATE productos p
    JOIN detalle_ingresos di
      ON di.idproducto = p.id
     AND di.idingreso = new.id
     set p.stock = p.stock - di.cantidad;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(13, '2014_10_12_100000_create_password_resets_table', 1),
(14, '2018_12_12_024621_create_categorias_table', 1),
(15, '2018_12_12_162229_create_productos_table', 1),
(16, '2018_12_12_162435_create_personas_table', 1),
(17, '2018_12_12_164554_create_proveedores_table', 1),
(18, '2018_12_12_164651_create_roles_table', 1),
(19, '2018_12_12_164737_create_users_table', 1),
(20, '2018_12_12_164818_create_ingresos_table', 1),
(21, '2018_12_12_164856_create_detalle_ingresos_table', 1),
(22, '2018_12_12_164913_create_ventas_table', 1),
(23, '2018_12_12_164929_create_detalle_ventas_table', 1),
(24, '2018_12_12_164948_create_notifications_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0cd28486-6ff7-464d-9e0b-59528ee52c40', 'App\\Models\\Notifications\\NotifyAdmin', 'App\\Models\\User', 4, '{\"datos\":{\"ventas\":{\"numero\":2,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-12-16 10:06:30', '2018-12-16 10:06:30'),
('1f9b315c-91cb-4e9e-9d98-e3c7705a2d12', 'App\\Models\\Notifications\\NotifyAdmin', 'App\\Models\\User', 4, '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-12-16 09:50:57', '2018-12-16 09:50:57'),
('231cb6dc-e181-4d5d-b31e-943fbfe14a61', 'App\\Models\\Notifications\\NotifyAdmin', 'App\\Models\\User', 4, '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-12-16 09:49:33', '2018-12-16 09:49:33'),
('5a4cf815-92c2-4c95-ba76-1c261d3143eb', 'App\\Models\\Notifications\\NotifyAdmin', 'App\\Models\\User', 3, '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-12-16 09:50:57', '2018-12-16 09:50:57'),
('9a937900-31cb-45c2-99d4-2949666718e1', 'App\\Models\\Notifications\\NotifyAdmin', 'App\\Models\\User', 3, '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-12-16 09:49:33', '2018-12-16 09:49:33'),
('acaf2958-c1ba-477f-9b46-79599489bf1a', 'App\\Models\\Notifications\\NotifyAdmin', 'App\\Models\\User', 2, '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-12-16 09:50:57', '2018-12-16 09:50:57'),
('c42b6782-6f69-4cdb-834b-9c11060ca545', 'App\\Models\\Notifications\\NotifyAdmin', 'App\\Models\\User', 1, '{\"datos\":{\"ventas\":{\"numero\":2,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-12-16 10:06:30', '2018-12-16 10:06:30'),
('d988dd99-ef25-4e7a-9b7a-0876a4ebe559', 'App\\Models\\Notifications\\NotifyAdmin', 'App\\Models\\User', 2, '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-12-16 09:49:33', '2018-12-16 09:49:33'),
('e74e9815-abf5-4c47-9349-a22610e89aee', 'App\\Models\\Notifications\\NotifyAdmin', 'App\\Models\\User', 1, '{\"datos\":{\"ventas\":{\"numero\":0,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-12-16 09:49:33', '2018-12-16 09:49:33'),
('ef559cae-b58b-414d-9e0f-4d4536fc1eab', 'App\\Models\\Notifications\\NotifyAdmin', 'App\\Models\\User', 3, '{\"datos\":{\"ventas\":{\"numero\":2,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-12-16 10:06:30', '2018-12-16 10:06:30'),
('f8678f94-a2a6-4fa7-b6c1-251857e1286f', 'App\\Models\\Notifications\\NotifyAdmin', 'App\\Models\\User', 1, '{\"datos\":{\"ventas\":{\"numero\":1,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-12-16 09:50:57', '2018-12-16 09:50:57'),
('fc4c4700-5e46-4991-845e-b88da680db10', 'App\\Models\\Notifications\\NotifyAdmin', 'App\\Models\\User', 2, '{\"datos\":{\"ventas\":{\"numero\":2,\"msj\":\"Ventas\"},\"ingresos\":{\"numero\":1,\"msj\":\"Ingresos\"}}}', NULL, '2018-12-16 10:06:30', '2018-12-16 10:06:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

DROP TABLE IF EXISTS `personas`;
CREATE TABLE `personas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `created_at`, `updated_at`) VALUES
(1, 'ruth', 'DNI', '12345678', 'jr no se que', '8931978', 'ruth@web.com', NULL, NULL),
(2, 'eliana', 'DNI', '12345678', 'jr no se que', '8931978', 'ruth@web.com', NULL, NULL),
(3, 'jean', 'DNI', '12345678', 'jr no se que', '8931978', 'ruth@web.com', NULL, NULL),
(4, 'mario', 'DNI', '12345678', 'jr no se que', '8931978', 'ruth@web.com', NULL, NULL),
(5, 'DISTRIBUIDORA HYO SAC', 'RUC', '10718876637', 'JR LOS ARANDANOS NRO 123', '983627436', 'DISHYO@GMAIL.COM', '2018-12-16 07:50:16', '2018-12-16 07:50:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `idcategoria` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `idcategoria`, `codigo`, `nombre`, `precio_venta`, `stock`, `descripcion`, `condicion`, `created_at`, `updated_at`) VALUES
(1, 1, 'LECHE', 'LECHE GLORIA 500ML', '3.40', 231, 'LA LECHE GLORIA DE ALTO IMPACTO', 1, '2018-12-16 07:52:06', '2018-12-16 07:52:06'),
(2, 2, 'LORO', 'CUADERNOS LORO A4', '3.30', 1112, 'UTILES ESCOLARES', 1, '2018-12-16 07:53:01', '2018-12-16 07:53:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `id` int(10) UNSIGNED NOT NULL,
  `contacto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono_contacto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `contacto`, `telefono_contacto`) VALUES
(5, 'JUAN CARLOS', '938284728');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `condicion`) VALUES
(1, 'Administrador', 'Administradores de área', 1),
(2, 'Vendedor', 'Vendedor área venta', 1),
(3, 'Almacenero', 'Almacenero área compras', 1),
(4, 'Cajero', 'Cajero de  compras', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `idrol` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `password`, `condicion`, `idrol`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'eliana', '$2y$10$I2weAKXc/AleHlCmb9c5MuidRTEosJu7dppY4FwDyq7jol0vrmN0e', 1, 2, 'drs', NULL, NULL),
(3, 'jean', '$2y$10$QIRz49wkFV9SWQvoqShzUuTO.x50QJNKPcRMlV3WQMDrz0j8x88my', 1, 3, 'drs', NULL, NULL),
(4, 'mario', '$2y$10$U1NZfO7NMTDjeAMgK3JDg.IeDMuXwrEJU9yz5LGB4wjLp6Z88mYiO', 1, 4, 'drs', NULL, NULL),
(1, 'ruth', '$2y$10$SpKQa9GQGSw1Sp4GIdleperzNJbPMP3ZIWpg9dY.ZgvpjJ.G/3c0S', 1, 1, 'wjgVGy0Ec4LolutvZulUc5kbj2oWDQyHglIoUuNDsGqqKJn1l0vEfK8XO3Yy', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `id` int(10) UNSIGNED NOT NULL,
  `idcliente` int(10) UNSIGNED NOT NULL,
  `idusuario` int(10) UNSIGNED NOT NULL,
  `tipo_comprobante` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serie_comprobante` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_comprobante` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total`, `estado`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 'BOLETA', '123', '123', '2018-12-15 00:00:00', '0.18', '94.80', 'Anulado', '2018-12-16 09:50:57', '2018-12-16 10:05:47'),
(2, 5, 1, 'BOLETA', '234', '234', '2018-12-15 00:00:00', '0.18', '3.40', 'Registrado', '2018-12-16 10:06:30', '2018-12-16 10:06:30');

--
-- Disparadores `ventas`
--
DROP TRIGGER IF EXISTS `tr_updStockVentaAnular`;
DELIMITER $$
CREATE TRIGGER `tr_updStockVentaAnular` AFTER UPDATE ON `ventas` FOR EACH ROW BEGIN
  UPDATE productos p
    JOIN detalle_ventas di
      ON di.idproducto = p.id
     AND di.idventa= new.id
     set p.stock = p.stock + di.cantidad;
end
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_ingresos`
--
ALTER TABLE `detalle_ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ingresos_idingreso_foreign` (`idingreso`),
  ADD KEY `detalle_ingresos_idproducto_foreign` (`idproducto`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ventas_idventa_foreign` (`idventa`),
  ADD KEY `detalle_ventas_idproducto_foreign` (`idproducto`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingresos_idproveedor_foreign` (`idproveedor`),
  ADD KEY `ingresos_idusuario_foreign` (`idusuario`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personas_nombre_unique` (`nombre`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productos_nombre_unique` (`nombre`),
  ADD KEY `productos_idcategoria_foreign` (`idcategoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD KEY `proveedores_id_foreign` (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_nombre_unique` (`nombre`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`),
  ADD KEY `users_id_foreign` (`id`),
  ADD KEY `users_idrol_foreign` (`idrol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_idcliente_foreign` (`idcliente`),
  ADD KEY `ventas_idusuario_foreign` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_ingresos`
--
ALTER TABLE `detalle_ingresos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_ingresos`
--
ALTER TABLE `detalle_ingresos`
  ADD CONSTRAINT `detalle_ingresos_idingreso_foreign` FOREIGN KEY (`idingreso`) REFERENCES `ingresos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_ingresos_idproducto_foreign` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_idproducto_foreign` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `detalle_ventas_idventa_foreign` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_idproveedor_foreign` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`id`),
  ADD CONSTRAINT `ingresos_idusuario_foreign` FOREIGN KEY (`idusuario`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_idcategoria_foreign` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_id_foreign` FOREIGN KEY (`id`) REFERENCES `personas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_foreign` FOREIGN KEY (`id`) REFERENCES `personas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_idrol_foreign` FOREIGN KEY (`idrol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_idcliente_foreign` FOREIGN KEY (`idcliente`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `ventas_idusuario_foreign` FOREIGN KEY (`idusuario`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
