--funcion para la validacion de disponivilidad de pc
drop function FN_DisponibilidadPCs
CREATE FUNCTION FN_DisponibilidadPCs
(
    @laboratorio VARCHAR(30),
    @fecha DATE,
    @hora_inicio TIME,
    @hora_salida TIME
)
RETURNS @Resultado TABLE
(
    pcname VARCHAR(7),
    laboratorio VARCHAR(30),
    estado VARCHAR(20)
)
AS
BEGIN
    INSERT INTO @Resultado
    SELECT 
        p.pcname,
        p.laboratorio,
        CASE 
            WHEN EXISTS (
                SELECT 1 
                FROM reservas r
                WHERE r.pcname = p.pcname
                  AND r.laboratorio = @laboratorio
                  AND r.fecha_actual = @fecha
                  AND @hora_inicio < r.hora_salida  
                  AND @hora_salida > r.hora_inicio
            )
            THEN 'Ocupada'
            ELSE 'Disponible'
        END AS estado
    FROM pcs p
    WHERE p.laboratorio = @laboratorio;
    RETURN;
END;


--prueba de la funcion, el orden by es para ordenar las pc por el numero que tienen, ya que sin eso estan ordenado de manera alfabetica
SELECT * FROM FN_DisponibilidadPCs('Computo 5', CAST(GETDATE() AS DATE), '10:00', '11:00')
ORDER BY TRY_CAST(SUBSTRING(pcname, 3, CHARINDEX('_', pcname) - 3) AS INT);

