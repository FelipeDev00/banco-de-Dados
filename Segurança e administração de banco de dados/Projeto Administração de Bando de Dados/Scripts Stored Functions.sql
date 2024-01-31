
/*Criando uma stored function que receba id de cliente e retorne se o cliente é “PREMIUM” ou “REGULAR”.
Um cliente é “PREMIUM” se já realizou mais de R$ 10 mil em compras na loja, se não, é um cliente “REGULAR”:*/

USE uc4atividades;

DELIMITER //

CREATE FUNCTION TipoCliente(cliente_id INT) RETURNS VARCHAR(10) DETERMINISTIC
BEGIN
    DECLARE total_compras DECIMAL(9,2);

    SELECT SUM(v.valor_total)
    INTO total_compras
    FROM venda v
    WHERE v.cliente_id = cliente_id;

    IF total_compras > 10000 THEN
        RETURN 'PREMIUM';
    ELSE
        RETURN 'REGULAR';
    END IF;
END //

DELIMITER ;

-- Chamada da Stored Function:
SELECT TipoCliente(25);