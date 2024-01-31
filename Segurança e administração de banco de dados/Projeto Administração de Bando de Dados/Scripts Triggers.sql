
/*Criando um trigger que atue sobre a tabela “usuário” de modo que, ao incluir um novo usuário, aplique
automaticamente MD5() à coluna “senha”, utilizando variáveis com NEW:*/

USE uc4atividades;

DELIMITER //

CREATE TRIGGER before_insert_usuario
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
    SET NEW.senha = MD5(NEW.senha);
END //

DELIMITER ;