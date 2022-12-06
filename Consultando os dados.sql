use sucos;

-- Fazendo consulta com os campos nomeados:
SELECT CPF AS CPF_CLIENTE, NOME AS NOME_CLIENTE FROM tbcliente;

-- Alterando o sabor limão para cítricos:
UPDATE tbproduto SET SABOR = 'Cítricos' WHERE SABOR = 'Lima/Limão';
select NOME_DO_PRODUTO, SABOR from tbproduto;

-- Selecionando clientes que tem 22 anos:
SELECT * FROM tbcliente WHERE IDADE = 22;

-- Selecionando os clientes que fazem aniversario no mês de Outubro:
SELECT * FROM tbcliente WHERE MONTH(DATA_DE_NASCIMENTO) = 10;

-- Listando todos os produtos em que o preço está entre `5.0` e `10.0` , usando o comando ***BETWEEN***:
SELECT * FROM tbproduto WHERE PRECO_DE_LISTA BETWEEN 5 AND 10;

-- Selecionando os produtos onde PRECO_DE_LISTA enta entre 5 e 10:
SELECT * FROM tbproduto WHERE PRECO_DE_LISTA >= 5 AND PRECO_DE_LISTA <= 10;

-- Comando 'WHERE NOT' 
-- fazendo uma consulta de todos os registros **exceto** os que têm sabor manga e tamanho 470 ml ao mesmo tempo**:
SELECT * FROM tbproduto WHERE NOT (SABOR = 'Manga' AND TAMANHO = '470 ml');

-- Comando 'IN'
-- selecionando todos os produtos da "tbproduto" cujo sabor está **contido** na lista `('Laranja', 'Manga')`
SELECT * FROM tbprodutos WHERE SABOR IN ('Laranja', 'Manga');
-- equivale á:
SELECT * FROM tbproduto WHERE SABOR = 'Laranja' OR SABOR = 'Manga';

-- Operador `LIKE`
-- Procurando todos que tem maça no nome:
SELECT * FROM tbproduto WHERE SABOR LIKE '%Maça%';

-- Comando `DISTINCT`
-- Vendo os diferentes tamanhos que cada embalagem tem (Seleciona somente as linhas que são diferentes em si):
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tbproduto;

-- Comando `LIMIT` 
-- Selecionando as 5 primeiras linhas:
SELECT * FROM tbproduto LIMIT 5;
-- Selecionando **três linhas** a partir do segundo código "1002767":
SELECT * FROM tbproduto LIMIT 2, 3;

-- Comando `ORDER BY` 
-- Ordenando pelo `PRECO_DE_LISTA` de forma decrescente:
SELECT * FROM tbproduto ORDER BY PRECO_DE_LISTA DESC;
-- Ordenando primeiro a `EMBALAGEM` de foram decrescente e depois  pelo `NOME_DO_PRODUTO` de forma crescente:
SELECT * FROM tbproduto ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC;

-- Comando `GROUP BY` 
-- Qual o total de LIMITE_DE_CREDITO em cada ESTADO?
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) as LIMITE_TOTAL FROM tbcliente GROUP BY ESTADO;
-- Qual o limite de credito de cada bairro da cidade de Rio de Janeiro de forma ordenada pelos bairros?
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) as LIMITE FROM tbcliente
WHERE CIDADE = 'Rio de Janeiro'
GROUP BY ESTADO, BAIRRO
ORDER BY BAIRRO;

-- 	Comando 'HAVING' 
-- Mostrar para cada estado a soma do limite de credito para a condição LIMITE_DE_CREDITO maior que 900000:
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) as SOMA_LIMITE FROM tbcliente
GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) > 900000;
-- Mostrar para cada embalagem o produto que tem maior e menor valor, respeitando a condição SUM(PRECO_DE_LISTA)<=80 :
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) as MAIOR_PRECO,
MIN(PRECO_DE_LISTA) as MENOR_PRECO FROM tbproduto
GROUP BY EMBALAGEM
HAVING SUM(PRECO_DE_LISTA) <= 80;


-- Coamndo 'CASE'
-- Classificando os produtos entre "baratos", "em conta" ou "caros":
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
CASE
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
END AS STATUS_PRECO
FROM tbproduto;

-- Fazendo uma seleção que apresenta a média (average) de preços de produtos baratos, em conta ou caros, agrupados por tipo de embalagem:
SELECT EMBALAGEM,
CASE
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
END AS STATUS_PRECO, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tbproduto
GROUP BY EMBALAGEM,
CASE
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
END;

