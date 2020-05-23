--Total de vendas de cada loja, ordenado de forma decrescente

.mode columns
.headers on
.nullvalue NULL

SELECT idloja, sum(total) AS Total_Compras, Loja.nome
FROM
(SELECT idcompra, idproduto, idloja, total
FROM (Efetuado JOIN Produto USING (idproduto)) NATURAL JOIN Compra
GROUP BY idcompra) NATURAL JOIN Loja
GROUP BY idloja
ORDER BY Total_Compras DESC;