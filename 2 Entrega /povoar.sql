PRAGMA foreing_keys = ON;
BEGIN TRANSACTION;

insert into Cartaz (CapaUCI) values('UCI Cinemas');
insert into Cartaz (CapaUCI) values('UCI MAX');
insert into Cartaz (CapaUCI) values('UCI Cinemas MAX');

insert into Filme values('Jumangi', '2017-12-06', 8, '02:19:59', 'Jogo de uma Aventura na Selva', 1);
insert into Filme values('Jumangi', '2003-03-14', 12, '02:19:59', 'Jogo de uma Aventura na Selva', 3);
insert into Filme values('EndGame', '2019-04-22', 6, '03:00:01', '23 dias após Thanos usar as Infinity Stones...', 2);
insert into Filme (NomeFilme, Ano, Duracao) values ('Pinoquio', '1998-07-08', '01:26:42');
update Filme set IdCartaz = 1 where NomeFilme = 'Pinoquio';

insert into Categoria values('Terror');
insert into Categoria values('Ação');
insert into Categoria values('Aventura');
insert into Categoria values('Comédia');

insert into Sala values(01);
insert into Sala values(30);
insert into Sala values(16);
insert into Sala values(05);

insert into Sessao values('21:15', '23:34:59', 06, 01, 'Jumangi', '2017-12-06');
insert into Sessao values('21:15', '23:16', 14, 05, 'EndGame', '2019-04-22');
insert into Sessao values('21:15', '23:16', 14, 16, 'EndGame', '2019-04-22');
insert into Sessao (HoraInicio, HoraFim) values ('21:30', '22:30');

insert into Lugar values(1, 20, 03, 01); 
insert into Lugar (Linha, Coluna, Numero) values(18, 19, 16);
insert into Lugar (Linha, Coluna, Numero) values(8, 19, 05);

insert into Pessoa values('João Alberto', 20, 'Rua Joaquim do Carmo', 'M');
insert into Pessoa values('Maria Joana', 10, 'Rua Joaquim do Carmo', 'F');
insert into Pessoa values('Fernando', 14, 'Rua 25 de Abril', 'M');
insert into Pessoa values('João Alberto', 20, 'Rua Pedro Homem de Melo', 'M');

insert into Ator values('Maria Joana', 10, 'Rua Joaquim do Carmo', 'Figurante');
insert into Ator values('João Alberto', 20, 'Rua Joaquim do Carmo', 'Papel Principal');

insert into Cliente values('Fernando', 14, 'Rua 25 de Abril', '912345678');
insert into Cliente values('João Alberto', 20, 'Rua Pedro Homem de Melo', '912233445');

insert into Bilhete (Preco, HoraInicio, HoraFim, Dia, Numero, IdLugar) values('5.00€', '21:15', '23:34:59', 06, 01, 01);
insert into Bilhete (Preco, HoraInicio, HoraFim, Dia, Numero, IdLugar) values('5.00€', '21:15', '23:16', 14, 05, 03);
insert into Bilhete (Preco, HoraInicio, HoraFim, Dia, Numero, IdLugar) values('5.00€', '21:15', '23:16', 14, 16, 02);

insert into Menu values('Pequeno', '3.00€');
insert into Menu values('Medio', '5.00€');
insert into Menu values('Grande', '7.00€');

insert into FilmeCategoria values('Jumangi', '2017-12-06', 'Comédia');
insert into FilmeCategoria values('Jumangi', '2017-12-06', 'Aventura');
insert into FilmeCategoria values('EndGame', '2019-04-22', 'Ação');

insert into FilmeAtor values('Jumangi', '2017-12-06', 'João Alberto', 20, 'Rua Joaquim do Carmo');
insert into FilmeAtor values('EndGame', '2019-04-22', 'Maria Joana', 10, 'Rua Joaquim do Carmo');

insert into FilmeCliente values('Jumangi', '2017-12-06', 'Fernando', 14, 'Rua 25 de Abril', '912345678');
insert into FilmeCliente values('EndGame', '2019-04-22', 'João Alberto', 20, 'Rua Pedro Homem de Melo', '912233445');

insert into ClienteMenu values('Fernando', 14, 'Rua 25 de Abril', '912345678', 'Pequeno');
insert into ClienteMenu values('João Alberto', 20, 'Rua Pedro Homem de Melo', '912233445', 'Grande');

COMMIT TRANSACTION;