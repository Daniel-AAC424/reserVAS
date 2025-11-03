create database reservas_p0

use database reservas_p0

create table estudiantes(
    carnet char(8) primary key not null
);

insert into estudiantes vaues (AC100424);

create table reservas(
    reservaID int identity(1,1) primary key not null,
    carnet char(8),
    edificio varchar(50),
    laboratorio varchar(50),
    pcname varchar(10),
    fecha_actual date default getdate(),
    hora_inicio time,
    hora_salida time

);

insert into reservas (carnet,edificio,laboratorio,fecha_actual)values ('AC100424','EBLE','Computo 5','4:14',DATEADD(HOUR, 1, '4:14'))

select * from reservas