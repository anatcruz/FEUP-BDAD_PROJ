--Lista de produtos por cada Loja que precisam de ser reabastecidos, ou seja, existe em Loja em quantidade inferior a 10.

.mode columns
.headers on
.nullvalue NULL

SELECT idProduto, nome, quantidade, idLoja
FROM Produto
WHERE quantidade <=10
ORDER BY quantidade ASC;