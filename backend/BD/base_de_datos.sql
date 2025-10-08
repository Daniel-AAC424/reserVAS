create database prueba_reservas;
use prueba_reservas;

create table edificios(
       edificio_id int not null primary key,
       nombre varchar(30)
       
);

create table encargados(
       carnet char(7) not null primary key,
       nombre varchar(50),
       apellido varchar(50)

);

create table laboratorios(
	   lab_id int not null primary key,
       nombre varchar(30),
       edificio int,
       encargado int,
       capacidad int,
       
       constraint FK_ed foreign key (edificio) references edificios(edificio_id)
);

create table listado_programas(
       prog_id int not null primary key,
       nombre varchar(15),
       version_p varchar(15)

);

create table especificaciones_computadoras(
       esp_id int not null primary key,
       procesador varchar(15),
       almacenamiento varchar(15),
       tarjeta_grafica varchar(15),
       os varchar(15),
       programas_dedicados int,

       constraint FK_prog foreign key (programas_dedicados) references listado_programas(prog_id)
       
);

create table computadoras(
       comp_id int not null primary key,
       lab_id int,
       especificaciones int,
       
       constraint FK_lab foreign key (lab_id) references laboratorios(lab_id),
       constraint FK_esp foreign key (especificaciones) references especificaciones_computadoras(esp_id)

);

create table reservas (
    reserva_id int NOT NULL PRIMARY KEY,
    carnet_usuario char(7) NOT NULL, 
    computadora int not null,
    fecha_reserva date NOT NULL,
    hora_inicio time NOT NULL,
    hora_fin time NOT NULL,
    estado varchar(15), 
    
    constraint fk_reserva_usuario foreign key (carnet_usuario) references encargados(carnet),
    constraint fk_reserva_computadora foreign key (computadora) references computadoras(comp_id)

);

