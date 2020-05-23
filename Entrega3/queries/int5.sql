--Número de pessoas que fazem compras do CC divididas por idade, menores que 18, entre 18 e 64, e superior a 64 anos.

.mode columns
.headers on
.nullvalue NULL

CREATE VIEW IF NOT EXISTS menores_view
AS
	SELECT COUNT(nome) AS Numero_Menores
    	FROM  Cliente NATURAL JOIN Pessoa
    	WHERE (DATE('now') - datanascimento) < 18;
    
CREATE VIEW IF NOT EXISTS adultos_view
AS
	SELECT COUNT(nome) AS Numero_Adultos
   	FROM  Cliente NATURAL JOIN Pessoa
    	WHERE (DATE('now') - datanascimento) >= 18 and (DATE('now') - datanascimento) < 64;

CREATE VIEW IF NOT EXISTS seniores_view
AS
	SELECT count(nome) AS Numero_Seniores
   	FROM  Cliente NATURAL JOIN Pessoa
    	WHERE (DATE('now') - datanascimento) >= 64;
    
SELECT *
FROM menores_view, adultos_view, seniores_view;