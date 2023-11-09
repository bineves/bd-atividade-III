CREATE DATABASE ATT1;

USE ATT1;

CREATE TABLE Departamento(
	IdDepartamento int auto_increment primary key,
    NomeDoDepartamento varchar(50) not null
);

CREATE TABLE Funcionarios(
	id int auto_increment primary key,
    nome varchar(150) NOT NULL,
    dataNascimento varchar(11) NOT NULL,
    Cargo varchar(50) NOT NULL,
    DepartID int,
    
    foreign key (DepartID) references Departamento(IdDepartamento)
);

INSERT INTO ATVBD.Departamento(NomeDoDepartamento) VALUES 
('Tecnologia da Informação'),
('Engenharia'),
('Administração');

INSERT INTO ATVBD.Funcionarios(nome, dataNascimento, Cargo, DepartID) VALUES
('Priscila', '12/11/2000' ,'Finanças', 3),
('Gabriel', '05/02/1989' , 'Desenvolvedor Sênior', 1),
('Luísa', '26/07/1999' , 'Engenheira', 2),
('Tito', '21/11/1987' , 'Gerente', 3);

CREATE VIEW vw_funcionarios_departamento AS 
SELECT  F.nome AS 'Nome do Funcionario', 
		F.Cargo AS 'Cargo', 
		D.NomeDoDepartamento AS 'Departamento'
FROM Funcionarios  F
INNER JOIN Departamento  D
ON F.DepartID = D.IdDepartamento
WHERE D.NomeDoDepartamento = 'Administração'
GROUP BY F.id;

SELECT * FROM vw_funcionarios_departamento;

DROP VIEW IF EXISTS vw_funcionarios_departamento;