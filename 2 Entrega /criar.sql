PRAGMA FOREIGN_KEYS = ON;

Drop table if exists Cartaz;
create table Cartaz(
    IdCartaz INTEGER PRIMARY KEY AUTOINCREMENT,
    CapaUCI TEXT
);

Drop table if exists Filme;
create table Filme(
    NomeFilme TEXT,
    Ano DATE,
    IdadeMinima NUMBER,
    Duracao TIME,
    Descricao TEXT,
    IdCartaz INTEGER REFERENCES Cartaz ON UPDATE CASCADE ON DELETE CASCADE, 
    PRIMARY KEY(NomeFilme, Ano),
    CHECK(IdadeMinima > 4),
    CHECK(Duracao > 0),
    UNIQUE(NomeFilme, Ano)
);

Drop table if exists Categoria;
create table Categoria(
    NomeCategoria TEXT PRIMARY KEY
);

Drop table if exists Sala;
create table Sala(
    Numero NUMBER PRIMARY KEY,
    CHECK(Numero >= 1 AND Numero <= 30)
);

Drop table if exists Sessao;
create table Sessao(
    HoraInicio TIME,
    HoraFim TIME,
    Dia NUMBER,
    Numero NUMBER REFERENCES Sala ON UPDATE CASCADE ON DELETE CASCADE,
    NomeFilme TEXT,
    Ano DATE,
    PRIMARY KEY(HoraInicio, HoraFim, Dia, Numero),
    FOREIGN KEY(NomeFilme, Ano) REFERENCES Filme ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK(HoraInicio < HoraFim),
    CHECK(HoraFim < '23:59:59'),
    CHECK(Dia > 0 AND Dia <= 31)
);

Drop table if exists Lugar;
create table Lugar(
    IdLugar INTEGER PRIMARY KEY AUTOINCREMENT,
    Linha NUMBER,
    Coluna NUMBER,
    Numero NUMBER REFERENCES Sala ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK(Linha > 0 AND Linha <= 20),
    CHECK(Coluna > 0 AND Coluna <= 20)
);

Drop table if exists Pessoa;
create table Pessoa(
    Nome TEXT,
    Idade NUMBER,
    Morada TEXT,
    Sexo CHAR(1),
    PRIMARY KEY(Nome, Idade, Morada),
    CHECK(Idade > 0),
    CHECK(Sexo = 'M' OR Sexo = 'F')
);

Drop table if exists Ator;
create table Ator(
    Nome TEXT,
    Idade NUMBER,
    Morada TEXT,
    Papel TEXT,
    FOREIGN KEY(Nome, Idade, Morada) REFERENCES Pessoa ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(Nome, Idade, Morada),
    CHECK(Papel = 'Papel Principal' OR Papel = 'Papel Secundario' OR Papel = 'Figurante')
);

Drop table if exists Cliente;
create table Cliente(
    Nome TEXT,
    Idade NUMBER,
    Morada TEXT,
    Telemovel CHAR(9),
    FOREIGN KEY(Nome, Idade, Morada) REFERENCES Pessoa ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(Nome, Idade, Morada, Telemovel),
    UNIQUE (Telemovel)
);

Drop table if exists Bilhete;
create table Bilhete(
    IdBilhete INTEGER PRIMARY KEY AUTOINCREMENT,
    Preco TEXT,
    HoraInicio TIME,
    HoraFim TIME,
    Dia NUMBER,
    Numero NUMBER,
    IdLugar INTEGER REFERENCES Lugar ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(HoraInicio, HoraFim, Dia, Numero) REFERENCES Sessao ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK(Preco = '5.00€')
);

Drop table if exists Menu;
create table Menu(
    Tamanho TEXT PRIMARY KEY,
    Preco TEXT,
    CHECK(Tamanho = 'Pequeno' OR Tamanho = 'Medio' OR Tamanho = 'Grande'),
    CHECK(Preco >= '3.00€')
);

Drop table if exists FilmeCategoria;
create table FilmeCategoria(
    NomeFilme TEXT,
    Ano DATE,
    NomeCategoria TEXT REFERENCES Categoria ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(NomeFilme, Ano) REFERENCES Filme ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(NomeFilme, Ano, NomeCategoria)
);

Drop table if exists FilmeAtor;
create table FilmeAtor(
    NomeFilme TEXT,
    Ano DATE,
    Nome TEXT,
    Idade NUMBER,
    Morada TEXT,
    FOREIGN KEY(NomeFilme, Ano) REFERENCES Filme ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Nome, Idade, Morada) REFERENCES Ator ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(NomeFilme, Ano, Nome, Idade, Morada)
);

Drop table if exists FilmeCliente;
create table FilmeCliente(
    NomeFilme TEXT,
    Ano DATE,
    Nome TEXT,
    Idade NUMBER,
    Morada TEXT,
    Telemovel CHAR(9),
    FOREIGN KEY(NomeFilme, Ano) REFERENCES Filme ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Nome, Idade, Morada, Telemovel) REFERENCES Cliente ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(NomeFilme, Ano, Nome, Idade, Morada, Telemovel)
);

Drop table if exists ClienteMenu;
create table ClienteMenu(
    Nome TEXT,
    Idade NUMBER,
    Morada TEXT,
    Telemovel CHAR(9),
    Tamanho TEXT REFERENCES Menu ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Nome, Idade, Morada, Telemovel) REFERENCES Cliente ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(Nome, Idade, Morada, Telemovel, Tamanho)
);