CREATE DATABASE IF NOT EXISTS `Videojuegos_El_Javier`;

USE Videojuegos_El_Javier;

CREATE TABLE IF NOT EXISTS Generos (
    ID_Genero INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Plataformas (
    ID_Plataforma INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Clasificaciones (
    ID_Clasificación INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Colores (
    ID_Color INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE Table IF NOT EXISTS PuestosTrabajo (
    ID_PuestoTrabajo INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(64) NOT NULL UNIQUE
)

CREATE Table IF NOT EXISTS Empleados (
    ID_Empleado INT PRIMARY KEY AUTO_INCREMENT,
    ID_PuestoTrabajo INT NOT NULL,
    Nombre VARCHAR(128) NOT NULL,
    Apellido VARCHAR(128) NOT NULL,
    Fecha_Contratacion DATE NOT NULL,
    Foreign Key (ID_PuestoTrabajo) REFERENCES PuestosTrabajo (ID_PuestoTrabajo)
)

CREATE Table IF NOT EXISTS Clientes (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Completo VARCHAR(256) NOT NULL,
    Correo_Electronico VARCHAR(128) NOT NULL UNIQUE,
    Direccion VARCHAR(128) NOT NULL,
    Telefono INT NOT NULL UNIQUE
)

CREATE Table IF NOT EXISTS Ventas (
    ID_Venta INT PRIMARY KEY AUTO_INCREMENT,
    ID_Empleado INT NOT NULL,
    ID_Cliente INT NOT NULL,
    Fecha DATE NOT NULL,
    Valor_Total INT NOT NULL,
    Foreign Key (ID_Empleado) REFERENCES Empleados (ID_Empleado),
    Foreign Key (ID_Cliente) REFERENCES Clientes (ID_Cliente)
)

CREATE Table IF NOT EXISTS Categorias (
    ID_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(128) NOT NULL UNIQUE
)

CREATE Table IF NOT EXISTS Proovedores (
    ID_Proovedor INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Empresa VARCHAR(128) NOT NULL,
    Nombre_Contacto VARCHAR(128) NOT NULL,
    Telefono INT NOT NULL,
    Direccion VARCHAR(128) NOT NULL
)

CREATE Table IF NOT EXISTS Compras_Proovedores (
    ID_Compra INT PRIMARY KEY AUTO_INCREMENT,
    ID_Proovedor INT NOT NULL,
    Fecha DATE NOT NULL,
    Valor_Total INT NOT NULL,
    Foreign Key (ID_Proovedor) REFERENCES Proovedores (ID_Proovedor)
)

CREATE Table IF NOT EXISTS Productos (
    ID_Producto INT PRIMARY KEY AUTO_INCREMENT,
    ID_Proveedor INT NOT NULL,
    ID_Categoria INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Descripcción VARCHAR(255) NOT NULL,
    Precio INT NOT NULL,
    Stock_disponible INT NOT NULL,
    Foreign Key (ID_Proveedor) REFERENCES Proovedores (ID_Proovedor),
    Foreign Key (ID_Categoria) REFERENCES Categorias (ID_Categoria)
)

CREATE TABLE IF NOT EXISTS Videojuegos (
    ID_Videojuegos INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ID_Producto INT NOT NULL UNIQUE,
    ID_Genero INT NOT NULL,
    ID_Plataforma INT NOT NULL,
    ID_Clasificación INT NOT NULL,
    FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto),
    FOREIGN KEY (ID_Genero) REFERENCES Generos (ID_Genero),
    FOREIGN KEY (ID_Plataforma) REFERENCES Plataformas (ID_Plataforma),
    FOREIGN KEY (ID_Clasificación) REFERENCES Clasificaciones (ID_Clasificación)
);

CREATE TABLE IF NOT EXISTS Consolas_Accesorios (
    ID_Consolas_Accesorios INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ID_Producto INT NOT NULL UNIQUE,
    ID_Color INT NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto),
    FOREIGN KEY (ID_Color) REFERENCES Colores (ID_Color)
);

CREATE Table IF NOT EXISTS Detalle_Compras_Proovedores (
    ID_Detalle INT PRIMARY KEY AUTO_INCREMENT,
    ID_Producto INT NOT NULL,
    ID_Compra INT NOT NULL,
    Cantidad INT NOT NULL,
    Subtotal INT NOT NULL,
    Foreign Key (ID_Producto) REFERENCES Productos (ID_Producto),
    Foreign Key (ID_Compra) REFERENCES Compras_Proovedores (ID_Compra)
)

CREATE Table IF NOT EXISTS Detalle_Ventas (
    ID_Detalle INT PRIMARY KEY AUTO_INCREMENT,
    ID_Venta INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL,
    Subtotal INT NOT NULL,
    Foreign Key (ID_Producto) REFERENCES Productos (ID_Producto),
    Foreign Key (ID_Venta) REFERENCES Ventas (ID_Venta)
)