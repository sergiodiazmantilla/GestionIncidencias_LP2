-- Creacion de la base de datos
DROP DATABASE IF EXISTS db_gestion_incidencias;
create database db_gestion_incidencias;
USE db_gestion_incidencias;

-- Creacion de Tablas
CREATE TABLE Departamento (
  `codDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` varchar(100) NOT NULL,
  `descripcionDpto` varchar(100) NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`codDepartamento`)
);

CREATE TABLE Empleado
(
  `codEmpleado` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `tipoEmp` varchar(50) DEFAULT NULL,
  `codDepartamento` int(11) NOT NULL,
  PRIMARY KEY (`codEmpleado`),
  KEY `FK7senjd2phrt7w3rqd1jaejpdw` (`codDepartamento`),
  CONSTRAINT `FK7senjd2phrt7w3rqd1jaejpdw` FOREIGN KEY (`codDepartamento`) REFERENCES `departamento` (`codDepartamento`)
);

CREATE TABLE Incidencia
(
  `codIncidencia` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `fechaRegistro` datetime(6) DEFAULT NULL,
  `nivelPrioridad` varchar(10) NOT NULL,
  `categoria` varchar(15) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `codEmpleado` bigint(20) NOT NULL,
  PRIMARY KEY (`codIncidencia`),
  KEY `FKb4kvcg0d0kf9gk2u4xde2h56u` (`codEmpleado`),
  CONSTRAINT `FKb4kvcg0d0kf9gk2u4xde2h56u` FOREIGN KEY (`codEmpleado`) REFERENCES `empleado` (`codEmpleado`)
);

CREATE TABLE Atencion
(
  `codAtencion` bigint(20) NOT NULL AUTO_INCREMENT,
  `acciones` varchar(250) NOT NULL,
  `fechaAtencion` datetime(6) NOT NULL,
  `presupuesto` float NOT NULL,
  `detallePresupuesto` varchar(255) NOT NULL,
  `observaciones` varchar(250) NOT NULL,
  `codEmpleado` bigint(20) NOT NULL,
  `codIncidencia` bigint(20) NOT NULL,
  PRIMARY KEY (`codAtencion`),
  KEY `FKmqla01uylnpspm1wm38lba0vh` (`codEmpleado`),
  KEY `FK4ruf3898fhk30b0x7eojyku96` (`codIncidencia`),
  CONSTRAINT `FK4ruf3898fhk30b0x7eojyku96` FOREIGN KEY (`codIncidencia`) REFERENCES `incidencia` (`codIncidencia`),
  CONSTRAINT `FKmqla01uylnpspm1wm38lba0vh` FOREIGN KEY (`codEmpleado`) REFERENCES `empleado` (`codEmpleado`)
);

-- TEST INSERTS
-- insertar registros - tabla Departamento
INSERT INTO Departamento (nombreDepartamento, descripcionDpto, estado)
VALUES 
    ( 'OSI', 'Oficina de Seguridad de la Informacion', 'Activo'),
    ( 'Mesa de Servicios', 'Departamento de Finanzas', 'Activo'),
    ( 'OTI', 'Oficina de Tecnologia de la Informacion', 'Activo'),
    ( 'OPP', 'Oficina de Planeamiento y Presupuesto', 'Activo');

-- insertar registros - tabla Empleado
INSERT INTO Empleado (nombre, apellido, email, fechaNac, direccion, tipoEmp, codDepartamento)
VALUES
    ('Juan Miguel', 'Pérez', 'juan.perez@email.com', '1990-05-15', 'Calle 123', 'Tecnico', 1),
    ('María Mercedes', 'Gómez', 'maria.gomez@email.com', '1988-08-22', 'Avenida 456', 'Secretaria', 1),
    ('Carlos', 'Rodríguez', 'carlos.rodriguez@email.com', '1995-02-10', 'Calle 789', 'Asistente', 2),
    ('Laura Roxana', 'Fernández Pereira', 'laura.fernandez@email.com', '1992-11-30', 'Avenida 1011', 'Tecnico', 3),
    ('Pedro Josue', 'López', 'pedro.lopez@email.com', '1985-07-05', 'Calle 1213', 'Tecnico', 4),
    ('Ana Paula', 'Martínez Solar', 'ana.martinez@email.com', '1993-04-18', 'Avenida 1415', 'Tecnico', 1),
    ('Miguel Angel', 'González Prado', 'miguel.gonzalez@email.com', '1998-01-25', 'Calle 1617', 'Desarrollador', 3),
    ('Isabel', 'Díaz Martinez', 'isabel.diaz@email.com', '1987-06-08', 'Avenida 1819', 'Secretaria', 2),
    ('Francisco Javier', 'Hernández', 'javier.hernandez@email.com', '1991-09-12', 'Calle 2021', 'Desarrollador', 1),
    ('Carmen Lorena', 'Ruiz Ruiz', 'carmen.ruiz@email.com', '1989-03-04', 'Avenida 2223', 'Analista', 4);

