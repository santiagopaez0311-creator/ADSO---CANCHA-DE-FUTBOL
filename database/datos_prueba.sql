USE db_canchas_deportivas;

-- 1. Insertar Registros en Usuarios (5 mínimos)
INSERT INTO usuarios (nombre, correo, telefono, rol) VALUES
('Carlos Pérez', 'carlos.perez@email.com', '3101234567', 'Cliente'),
('Ana Gómez', 'ana.gomez@email.com', '3209876543', 'Cliente'),
('Luis Rodríguez', 'luis.rodriguez@email.com', '3154567890', 'Cliente'),
('Sofia Martiñez', 'sofia.martinez@email.com', '3007891234', 'Administrador'),
('Andrés Paez', 'andres.paez@email.com', '3118902345', 'Cliente');

-- 2. Insertar Registros en Canchas (5 mínimos)
INSERT INTO canchas (nombre_cancha, tipo_superficie, precio_hora, estado) VALUES
('Cancha Sintética 5', 'Gramą Sintética', 60000.00, 'Disponible'),
('Cancha Sintética 8', 'Gramą Sintética', 90000.00, 'Disponible'),
('Cancha Fútbol 11', 'Césped Natural', 150000.00, 'Mantenimiento'),
('Cancha Rápida Techo', 'Cemento / Loza', 50000.00, 'Disponible'),
('Cancha VIP Pro', 'Sintética Alta Gama', 120000.00, 'Disponible');

-- 3. Insertar Registros en Métodos de Pago (5 mínimos)
INSERT INTO metodos_pago (nombre_metodo) VALUES
('Efectivo'),
('Nequi'),
('Daviplata'),
('Tarjeta Débito/Crédito'),
('Transferencia Bancaria');

-- 4. Insertar Registros en Reservas (5 mínimos)
INSERT INTO reservas (id_usuario, id_cancha, fecha_reserva, hora_inicio, hora_fin, total_pagar, estado_reserva) VALUES
(1, 1, '2026-11-15', '18:00:00', '19:00:00', 60000.00, 'Confirmada'),
(2, 2, '2026-11-16', '20:00:00', '21:00:00', 90000.00, 'Confirmada'),
(3, 4, '2026-11-17', '17:00:00', '18:00:00', 50000.00, 'Completada'),
(5, 5, '2026-11-18', '19:00:00', '21:00:00', 240000.00, 'Confirmada'),
(1, 2, '2026-11-19', '16:00:00', '17:00:00', 90000.00, 'Cancelada');

-- 5. Insertar Registros en Detalle de Pagos (5 mínimos)
INSERT INTO detalle_pagos (id_reserva, id_pago, monto_pagado, estado_pago) VALUES
(1, 2, 60000.00, 'Pagado'),    -- Pagado con Nequi
(2, 4, 90000.00, 'Pagado'),    -- Pagado con Tarjeta
(3, 1, 50000.00, 'Pagado'),    -- Pagado en Efectivo
(4, 3, 240000.00, 'Pagado'),   -- Pagado con Daviplata
(5, 5, 90000.00, 'Rechazado'); -- Transferencia fallida (reserva cancelada)