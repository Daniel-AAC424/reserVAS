create database reservas_p1
use reservas_p1

drop table facultades
create table facultades(
facultad varchar(50) primary key not null,
--descripcion varchar(100)	
);

insert into facultades(facultad) values 
('Facultad de Ingenieria y Sistemas'),
('Facultad de Arte y Diseno'),
('Facultad de Leyes Juridicas');

drop table estudiantes
create table estudiantes(
carnet char(8) primary key not null,
nombre varchar(50),
facultad varchar(50), 
constraint facultadFK foreign key (facultad) references facultades(facultad)
);

insert into estudiantes(carnet, nombre, facultad) values 
('AC100424','Daniel Alejandro Ayala Centeno','Facultad de Ingenieria y Sistemas'),
('AL100224','Josue Alejandro Aragon Lima','Facultad de Ingenieria y Sistemas');

drop table edificios
create table edificios(
edificio varchar(30) primary key not null,
);

insert into edificios(edificio) values
('EBLE'),
('Biblioteca Ciencias Sociales'),
('Edificio A');

drop table laboratorios
create table laboratorios(
laboratorio varchar(30) primary key not null,
edificio varchar(30),
constraint edificioFK foreign key (edificio) references edificios(edificio)
);

insert into laboratorios(laboratorio, edificio) values
('Computo 5','EBLE'),
('Computo 6','EBLE'),
('Animacion','EBLE'),
('Videojuegos','EBLE'),
('Cisco','EBLE'),
('Impresoras 3D','EBLE'),
('Computo 1','Edificio A'),
('Computo Biblioteca','Biblioteca Ciencias Sociales');

drop table areas
create table areas(
area varchar(30) primary key not null,
processador varchar(50),
memmoria varchar(15),
espacio varchar(5),
tarjeta_grafica varchar(25),
os varchar(30),
listado_programas varchar(500),
);

insert into areas(area, processador, memmoria, espacio, tarjeta_grafica, os, listado_programas) values 
('arquitectura','Intel Core i9 14900HX','24GB DDR4','1TB','GeForce GTX 3050','Windows 10 Pro', 'AutoCad, Revit, 3D Max,D5'),
('animacion','Intel Core i9 14900HX','24GB DDR4','1TB','GeForce GTX 3050','Windows 10 Pro', 'Blender, Adobe After Effects, Adobe Photoshop, Adobe Premier Pro, Adobe Cloud, Toonz, Adobe Animate'),
('redes','Intel Core i9 14900HX','24GB DDR4','1TB','GeForce GTX 3050','Windows 10 Pro', 'Cisco Packet Tracer, GNS3, XAMPP, WireShark, Visual Studio Code, Visual Studio 2022'),
('programacion','Intel Core i9 14900HX','24GB DDR4','1TB','GeForce GTX 3050','Windows 10 Pro', 'MySQL, SQL Server 21, XAMPP, MongoDB, DBeaver, Visual Studio Code, Visual Studio 2022, Apache NetBeans'),
('videojuegos','Intel Core i9 14900HX','24GB DDR4','1TB','GeForce GTX 3050','Windows 10 Pro', 'Unity, Unreal Engine, Visual Studio Code, Visual Studio 2022'),
('basica','Intel Core i9 14900HX','24GB DDR4','1TB','GeForce GTX 3050','Windows 10 Pro', 'sin programas especiales');

drop table pcs
create table pcs(
pcname varchar(7) primary key not null,
laboratorio varchar(30),
area varchar(30),	
constraint FKLAB foreign key (laboratorio) references laboratorios(laboratorio),
constraint FKAREA foreign key (area) references areas(area)
);

--insert into pcs values('PC0','Computo 5','programacion'),('PC0','Computo 6', 'redes'),('PC0','Animacion','animacion'),('PC0','Videojuegos','videojuegos'),('PC0','Cisco','redes'),('PC0','Impresoras 3D','arquitectura'),('PC0','Computo 1','programacion'),('PC0','Computo Biblioteca','basica')

