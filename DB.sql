-- Eliminar la base de datos 'mvc' si ya existe
DROP DATABASE IF EXISTS `mvc`;

-- Crear la base de datos 'mvc'
CREATE DATABASE `mvc`;

-- Seleccionar la base de datos 'mvc' para usarla
USE `mvc`;

-- Crear la tabla 'users'
CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(100) NOT NULL UNIQUE,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `role` ENUM('user', 'admin') DEFAULT 'user',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Crear la tabla 'images'
CREATE TABLE `images` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT NOT NULL,  -- Relaciona la imagen con el usuario que la subió
  `user_name` VARCHAR(25) NOT NULL,  -- Relaciona la imagen con el usuario que la subió
  `filename` VARCHAR(255) NOT NULL,  -- Nombre del archivo de la imagen
  `description` TEXT,  -- Descripción de la imagen
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Fecha de subida
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Fecha de la última actualización
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)  -- Relaciona la imagen con el usuario
);

-- Insertar un administrador
INSERT INTO `users` (`username`, `email`, `password`, `role`, `created_at`, `updated_at`) 
VALUES ('admin', 'admin@gmail.com', '$2y$10$kI6xsmoEJMiztt0lc1zsl.5IKOon3gjGXYYjXf.13Ube/LfY1hV32', 'admin', NOW(), NOW());

-- Insertar un usuario
INSERT INTO `users` (`username`, `email`, `password`, `role`, `created_at`, `updated_at`) 
VALUES ('user', 'user@gmail.com', '$2y$10$cOquOors.Xb4.UbY2SvfNubwbV6SlpXDNsHqCfV7VBVQull8hZ3ny', 'user', NOW(), NOW());
