set search_path to locadora;

/* Funções de agregação: Resumem informação de várias linhas em uma linha só.
 * COUNT: contagem de linhas não nulas
 * MIN: valor mínimo
 * MAX: valor máximo
 * SUM: somatório
 * AVG: valor médio
 *  */

-- contando os emprestimos feitos pelo cliente 2
select count(e.*) from emprestimo e where e.cliente = 2;

-- contando quantos clientes tem o atributo fonecel preenchido. Lembre-se de que apenas linhas
-- não nulas são contadas
select count(c.fonecel) from cliente c;

/* Agregação com agrupamento:
 * 
 * Podemos aplicar as funções de agregação a subgrupos de linhas, onde os subgrupos são
 * gerados com base em valores de atributos. Especificamos agrupamentos com a cláusula GROUP BY
 * e HAVING
 *  */

-- contando o número de emprestimos de cada cliente
-- note que geramos agruamentos com o código dos clientes.
-- Todas as linhas com mesmo código de cliente farão parte de um mesmo subgrupo.
select e.cliente, count(e.*) from emprestimo e group by e.cliente ;

-- contando o número de empréstimos em Blu-ray, VHS e DVD (e demais tipos)
select e.tipo, count(e.*) from emprestimo e group by e.tipo;

-- obtendo a data de nascimento mais antiga de cada país na tabela ator 
select a.nacionalidade, min(a.datanasc) from ator a group by a.nacionalidade order by 1 ;

-- AGRUPANDO POR MAIS DE UMA COLUNA
-- obtendo o número de empréstimos de cada cliente em cada tipo. Note que será preciso
-- agrupar por mais de uma coluna.
select e.cliente, e.tipo, count(e.*) from emprestimo e group by e.cliente, e.tipo 
	order by e.cliente, e.tipo;
/* sempre que listarmos um ou mais atributos junto com a função de agregação, todos esses
 * atributos devem aparecer após a cláusula group by, para que os mesmos sejm usados 
 * para gerar os agrupamentos. */

/* A cláusula HAVING permite especificar condições que cada grupo deve satisfazer para
 * aparecer no resultado da consulta. Essas condições devem ser construídas usando
 * algum função de agregação*/

-- contando o número de empréstimpos em cada tipo
select e.tipo, count(e.*) from emprestimo e group by e.tipo;

-- queremos agora contar o número de empréstimos de cada tipo, mas só exibindo
-- os tipos que tem mais de 6 empréstimos
select e.tipo, count(e.*) from emprestimo e group by e.tipo having count(e.*) > 6; 

/* Note que a cláusula HAVING se destina a especificar condições para filyragem de subgrupos.
 * Não confundir com com a cláusula WHERE, onde especificamos condições para as LINHAS
 * das tabelas consideradas na cláusula FROM.
 * 
 * A cláusula WHERE é aplicada para filtrar linhas ANTES dos agrupamentos serem montados, e, por
 * consequência, antes das funções de agregação serem aplicadas também. Logo, não podemos usar
 * o resultado das funções de agregação para filtrar linhas com a cláusula WHERE.
 * 
 * A cláusula HAVING é aplicada APÓS a montagem dos agrupamentos e APÓS a aplicação das funções
 * de agregação. Logo, podemos usar o resultado da agregação na condição filtrada pela cláusula
 * HAVING. (Note que a filtragem se aplica a GRUPOS e não a linhas isoladas das tabelas)
 *  */

-- obtendo o valor médio pago por emprestimo
select avg(e.valor_pg) from emprestimo e;

-- obtendo a média paga por cada cliente
select e.cliente, avg(e.valor_pg) from emprestimo e group by e.cliente ;

-- obtendo os clientes cuja média do valor pago foi maior que 23
select e.cliente, avg(e.valor_pg) from emprestimo e group by e.cliente 
	having avg(e.valor_pg) > 23;

-- podemos não usar o having lembrando que pode-se aplicar um select sobre a saída de outro select
select T.* from (select e.cliente, avg(e.valor_pg) from emprestimo e group by e.cliente) as T
	where T.avg > 23;

/* CONSULTAS SOBRE DUAS TABELAS OU MAIS 
 * */

-- lista o conteúdo da tabela cliente
select c.* from cliente c;  -- 8 clientes

-- lista o conteúdo da tabela empréstimo
select e.* from emprestimo e;  --20 empréstimos

-- como listar cada empréstimo junto com os dados do cliente que o realizou
-- podemos especificar mais de uma tabela na clausula FROM
select e.*, c.* from emprestimo e, cliente c;

/* observe que agora as colunas da tabela emprestimo aparecem junto com as
 * colunas da tabela cliente. Mas por que a quantidade de linhas do resultado pulou de
 * 20 para 160?
 * 
 * Quando especificamos mais de uma tabela na cláusula FROM, é feito o produto cartesiano
 * entre as linhas das tabelas. Ou seja, cada linha d atabela emprestimo foi combinada
 * com cada linha da tabela cliente. Como temos 20 empréstimos e 8 clientes, geramos um
 * total de 160 combinações.
 * 
 * Observe que essa combinação das linhas das tabelas gera linhas inválidas no resultado
 * que são denominadas TUPLAS FALSAS, pois cada empréstimo é feito apenas por UM cliente
 * específico, e, no entanto, cada emprestimo foi combinado com cada um dos 8 clientes,
 * gerando assim 7 tuplas falsas para cada empréstimo.
 *  */

-- para eliminar as tuplas falsas do resultado, vamos impor o relacionamento entre as tabelas
-- sendo listadas na cláusula FROM
select e.*, c.* from emprestimo e, cliente c
	where e.cliente = c.numcliente;


