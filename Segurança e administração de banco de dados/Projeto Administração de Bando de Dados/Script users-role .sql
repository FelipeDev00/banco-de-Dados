
/*Criando um usuário chamado user_relatorio e atribuindo role para ele, com acesso apenas ao comando SELECT de todas
 as tabelas da base de dados uc4atividades. Não pode ser definido para este usuário nenhum outro comando
 DDL ou DML além do SELECT:*/

CREATE USER 'user_relatorio'@'localhost' IDENTIFIED BY '';

CREATE ROLE 'relatorio';

GRANT SELECT ON uc4atividades.* TO 'relatorio';

GRANT 'relatorio' TO 'user_relatorio'@'localhost';


/*Criando um usuário chamado user_funcionario e atribuindo role para esse usuário. Ele poderá manipular
as tabelas de venda, cliente e produto da base de dados uc4atividades, ou seja, poderá fazer apenas os
comandos de SELECT, INSERT, UPDATE e DELETE:*/

CREATE USER 'user_funcionario'@'localhost' IDENTIFIED BY '';

CREATE ROLE 'funcionario';

GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.venda TO 'funcionario';

GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.cliente TO 'funcionario';

GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.produto TO 'funcionario';

GRANT 'funcionario' TO 'user_funcionario'@'localhost';


FLUSH PRIVILEGES;

SELECT * FROM mysql.user;

SET DEFAULT ROLE 'relatorio' TO 'user_relatorio'@'localhost';

SET DEFAULT ROLE 'funcionario' TO 'user_funcionario'@'localhost';

SHOW GRANTS FOR 'user_relatorio'@'localhost' USING 'relatorio';

SHOW GRANTS FOR 'user_funcionario'@'localhost' USING 'funcionario';

