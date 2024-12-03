
use master
go

drop database CadastroClientes
-- Atividade Avaliativa 11/11/2024


create database LojaTailDB
 use LojaTailDB

-- Passo 1: Configuração do Banco de Dados e Tabelas

 CREATE TABLE Categoria(
 CategoriaID int identity primary key,
 Nome varchar (100) not null,
 );

 CREATE TABLE Loja(
 LojaID int identity primary key,
 Nome varchar (100)not null,
 Endereco varchar (255) not null
 );

 CREATE TABLE Produtos(
 ProdutosID int identity primary key,
 Nome varchar (100) not null,
 Preco decimal not null,
 CategoriaID int
 foreign key (CategoriaID) references Categoria (CategoriaID)
 );

 CREATE TABLE Clientes(
 ClientesID  int identity primary key,
 Nome varchar (100) not null,
 E_mail varchar (150) not null,
 Telefone varchar (15) not null
 );

 --Passo 2: Inserção de Dados

 INSERT INTO Categoria VALUES       ('Cozinha'),
									('Sala'),
									('Banheiro'),
									('Quarto'),
									('Quintal'),
									('Produtos de limpeza'),
									('Variedades')

						select * from Categoria

INSERT INTO Loja VALUES ('Loja Tastey','Rua das Rosas, N°12- CEP 124-005/ Vinhedo'),
						('Loja Tail', 'Rua Maringa Deolinda, N° 251- CEP 134-896/ Jundiaí'),
						('Loja Tico Tico','Rua Verixas Machado, N°38- CEP 132-894/ Campinas'),
						('Loja Tretis', 'Rua Vitor Bonesso, N°269- CEP 132-900/ Louveira')
					
						Select * from Loja

INSERT INTO Produtos VALUES ('Panela de Pressão 15L',45,1),
							('Capa para Sofá',75,2),
							('Lixeira',20,3),
							('Fronhas de Cetim',25,4),
							('Mangueira 30m',40,5),
							('Amaciante',14,6),
							('Porta Joia',10,7)

						Select * from Produtos

INSERT INTO Clientes VALUES ('Rosário Dom Juca','Juca.Dom@gmail.com','(11)98754-6781'),
							('João Santos','Santo.Jo@gamil.com','(19)94548-7613'),
							('Maria Florinda','Florinda.M@gmail.com','(11)98885-4159'),
							('Josefa Souza','Josouza.sefa@gmail.com','(19)96548-3247')

						Select * from Clientes

									

--Passo 3: Comandos de Seleção e Joins

select * from Categoria
Select * from Produtos

--com inner join

select Categoria.Nome,Produtos.Nome, Produtos.Preco from Categoria -- EXIBE AS CATEGORIAS>PRODUTOS>PREÇO
INNER JOIN Produtos on Categoria.CategoriaID = Produtos.CategoriaID

select * from Clientes
select * from Loja

    
select Produtos.Nome, Produtos.Preco from Produtos
INNER JOIN Categoria ON Produtos.CategoriaID = Categoria.CategoriaID
where Categoria.Nome = 'Banheiro';


select Produtos.Nome, Produtos.Preco from Produtos
INNER JOIN Categoria ON Produtos.CategoriaID = Categoria.CategoriaID
where Categoria.Nome = 'Quintal';

-- Passo 4: Comandos de Atualização

--14. Atualize o preço de um produto específico.
update Produtos -- atualização na tabela produtos onde o preço agora será alterado especifiando apenas o item
set Preco=55
where Nome='Lixeira'

--15. Atualize o endereço de uma loja específica.
update Loja
set Endereco= 'Rua Jardim Diamante, N° 74- CEP 145-897/ Louveira'
where Nome= 'Loja Tretis'

--16. Atualize o nome de uma categoria.
update Categoria
set Nome= 'Moda'
where nome='Variedades'

select * from Categoria

--Passo 5: Comandos de Exclusão

--17. Exclua um produto específico da tabela `Produtos`.
delete from Produtos where nome='Porta Joia'

--18. Exclua um cliente pelo nome.
delete from Clientes where nome='João Santos'
select * from Clientes

-- Passo 6: Alteração da Estrutura da Tabela 

/*obs: ALTER TABLE permite realizar várias operações, como adicionar, alterar ou excluir colunas, definir chaves primárias ou estrangeiras, ou até mesmo renomear a tabela.*/

--19. Adicione uma nova coluna em `Produtos` para armazenar a quantidade de estoque.
alter table Produtos add QTD_Estoque int

SELECT * FROM Produtos

--20. Adicione uma nova coluna em `Cliente` para armazenar a data de cadastro.
ALTER TABLE Clientes add Data_Cadastro date
select * from Clientes


-- Passo 7: Chaves Estrangeiras e Relacionamentos
 create table Pedidos(
 PedidosID int identity primary key,
 Data_Compra DATE ,
 Status_Pedido VARCHAR(20),
 ClientesID INT,
 ProdutosID int
 foreign key (ClientesID) references Clientes (ClientesID),
 foreign key (ProdutosID) references Produtos (ProdutosID)
 );

 Insert into Pedidos Values ('10/22/2024','Finalizado',4,1),
							('11/11/2024','Em Separação',1,6),
							('05/06/2024','Finalizado',3,4)

select Pedidos.Data_Compra,Clientes.Nome,Clientes.E_mail,Produtos.Item,Produtos.Preco,Pedidos.Status_Pedido from Pedidos
inner join Clientes on Clientes.ClientesID=Pedidos.ClientesID
inner join Produtos on Produtos.ProdutosID=Pedidos.ProdutosID


-- renomear coluna da tabela 

--EXEC sp_rename 'Tabela.NomeAntigo', 'NomeNovo', 'COLUMN';

EXEC sp_rename 'Produtos.Nome', 'Item', 'COLUMN';

-- Passo 8: Consultas e Alterações Avançadas

alter table Pedidos add Qtd_Comprada int

--25. Atualize a quantidade de um item em um pedido específico

UPDATE Pedidos
SET Qtd_Comprada = 5
WHERE PedidosID = 4;


--26. Selecione o total gasto por cada cliente em pedidos, considerando o preço dos produtos e as quantidades compradas.

select Pedidos.Data_Compra,Clientes.Nome,Clientes.E_mail,Produtos.Item,Produtos.Preco, Pedidos.Qtd_Comprada ,Pedidos.Status_Pedido,
 SUM (Produtos.Preco * Pedidos.Qtd_Comprada)AS TotalGasto  from Pedidos
inner join Clientes on Clientes.ClientesID=Pedidos.ClientesID
inner join Produtos on Produtos.ProdutosID=Pedidos.ProdutosID
GROUP BY 
    Pedidos.Data_Compra,
    Clientes.Nome,
    Clientes.E_mail,
    Produtos.Item,
    Produtos.Preco,
    Pedidos.Status_Pedido,
	Pedidos.Qtd_Comprada;




