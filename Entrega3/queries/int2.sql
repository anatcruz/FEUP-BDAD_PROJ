.mode columns
.headers on
.nullvalue NULL

select idProduto, nome, quantidade, idLoja
from Produto
where quantidade <=10
order by quantidade asc;