-- Agora além disso especificando para o sabor manga:
SELECT EMBALAGEM,
CASE
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
END AS STATUS_PRECO, sabor, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tbproduto
WHERE sabor = 'Manga'
GROUP BY EMBALAGEM,
CASE
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
END
ORDER BY EMBALAGEM;



-- Estruturas 'JOIN'

-- 'INNER JOIN'
-- Quantas notas fiscais cada vendedor emitiu?
SELECT A.MATRICULA, A.NOME, COUNT(*) FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;

-- 'LEFT JOIN'
-- Quais clientes que nunca compraram?
SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tbcliente A
LEFT JOIN notas_fiscais B ON A.CPF = B.CPF
WHERE B.CPF IS NULL;

-- 'RIGHT JOIN'
-- Quais clientes que nunca compraram em 2015?
SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM notas_fiscais B
RIGHT JOIN tbcliente A ON A.CPF = B.CPF
WHERE B.CPF IS NULL AND YEAR(B.DATA_VENDA)=2015;

-- 'LEFT JOIN'
-- Qual vendedor não tem cliente no seu mesmo bairro?
SELECT tabela_de_vendedores.BAIRRO AS BAIRRO_VENDEDOR,
DE_FERIAS AS DE_FERIAS_VENDEDOR,
tabela_de_vendedores.NOME AS NOME_VENDEDOR,
tbcliente.BAIRRO AS BAIRRO_CLIENTE,
tbcliente.NOME AS NOME_CLIENTE FROM tabela_de_vendedores LEFT JOIN tbcliente
ON tabela_de_vendedores.BAIRRO = tbcliente.BAIRRO;

-- 'RIGHT JOIN'
-- Quais clientes não tem vendedores no seu mesmo bairro?
SELECT tabela_de_vendedores.BAIRRO AS BAIRRO_VENDEDOR,
DE_FERIAS AS DE_FERIAS_VENDEDOR,
tabela_de_vendedores.NOME AS NOME_VENDEDOR,
tbcliente.BAIRRO AS BAIRRO_CLIENTE,
tbcliente.NOME AS NOME_CLIENTE FROM tabela_de_vendedores RIGHT JOIN tbcliente
ON tabela_de_vendedores.BAIRRO = tbcliente.BAIRRO;

-- 'CROSS JOIN'
-- PRODUTO CARTESIANO ENTRE OS BAIRROS DOS VENDEDORES E CLIENTES:
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
DE_FERIAS,
tbcliente.BAIRRO,
tbcliente.NOME FROM tabela_de_vendedores, tbcliente;

-- Comando 'UNION'
-- Simulando um FULL JOIN:
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tbcliente.BAIRRO,
tbcliente.NOME  FROM tabela_de_vendedores LEFT JOIN tbcliente
ON tabela_de_vendedores.BAIRRO = tbcliente.BAIRRO
UNION
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tbcliente.BAIRRO,
tbcliente.NOME  FROM tabela_de_vendedores RIGHT JOIN tbcliente
ON tabela_de_vendedores.BAIRRO = tbcliente.BAIRRO;




-- Subconsultas
-- Selecionando as informações dos clientes, sendo que os bairros são apenas os que estao na tabela de vendedores:
SELECT * FROM tbcliente WHERE BAIRRO
IN (SELECT DISTINCT BAIRRO FROM tabela_de_vendedores);

-- Primeiro consultando o maior preço de cada tipo de embalagem:
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) as PRECO_MAXIMO FROM tbproduto
GROUP BY EMBALAGEM;
-- Agora fazendo uma subconsulta. Selecionando as embalagens cujo preço mais caro é maior ou igual que R$10:
SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tbproduto
GROUP BY EMBALAGEM) X WHERE X.PRECO_MAXIMO >= 10;


-- VIEW	
-- Dentro do Workbench, vamos até o painel à esquerda dentro da base "sucos_vendas" e clicamos em "Views". 
-- Em seguida, selecionaremos "Create View..." e uma nova aba será aberta. Nela, vamos digitar o seguinte código para criar uma visão:
-- CREATE VIEW 'vw_maiores_embalagens' AS
-- SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos
-- GROUP BY EMBALAGEM

-- Então voltando ao nosso script, agora que criamos a visão podemos refazer a última seleção de um jeito alternativo, 
-- substituindo a subconsulta pela nova view:
SELECT X.EMBALAGEM, X.MAIOR_PRECO FROM
vw_maiores_embalagens X WHERE X.MAIOR_PRECO >= 10;

-- Também temos a opção de fazer, por exemplo, um JOIN com informações da tabela de produtos e dados da visão:
SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.MAIOR_PRECO
FROM tbproduto A INNER JOIN vw_maiores_embalagens X
ON A.EMBALAGEM = X.EMBALAGEM;











