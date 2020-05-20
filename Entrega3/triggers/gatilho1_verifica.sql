.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Estado atual dos funcionarios:'
.print ''

SELECT * FROM Funcionario NATURAL JOIN Pessoa;

.print ''
.print 'Pessoa com idade inferior a 18 anos (data de nascimento em 2020):'
.print ''

INSERT INTO Pessoa VALUES (000000001, 'Aayat York', '2020-01-01', 961111111, 'aayatyork@gmail.com');

SELECT * FROM Pessoa WHERE nif=000000001;

.print ''
.print 'Tentar inseri-la na tabela dos funcionarios:'
.print ''

INSERT INTO Funcionario VALUES (10000, 000000001, 1000);

.print ''
.print 'Estado atual dos funcionarios (aquela pessoa nao foi inserida):'
.print ''

SELECT * FROM Funcionario NATURAL JOIN Pessoa;