-- insertar registros - tabla INCIDENCIA
INSERT INTO incidencia (descripcion, fechaRegistro, nivelPrioridad, categoria, estado, codEmpleado)
VALUES 
('Error en la aplicación móvil', '2015-01-15 10:30:00', 'Alto', "Tecnologico", "Procesada", 9),
('Problema con la red local', '2016-03-22 09:15:00', 'Medio', "No Tecnologico", "No Procesada", 2),
('Fallo en la impresora', '2017-05-10 14:20:00', 'Bajo', "Alerta Externa", "Procesada", 3),
('Incidente de seguridad informática', '2018-07-18 16:45:00', 'Alto', "No Tecnologico", "No Procesada", 2),
('Falla en el servidor de correo', '2019-09-25 08:00:00', 'Alto', "Tecnologico", "Procesada", 3),
('Problema con la conexión VPN', '2020-11-03 11:30:00', 'Medio', "Alerta Externa", "Procesada", 4),
('Solicitud de asistencia técnica', '2021-02-14 13:10:00', 'Bajo', "Tecnologico", "No Procesada", 2),
('Error en el software de contabilidad', '2022-04-30 17:00:00', 'Medio', "No Tecnologico", "Procesada", 4),
('Acceso no autorizado al sistema', '2023-06-08 10:20:00', 'Alto', "Tecnologico", "No Procesada", 3),
('Interrupción del servicio web', '2023-07-20 09:45:00', 'Alto', "Tecnologico", "Procesada", 2),
('Problema con la aplicación de usuario', '2023-08-12 14:55:00', 'Medio', "Alerta Externa", "Procesada", 5),
('Problema de conectividad a la base de datos', '2023-09-05 12:30:00', 'Alto', "Tecnologico", "Procesada", 2),
('Ataque de phishing', '2023-10-01 18:20:00', 'Alto', "Tecnologico", "Procesada", 2),
('Solicitud de actualización de software', '2022-10-25 15:40:00', 'Bajo', "Tecnologico", "Procesada", 3),
('Problema en la base de datos principal', '2023-11-07 10:00:00', 'Medio', "No Tecnologico", "Procesada", 2),
('Fallo en la fotocopiadora', '2023-11-15 11:15:00', 'Bajo', "Tecnologico", "Procesada", 3),
('Violación de seguridad de datos', '2022-11-22 13:25:00', 'Alto', "Tecnologico", "Procesada", 7),
('Error crítico en el sistema operativo', '2020-12-03 16:05:00', 'Alto', "Alerta Externa", "Procesada", 2),
('Problema con el correo electrónico corporativo', '2023-12-15 09:30:00', 'Medio', "Tecnologico", "No Procesada", 3),
('Solicitud de mantenimiento de hardware', '2023-12-28 14:00:00', 'Bajo', "No Tecnologico", "Procesada", 2);

-- insertar registros - tabla ATENCION
INSERT INTO Atencion (acciones, fechaAtencion, presupuesto, detallePresupuesto, observaciones, codEmpleado, codIncidencia) VALUES
('Reiniciar servidor', '2023-06-01 10:00:00', 200.00, 'Costo de reinicio', 'Ninguna', 6, 1),
('Reparar base de datos', '2023-06-11 14:30:00', 500.00, 'Costo de reparación', 'Urgente', 4, 2),
('Actualizar sistema', '2023-06-16 09:00:00', 300.00, 'Costo de actualización', 'Programado', 5, 3);
-- nueva atención de ejemplo
INSERT INTO atencion (acciones, fechaAtencion, presupuesto, detallePresupuesto, observaciones, codEmpleado, codIncidencia)
VALUES ('Reparación de equipo de red', '2024-06-27 10:30:00', 500.00, 'Reparación y cambio de cables de red', 'Equipo restablecido y en funcionamiento.', 1, 1);
--  otra atención de ejemplo
INSERT INTO atencion (acciones, fechaAtencion, presupuesto, detallePresupuesto, observaciones, codEmpleado, codIncidencia)
VALUES ('Instalación de software actualizado', '2024-06-28 14:00:00', 300.00, 'Instalación de software y configuración inicial.', 'Software funcionando correctamente.', 4, 2);

-- vistas contenido tablas
SELECT * FROM DEPARTAMENTO;
SELECT * FROM EMPLEADO;
SELECT * FROM INCIDENCIA;
SELECT * FROM ATENCION;