--Exercício de fixação		



CREATE DATABASE CadastroClientes;
GO

USE CadastroClientes;


CREATE TABLE Cadastros(
CadastrosID int identity primary key,
NomeCliente varchar (100),
Endereco varchar (100),
Cidade varchar(50),
TelefoneContato varchar(15)
);

select * from Cadastros