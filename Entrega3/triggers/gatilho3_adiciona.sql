--Atualiza o stock do produto após compra

PRAGMA foreign_keys = ON;

CREATE TRIGGER UpdateStock
AFTER INSERT ON Efetuado
FOR EACH ROW

BEGIN
	UPDATE Produto
	SET quantidade = quantidade - New.quantidade
	WHERE idProduto = NEW.idProduto;
END;