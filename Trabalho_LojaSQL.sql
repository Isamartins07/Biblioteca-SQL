*
USE MASTER

/*
Exercício: Criação de um Banco de Dados 
Relacional no SQL Server


*/

Create database LojaDB;

use LojaDB;

create table Categoria(
	CategoriaID int identity primary key,
	Eletronico int  not null,
	Moda int  not null,
	Brinquedos int  not null ,
	utensilios_domesticos int  not null

);






create Table Produto (
	ProdutoID int identity primary key,
	Item varchar (255) not null,
	Valor_Unitario DECIMAL not null,
	Em_Estoque int not null ,
	CategoriaID int not null ,
	foreign key (CategoriaID) references Categoria (CategoriaID),
);

drop table Produto

INSERT INTO Produto values
 ('Máquina de Barbear', 50.00, 20,1),
 ('Jogo de Faca Tramontina',150.00,15,4),
 ('Carrinho Hot Wheels', 7.00,30,3),
 ('Kit de meia cano alto',10.00,50,2)






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
	(001,002,003,004)       
	
select * from Categoria




select * from Produto
drop table Produto
drop table Categoria