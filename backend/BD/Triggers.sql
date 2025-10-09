USE prueba_reservas_corregida;

CREATE TRIGGER TRG_evitar_solapamiento
ON reservas
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN reservas r
            ON r.computadora = i.computadora
           AND r.fecha_reserva = i.fecha_reserva
           AND (
               i.hora_inicio < r.hora_fin AND i.hora_fin > r.hora_inicio
           ))
    BEGIN
        RAISERROR('Error: La reserva se solapa con una existente.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Si no hay conflicto, permite la operación
    INSERT INTO reservas (
        reserva_id, carnet_usuario, computadora, fecha_reserva, hora_inicio, hora_fin, estado
    )
    SELECT
        reserva_id, carnet_usuario, computadora, fecha_reserva, hora_inicio, hora_fin, estado
    FROM inserted;
END;
