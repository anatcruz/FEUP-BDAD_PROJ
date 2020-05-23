--Total de vendas de cada loja, ordenado de forma decrescente

.mode columns
.headers on
.nullvalue NULL

CREATE VIEW efetuado_produto
AS
    SELECT idCompra, idLoja
    FROM Efetuado , Produto
    WHERE Efetuado.idProduto = Produto.idProduto;

SELECT Loja.idLoja, nome, total
FROM Loja NATURAL JOIN (Compra NATURAL JOIN efetuado_produto)
ORDER BY total DESC;