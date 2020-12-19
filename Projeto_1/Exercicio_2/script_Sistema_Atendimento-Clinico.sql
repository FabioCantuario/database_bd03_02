-- Criado por: Fábio Cantuário

CREATE DATABASE bd_ClinicaMedica;
USE bd_ClinicaMedica;

CREATE TABLE especialidade (
 id int not null auto_increment primary key,
 nome varchar(100) not null,
 descricao varchar(300) not null
);

CREATE TABLE medico (
 id int not null auto_increment primary key,
 crm int not null unique,
 nome varchar(80) not null,
 salario decimal(8,2) not null,
 nivel_resp boolean null default 0,
 espId int not null,
 foreign key (espId) references especialidade(id)
 );
 
 CREATE TABLE paciente (
 id int not null auto_increment primary key,
 nome varchar(80) not null,
 rg varchar(10) not null,
 cpf varchar(14) not null unique,
 data_nasc date not null,
 endereco varchar(100) not null
);

CREATE TABLE plantao (
 id int not null auto_increment primary key,
 medId int not null,
 pacId int not null,
 foreign key (medId) references medico(id),
 foreign key (pacId) references paciente(id)
 );

CREATE TABLE andar (
 id int not null auto_increment primary key,
 nr_andar int not null
);

CREATE TABLE quarto (
 id int not null auto_increment primary key,
 nr_quarto int not null,
 nrAndarId int not null,
 foreign key (nrAndarId) references andar(id)
);

CREATE TABLE telefone (
 id int not null auto_increment primary key,
 nr_fone varchar(15) not null,
 pacienteId int not null,
 foreign key (pacienteId) references paciente(id)
);

CREATE TABLE ficha_atendimento (
 id int not null auto_increment primary key,
 pacienteId int not null,
 fonePacId int not null,
 quartoId int not null unique,
 medId int not null,
 hora_diaria_med_resp time not null,
 plaId int not null,
 foreign key (pacienteId) references paciente(id),
 foreign key (fonePacId) references telefone(id),
 foreign key (quartoId) references quarto(id),
 foreign key (medId) references medico(id),
 foreign key (plaId) references plantao(id)
);
