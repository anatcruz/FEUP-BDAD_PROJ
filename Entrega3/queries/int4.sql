--Produtos mais comprados, ordenados de forma decrescente pelo número total de compras.

.mode columns
.headers on
.nullvalue NULL

SELECT idProduto, sum(quantidade) AS total
FROM Efetuado
GROUP BY idProduto
ORDER BY total DESC;