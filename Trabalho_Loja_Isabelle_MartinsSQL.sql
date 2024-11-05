*
USE MASTER

--DROP DATABASE LojaDB

/*
Exercício: Criação de um Banco de Dados 
Relacional no SQL Server


--drop table Produto


*/

Create database LojaDB;

use LojaDB;

create table Categoria(
	CategoriaID int identity primary key,
	Nome_Categoria varchar (100) not null,

);



create Table Produto (
	ProdutoID int identity primary key,
	Item varchar (255) not null,
	Valor_Unitario int not null,
	Em_Estoque int not null ,
	CategoriaID int not null ,
	foreign key (CategoriaID) references Categoria (CategoriaID),
);



CREATE TABLE Cliente (
    ClienteID INT IDENTITY PRIMARY KEY,
    Nome_Completo VARCHAR(50) NOT NULL,
    Celular VARCHAR(15) UNIQUE NOT NULL,
    E_mail VARCHAR(100) UNIQUE NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL
);



CREATE TABLE Pedido (
    PedidoID INT IDENTITY PRIMARY KEY,
    Data_Compra DATE NOT NULL,
    Status_Pedido VARCHAR(20) NOT NULL,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

create table ItemPedido(
	ItemPedidoID int identity primary key,
	QTD int not null,
	Valor_Total DECIMAL(10,2) not null,
	PedidoID INT,
	ProdutoID INT,
	foreign key (PedidoID) references Pedido (PedidoID),
	foreign key (ProdutoID) references Produto (ProdutoID),
);

INSERT INTO Categoria values
						('Eletrônicos'),
						('Utensílios Domésticos'),
						('Brinquedos'),
						('Moda')      
	


INSERT INTO Produto values
						 ('Máquina de Barbear', 50, 20,1),
						 ('Jogo de Faca Tramontina',150,15,2),
						 ('Carrinho Hot Wheels', 7,30,3),
						 ('Kit de meia cano alto',10,50,4)


 INSERT INTO Cliente values
						 ('Isabelle Martins',19997109610,'isabelle.martins@gmail.com',44665606897),
						 ('Maristela Bonaco',11888541567,'maristela.bonaco@gmail.com',44606589756),
						 ('Raphael Silva', 19978126547,'raphael.silva@gmail.com',44896321754),
						 ('José Ambraão',11489678237,'amraão.joségmail.com',55789645863)

INSERT INTO Pedido values
						('05/09/2024','Finalizado',1),
						('10/12/2024','Pendente',2),
						('04/10/2024','Pagamento aprovado',3),
						('8/07/2024','Finalizado',4)

INSERT INTO ItemPedido values

						(3,21,3,3),
						(1,150,2,2),
						(4,30,1,4),
						(2,100,2,1)


select * from Categoria
select * from Produto
select * from Cliente
select * from Pedido
select * from ItemPedido

