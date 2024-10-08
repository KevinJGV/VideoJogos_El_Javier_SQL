USE Videojuegos_El_Javier;

-- Listar todos los videojuegos de una plataforma específica (por ejemplo, "PlayStation").
DELIMITER //

CREATE Procedure VideojuegosPorPlataforma (IN Plataforma VARCHAR(50))
BEGIN
    SELECT
        pr.Nombre AS Nombre,
        pl.Nombre AS Plataforma
    FROM
        Videojuegos vi
    INNER JOIN Productos pr ON vi.ID_Producto = pr.ID_Producto
    INNER JOIN Plataformas pl ON vi.ID_Plataforma = pl.ID_Plataforma
    WHERE pl.Nombre = Plataforma;
END //

-- Obtener todos los productos en una categoría (videojuegos, consolas o accesorios) cuyo stock sea inferior a un valor dado.
CREATE Procedure ProductosMennoresStock (IN Categoria VARCHAR(128), IN Stcok INT)
BEGIN
    SELECT
        pr.Nombre,
        pr.Precio,
        pr.Stock_disponible,
        ca.Nombre AS "Categoria"
    FROM
        Productos pr
    INNER JOIN Categorias ca ON pr.ID_Categoria = ca.ID_Categoria
    WHERE ca.Nombre = Categoria AND
    pr.Stock_disponible < Stcok;
END //

-- Mostrar todas las ventas realizadas por un cliente específico en un rango de fechas.
CREATE Procedure ClienteEspFecha (IN Cliente_ID INT, IN FechaInicio DATE, IN FechaFinal DATE)
BEGIN
    SELECT
        pr.Nombre AS "NombreProducto",
        pr.Precio AS "PrecioProducto",
        dv.Cantidad AS "CantidadProducto",
        ve.Fecha AS "VentaFecha",
        CalcularTotalPrecio(dv.Cantidad, pr.Precio) AS "TotalProducto",
        cl.Nombre_Completo AS "ClienteNombre",
        cl.Correo_Electronico AS "ClienteCorreo",
        cl.Direccion AS "ClienteDireccion",
        cl.Telefono AS "ClienteTelefono"
    FROM
        Ventas ve
    INNER JOIN Clientes cl ON ve.ID_Cliente = cl.ID_Cliente
    INNER JOIN Detalle_Ventas dv ON ve.ID_Venta = dv.ID_Venta
    INNER JOIN Productos pr ON dv.ID_Producto = pr.ID_Producto
    WHERE cl.ID_Cliente = Cliente_ID AND
    ve.Fecha BETWEEN FechaInicio AND FechaFinal;
END //

-- Calcular el total de ventas de un empleado en un mes dado.
CREATE Procedure EmpleadoMesVentas (IN Empleado_ID INT, IN Mes VARCHAR(64))
BEGIN
    SELECT
        pr.Nombre AS "NombreProducto",
        pr.Precio AS "PrecioProducto",
        dv.Cantidad AS "CantidadProducto",
        ve.Fecha AS "VentaFecha",
        CalcularTotalPrecio(dv.Cantidad, pr.Precio) AS "TotalProducto",
        CONCAT(em.Nombre, em.Apellido) AS "NombreCompleto",
        em.Fecha_Contratacion AS "FechaContratado"
    FROM
        Ventas ve
    INNER JOIN Empleados em ON ve.ID_Empleado = em.ID_Empleado
    INNER JOIN Detalle_Ventas dv ON ve.ID_Venta = dv.ID_Venta
    INNER JOIN Productos pr ON dv.ID_Producto = pr.ID_Producto
    WHERE em.ID_Empleado = Empleado_ID AND
    MONTHNAME(ve.Fecha) = Mes;
END //

-- Listar los productos más vendidos en un período determinado.
CREATE Procedure ProductosPeriodo (IN FechaInicio DATE, IN FechaFinal DATE)
BEGIN
    SELECT
        ca.`Nombre` AS "Categoria",
        pr.`Nombre` AS "ProductoNombre",
        pr.`Descripcción` AS "ProductoDescripcion",
        pr.`Precio` AS "ProductoPrecio",
        dv.Cantidad AS "CantidadProducto",
        CalcularTotalPrecio(dv.Cantidad, pr.Precio) AS "TotalProducto",
        ve.Fecha AS "VentaFecha"
    FROM
        `Detalle_Ventas` dv
    INNER JOIN `Ventas` ve ON dv.`ID_Venta` = ve.`ID_Venta`
    INNER JOIN `Productos` pr ON dv.`ID_Producto` = pr.`ID_Producto`
    INNER JOIN `Categorias` ca ON pr.`ID_Categoria` = ca.`ID_Categoria`
    WHERE ve.Fecha BETWEEN FechaInicio AND FechaFinal
    ORDER BY dv.`Cantidad` DESC;
END //

-- Consultar el stock disponible de un producto por su nombre.
CREATE Procedure ProductoStock (IN Nombre VARCHAR(128))
BEGIN
    SELECT
        pr.Nombre,
        pr.Precio,
        pr.Stock_disponible,
        ca.Nombre AS "Categoria"
    FROM
        Productos pr
    INNER JOIN Categorias ca ON pr.ID_Categoria = ca.ID_Categoria
    WHERE pr.`Nombre` = Nombre;
END //

-- Mostrar las órdenes de compra realizadas a un proveedor específico en el último año.
CREATE Procedure CompraProveedorAño ()
BEGIN
    SELECT
        pro.`Nombre_Contacto` AS "NombreProveedor",
        pro.`Nombre_Empresa` AS "NombreEmpresa",
        pro.`Direccion` AS "DireccionEmpresa",
        pro.`Telefono` AS "TelefonoProveedor",
        cp.`Fecha` AS "FechaCompra",
        dcp.`Cantidad` AS "CantidadCompra",
        dcp.`Subtotal` AS "Precio",
        CalcularTotalPrecio(dcp.Cantidad, dcp.Subtotal) AS "TotalProducto"
    FROM
        `Compras_Proveedores` cp
    INNER JOIN `Proveedores` pro ON cp.`ID_Proveedor` = pro.`ID_Proveedor`
    INNER JOIN `Detalle_Compras_Proveedores` dcp ON cp.`ID_Compra` = dcp.`ID_Detalle`
    INNER JOIN `Productos` pr ON dcp.`ID_Producto` = pr.`ID_Producto`
    WHERE YEAR(cp.`Fecha`) <= YEAR(DATE_SUB(NOW(), INTERVAL 1 YEAR));
END //

DELIMITER ;