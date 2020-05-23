-- Quando é criado um Efetuado é criada, caso não exista uma Compra com o id fornecido, uma nova Compra com o idCompra seguinte ao ultimo inserido, data e hora atuais e total calculado pela quantidade do produto selecionado, o nif é posto a NULL.

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS InsertEfetuadoValido
AFTER INSERT ON Efetuado
WHEN New.idCompra IS NULL
BEGIN
INSERT INTO Compra(data, hora, total, nifCliente) VALUES (DATE('now'), TIME('now'), new.quantidade*(SELECT Produto.preco FROM Efetuado JOIN Produto USING (idProduto)), NULL);
UPDATE Efetuado
SET idCompra = (SELECT last_insert_rowid())
WHERE idEfetuado = New.idEfetuado;
END;