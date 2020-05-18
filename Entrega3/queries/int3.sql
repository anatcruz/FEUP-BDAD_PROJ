.mode columns
.headers on
.nullvalue NULL

SELECT idloja, avg(salario) as Media_Salario
from Loja NATURAL JOIN EmpregadoLoja NATURAL JOIN Funcionario
GROUP by idloja;
