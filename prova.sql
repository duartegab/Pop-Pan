CREATE TABLE Edicoes (
    ID_Edicao INT PRIMARY KEY,
    Tema VARCHAR(200) NOT NULL,
    DataHora_Inicio DATETIME NOT NULL,
    DataHora_Termino DATETIME NOT NULL,
    Duracao TIME NOT NULL,
    Nome_Criador VARCHAR(100) NOT NULL,
    Telefone_Criador VARCHAR(100) NOT NULL,
    Email_Criador VARCHAR(50) NOT NULL
);


CREATE TABLE Patrocinadores (
    ID_Patrocinador INT PRIMARY KEY,
    ID_Edicao INT,
    Nome_Patrocinador VARCHAR(200) NOT NULL,
    FOREIGN KEY (ID_Edicao) REFERENCES Edicoes(ID_Edicao)
);

CREATE TABLE Edicoes_Artistas (
    ID_Edicao INT,
    ID_Artista INT,
    PRIMARY KEY (ID_Edicao, ID_Artista),
    FOREIGN KEY (ID_Edicao) REFERENCES Edicoes(ID_Edicao),
    FOREIGN KEY (ID_Artista) REFERENCES Artistas(ID_Artista)
);

CREATE TABLE Artistas (
    ID_Artista INT PRIMARY KEY,
    ID_Edicao INT,
    Nome VARCHAR(200) NOT NULL,
    Descricao VARCHAR(300) NOT NULL,
    Data_de_Nascimento DATE NOT NULL,
    Idade INT NOT NULL,
    Nome_Local VARCHAR(100) NOT NULL,
    Data_Hora_Apresentacao DATETIME NOT NULL,
    FOREIGN KEY (ID_Edicao) REFERENCES Edicoes(ID_Edicao)
);

CREATE TABLE RedesSociais_Artistas (
    ID_RedesSociais_Artista INT PRIMARY KEY,
    ID_Artista INT,
    Nome_RedeSocial VARCHAR(100) NOT NULL,
    FOREIGN KEY (ID_Artista) REFERENCES Artistas(ID_Artista)
);

CREATE TABLE Local (
    ID_Local INT PRIMARY KEY,
    ID_Edicao INT,
    Nome VARCHAR(200) NOT NULL,
    Qtd_de_Pessoas INT NOT NULL,
    Rua_Local VARCHAR(200) NOT NULL,
    Nº_Local VARCHAR(7) NOT NULL,
    Bairro_Local VARCHAR(100) NOT NULL,
    CEP VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Edicao) REFERENCES Edicoes(ID_Edicao)
);

CREATE TABLE Equipes (
    ID_Equipe INT PRIMARY KEY,
    ID_Local INT,
    ID_Edicao INT,
    Nome VARCHAR(200) NOT NULL,
    Qtd_de_Membros INT NOT NULL,
    Descricao_Localizacao VARCHAR(300) NOT NULL,
    Latitude_Local FLOAT(10, 6),
    Longitude_Local FLOAT(10, 6),
    FOREIGN KEY (ID_Local) REFERENCES Local(ID_Local),
    FOREIGN KEY (ID_Edicao) REFERENCES Edicoes(ID_Edicao)
);

CREATE TABLE Equipes_Local (
    ID_Equipes_Local INT PRIMARY KEY,
    ID_Local INT,
    ID_Equipe INT,
    Nome_Equipes_Local VARCHAR(100) NOT NULL,
    FOREIGN KEY (ID_Local) REFERENCES Local(ID_Local),
    FOREIGN KEY (ID_Equipe) REFERENCES Equipes(ID_Equipe)
);

CREATE TABLE Tarefas_Equipe (
    ID_Tarefas_Equipe INT PRIMARY KEY,
    ID_Equipe INT,
    Nome_Tarefas_Equipe VARCHAR(150) NOT NULL,
    FOREIGN KEY (ID_Equipe) REFERENCES Equipes(ID_Equipe)
);

CREATE TABLE Ingressos (
    ID_Ingresso INT PRIMARY KEY,
    ID_Edicao INT,
    ID_Equipe INT,
    Nome VARCHAR(200) NOT NULL,
    CPF VARCHAR(20) NOT NULL,
    Data_de_Nascimento DATE NOT NULL,
    Idade INT NOT NULL,
    Forma_de_Pagto VARCHAR(50) NOT NULL,
    Email_Comprador VARCHAR(100) NOT NULL,
    Telefone_Comprador VARCHAR(50) NOT NULL,
    ContaBanco_Comprador VARCHAR(50) NOT NULL,
    FOREIGN KEY (ID_Edicao) REFERENCES Edicoes(ID_Edicao),
    FOREIGN KEY (ID_Equipe) REFERENCES Equipes(ID_Equipe)
);

CREATE TABLE QtdShows_Ingressos (
    ID_QtdShows_Ingressos INT PRIMARY KEY,
    ID_Ingresso INT,
    ID_Apresentacao INT,
    QtdShows_Ingressos INT NOT NULL,
    FOREIGN KEY (ID_Ingresso) REFERENCES Ingressos(ID_Ingresso),
    FOREIGN KEY (ID_Apresentacao) REFERENCES Apresentacoes(ID_Apresentacao)
);

CREATE TABLE Apresentacoes (
    ID_Apresentacao INT PRIMARY KEY,
    ID_Artista INT,
    ID_Edicao INT,
    Nome_Artista VARCHAR(200) NOT NULL,
    Qtd_Edicoes_Apresentadas INT NOT NULL,
    Nome_Local VARCHAR(200) NOT NULL,
    Data_Hora_Apresentacao DATETIME NOT NULL,
    FOREIGN KEY (ID_Artista) REFERENCES Artistas(ID_Artista),
    FOREIGN KEY (ID_Edicao) REFERENCES Edicoes(ID_Edicao)
);

CREATE TABLE Ingressos_Apresentacoes (
    ID_Ingresso INT,
    ID_Apresentacao INT,
    PRIMARY KEY (ID_Ingresso, ID_Apresentacao),
    FOREIGN KEY (ID_Ingresso) REFERENCES Ingressos(ID_Ingresso),
    FOREIGN KEY (ID_Apresentacao) REFERENCES Apresentações(ID_Apresentacao)
);

CREATE TABLE Atividades_Extras (
    ID_AtividadesExtras INT PRIMARY KEY,
    ID_Local INT,
    ID_Apresentacao INT,
    Descricao_AtividadesExtras VARCHAR(100) NOT NULL,
    FOREIGN KEY (ID_Local) REFERENCES Local(ID_Local),
    FOREIGN KEY (ID_Apresentacao) REFERENCES Apresentacoes(ID_Apresentacao)
);

