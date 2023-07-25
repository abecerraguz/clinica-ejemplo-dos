CREATE DATABASE "Clinica_Postgres"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8';

CREATE DOMAIN ID_PACIENTE AS CHAR(6) NOT NULL
	CHECK (VALUE ~ '^[P]{1}[-]{1}\d{4}$'); 

CREATE DOMAIN ID_MEESPECIALISTA AS CHAR(7) NOT NULL
	CHECK (VALUE ~ '^[ME]{2}[-]{1}\d{4}$');
	
CREATE DOMAIN ID_CITA AS CHAR(7) NOT NULL
	CHECK (VALUE ~ '^[CM]{2}[-]{1}\d{4}$'); 


CREATE TABLE PACIENTE (
	pk_idPaciente ID_PACIENTE,
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	sexo CHAR(1) NOT NULL,
	fechaNacimiento DATE NOT NULL,
	ciudad VARCHAR(20) NOT NULL,
	estado VARCHAR(20) NOT NULL,
	telefono CHAR(10) UNIQUE,
	PRIMARY KEY (pk_idPaciente)
);

CREATE TABLE ESPECIALISTA(
	pk_idEspecialista ID_MEESPECIALISTA,
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	sexo CHAR(1) NOT NULL,
	fechaNacimiento DATE NOT NULL,
	especialidad VARCHAR(30) NOT NULL,
	PRIMARY KEY (pk_idEspecialista)
);

