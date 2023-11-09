CREATE DATABASE ATT6;

USE ATT6;

CREATE TABLE Produto(
	idProduto int auto_increment primary key,
    nomeProduto varchar(100) not null,
    dataValidade varchar(10) not null
);

DELIMITER //

CREATE trigger tg_validade_produto
before insert on 
Produto 
for each row
begin
	if new.dataValidade < '2023-11-08' then
		signal sqlstate '45000' set message_text = 'O Produto está vencido';
    end if;
END;
//
DELIMITER ;

INSERT INTO Produto(nomeProduto,dataValidade)
VALUES('Uva-Passa','2023-08-01');
INSERT INTO Produto(nomeProduto,dataValidade)
VALUES('Salmão','2023-10-30');
INSERT INTO Produto(nomeProduto,dataValidade)
VALUES('Carne Moída','2023-11-10');
INSERT INTO Produto(nomeProduto,dataValidade)
VALUES('Geleia de Morango','2023-10-07');

SELECT * FROM Produto;

DROP DATABASE ATT6;