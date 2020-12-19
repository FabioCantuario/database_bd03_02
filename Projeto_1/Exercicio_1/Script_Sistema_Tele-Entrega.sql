-- Criado por Fábio Cantuário

CREATE DATABASE db_venda_pizza;
USE db_venda_pizza;

CREATE TABLE zona (
id int not null auto_increment primary key,
nome varchar(20) not null unique
);

CREATE TABLE bairro (
id int not null auto_increment primary key,
nome varchar(75),
tempo_espera varchar(10),
zonaId int,
foreign key (zonaId) references zona(id)
);

CREATE TABLE cliente (
id int not null auto_increment primary key,
nome varchar(80) not null,
fone varchar(13) not null
);

CREATE TABLE endereco (
id int not null auto_increment primary key,
logradouro varchar(150) not null,
numero int not null,
pontoreferencia varchar(50),
clienteId int not null,
bairroId int not null,
foreign key (bairroId) references bairro(id),
foreign key (clienteId) references cliente(id)
);

CREATE TABLE cargo (
id int not null auto_increment primary key,
descricao varchar(80) not null
);

CREATE TABLE funcionario (
id int not null auto_increment primary key,
nome varchar(80) not null,
fone varchar(13) default 0,
cargoId int not null,
foreign key (cargoId) references cargo(id)
);

CREATE TABLE ingrediente (
id int not null auto_increment primary key,
descricao varchar(300) not null
);

CREATE TABLE pizza (
id int not null auto_increment primary key,
sabor varchar(80) not null,
tamanho varchar(2) not null,
valorUn decimal(8,2) not null,
ingredienteId int not null,
foreign key (ingredienteId) references ingrediente(id)
);

CREATE TABLE pedido (
id int not null auto_increment primary key,
dtEmissao datetime not null, 
clienteId int not null,
endCliId int not null,
funcEntregaId int not null,
funcEmiteId int not null,
entrega boolean,
valorTotal decimal(8,2) not null,
foreign key (clienteId) references cliente(id),
foreign key (endCliId) references endereco(id),
foreign key (funcEntregaId) references funcionario(id),
foreign key (funcEmiteId) references funcionario(id)
);

CREATE TABLE pedido_item (
id int not null auto_increment primary key,
pedidoId int not null,
pizzaId int not null,
qtdPizza int not null,
foreign key (pedidoId) references pedido(id),
foreign key (pizzaId) references pizza(id)
);

CREATE TABLE cardapio (
id int not null auto_increment primary key,
tpCardapio varchar(50) not null unique,
pizzaId int not null,
foreign key (pizzaId) references pizza(id)
);
