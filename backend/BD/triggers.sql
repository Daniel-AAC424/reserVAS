use reservas_p1

drop trigger TR_ValidarChoqueReserva
CREATE TRIGGER TR_ValidarChoqueReserva
ON reservas
FOR INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM reservas r
        INNER JOIN inserted i
            ON r.pcname = i.pcname
           AND r.fecha_actual = i.fecha_actual
           AND r.reservaID <> i.reservaID
        WHERE 
            i.hora_inicio < r.hora_salida
        AND i.hora_salida > r.hora_inicio
    )
    BEGIN
        RAISERROR('La PC ya est� reservada en ese horario.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
����END
END;

--pruebas de reservas en el que choquen con otro horario
INSERT INTO reservas (carnet, edificio, laboratorio, pcname, fecha_actual, hora_inicio, hora_salida)
VALUES ('AL100224', 'EBLE', 'Computo 5', 'PC0_C5', CAST(GETDATE() AS DATE), '14:30', '15:30');

drop trigger TR_InsertarReporteHoy
CREATE TRIGGER TR_InsertarReporteHoy
ON reservas
AFTER INSERT
AS
BEGIN
    INSERT INTO reportes(reservaID)
    SELECT reservaID 
    FROM inserted
    WHERE CAST(fecha_actual AS DATE) = CAST(GETDATE() AS DATE);
END;