INSERT INTO Edicoes (ID_Edicao, Tema, DataHora_Inicio, DataHora_Termino, Duracao, Nome_Criador, Telefone_Criador, Email_Criador)
VALUES
(1, 'Pop Pan 2019 - Born This Way', '2019-07-26 14:00:00', '2019-07-28 22:00:00', '56:00:00', 'Claudia Oliveira', '21999181996', 'claudia@popan.com'),
(2, 'Pop Pan 2020 - A New Era', '2020-01-24 14:00:00', '2020-01-26 22:00:00', '56:00:00', 'Rita Silva', '21999123456', 'rita@popan.com'),
(3, 'Pop Pan 2021 - Unstoppable Today', '2021-11-26 14:00:00', '2021-11-28 22:00:00', '56:00:00', 'Carlos Moreira', '21999959595', 'carlos@popan.com'),
(4, 'Pop Pan 2022 - Energy', '2022-05-27 14:00:00', '2022-05-29 22:00:00', '56:00:00', 'Edina Barbosa', '21997979797', 'edina@popan.com'),
(5, 'Pop Pan 2023 - Myself Flowers', '2023-05-26 14:00:00', '2023-05-28 22:00:00', '56:00:00', 'Lucia Pereira', '21989898989', 'lucia@popan.com'),
(6, 'Pop Pan 2024 - Forever Young', '2024-05-31 14:00:00', '2024-06-02 22:00:00', '56:00:00', 'João Carneiro', '21999999999', 'joao@popan.com');


INSERT INTO Patrocinadores (ID_Patrocinador, ID_Edicao, Nome_Patrocinador)
VALUES
(1, 1, 'Coca Cola'),
(2, 1, 'Riachuelo'),
(3, 1, 'Americanas'),
(4, 1, 'Centauro'),
(5, 1, 'Seara'),
(6, 2, 'Nike'),
(7, 2, 'McDonalds'),
(8, 2, 'Marisa'),
(9, 2, 'Pepsi'),
(10, 2, 'Mercado Livre'),
(11, 3, 'Chiquinho Sorvetes'),
(12, 3, 'Amazon'),
(13, 3, 'Saraiva'),
(14, 3, 'Fanta'),
(15, 3, 'C&A'),
(16, 4, 'Magalu'),
(17, 4, 'Havaianas'),
(18, 4, 'Bobs'),
(19, 4, 'Monster'),
(20, 4, 'Kibon'),
(21, 5,'Pantene'),
(22, 5,'Burguer King'),
(23, 5, 'Kuat'),
(24, 5, 'Ipanema'),
(25, 5, 'Rexona'),
(26, 6,'Dove'),
(27, 6,'Subway'),
(28, 6,'Schweppes'),
(29, 6, 'Adidas'),
(30, 6, 'TikTok');

INSERT INTO Artistas (ID_Artista, ID_Edicao, Nome, Descricao, Data_de_Nascimento, Idade, Nome_Local, Data_Hora_Apresentacao)
VALUES
(1, 1, 'Glória Groove', 'Cantor e Rapper Drag brasileiro', '1995-01-18', 29, 'Maracanã', '2019-07-26 14:00:00'),
(2, 1, 'Ariana Grande', 'Cantora e compositora americana', '1993-06-26', 30, 'Maracanã', '2019-07-26 18:00:00'),
(3, 1, 'Marina Sena', 'Cantora  brasileira', '1993-09-26', 27, 'Maracanã', '2019-07-27 14:00:00'),
(4, 1, 'Katy Perry', 'Cantora americana', '1984-10-25', 39, 'Maracanã', '2019-07-27 18:00:00'),
(5, 1, 'Anitta', 'Cantora de pop brasileiro', '1993-03-30', 31, 'Maracanã', '2019-07-28 14:00:00'),
(6, 1, 'Nicki Minaj', 'Cantora e rapper americana', '1982-12-08', 31, 'Maracanã', '2019-07-28 18:00:00'),
(7, 2, 'Jão', 'Cantor e compositor brasileiro', '1993-08-17', 30, 'Copacabana', '2020-01-24 14:00:00'),
(8, 2, 'Bruno Mars', 'Cantor, compositor e produtor musical americano', '1985-10-08', 39, 'Copacabana', '2020-01-24 18:00:00'),
(9, 2, 'Lexa', 'Cantora e dançarina brasileira', '1995-02-22', 29, 'Copacabana', '2020-01-25 14:00:00'),
(10, 2, 'Mariah Carey', 'Cantora, compositora e atriz americana', '1969-03-27', 55, 'Copacabana', '2020-01-25 18:00:00'),
(11, 2, 'Luísa Sonza', 'Cantora, compositora e dançarina brasileira', '1998-07-18', 26, 'Copacabana', '2020-01-26 14:00:00'),
(12, 2, 'Billie Eilish', 'Cantora e compositora americana', '2001-12-18', 22, 'Copacabana', '2020-01-26 18:00:00'),
(13, 3, 'Iza', 'Cantora, compositora e atriz brasileira', '1990-09-03', 34, 'Marina da Glória', '2021-11-26 14:00:00'),
(14, 3, 'Rihanna', 'Cantora, compositora e atriz barbadense', '1988-02-20', 36, 'Marina da Glória', '2021-11-26 18:00:00'),
(15, 3, 'Ludmilla', 'Cantora e compositora brasileira', '1995-04-24', 29, 'Marina da Glória', '2021-11-27 14:00:00'),
(16, 3, 'Beyoncé', 'Cantora, compositora e atriz americana', '1981-09-04', 42, 'Marina da Glória', '2021-11-27 18:00:00'),
(17, 3, 'Pabllo Vittar', 'Cantora, compositora e drag queen brasileira', '1994-11-01', 30, 'Marina da Glória', '2021-11-28 14:00:00'),
(18, 3, 'Madonna', 'Cantora, compositora e atriz americana', '1958-08-16', 65, 'Marina da Glória', '2021-11-28 18:00:00'),
(19, 4, 'Anitta', 'Cantora de pop brasileiro', '1993-03-30', 29, 'Parque Olímpico', '2022-05-27 14:00:00'),
(20, 4, 'Miley Cyrus', 'Cantora, compositora e atriz americana', '1992-11-23', 29, 'Parque Olímpico', '2022-05-27 18:00:00'),
(21, 4, 'Luisa Sonza', 'Cantora, compositora e dançarina brasileira', '1998-07-18', 24, 'Parque Olímpico', '2022-05-28 14:00:00'),
(22, 4, 'Demi Lovato', 'Cantora, compositora e atriz americana', '1992-08-20', 29, 'Parque Olímpico', '2022-05-28 18:00:00'),
(23, 4, 'Flora Matos', 'Cantora, compositora e rapper brasileira', '1988-06-28', 33, 'Parque Olímpico', '2022-05-29 14:00:00'),
(24, 4, 'Cardi B', 'Rapper e atriz americana', '1992-10-11', 29, 'Parque Olímpico', '2022-05-29 18:00:00'),
(25, 5, 'Clarice Falcão', 'Cantora, compositora e atriz brasileira', '1989-10-23', 33, 'Engenhão', '2023-05-26 14:00:00'),
(26, 5, 'Melanie Martinez', 'Cantora e compositora americana', '1995-04-28', 28, 'Engenhão', '2023-05-26 18:00:00'),
(27, 5, 'Pocah', 'Cantora e compositora brasileira', '1994-10-29', 28, 'Engenhão', '2023-05-27 14:00:00'),
(28, 5, 'Lana Del Rey', 'Cantora e compositora americana', '1985-06-21', 37, 'Engenhão', '2023-05-27 18:00:00'),
(29, 5, 'Liniker', 'Cantora, compositora e artista brasileira', '1995-04-15', 28, 'Engenhão', '2023-05-28 14:00:00'),
(30, 5, 'Adele', 'Cantora e compositora britânica', '1988-05-05', 35, 'Engenhão', '2023-05-28 18:00:00'),
(31, 6, 'Ivete Sangalo', 'Cantora, compositora e atriz brasileira', '1972-05-27', 52, 'Barra da Tijuca', '2024-05-31 14:00:00'),
(32, 6, 'Dua Lipa', 'Cantora e compositora britânica', '1995-08-22', 28, 'Barra da Tijuca', '2024-05-31 18:00:00'),
(33, 6, 'Paula Fernandes', 'Cantora e compositora brasileira', '1984-08-28', 39, 'Barra da Tijuca', '2024-06-01 14:00:00'),
(34, 6, 'Taylor Swift', 'Cantora e compositora americana', '1989-12-13', 34, 'Barra da Tijuca', '2024-06-01 18:00:00'),
(35, 6, 'Pitty', 'Cantora, compositora e atriz brasileira', '1977-10-07', 46, 'Barra da Tijuca', '2024-06-02 14:00:00'),
(36, 6, 'Lady Gaga', 'Cantora, compositora e atriz americana', '1986-03-28', 38, 'Barra da Tijuca', '2024-06-02 18:00:00');