CREATE TABLE EXPEDIENTE (
	pk_idPaciente ID_PACIENTE,
	tipoSangre VARCHAR(10) NOT NULL,
	tipoAlergia VARCHAR(50) NOT NULL,
	padecimientoCro VARCHAR(50) NOT NULL,
	fechaCreacion TIMESTAMP NOT NULL,
	PRIMARY KEY (pk_idPaciente),
	FOREIGN KEY (pk_idPaciente) REFERENCES PACIENTE(pk_idPaciente)
	ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE EXPEDIENTE_DIAGNOSTICO(
	folio SERIAL NOT NULL,
	fk_idEspecialista ID_MEESPECIALISTA,
	fk_idPaciente ID_PACIENTE,
	edad CHAR(3) NOT NULL,
	peso CHAR(3) NOT NULL,
	altura CHAR(4) NOT NULL,
	IMC CHAR(5) NOT NULL,
	nivelPeso CHAR(10) NOT NULL,
	presionArterial CHAR(8) NOT NULL,
	diagnostico VARCHAR(150) NOT NULL,
	recetario VARCHAR(150) NOT NULL,
	fechaCreacion TIMESTAMP NOT NULL,
	PRIMARY KEY (folio),
	FOREIGN KEY (fk_idEspecialista) REFERENCES ESPECIALISTA(pk_idEspecialista)
	ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (fk_idPaciente) REFERENCES EXPEDIENTE(pk_idPaciente)
	ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE CITA (
	pk_idCita ID_CITA,
	fk_idPaciente ID_PACIENTE,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	PRIMARY KEY (pk_idCita),
	FOREIGN KEY (fk_idPaciente) REFERENCES PACIENTE(pk_idPaciente)
	ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE AGENDAR_CITA(
	fk_idCita ID_CITA,
	fk_idEspecialista ID_MEESPECIALISTA,
	consultario VARCHAR(20) NOT NULL,
	fechaCita DATE NOT NULL,
	horaCita TIME NOT NULL,
	turno VARCHAR(10) NOT NULL,
	status VARCHAR(10) NOT NULL,
	observaciones VARCHAR(100) NOT NULL,
	PRIMARY KEY (fk_idCIta, fk_idEspecialista),
	FOREIGN KEY (fk_idCita) REFERENCES CITA (pk_idCita)
	ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (fk_idEspecialista) REFERENCES ESPECIALISTA(pk_idEspecialista)
	ON UPDATE CASCADE ON DELETE CASCADE
);

--INSERTAR DATOS DE PACIENTE

INSERT INTO PACIENTES VALUES 
('P-0001', 'DANIEL', 'CARMONA', 'M', '1998-12-07', 'MEXICO', 'MEXICO', '551234567'),
('P-0002', 'JUAN', 'HERNANDEZ', 'M', '1990-07-21', 'MONTERREY', 'NUEVO LEON', '551234321'),
('P-0003', 'FERNANDA', 'MORALES', 'F', '1973-07-01', 'MEXICO', 'MEXICO', '5412309872'),
('P-0004', 'ANDREA', 'ZUÑIGA', 'F', '2000-12-02', 'GUADALAJARA', 'JALISCO', '3309876522'),
('P-0005', 'ALBERTO', 'PEREYRA', 'M', '1986-10-23', 'MEXICO', 'MEXICO', '5565423983'),
('P-0006', 'KAREN', 'SOTO', 'F', '1978-07-07', 'MEXICO', 'MEXICO', '5565423097'),
('P-0007', 'ANDRES', 'ORTIZ', 'M','1990-10-09', 'MONTERREY', 'MEXICO', '5698782347'),
('P-0008', 'LESLY', 'RODRIGUEZ', 'F', '2001-02-11', 'MEXICO', 'MEXICO', '5543454352'),
('P-0009', 'ENRIQUE', 'VERA', 'M', '1996-11-12', 'GUADALAJARA', 'JALISCO', '3309815273'),
('P-0010', 'VICTORIA', 'SOLIS', 'F', '2002-03-10', 'MEXICO', 'MEXICO', '5565278126');

[
    {
        "pk_idPaciente": "P-0001",
        "nombre": "DANIEL",
        "apellido": "CARMONA",
        "sexo": "M",
        "fechaNacimiento": "1998-12-07",
        "ciudad": "MEXICO",
        "estado": "MEXICO",
        "telefono": "551234567"
    },
    {
        "pk_idPaciente": "P-0002",
        "nombre": "JUAN",
        "apellido": "HERNANDEZ",
        "sexo": "M",
        "fechaNacimiento": "1990-07-21",
        "ciudad": "MONTERREY",
        "estado": "NUEVO LEON",
        "telefono": "551234321"
    },
    {
        "pk_idPaciente": "P-0003",
        "nombre": "FERNANDA",
        "apellido": "MORALES",
        "sexo": "F",
        "fechaNacimiento": "1973-07-01",
        "ciudad": "MEXICO",
        "estado": "MEXICO",
        "telefono": "5412309872"
    },
    {
        "pk_idPaciente": "P-0004",
        "nombre": "ANDREA",
        "apellido": "ZUÑIGA",
        "sexo": "F",
        "fechaNacimiento": "2000-12-02",
        "ciudad": "GUADALAJARA",
        "estado": "JALISCO",
        "telefono": "3309876522"
    },
    {
        "pk_idPaciente": "P-0005",
        "nombre": "ALBERTO",
        "apellido": "PEREYRA",
        "sexo": "M",
        "fechaNacimiento": "1986-10-23",
        "ciudad": "MEXICO",
        "estado": "MEXICO",
        "telefono": "5565423983"
    },
    {
        "pk_idPaciente": "P-0006",
        "nombre": "KAREN",
        "apellido": "SOTO",
        "sexo": "F",
        "fechaNacimiento": "1978-07-07",
        "ciudad": "MEXICO",
        "estado": "MEXICO",
        "telefono": "5565423097"
    },
    {
        "pk_idPaciente": "P-0007",
        "nombre": "ANDRES",
        "apellido": "ORTIZ",
        "sexo": "M",
        "fechaNacimiento": "1990-10-09",
        "ciudad": "MONTERREY",
        "estado": "MEXICO",
        "telefono": "5698782347"
    },
    {
        "pk_idPaciente": "P-0008",
        "nombre": "LESLY",
        "apellido": "RODRIGUEZ",
        "sexo": "F",
        "fechaNacimiento": "2001-02-11",
        "ciudad": "MEXICO",
        "estado": "MEXICO",
        "telefono": "5543454352"
    }
    {
        "pk_idPaciente": "P-0009",
        "nombre": "ENRIQUE",
        "apellido": "VERA",
        "sexo": "M",
        "fechaNacimiento": "1996-11-12",
        "ciudad": "GUADALAJARA",
        "estado": "JALISCO",
        "telefono": "3309815273"
    },
    {
        "pk_idPaciente": "P-0010",
        "nombre": "VICTORIA",
        "apellido": "SOLIS",
        "sexo": "F",
        "fechaNacimiento": "2002-03-10",
        "ciudad": "MEXICO",
        "estado": "MEXICO",
        "telefono": "5565278126"
    }
]


--INSERTAR DATOS DE ESPECIALISTA

INSERT INTO CLINICA.ESPECIALISTA VALUES 
('ME-0001', 'REYNA', 'GUADALUPE', 'F', '1986-01-01', 'MEDICO GENERAL'),
('ME-0002', 'ENRIQUE', 'ORTIZ', 'M', '1968-10-01', 'NEFROLOGIA'),
('ME-0003', 'FELIPE', 'HERNANDEZ', 'M', '1980-10-02', 'MEDICO GENERAL'),
('ME-0004', 'KENIA', 'LOPEZ', 'F', '1973-01-01', 'PEDIATRA'),
('ME-0005', 'JUAN', 'MARTINEZ', 'M', '1980-02-23', 'MEDICO GENERAL');

[
 
    {
        "pk_idEspecialista": "ME-0001",
        "nombre": "REYNA",
        "apellido": "GUADALUPE",
        "sexo": "F",
        "fechaNacimiento": "1986-01-01",
        "especialidad": "MEDICO GENERAL"
    },
    {
        "pk_idEspecialista": "ME-0002",
        "nombre": "ENRIQUE",
        "apellido": "ORTIZ",
        "sexo": "M",
        "fechaNacimiento": "1968-10-01",
        "especialidad": "NEFROLOGIA"
    },
    {
        "pk_idEspecialista": "ME-0003",
        "nombre": "FELIPE",
        "apellido": "HERNANDEZ",
        "sexo": "M",
        "fechaNacimiento": "1980-10-02",
        "especialidad": "MEDICO GENERAL"
    },
    {
        "pk_idEspecialista": "ME-0004",
        "nombre": "KENIA",
        "apellido": "LOPEZ",
        "sexo": "F",
        "fechaNacimiento": "1973-01-01",
        "especialidad": "PEDIATRA"
    },
    {
        "pk_idEspecialista": "ME-0005",
        "nombre": "JUAN",
        "apellido": "MARTINEZ",
        "sexo": "M",
        "fechaNacimiento": "1980-02-23",
        "especialidad": "MEDICO GENERAL"
    }
]

--INSERTAR DATOS DE CITA

INSERT INTO CLINICA.CITA VALUES 
('CM-0001', 'P-0001', '2022-10-01', '12:00'),
('CM-0002', 'P-0002', '2022-10-01', '12:20'),
('CM-0003', 'P-0003', '2022-10-02', '12:20'),
('CM-0004', 'P-0004', '2022-10-02', '10:00'),
('CM-0005', 'P-0005', '2022-10-03', '08:20'),
('CM-0006', 'P-0006', '2022-10-03', '12:20'),
('CM-0007', 'P-0007', '2022-10-04', '12:20'),
('CM-0008', 'P-0008', '2022-10-04', '10:00'),
('CM-0009', 'P-0009', '2022-10-04', '08:20'),
('CM-0010', 'P-0010', '2022-10-05', '08:20');

--INSERTAR DATOS DE AGENDAR CITA

INSERT INTO CLINICA.AGENDAR_CITA VALUES 
('CM-0001', 'ME-0001', 'CONSULTORIO 1', '2022-10-04', '12:00', 'MATUTINO', 'ESPERA', 'NA'),
('CM-0002', 'ME-0001', 'CONSULTORIO 1', '2022-10-04', '12:20', 'MATUTINO', 'ESPERA', 'NA'),
('CM-0003', 'ME-0002', 'CONSULTORIO 2', '2022-10-05', '12:00', 'MATUTINO', 'ESPERA', 'NA'),
('CM-0004', 'ME-0002', 'CONSULTORIO 2', '2022-10-05', '12:00', 'MATUTINO', 'ESPERA', 'NA'),
('CM-0005', 'ME-0003', 'CONSULTORIO 3', '2022-10-06', '12:00', 'MATUTINO', 'ESPERA', 'NA'),
('CM-0006', 'ME-0003', 'CONSULTORIO 3', '2022-10-07', '14:00', 'VESPERTINO', 'ESPERA', 'NA'),
('CM-0007', 'ME-0003', 'CONSULTORIO 3', '2022-10-07', '14:20', 'VESPERTINO', 'ESPERA', 'NA'),
('CM-0008', 'ME-0004', 'CONSULTORIO 4', '2022-10-08', '13:00', 'VESPERTINO', 'ESPERA', 'NA'),
('CM-0009', 'ME-0004', 'CONSULTORIO 4', '2022-10-08', '13:20', 'VESPERTINO', 'ESPERA', 'NA'),
('CM-0010', 'ME-0005', 'CONSULTORIO 5', '2022-10-08', '15:00', 'VESPERTINO', 'ESPERA', 'NA');


--INSERTAR DATOS DE EXPEDIENTE

INSERT INTO CLINICA.EXPEDIENTE VALUES
('P-0001', 'B POSITIVO', 'NA', 'NA', '2022-06-10'),
('P-0002', 'B NEGATIVO', 'ALERGIA AL POLVO', 'NA', '2022-06-10'),
('P-0003', 'O NEGATIVO', 'NA', 'DIABETES', '2022-06-14'),
('P-0004', 'B POSITIVO', 'ALERGIA A LOS MARISCOS', 'ASMA', '2022-06-15'),
('P-0005', 'B POSITIVO', 'NA', 'DIABETES', '2022-06-16'),
('P-0006', 'B POSITIVO', 'ALERGIA AL POLVO', 'NA', '2022-06-17'),
('P-0007', 'B POSITIVO', 'NA', 'CANCER', '2022-06-20'),
('P-0008', 'B POSITIVO', 'NA', 'NA', '2022-06-24'),
('P-0009', 'B POSITIVO', 'NA', 'NA', '2022-07-02'),
('P-0010', 'B POSITIVO', 'NA', 'NA', '2022-07-06');

--INSERTAR DATOS DE EXPEDIENTE
[
    
    {
       "pk_idPaciente": "P-0001",
       "tipoSangre": "B POSITIVO",
       "tipoAlergia": "NA",
       "padecimientoCro": "NA",
       "fechaCreacion": "2022-06-10"
    },
  
    {
       "pk_idPaciente": "P-0002",
       "tipoSangre": "B NEGATIVO",
       "tipoAlergia": "ALERGIA AL POLVO",
       "padecimientoCro": "NA",
       "fechaCreacion": "2022-06-10"
    },  

    {
         "pk_idPaciente": "P-0003",
         "tipoSangre": "O NEGATIVO",
         "alergias": "NA",
         "enfermedades": "DIABETES",
         "fechaCreacion": "2022-06-14"
    },

    {
         "pk_idPaciente": "P-0004",
         "tipoSangre": "B POSITIVO",
         "alergias": "ALERGIA A LOS MARISCOS",
         "enfermedades": "ASMA",
         "fechaCreacion": "2022-06-15"
    },
  
    {
         "pk_idPaciente": "P-0005",
         "tipoSangre": "B POSITIVO",
         "alergias": "NA",
         "enfermedades": "DIABETES",
         "fechaCreacion": "2022-06-16"
    },

    {
        "pk_idPaciente": "P-0006",
        "tipoSangre": "B POSITIVO",
        "alergias": "ALERGIA AL POLVO",
        "enfermedades": "NA",
        "fechaCreacion": "2022-06-17"
    },

    {
        "pk_idPaciente": "P-0007",
        "tipoSangre": "B POSITIVO",
        "alergias": "NA",
        "enfermedades": "CANCER",
        "fechaCreacion": "2022-06-20"
    },

    {
        "pk_idPaciente": "P-0008",
        "tipoSangre": "B POSITIVO",
        "alergias": "NA",
        "enfermedades": "NA",
        "fechaCreacion": "2022-06-24"
    },
    {
        "pk_idPaciente": "P-0009",
        "tipoSangre": "B POSITIVO",
        "alergias": "NA",
        "enfermedades": "NA",
        "fechaCreacion": "2022-07-02"
    },
    {
        "pk_idPaciente": "P-0010",
        "tipoSangre": "B POSITIVO",
        "alergias": "NA",
        "enfermedades": "NA",
        "fechaCreacion": "2022-07-06"
    }
    
]


--INSERTAR DATOS DE EXPEDIENTE_DIAGNOSTICO
INSERT INTO CLINICA.EXPEDIENTE_DIAGNOSTICO 
(fk_idespecialista, fk_idpaciente, edad, peso, altura, imc, nivelpeso, presionarterial, diagnostico, recetario, fechacreacion)
VALUES 
('ME-0001', 'P-0001', '24', '70', '1.70', '24.0', 'NORMAL', '120/70', 'NA', 'NA', '2022-11-22'),
('ME-0001', 'P-0002', '33', '80', '1.77', '27.0', 'SOBREPESO', '125/73', 'NA', 'NA', '2022-11-23'),
('ME-0001', 'P-0003', '45', '62', '1.64', '26.6', 'NORMAL', '130/70', 'NA', 'NA', '2022-11-24'),
('ME-0002', 'P-0003', '45', '62', '1.64', '26.6', 'NORMAL', '129/70', 'NA', 'NA', '2022-11-24'),
('ME-0002', 'P-0004', '23', '65', '1.60', '23.0', 'NORMAL', '125/70', 'NA', 'NA', '2022-11-25'),
('ME-0003', 'P-0005', '37', '90', '1.77', '29.0', 'OBESIDAD', '129/80', 'NA', 'NA', '2022-11-25'),
('ME-0003', 'P-0005', '37', '90', '1.77', '29.0', 'OBESIDAD', '128/78', 'NA', 'NA', '2022-11-25'),
('ME-0003', 'P-0006', '46', '72', '1.68', '24.0', 'NORMAL', '120/69', 'NA', 'NA', '2022-11-26'),
('ME-0003', 'P-0007', '31', '76', '1.77', '24.0', 'NORMAL', '125/73', 'NA', 'NA', '2022-11-27'),
('ME-0004', 'P-0007', '31', '76', '1.77', '24.0', 'NORMAL', '125/67', 'NA', 'NA', '2022-11-27'),
('ME-0004', 'P-0008', '21', '68', '1.63', '24.0', 'NORMAL', '119/69', 'NA', 'NA', '2022-11-29'),
('ME-0005', 'P-0009', '26', '90', '1.75', '29.0', 'SOBREPESO', '132/76', 'NA', 'NA', '2022-12-01'),
('ME-0005', 'P-0009', '26', '90', '1.75', '29.0', 'SOBREPESO', '130/74', 'NA', 'NA', '2022-12-01'),
('ME-0005', 'P-0010', '18', '60', '1.59', '23.0', 'NORMAL', '120/68', 'NA', 'NA', '2022-12-02'),
('ME-0005', 'P-0010', '18', '60', '1.59', '23.0', 'NORMAL', '119/65', 'NA', 'NA', '2022-12-02');

--CONSULTAS
SELECT * FROM CLINICA.PACIENTE;
SELECT * FROM CLINICA.ESPECIALISTA;
SELECT * FROM CLINICA.CITA;
SELECT * FROM CLINICA.AGENDAR_CITA;
SELECT * FROM CLINICA.EXPEDIENTE;
SELECT * FROM CLINICA.EXPEDIENTE_DIAGNOSTICO;
