USE hospital;

INSERT INTO pacientes (id, nome, data_nascimento, endereco, telefone, email, cpf, rg, convenio_id) VALUES
(1,'Karine Macena Porciúncula', '1990-01-01', 'Endereço 1', '111111111', 'paciente1@email.com', '11122233344', '98485991', 1),
(2, 'Gabriela Silva', '1999-06-14', 'endereco233', '983748392', 'gabrielasilva@gmail.com', '28384950693', '203948551', 2),
(3,'Anderson Fernandes', '1978-07-20', 'Endereço 3', '333333333', 'paciente3@email.com', '33344455566', '284857381', 3),
(4,'Fabrício Norões Xavier', '1995-05-10', 'Endereço 4', '444444444', 'paciente4@email.com', '44455566677', '90938889', 4),
(5,'Ana Lúcia Silva Santos', '1980-12-05', 'Endereço 5', '555555555', 'paciente5@email.com', '55566677788', '273849509', 1),
(6,'César Sítima Faria', '1992-09-25', 'Endereço 6', '666666666', 'paciente6@email.com', '66677788899', '982837331', 2),
(7,'Silvana Fartaria Nazário', '1987-11-30', 'Endereço 7', '777777777', 'paciente7@email.com', '77788899900', '929304950', 3),
(8,'Evandro Trindade Bouça', '1975-04-18', 'Endereço 8', '888888888', 'paciente8@email.com', '88899900011', '294859668', 4),
(9,'Roger Ferreira Simões', '1998-02-14', 'Endereço 9', '999999999', 'paciente9@email.com', '99900011122', '294857431', 1),
(10,'Ivo Brandão Palos', '1983-06-07', 'Endereço 10', '000000000', 'paciente10@email.com', '00011122233', '920495883', 2);

INSERT INTO consulta (id, data_hora, medico_id, pacientes_id, valorconsulta, convenio_id, carteiranumero, especialidade_id) VALUES
(1, '2022-12-31 09:00:00', 1, 1, 100.00, 1, '12345', 1),
(2, '2022-12-30 10:30:00', 2, 2, 80.00, 2, '67890', 2),
(3, '2022-12-29 14:15:00', 3, 3, 120.00, 3, '54321', 3),
(4, '2022-12-28 16:45:00', 4, 4, 90.00, 4, '09876', 4),
(5, '2022-12-27 11:00:00', 5, 5, 110.00, 1, '13579', 1),
(6, '2022-12-26 13:30:00', 6, 6, 95.00, 2, '24680', 2),
(7, '2022-12-25 08:45:00', 7, 7, 130.00, 3, '35791', 3),
(8, '2022-12-24 17:15:00', 8, 8, 85.00, 4, '46802', 4),
(9, '2022-12-23 12:30:00', 9, 9, 105.00, 1, '57913', 1),
(10,'2022-12-22 15:00:00', 10, 10, 115.00, 2, '68024', 2);

INSERT INTO receitas (id, consulta_id, medicamentos, quantidade, instrucoes) VALUES
(1, 1, 'dipirona, Medicamento B', '1', 'Tomar conforme prescrito'),
(2, 2, 'Paracetamol', '1', 'Tomar antes das refeições'),
(3, 3, 'Vitamina C', '2', 'Tomar de 8 em 8 horas'),
(4, 4, 'Vitamina B', '2', 'Tomar com água a noite'),
(5, 5, 'Insulina', '1', 'aplicar à noite');

UPDATE pacientes SET convenio_id = 1 WHERE id = 1 OR id = 5 OR id = 9;
UPDATE Pacientes SET convenio_id = 2 WHERE id = 2 OR id =  6 OR id = 10;
UPDATE Pacientes SET convenio_id = 3 WHERE id = 3 OR id = 7;
UPDATE Pacientes SET convenio_id = 4 WHERE id = 4 OR id = 8;

INSERT INTO quarto (id, numero, tipo_quarto_id) VALUES
(1, '130', 1),
(2, '150', 2),
(3, '180', 3);

INSERT INTO internacao (id, data_entrada, data_prevista_alta, data_alta, procedimentos, medico_id, pacientes_id, quarto_id) VALUES
(1, '2022-12-30', '2023-01-10', '2023-01-08', 'Procedimento A, Procedimento B', 1, 1, 1),
(2, '2022-12-25', '2023-01-05', '2023-01-03', 'Procedimento C, Procedimento D', 2, 2, 2),
(3, '2022-12-20', '2023-01-02', '2023-01-01', 'Procedimento E, Procedimento F', 3, 3, 3),
(4, '2022-12-15', '2022-12-30', NULL, 'Procedimento G, Procedimento H', 4, 4, 1),
(5, '2022-12-10', '2022-12-25', NULL, 'Procedimento I, Procedimento J', 5, 5, 2),
(6, '2022-12-05', '2022-12-20', '2022-12-18', 'Procedimento K, Procedimento L', 6, 6, 3),
(7, '2022-11-30', '2022-12-15', '2022-12-12', 'Procedimento M, Procedimento N', 7, 7, 1),
(8, '2022-11-25', '2022-12-10', NULL, 'Procedimento O, Procedimento P', 8, 8, 2),
(9, '2022-11-20', '2022-12-05', NULL, 'Procedimento Q, Procedimento R', 9, 9, 3),
(10, '2022-11-15', '2022-11-30', '2022-11-28', 'Procedimento S, Procedimento T', 10, 10, 1);

INSERT INTO enfermeiro_internacao (id, Internacao_id, enfermeiro_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 2, 3),
(5, 3, 3),
(6, 3, 4),
(7, 4, 4),
(8, 4, 5),
(9, 5, 5),
(10, 5, 6),
(11, 6, 1),
(12, 6, 2),
(13, 7, 2),
(14, 7, 3),
(15, 8, 3),
(16, 8, 4),
(17, 9, 4),
(18, 9, 5),
(19, 10, 5),
(20, 10, 6);