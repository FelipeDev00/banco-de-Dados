
/*Criando um stored procedure que receba id de cliente, data inicial e data final, e que mostre a lista de compras
 realizadas pelo referido cliente entre as datas informadas (incluindo essas datas), mostrando nome do cliente,
 id da compra, total, nome e quantidade de cada produto comprado:*/

USE uc4atividades;

DELIMITER //

CREATE PROCEDURE ListaComprasCliente (
    IN cliente_id INT,
    IN data_inicial DATETIME,
    IN data_final DATETIME
)
BEGIN
    SELECT 
        c.nome AS nome_cliente,
        v.id AS id_compra,
        v.valor_total AS total,
        p.nome AS nome_produto,
        iv.quantidade AS quantidade
    FROM cliente c
    JOIN venda v ON c.id = v.cliente_id
    JOIN item_venda iv ON v.id = iv.venda_id
    JOIN produto p ON iv.produto_id = p.id
    WHERE c.id = cliente_id
        AND v.data BETWEEN data_inicial AND data_final;
END //

DELIMITER ;

-- Chamada da Stored Procedure:
CALL ListaComprasCliente(5, "2019-01-18", "2022-01-20");