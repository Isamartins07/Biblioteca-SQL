
create database BDAutoFix
go

use BDAutoFix
go

create table Clientes(
	ClienteID int identity primary key,
	Nome varchar (100) not null,
	Idade int not null,
	CPF varchar (16)not null,
	CNH varchar (10) not null,
	E_mail varchar (100) not null,
	Celular varchar (16) not null,
	Endereco varchar (100) not null,

);

create table Veiculos (
	VeiculoID int identity primary key,
	Modelo varchar (100)not null,
	Placa varchar (7) not null,
	Cor varchar (20) not null,
	Ano  int not null
);

create table Servicos(
	ServicoID int identity primary key,
	Manutenção_Realizada varchar (255) not null,
	Preço_Final decimal(10,2) not null,
	Pagamento varchar (100) not null
);

create table Ordem_De_Servico(
	OrdemID int identity primary key,
	ClienteID INT,
	VeiculoID int,
	ServicoID int,
	foreign key (ClienteID) references Clientes (ClienteID),
	foreign key (VeiculoID) references  Veiculos (VeiculoID),
	foreign key (ServicoID) references Servicos (ServicoID)
);

create table ItensOS(
	ItensOSID int identity primary key,
	OrdemID INT,
	foreign key (OrdemID) references Ordem_De_Servico (OrdemID),
	Pecas_Utilizadas varchar (255)
);


select * from Clientes
select * from Veiculos
select * from Servicos
select * from Ordem_De_Servico
select * from ItensOS

INSERT INTO Clientes VALUES 

('João Silva', 32, '123.456.789-00', '1234567890', 'joao.silva@email.com', '(11) 91234-5678', 'Rua A, 123'),
('Maria Oliveira', 29, '234.567.890-12', '2345678901', 'maria.oliveira@email.com', '(21) 98765-4321', 'Av. B, 456'),
('Carlos Santos', 45, '345.678.901-23', '3456789012', 'carlos.santos@email.com', '(31) 93456-7890', 'Praça C, 789');

INSERT INTO Veiculos VALUES
('Fusca', 'ABC-1234', 'Azul', 1995),
('Civic', 'XYZ-5678', 'Preto', 2020),
('Gol', 'MNB-9876', 'Vermelho', 2018);

--------------------------
ALTER TABLE Veiculos
ALTER COLUMN Placa VARCHAR(10); --estava dando erro ao digitar a placa
--------------------------

INSERT INTO Servicos VALUES
('Troca de óleo', 120.50, 'Cartão de crédito'),
('Revisão completa', 450.00, 'Dinheiro'),
('Troca de pneus', 320.00, 'Pix');


INSERT INTO Ordem_De_Servico VALUES
(1, 6, 3),
(2, 7, 1),
(3, 5, 2);

INSERT INTO ItensOS VALUES
(1, 'Óleo, Filtro de óleo'),
(2, 'Óleo, Filtro de ar, Velas'),
(3, 'Pneus, Calotas');

-- inner join
-- EXIBE MANUTENÇÃO, CLIENTE E O VEICULO
SELECT 
    S.Manutenção_Realizada AS Servico, 
    C.Nome AS Cliente, 
    V.Modelo AS Veiculo
FROM 
    Ordem_De_Servico O
INNER JOIN 
    Clientes C ON O.ClienteID = C.ClienteID
INNER JOIN 
    Veiculos V ON O.VeiculoID = V.VeiculoID
INNER JOIN 
    Servicos S ON O.ServicoID = S.ServicoID;



	----------------------------------------
	-- EXIBE ORDEM_ID,PEÇAS UTILIZADAS, MANUTENÇÃO,PREÇO E CLIENTE
SELECT 
    O.OrdemID, 
    I.Pecas_Utilizadas, 
    S.Manutenção_Realizada AS Servico, 
    S.Preço_Final AS Preço,
    C.Nome AS Cliente
FROM 
    ItensOS I
INNER JOIN 
    Ordem_De_Servico O ON I.OrdemID = O.OrdemID
INNER JOIN 
    Servicos S ON O.ServicoID = S.ServicoID
INNER JOIN 
    Clientes C ON O.ClienteID = C.ClienteID;


	--------------------------------------------
	update Clientes
	set Nome = 'Maria Joaquinha'
	Where Nome = 'Maria Oliveira';

	update Veiculos
	set Modelo ='Mercedes'
	where Modelo = 'Fusca';

	update Veiculos
	set Modelo = 'Ferrari'
	where Modelo= 'Gol';

select * from Clientes
select * from Veiculos

-----------------------------------------------


ALTER TABLE Ordem_De_Servico
ADD Data_De_Abertura DATE;

-- datas específicas para cada ordem de serviço
UPDATE Ordem_De_Servico
SET Data_De_Abertura = '2024-12-01'
WHERE OrdemID = 1;

UPDATE Ordem_De_Servico
SET Data_De_Abertura = '2024-12-02'
WHERE OrdemID = 2;

UPDATE Ordem_De_Servico
SET Data_De_Abertura = '2024-12-03'
WHERE OrdemID = 3;


select * from Ordem_De_Servico

SELECT 
    C.Nome AS Cliente, 
    V.Modelo AS Carro, 
    V.Placa AS Placa, 
    S.Manutenção_Realizada AS Manutenção, 
    S.Preço_Final AS Preço, 
    S.Pagamento, 
    O.Data_De_Abertura AS Data_Abertura
FROM 
    Ordem_De_Servico O
INNER JOIN 
    Clientes C ON O.ClienteID = C.ClienteID
INNER JOIN 
    Veiculos V ON O.VeiculoID = V.VeiculoID
INNER JOIN 
    Servicos S ON O.ServicoID = S.ServicoID;
