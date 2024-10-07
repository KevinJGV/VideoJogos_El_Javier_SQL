CREATE DATABASE IF NOT EXISTS `Videojuegos_El_Javier`;

USE Videojuegos_El_Javier;

CREATE Table PuestosTrabajo (
    ID_PuestoTrabajo INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(64) NOT NULL UNIQUE
)

CREATE Table Empleados (
    ID_Empleado INT PRIMARY KEY AUTO_INCREMENT,
    ID_PuestoTrabajo INT NOT NULL,
    Nombre VARCHAR(128) NOT NULL,
    Apellido VARCHAR(128) NOT NULL,
    Fecha_Contratacion DATE NOT NULL,
    Foreign Key (ID_PuestoTrabajo) REFERENCES PuestosTrabajo (ID_PuestoTrabajo)
)

CREATE Table Clientes (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Completo VARCHAR(256) NOT NULL,
    Correo_Electronico VARCHAR(128) NOT NULL UNIQUE,
    Direccion VARCHAR(128) NOT NULL,
    Telefono INT NOT NULL UNIQUE
)

CREATE Table Ventas (
    ID_Venta INT PRIMARY KEY AUTO_INCREMENT,
    ID_Empleado INT NOT NULL,
    ID_Cliente INT NOT NULL,
    Fecha DATE NOT NULL,
    Valor_Total INT NOT NULL,
    Foreign Key (ID_Empleado) REFERENCES Empleados (ID_Empleado),
    Foreign Key (ID_Cliente) REFERENCES Clientes (ID_Cliente)
)

CREATE Table Categorias (
    ID_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(128) NOT NULL UNIQUE
)

CREATE Table Proovedores (
    ID_Proovedor INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Empresa VARCHAR(128) NOT NULL,
    Nombre_Contacto VARCHAR(128) NOT NULL,
    Telefono INT NOT NULL,
    Direccion VARCHAR(128) NOT NULL
)

CREATE Table Compras_Proovedores (
    ID_Compra INT PRIMARY KEY AUTO_INCREMENT,
    ID_Proovedor INT NOT NULL,
    Fecha DATE NOT NULL,
    Valor_Total INT NOT NULL,
    Foreign Key (ID_Proovedor) REFERENCES Proovedores (ID_Proovedor)
)