

-- atividade 29/10
/*
(um bloco de comentários)
*/ 



create database BibliotecaDB;
go

use BibliotecaDB
go

CREATE TABLE AUTORES (
 AutorID int identity primary key,
 NomeCompleto varchar (255) not null,
 PaísOrigem varchar (255) not null
 );

 

 CREATE TABLE LIVROS (
 LivroID int identity primary key,
 Título varchar (255) not null,
 LancamentoAno int not null,
 AutorID int 
 FOREIGN KEY (AutorID) REFERENCES  AUTORES (AutorID)
 );


 CREATE TABLE EMPRESTIMOS (
 EmprestimoID int identity primary key,
 DataEmprestimo date not null,
 DataDevolucao date not null,
 LivroID int
 FOREIGN KEY (LivroID) REFERENCES LIVROS (LivroID)
 );



 
 select * from AUTORES
 select * from LIVROS
 select * from EMPRESTIMOS

/*
 BACKUP DATABASE BibliotecaDB
TO DISK = 'c:\sql\biblioteca1.bk';


drop database BDTI46 -- APAGAR

FOREIGN KEY >> chave estrangeira

use master

 variavel int UNIQUE (exemp cpf, dado unico)


- Restaurar
RESTORE DATABASE BDTI46
FROM DISK ='c:\temp\bkp1.bk';

*/

-- comandos para inserir dados nas 3 entidades


 INSERT INTO AUTORES VALUES 
	('Becca Fitzpatrick', 'Estados Unidos'),
	('Collen Hoover', 'Estados Unidos')



 INSERT INTO LIVROS VALUES 
	 ('HUSH HUSH', 2009,1),
	 ('O Lado Feio do Amor', 2015,2)


 INSERT INTO EMPRESTIMOS VALUES 
	('10/01/2024',' 10/21/2024',1),
	('09/05/2024', '09/05/2024',2)



	/*
	Aula dia 30-10 - Exemplo de select com Inner Join
 
select L.Titulo as Título, L.AnoPublicacao as 'Ano Publicação', A.NomeCompleto as 'Nome Completo',
E.DataEmprestimo as 'Data Empréstimo', E. DataDevolucao as 'Data Devolução' 
from Emprestimos E
INNER JOIN Livros L on L.LivrosID = E.LivroID                         >>> MESCLA AS TABELAS/INFORMAÇÕES
INNER JOIN Autores A on A.AutorID = L.AutorID

INSERT INTO NOME DA ENTIDADE (AQUI INSERIR QUAL DADO VOCÊ VAI PREENCHER MAS SOMENTE SE NÃO PREENCHER TODO,É O JEITO DE ESPECIFICAR) VALUES

UPDATE DA TABELA (SERVE PARA MUDAR ALGUM CAMPO DA TABELA)

UPDATE AUTORES
SET livroID  = 1
WHERE (CONDIÇÃO EXEMPLO: EmprestimoID=2);

DELETE FROM Autores
WHERE AutorID= 1;



*/


