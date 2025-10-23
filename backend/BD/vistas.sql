use prueba_reservas;



select c.comp_id, l.nombre,lp.nombre programa_dedicado, r.estado from computadoras c
inner join laboratorios l
on c.lab_id = l.lab_id
inner join especificaciones_computadoras ec
on c.especificaciones = ec.esp_id
inner join listado_programas lp
on ec.programas_dedicados = lp.prog_id
inner join reservas r
on r.computadora = c.comp_id
where l.lab_id = 5



select * from computadoras