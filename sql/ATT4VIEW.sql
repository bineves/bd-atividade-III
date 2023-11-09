create database ATT4;

use ATT4;

CREATE TABLE Produto(
	id int auto_increment primary key,
    nome varchar(150) not null,
	valor double not null
);

INSERT INTO Produto(nome,valor) VALUES
('Guarda-Roupa', 90),
('Televisão', 70),
('Talheres', 180);

CREATE VIEW vw_produtos_caros AS
SELECT id as 'ID', nome as 'Nome do Produto', valor as 'Valor'
FROM Produto
WHERE valor > 100;

SELECT * FROM vw_produtos_caros;