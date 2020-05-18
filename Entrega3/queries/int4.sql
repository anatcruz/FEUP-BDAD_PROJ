.mode columns
.headers on
.nullvalue NULL

SELECT idProduto, sum(quantidade) as total
FROM Efetuado
GROUP BY idProduto
ORDER BY total DESC;