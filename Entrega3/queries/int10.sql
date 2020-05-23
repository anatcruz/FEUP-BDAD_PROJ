--Compra mais cara efetuada por cada cliente.

.mode columns
.headers on
.nullvalue NULL

SELECT nif, max(total) as Total, Loja.nome as Loja
FROM
(SELECT nome, nif, idcompra, total
FROM (Cliente NATURAL Join Pessoa) Join Compra
where Cliente.nif = Compra.nifcliente) NATURAL join Efetuado join Produto using(idproduto) join Loja USING (idloja)
GROUP by nif;