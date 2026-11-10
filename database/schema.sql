-- Creación de la Base de Datos
DROP DATABASE IF EXISTS db_canchas_deportivas;
CREATE DATABASE db_canchas_deportivas CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_canchas_deportivas;

-- 1. Tabla de Usuarios (Clientes y Administradores)
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    rol ENUM('Cliente', 'Administrador') NOT NULL DEFAULT 'Cliente',
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 2. Tabla de Canchas Deportivas
CREATE TABLE canchas (
    id_cancha INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cancha VARCHAR(50) NOT NULL,
    tipo_superficie VARCHAR(50) NOT NULL, -- Sintética, Natural, Loza, etc.
    precio_hora DECIMAL(10,2) NOT NULL,
    estado ENUM('Disponible', 'Mantenimiento', 'Ocupada') NOT NULL DEFAULT 'Disponible'
) ENGINE=InnoDB;

-- 3. Tabla de Métodos de Pago
CREATE TABLE metodos_pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    nombre_metodo VARCHAR(50) NOT NULL -- Efectivo, Nequi, Tarjeta, Transferencia
) ENGINE=InnoDB;

-- 4. Tabla de Reservas (Relaciona usuarios y canchas)
CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_cancha INT NOT NULL,
    fecha_reserva DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    total_pagar DECIMAL(10,2) NOT NULL,
    estado_reserva ENUM('Confirmada', 'Cancelada', 'Completada') NOT NULL DEFAULT 'Confirmada',
    CONSTRAINT fk_reserva_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_reserva_cancha FOREIGN KEY (id_cancha) REFERENCES canchas(id_cancha) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 5. Tabla de Detalle de Pagos (Relaciona reservas con el método de pago)
CREATE TABLE detalle_pagos (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT NOT NULL,
    id_pago INT NOT NULL,
    monto_pagado DECIMAL(10,2) NOT NULL,
    estado_pago ENUM('Pendiente', 'Pagado', 'Rechazado') NOT NULL DEFAULT 'Pagado',
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_pago_reserva FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_pago_metodo FOREIGN KEY (id_pago) REFERENCES metodos_pago(id_pago) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;