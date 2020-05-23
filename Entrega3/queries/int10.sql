--Compra mais cara efetuada por cada cliente.

.mode columns
.headers on
.nullvalue NULL

SELECT nif, max(total) AS Total, Loja.nome AS Loja
FROM
(SELECT nome, nif, idcompra, total
FROM (Cliente NATURAL JOIN Pessoa) JOIN Compra
WHERE (Cliente.nif = Compra.nifcliente)) NATURAL JOIN Efetuado JOIN Produto USING (idproduto) JOIN Loja USING (idloja)
GROUP BY nif;