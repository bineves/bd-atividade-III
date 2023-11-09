CREATE DATABASE ATT2;

USE ATT2;

CREATE TABLE Produto(
	id int auto_increment primary key,
    nome varchar(100) NOT NULL,
	Estoque int NOT NULL
);

INSERT INTO Produto(nome,Estoque) VALUES
('Tablet', 3),
('Terno', 2),
('Celular', 1);

CREATE VIEW vw_estoque_insuficiente AS
SELECT id, nome, Estoque
FROM Produto
WHERE Estoque < 5;

SELECT * FROM vw_estoque_insuficiente;