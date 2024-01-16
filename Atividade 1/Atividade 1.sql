CREATE USER 'user_relatorio'@'localhost' IDENTIFIED BY '';

CREATE USER 'user_funcionario'@'localhost' IDENTIFIED BY '';

SELECT * FROM mysql.user;

CREATE ROLE 'relatorio'; 

CREATE ROLE 'funcionario';

GRANT SELECT ON uc4atividades.* TO 'relatorio';

GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.venda TO 'funcionario';

GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.cliente TO 'funcionario';

GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.produto TO 'funcionario';

GRANT 'relatorio' TO 'user_relatorio'@'localhost';

GRANT 'funcionario' TO 'user_funcionario'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'user_relatorio'@'localhost' USING 'relatorio';

SHOW GRANTS FOR 'user_funcionario'@'localhost' USING 'funcionario';
