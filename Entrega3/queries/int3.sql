--Média dos salários dos Funcionários de cada Loja.

.mode columns
.headers on
.nullvalue NULL

SELECT idloja, avg(salario) AS Media_Salario
FROM Loja NATURAL JOIN EmpregadoLoja NATURAL JOIN Funcionario
GROUP BY idloja;
