USE  hospital;

ALTER TABLE medico ADD COLUMN em_atividade BIT;

UPDATE medico SET em_atividade = 0 WHERE id = 1 OR id =  3;

UPDATE medico SET em_atividade = 1
WHERE id = 2 OR id = 4 OR id = 5 OR id = 6 OR id = 7 OR id = 8 OR id = 9 OR id = 10;

UPDATE internacao SET data_alta = DATE_ADD(data_entrada, INTERVAL 3 DAY)
WHERE quarto_id = (SELECT tipo_quarto_id FROM quarto WHERE tipo_quarto_id = 3);

UPDATE consulta SET convenio_id = NULL WHERE convenio_id = 4;

DELETE FROM consulta WHERE convenio_id = 4;

UPDATE pacientes SET convenio_id = NULL WHERE convenio_id = 4;

DELETE FROM convenio WHERE id = 4;