-- Verifica se os Funcionários têm a idade mínima de 18 anos. 

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS InsertIdadeValida
BEFORE INSERT ON Funcionario
FOR EACH ROW
WHEN strftime('%J', 'now') - strftime('%J', (SELECT dataNascimento from Pessoa WHERE nif = NEW.nif)) < 6570 -- 18 anos * 365 dias
BEGIN
    SELECT RAISE(ROLLBACK, 'Funcionario necessita de idade superior a 18 anos!');
END;