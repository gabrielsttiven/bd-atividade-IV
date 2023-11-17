CREATE DATABASE ATIVIDADE_TRES_VIEWS;

USE ATIVIDADE_TRES_VIEWS;

CREATE TABLE FUNCIONARIOS (
    ID_FUNCIONARIO INT PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    CARGO VARCHAR(50) NOT NULL,
    SALARIO DECIMAL(10, 2) NOT NULL
);

INSERT INTO FUNCIONARIOS (ID_FUNCIONARIO, NOME, CARGO, SALARIO) VALUES
(1, 'Gabriel', 'Atendente', 3000.00),
(2, 'Daniel', 'Atendente', 2900.00),
(3, 'Jessica', 'Vendedor', 3100.00);

CREATE TABLE VENDAS (
    ID_VENDA INT PRIMARY KEY,
    ID_FUNCIONARIO INT,
    DATA_VENDA DATE NOT NULL,
    VALOR_VENDA DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_FUNCIONARIO) REFERENCES FUNCIONARIOS(ID_FUNCIONARIO)
);

INSERT INTO VENDAS (ID_VENDA, ID_FUNCIONARIO, DATA_VENDA, VALOR_VENDA) VALUES
(1, 1, '2023-11-16', 1600.00),
(2, 2, '2023-11-16', 500.00),
(3, 1, '2023-11-15', 6500.00),
(4, 3, '2023-11-15', 1200.00),
(5, 2, '2023-11-14', 3200.00);

CREATE VIEW RELATORIO_VENDAS_FUNCIONARIO AS
SELECT
    f.NOME AS NOME_FUNCIONARIO,
    COUNT(v.ID_VENDA) AS NUMERO_VENDAS,
    SUM(v.VALOR_VENDA) AS VALOR_TOTAL_VENDAS
FROM FUNCIONARIOS f
LEFT JOIN VENDAS v ON f.ID_FUNCIONARIO = v.ID_FUNCIONARIO
GROUP BY f.ID_FUNCIONARIO, f.NOME;


SELECT * FROM RELATORIO_VENDAS_FUNCIONARIO;