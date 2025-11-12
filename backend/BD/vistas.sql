use reservas_p1

drop view VW_ReporteDelDia
CREATE VIEW VW_ReporteDelDia 
AS
SELECT r.reservaID, r.carnet, e.nombre, r.edificio, r.laboratorio, r.pcname, r.fecha_actual,
CONVERT(VARCHAR(5), hora_inicio, 108) AS hora_inicio,
CONVERT(VARCHAR(5), hora_salida, 108) AS hora_salida
FROM reservas r
INNER JOIN estudiantes e ON r.carnet = e.carnet
WHERE r.fecha_actual = CAST(GETDATE() AS DATE);

--pruebas de los triggers y de la vista
--prueba de reservas validas
INSERT INTO reservas (carnet, edificio, laboratorio, pcname, fecha_actual, hora_inicio, hora_salida)
VALUES ('AL100224', 'EBLE', 'Computo 5', 'PC10_C5', CAST(GETDATE() AS DATE), '11:00', '12:00');

SELECT reservaID, carnet, edificio, laboratorio, pcname,
       fecha_actual,
       CONVERT(VARCHAR(5), hora_inicio, 108) AS hora_inicio,
       CONVERT(VARCHAR(5), hora_salida, 108) AS hora_salida
FROM reservas;

SELECT * FROM reportes;

--validacion de vista
SELECT * FROM VW_ReporteDelDia WHERE fecha_actual = '2025-11-11';

use reservas_p1

--reporte para cualquier dia
drop view VW_Reporte
CREATE VIEW VW_Reporte
AS
SELECT r.reservaID, r.carnet, e.nombre, r.edificio, r.laboratorio, r.pcname, r.fecha_actual,
CONVERT(VARCHAR(5), hora_inicio, 108) AS hora_inicio,
CONVERT(VARCHAR(5), hora_salida, 108) AS hora_salida
FROM reservas r
INNER JOIN estudiantes e ON r.carnet = e.carnet;
--Reporte cualquier dia
SELECT * FROM VW_Reporte WHERE fecha_actual�=�'2025-11-05';
