## Banco de Dados Biblioteca
## Descrição do Projeto

Este projeto consiste na criação de um banco de dados relacional para gerenciamento de uma biblioteca, contendo informações sobre:

- Autores
- Editoras
- Categorias
- Livros
- Relação livro–autor
- Usuários
- Empréstimos

## O objetivo é organizar e controlar livros, usuários e empréstimos de forma estruturada, utilizando MySQL.
## Estrutura do Banco de Dados

O banco é criado com:

CREATE DATABASE biblioteca;
USE biblioteca;

## Tabelas
1. autores
Armazena os autores dos livros.

Coluna	Tipo	Descrição
id_autor	INT (PK)	Identificador único
nome	VARCHAR(100)	Nome do autor
nacionalidade	VARCHAR(50)	Nacionalidade
data_nascimento	DATE	Data de nascimento

## 2. editoras
Armazena as informações das editoras.

Coluna	Tipo	Descrição
id_editora	INT (PK)	Identificador único
nome	VARCHAR(100)	Nome da editora
cidade	VARCHAR(100)	Cidade
estado	VARCHAR(50)	Estado

## 3. categorias
Categorias dos livros.

Coluna	Tipo	Descrição
id_categoria	INT (PK)	Identificador único
nome	VARCHAR(100)	Nome da categoria

## 4. livros
Armazena os dados dos livros cadastrados.

Coluna	Tipo	Descrição
id_livro	INT (PK)	Identificador único
titulo	VARCHAR(200)	Título do livro
ano_publicacao	YEAR	Ano de publicação
isbn	VARCHAR(20)	Código ISBN
id_editora	INT (FK)	Referência à tabela editoras
id_categoria	INT (FK)	Referência à tabela categorias
quantidade_total	INT	Total de exemplares
quantidade_disponivel	INT	Quantidade disponível

## 5. livros_autores
Relação N:N entre livros e autores.

Coluna	Tipo	Descrição
id_livro	INT	FK → livros(id_livro)
id_autor	INT	FK → autores(id_autor)
Chave primária composta: (id_livro, id_autor).

## 6. usuarios
Usuários da biblioteca.

Coluna	Tipo	Descrição
id_usuario	INT (PK)	Identificador único
nome	VARCHAR(150)	Nome do usuário
email	VARCHAR(100)	E-mail (único)
telefone	VARCHAR(30)	Telefone
endereco	VARCHAR(200)	Endereço

## 7. emprestimos
Registra os empréstimos de livros.

Coluna	Tipo	Descrição
id_emprestimo	INT (PK)	Identificador único
id_usuario	INT (FK)	Usuário que fez o empréstimo
data_emprestimo	DATE	Data do empréstimo
data_devolucao_prevista	DATE	Prazo de devolução
data_devolucao_real	DATE	Data de devolução (se houver)

## Diagrama Lógico (Descrição Textual)
AUTOR 1---N LIVROS_AUTORES N---1 LIVRO
LIVRO 1---N EMPRESTIMOS? (apenas via usuário)
LIVRO N---1 CATEGORIA
LIVRO N---1 EDITORA
USUÁRIO 1---N EMPRÉSTIMOS

## Inserção de Dados (Inserts)

Os dados iniciais incluem:

## Autores
INSERT INTO autores (nome, nacionalidade, data_nascimento)
VALUES
('Kōhei Horikoshi', 'JAPA', '1839-06-21'),
('Natsuki Kizu' , 'JAPA', '1965-07-31'),
('Hiromu Arakawa', 'JAPA', '1903-06-25');

## Editoras
INSERT INTO editoras (nome, cidade, estado)
VALUES
('Editora ABEL', 'RECIFE', 'PE'),
('Editora Porto Digital', 'RECIFE', 'PE'),
('Editora Senac', 'RECIFE', 'PE');

## Categorias
INSERT INTO categorias (nome)
VALUES
('BL'),
('HEROIS'),
('CIENCIA'),
('SHONEN');

## Livros
INSERT INTO livros (titulo, ano_publicacao, isbn, id_editora, id_categoria, quantidade_total, quantidade_disponivel)
VALUES
('MY HERO ACADEMIA', 2015, '9788538078490', 2, 1, 5, 5),
('GIVEN', 2020, '9788532511016', 3, 2, 10, 10),
('FULLMETAL ALCHEMIST: BROTHERHOOD', 2010, '9780451524935', 2, 3, 7, 7);

## Usuários
INSERT INTO usuarios (nome, email, telefone, endereco)
VALUES
('João da Silva', 'joao@gmail.com', '11988887777', 'Rua A, 123'),
('José Luis', 'luis@gmail.com', '11977776666', 'Rua B, 456');

## Consultas Úteis
Listar todos os livros
SELECT * FROM livros;

## Listar livros com editora e categoria
SELECT 
    l.titulo,
    e.nome AS editora,
    c.nome AS categoria
FROM livros l
JOIN editoras e ON l.id_editora = e.id_editora
JOIN categorias c ON l.id_categoria = c.id_categoria;

## Listar autores de cada livro
SELECT 
    l.titulo,
    a.nome AS autor
FROM livros l
JOIN livros_autores la ON l.id_livro = la.id_livro
JOIN autores a ON la.id_autor = a.id_autor;

Listar usuários cadastrados
SELECT * FROM usuarios;

## Comandos DDL e DML - Explicação Completa com Exemplos

No SQL, os comandos são divididos em categorias de acordo com sua função.
As duas categorias mais importantes são:

- DDL – Data Definition Language (Linguagem de Definição de Dados)
- DML – Data Manipulation Language (Linguagem de Manipulação de Dados)

## DDL - Data Definition Language

Os comandos DDL são usados para criar, alterar e excluir estruturas do banco de dados, como tabelas, colunas e o próprio banco.
Esses comandos modificam a estrutura, não os dados.

Principais comandos DDL:

- CREATE – Criar banco, tabela ou outro objeto.
- ALTER – Alterar uma estrutura existente.
- DROP – Excluir uma tabela, coluna ou banco de dados.

## DML — Data Manipulation Language

Os comandos DML são usados para manipular os dados dentro das tabelas.
Eles não alteram a estrutura, apenas inserem, atualizam, consultam e removem informações.

Principais comandos DML:

- INSERT – Inserir dados
- UPDATE – Atualizar dados
- DELETE – Excluir dados
- SELECT – Consultar dadoS

##     Como executar

Instale o MySQL Server
Abra o MySQL Workbench ou terminal.
Execute todo o script SQL fornecido.
Utilize as consultas SELECT para visualizar os dados.

## Licença

Projeto livre para estudo e modificação.
