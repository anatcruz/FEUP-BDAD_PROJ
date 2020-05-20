.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS InsertIdadeValida
BEFORE INSERT ON Funcionario
FOR EACH ROW
WHEN strftime('%J', 'now') - strftime('%J', (SELECT dataNascimento from Pessoa WHERE nif = NEW.nif)) < 6570 -- 18 anos * 365 dias
BEGIN
    SELECT RAISE(ROLLBACK, 'Funcionario necessita de idade superior a 16 anos!');
END;