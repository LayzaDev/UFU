set search_path to locadora;

select * from cliente c;

-- o operador join faz junção interna.
select e.*, c.nome  from emprestimo e join cliente c on e.cliente = c.numcliente; 

/* Na junção interna, a tabela resultante possui as linhas de uma das tabelas que tem relação na outra.
 * Assim, no exemplo acima, mostramos as linhas a tabela emprestimo com o nome do respectivo cliente
 * que o realizou.
 * Como apenas as linhas de uma tabela que tem relação na outra são exibidas, serão deixados de fora
 * emprestimos que não tenham cliente (emprestimo com valor NULL no campo cliente) e clientes que
 * não fizeram nenhum empréstimo.
 * 
 * Em algumas situações, pode ser preciso exibir:
 * 
 * 1 - as linhas de uma tabela que tenham relação com alguma linha da outra tabela
 * 2 - as linhas de ao menos uma das tabelas que não tenham relação com alguma linha da outra ( no exemplo,
 * seriam emprestimos sem cliente ou clientes sem empréstimo)
 * 
 * Nesse tipo de situação, podemos usar o conceito de junção externa. Temos 3 tipos de junção externa
 */

/* Podemos exibir, junto com as linhas que se relacionam, as linhas da tabela cliente que não
 * tem relação com a tabela emprestimo. Para isso, faremos um right outer join (junção externa à direita)*/
select e.*, c.nome  from emprestimo e right outer join cliente c on e.cliente = c.numcliente; 

/* No exemplo, acima, exibimos, além das linhas que tem correspondência entre as tabelas empréstimo e
 * cliente, as linhas da tabela cliente que não tem correspondência na tabela empréstimo, pois a 
 * tabla cliente é a tabela que está a direita do operador. 
 * Note que o cliente Jéssica agora aparece no resultado, tendo NULL como valor referente às colunas
 * da tabela empréstimo. */

/* se fizermos um left outer join, estaremos fazendo uma junção externa à esquerda, ou seja, nessa caso
 * as linhas da tabela empréstimo que não tenham correspondência com a tabela cliente serão incuídas
 * no resultado*/
select e.*, c.nome  from emprestimo e left outer join cliente c on e.cliente = c.numcliente;

-- nada nos impede de trocar a ordem das tabelas
select e.*, c.nome  from cliente c left outer join emprestimo e on e.cliente = c.numcliente;

-- temos 3 tipos de junção externa
-- à direita
-- à esquerda
-- competa (direta e esquerda)

-- fazemos a junção externa completa com full outer join
select e.*, c.nome  from emprestimo e full outer join cliente c on e.cliente = c.numcliente;

/* vamos contar o número de emprestimo de cada cliente. Vamos exibir o nome do cliente
 * e o numero de emprestimos que ele fez*/
select c.nome, count(e.*) from cliente c join emprestimo e on c.numcliente = e.cliente
	group by c.nome; 

/* note que, no resultado acima, a Jessica não foi contabilizada. Por que?
 * Como usamos a junção interna, apenas as linhas de uma das tabelas que tem relação na outra foram
 * levadas em conta. Como a Jessica não tem emprestimo, ela acabou nãoaparecendo no resultado.
 * 
 * Mas e se quisermos tambem considerar os clientes sem empréstimo no resultado?
 * Nesse caso, podemos usar uma junção externa. Note que a Jessica agaora aparecerá com contagem 0*/
select c.nome, count(e.*)  from cliente c left outer join emprestimo e on c.numcliente = e.cliente
	group by c.nome order by count desc, nome asc ; 

-- contando o numero de emprestimos de cada cliente em março de 2013
select c.nome, count(e.*) from cliente c left outer join emprestimo e on c.numcliente = e.cliente
	where e.dataret between '2013-03-01' and '2013-03-31' group by c.nome order by count desc, nome asc; 

/* Funções LEAST e GREATEST 
 * 
 * A função LEAST retorna o menor valor de uma lista de elementos
 * A função GREATEST retorna o maios valor de uma lista de elementos
 * */
select least(6, 3, 2, 100, 9, 8);
select greatest('ana', 'matheus', 'davi', 'paula', 'joão' );

/* least não é o mesmo que min. Least recebe uma lista de valores e retorna o mínimo
 * deles. Com min, podemos calcular o menor valor de uma coluna de tabela.
 * */
select min(e.valor_pg) from emprestimo e;


-- exibindo os valores pagos nos empréstimos
select e.valor_pg from emprestimo e;

-- note que, no resultado acima, temos diversos valores repetidos.
-- com a cláusula distinct após o select, apenas linhas distintas são exibidas
-- isto é, linhas repetidas no resultado só aparecem uma única vez
select distinct e.valor_pg from emprestimo e;

select distinct e.tipo, e.valor_pg from emprestimo e;

-- contando a quantidade de vezes que cada valor aparece na coluna valor_pg
select e.valor_pg, count(e.*) from emprestimo e group by e.valor_pg ;

-- podemos fazer contagem distinta usando a cláusula distinct com a função count
select count(distinct e.valor_pg) from emprestimo e;


/* note que cada cliente tem um cliente indicador (o cliente que o indicou)
 */
select c.* from cliente c;

/* vamos então listar o nome de cada cliente, junto ao nome do cliente que o indicou*/
select c1.nome, c2.nome as "indicado por" from cliente c1 join cliente c2 
	on c1.numclienteindicador  = c2.numcliente;

/* Uma forma de entender o select acima é imaginar que c1 é uma variável que
 * percorrerá todas as linhas da tabela cliente. para cada valor de c1 (cada linha
 * da tabela cliente), temos a variável c2 percorrendo também as linhas da
 * tabela cliente (como um for dentro de outro for)*/

/* note que, select acima, apenas os clientes que foram indicados por alguém
 * são listados na primeira coluna. Como fazer para listar todos os clientes
 * na primeira coluna, incluindo os não indicados?
 * 
 * Através de uma junção externa!*/
select c1.nome, c2.nome as "indicado por" from cliente c1 left outer join cliente c2 
	on c1.numclienteindicador  = c2.numcliente;
-- no resultado anterior, todos os clientes são listados na primeira coluna. Note
-- que os clientes que não foram indicados apresentam valor NULL para a segunda coluna

/* esse é um bom exemplo para visualizar a diferença de resultados da junção
 * externa à direita, à esquerda e completa!
 */
-- visualizando a junção externa à direita. Agora, a segunda coluna conterá
-- todos os clientes, inclusive os que não indicaram ninguém
select c1.nome, c2.nome as "indicado por" from cliente c1 right outer join cliente c2 
	on c1.numclienteindicador  = c2.numcliente;

-- visualizando agora a junção externa completa. Todos os clientes são listados
-- em ambas as colunas
select c1.nome, c2.nome as "indicado por" from cliente c1 full outer join cliente c2 
	on c1.numclienteindicador  = c2.numcliente;


