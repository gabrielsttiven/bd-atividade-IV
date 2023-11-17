CREATE DATABASE ATIVIDADE_QUATRO_VIEWS;

USE ATIVIDADE_QUATRO_VIEWS;

CREATE TABLE CATEGORIAS (
    ID_CATEGORIA INT PRIMARY KEY,
    NOME_CATEGORIA VARCHAR(255) NOT NULL,
    DESCRICAO VARCHAR(255)
);

INSERT INTO CATEGORIAS (ID_CATEGORIA, NOME_CATEGORIA, DESCRICAO) VALUES
(1, 'Eletrônicos', 'Celular, Computador, Relógio e etc...'),
(2, 'Vestimentas', 'Roupas, acessórios...'),
(3, 'Alimentos', 'Café, Açucar, Farinha e etc...');

CREATE TABLE PRODUTOS (
    ID_PRODUTO INT PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    PRECO_UNICO DECIMAL(10, 2) NOT NULL,
    ID_CATEGORIA INT,
    FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIAS(ID_CATEGORIA)
);

INSERT INTO PRODUTOS (ID_PRODUTO, NOME, PRECO_UNICO, ID_CATEGORIA) VALUES
(1, 'iPhone 14', 6200.00, 1),
(2, 'Samsung Galaxy A56', 2500.00, 1),
(3, 'Arroz', 5.99, 3),
(4, 'Farinha', 6.85, 3),
(5, 'Calça Jeans', 49.99, 2),
(6, 'Tênis', 99.99, 2),
(7, 'MACBOOK', 15000.00, 1),
(8, 'Amendoim', 19.99, 3),
(9, 'Macarrão', 3.99, 3);


CREATE VIEW RELATORIO_PRODUTOS_CATEGORIA AS
SELECT
    c.NOME_CATEGORIA AS NOME_CATEGORIA,
    COUNT(p.ID_PRODUTO) AS QUANT_PRODUTOS
FROM CATEGORIAS c
LEFT JOIN PRODUTOS p ON c.ID_CATEGORIA = p.ID_CATEGORIA
GROUP BY c.ID_CATEGORIA, c.NOME_CATEGORIA;


SELECT * FROM RELATORIO_PRODUTOS_CATEGORIA;