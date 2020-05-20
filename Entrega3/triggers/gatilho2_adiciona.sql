PRAGMA foreign_keys = ON;

CREATE TRIGGER if not EXISTS InsertEfetuadoValido
After insert on Efetuado
WHEN New.idCompra is NULL
BEGIN
insert into Compra(data, hora, total, nifCliente) VALUES (DATE('now'), TIME('now'), (SELECT new.quantidade*Produto.preco from Efetuado join Produto using (idProduto)), NULL);
update Efetuado
set idCompra = (SELECT last_insert_rowid())
where idEfetuado = New.idEfetuado;
END;


