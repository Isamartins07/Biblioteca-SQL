
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
('Técnico de Informática','O curso técnico em informática prepara profissionais
 para atuar em diversas áreas da tecnologia da informação' , 1200)


  select * from Curso

  --------------------------------------

insert into Aluno values
('Isabelle Martins', '10/07/2002', 'isabelle.mar@gmail.com')

select *from Aluno

---------------------------------------

insert into Instrutor values
('Marcos','Tecnologia da Informação e Fotografia')

select * from  Instrutor

--------------------------------------

insert into Turma values
('9/7/2023', '6/15/2025')

select * from Turma



