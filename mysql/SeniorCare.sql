create database SeniorCare;
use seniorcare;

CREATE TABLE Endereço(
  idEndereço INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT primary key,
  Cidade VARCHAR(30),
  Bairro VARCHAR(30),
  Rua VARCHAR(50),
  Nº INT);


CREATE TABLE Usuário(
  idUsuário INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT primary key,
  Endereço_idEndereço INTEGER UNSIGNED  NOT NULL,
  Login VARCHAR(50),
  Senha VARCHAR(20),
INDEX Usuário_FKIndex1(Endereço_idEndereço),
  FOREIGN KEY(Endereço_idEndereço)
    REFERENCES Endereço(idEndereço));


CREATE TABLE Avaliação(
  idAvaliação INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT primary key,
  Usuário_idUsuário INTEGER UNSIGNED  NOT NULL,
  Avaliação VARCHAR(250) Null,
INDEX Avaliação_FKIndex1(Usuário_idUsuário),
  FOREIGN KEY(Usuário_idUsuário) REFERENCES Usuário(idUsuário));


CREATE TABLE Idoso(
  CPF_Idoso INT  NOT NULL   AUTO_INCREMENT primary key,
  Usuário_idUsuário INTEGER UNSIGNED  NOT NULL,
  Nome VARCHAR(30),
  Idade INT,
  Sexo VARCHAR(10),
  Tipo_Sanguíneo VARCHAR(3),
  Medicamentos VARCHAR(250),
  Necessidade VARCHAR(250),
INDEX Idoso_FKIndex1(Usuário_idUsuário),
  FOREIGN KEY(Usuário_idUsuário) REFERENCES Usuário(idUsuário));


CREATE TABLE Cuidador(
  Cpf_Cuidador INT  NOT NULL   AUTO_INCREMENT primary key,
  Usuário_idUsuário INTEGER UNSIGNED  NOT NULL,
  Idoso_CPF_Idoso INT  NOT NULL,
  Nome VARCHAR(30),
  Idade INT,
  Sexo VARCHAR(10),
INDEX Cuidador_FKIndex1(Idoso_CPF_Idoso),
INDEX Cuidador_FKIndex2(Usuário_idUsuário),
  FOREIGN KEY(Idoso_CPF_Idoso) REFERENCES Idoso(CPF_Idoso),
  FOREIGN KEY(Usuário_idUsuário) REFERENCES Usuário(idUsuário));


CREATE TABLE Agenda(
  idAgenda INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT primary key,
  Cuidador_Cpf_Cuidador INT  NOT NULL,
  Idoso_CPF_Idoso INT  NOT NULL,
  Dia_de_Consulta DATE,
  Horário_de_medicamento INT,
  Data_de_medicamento DATE,
INDEX Agenda_FKIndex1(Idoso_CPF_Idoso),
INDEX Agenda_FKIndex2(Cuidador_Cpf_Cuidador),
  FOREIGN KEY(Idoso_CPF_Idoso) REFERENCES Idoso(CPF_Idoso),
  FOREIGN KEY(Cuidador_Cpf_Cuidador) REFERENCES Cuidador(Cpf_Cuidador));



CREATE TABLE Serviço_de_Assistência(
  idAssistencia INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT primary key,
  Cuidador_Cpf_Cuidador INT  NOT NULL,
  Tipo_de_Serviço VARCHAR(50),
  Data_do_Serviço DATE,
  Custo_do_Serviço FLOAT(15,2),
INDEX Serviço_de_Assistência_FKIndex1(Cuidador_Cpf_Cuidador),
  FOREIGN KEY(Cuidador_Cpf_Cuidador) REFERENCES Cuidador(Cpf_Cuidador));



CREATE TABLE Histórico(
  idHistórico INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT primary key,
  Agenda_idAgenda INTEGER UNSIGNED  NOT NULL,
  Dias_de_Consulta DATE,
  Medicamentos_Tomados VARCHAR(250),
  Dias_de_medicamento DATE,
  Horários_dos_medicamentos INT,
INDEX Histórico_FKIndex1(Agenda_idAgenda),
  FOREIGN KEY(Agenda_idAgenda) REFERENCES Agenda(idAgenda));