INSERT INTO Edicoes_Artistas (ID_Edicao, ID_Artista)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(4, 19),
(4, 20),
(4, 21),
(4, 22),
(4, 23),
(4, 24),
(5, 25),
(5, 26),
(5, 27),
(5, 28),
(5, 29),
(5, 30),
(6, 31),
(6, 32),
(6, 33),
(6, 34),
(6, 35),
(6, 36);


INSERT INTO RedesSociais_Artistas (ID_RedesSociais_Artista, ID_Artista, Nome_RedeSocial)
VALUES
(1, 1, 'Instagram: @gloriagroove'),
(2, 2, 'Instagram: @arianagrande'),
(3, 3, 'Instagram: @amarinasena'),
(4, 4, 'Instagram: @katyperry'),
(5, 5, 'Instagram: @anitta'),
(6, 6, 'Instagram: @nickiminaj'),
(7, 7, 'Instagram: @jao'),
(8, 8, 'Instagram: @brunomars'),
(9, 9, 'Instagram: @lexa'),
(10, 10, 'Instagram: @mariahcarey'),
(11, 11, 'Instagram: @luisasonza'),
(12, 12, 'Instagram: @billieeilish'),
(13, 13, 'Instagram: @iza'),
(14, 14, 'Instagram: @badgalriri'),
(15, 15, 'Instagram: @ludmilla'),
(16, 16, 'Instagram: @beyonce'),
(17, 17, 'Instagram: @pabllovittar'),
(18, 18, 'Instagram: @madonna'),
(19, 19, 'Instagram: @anitta'),
(20, 20, 'Instagram: @mileycyrus'),
(21, 21, 'Instagram: @luisasonza'),
(22, 22, 'Instagram: @ddlovato'),
(23, 23, 'Instagram: @floramatos'),
(24, 24, 'Instagram: @iamcardib'),
(25, 25, 'Instagram: @claricefalcão'),
(26, 26, 'Instagram: @littlebodybigheart'),
(27, 27, 'Instagram: @pocah'),
(28, 28, 'Instagram: @honeymoon'),
(29, 29, 'Instagram: @liniker'),
(30, 30, 'Instagram: @adele'),
(31, 31, 'Instagram: @ivetesangalo'),
(32, 32, 'Instagram: @dualipa'),
(33, 33, 'Instagram: @paulafernandes'),
(34, 34, 'Instagram: @taylorswift'),
(35, 35, 'Instagram: @pitty'),
(36, 36, 'Instagram: @ladygaga');


INSERT INTO Local (ID_Local, ID_Edicao, Nome, Qtd_de_Pessoas, Rua_Local, Nº_Local, Bairro_Local, CEP)
VALUES
(1, 1, 'Maracanã', 80000, 'Rua das Laranjeiras', '1000', 'Maracanã', '20271-130'),
(2, 2, 'Copacabana', 50000, 'Avenida Atlântica', '1500', 'Copacabana', '22010-000'),
(3, 3, 'Marina da Glória', 60000, 'Avenida Infante Dom Henrique', '85', 'Glória', '20021-140'),
(4, 4, 'Parque Olímpico', 100000, 'Avenida Embaixador Abelardo Bueno', '3401', 'Barra da Tijuca', '22775-039'),
(5, 5, 'Engenhão', 45000, 'Rua José dos Reis', '425', 'Engenho de Dentro', '20771-002'),
(6, 6, 'Barra da Tijuca', 70000, 'Avenida das Américas', '1000', 'Barra da Tijuca', '22640-100');

