CREATE TABLE Usuario (
    Endereco VARCHAR,
    CPF CHAR PRIMARY KEY,
    fk_Plano_Premium_CPF CHAR
);

CREATE TABLE Professor (
    Departamento VARCHAR,
    _IP_Identificacao_do_professor CHAR,
    Disciplina VARCHAR,
    fk_Usuario_CPF CHAR,
    PRIMARY KEY (_IP_Identificacao_do_professor, fk_Usuario_CPF)
);

CREATE TABLE Aluno (
    Matricula CHAR,
    _CR__coeficiente_de_rendimento FLOAT,
    Faltas SMALLINT,
    fk_Usuario_CPF CHAR,
    PRIMARY KEY (Matricula, fk_Usuario_CPF)
);

CREATE TABLE Cliente_Externo_ (
    E_mail VARCHAR,
    fk_Usuario_CPF CHAR,
    PRIMARY KEY (E_mail, fk_Usuario_CPF)
);

CREATE TABLE Livro (
    Quant_Estoque SMALLINT,
    ISBN CHAR,
    Titulo VARCHAR,
    fk_Produto_ID CHAR,
    fk_Editora_Codigo CHAR,
    fk_Editora_Nome VARCHAR,
    fk_Editora_E_mail VARCHAR,
    PRIMARY KEY (ISBN, fk_Produto_ID)
);

CREATE TABLE Entrega (
    Frete FLOAT,
    Status VARCHAR,
    Endereco VARCHAR,
    Numero SMALLINT PRIMARY KEY,
    fk_Pedido_Numero SMALLINT
);

CREATE TABLE Autor (
    P_Nome VARCHAR,
    S_Nome VARCHAR
);

CREATE TABLE Editora (
    Codigo CHAR,
    Nome VARCHAR,
    Endereco VARCHAR,
    E_mail VARCHAR,
    PRIMARY KEY (Codigo, Nome, E_mail)
);

CREATE TABLE Categoria (
    ID CHAR PRIMARY KEY,
    Nome VARCHAR,
    Descricao VARCHAR,
    Numero_de_livros SMALLINT
);

CREATE TABLE Avaliacao (
    ID CHAR PRIMARY KEY,
    Tipo CHARACTER,
    Data DATE,
    Comentarios VARCHAR,
    Nota FLOAT
);

CREATE TABLE Pedido (
    Data DATE,
    status VARCHAR,
    Cartao CHAR,
    Dinheiro CHAR,
    Valor FLOAT,
    Produto VARCHAR,
    Numero SMALLINT PRIMARY KEY,
    fk_Usuario_CPF CHAR
);

CREATE TABLE Plano_Premium (
    desconto FLOAT,
    CPF CHAR PRIMARY KEY
);

CREATE TABLE Material_Escolar (
    Caderno FLOAT,
    Bolsa FLOAT,
    Codigo_Barra CHAR,
    fk_Produto_ID CHAR,
    PRIMARY KEY (Codigo_Barra, fk_Produto_ID)
);

CREATE TABLE Produto (
    ID CHAR PRIMARY KEY,
    Nome VARCHAR
);

CREATE TABLE faz (
    fk_Avaliacao_ID CHAR,
    fk_Usuario_CPF CHAR
);

CREATE TABLE escrito (
    fk_Livro_ISBN CHAR,
    fk_Livro_fk_Produto_ID CHAR
);

CREATE TABLE pertence (
    fk_Categoria_ID CHAR,
    fk_Livro_ISBN CHAR,
    fk_Livro_fk_Produto_ID CHAR
);

CREATE TABLE obtem (
    fk_Produto_ID CHAR,
    fk_Pedido_Numero SMALLINT
);

CREATE TABLE recebe (
    fk_Avaliacao_ID CHAR,
    fk_Produto_ID CHAR
);
 

