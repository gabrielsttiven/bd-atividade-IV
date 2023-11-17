CREATE DATABASE ATIVIDADE_QUATRO_TRIGGER;

USE ATIVIDADE_QUATRO_TRIGGER;

CREATE TABLE PRODUTOS (
ID_PRODUTO INT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR (155) NOT NULL,
QUANT_ESTOQUE INT NOT NULL
);

INSERT INTO PRODUTOS (ID_PRODUTO, NOME, QUANT_ESTOQUE) VALUES
('1', "Café", '100'),
('2', "Açucar", '69'),
('3', "Macarrão", '74'),
('4', "Amendoim", '31');

CREATE TABLE VENDAS (
ID_VENDA INT PRIMARY KEY AUTO_INCREMENT,
DATA_VENDA DATETIME NOT NULL
);

INSERT INTO VENDAS (ID_VENDA, DATA_VENDA) VALUES
('1', '2023-11-16 22:45:36'),
('2', '2023-10-25 14:19:57'),
('3', '2023-10-02 09:31:12'),
('4', '2023-09-11 18:53:49');

CREATE TABLE ITENS_VENDA (
ID_ITEM_VENDA INT PRIMARY KEY AUTO_INCREMENT,
QUANTIDADE INT,
ID_VENDA INT,
ID_PRODUTO INT,
FOREIGN KEY (ID_VENDA) REFERENCES VENDAS(ID_VENDA),
FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTOS(ID_PRODUTO)
);

DELIMITER //

CREATE TRIGGER VERIFICAR_QUANT_ESTOQUE
BEFORE INSERT ON ITENS_VENDA
FOR EACH ROW
BEGIN
    DECLARE DISPONIVEL INT;
    SELECT QUANT_ESTOQUE INTO DISPONIVEL
    FROM PRODUTOS
    WHERE ID_PRODUTO = NEW.ID_PRODUTO;

    IF DISPONIVEL IS NULL OR DISPONIVEL < NEW.QUANTIDADE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ops... Quantidade insuficiente em estoque para o produto selecionado.';
    END IF;
END;
//

DELIMITER ;

INSERT INTO ITENS_VENDA (QUANTIDADE, ID_VENDA, ID_PRODUTO) VALUES
(150, 1, 1); 