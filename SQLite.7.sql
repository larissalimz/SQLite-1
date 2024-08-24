-- - - - - - - - - - - - - - - - - -  DESAFIO 1 - SQLite - - - - - - - - - - - - - - - -- - - - - - - - -

--Sua missão é dar os primeiros passos para configurar e usar esse banco de dados.

--1 - CRIAR TABELAS:
--O primeiro passo é definir a estrutura do banco de dados, criando tabelas para armazenar informações específicas. 
--Utilizaremos SQL (Structured Query Language) para criar as tabelas. Aqui estão os dados que você pode utilizar:

--Tabela "Alunos" armazenará informações sobre os estudantes, como:

--ID do Aluno: Um identificador único para cada aluno.
--Nome do Aluno: O nome completo do aluno.
--Data de Nascimento: A data de nascimento do aluno.
--Gênero: O gênero do aluno (masculino, feminino, outros).
--Endereço: O endereço do aluno.
--Telefone de Contato: O número de telefone de contato do aluno.
--E-mail: O endereço de e-mail do aluno.
--Tabela "Professores" conterá detalhes sobre os professores da escola:

--ID do Professor: Um identificador único para cada professor.
--Nome do Professor: O nome completo do professor.
--Data de Nascimento: A data de nascimento do professor.
--Gênero: O gênero do professor.
--Telefone de Contato: O número de telefone de contato do professor.
--E-mail: O endereço de e-mail do professor.
--Tabela "Disciplinas" manterá registros das matérias oferecidas, incluindo:

--ID da Disciplina: Um identificador único para cada disciplina.
--Nome da Disciplina: O nome da disciplina.
--Descrição: Uma descrição da disciplina.
--Carga Horária: A carga horária da disciplina.
--ID do Professor: Uma chave estrangeira que faz referência ao professor que leciona a disciplina.
--Tabela "Turmas" será usada para registrar turmas específicas:

--ID da Turma: Um identificador único para cada turma.
--Nome da Turma: O nome ou código da turma.
--Ano Letivo: O ano letivo da turma.
--ID do Professor Orientador: Uma chave estrangeira que faz referência ao professor que orienta a turma.
--Tabela "Turma_Disciplinas" armazenara os dados das associações entre turmas e disciplinas:

--ID da Turma: Uma lista de chaves estrangeiras que fazem referência as turmas existentes.
--ID das Disciplinas: Uma lista de chaves estrangeiras que fazem referência às disciplinas ministradas na turma.
--OBS.: Os dois campos juntos formam a chave primaria da tabela

--Tabela "Turma_Alunos" será usada para registrar os dados das associações entre turmas e alunos:

--ID da Turma: Uma lista de chaves estrangeiras que fazem referência as turmas existentes.
--ID dos Alunos: Uma lista de chaves estrangeiras que fazem referência aos alunos matriculados na turma.
--OBS.: Os dois campos juntos formam a chave primaria da tabela

--Tabela "Notas" guardará as notas dos alunos em diferentes disciplinas:

--ID da Nota: Um identificador único para cada nota.
--ID do Aluno: Uma chave estrangeira que faz referência ao aluno.
--ID da Disciplina: Uma chave estrangeira que faz referência à disciplina.
--Valor da Nota: A nota atribuída ao aluno na disciplina.
--Data da Avaliação: A data em que a avaliação foi realizada.



-- - - - - - - - - - - - - - - Criando as Tabelas  - - - - - - - - - - - - - - - - - - - - - -



CREATE TABLE Alunos (
    ID_Aluno INT PRIMARY KEY,
    Nome_Aluno VARCHAR(100) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Genero VARCHAR(10),
    Endereco VARCHAR(200),
    Telefone_Contato VARCHAR(15),
    Email VARCHAR(100)
);