INSERT INTO pcs(pcname, laboratorio, area) VALUES
('PC0_C5','Computo 5','programacion'),('PC0_C6','Computo 6','redes'),('PC0_AN','Animacion','animacion'),('PC0_VD','Videojuegos','videojuegos'),('PC0_CI','Cisco','redes'),('PC0_IM','Impresoras 3D','arquitectura'),('PC0_C1','Computo 1','programacion'),('PC0_CB','Computo Biblioteca','basica'),
('PC1_C5','Computo 5','programacion'),('PC1_C6','Computo 6','redes'),('PC1_AN','Animacion','animacion'),('PC1_VD','Videojuegos','videojuegos'),('PC1_CI','Cisco','redes'),('PC1_IM','Impresoras 3D','arquitectura'),('PC1_C1','Computo 1','programacion'),('PC1_CB','Computo Biblioteca','basica'),
('PC2_C5','Computo 5','programacion'),('PC2_C6','Computo 6','redes'),('PC2_AN','Animacion','animacion'),('PC2_VD','Videojuegos','videojuegos'),('PC2_CI','Cisco','redes'),('PC2_IM','Impresoras 3D','arquitectura'),('PC2_C1','Computo 1','programacion'),('PC2_CB','Computo Biblioteca','basica'),
('PC3_C5','Computo 5','programacion'),('PC3_C6','Computo 6','redes'),('PC3_AN','Animacion','animacion'),('PC3_VD','Videojuegos','videojuegos'),('PC3_CI','Cisco','redes'),('PC3_IM','Impresoras 3D','arquitectura'),('PC3_C1','Computo 1','programacion'),('PC3_CB','Computo Biblioteca','basica'),
('PC4_C5','Computo 5','programacion'),('PC4_C6','Computo 6','redes'),('PC4_AN','Animacion','animacion'),('PC4_VD','Videojuegos','videojuegos'),('PC4_CI','Cisco','redes'),('PC4_IM','Impresoras 3D','arquitectura'),('PC4_C1','Computo 1','programacion'),('PC4_CB','Computo Biblioteca','basica'),
('PC5_C5','Computo 5','programacion'),('PC5_C6','Computo 6','redes'),('PC5_AN','Animacion','animacion'),('PC5_VD','Videojuegos','videojuegos'),('PC5_CI','Cisco','redes'),('PC5_IM','Impresoras 3D','arquitectura'),('PC5_C1','Computo 1','programacion'),('PC5_CB','Computo Biblioteca','basica'),
('PC6_C5','Computo 5','programacion'),('PC6_C6','Computo 6','redes'),('PC6_AN','Animacion','animacion'),('PC6_VD','Videojuegos','videojuegos'),('PC6_CI','Cisco','redes'),('PC6_IM','Impresoras 3D','arquitectura'),('PC6_C1','Computo 1','programacion'),('PC6_CB','Computo Biblioteca','basica'),
('PC7_C5','Computo 5','programacion'),('PC7_C6','Computo 6','redes'),('PC7_AN','Animacion','animacion'),('PC7_VD','Videojuegos','videojuegos'),('PC7_CI','Cisco','redes'),('PC7_IM','Impresoras 3D','arquitectura'),('PC7_C1','Computo 1','programacion'),('PC7_CB','Computo Biblioteca','basica'),
('PC8_C5','Computo 5','programacion'),('PC8_C6','Computo 6','redes'),('PC8_AN','Animacion','animacion'),('PC8_VD','Videojuegos','videojuegos'),('PC8_CI','Cisco','redes'),('PC8_IM','Impresoras 3D','arquitectura'),('PC8_C1','Computo 1','programacion'),('PC8_CB','Computo Biblioteca','basica'),
('PC9_C5','Computo 5','programacion'),('PC9_C6','Computo 6','redes'),('PC9_AN','Animacion','animacion'),('PC9_VD','Videojuegos','videojuegos'),('PC9_CI','Cisco','redes'),('PC9_IM','Impresoras 3D','arquitectura'),('PC9_C1','Computo 1','programacion'),('PC9_CB','Computo Biblioteca','basica'),
('PC10_C5','Computo 5','programacion'),('PC10_C6','Computo 6','redes'),('PC10_AN','Animacion','animacion'),('PC10_VD','Videojuegos','videojuegos'),('PC10_CI','Cisco','redes'),('PC10_IM','Impresoras 3D','arquitectura'),('PC10_C1','Computo 1','programacion'),('PC10_CB','Computo Biblioteca','basica'),
('PC11_C5','Computo 5','programacion'),('PC11_C6','Computo 6','redes'),('PC11_AN','Animacion','animacion'),('PC11_VD','Videojuegos','videojuegos'),('PC11_CI','Cisco','redes'),('PC11_IM','Impresoras 3D','arquitectura'),('PC11_C1','Computo 1','programacion'),('PC11_CB','Computo Biblioteca','basica'),
('PC12_C5','Computo 5','programacion'),('PC12_C6','Computo 6','redes'),('PC12_AN','Animacion','animacion'),('PC12_VD','Videojuegos','videojuegos'),('PC12_CI','Cisco','redes'),('PC12_IM','Impresoras 3D','arquitectura'),('PC12_C1','Computo 1','programacion'),('PC12_CB','Computo Biblioteca','basica'),
('PC13_C5','Computo 5','programacion'),('PC13_C6','Computo 6','redes'),('PC13_AN','Animacion','animacion'),('PC13_VD','Videojuegos','videojuegos'),('PC13_CI','Cisco','redes'),('PC13_IM','Impresoras 3D','arquitectura'),('PC13_C1','Computo 1','programacion'),('PC13_CB','Computo Biblioteca','basica'),
('PC14_C5','Computo 5','programacion'),('PC14_C6','Computo 6','redes'),('PC14_AN','Animacion','animacion'),('PC14_VD','Videojuegos','videojuegos'),('PC14_CI','Cisco','redes'),('PC14_IM','Impresoras 3D','arquitectura'),('PC14_C1','Computo 1','programacion'),('PC14_CB','Computo Biblioteca','basica'),
('PC15_C5','Computo 5','programacion'),('PC15_C6','Computo 6','redes'),('PC15_AN','Animacion','animacion'),('PC15_VD','Videojuegos','videojuegos'),('PC15_CI','Cisco','redes'),('PC15_IM','Impresoras 3D','arquitectura'),('PC15_C1','Computo 1','programacion'),('PC15_CB','Computo Biblioteca','basica'),
('PC16_C5','Computo 5','programacion'),('PC16_C6','Computo 6','redes'),('PC16_AN','Animacion','animacion'),('PC16_VD','Videojuegos','videojuegos'),('PC16_CI','Cisco','redes'),('PC16_IM','Impresoras 3D','arquitectura'),('PC16_C1','Computo 1','programacion'),('PC16_CB','Computo Biblioteca','basica'),
('PC17_C5','Computo 5','programacion'),('PC17_C6','Computo 6','redes'),('PC17_AN','Animacion','animacion'),('PC17_VD','Videojuegos','videojuegos'),('PC17_CI','Cisco','redes'),('PC17_IM','Impresoras 3D','arquitectura'),('PC17_C1','Computo 1','programacion'),('PC17_CB','Computo Biblioteca','basica'),
('PC18_C5','Computo 5','programacion'),('PC18_C6','Computo 6','redes'),('PC18_AN','Animacion','animacion'),('PC18_VD','Videojuegos','videojuegos'),('PC18_CI','Cisco','redes'),('PC18_IM','Impresoras 3D','arquitectura'),('PC18_C1','Computo 1','programacion'),('PC18_CB','Computo Biblioteca','basica'),
('PC19_C5','Computo 5','programacion'),('PC19_C6','Computo 6','redes'),('PC19_AN','Animacion','animacion'),('PC19_VD','Videojuegos','videojuegos'),('PC19_CI','Cisco','redes'),('PC19_IM','Impresoras 3D','arquitectura'),('PC19_C1','Computo 1','programacion'),('PC19_CB','Computo Biblioteca','basica'),
('PC20_C5','Computo 5','programacion'),('PC20_C6','Computo 6','redes'),('PC20_AN','Animacion','animacion'),('PC20_VD','Videojuegos','videojuegos'),('PC20_CI','Cisco','redes'),('PC20_IM','Impresoras 3D','arquitectura'),('PC20_C1','Computo 1','programacion'),('PC20_CB','Computo Biblioteca','basica');

