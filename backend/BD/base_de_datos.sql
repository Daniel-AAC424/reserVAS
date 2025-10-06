create database prueba_reservas;
use prueba_reservas;

create table edificios(
       edificio_id int not null primary key,
       nombre varchar(30)
       
);

create table encargados(
       carnet char(7) not null primary key,
       nombre varchar(50),
       apellido varchar(50) -- tabla de facultad luego

);

create table laboratorios(
	   lab_id int not null primary key,
       nombre varchar(30),
       edificio int,
       encargado int,
       capacidad int,
       
       constraint FK_ed foreign key (edificio) references edificios(edificio_id)
);

create table especificaciones_computadoras(
       esp_id int not null primary key,
       procesador varchar(15),
       almacenamiento varchar(15),
       tarjeta_grafica varchar(15),
       os varchar(15),
       programas_dedicados varchar(100) -- hacerlo una tabla luego
       
);

create table computadoras(
       comp_id int not null primary key,
       lab_id int,
       especificaciones int,
       
       constraint FK_lab foreign key (lab_id) references laboratorios(lab_id),
       constraint FK_esp foreign key (especificaciones) references especificaciones_computadoras(esp_id)

);

-- TABLA DE RESERVAS
-- Esta tabla almacena los registros de las reservas de PCs.

CREATE TABLE reservas (
    reserva_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    -- El carnet del usuario que realiza la reserva (asumiendo que encargados son los usuarios/estudiantes)
    carnet_usuario CHAR(7) NOT NULL, 
    
    -- La computadora específica que ha sido reservada
    comp_id INT NOT NULL, 
    
    -- Fecha y rango de tiempo de la reserva
    fecha_reserva DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    
    -- Estado de la reserva (ej. 'Activa', 'Cancelada', 'Finalizada')
    estado VARCHAR(15) DEFAULT 'Activa', 
    
    -- Llaves Foráneas
    CONSTRAINT fk_reserva_usuario FOREIGN KEY (carnet_usuario) REFERENCES encargados(carnet),
    CONSTRAINT fk_reserva_computadora FOREIGN KEY (comp_id) REFERENCES computadoras(comp_id),
    
    -- Asegurar que una PC no pueda ser reservada por dos personas en el mismo lapso de tiempo
    CONSTRAINT uq_reserva_tiempo UNIQUE (comp_id, fecha_reserva, hora_inicio, hora_fin)
);

-- Ejemplo de datos de prueba para la tabla de reservas (puedes agregar esto a tu script)
/*
INSERT INTO encargados (carnet, nombre, apellido) VALUES ('1234567', 'Juan', 'Perez');
INSERT INTO especificaciones_computadoras (esp_id, procesador, almacenamiento, tarjeta_grafica, os, programas_dedicados) VALUES (1, 'i7', '512GB SSD', 'RTX 3060', 'Windows 10', 'Visual Studio, Photoshop');
INSERT INTO laboratorios (lab_id, nombre, edificio, capacidad) VALUES (1, 'Lab 101', 1, 30); -- Asumiendo que edificio 1 existe
INSERT INTO computadoras (comp_id, lab_id, especificaciones) VALUES (1, 1, 1);
INSERT INTO reservas (carnet_usuario, comp_id, fecha_reserva, hora_inicio, hora_fin) VALUES ('1234567', 1, CURDATE(), '09:00:00', '10:00:00');
*/

