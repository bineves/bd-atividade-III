CREATE DATABASE ATT7;

USE ATT7;

CREATE TABLE Produto(
	idProduto int auto_increment primary key,
    nomeProduto varchar(100) not null,
    valor double not null
);

DELIMITER //
CREATE TRIGGER tg_aumento_valor
BEFORE UPDATE ON Produto
FOR EACH ROW
BEGIN
  SET NEW.valor = NEW.valor * 10 / 100 + OLD.valor;
END;
//
DELIMITER ;

INSERT INTO Produto(nomeProduto,valor)
VALUES('Fanta Guaraná', 12);
INSERT INTO Produto(nomeProduto,valor)
VALUES('Pé de Moça', 13);
INSERT INTO Produto(nomeProduto,valor)
VALUES('Misto Quente', 20);

UPDATE Produto 
set valor = valor * 1
WHERE idProduto = 1 ;

SHOW TRIGGERS;

DROP DATABASE ATT7;
SELECT * FROM Produto;