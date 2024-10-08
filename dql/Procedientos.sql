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
        ve.Fecha AS VentaFecha,
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
        ve.Fecha AS VentaFecha,
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

DELIMITER ;