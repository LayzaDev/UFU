﻿--O CLIENTE "Thiago Andrade Fiuza", ANTES MORADOR DA CIDADE DE ITAMBACURI, MUDOU DE ENDEREÇO 
--E SOLICITOU A ALTERÇÃO DE SEUS DADOS NO BANCO. O NOVO ENDEREÇO PASSA A SER NA CIDADE DE 
--UBERLANDIA, À AVENIDA AFONSO PENA. ATUALIZE OS DADOS DO CLIENTE:

--ANTES
SELECT * FROM CLIENTE WHERE CIDADE_CLIENTE = 'Itambacuri';

UPDATE CLIENTE SET CIDADE_CLIENTE = 'Uberlandia', 
		   RUA_CLIENTE='Avenida Afonso Pena'
WHERE 	NOME_CLIENTE = 'Thiago Andrade Fiuza' 
AND 	CIDADE_CLIENTE = 'Itambacuri';

--DEPOIS
SELECT * FROM CLIENTE WHERE CIDADE_CLIENTE = 'Uberlandia';

--AO FINAL DO MÊS É NECESSÁRIO ATUALIZAR O SALDO DAS CONTAS DOS CLIENTES APLICANDO
--A CORREÇÃO DA INFLAÇÃO DE 1% SOBRE AS MESMAS. IMPLEMENTE ESTA ATUALIZAÇÃO VIA SQL.

--ANTES E DEPOIS
SELECT NOME_CLIENTE, SUM(saldo_deposito) FROM DEPOSITO 
GROUP BY NOME_CLIENTE ORDER BY SUM(saldo_deposito);

UPDATE DEPOSITO SET SALDO_DEPOSITO = SALDO_DEPOSITO * 1.01;

--AO FINAL DO MÊS É NECESSÁRIO ATUALIZAR O SALDO DAS CONTAS DOS CLIENTES APLICANDO
--OS JUROS DOS INVESTIMENTOS SOBRE AS MESMAS. 
--CLIENTES COM SALDO ATÉ DEZ MIL RECEBEM 3% DE ACRÉSCIMO.
--CLIENTES COM SALDO MAIOR QUE DEZ MIL RECEBEM 5% DE ACRÉSCIMO.

--ANTES E DEPOIS
SELECT NOME_CLIENTE, SUM(SALDO_DEPOSITO) FROM DEPOSITO 
GROUP BY NOME_CLIENTE ORDER BY SUM(SALDO_DEPOSITO)

UPDATE DEPOSITO SET SALDO_DEPOSITO = SALDO_DEPOSITO * 1.05
WHERE SALDO_DEPOSITO <= 10000;

UPDATE DEPOSITO SET SALDO_DEPOSITO = SALDO_DEPOSITO * 1.03
WHERE SALDO_DEPOSITO > 10000;

--A ORDEM DE EXECUÇÃO DAS CONSULTAS É IMPORTANTE PORQUE SENÃO UM 
--CLIENTE COM SALDO LIGEIRAMENTE INFERIOR A DEZ MIL PODE RECEBER 
--UM ACRÉSCIMO DE 8.15% = (1.03*1.05)

-- DADOS ARMAZENADOS EM DEPOSITO
SELECT * FROM DEPOSITO;

--INSERIR NOVOS DEPOSITOS NO BANCO DE DADOS

INSERT INTO DEPOSITO
VALUES (10000, 40907,  'Pampulha', 'Adilson de Oliveira', 1200);

-- VERIFICANDO:
SELECT * FROM DEPOSITO WHERE NOME_CLIENTE = 'Adilson de Oliveira'

--INCLUIR PARA TODOS OS CLIENTES COM EMPRESTIMOS NA AGENCIA PUC
--UMA CONTA DE DEPÓSITO NO VALOR DE R$ 200,00.

INSERT INTO DEPOSITO
SELECT NUMERO_EMPRESTIMO, NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE
FROM EMPRESTIMO WHERE NOME_AGENCIA = 'PUC';








--VERIFICANDO:
SELECT * FROM DEPOSITO WHERE NOME_AGENCIA = 'PUC' 
AND SALDO_DEPOSITO = 200








