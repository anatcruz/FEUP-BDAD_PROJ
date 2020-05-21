-- Lista ordenada de forma decrescente do número de horas completas que cada Funcionário trabalha por semana.

.mode columns
.headers on
.nullvalue NULL

SELECT nif, nome, salario, sum(horafim-horainicio) AS number_of_hours
FROM (Funcionario NATURAL JOIN HorarioFunc) NATURAL JOIN Horario NATURAL JOIN Pessoa
GROUP BY nif
ORDER BY number_of_hours DESC;