drop table reservas
create table reservas(
reservaID int identity(1,1) primary key not null,
carnet char(8),
edificio varchar(30),
laboratorio varchar(30),
pcname varchar(7),
fecha_actual date default getdate(),
hora_inicio time,
hora_salida time,	
constraint FKcarnet foreign key (carnet) references estudiantes(carnet),
constraint FKedificio foreign key (edificio) references edificios(edificio),
constraint FKlaboratorio foreign key (laboratorio) references laboratorios(laboratorio),
constraint FKpc foreign key (pcname) references pcs(pcname)
);

drop table reportes
create table reportes(
reporteID int identity(1,1) primary key not null,
reservaID int,
constraint FKreserva foreign key (reservaID) references reservas(reservaID)
);

--insert into reservas (carnet,edificio,laboratorio,fecha_actual)values ('AC100424','EBLE','Computo 5','4:14',DATEADD(HOUR, 1, '4:14'))
--select * from reservas

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
        RAISERROR('La PC ya está reservada en ese horario.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;

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

--pruebas de reservas en el que choquen con otro horario
INSERT INTO reservas (carnet, edificio, laboratorio, pcname, fecha_actual, hora_inicio, hora_salida)
VALUES ('AL100224', 'EBLE', 'Computo 5', 'PC0_C5', CAST(GETDATE() AS DATE), '14:30', '15:30');

--validacion de vista
SELECT * FROM VW_ReporteDelDia WHERE fecha_actual = '2025-11-06';

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

