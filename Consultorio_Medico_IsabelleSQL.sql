

create database ConsultorioMedico

use ConsultorioMedico

CREATE TABLE Paciente(
PacienteID int identity primary key,
Nome varchar (255) not null,
Data_Nascimento date not null,
Endereco varchar (255) not null,
Telefone int not null,

);

CREATE TABLE Medico (
MedicoID int identity primary key,
Nome varchar (255) not null,
CRM int not null, 
EspecialidadeID int 

);

CREATE TABLE Especialidade (
EspecialidadeID int identity primary key,
Descricao text not null

);

CREATE TABLE Consulta (
ConsultaID int identity primary key,
PacienteID int not null,
MedicoID int not null,
Data_Consulta date not null,
Observacao text not null,

);

ALTER TABLE Medico
ADD FOREIGN KEY (EspecialidadeID) REFERENCES 
Especialidade(EspecialidadeID);


ALTER TABLE Consulta
ADD FOREIGN KEY (PacienteID) REFERENCES
Paciente(PacienteID);

ALTER TABLE Consulta
ADD FOREIGN KEY (ConsultaID) REFERENCES
Consulta(ConsultaID);

/*
-Alterando as tabelas e adicionando Foreign key

ALTER TABLE emprestimos

ADD FOREIGN KEY (LivroID) REFERENCES Livros(LivroID);
 
ALTER TABLE LIVROS

ADD FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
 
-- Apagandoas tabelas

ALTER TABLE emprestimos

DROP CONSTRAINT FK__Emprestim__Livro__36B12243
 
ALTER TABLE livros

DROP CONSTRAINT FK__Livros__AutorID__35BCFE0A;
 
 
--Alterando a tabela criando Foreign key com Constraint.

ALTER TABLE emprestimos

ADD CONSTRAINT FK_Emprestimos_Livros

FOREIGN KEY (LivroID) REFERENCES Livros(LivroID);
 
ALTER TABLE LIVROS

ADD CONSTRAINT FK_LIVROS_AUTOR

FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
 */

 INSERT INTO Paciente VALUES 
 ('Isabelle Martins', '10/07/2002', 'Rua Vitor Bonesso,269, Louveira-SP', 1997109610)

 INSERT INTO Medico VALUES
 ('Mauri Mouro', 568974,1)

 INSERT INTO Especialidade VALUES
 ('Alergista')

 INSERT INTO Consulta VALUES
 (1,9,'11/05/2024','Trazer o resultado do exame de sangue')


 select * from Paciente
 select * from Medico
 select * from Especialidade
 select * from Consulta


 -- UPDATE (ALTERAÇÃO)
 UPDATE Consulta
 SET MedicoID=9

 -- DELETE (APAGAR TODOS)  EXEMPLO:
 DELETE FROM  Medico


 -- inner join

 select Consulta.PacienteID, Paciente.Nome, Medico.Nome from Consulta -- campo desejado
 inner join Paciente on Paciente.PacienteID = Consulta.PacienteID  -- caminho
 inner join Medico on Medico.MedicoID = Consulta.MedicoID-- OBS: tem de ter igualdade entre as tabelas
 

 
 
 where -- da para localizar um dado especifico 
