--Atualiza o stock do produto após compra

.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Estado atual do stock do produto:'
.print ''

SELECT idProduto, nome, quantidade
FROM Produto
WHERE idProduto = 7;

.print ''
.print 'Criar um novo Efetuado com quantidade 3 do produto 7:'
.print ''

INSERT INTO Efetuado (idProduto, quantidade) VALUES (7,3);

SELECT * FROM Efetuado WHERE idEfetuado = last_insert_rowid();

.print ''
.print 'Verificar se o stock do produto diminuiu :'
.print ''

SELECT idProduto, nome, quantidade
FROM Produto
WHERE idProduto = 7;
