USE hospital;

INSERT INTO medico (id, nome, cpf) VALUES 
(1, 'Júlia Camarinho', '04984750938'),
(2, 'Alisson Sacramento', '40987873633'),
(3, 'Alberto Veríssimo', '30409838477'),
(4, 'Roberto Souza', '99019336455'),
(5, 'Ricardo Silva', '10394857690'),
(6, 'Suéli Simão Pegado', '56473829109'),
(7, 'Gael Milheiro Lemes', '10394850697'),
(8, 'Tito Carqueijeiro', '01938475909'),
(9, 'Jõao Roberto', '28477649566'),
(10, 'Ezequiel Pestana Henriques', '10394857688');

INSERT INTO especialidade (ID, nome) VALUES
(1, 'geral'),
(2, 'gastroenterologia'),
(3, 'pediatria'),
(4, 'dermatologia'),
(5, 'pediatria'),
(6, 'geral'),
(7, 'gastroenterologia');

INSERT INTO convenio (id, nome, cnpj, tempo_carencia) VALUES
(1, 'unimed', '12345678901234', 30),
(2, 'intermedica', '56789012345678', 20),
(3, 'portoseguro', '90123456789012', 25),
(4, 'sulamerica', '34567890123456', 50);

ALTER TABLE tipo_quarto MODIFY COLUMN valor_diaria DECIMAL (5,2);

INSERT INTO tipo_quarto (id, descricao, valor_diaria) VALUES
(1, 'Apartamento', 150.00),
(2, 'Quarto Duplo', 100.00),
(3, 'Enfermaria', 90.00);

INSERT INTO enfermeiro (id, nome, cpf, cre) VALUES
(1, 'Paulo Nascimento santos', '11122233344', 'ENF12345'),
(2, 'José Rodrigues Lima', '22233344455', 'ENF67890'),
(3, 'Aline Ferreira Lopes', '33344455566', 'ENF54321'),
(4, 'Gabriel Camargo', '44455566677', 'ENF09876'),
(5, 'Roberta Mendez', '55566677788', 'ENF13579'),
(6, 'Felipe Costa Silva', '66677788899', 'ENF24680');

INSERT INTO medico_especialidade (id, medico_id, especialidade_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 1),
(6, 6, 2),
(7, 7, 3),
(8, 8, 4),
(9, 9, 1),
(10, 10, 2);

