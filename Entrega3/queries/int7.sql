

.mode columns
.headers on
.nullvalue NULL

CREATE VIEW efetuado_produto
AS
    SELECT idCompra, idLoja
    FROM Efetuado , Produto
    WHERE Efetuado.idProduto = Produto.idProduto;

SELECT Pessoa.nome, nif, Loja.nome
FROM Pessoa JOIN (Loja NATURAL JOIN (Compra NATURAL JOIN efetuado_produto)) ON Pessoa.nif=Compra.nifCliente
ORDER BY Loja.nome;