--O MAIS CORRETO AQUI É A CRIAÇÃO DE UM NÚMERO SEQUENCIAL PARA 
--IDENTIFICAR O NÚMERO DO DEPÓSITO. SUPONDO QUE JÁ TEMOS 
--ALGUNS NÚMEROS TEMOS QUE COMEÇAR A NOSSA SEQUENCIA DE MAX+1








SELECT NUMERO_DEPOSITO FROM DEPOSITO








CREATE seq_deposito INCREMENT 1 START 8795331;
--              ^^^^^^^^^^^^     
--use letras minúsculas no nome da sequencia para evitar problemas








--AGORA NÃO PRECISAMOS INSERIR O NÚMERO DO DEPÓSITO MANUALMENTE








INSERT INTO DEPOSITO
SELECT ('seq_deposito'), NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE, 200
FROM EMPRESTIMO WHERE NOME_AGENCIA = 'PUC';








--07- UM MILIONÁRIO DECIDIU DOAR PARTE DE SUA FORTUNA PARA CLIENTES 
--DO BANCO COM DÍVIDAS ALTAS. O CRITÉRIO SERÁ DEPOSITAR 2 MIL REAIS
--PARA TODOS OS CLIENTES DO BANCO QUE FIZERAM EMPRESTIMOS CUJAS
--SOMAS ULTRAPASSEM A SOMA DE DEPÓSITOS. CRIE UM SQL PARA INSERIR
-- NA TABELA DE DEPÓSITOS QUANTIAS DE 2 MIL REAIS PARA TODAS AS CONTAS
-- QUE ESTÃO COM SALDO NEGATIVO EM MAIS DE DOIS MIL REAIS.






INSERT INTO DEPOSITO
SELECT nextval('seq_deposito'), NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE, 2000
FROM ...








--VALORES NEGATIVOS

     SELECT NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE, SUM(VALOR_EMPRESTIMO) AS SOMA 
     FROM EMPRESTIMO GROUP BY NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE









--VALORES POSITIVOS


     SELECT NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE, SUM(SALDO_DEPOSITO)        AS SOMA 
     FROM DEPOSITO   BY NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE







--JUNÇÃO DOS DADOS NEGATIVOS E POSITIVOS
SELECT NUMERO_CONTA , NOME_AGENCIA , NOME_CLIENTE  FROM (
     SELECT NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE, SUM(VALOR_EMPRESTIMO) AS SOMA 
     FROM EMPRESTIMO GROUP BY NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE
     EXCEPT
     SELECT NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE, SUM(SALDO_DEPOSITO)        AS SOMA 
     FROM DEPOSITO   GROUP BY NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE
   ) AS RELATORIO1











--JUNÇÃO DOS DADOS NEGATIVOS E POSITIVOS E FILTRAGEM DOS REGISTROS


SELECT NUMERO_CONTA , NOME_AGENCIA , NOME_CLIENTE  FROM (
     SELECT NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE, SUM(VALOR_EMPRESTIMO)*(-1) AS SOMA 
     FROM EMPRESTIMO GROUP BY NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE
     INTERSECT
     SELECT NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE, SUM(SALDO_DEPOSITO)        AS SOMA 
     FROM DEPOSITO   GROUP BY NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE
   ) AS RELATORIO1
GROUP BY NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE
HAVING < -2000









--ENTÃO:
INSERT INTO DEPOSITO
SELECT nextval(), NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE, 2000 
FROM 
(  NUMERO_CONTA , NOME_AGENCIA , NOME_CLIENTE  FROM (
     SELECT NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE, SUM(VALOR_EMPRESTIMO)*(-1) AS SOMA 
     FROM EMPRESTIMO GROUP BY NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE
     UNION
     SELECT NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE, SUM(SALDO_DEPOSITO)        AS SOMA 
     FROM EMPRESTIMO   GROUP NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE
   ) 
GROUP BY NUMERO_CONTA, NOME_AGENCIA, NOME_CLIENTE
HAVING < -2000
) as RELATORIO2
