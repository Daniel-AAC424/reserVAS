use reservas_p1


SELECT * FROM FN_DisponibilidadPCs('Computo 1', CAST(GETDATE() AS DATE), '10:00', '11:00')
ORDER BY TRY_CAST(SUBSTRING(pcname, 3, CHARINDEX('_', pcname) - 3) AS INT);


select * from reservas


SELECT * FROM VW_ReporteDelDia WHERE fecha_actual = '2025-11-08';


select * from areas;

update areas set listado_programas = '' where area = '';