use reservas_p1

select p.pcname from pcs p
inner join areas a on a.area = p.area
where pcname = 'PC0_AN'


select a.processador,a.memmoria,a.tarjeta_grafica,a.espacio,a.os from pcs p
inner join areas a on a.area = p.area
where pcname = 'PC0_AN'

select p.area, a.listado_programas from pcs p
inner join areas a on a.area = p.area
where pcname = 'PC0_AN'

SELECT * FROM FN_DisponibilidadPCs('Computo 1', CAST(GETDATE() AS DATE), '10:00', '11:00')
ORDER BY TRY_CAST(SUBSTRING(pcname, 3, CHARINDEX('_', pcname) - 3) AS INT);


select * from reservas

SELECT * FROM VW_ReporteDelDia WHERE fecha_actual = '2025-11-11';

select * from areas;

update areas set listado_programas = '' where area = '';

select * from estudiantes

