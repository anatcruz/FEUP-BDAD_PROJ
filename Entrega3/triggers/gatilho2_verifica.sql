.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Estado atual das compras:'
.print ''

select * from Compra;

.print ''
.print 'Criar um novo Efetuado:'
.print ''

insert into Efetuado (idProduto, quantidade) values (18, 3);

SELECT * from Efetuado where idEfetuado = last_insert_rowid();

.print ''
.print 'Estado atual da tabela Compra, verificar que foi adicionada uma nova compra'
.print ''

SELECT * from Compra;
