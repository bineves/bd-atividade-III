CREATE DATABASE ATT3;

USE ATT3;

CREATE TABLE Vendedor(
	IdVendedor int auto_increment primary key,
    nomeV varchar(150) not null,
    ctps varchar(16) not null,
    Empresa varchar(100) not null
);

CREATE TABLE Clientes(
	IdCliente int auto_increment primary key,
    nomeC varchar(150) not null,
    cpf varchar(15) not null unique,
    feedback varchar(255) not null,
	Vendedor_ID int,
	
	foreign key (Vendedor_ID) references Vendedor(IdVendedor)
);

INSERT INTO Vendedor(nomeV,ctps,Empresa) VALUES 
('Helena', '111.111' ,'Pampers'),
('Júlia', '222.222' , 'C&A'),
('Matheus', '333.333' ,'Seaway');

INSERT INTO Clientes(nomeC,cpf,feedback,Vendedor_ID) VALUES
('Pedro', 'Achei o atendimento favorável', 1),
('Lucas','Não gostei muito do atendimento ele foi muito grosso', 3),
('Vitória', 'Gostei do atendimento dela', 2);  

CREATE VIEW vw_relacionamento_cliente_vendedor AS 
SELECT  C.nomeC as 'Nome Cliente', 
		C.feedback as 'Feedback', 
        V.nomeV as 'Nome do Vendendor'
FROM Vendedor AS V
INNER JOIN Clientes AS C
ON  C.Vendedor_ID = V.IdVendedor;

select * from vw_relacionamento_cliente_vendedor;

DROP VIEW IF EXISTS vw_relacionamento_cliente_vendedor;