INSERT INTO Equipes (ID_Equipe, ID_Local, ID_Edicao, Nome, Qtd_de_Membros, Descricao_Localizacao, Latitude_Local, Longitude_Local)
VALUES
(1, 1, 1, 'Segurança Digital N1', 150, 'Área Externa e Interna', -28.1234, -41.2990),
(2, 1, 1, 'Segurança Física N1', 100, 'Portões de Entrada', -22.9129, -43.2302),
(3, 1, 1, 'Bombeiros N1', 150, 'Área Externa e Interna', -18.4357, -49.5505),
(4, 1, 1, 'Som N1', 50, 'Próximo ao Palco', -12.6336, -29.4409),
(5, 1, 1, 'Alimentação e Bebida N1', 50, 'Áreas Laterais do Evento', -32.2256, -49.1278),
(6, 2, 2, 'Segurança Digital N2', 150, 'Área Externa e Interna', -28.1234, -41.2990),
(7, 2, 2, 'Segurança Física N2', 100, 'Portões de Entrada', -22.9129, -43.2302),
(8, 2, 2, 'Bombeiros N2', 150, 'Área Externa e Interna', -18.4357, -49.5505),
(9, 2, 2, 'Som N2', 50, 'Próximo ao Palco', -12.6336, -29.4409),
(10, 2, 2, 'Alimentação e Bebida N2', 50, 'Áreas Laterais do Evento', -32.2256, -49.1278),
(11, 3, 3, 'Segurança Digital N3', 150, 'Área Externa e Interna', -28.1234, -41.2990),
(12, 3, 3, 'Segurança Física N3', 100, 'Portões de Entrada', -22.9129, -43.2302),
(13, 3, 3, 'Bombeiros N3', 150, 'Área Externa e Interna', -18.4357, -49.5505),
(14, 3, 3, 'Som N3', 50, 'Próximo ao Palco', -12.6336, -29.4409),
(15, 3, 3, 'Alimentação e Bebida N3', 50, 'Áreas Laterais do Evento', -32.2256, -49.1278),
(16, 4, 4, 'Segurança Digital N4', 150, 'Área Externa e Interna', -28.1234, -41.2990),
(17, 4, 4, 'Segurança Física N4', 100, 'Portões de Entrada', -22.9129, -43.2302),
(18, 4, 4, 'Bombeiros N4', 150, 'Área Externa e Interna', -18.4357, -49.5505),
(19, 4, 4, 'Som N4', 50, 'Próximo ao Palco', -12.6336, -29.4409),
(20, 4, 4, 'Alimentação e Bebida N4', 50, 'Áreas Laterais do Evento', -32.2256, -49.1278),
(21, 5, 5, 'Segurança Digital N5', 150, 'Área Externa e Interna', -28.1234, -41.2990),
(22, 5, 5, 'Segurança Física N5', 100, 'Portões de Entrada', -22.9129, -43.2302),
(23, 5, 5, 'Bombeiros N5', 150, 'Área Externa e Interna', -18.4357, -49.5505),
(24, 5, 5, 'Som N5', 50, 'Próximo ao Palco', -12.6336, -29.4409),
(25, 5, 5, 'Alimentação e Bebida N5', 50, 'Áreas Laterais do Evento', -32.2256, -49.1278),
(26, 6, 6, 'Segurança Digital N6', 150, 'Área Externa e Interna', -28.1234, -41.2990),
(27, 6, 6, 'Segurança Física N6', 100, 'Portões de Entrada', -22.9129, -43.2302),
(28, 6, 6, 'Bombeiros N6', 150, 'Área Externa e Interna', -18.4357, -49.5505),
(29, 6, 6, 'Som N6', 50, 'Próximo ao Palco', -12.6336, -29.4409),
(30, 6, 6, 'Alimentação e Bebida N6', 50, 'Áreas Laterais do Evento', -32.2256, -49.1278);

INSERT INTO Equipes_Local (ID_Equipes_Local, ID_Local, ID_Equipe, Nome_Equipes_Local)
VALUES
(1, 1, 1, 'Segurança Digital 2019'),
(2, 1, 2, 'Segurança Física 2019'),
(3, 1, 3, 'Bombeiros 2019'),
(4, 1, 4, 'Som 2019'),
(5, 1, 5, 'Alimentação e Bebida 2019'),
(6, 2, 6, 'Segurança Digital 2020'),
(7, 2, 7, 'Segurança Física 2020'),
(8, 2, 8, 'Bombeiros 2020'),
(9, 2, 9, 'Som 2020'),
(10, 2, 10, 'Alimentação e Bebida 2020'),
(11, 3, 11, 'Segurança Digital 2021'),
(12, 3, 12, 'Segurança Física 2021'),
(13, 3, 13, 'Bombeiros 2021'),
(14, 3, 14, 'Som 2021'),
(15, 3, 15, 'Alimentação e Bebida 2021'),
(16, 4, 16, 'Segurança Digital 2022'),
(17, 4, 17, 'Segurança Física 2022'),
(18, 4, 18, 'Bombeiros 2022'),
(19, 4, 19, 'Som 2022'),
(20, 4, 20, 'Alimentação e Bebida 2022'),
(21, 5, 21, 'Segurança Digital 2023'),
(22, 5, 22, 'Segurança Física 2023'),
(23, 5, 23, 'Bombeiros 2023'),
(24, 5, 24, 'Som 2023'),
(25, 5, 25, 'Alimentação e Bebida 2023'),
(26, 6, 26, 'Segurança Digital 2024'),
(27, 6, 27, 'Segurança Física 2024'),
(28, 6, 28, 'Bombeiros 2024'),
(29, 6, 29, 'Som 2024'),
(30, 6, 30, 'Alimentação e Bebida 2024');


INSERT INTO Tarefas_Equipe (ID_Tarefas_Equipe, ID_Equipe, Nome_Tarefas_Equipe)
VALUES
(1, 1, 'Controle de Acesso'),
(2, 2, 'Assistência para a Segurança Local do Evento'),
(3, 3, 'Assistência a saúde dos participantes, primeiros socorros'),
(4, 4, 'Garantir uma boa passagem de som, tanto pro artista quanto pros participantes'),
(5, 5, 'Venda de Alimentos e Bebidas ao público, além da distribuição dos produtos patrocinados'),
(6, 6, 'Controle de Acesso'),
(7, 7, 'Assistência para a Segurança Local do Evento'),
(8, 8, 'Assistência a saúde dos participantes, primeiros socorros'),
(9, 9, 'Garantir uma boa passagem de som, tanto pro artista quanto pros participantes'),
(10, 10, 'Venda de Alimentos e Bebidas ao público, além da distribuição dos produtos patrocinados'),
(11, 11, 'Controle de Acesso'),
(12, 12, 'Assistência para a Segurança Local do Evento'),
(13, 13, 'Assistência a saúde dos participantes, primeiros socorros'),
(14, 14, 'Garantir uma boa passagem de som, tanto pro artista quanto pros participantes'),
(15, 15, 'Venda de Alimentos e Bebidas ao público, além da distribuição dos produtos patrocinados'),
(16, 16, 'Controle de Acesso'),
(17, 17, 'Assistência para a Segurança Local do Evento'),
(18, 18, 'Assistência a saúde dos participantes, primeiros socorros'),
(19, 19, 'Garantir uma boa passagem de som, tanto pro artista quanto pros participantes'),
(20, 20, 'Venda de Alimentos e Bebidas ao público, além da distribuição dos produtos patrocinados'),
(21, 21, 'Controle de Acesso'),
(22, 22, 'Assistência para a Segurança Local do Evento'),
(23, 23, 'Assistência a saúde dos participantes, primeiros socorros'),
(24, 24, 'Garantir uma boa passagem de som, tanto pro artista quanto pros participantes'),
(25, 25, 'Venda de Alimentos e Bebidas ao público, além da distribuição dos produtos patrocinados'),
(26, 26, 'Controle de Acesso'),
(27, 27, 'Assistência para a Segurança Local do Evento'),
(28, 28, 'Assistência a saúde dos participantes, primeiros socorros'),
(29, 29, 'Garantir uma boa passagem de som, tanto pro artista quanto pros participantes'),
(30, 30, 'Venda de Alimentos e Bebidas ao público, além da distribuição dos produtos patrocinados');


