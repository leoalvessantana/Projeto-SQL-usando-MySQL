# criando um database chamado sucos:
CREATE DATABASE SUCOS DEFAULT CHARACTER SET utf8;

# Selecionado o banco:
use sucos;

# Criando tabela relacionada aos clientes:
CREATE TABLE tbcliente ( 
	CPF varchar(11) NOT NULL,
	NOME varchar(100) DEFAULT NULL,
	ENDERECO_1 varchar(150) DEFAULT NULL,
	ENDERECO_2 varchar(150) DEFAULT NULL,
	BAIRRO varchar(50) DEFAULT NULL,
	CIDADE varchar(50) DEFAULT NULL,
	ESTADO varchar(2) DEFAULT NULL,
	CEP varchar(8) DEFAULT NULL,
	DATA_DE_NASCIMENTO date DEFAULT NULL,
	IDADE smallint(6) DEFAULT NULL,
	SEXO varchar(1) DEFAULT NULL,
	LIMITE_DE_CREDITO float DEFAULT NULL,
	VOLUME_DE_COMPRA float DEFAULT NULL,
	PRIMEIRA_COMPRA bit(1) DEFAULT NULL,
	PRIMARY KEY (CPF)
);

# Criando tabela relacionada aos produtos:
CREATE TABLE tbproduto(
	CODIGO_DO_PRODUTO varchar(10) NOT NULL,
	NOME_DO_PRODUTO varchar(50) DEFAULT NULL,
	EMBALAGEM varchar(20) DEFAULT NULL,
	TAMANHO varchar(10) DEFAULT NULL,
	SABOR varchar(20) DEFAULT NULL,
	PRECO_DE_LISTA float NOT NULL,
	PRIMARY KEY (CODIGO_DO_PRODUTO)
);

# Criando tabela relacionada aos vendedores:
CREATE TABLE tabela_de_vendedores (
  MATRICULA varchar(5) NOT NULL,
  NOME varchar(100) DEFAULT NULL,
  PERCENTUAL_COMISSAO float DEFAULT NULL,
  DATA_ADMISSAO date DEFAULT NULL,
  DE_FERIAS bit(1) DEFAULT NULL,
  BAIRRO varchar(50) DEFAULT NULL,
  PRIMARY KEY (MATRICULA)
);

# Criando tabela relacionada as notas fiscais:
CREATE TABLE notas_fiscais (
  CPF varchar(11) NOT NULL,
  MATRICULA varchar(5) NOT NULL,
  DATA_VENDA date DEFAULT NULL,
  NUMERO int(11) NOT NULL,
  IMPOSTO float NOT NULL,
  PRIMARY KEY (NUMERO),
  KEY MATRICULA (MATRICULA),
  KEY CPF (CPF),
  CONSTRAINT notas_fiscais_ibfk_1 FOREIGN KEY (MATRICULA) REFERENCES tabela_de_vendedores (MATRICULA),
  CONSTRAINT notas_fiscais_ibfk_2 FOREIGN KEY (CPF) REFERENCES tbcliente  (CPF)
);


# Criando tabela relacionada aos itens das notas fiscais:
CREATE TABLE itens_notas_fiscais(
  NUMERO int(11) NOT NULL,
  CODIGO_DO_PRODUTO varchar(10) NOT NULL,
  QUANTIDADE int(11) NOT NULL,
  PRECO float NOT NULL,
  PRIMARY KEY (NUMERO,CODIGO_DO_PRODUTO),
  KEY CODIGO_DO_PRODUTO (CODIGO_DO_PRODUTO),
  CONSTRAINT itens_notas_fiscais_ibfk_1 FOREIGN KEY (CODIGO_DO_PRODUTO) REFERENCES tbproduto (CODIGO_DO_PRODUTO),
  CONSTRAINT itens_notas_fiscais_ibfk_2 FOREIGN KEY (NUMERO) REFERENCES notas_fiscais (NUMERO)
);
