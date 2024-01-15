USE MASTER
GO
DROP DATABASE BDCarros
GO
CREATE DATABASE BDCarros
GO
USE BDCarros
GO
CREATE TABLE Dono (
    IdDono  INT CONSTRAINT PKDono PRIMARY KEY,
    Nome    VARCHAR(50) NOT NULL INDEX IDXNome,
    Cpf     CHAR(11) NOT NULL CONSTRAINT UQCpf UNIQUE
)
GO
CREATE TABLE Marca (
    IdMarca  INT CONSTRAINT PKMarca PRIMARY KEY,
    NomeMarca    VARCHAR(40) NOT NULL
)
GO
CREATE TABLE Veiculo (
    Placa       CHAR(7) CONSTRAINT PKPlaca PRIMARY KEY,
    Modelo      VARCHAR(40) NOT NULL,
    IdMarca     INT CONSTRAINT FKMarca FOREIGN KEY REFERENCES Marca(IdMarca),
    Cor         VARCHAR(30),
    Ano         INT,
    IdDono      INT CONSTRAINT IdDono FOREIGN KEY REFERENCES Dono(IdDono)
)
GO

--Cadastro de Marcas
INSERT INTO Marca VALUES (1,'Fiat'),(2,'Volkswagen'),(3,'Chevrolet'),
(4,'Hyundai'),(5,'Toyota'),(6,'Ford'),(7,'Mitsubishi')
GO
--Cadastro de Donos
INSERT INTO Dono VALUES (1,'Ricardo Gomes','12345678909'),
(2,'Pedro Silva','09876543212'),(3,'Jéssica Souza','12365412312'),
(4,'José Santos','12987654321'),(5,'Bruna Marques','12343212345'),
(6,'Michele Silva','66554433221'),(7,'Júlia Soares','00011122233')
GO
--Cadastro de Veículos
INSERT INTO Veiculo (Placa, Modelo, IdMarca,Cor, Ano, IdDono) 
VALUES ('ABC0101','Uno',1,'Preto',2009,4)

INSERT INTO Veiculo (Placa, Modelo, IdMarca,Cor, Ano, IdDono) 
VALUES ('ABC0102','Golf',2,'Prata',2019,3)

INSERT INTO Veiculo (Placa, Modelo, IdMarca,Cor, Ano, IdDono) 
VALUES ('ABC0103','Hb20',1,'Cinza',2022,7)

INSERT INTO Veiculo (Placa, Modelo, IdMarca,Cor, Ano, IdDono) 
VALUES ('ABC0104','Ka',1,'Vermelho',2020,2)

INSERT INTO Veiculo (Placa, Modelo, IdMarca,Cor, Ano, IdDono) 
VALUES ('ABC0105','Punto',1,'Preto',2009,4)

SELECT Dono.*,Veiculo.Placa, Modelo, Marca.NomeMarca 
FROM Dono, Veiculo, Marca
WHERE Dono.IdDono = Veiculo.IdDono 
AND Veiculo.IdMarca = Marca.IdMarca

--Exemplo: INNER JOIN
--Retomar; Placa, Modelo, NomeMarca
select Placa, Modelo, NomeMarca
from Veiculo inner join Marca
on Marca.IdMarca = Veiculo.IdMarca

--exercicio : migrar os dois ultimo exemplos para inner joins
--consulta que retorne atributos

select Dono.IdDono, Nome, CPF, Modelo, Ano
from Dono inner join Veiculo
on Dono.IdDono = Veiculo.IdDono

select Dono.IdDono, Nome, Modelo, NomeMarca
from Dono inner join Veiculo 
on Dono.IdDono = Veiculo.IdDono
inner join Marca
on Marca.IdMarca = Veiculo.IdMarca