INSERT INTO Ingressos (ID_Ingresso, ID_Edicao, ID_Equipe, Nome, CPF, Data_de_Nascimento, Idade, Forma_de_Pagto, Email_Comprador, Telefone_Comprador, ContaBanco_Comprador)
VALUES
(1, 1, 1, 'Carlos Alberto', '123.456.789-00', '1990-01-01', 34, 'Cartão de Crédito', 'carlos@exemplo.com', '21999990000', 'carlos345'),
(2, 1, 1, 'Maria Silva', '123.456.789-01', '1985-02-02', 39, 'Cartão de Débito', 'maria@exemplo.com', '21999990001', 'maria1985'),
(3, 1, 1, 'João Pereira', '123.456.789-02', '1992-03-03', 32, 'PIX', 'joao@exemplo.com', '21999990002', 'joao1992'),
(4, 1, 1, 'Ana Souza', '123.456.789-03', '1988-04-04', 36, 'Cartão de Crédito', 'ana@exemplo.com', '21999990003', 'ana1988'),
(5, 1, 1, 'Pedro Lima', '123.456.789-04', '1995-05-05', 29, 'Cartão de Débito', 'pedro@exemplo.com', '21999990004', 'pedro1995'),
(6, 1, 1, 'Julia Santos', '123.456.789-05', '1987-06-06', 37, 'PIX', 'julia@exemplo.com', '21999990005', 'julia1987'),
(7, 1, 1, 'Lucas Oliveira', '123.456.789-06', '1991-07-07', 33, 'Cartão de Crédito', 'lucas@exemplo.com', '21999990006', 'lucas1991'),
(8, 1, 1, 'Mariana Costa', '123.456.789-07', '1989-08-08', 35, 'Cartão de Débito', 'mariana@exemplo.com', '21999990007', 'mariana1989'),
(9, 1, 1, 'Felipe Fernandes', '123.456.789-08', '1993-09-09', 31, 'PIX', 'felipe@exemplo.com', '21999990008', 'felipe1993'),
(10, 1, 1, 'Gabriela Rodrigues', '123.456.789-09', '1986-10-10', 38, 'Cartão de Crédito', 'gabriela@exemplo.com', '21999990009', 'gabriela1986'),
(11, 2, 6, 'Ricardo Mendes', '123.456.789-10', '1984-11-11', 40, 'Cartão de Débito', 'ricardo@exemplo.com', '21999990010', 'ricardo1984'),
(12, 2, 6, 'Fernanda Lima', '123.456.789-11', '1990-12-12', 34, 'PIX', 'fernanda@exemplo.com', '21999990011', 'fernanda1990'),
(13, 2, 6, 'Tiago Araujo', '123.456.789-12', '1983-01-13', 41, 'Cartão de Crédito', 'tiago@exemplo.com', '21999990012', 'tiago1983'),
(14, 2, 6, 'Bianca Matos', '123.456.789-13', '1987-02-14', 37, 'Cartão de Débito', 'bianca@exemplo.com', '21999990013', 'bianca1987'),
(15, 2, 6, 'Henrique Alves', '123.456.789-14', '1994-03-15', 30, 'PIX', 'henrique@exemplo.com', '21999990014', 'henrique1994'),
(16, 2, 6, 'Isabela Souza', '123.456.789-15', '1988-04-16', 36, 'Cartão de Crédito', 'isabela@exemplo.com', '21999990015', 'isabela1988'),
(17, 2, 6, 'André Lima', '123.456.789-16', '1992-05-17', 32, 'Cartão de Débito', 'andre@exemplo.com', '21999990016', 'andre1992'),
(18, 2, 6, 'Lorena Alves', '123.456.789-17', '1985-06-18', 39, 'PIX', 'lorena@exemplo.com', '21999990017', 'lorena1985'),
(19, 2, 6, 'Vinícius Dias', '123.456.789-18', '1993-07-19', 31, 'Cartão de Crédito', 'vinicius@exemplo.com', '21999990018', 'vinicius1993'),
(20, 2, 6, 'Patrícia Mendes', '123.456.789-19', '1989-08-20', 35, 'Cartão de Débito', 'patricia@exemplo.com', '21999990019', 'patricia1989'),
(21, 3, 11, 'Marcelo Vieira', '123.456.789-20', '1990-09-21', 34, 'PIX', 'marcelo@exemplo.com', '21999990020', 'marcelo1990'),
(22, 3, 11, 'Sofia Oliveira', '123.456.789-21', '1988-10-22', 36, 'Cartão de Crédito', 'sofia@exemplo.com', '21999990021', 'sofia1988'),
(23, 3, 11, 'Diego Martins', '123.456.789-22', '1991-11-23', 33, 'Cartão de Débito', 'diego@exemplo.com', '21999990022', 'diego1991'),
(24, 3, 11, 'Camila Santos', '123.456.789-23', '1985-12-24', 39, 'PIX', 'camila@exemplo.com', '21999990023', 'camila1985'),
(25, 3, 11, 'Júlio Almeida', '123.456.789-24', '1989-01-25', 35, 'Cartão de Crédito', 'julio@exemplo.com', '21999990024', 'julio1989'),
(26, 3, 11, 'Larissa Ramos', '123.456.789-25', '1992-02-26', 32, 'Cartão de Débito', 'larissa@exemplo.com', '21999990025', 'larissa1992'),
(27, 3, 11, 'Fábio Santos', '123.456.789-26', '1987-03-27', 37, 'PIX', 'fabio@exemplo.com', '21999990026', 'fabio1987'),
(28, 3, 11, 'Carla Dias', '123.456.789-27', '1990-04-28', 34, 'Cartão de Crédito', 'carla@exemplo.com', '21999990027', 'carla1990'),
(29, 3, 11, 'Rafael Teixeira', '123.456.789-28', '1983-05-29', 41, 'Cartão de Débito', 'rafael@exemplo.com', '21999990028', 'rafael1983'),
(30, 3, 11, 'Verônica Souza', '123.456.789-29', '1986-06-30', 38, 'PIX', 'veronica@exemplo.com', '21999990029', 'veronica1986'),
(31, 4, 16, 'Renato Costa', '123.456.789-30', '1984-07-01', 40, 'Cartão de Crédito', 'renato@exemplo.com', '21999990030', 'renato1984'),
(32, 4, 16, 'Letícia Lima', '123.456.789-31', '1986-08-02', 38, 'Cartão de Débito', 'leticia@exemplo.com', '21999990031', 'leticia1986'),
(33, 4, 16, 'Murilo Silva', '123.456.789-32', '1990-09-03', 34, 'PIX', 'murilo@exemplo.com', '21999990032', 'murilo1990'),
(34, 4, 16, 'Tatiane Araújo', '123.456.789-33', '1989-10-04', 35, 'Cartão de Crédito', 'tatiane@exemplo.com', '21999990033', 'tatiane1989'),
(35, 4, 16, 'Victor Mendes', '123.456.789-34', '1985-11-05', 39, 'Cartão de Débito', 'victor@exemplo.com', '21999990034', 'victor1985'),
(36, 4, 16, 'Mariana Santos', '123.456.789-35', '1993-12-06', 31, 'PIX', 'mariana@exemplo.com', '21999990035', 'mariana1993'),
(37, 4, 16, 'Eduardo Souza', '123.456.789-36', '1991-01-07', 33, 'Cartão de Crédito', 'eduardo@exemplo.com', '21999990036', 'eduardo1991'),
(38, 4, 16, 'Natália Ribeiro', '123.456.789-37', '1988-02-08', 36, 'Cartão de Débito', 'natalia@exemplo.com', '21999990037', 'natalia1988'),
(39, 4, 16, 'Leandro Pereira', '123.456.789-38', '1984-03-09', 40, 'PIX', 'leandro@exemplo.com', '21999990038', 'leandro1984'),
(40, 4, 16, 'Vânia Oliveira', '123.456.789-39', '1987-04-10', 37, 'Cartão de Crédito', 'vania@exemplo.com', '21999990039', 'vania1987'),
(41, 5, 21, 'Bruno Lima', '123.456.789-40', '1986-05-11', 38, 'Cartão de Débito', 'bruno@exemplo.com', '21999990040', 'bruno1986'),
(42, 5, 21, 'Alessandra Costa', '123.456.789-41', '1985-06-12', 39, 'PIX', 'alessandra@exemplo.com', '21999990041', 'alessandra1985'),
(43, 5, 21, 'Maurício Mendes', '123.456.789-42', '1989-07-13', 35, 'Cartão de Crédito', 'mauricio@exemplo.com', '21999990042', 'mauricio1989'),
(44, 5, 21, 'Érica Lima', '123.456.789-43', '1992-08-14', 32, 'Cartão de Débito', 'erica@exemplo.com', '21999990043', 'erica1992'),
(45, 5, 21, 'Gustavo Matos', '123.456.789-44', '1990-09-15', 34, 'PIX', 'gustavo@exemplo.com', '21999990044', 'gustavo1990'),
(46, 5, 21, 'Cíntia Rodrigues', '123.456.789-45', '1983-10-16', 41, 'Cartão de Crédito', 'cintia@exemplo.com', '21999990045', 'cintia1983'),
(47, 5, 21, 'Samuel Souza', '123.456.789-46', '1988-11-17', 36, 'Cartão de Débito', 'samuel@exemplo.com', '21999990046', 'samuel1988'),
(48, 5, 21, 'Thaís Mendes', '123.456.789-47', '1991-12-18', 33, 'PIX', 'thais@exemplo.com', '21999990047', 'thais1991'),
(49, 5, 21, 'Renata Silva', '123.456.789-48', '1987-01-19', 37, 'Cartão de Crédito', 'renata@exemplo.com', '21999990048', 'renata1987'),
(50, 5, 21, 'Jorge Oliveira', '123.456.789-49', '1986-02-20', 38, 'Cartão de Débito', 'jorge@exemplo.com', '21999990049', 'jorge1986'),
(51, 6, 26, 'Paulo Santos', '123.456.789-50', '1993-03-21', 31, 'PIX', 'paulo@exemplo.com', '21999990050', 'paulo1993'),
(52, 6, 26, 'Fabiana Lima', '123.456.789-51', '1990-04-22', 34, 'Cartão de Crédito', 'fabiana@exemplo.com', '21999990051', 'fabiana1990'),
(53, 6, 26, 'Sérgio Almeida', '123.456.789-52', '1988-05-23', 36, 'Cartão de Débito', 'sergio@exemplo.com', '21999990052', 'sergio1988'),
(54, 6, 26, 'Lívia Souza', '123.456.789-53', '1992-06-24', 32, 'PIX', 'livia@exemplo.com', '21999990053', 'livia1992'),
(55, 6, 26, 'Rodrigo Matos', '123.456.789-54', '1985-07-25', 39, 'Cartão de Crédito', 'rodrigo@exemplo.com', '21999990054', 'rodrigo1985'),
(56, 6, 26, 'Monica Mendes', '123.456.789-55', '1984-08-26', 40, 'Cartão de Débito', 'monica@exemplo.com', '21999990055', 'monica1984'),
(57, 6, 26, 'Eduarda Costa', '123.456.789-56', '1991-09-27', 33, 'PIX', 'eduarda@exemplo.com', '21999990056', 'eduarda1991'),
(58, 6, 26, 'Rafaela Oliveira', '123.456.789-57', '1987-10-28', 37, 'Cartão de Crédito', 'rafaela@exemplo.com', '21999990057', 'rafaela1987'),
(59, 6, 26, 'Lucas Silva', '123.456.789-58', '1994-11-29', 30, 'Cartão de Débito', 'lucas@exemplo.com', '21999990058', 'lucas1994'),
(60, 6, 26, 'Carolina Alves', '123.456.789-59', '1989-12-30', 35, 'PIX', 'carolina@exemplo.com', '21999990059', 'carolina1989');


