USE Videojuegos_El_Javier;

-- Listar todos los videojuegos de una plataforma específica (por ejemplo, "PlayStation").
CALL VideojuegosPorPlataforma("PS5")

-- Obtener todos los productos en una categoría (videojuegos, consolas o accesorios) cuyo stock sea inferior a un valor dado.
CALL ProductosMennoresStock("Videojuego", 8)

-- Mostrar todas las ventas realizadas por un cliente específico en un rango de fechas.
CALL ClienteEspFecha(6, "2024-08-30", "2024-10-30")

-- Calcular el total de ventas de un empleado en un mes dado.
CALL EmpleadoMesVentas(3, "September")

-- Listar los productos más vendidos en un período determinado.
CALL ProductosPeriodo("2024-09-24", "2024-09-26")

-- Consultar el stock disponible de un producto por su nombre.
CALL ProductoStock("Zelda: Breath of the Wild")

-- Mostrar las órdenes de compra realizadas a un proveedor específico en el último año.
CALL CompraProveedorAño()

-- Listar los empleados que han trabajado más de un año en la tienda.


-- Obtener la cantidad total de productos vendidos en un día específico.


-- Consultar las ventas de un producto específico (por nombre o ID) y cuántas unidades se vendieron.


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    -- SELECT
    --     pro.`Nombre_Contacto` AS "NombreProveedor",
    --     pro.`Nombre_Empresa` AS "NombreEmpresa",
    --     pro.`Direccion` AS "DireccionEmpresa",
    --     pro.`Telefono` AS "TelefonoProveedor",
    --     ca.`Nombre` AS "Categoria",
    --     pr.`Nombre` AS "ProductoNombre",
    --     pr.`Descripcción` AS "ProductoDescripcion",
    --     pr.`Precio` AS "ProductoPrecio",
    --     pr.`Stock_disponible` AS "ProductoStock"
    -- FROM
    --     `Productos` pr
    -- INNER JOIN `Categorias` ca ON pr.`ID_Categoria` = ca.`ID_Categoria`
    -- INNER JOIN `Proveedores` pro ON pr.`ID_Proveedor` = pro.`ID_Proveedor`
    -- WHERE 