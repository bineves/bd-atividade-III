CREATE DATABASE ATT10;

use ATT10;

CREATE TABLE Funcionarios(
	idFuncionarios int auto_increment primary key,
    nome varchar(150) NOT NULL,
    Cargo varchar(50) NOT NULL
);

CREATE TABLE Dependentes(
	idDependente int auto_increment primary key,
    nome varchar(150) NOT NULL,
    Cargo varchar(50) NOT NULL,
    Funcionario_ID int,
    
    foreign key (Funcionario_ID) references Funcionarios(idFuncionarios)
);

DELIMITER //

CREATE TRIGGER tg_excluir_dependentes
AFTER DELETE ON Funcionarios
FOR EACH ROW
BEGIN
    DELETE FROM Dependentes
    WHERE Funcionario_ID = OLD.idFuncionarios;
END;
//

DELIMITER ;

INSERT INTO Funcionarios(nome,Cargo) VALUES
('Alan','Administrador de Banco de Dados'),
('Marília','Desenvolvedora'),
('Mariana','Arquiteta');

INSERT INTO Dependentes(nome,Cargo,Funcionario_ID) VALUES
('Maria', 'Jovem aprendiz',3),
('João Victor','Estudante',2),
('Victor Hugo','Vendedor',1);

DELETE FROM Funcionarios 
WHERE idFuncionarios = 1;

select * from Funcionarios;
select * from Dependentes;

DROP DATABASE ATT10;