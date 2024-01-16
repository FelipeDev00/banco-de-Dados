USE uc4atividades;

CREATE USER 'user_relatorio'@'localhost' IDENTIFIED BY '';

SELECT * FROM mysql.user;

CREATE USER 'user_funcionario'@'localhost' IDENTIFIED BY '';

CREATE ROLE 'relatorio'; 

GRANT SELECT ON uc4atividades.* TO 'relatorio';

CREATE ROLE 'funcionario';

GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.venda TO 'funcionario';

GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.cliente TO 'funcionario';

GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.produto TO 'funcionario';

GRANT relatorio TO 'user_relatorio'@'localhost';

GRANT funcionario TO 'user_funcionario'@'localhost';

FLUSH PRIVILEGES;