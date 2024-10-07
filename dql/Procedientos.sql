DELIMITER //

CREATE Procedure VideojuegosPorPlataforma (IN Plataforma VARCHAR(50))
BEGIN
    SELECT
        pr.`Nombre`,
        pl.`Nombre`
    FROM
        `Videojuegos` vi
    INNER JOIN `Productos` pr ON vi.`ID_Producto` = pr.`ID_Producto`
    INNER JOIN `Plataformas` pl ON vi.`ID_Plataforma` = pl.`ID_Plataforma`
    WHERE pl.`Nombre` = Plataforma;
END //

DELIMITER ;