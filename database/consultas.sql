-- =====================================================
-- ARCHIVO DE CONSULTAS SQL - CANCHA DEPORTIVA
-- Proyecto SENA ADSO
-- =====================================================

USE db_canchas_deportivas;

-- 1. INSERT: Registrar un nuevo usuario cliente en el sistema
INSERT INTO usuarios (nombre, correo, telefono, rol) 
VALUES ('Valentina Ríos', 'valentina.rios@email.com', '3123456789', 'Cliente');

-- 2. SELECT con WHERE y ORDER BY: Buscar canchas disponibles ordenadas por precio
SELECT nombre_cancha, tipo_superficie, precio_hora 
FROM canchas 
WHERE estado = 'Disponible' 
ORDER BY precio_hora ASC;

-- 3. UPDATE: Actualizar el número de teléfono de un usuario (¡Siempre con WHERE!)
UPDATE usuarios 
SET telefono = '3189998888' 
WHERE id_usuario = 1;

-- 4. DELETE: Eliminar un método de pago temporal o incorrecto (¡Siempre con WHERE!)
DELETE FROM usuarios 
WHERE id_usuario = 99; -- (Ejemplo seguro o registro de prueba)

-- 5. JOIN: Consultar las reservas detalladas uniendo usuario y cancha
SELECT 
    r.id_reserva,
    u.nombre AS cliente,
    c.nombre_cancha,
    r.fecha_reserva,
    r.hora_inicio,
    r.hora_fin,
    r.total_pagar,
    r.estado_reserva
FROM reservas r
JOIN usuarios u ON r.id_usuario = u.id_usuario
JOIN canchas c ON r.id_cancha = c.id_cancha
ORDER BY r.fecha_reserva DESC;

-- 6. SUM y GROUP BY: Calcular los ingresos totales acumulados agrupados por mes de reserva
SELECT 
    DATE_FORMAT(fecha_reserva, '%Y-%m') AS mes, 
    SUM(total_pagar) AS ingresos_totales
FROM reservas
WHERE estado_reserva = 'Confirmada'
GROUP BY mes
ORDER BY mes ASC;

-- 7. COUNT y HAVING: Identificar clientes frecuentes que tienen más de 1 reserva registrada
SELECT 
    u.nombre AS cliente, 
    COUNT(r.id_reserva) AS total_reservas
FROM reservas r
JOIN usuarios u ON r.id_usuario = u.id_usuario
GROUP BY u.id_usuario, u.nombre
HAVING COUNT(r.id_reserva) > 1;