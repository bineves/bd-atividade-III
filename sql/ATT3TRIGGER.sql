CREATE DATABASE ATT8;

USE ATT8;

CREATE TABLE Produto(
	idProduto int auto_increment primary key,
    nomeProduto varchar(100) not null,
    estoque int not null,
    produtoVendido int not null
);

DELIMITER // 

CREATE TRIGGER tg_atualizar_estoque
BEFORE UPDATE ON Produto
FOR EACH ROW
BEGIN
	SET NEW.estoque = OLD.estoque - NEW.produtoVendido;
END;
//
DELIMITER ;

INSERT INTO Produto(nomeProduto,estoque ,produtoVendido)
VALUES('Pizza Familia', 70, 10);
INSERT INTO Produto(nomeProduto,estoque ,produtoVendido)
VALUES('Chá Gelado', 155, 85);
INSERT INTO Produto(nomeProduto,estoque ,produtoVendido)
VALUES('Biscoito Maria', 26, 7);

UPDATE Produto 
set estoque = estoque * 1
WHERE idProduto = 2 ;

SELECT * FROM Produto;

DROP DATABASE ATT8;


