--Quais os dias em que o gerente de cada loja trabalha.

.mode columns
.headers on
.nullvalue NULL

SELECT idloja, idgerente, diasemana, horainicio, horafim
FROM Loja NATURAL JOIN Funcionario NATURAL JOIN HorarioFunc NATURAL JOIN Horario
WHERE idgerente = nif