CREATE TABLE Professores (
    ID_Professor INT PRIMARY KEY,
    Nome_Professor VARCHAR(100) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Genero VARCHAR(10),
    Telefone_Contato VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Disciplinas (
    ID_Disciplina INT PRIMARY KEY,
    Nome_Disciplina VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Carga_Horaria INT NOT NULL,
    ID_Professor INT,
    FOREIGN KEY (ID_Professor) REFERENCES Professores(ID_Professor)
);

CREATE TABLE Turmas (
    ID_Turma INT PRIMARY KEY,
    Nome_Turma VARCHAR(50) NOT NULL,
    Ano_Letivo YEAR NOT NULL,
    ID_Professor_Orientador INT,
    FOREIGN KEY (ID_Professor_Orientador) REFERENCES Professores(ID_Professor)
);

CREATE TABLE Turma_Disciplinas (
    ID_Turma INT,
    ID_Disciplina INT,
    PRIMARY KEY (ID_Turma, ID_Disciplina),
    FOREIGN KEY (ID_Turma) REFERENCES Turmas(ID_Turma),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplinas(ID_Disciplina)
);

CREATE TABLE Turma_Alunos (
    ID_Turma INT,
    ID_Aluno INT,
    PRIMARY KEY (ID_Turma, ID_Aluno),
    FOREIGN KEY (ID_Turma) REFERENCES Turmas(ID_Turma),
    FOREIGN KEY (ID_Aluno) REFERENCES Alunos(ID_Aluno)
);

CREATE TABLE Notas (
    ID_Nota INT PRIMARY KEY,
    ID_Aluno INT,
    ID_Disciplina INT,
    Valor_Nota DECIMAL(5, 2) NOT NULL,
    Data_Avaliacao DATE NOT NULL,
    FOREIGN KEY (ID_Aluno) REFERENCES Alunos(ID_Aluno),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplinas(ID_Disciplina)
);


-- - - - - - - - - - - - - - - - -  Inserindo valores - - - - - - - - - - - - - - - - - - - - - - -

 
INSERT INTO Alunos (id_aluno,nome_aluno,data_nascimento,genero,endereco, telefone_contato, email)
VALUES
('1',	'João Silva', '2005-03-15',	'Masculino' ,	'Rua das Flores, 123',	'(11) 9876-5432',	'joao@email.com'),
('2',	'Maria Santos', '2006-06-20',	'Feminino',	'Avenida Principal, 456', '(11) 8765-4321',	'maria@email.com'),
('3',	'Pedro Soares',	'2004-01-10',	'Masculino',	'Rua Central, 789',	'(11) 7654-3210'	,'pedro@email.com'),
('4',	'Ana Lima', '2005-04-02',	'Feminino',	'Rua da Escola, 56',	'(11) 8765-4321',	'ana@email.com'),
('5',	'Mariana Fernandes',	'2005-08-12',	'Feminino',	'Avenida da Paz, 789' ,	'(11) 5678-1234',	'mariana@email.com'),
('6',	'Lucas Costa',	'2003-11-25',	'Masculino',	'Rua Principal, 456',	'(11) 1234-5678',	'lucas@email.com'),
('7',	'Isabela Santos',	'2006-09-10',	'Feminino',	'Rua da Amizade, 789',	'(11) 9876-5432',	'isabela@email.com'),
('8',	'Gustavo Pereira',	'2004-05-15',	'Masculino','Avenida dos Sonhos, 123',	'(11) 7654-3210',	'gustavo@email.com'),
('9',	'Carolina Oliveira',	'2005-02-20',	'Feminino',	'Rua da Alegria, 456',	'(11) 8765-4321',	'carolina@email.com'),
('10',	'Daniel Silva',	'2003-10-05',	'Masculino',	'Avenida Central, 789',	'(11) 1234-5678',	'daniel@email.com'),
('11',	'Larissa Souza',	'2004-12-08',	'Feminino',	'Rua da Felicidade, 123',	'(11) 9876-5432',	'larissa@email.com'),
('12',	'Bruno Costa',	'2005-07-30',	'Masculino',	'Avenida Principal, 456',	'(11) 7654-3210',	'bruno@email.com'),
('13',	'Camila Rodrigues',	'2006-03-22',	'Feminino',	'Rua das Estrelas, 789',	'(11) 8765-4321',	'camila@email.com'),
('14',	'Rafael Fernandes',	'2004-11-18',	'Masculino'	,'Avenida dos Sonhos, 123',	'(11) 1234-5678',	'rafael@email.com'),
('15',	'Letícia Oliveira',	'2005-01-05',	'Feminino',	'Rua da Alegria, 456',	'(11) 9876-5432',	'leticia@email.com'),
('16',	'Fernanda Lima',	'2004-02-12',	'Feminino',	'Rua da Esperança, 789',	'(11) 4567-8901',	'fernanda@email.com'),
('17',	'Vinícius Santos',	'2003-07-28',	'Masculino',	'Avenida da Amizade, 123',	'(11) 8901-2345',	'vinicius@email.com'),
('18',	'Juliana Pereira',	'2006-09-01',	'Feminino',	'Rua das Rosas, 789',	'(11) 3456-7890'	,'juliana@email.com');


INSERT INTO Turmas (ID_Turma, Nome_Turma, Ano_Letivo, ID_Professor_Orientador)
VALUES
(1, 'Turma A', 2023, 1),
(2, 'Turma B', 2023, 2),
(3, 'Turma C', 2023, 3),
(4, 'Turma D', 2023, 4),
(5, 'Turma E', 2023, 5);


INSERT INTO Disciplinas (ID_Disciplina, Nome_Disciplina, Descricao, Carga_Horaria, ID_Professor)
VALUES
(1, 'Matemática', 'Estudo de conceitos matemáticos avançados', 60, 1),
(2, 'História', 'História mundial e local', 45, 2),
(3, 'Física', 'Princípios fundamentais da física', 60, 1),
(4, 'Química', 'Estudo da química e suas aplicações', 45, 3),
(5, 'Inglês', 'Aulas de inglês para iniciantes', 45, 4),
(6, 'Artes', 'Exploração da criatividade artística', 30, 5);


INSERT INTO Notas (ID_Nota, ID_Disciplina, ID_Aluno, valor_nota, data_avaliacao)
VALUES
(2, 1, 1, 6.19, '2023-07-07'),
(3, 1, 2, 7.18, '2023-07-07'),
(4, 1, 3, 7.47, '2023-07-07'),
(5, 1, 4, 7.46, '2023-07-07'),
(6, 1, 5, 4.35, '2023-07-07'),
(7, 1, 6, 4.43, '2023-07-07'),
(8, 1, 7, 0.76, '2023-07-07'),
(9, 1, 8, 9.22, '2023-07-07'),
(10, 1, 9, 9.04, '2023-07-07'),
(11, 1, 10, 3.28, '2023-07-07'),
(12, 2, 1, 1.34, '2023-07-09'),
(13, 2, 2, 3.10, '2023-07-09'),
(14, 2, 3, 1.66, '2023-07-09'),
(15, 2, 4, 0.03, '2023-07-09'),
(16, 2, 5, 4.34, '2023-07-09'),
(17, 2, 6, 4.02, '2023-07-09'),
(18, 2, 7, 8.79, '2023-07-09'),
(19, 2, 8, 1.17, '2023-07-09'),
(20, 2, 9, 8.26, '2023-07-09'),
(21, 2, 10, 3.41, '2023-07-09'),
(22, 3, 1, 6.82, '2023-07-27'),
(23, 3, 2, 8.21, '2023-07-27'),
(24, 3, 3, 1.30, '2023-07-27'),
(25, 3, 4, 4.01, '2023-07-27'),
(26, 3, 5, 0.25, '2023-07-27'),
(27, 3, 6, 6.63, '2023-07-27'),
(28, 3, 7, 9.74, '2023-07-27'),
(29, 3, 8, 3.77, '2023-07-27'),
(30, 3, 9, 0.58, '2023-07-27'),
(31, 3, 10, 8.52, '2023-07-27'),
(32, 4, 1, 8.37, '2023-08-08'),
(33, 4, 2, 0.26, '2023-08-08'),
(34, 4, 3, 5.95, '2023-08-08'),
(35, 4, 4, 6.98, '2023-08-08'),
(36, 4, 5, 6.18, '2023-08-08'),
(37, 4, 6, 4.79, '2023-08-08'),
(38, 4, 7, 7.96, '2023-08-08'),
(39, 4, 8, 0.62, '2023-08-08'),
(40, 4, 9, 7.77, '2023-08-08'),
(41, 4, 10, 5.81, '2023-08-08'),
(42, 5, 1, 2.25, '2023-08-15'),
(43, 5, 2, 5.82, '2023-08-15'),
(44, 5, 3, 4.11, '2023-08-15'),
(45, 5, 4, 7.99, '2023-08-15'),
(46, 5, 5, 3.23, '2023-08-15'),
(47, 5, 6, 8.09, '2023-08-15'),
(48, 5, 7, 8.24, '2023-08-15'),
(49, 5, 8, 3.33, '2023-08-15'),
(50, 5, 9, 4.24, '2023-08-15'),
(51, 5, 10, 0.11, '2023-08-15');


INSERT INTO Professores (ID_Professor, Nome_Professor, Data_Nascimento, Genero, Telefone_Contato, Email)
VALUES
(1, 'Ana Oliveira', '1980-05-25', 'Feminino', '(11) 1234-5678', 'ana@email.com'),
(2, 'Carlos Ferreira', '1975-09-12', 'Masculino', '(11) 2345-6789', 'carlos@email.com'),
(3, 'Mariana Santos', '1982-03-15', 'Feminino', '(11) 3456-7890', 'mariana@email.com'),
(4, 'Ricardo Silva', '1978-08-20', 'Masculino', '(11) 7890-1234', 'ricardo@email.com'),
(5, 'Fernanda Lima', '1985-01-30', 'Feminino', '(11) 4567-8901', 'fernanda@email.com');


INSERT INTO Turma_Alunos (ID_Turma, ID_Aluno)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10);


