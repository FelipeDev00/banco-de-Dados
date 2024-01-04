SELECT id, data_hora as data, medico_id, pacientes_id, valorconsulta, convenio_id, carteiranumero,
especialidade_id,( select avg(valorconsulta) from consulta where year(data_hora) = 2022
AND convenio_id IS NULL) as valorMedio FROM consulta WHERE year(data_hora) = 2022 AND convenio_id IS NULL;

SELECT id, data_hora as data, medico_id, pacientes_id, valorconsulta, convenio_id, carteiranumero,
especialidade_id,( select avg(valorconsulta) from consulta where year(data_hora) = 2022
AND convenio_id IS NOT NULL) as valorMedio FROM consulta WHERE year(data_hora) = 2022 AND convenio_id IS NOT NULL;

SELECT * FROM internacao WHERE data_alta > data_prevista_alta;

SELECT * FROM receitas
WHERE consulta_id = (SELECT MIN(consulta_id) FROM receitas);

SELECT * FROM consulta WHERE convenio_id IS NULL
AND valorconsulta = (select min(valorconsulta) from consulta where convenio_id is null)
OR valorconsulta = (select max(valorconsulta) from consulta where convenio_id is null);

SELECT internacao.*, quarto.*, tipo_quarto.*, DATEDIFF(data_alta, data_entrada) AS DiasInternados, 
valor_diaria * DATEDIFF(data_alta, data_entrada) AS TotalInternacao 
FROM internacao JOIN quarto ON internacao.quarto_id = quarto.id
JOIN tipo_quarto ON quarto.tipo_quarto_id = tipo_quarto.id;

SELECT data_alta, procedimentos, quarto.numero AS NumeroQuarto, tipo_quarto.descricao AS TipoQuarto
FROM internacao
JOIN quarto ON internacao.quarto_id = quarto.id JOIN tipo_quarto ON quarto.tipo_quarto_id = tipo_quarto.id
WHERE tipo_quarto.descricao = 'Apartamento';

SELECT pacientes.nome AS NomePaciente, consulta.data_hora, especialidade.Nome AS especialidade
FROM consulta
JOIN pacientes ON consulta.pacientes_id = pacientes.id
JOIN especialidade ON consulta.especialidade_id = especialidade.id
WHERE DATEDIFF(consulta.data_hora, pacientes.data_nascimento) < 6570
AND especialidade.Nome != 'Pediatria'
ORDER BY consulta.data_hora;

SELECT pacientes.nome AS NomePaciente, medico.nome AS NomeMedico, internacao.data_entrada AS dataInternacao, internacao.procedimentos
FROM internacao
JOIN pacientes ON internacao.pacientes_id = pacientes.id
JOIN medico ON internacao.medico_id = medico.id
WHERE medico.id IN (SELECT id FROM especialidade WHERE Nome = 'gastroenterologia')
AND internacao.quarto_id IN (SELECT id FROM tipo_quarto WHERE descricao = 'enfermaria');

SELECT medico.nome, medico.cpf, COUNT(consulta.id) AS QuantidadeConsultas
FROM medico
LEFT JOIN consulta ON medico.id = consulta.medico_id
GROUP BY medico.id;

SELECT enfermeiro.nome, enfermeiro.cre, COUNT(enfermeiro_internacao.Internacao_id) AS QuantidadeInternacoes
FROM enfermeiro
JOIN enfermeiro_internacao ON enfermeiro.id = enfermeiro_internacao.enfermeiro_id
GROUP BY enfermeiro.id
HAVING COUNT(enfermeiro_internacao.Internacao_id) > 1;

SELECT p.nome AS NomePaciente, m.nome AS NomeMedico, DATEDIFF(data_alta, data_entrada) AS DiasInternados,
Q.numero AS NumeroQuarto,
tipo_quarto.descricao AS TipoQuarto, valor_diaria * DATEDIFF(data_alta, data_entrada) AS TotalInternacao 
FROM internacao I JOIN quarto Q ON I.quarto_id = Q.id
JOIN tipo_quarto ON q.tipo_quarto_id = tipo_quarto.id
JOIN pacientes P ON I.pacientes_id = p.id
JOIN medico M ON I.medico_id = m.id;











