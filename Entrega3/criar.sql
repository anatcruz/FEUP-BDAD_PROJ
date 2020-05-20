PRAGMA foreign_keys = on;

DROP TABLE IF EXISTS CC;

CREATE TABLE CC (
    idCC INTEGER,
    nome TEXT NOT NULL,
    idLocal Integer,
    CONSTRAINT cc_pk PRIMARY KEY (idCC),
    CONSTRAINT cc_local_fk FOREIGN KEY (idLocal) REFERENCES Localizacao (idLocal) ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS Localizacao;

CREATE TABLE Localizacao (
    idLocal INTEGER,
    morada TEXT UNIQUE NOT NULL,
    localidade TEXT UNIQUE NOT NULL,
    codigoPostal TEXT UNIQUE NOT NULL,
    CONSTRAINT local_pk PRIMARY KEY (idLocal)
);


DROP TABLE IF EXISTS Piso;

CREATE TABLE Piso (
    idPiso INTEGER,
    idCC INTEGER,
    CONSTRAINT piso_pk PRIMARY KEY (idPiso),
    CONSTRAINT piso_cc_fk FOREIGN KEY (idCC) REFERENCES CC (idCC) ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS Loja;

CREATE TABLE Loja (
    idLoja INTEGER,
    nome TEXT NOT NULL,
    idPiso INTEGER,
    idGerente INTEGER,
    CONSTRAINT loja_pk PRIMARY KEY (idLoja),
    CONSTRAINT loja_piso_fk FOREIGN KEY (idPiso) REFERENCES Piso (idPiso) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT loja_gerente_fk FOREIGN KEY (idGerente) REFERENCES Funcionario (nif) ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS Categoria;

CREATE TABLE Categoria (
    idCategoria INTEGER,
    nome TEXT UNIQUE NOT NULL,
    CONSTRAINT categoria_pk PRIMARY KEY (idCategoria)
);


DROP TABLE IF EXISTS Corresponde;

CREATE TABLE Corresponde (
    idLoja INTEGER,
    idCategoria INTEGER,
    CONSTRAINT corresponde_pk PRIMARY KEY (idLoja, idCategoria),
    CONSTRAINT corresponde_loja_fk FOREIGN KEY (idLoja) REFERENCES Loja (idLoja) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT corresponde_categoria_fk FOREIGN KEY (idCategoria) REFERENCES Categoria (idCategoria) ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS Produto;

CREATE TABLE Produto (
    idProduto INTEGER,
    nome TEXT UNIQUE NOT NULL,
    quantidade INTEGER NOT NULL,
    preco REAL NOT NULL,
    idTipo INTEGER,
    idLoja INTEGER,
    CONSTRAINT produto_pk PRIMARY KEY (idProduto),
    CONSTRAINT produto_quantidade_check CHECK (quantidade >= 0),
    CONSTRAINT produto_preco_check CHECK (preco > 0),
    CONSTRAINT produto_tipo_fk FOREIGN KEY (idTipo) REFERENCES Tipo (idTipo) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT produto_loja_fk FOREIGN KEY (idLoja) REFERENCES Loja (idLoja) ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS Tipo;

CREATE TABLE Tipo (
    idTipo INTEGER,
    nome TEXT UNIQUE NOT NULL,
    CONSTRAINT tipo_pk PRIMARY KEY (idTipo)
);


DROP TABLE IF EXISTS Compra;

CREATE TABLE Compra (
    idCompra INTEGER,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    total REAL NOT NULL,
    nifCliente INTEGER,
    CONSTRAINT compra_pk PRIMARY KEY (idCompra),
    CONSTRAINT compra_total_check CHECK (total > 0),
    CONSTRAINT compra_cliente_fk FOREIGN KEY (nifCliente) REFERENCES Cliente (nif) ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS Efetuado;

CREATE TABLE Efetuado (
	idEfetuado INTEGER,
    idCompra INTEGER,
    idProduto INTEGER,
  	quantidade INTEGER NOT NULL,
  	CONSTRAINT efetuado_pk PRIMARY key (idEfetuado),
    CONSTRAINT pair_unique UNIQUE (idCompra, idProduto),
  	CONSTRAINT efetuado_quantidade_check CHECK (quantidade > 0),
    CONSTRAINT efetuado_compra_fk FOREIGN KEY (idCompra) REFERENCES Compra (idCompra) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT efetuado_produto_fk FOREIGN KEY (idProduto) REFERENCES Produto (idProduto) ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS Horario;

CREATE TABLE Horario (
    idHorario INTEGER,
    diaSemana TEXT NOT NULL,
    horaInicio TIME NOT NULL,
    horaFim TIME NOT NULL    ,
    CONSTRAINT horario_pk PRIMARY KEY (idHorario),
    CONSTRAINT horario_hora_check CHECK (horaFim > horaInicio),
    CONSTRAINT horario_dia_check CHECK (diaSemana = "SEGUNDA-FEIRA" OR 
                                        diaSemana = "TERCA-FEIRA" OR 
                                        diaSemana = "QUARTA-FEIRA" OR 
                                        diaSemana = "QUINTA-FEIRA" OR 
                                        diaSemana = "SEXTA-FEIRA" OR 
                                        diaSemana = "SABADO" OR 
                                        diaSemana = "DOMINGO")
);


DROP TABLE IF EXISTS HorarioFunc;

CREATE TABLE HorarioFunc (
    nif INTEGER,
    idHorario INTEGER,
    CONSTRAINT horariofunc_pk PRIMARY KEY (nif, idHorario),
    CONSTRAINT horariofunc_func_fk FOREIGN KEY (nif) REFERENCES Funcionario (nif) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT horariofunc_horario_fk FOREIGN KEY (idHorario) REFERENCES Horario (idHorario) ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS HorarioLoja;

CREATE TABLE HorarioLoja (
    idLoja INTEGER,
    idHorario INTEGER,
    CONSTRAINT horarioloja_pk PRIMARY KEY (idLoja, idHorario),
    CONSTRAINT horarioloja_loja_fk FOREIGN KEY (idLoja) REFERENCES Loja (idLoja) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT horariofunc_horario_fk FOREIGN KEY (idHorario) REFERENCES Horario (idHorario) ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS Pessoa;

CREATE TABLE Pessoa (
    nif INTEGER,
    nome TEXT NOT NULL,
    dataNascimento DATE NOT NULL,
    telefone INTEGER UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    CONSTRAINT pessoa_pk PRIMARY KEY (nif)
);


DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
    nif INTEGER,
    CONSTRAINT cliente_pk PRIMARY KEY (nif),
    CONSTRAINT cliente_nif_fk FOREIGN KEY (nif) REFERENCES Pessoa (nif) ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS Funcionario;

CREATE TABLE Funcionario (
    nif INTEGER,
    salario REAL NOT NULL,
    CONSTRAINT func_pk PRIMARY KEY (nif),
    CONSTRAINT func_nif_fk FOREIGN KEY (nif) REFERENCES Pessoa (nif) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT func_salario_check CHECK (salario > 0)
);


DROP TABLE IF EXISTS EmpregadoLoja;

CREATE TABLE EmpregadoLoja (
    nif INTEGER,
    idLoja INTEGER,
    CONSTRAINT emploja_pk PRIMARY KEY (nif),
    CONSTRAINT emploja_func_fk FOREIGN KEY (nif) REFERENCES Funcionario (nif) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT emploja_loja_fk FOREIGN KEY (idLoja) REFERENCES Loja (idLoja) ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS Seguranca;

CREATE TABLE Seguranca (
    nif INTEGER,
    idPiso INTEGER,
    CONSTRAINT seg_pk PRIMARY KEY (nif),
    CONSTRAINT seg_func_fk FOREIGN KEY (nif) REFERENCES Funcionario (nif) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT seg_piso_fk FOREIGN KEY (idPiso) REFERENCES Piso (idPiso) ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS Limpeza;

CREATE TABLE Limpeza (
    nif INTEGER,
    idPiso INTEGER,
    CONSTRAINT limp_pk PRIMARY KEY (nif),
    CONSTRAINT limp_func_fk FOREIGN KEY (nif) REFERENCES Funcionario (nif) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT limp_piso_fk FOREIGN KEY (idPiso) REFERENCES Piso (idPiso) ON DELETE SET NULL ON UPDATE CASCADE
);