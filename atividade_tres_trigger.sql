CREATE DATABASE ATIVIDADE_TRES_TRIGGER;

USE ATIVIDADE_TRES_TRIGGER;

CREATE TABLE FUNCIONARIOS (
    ID_FUNCIONARIO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(255) NOT NULL,
    DATA_ADMISSAO DATE NOT NULL
);

INSERT INTO FUNCIONARIOS (NOME, DATA_ADMISSAO) VALUES
('Gabriel', '2023-11-17'),
('Daniel', '2023-11-19');

DELIMITER //

CREATE TRIGGER VERIFICAR_DATA_ADMISSAO
BEFORE INSERT ON FUNCIONARIOS
FOR EACH ROW
BEGIN
    IF NEW.DATA_ADMISSAO <= CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A data de admissão deve ser maior que a data atual.';
    END IF;
END;
//

DELIMITER ;

INSERT INTO FUNCIONARIOS (NOME, DATA_ADMISSAO) VALUES
('Carlos', '2023-11-16');