INSERT INTO Apresentacoes (ID_Apresentacao, ID_Artista, ID_Edicao, Nome_Artista, Qtd_Edicoes_Apresentadas, Nome_Local, Data_Hora_Apresentacao)
VALUES
(1, 1, 1, 'Show da Glória Groove', 1, 'Maracanã', '2019-07-26 14:00:00'),
(2, 2, 1, 'Show da Ariana Grande', 1, 'Maracanã', '2019-07-26 18:00:00'),
(3, 3, 1, 'Show da Marina Sena', 1, 'Maracanã', '2019-07-27 14:00:00'),
(4, 4, 1, 'Show da Katy Perry', 1, 'Maracanã', '2019-07-27 18:00:00'),
(5, 5, 1, 'Show da Anitta', 2, 'Maracanã', '2019-07-28 14:00:00'),
(6, 6, 1, 'Show da Nicki Minaj', 1, 'Maracanã', '2019-07-28 18:00:00'),
(7, 7, 2, 'Show do Jão', 1, 'Copacabana', '2020-01-24 14:00:00'),
(8, 8, 2, 'Show do Bruno Mars', 1, 'Copacabana', '2020-01-24 18:00:00'),
(9, 9, 2, 'Show da Lexa', 1, 'Copacabana', '2020-01-25 14:00:00'),
(10, 10, 2, 'Show da Mariah Carey', 1, 'Copacabana', '2020-01-25 18:00:00'),
(11, 11, 2, 'Show da Luísa Sonza', 2, 'Copacabana', '2020-01-26 14:00:00'),
(12, 12, 2, 'Show da Billie Eilish', 1, 'Copacabana', '2020-01-26 18:00:00'),
(13, 13, 3, 'Show da Iza', 1, 'Marina da Glória', '2021-11-26 14:00:00'),
(14, 14, 3, 'Show da Rihanna', 1, 'Marina da Glória', '2021-11-26 18:00:00'),
(15, 15, 3, 'Show da Ludmilla', 1, 'Marina da Glória', '2021-11-27 14:00:00'),
(16, 16, 3, 'Show da Beyoncé', 1, 'Marina da Glória', '2021-11-27 18:00:00'),
(17, 17, 3, 'Show da Pabllo Vittar', 1, 'Marina da Glória', '2021-11-28 14:00:00'),
(18, 18, 3, 'Show da Madonna', 1, 'Marina da Glória', '2021-11-28 18:00:00'),
(19, 19, 4, 'Show da Anitta', 2, 'Parque Olímpico', '2022-05-27 14:00:00'),
(20, 20, 4, 'Show da Miley Cyrus', 1, 'Parque Olímpico', '2022-05-27 18:00:00'),
(21, 21, 4, 'Show da Luisa Sonza', 2, 'Parque Olímpico', '2022-05-28 14:00:00'),
(22, 22, 4, 'Show da Demi Lovato', 1, 'Parque Olímpico', '2022-05-28 18:00:00'),
(23, 23, 4, 'Show da Flora Matos', 1, 'Parque Olímpico', '2022-05-29 14:00:00'),
(24, 24, 4, 'Show da Cardi B', 1, 'Parque Olímpico', '2022-05-29 18:00:00'),
(25, 25, 5, 'Show da Clarice Falcão', 1, 'Engenhão', '2023-05-26 14:00:00'),
(26, 26, 5, 'Show da Melanie Martinez', 1, 'Engenhão', '2023-05-26 18:00:00'),
(27, 27, 5, 'Show da Pocah', 1, 'Engenhão', '2023-05-27 14:00:00'),
(28, 28, 5, 'Show da Lana Del Rey', 1, 'Engenhão', '2023-05-27 18:00:00'),
(29, 29, 5, 'Show da Liniker', 1, 'Engenhão', '2023-05-28 14:00:00'),
(30, 30, 5, 'Show da Adele', 1, 'Engenhão', '2023-05-28 18:00:00'),
(31, 31, 6, 'Show da Ivete Sangalo', 1, 'Barra da Tijuca', '2024-05-31 14:00:00'),
(32, 32, 6, 'Show da Dua Lipa', 1, 'Barra da Tijuca', '2024-05-31 18:00:00'),
(33, 33, 6, 'Show da Paula Fernandes', 1, 'Barra da Tijuca', '2024-06-01 14:00:00'),
(34, 34, 6, 'Show da Taylor Swift', 1, 'Barra da Tijuca', '2024-06-01 18:00:00'),
(35, 35, 6, 'Show da Pitty', 1, 'Barra da Tijuca', '2024-06-02 14:00:00'),
(36, 36, 6, 'Show da Lady Gaga', 1, 'Barra da Tijuca', '2024-06-02 18:00:00');

