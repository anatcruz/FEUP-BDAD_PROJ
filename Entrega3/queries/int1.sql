.mode columns
.headers on
.nullvalue NULL

SELECT idfunc, nif, nome, salario, sum(horafim-horainicio) as number_of_hours
from (Funcionario NATURAL JOIN HorarioFunc) NATURAL JOIN Horario NATURAL JOIN Pessoa
GROUP by nif
order by number_of_hours DESC;