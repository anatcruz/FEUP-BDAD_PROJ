--Quantos dias da semana é que cada segurança com 50 anos ou mais trabalha após as 20 horas.

.mode columns
.headers on
.nullvalue NULL

SELECT nif, nome, (DATE('now') - datanascimento) AS idade, Count(diasemana) AS Numero_de_Dias
From Seguranca NATURAL Join Funcionario NATURAL JOIN Pessoa NATURAL Join HorarioFunc NATURAL Join Horario
WHERE idade >= 50 and horafim > TIMe('20:00:00')
GROUP BY nif;
