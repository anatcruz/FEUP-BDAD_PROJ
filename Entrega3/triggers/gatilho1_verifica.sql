-- Verifica se os Funcionários têm a idade mínima de 18 anos. 

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

INSERT INTO Pessoa VALUES (444444448, 'Aayat York', '2020-01-01', 961111111, 'aayatyork@gmail.com');

SELECT * FROM Pessoa WHERE nif=444444448;

.print ''
.print 'Tentar inseri-la na tabela dos funcionarios:'
.print ''

INSERT INTO Funcionario VALUES (444444448, 1000);

.print ''
.print 'Estado atual dos funcionarios (aquela pessoa nao foi inserida):'
.print ''

SELECT * FROM Funcionario NATURAL JOIN Pessoa;

.print ''
.print 'Pessoa com idade superior a 18 anos:'
.print ''

INSERT INTO Pessoa VALUES (444444449, 'Lyndsey Dodd', '1989-09-16', 999999999, 'lyndseydodd@sapo.pt');

SELECT * FROM Pessoa WHERE nif=444444449;

.print ''
.print 'Tentar inseri-la na tabela dos funcionarios:'
.print ''

INSERT INTO Funcionario VALUES (444444449, 1000);

.print ''
.print 'Estado atual dos funcionarios (aquela pessoa foi inserida):'
.print ''

SELECT * FROM Funcionario NATURAL JOIN Pessoa;