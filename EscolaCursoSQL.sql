

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
	/*
	Aula dia 30-10 - Exemplo de select com Inner Join
 
select L.Titulo as T�tulo, L.AnoPublicacao as 'Ano Publica��o', A.NomeCompleto as 'Nome Completo',
E.DataEmprestimo as 'Data Empr�stimo', E. DataDevolucao as 'Data Devolu��o' 
from Emprestimos E
INNER JOIN Livros L on L.LivrosID = E.LivroID                         >>> MESCLA AS TABELAS/INFORMA��ES
INNER JOIN Autores A on A.AutorID = L.AutorID

INSERT INTO NOME DA ENTIDADE (AQUI INSERIR QUAL DADO VOC� VAI PREENCHER MAS SOMENTE SE N�O PREENCHER TODO,� O JEITO DE ESPECIFICAR) VALUES

UPDATE DA TABELA (SERVE PARA MUDAR ALGUM CAMPO DA TABELA)

UPDATE AUTORES
SET livroID  = 1
WHERE (CONDI��O EXEMPLO: EmprestimoID=2);

DELETE FROM Autores
WHERE AutorID= 1;



*/
create database EscolaCursos;

use EscolaCursos;

create table Curso(
 CursoID int identity primary key,
 Nome varchar (100),
 Descricao text not null,
 Carga_Horaria int

);

create table Aluno(
AlunoID int  primary key identity,
Nome VARCHAR(100),
Data_Nascimento date,
email varchar (100)

);

create table Instrutor(
InstrutorID int primary key identity,
Nome varchar (100),
Especialidade varchar(100)

);

create table Turma(
TurmaID int primary key identity,
CursoID int,
InstrutorID int,
Data_Inicio date,
Data_Fim date,
foreign key (CursoID) references Curso (CursoID),
foreign key (InstrutorID) references Instrutor (InstrutorID)

);

create table Matricula(
MatriculaID int primary key identity,
AlunoID int,
TurmaID int,
Data_Matricula date,
foreign key (AlunoID) references Aluno (AlunoID),
foreign Key (TurmaID) references Turma (TurmaID),
);

--------------------------------

insert into Curso values
('T�cnico de Inform�tica','O curso t�cnico em inform�tica prepara profissionais
 para atuar em diversas �reas da tecnologia da informa��o' , 1200)


  select * from Curso

  --------------------------------------

insert into Aluno values
('Isabelle Martins', '10/07/2002', 'isabelle.mar@gmail.com')

select *from Aluno

---------------------------------------

insert into Instrutor values
('Marcos','Tecnologia da Informa��o e Fotografia')

select * from  Instrutor

--------------------------------------

insert into Turma values
('9/7/2023', '6/15/2025')

select * from Turma


-----------------------------------
