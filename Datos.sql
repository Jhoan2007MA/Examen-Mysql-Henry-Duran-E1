--1. Primero vamos a crear nuestra base de Datos que sera inmobilaria--
-- y la seleccionamos.--

CREATE DATABASE inmobilaria;
USE inmobilaria;

--2. Procedemos a creear las tablas necesarias--

CREATE TABLE tipo_propiedad (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE propiedad (
    id_propiedad INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(150) NOT NULL,
    id_tipo INT NOT NULL,
    precio DECIMAL(12,2) NOT NULL,
    estado ENUM('disponible','arrendada','vendida') NOT NULL,
    FOREIGN KEY (id_tipo) REFERENCES tipo_propiedad(id_tipo)
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20)
);

CREATE TABLE agente (
    id_agente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    porcentaje_comision DECIMAL(5,2) NOT NULL
);

CREATE TABLE contrato (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_propiedad INT NOT NULL,
    id_cliente INT NOT NULL,
    id_agente INT NOT NULL,
    tipo ENUM('venta','arriendo') NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    valor_total DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (id_propiedad) REFERENCES propiedad(id_propiedad),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_agente) REFERENCES agente(id_agente)
);

CREATE TABLE pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_contrato INT NOT NULL,
    fecha_pago DATE NOT NULL,
    monto DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (id_contrato) REFERENCES contrato(id_contrato)
);