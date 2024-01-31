
/***
TODAS AS CONSULTAS REALIZADAS NESTE SCRIPT FORAM FEITAS DE FORMA NÃO OTIMIZADA PROPOSITALMENTE,
AFIM DE EXERCÍTAR MEUS ESTUDOS OTIMIZANDO AS CONSULTAS UTILIZANDO INDEX E VIEWS CONTIDAS NOS SCRIPTS DE
"Views, index e otimização DB.sql" */

/***
Consulta 1.
Consulta para um relatório de todas as vendas pagas em dinheiro. 
Necessários para o relatório data da venda, valor total; produtos vendidos, quantidade e valor unitário;
nome do cliente, cpf e telefone. Ordena-se pela data de venda, as mais recentes primeiro.
**/
SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id
AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

/***
Consulta 2
consulta para encontrar todas as vendas de produtos de um dado fabricante
mostrando dados do produto, quantidade vendida e data da venda.
Ordena-se pelo nome do produto.
***/
SELECT * 
FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';
 
/***
Consulta 3
Relatório de vendas de produto por cliente.
Mostrando dados do cliente, dados do produto e valor e quantidade totais de venda ao cliente de cada produto.
*/
SELECT SUM(iv.subtotal), SUM(iv.quantidade)
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome;