INSERT INTO Usuario (Endereco, CPF, fk_Avaliacao_ID) VALUES
('Rua A, 123', '12345678901', 'AVL001'),
('Avenida B, 456', '98765432109', 'AVL002'),
('Rua C, 789', '24681357902', 'AVL003'),
('Rua D, 321', '13579246804', 'AVL004'),
('Avenida E, 654', '36925814706', 'AVL005');

INSERT INTO Professor (Departamento, _IP_Identificacao_do_professor, Disciplina, fk_Usuario_CPF) VALUES
('Ciência da Computação', 'PRF001', 'Introdução à Programação', '12345678901'),
('Matemática', 'PRF002', 'Álgebra Linear', '98765432109'),
('Engenharia Civil', 'PRF003', 'Mecânica dos Solos', '24681357902'),
('Letras', 'PRF004', 'Literatura Brasileira', '13579246804'),
('Medicina', 'PRF005', 'Anatomia Humana', '36925814706');

INSERT INTO Aluno (Matricula, _CR__coeficiente_de_rendimento, Faltas, fk_Usuario_CPF) VALUES
('2023001', 8.5, 2, '12345678901'),
('2023002', 7.2, 5, '98765432109'),
('2023003', 9.0, 1, '24681357902'),
('2023004', 6.8, 3, '13579246804'),
('2023005', 8.0, 0, '36925814706');

INSERT INTO Cliente_Externo_ (fk_Usuario_CPF) VALUES
('12345678901'),
('98765432109'),
('24681357902'),
('13579246804'),
('36925814706');

INSERT INTO Livro (Quant_Estoque, ISBN, Titulo, fk_Produto_ID, fk_Editora_Codigo, fk_Editora_Nome, fk_Editora_E_mail) VALUES
(100, '978-0142420591', '1984', 'LIV001', 'EDI001', 'Penguin Books', 'penguin@example.com'),
(50, '978-0553212457', 'Moby Dick', 'LIV002', 'EDI002', 'Bantam', 'bantam@example.com'),
(80, '978-0486280615', 'Romeu e Julieta', 'LIV003', 'EDI003', 'Dover Publications', 'dover@example.com'),
(120, '978-0451524935', 'Dom Quixote', 'LIV004', 'EDI004', 'Signet', 'signet@example.com'),
(70, '978-1983397910', 'Crime e Castigo', 'LIV005', 'EDI005', 'Independently published', 'independent@example.com');

INSERT INTO Entrega (Frete, Status, Endereco) VALUES
(10.50, 'Entregue', 'Rua X, 789'),
(8.75, 'Pendente', 'Avenida Y, 456'),
(12.20, 'Em Trânsito', 'Rua Z, 123'),
(15.80, 'Entregue', 'Avenida W, 654'),
(9.99, 'Pendente', 'Rua V, 321');

INSERT INTO Autor (P_Nome, S_Nome) VALUES
('George', 'Orwell'),
('Herman', 'Melville'),
('William', 'Shakespeare'),
('Miguel', 'de Cervantes'),
('Fyodor', 'Dostoevsky');

INSERT INTO Editora (Codigo, Nome, Endereco, E_mail) VALUES
('EDI001', 'Penguin Books', '123 Penguin Street', 'penguin@example.com'),
('EDI002', 'Bantam', '456 Bantam Avenue', 'bantam@example.com'),
('EDI003', 'Dover Publications', '789 Dover Lane', 'dover@example.com'),
('EDI004', 'Signet', '321 Signet Road', 'signet@example.com'),
('EDI005', 'Independently published', '654 Independent Street', 'independent@example.com');

INSERT INTO Categoria (ID, Nome, Descricao, Numero_de_livros) VALUES
('CAT001', 'Ficção Científica', 'Livros sobre viagens no tempo, universos alternativos, etc.', 20),
('CAT002', 'Romance', 'Livros sobre histórias de amor e relacionamentos', 30),
('CAT003', 'Fantasia', 'Livros sobre mundos imaginários, magia, etc.', 25),
('CAT004', 'Suspense', 'Livros que criam tensão e mistério', 15),
('CAT005', 'Autoajuda', 'Livros que oferecem conselhos e orientações para a vida', 10);