INSERT INTO Turma_Disciplinas (ID_Turma, ID_Disciplina)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 3),
(2, 1),
(3, 2);


-- - - - - - - - - - - - - - - - - - - Realizando as consultas solicitadas - - - - - - - -- - - - -- - - - - - 


-- Consulta 1 - Executar consultas para verificar se os dados foram importados corretamente em todas as tabelas.
SELECT * FROM Alunos;
SELECT * FROM Disciplinas;
SELECT * FROM Notas;
SELECT * FROM Professores;
SELECT * FROM Turmas;
SELECT * FROM Turma_Alunos;
SELECT * FROM Turma_Disciplinas;


-- Consulta 2 - Retorne as informações de todos os alunos ordenados pelo nome.
SELECT * FROM Alunos ORDER BY nome_aluno;
                --OU
SELECT Nome_Aluno FROM Alunos ORDER BY Nome_Aluno;


-- Consulta 3 - Retornar a disciplina que possui a carga horaria maior que 40.
SELECT nome_disciplina FROM Disciplinas WHERE carga_horaria>40;


-- Consulta 4 - Buscar as notas que são maiores que 6 e menores que 8.
SELECT * FROM Notas WHERE valor_nota >6 AND valor_nota<8;
 -- OU USANDO O BETWEEN 
 SELECT * FROM NOTAS WHERE valor_nota BETWEEN 6 and 8;



