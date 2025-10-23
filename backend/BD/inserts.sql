use prueba_reservas;

--Solo pruebas por el momento

insert into dbo.edificios (edificio_id,nombre) values (1,'EBLE')
insert into dbo.edificios (edificio_id,nombre) values (2,'Edificio A')
insert into dbo.edificios (edificio_id,nombre) values (3,'Biblioteca Ciencias Sociales')

insert into dbo.usuarios (carnet,nombre,apellido) values ('AC100424','Daniel','Ayala')
insert into dbo.usuarios (carnet,nombre,apellido) values ('HB100124','Silas','Hernandez')
insert into dbo.usuarios (carnet,nombre,apellido) values ('RR101524','Sara','Rodriguez')
insert into dbo.usuarios (carnet,nombre,apellido) values ('AL100224','Josue','Aragon')
insert into dbo.usuarios (carnet,nombre,apellido) values ('AM101024','Kevin','Aparicio')

insert into dbo.laboratorios (lab_id,nombre,edificio,encargado,capacidad) values 
(1,'Computo 5',1,1,50),(2,'Computo 6',1,1,50),(3,'Computo Animacion',1,2,15),(4,'Computo Videojuegos',1,4,15),(5,'Computo A',2,5,60),
(6,'Computadoras Biblio CS',3,3,5)


insert into dbo.listado_programas (prog_id,nombre,version_p) values (1,'SQL SERVER MANGEMENT STUDIO','19')

insert into dbo.especificaciones_computadoras (esp_id,procesador,almacenamiento,tarjeta_grafica,os,programas_dedicados)
values (1,'Intel Core i7','500GB','Nvidia RTX 1050','Windows 10 Home',1)

insert into dbo.computadoras (comp_id,lab_id,especificaciones) values (1,1,1)


--

INSERT INTO dbo.listado_programas (prog_id, nombre, version_p) VALUES 
(2, 'ADOBE PHOTOSHOP', 'CS6'),
(3, 'UNITY 3D', '2022.1'),
(4, 'BLENDER', '3.6'),
(5, 'AUTOCAD', '2023');

INSERT INTO dbo.especificaciones_computadoras (esp_id, procesador, almacenamiento, tarjeta_grafica, os, programas_dedicados)
VALUES 
(2, 'Intel Core i9', '1TB NVMe', 'Nvidia RTX 3080', 'Windows 11 Pro', 3), -- Para Animación/Videojuegos (UNITY 3D)
(3, 'AMD Ryzen 5', '256GB SSD', 'Integrada', 'Windows 10 Pro', 2),        -- Para Computo A (PHOTOSHOP)
(4, 'Intel Celeron', '128GB SSD', 'Integrada', 'Linux Ubuntu', 1);


-- 6. computadoras (comp_id, lab_id FK, especificaciones FK)
-- (Ya proporcionaste 1, aquí más)
INSERT INTO dbo.computadoras (comp_id, lab_id, especificaciones) VALUES 
-- Computadoras en Computo 5 (lab_id 1) con esp_id 1
(2, 1, 1),
(3, 1, 1),
-- Computadoras en Computo Videojuegos (lab_id 4) con esp_id 2
(4, 4, 2),
(5, 4, 2),
-- Computadoras en Computo A (lab_id 5) con esp_id 3
(6, 5, 3),
(7, 5, 3),
-- Computadoras en Computo Biblio CS (lab_id 6) con esp_id 4
(8, 6, 4);

-- Use a specific future date for a guaranteed pass, or DATEADD for the next day.
DECLARE @TomorrowDate DATE = DATEADD(day, 1, CAST(GETDATE() AS DATE));

INSERT INTO dbo.reservas (reserva_id, carnet_usuario, computadora, fecha_reserva, hora_inicio, hora_fin, estado) VALUES
-- Reservation 1: Set for tomorrow
(1, 'AC100424', 2, @TomorrowDate, '10:00:00', '11:30:00', 'pendiente'),
-- Reservation 2: Set for day after tomorrow
(2, 'AC100424', 5, DATEADD(day, 2, @TomorrowDate), '14:00:00', '16:00:00', 'completada'),
-- Reservation 3: Set for tomorrow, late afternoon
(3, 'HB100124', 8, @TomorrowDate, '16:30:00', '17:30:00', 'cancelada');

-- Further reservations (two and three days from now)
INSERT INTO dbo.reservas (reserva_id, carnet_usuario, computadora, fecha_reserva, hora_inicio, hora_fin, estado) VALUES
(4, 'AC100424', 4, DATEADD(day, 3, CAST(GETDATE() AS DATE)), '08:00:00', '10:00:00', 'pendiente'),
(5, 'HB100124', 3, DATEADD(day, 4, CAST(GETDATE() AS DATE)), '15:00:00', '17:00:00', 'pendiente');