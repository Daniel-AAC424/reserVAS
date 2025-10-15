create database prueba_reservas;
use prueba_reservas;

create table edificios(
       edificio_id int not null primary key,
       nombre varchar(30)
       
);

create table usuarios(
       carnet char(8) not null primary key,
       nombre varchar(50),
       apellido varchar(50)

	   CONSTRAINT U_carnet_usuarios UNIQUE (carnet)

);

create table laboratorios(
	   lab_id int not null primary key,
       nombre varchar(30),
       edificio int,
       encargado char(8),
       capacidad int,
       
       constraint FK_ed foreign key (edificio) references edificios(edificio_id),
	   constraint CK_capacidad CHECK (capacidad > 0)
);

create table listado_programas(
       prog_id int not null primary key,
       nombre varchar(30),
       version_p varchar(30)

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
    carnet_usuario char(8) NOT NULL, 
    computadora int not null,
    fecha_reserva date NOT NULL,
    hora_inicio time NOT NULL,
    hora_fin time NOT NULL,
    estado varchar(15), 
    
    constraint fk_reserva_usuario foreign key (carnet_usuario) references usuarios(carnet),
    constraint fk_reserva_computadora foreign key (computadora) references computadoras(comp_id),

	constraint CK_hora_inicio_fin CHECK (hora_inicio < hora_fin),
	constraint CK_estado_reserva CHECK (estado IN ('pendiente' , 'cancelada', 'completada' )),
	constraint CK_fecha_reserva CHECK (fecha_reserva >= GETDATE()),

	constraint U_reserva_unica UNIQUE (computadora, fecha_reserva, hora_inicio, hora_fin)
	

);

ALTER TABLE reservas ADD CONSTRAINT DF_fecha_reserva DEFAULT GETDATE() FOR fecha_reserva



