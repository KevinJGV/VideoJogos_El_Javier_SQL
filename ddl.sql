CREATE DATABASE IF NOT EXISTS `Videojuegos_El_Javier`;

CREATE TABLE IF NOT EXISTS Generos (
    ID_Genero PRIMARY KEY INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Plataformas (
    ID_Plataforma PRIMARY KEY INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Clasificaciones (
    ID_Clasificación PRIMARY KEY INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Colores (
    ID_Color PRIMARY KEY INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Videojuegos (
    ID_Videojuegos PRIMARY KEY INT NOT NULL,
    ID_Producto INT NOT NULL UNIQUE,
    ID_Genero INT NOT NULL,
    ID_Plataforma INT NOT NULL,
    ID_Clasificación INT NOT NULL,
    FOREIGN KEY ID_Producto REFERENCES Productos (ID_Producto),
    FOREIGN KEY ID_Genero REFERENCES Generos (ID_Genero),
    FOREIGN KEY ID_Plataforma REFERENCES Plataformas (ID_Plataforma),
    FOREIGN KEY ID_Clasificación REFERENCES Clasificaciones (ID_Clasificación)
);

CREATE TABLE IF NOT EXISTS Consolas_&_Accesorios (
    ID_Consolas_&_Accesorios PRIMARY KEY INT NOT NULL,
    ID_Producto INT NOT NULL UNIQUE,
    ID_Color INT NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    FOREIGN KEY ID_Producto REFERENCES Productos (ID_Producto),
    FOREIGN KEY ID_Color REFERENCES Colores (ID_Color)
);