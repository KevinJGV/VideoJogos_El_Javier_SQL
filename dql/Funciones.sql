USE Videojuegos_El_Javier;

DELIMITER //

CREATE FUNCTION CalcularTotalPrecio (Cantidad INT, Subtotal INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN Cantidad * Subtotal;
END //

DELIMITER ;