use sucos;

INSERT INTO tbcliente 
(CPF,NOME,ENDERECO_1,ENDERECO_2,BAIRRO,CIDADE,ESTADO,CEP,DATA_DE_NASCIMENTO,IDADE,SEXO,LIMITE_DE_CREDITO,VOLUME_DE_COMPRA,PRIMEIRA_COMPRA) 
VALUES 
	('1471156710','Érica Carvalho','R. Iriquitia','','Jardins','São Paulo','SP','80012212','1990-09-01',27,'F',170000,24500,0),
	('19290992743','Fernando Cavalcante','R. Dois de Fevereiro','','Água Santa','Rio de Janeiro','RJ','22000000','2000-02-12',18,'M',100000,20000, 0),
	('2600586709','César Teixeira','Rua Conde de Bonfim','','Tijuca','Rio de Janeiro','RJ','22020001','2000-03-12',18,'M',120000,22000,_binary '\0'),
	('3623344710','Marcos Nougeuira','Av. Pastor Martin Luther King Junior','','Inhauma','Rio de Janeiro','RJ','22002012','1995-01-13',23,'M',110000,22000,''),
	('492472718','Eduardo Jorge','R. Volta Grande','','Tijuca','Rio de Janeiro','RJ','22012002','1994-07-19',23,'M',75000,9500,''),
	('50534475787','Abel Silva ','Rua Humaitá','','Humaitá','Rio de Janeiro','RJ','22000212','1995-09-11',22,'M',170000,26000,_binary '\0'),
	('5576228758','Petra Oliveira','R. Benício de Abreu','','Lapa','São Paulo','SP','88192029','1995-11-14',22,'F',70000,16000,''),
	('5648641702','Paulo César Mattos','Rua Hélio Beltrão','','Tijuca','Rio de Janeiro','RJ','21002020','1991-08-30',26,'M',120000,22000,_binary '\0'),
	('5840119709','Gabriel Araujo','R. Manuel de Oliveira','','Santo Amaro','São Paulo','SP','80010221','1985-03-16',32,'M',140000,21000,''),
	('7771579779','Marcelo Mattos','R. Eduardo Luís Lopes','','Brás','São Paulo','SP','88202912','1992-03-25',25,'M',120000,20000,''),
	('8502682733','Valdeci da Silva','R. Srg. Édison de Oliveira','','Jardins','São Paulo','SP','82122020','1995-10-07',22,'M',110000,19000,_binary '\0'),
	('8719655770','Carlos Eduardo','Av. Gen. Guedes da Fontoura','','Jardins','São Paulo','SP','81192002','1983-12-20',34,'M',200000,24000,_binary '\0'),
	('9283760794','Edson Meilelles','R. Pinto de Azevedo','','Cidade Nova','Rio de Janeiro','RJ','22002002','1995-10-07',22,'M',150000,25000,''),
	('94387575700','Walber Lontra','R. Cel. Almeida','','Piedade','Rio de Janeiro','RJ','22000201','1989-06-20',28,'M',60000,12000,''),
	('95939180787','Fábio Carvalho','R. dos Jacarandás da Península','','Barra da Tijuca','Rio de Janeiro','RJ','22002020','1992-01-05',16,'M',90000,18000,''
);

SELECT * FROM tbcliente;