INSERT INTO Avaliacao (ID, Tipo, Data, Comentarios, Nota) VALUES
('AVL001', 'Livro', '2024-04-25', 'Ótimo livro, recomendo!', 4.5),
('AVL002', 'Filme', '2024-04-20', 'Muito bom, adorei a trama!', 4.2),
('AVL003', 'Restaurante', '2024-04-18', 'Comida deliciosa e ambiente agradável.', 4.8),
('AVL004', 'Produto', '2024-04-15', 'Atendeu às minhas expectativas.', 4.0),
('AVL005', 'Serviço', '2024-04-10', 'Eficiente e rápido.', 4.7);

INSERT INTO Pedido (Numero, Data, status, Cartao, Dinheiro, Valor, Produto, fk_Usuario_CPF) VALUES
(1001, '2024-04-25', 'Entregue', '1234 5678 9012 3456', NULL, 50.00, 'Livro', '12345678901'),
(1002, '2024-04-20', 'Pendente', '9876 5432 1098 7654', NULL, 30.00, 'Acessório', '98765432109'),
(1003, '2024-04-18', 'Entregue', '2468 1357 9024 6813', NULL, 25.00, 'Eletrônico', '24681357902'),
(1004, '2024-04-15', 'Pendente', '1357 9246 8041 3579', NULL, 20.00, 'Roupa', '13579246804'),
(1005, '2024-04-10', 'Entregue', '3692 5814 7063 9258', NULL, 15.00, 'Brinquedo', '36925814706');

INSERT INTO Plano_Premium (desconto) VALUES
(0.15);

INSERT INTO Material_Escolar (Caderno, Bolsa, fk_Produto_ID) VALUES
(12.50, 20.00, 'PRO001'),
(15.00, 25.00, 'PRO002'),
(10.75, 18.50, 'PRO003'),
(18.20, 30.00, 'PRO004'),
(22.50, 35.50, 'PRO005');

INSERT INTO Produto (ID) VALUES
('PRO001'),
('PRO002'),
('PRO003'),
('PRO004'),
('PRO005');

INSERT INTO escrito (fk_Livro_ISBN, fk_Livro_fk_Produto_ID) VALUES
('978-0142420591', 'LIV001'),
('978-0553212457', 'LIV002'),
('978-0486280615', 'LIV003'),
('978-0451524935', 'LIV004'),
('978-1983397910', 'LIV005');

INSERT INTO pertence (fk_Categoria_ID, fk_Livro_ISBN, fk_Livro_fk_Produto_ID) VALUES
('CAT001', '978-0142420591', 'LIV001'),
('CAT002', '978-0553212457', 'LIV002'),
('CAT003', '978-0486280615', 'LIV003'),
('CAT004', '978-0451524935', 'LIV004'),
('CAT005', '978-1983397910', 'LIV005');

INSERT INTO recebe (fk_Avaliacao_ID, fk_Livro_ISBN, fk_Livro_fk_Produto_ID) VALUES
('AVL001', '978-0142420591', 'LIV001'),
('AVL002', '978-0553212457', 'LIV002'),
('AVL003', '978-0486280615', 'LIV003'),
('AVL004', '978-0451524935', 'LIV004'),
('AVL005', '978-1983397910', 'LIV005');

INSERT INTO obtem (fk_Produto_ID) VALUES
('PRO001'),
('PRO002'),
('PRO003'),
('PRO004'),
('PRO005'); 

Delete from Pedido where status like'%Pendente%';  

Update Autor set P_Nome='George' where P_Nome like '%Georgeton%'; 
Update Autor set P_Nome='Hermando' where P_Nome like '%Herman%';  
Update Autor set P_Nome='Michael' where P_Nome like '%Miguel%';  

Delete from Livro where fk_Editora_E_mail like '%gmail%'; 

Delete from Aluno where _CR__coeficiente_de_rendimento<7;
