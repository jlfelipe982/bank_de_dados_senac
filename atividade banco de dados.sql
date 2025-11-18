CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE
);
    
CREATE TABLE editoras (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100),
    estado VARCHAR(50)
);

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);


CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    ano_publicacao YEAR,
    isbn VARCHAR(20),
    id_editora INT,
    id_categoria INT,
    quantidade_total INT NOT NULL DEFAULT 1,
    quantidade_disponivel INT NOT NULL DEFAULT 1,
    FOREIGN KEY (id_editora) REFERENCES editoras(id_editora),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE livros_autores (
    id_livro INT,
    id_autor INT,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro),
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(30),
    endereco VARCHAR(200)
);

CREATE TABLE emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao_prevista DATE NOT NULL,
    data_devolucao_real DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO autores (nome, nacionalidade, data_nascimento)
VALUES
('Kōhei Horikoshi', 'JAPA', '1839-06-21'),
('Natsuki Kizu' , 'JAPA', '1965-07-31'),
('Hiromu Arakawa', 'JAPA', '1903-06-25');

INSERT INTO editoras (nome, cidade, estado)
VALUES
('Editora ABEL', 'RECIFE', 'PE'),
('Editora Porto Digital', 'RECIFE', 'PE'),
('Editora Senac', 'RECIFE', 'PE');

INSERT INTO categorias (nome)
VALUES
('BL'),
('HEROIS'),
('CIENCIA'),
('SHONEN');

INSERT INTO livros (titulo, ano_publicacao, isbn, id_editora, id_categoria, quantidade_total, quantidade_disponivel)
VALUES
('MY HERO ACADEMIA', 2015, '9788538078490', 2, 1, 5, 5),
('GIVEN', 2020, '9788532511016', 3, 2, 10, 10),
('FULLMETAL ALCHEMIST: BROTHERHOOD', 2010, '9780451524935', 2, 3, 7, 7);

INSERT INTO usuarios (nome, email, telefone, endereco)
VALUES
('João da Silva', 'joao@gmail.com', '11988887777', 'Rua A, 123'),
('José Luis', 'luis@gmail.com', '11977776666', 'Rua B, 456');


-- ALTER TABLE livros DROP COLUMN quantidade_total;
-- ALTER TABLE livros DROP COLUMN quantidade_disponivel;

-- alter table livros
-- add quantidade_total INT NOT NULL DEFAULT 1,
-- add quantidade_disponivel INT NOT NULL DEFAULT 1;

SELECT * FROM livros;
SELECT * FROM autores;
SELECT * FROM editoras;	
SELECT * FROM categorias;
SELECT * FROM usuarios;