INSERT INTO tbproduto 
(CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) 
VALUES 
	('1040107', 'Light - 350 ml - Melancia', 'Lata', '350 ml', 'Melancia', 4.56),
	('1037797', 'Clean - 2 Litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.01),
	('1000889', 'Sabor da Montanha - 700 ml - Uva', 'Garrafa', '700 ml', 'Uva', 6.31),
	('1004327', 'Videira do Campo - 1,5 Litros - Melancia', 'PET', '1,5 Litros', 'Melancia', 19.51),
	('544931', 'Frescor do Verão - 350 ml - Limão', 'PET', '350 ml','Limão',3.20),
	('1078680', 'Frescor do Verão - 470 ml - Manga', 'Lata', '470 ml','Manga',5.18),
	('1086543','Linha Refrescante - 1 Litro - Manga','PET','1 Litro','Manga',11.0105),
	('1096818','Linha Refrescante - 700 ml - Manga','Garrafa','700 ml','Manga',7.7105),
	('1101035','Linha Refrescante - 1 Litro - Morango/Limão','PET','1 Litro','Morango/Limão',9.0105),
	('229900','Pedaços de Frutas - 350 ml - Maça','Lata','350 ml','Maça',4.211),
	('231776','Festival de Sabores - 700 ml - Açai','Garrafa','700 ml','Açai',13.312),
	('235653','Frescor do Verão - 350 ml - Manga','Lata','350 ml','Manga',3.8595),
	('243083','Festival de Sabores - 1,5 Litros - Maracujá','PET','1,5 Litros','Maracujá',10.512),
	('290478','Videira do Campo - 350 ml - Melância','Lata','350 ml','Melância',4.56),
	('326779','Linha Refrescante - 1,5 Litros - Manga','PET','1,5 Litros','Manga',16.5105),
	('394479','Sabor da Montanha - 700 ml - Cereja','Garrafa','700 ml','Cereja',8.409),
	('479745','Clean - 470 ml - Laranja','Garrafa','470 ml','Laranja',3.768),
	('520380','Pedaços de Frutas - 1 Litro - Maça','PET','1 Litro','Maça',12.011),
	('695594','Festival de Sabores - 1,5 Litros - Açai','PET','1,5 Litros','Açai',28.512),
	('723457','Festival de Sabores - 700 ml - Maracujá','Garrafa','700 ml','Maracujá',4.912),
	('746596','Light - 1,5 Litros - Melância','PET','1,5 Litros','Melância',19.505),
	('773912','Clean - 1 Litro - Laranja','PET','1 Litro','Laranja',8.008),
	('783663','Sabor da Montanha - 700 ml - Morango','Garrafa','700 ml','Morango',7.709),
	('788975','Pedaços de Frutas - 1,5 Litros - Maça','PET','1,5 Litros','Maça',18.011),
	('812829','Clean - 350 ml - Laranja','Lata','350 ml','Laranja',2.808),
	('826490','Linha Refrescante - 700 ml - Morango/Limão','Garrafa','700 ml','Morango/Limão',6.3105),
	('838819','Clean - 1,5 Litros - Laranja','PET','1,5 Litros','Laranja',12.008),
    ('1002334','Linha Citros - 1 Litro - Lima/Limão','PET','1 Litro','Lima/Limão',7.004),
	('1002767','Videira do Campo - 700 ml - Cereja/Maça','Garrafa','700 ml','Cereja/Maça',8.41),
	('1013793','Videira do Campo - 2 Litros - Cereja/Maça','PET','2 Litros','Cereja/Maça',24.01),
	('1022450','Festival de Sabores - 2 Litros - Açai','PET','2 Litros','Açai',38.012),
	('1041119','Linha Citros - 700 ml - Lima/Limão','Garrafa','700 ml','Lima/Limão',4.904
);

-- Excluindo registros:
DELETE FROM tbproduto WHERE CODIGO_DO_PRODUTO = '544931';

SELECT * FROM tbproduto;



INSERT INTO tabela_de_vendedores
(MATRICULA,NOME,PERCENTUAL_COMISSAO,DATA_ADMISSAO,DE_FERIAS,BAIRRO)
VALUES
	('00235','Márcio Almeida Silva',0.08,'2014-08-15',_binary '\0','Tijuca'),
	('00236','Cláudia Morais',0.08,'2013-09-17','','Jardins'),
	('00237','Roberta Martins',0.11,'2017-03-18','','Copacabana'),
	('00238','Pericles Alves',0.11,'2016-08-21',_binary '\0','Santo Amaro'
);

SELECT * FROM tabela_de_vendedores;



INSERT INTO notas_fiscais 
(CPF,MATRICULA,DATA_VENDA,NUMERO,IMPOSTO)
VALUES
	('7771579779','00235','2015-01-01',100,0.1),
	('50534475787','00237','2015-01-02',101,0.12),
	('8502682733','00236','2015-01-03',102,0.12),
	('5840119709','00235','2015-01-04',103,0.12),
	('1471156710','00235','2015-01-05',104,0.12),
	('94387575700','00236','2015-01-06',105,0.1),
	('3623344710','00237','2015-01-07',106,0.1),
	('5576228758','00236','2015-01-08',107,0.1),
	('19290992743','00237','2015-01-09',108,0.12),
	('94387575700','00236','2015-01-10',109,0.12),
	('5840119709','00235','2015-01-11',110,0.12),
	('492472718','00237','2015-01-12',111,0.1),
	('5840119709','00236','2015-01-13',112,0.12),
	('50534475787','00235','2015-01-14',113,0.1),
	('94387575700','00235','2015-01-15',114,0.1),
	('94387575700','00236','2015-01-16',115,0.12),
	('50534475787','00235','2015-01-17',116,0.1),
	('8719655770','00236','2015-01-18',117,0.12),
	('2600586709','00235','2015-01-19',118,0.12),
	('3623344710','00236','2015-01-20',119,0.1),
	('3623344710','00235','2015-01-21',120,0.1
);


SELECT * FROM notas_fiscais;







INSERT INTO itens_notas_fiscais 
(NUMERO,CODIGO_DO_PRODUTO,QUANTIDADE,PRECO)
VALUES
	(100,'1013793',63,24.01),
	(100,'1101035',26,9.0105),
	(100,'520380',67,12.011),
	(100,'773912',66,8.008),
	(101,'1000889',35,6.309),
	(101,'479745',65,3.768),
	(102,'1101035',84,9.0105),
	(102,'235653',37,3.8595),
	(102,'394479',74,8.409),
	(103,'520380',29,12.011),
	(104,'788975',66,18.011),
	(105,'1037797',98,16.008),
	(105,'1040107',57,4.555),
	(105,'695594',82,28.512),
	(106,'1004327',19,19.51),
	(106,'773912',11,8.008),
	(106,'826490',24,6.3105),
	(107,'1096818',91,7.7105),
	(107,'229900',12,4.211),
	(107,'394479',60,8.409),
	(108,'1013793',70,24.01),
	(109,'231776',18,13.312),
	(109,'243083',85,10.512),
	(109,'812829',11,2.808),
	(110,'1002767',24,8.41),
	(110,'1013793',24,24.01),
	(110,'231776',84,13.312),
	(111,'1086543',28,11.0105),
	(112,'229900',20,4.211),
	(112,'243083',73,10.512),
	(112,'326779',87,16.5105),
	(112,'826490',38,6.3105),
	(113,'1004327',15,19.51),
	(113,'1086543',55,11.0105),
	(113,'290478',88,4.56),
	(113,'773912',95,8.008),
	(114,'1004327',42,19.51),
	(114,'1037797',40,16.008),
	(114,'231776',35,13.312),
	(114,'812829',30,2.808),
	(115,'1078680',36,5.1795),
	(115,'520380',42,12.011),
	(116,'1013793',73,24.01),
	(116,'1037797',82,16.008),
	(117,'1000889',70,6.309),
	(117,'1004327',44,19.51),
	(117,'788975',99,18.011),
	(118,'1022450',61,38.012),
	(118,'1037797',82,16.008),
	(118,'229900',49,4.211),
	(118,'783663',22,7.709),
	(119,'723457',22,4.912),
	(120,'235653',67,3.8595
);

SELECT * FROM itens_notas_fiscais;







