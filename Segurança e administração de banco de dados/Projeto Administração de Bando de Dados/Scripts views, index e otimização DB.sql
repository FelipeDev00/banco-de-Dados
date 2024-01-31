
-- OTIMIZANDO E ESPECIFICANDO AS CONSULTAS DO SCRIPT "ConsultasDB"


-- Executando o comando EXPLAIN e mostrando detalhes da execução da consulta:

EXPLAIN SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id
AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';


/* Realizando ajustes de otimização nas consultas utilizando JOINS entre as tabelas, assim como removendo 
   os asteriscos (*) e definindo quais colunas devem ser retornadas de cada consulta, a fim de otimizá-la:*/

-- Consulta 1
SELECT v.data, v.valor_total, p.nome as produto_nome, iv.quantidade, iv.valor_unitario, c.nome as cliente_nome, c.cpf, c.telefone
FROM venda v
JOIN item_venda iv ON v.id = iv.venda_id
JOIN produto p ON p.id = iv.produto_id
JOIN cliente c ON c.id = v.cliente_id
JOIN funcionario f ON f.id = v.funcionario_id
WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC;

-- Consulta 2
SELECT p.nome as produto_nome, iv.quantidade, v.data
FROM produto p
JOIN item_venda iv ON p.id = iv.produto_id
JOIN venda v ON v.id = iv.venda_id
WHERE p.fabricante LIKE '%lar%'
ORDER BY p.nome;

-- Consulta 3
SELECT c.nome as nome_cliente, p.nome as nome_produto, SUM(iv.subtotal) as valor_total, SUM(iv.quantidade) as quantidade_total
FROM produto p
JOIN item_venda iv ON p.id = iv.produto_id
JOIN venda v ON v.id = iv.venda_id
JOIN cliente c ON c.id = v.cliente_id
GROUP BY c.nome, p.nome;


/*Criando índices que possam se beneficiar do recurso para melhorar o desempenho 
  das consultas, considerando principalmente colunas utilizadas nas cláusulas WHERE:*/

CREATE INDEX idx_tipo_pagamento ON venda(tipo_pagamento);
CREATE INDEX idx_fabricante ON produto(fabricante);


/*Executando novamente o comando EXPLAIN, mostrando agora os detalhes da execução
da consulta depois das otimizações realizadas:*/

EXPLAIN SELECT v.data, v.valor_total, p.nome as produto_nome, iv.quantidade, iv.valor_unitario, c.nome as cliente_nome, c.cpf, c.telefone
FROM venda v
JOIN item_venda iv ON v.id = iv.venda_id
JOIN produto p ON p.id = iv.produto_id
JOIN cliente c ON c.id = v.cliente_id
JOIN funcionario f ON f.id = v.funcionario_id
WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC;


-- Criando uma view para cada uma das consultas ajustadas com JOINS:

-- View para Consulta 1
CREATE VIEW view_relatorio_vendas_dinheiro AS
SELECT v.data, v.valor_total, p.nome as produto_nome, iv.quantidade, iv.valor_unitario, c.nome as cliente_nome, c.cpf, c.telefone
FROM venda v
JOIN item_venda iv ON v.id = iv.venda_id
JOIN produto p ON p.id = iv.produto_id
JOIN cliente c ON c.id = v.cliente_id
JOIN funcionario f ON f.id = v.funcionario_id
WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC;

-- View para Consulta 2
CREATE VIEW view_vendas_por_fabricante AS
SELECT p.nome as produto_nome, iv.quantidade, v.data
FROM produto p
JOIN item_venda iv ON p.id = iv.produto_id
JOIN venda v ON v.id = iv.venda_id
WHERE p.fabricante LIKE '%lar%'
ORDER BY p.nome;

-- View para Consulta 3
CREATE VIEW view_relatorio_vendas_por_cliente AS
SELECT c.nome as cliente_nome, p.nome as produto_nome, SUM(iv.subtotal) as valor_total, SUM(iv.quantidade) as quantidade_total
FROM produto p
JOIN item_venda iv ON p.id = iv.produto_id
JOIN venda v ON v.id = iv.venda_id
JOIN cliente c ON c.id = v.cliente_id
GROUP BY c.nome, p.nome;

/***
 FIM DO SCRIPT DE OTIMIZAÇÃO DAS CONSULTAS.
 */







