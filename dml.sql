-- Inserciones en la tabla Generos
INSERT INTO
    Generos (Nombre)
VALUES
    ('Acción'),
    ('Aventura'),
    ('Deportes'),
    ('Estrategia'),
    ('Simulación'),
    ('RPG');

-- Inserciones en la tabla Plataformas
INSERT INTO
    Plataformas (Nombre)
VALUES
    ('PC'),
    ('PS5'),
    ('Nintendo Switch'),
    ('Xbox Series X'),
    ('PS4'),
    ('Xbox One');

-- Inserciones en la tabla Clasificaciones
INSERT INTO
    Clasificaciones (Nombre)
VALUES
    ('E'),
    ('T'),
    ('M'),
    ('E10+'),
    ('AO'),
    ('EC');

-- Inserciones en la tabla Colores
INSERT INTO
    Colores (Nombre)
VALUES
    ('Negro'),
    ('Blanco'),
    ('Rojo'),
    ('Azul'),
    ('Verde'),
    ('Amarillo');

-- Inserción en la tabla PuestosTrabajo
INSERT INTO
    PuestosTrabajo (Nombre)
VALUES
    ('Vendedor');

-- Inserciones en la tabla Categorias
INSERT INTO
    Categorias (Nombre)
VALUES
    ('Videojuego'),
    ('Consola'),
    ('Accesorio');

-- Inserciones en la tabla Proveedores
INSERT INTO
    Proveedores (
        Nombre_Empresa,
        Nombre_Contacto,
        Telefono,
        Direccion
    )
VALUES
    (
        'GameStore S.A.',
        'Carlos Pérez',
        1234567890,
        'Av. Gamer 123'
    ),
    (
        'TechWorld Ltd.',
        'Ana Martínez',
        9876543210,
        'Calle Tecnología 456'
    ),
    (
        'Digital Games LLC',
        'Juan Rodríguez',
        1231231234,
        'Calle Digital 789'
    ),
    (
        'Mega Consoles',
        'Pedro García',
        3213213210,
        'Calle Consolas 101'
    ),
    (
        'Accesorios Plus',
        'Lucía Gómez',
        4564564560,
        'Calle Accesorios 202'
    ),
    (
        'Gaming Pro',
        'Elena Ruiz',
        7897897890,
        'Calle Gamer 303'
    );

-- Inserciones en la tabla Productos
INSERT INTO
    Productos (
        ID_Proveedor,
        ID_Categoria,
        Nombre,
        Descripcción,
        Precio,
        Stock_disponible
    )
VALUES
    (
        1,
        1,
        'FIFA 24',
        'Videojuego de deportes para PS5',
        50000,
        10
    ),
    (
        2,
        2,
        'PS5',
        'Consola de videojuegos PlayStation 5',
        2000000,
        5
    ),
    (
        3,
        1,
        'Zelda: Breath of the Wild',
        'Juego de aventura para Nintendo Switch',
        60000,
        8
    ),
    (
        4,
        3,
        'Control Xbox Series X',
        'Accesorio para consola Xbox Series X',
        150000,
        12
    ),
    (
        5,
        1,
        'Call of Duty: Modern Warfare',
        'Videojuego de acción para PS4',
        45000,
        7
    ),
    (
        6,
        3,
        'Audífonos Gamer',
        'Accesorio gamer con micrófono',
        80000,
        15
    );

-- Inserciones en la tabla Videojuegos
INSERT INTO
    Videojuegos (
        ID_Producto,
        ID_Genero,
        ID_Plataforma,
        ID_Clasificación
    )
VALUES
    (1, 3, 2, 2),
    (3, 2, 3, 1),
    (5, 1, 5, 3);

-- Inserciones en la tabla Consolas_Accesorios
INSERT INTO
    Consolas_Accesorios (ID_Producto, ID_Color, Modelo)
VALUES
    (2, 2, 'PS5 Standard Edition'),
    (4, 1, 'Xbox Series X Controller'),
    (6, 3, 'Audífonos Pro Gamer');

-- Inserciones en la tabla Empleados
INSERT INTO
    Empleados (
        ID_PuestoTrabajo,
        Nombre,
        Apellido,
        Fecha_Contratacion
    )
VALUES
    (1, 'Juan', 'Gómez', '2022-05-15'),
    (1, 'María', 'Rodríguez', '2023-03-20'),
    (1, 'Carlos', 'López', '2023-01-10'),
    (1, 'Ana', 'Martínez', '2021-12-01'),
    (1, 'Pedro', 'Pérez', '2022-10-22'),
    (1, 'Lucía', 'Fernández', '2023-07-18');

-- Inserciones en la tabla Clientes
INSERT INTO
    Clientes (
        Nombre_Completo,
        Correo_Electronico,
        Direccion,
        Telefono
    )
VALUES
    (
        'Luis Castro',
        'luis.castro@example.com',
        'Calle 123',
        3101234567
    ),
    (
        'Sara Muñoz',
        'sara.munoz@example.com',
        'Calle 456',
        3102345678
    ),
    (
        'Miguel Torres',
        'miguel.torres@example.com',
        'Calle 789',
        3103456789
    ),
    (
        'Laura García',
        'laura.garcia@example.com',
        'Calle 101',
        3104567890
    ),
    (
        'Fernando Ramírez',
        'fernando.ramirez@example.com',
        'Calle 202',
        3105678901
    ),
    (
        'Mariana López',
        'mariana.lopez@example.com',
        'Calle 303',
        3106789012
    );

-- Inserciones en la tabla Ventas
INSERT INTO
    Ventas (ID_Empleado, ID_Cliente, Fecha, Valor_Total)
VALUES
    (1, 1, '2024-09-25', 150000),
    (2, 2, '2024-09-26', 300000),
    (3, 3, '2024-09-27', 450000),
    (4, 4, '2024-09-28', 200000),
    (5, 5, '2024-09-29', 600000),
    (6, 6, '2024-09-30', 500000);

-- Inserciones en la tabla Compras_Proveedores
INSERT INTO
    Compras_Proveedores (ID_Proveedor, Fecha, Valor_Total)
VALUES
    (1, '2024-08-01', 700000),
    (2, '2024-08-15', 850000),
    (3, '2024-08-20', 920000),
    (4, '2024-08-25', 500000),
    (5, '2024-09-05', 780000),
    (6, '2024-09-10', 650000);

-- Inserciones en la tabla Detalle_Compras_Proveedores
INSERT INTO
    Detalle_Compras_Proveedores (ID_Producto, ID_Compra, Cantidad, Subtotal)
VALUES
    (1, 1, 5, 250000),
    (2, 2, 2, 400000),
    (3, 3, 8, 480000),
    (4, 4, 4, 600000),
    (5, 5, 7, 315000),
    (6, 6, 15, 120000);

-- Inserciones en la tabla Detalle_Ventas
INSERT INTO
    Detalle_Ventas (ID_Venta, ID_Producto, Cantidad, Subtotal)
VALUES
    (1, 1, 1, 50000),
    (2, 2, 1, 200000),
    (3, 3, 2, 120000),
    (4, 4, 1, 150000),
    (5, 5, 1, 45000),
    (6, 6, 2, 160000);