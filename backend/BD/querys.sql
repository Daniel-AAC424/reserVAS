select p.pcname from pcs p
inner join areas a on a.area = p.area
where pcname = 'PC0_AN'


select a.processador,a.memmoria,a.tarjeta_grafica,a.espacio,a.os from pcs p
inner join areas a on a.area = p.area
where pcname = 'PC0_AN'

select p.area, a.listado_programas from pcs p
inner join areas a on a.area = p.area
where pcname = 'PC0_AN'


