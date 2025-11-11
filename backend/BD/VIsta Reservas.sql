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

SELECT * FROM VW_Reporte WHERE fecha_actual = '2025-11-05';