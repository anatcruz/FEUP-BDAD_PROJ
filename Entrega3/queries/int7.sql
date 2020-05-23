--Lista as lojas, de cada piso, com menor numero de empregados

.mode columns
.headers on
.nullvalue NULL

CREATE VIEW FuncLojas
AS
    SELECT DISTINCT idPiso, idLoja, nome, count(nif) as numFunc
    FROM EmpregadoLoja NATURAL JOIN Loja
    GROUP BY idLoja;

SELECT Piso.idPiso, idLoja, nome, min(numFunc) as Num_Func
FROM Piso JOIN FuncLojas USING (idPiso)
GROUP BY Piso.idPiso;