INSERT INTO Ingressos_Apresentacoes (ID_Ingresso, ID_Apresentacao)
VALUES
(1, 1), (1, 3), 
(2, 2), (2, 4), 
(3, 5), (3, 6), 
(4, 1), (4, 5), 
(5, 2), (5, 4),
(6, 1), (6, 6), 
(7, 2), (7, 3), 
(8, 4), (8, 6), 
(9, 1), (9, 2), 
(10, 3), (10, 5),
(11, 7), (11, 10), 
(12, 8), (12, 11), 
(13, 9), (13, 12), 
(14, 7), (14, 9), 
(15, 10), (15, 11),
(16, 8), (16, 12), 
(17, 7), (17, 8), 
(18, 9), (18, 10), 
(19, 11), (19, 12), 
(20, 7), (20, 8),
(21, 13), (21, 14), 
(22, 15), (22, 18), 
(23, 16), (23, 13), 
(24, 14), (24, 17), 
(25, 13), (25, 15),
(26, 16), (26, 17), 
(27, 13), (27, 18), 
(28, 14), (28, 13), 
(29, 15), (29, 17), 
(30, 16), (30, 18),
(31, 19), (31, 22), 
(32, 20), (32, 23), 
(33, 21), (33, 24), 
(34, 19), (34, 23), 
(35, 20), (35, 22),
(36, 21), (36, 24), 
(37, 19), (37, 24), 
(38, 20), (38, 23), 
(39, 21), (39, 22), 
(40, 19), (40, 23),
(41, 25), (41, 28), 
(42, 26), (42, 29), 
(43, 27), (43, 30), 
(44, 25), (44, 29), 
(45, 26), (45, 28),
(46, 27), (46, 30), 
(47, 25), (47, 30), 
(48, 26), (48, 29), 
(49, 27), (49, 28), 
(50, 25), (50, 29),
(51, 31), (51, 34), 
(52, 32), (52, 35), 
(53, 33), (53, 36), 
(54, 31), (54, 35), 
(55, 32), (55, 34),
(56, 33), (56, 36), 
(57, 31), (57, 36), 
(58, 32), (58, 35), 
(59, 33), (59, 34), 
(60, 31), (60, 35);

INSERT INTO QtdShows_Ingressos (ID_QtdShows_Ingressos, ID_Ingresso, ID_Apresentacao, QtdShows_Ingressos)
SELECT 
    ROW_NUMBER() OVER(ORDER BY ID_Ingresso, ID_Apresentacao) AS ID_QtdShows_Ingressos,
    ID_Ingresso,
    ID_Apresentacao,
    COUNT(*) AS QtdShows_Ingressos
FROM Ingressos_Apresentacoes
GROUP BY ID_Ingresso, ID_Apresentacao;

INSERT INTO Atividades_Extras (ID_AtividadesExtras, ID_Local, ID_Apresentacao, Descricao_AtividadesExtras)
VALUES
(1, 1, 1, 'Passarela Riachuelo com Glória Groove e fãs - 2019-07-26 12:00:00'),
(2, 1, 2, 'Entrevista com Ariana Grande - 2019-07-27 23:00:00'),
(3, 1, 3, 'Quiz Seara com Marina Sena e fãs - 2019-07-27 12:00:00'),
(4, 4, 1, 'Entrevista com Katy Perry - 2019-07-27 23:00:00'),
(5, 1, 5, 'Gincana Coca-Cola com Anitta e fãs - 2019-07-28 12:00:00'),
(6, 1, 6, 'Entrevista com Nicki Minaj - 2019-07-28 23:00:00'),
(7, 1, 7, 'Desfile de moda com Jão e fãs - 2020-01-24 10:00:00'),
(8, 1, 8, 'Sessão de autógrafos com Bruno Mars - 2020-01-24 17:00:00'),
(9, 1, 9, 'Sessão de fotos com Lexa - 2020-01-25 11:00:00'),
(10, 1, 10, 'Entrevista com Mariah Carey - 2020-01-25 17:00:00'),
(11, 1, 11, 'Bate-papo com Luísa Sonza - 2020-01-26 12:00:00'),
(12, 1, 12, 'Meet & Greet com Billie Eilish - 2020-01-26 16:00:00'),
(13, 3, 13, 'Gincana Chiquinho Sorvetes com Iza e fãs - 2021-11-26 10:00:00'),
(14, 3, 14, 'Produtos Amazon autografados pela Rihanna ao vivo - 2021-11-26 17:00:00'),
(15, 3, 15, 'Bate-papo Saraiva com Ludmilla - 2021-11-27 11:00:00'),
(16, 3, 16, 'Desfile C&A com Beyoncé e fãs - 2021-11-27 16:00:00'),
(17, 3, 17, 'Quiz com Pabllo Vittar, patrocinado pela Fanta - 2021-11-28 12:00:00'),
(18, 3, 18, 'Entrevista com Madonna - 2021-11-28 22:00:00'),
(19, 4, 19, 'Quiz Havaianas com Anitta e fãs - 2022-05-27 12:00:00'),
(20, 4, 20, 'Entrevista com Miley Cyrus feita pela Lu do Magalu - 2022-05-27 16:00:00'),
(21, 4, 21, 'Gincana Bobs com Luisa Sonza e fãs - 2022-05-28 10:00:00'),
(22, 4, 22, 'After Party com Demi Lovato, patrocinado pela Monster - 2022-05-29 00:00:00'),
(23, 4, 23, 'Respondendo comentários com Flora Matos - 2022-05-29 12:00:00'),
(24, 4, 24, 'Meet & Greet com Cardi B - 2022-05-29 16:00:00'),
(25, 5, 25, 'Sarau com Clarice Falcão - 2023-05-26 10:00:00'),
(26, 5, 26, 'Meet & Greet Burguer King com Melanie Martinez e fãs - 2023-05-26 16:00:00'),
(27, 5, 27, 'Gincana Kuat com Pocah e fãs - 2023-05-27 10:00:00'),
(28, 5, 28, 'Pré-Show Pantene com Lana Del Rey e fãs - 2023-05-27 16:00:00'),
(29, 5, 29, 'Bate-papo com Liniker - 2023-05-28 12:00:00'),
(30, 5, 30, 'Produtos Ipanema autografados pela Adele ao vivo - 2023-05-28 16:00:00'),
(31, 6, 31, 'Gincana Dove com Ivete Sangalo e fãs - 2024-05-31 11:00:00'),
(32, 6, 32, 'After Party com Dua Lipa, patrocinado pela Schweppes - 2024-06-01 00:00:00'),
(33, 6, 33, 'Entrevista com Paula Fernandes - 2024-06-01 10:00:00'),
(34, 6, 34, 'Desfile de moda Adidas com Taylor Swift e fãs- 2024-06-01 16:00:00'),
(35, 6, 35, 'Quiz Subway com Pitty e fãs - 2024-06-02 12:00:00'),
(36, 6, 36, 'Meet & Greet TikTok com Lady Gaga - 2024-06-02 23:00:00');



INSERT INTO Atividades_Extras (ID_AtividadesExtras, ID_Local, ID_Apresentacao, Descricao_AtividadesExtras)
VALUES
(37, 6, 37, 'Esquenta Pop Pan com Camila Loures - 2024-05-30 23:00:00');

INSERT INTO Atividades_Extras (ID_AtividadesExtras, ID_Local, ID_Apresentacao, Descricao_AtividadesExtras)
VALUES
(38, 6, 38, 'Susana Vieira entrevistando fãs na fila - 2024-05-30 11:00:00');

INSERT INTO Atividades_Extras (ID_AtividadesExtras, ID_Local, ID_Apresentacao, Descricao_AtividadesExtras)
VALUES
(39, 6, 39, 'Comentando comentários com Kefera - 2024-06-01 23:00:00');

SELECT * FROM Atividades_Extras;

SELECT * FROM Edicoes;

SELECT * FROM Artistas;

UPDATE Edicoes
SET Tema = 'Pop Pan 2024 - Rehab'
WHERE ID_Edicao = 6;

SELECT * FROM Edicoes;

UPDATE Ingressos
SET Nome = 'Rita Garcia'
WHERE ID_Ingresso = 50;

SELECT * FROM Ingressos;

DELETE FROM Atividades_Extras
WHERE ID_AtividadesExtras = 38;

DELETE FROM Atividades_Extras
WHERE ID_AtividadesExtras = 39;

SELECT * FROM Atividades_Extras;

SELECT a.Nome, rs.Nome_RedeSocial
FROM Artistas a
JOIN RedesSociais_Artistas rs ON a.ID_Artista = rs.ID_Artista;

SELECT e.Tema, l.Nome
FROM Edicoes e
JOIN Local l ON e.ID_Edicao = l.ID_Edicao;

SELECT p.Nome_Artista, a.Nome
FROM Apresentacoes p
JOIN Artistas a ON p.ID_Artista = a.ID_Artista;

SELECT i.Nome, i.Email_Comprador
FROM Ingressos i;

SELECT eq.Nome, te.Nome_Tarefas_Equipe
FROM Equipes eq
JOIN Tarefas_Equipe te ON eq.ID_Equipe = te.ID_Equipe;

SELECT ae.Descricao_AtividadesExtras, p.Nome_Artista
FROM Atividades_Extras ae
JOIN Apresentacoes p ON ae.ID_Apresentacao = p.ID_Apresentacao;

SELECT p.Nome_Patrocinador, e.Tema
FROM Patrocinadores p
JOIN Edicoes e ON p.ID_Edicao = e.ID_Edicao;

SELECT te.Nome_Tarefas_Equipe, eq.Nome
FROM Tarefas_Equipe te
JOIN Equipes eq ON te.ID_Equipe = eq.ID_Equipe;

SELECT i.Nome, p.Nome_Artista
FROM Ingressos_Apresentacoes ia
JOIN Ingressos i ON ia.ID_Ingresso = i.ID_Ingresso
JOIN Apresentacoes p ON ia.ID_Apresentacao = p.ID_Apresentacao;

SELECT e.Tema, a.Nome
FROM Edicoes e
JOIN Edicoes_Artistas ea ON e.ID_Edicao = ea.ID_Edicao
JOIN Artistas a ON ea.ID_Artista = a.ID_Artista;
