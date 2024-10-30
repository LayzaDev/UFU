set search_path to locadora;

/* Consultas aninhadas
 * 
 * Conforme discutimos anteriormente, pode-se aplicar um SELECT sobre o resultado de outro SELECT.
 * 
 * Quando temos um SELECT dentro do contexto de outro, dizemos que temos uma subconsulta, ou
 * uma consulta aninhada!
 * 
 *  */

-- na úlitima aula, contamos o número de empréstimos de cada cliente.
select c.nome, count(e.*) from cliente c left outer join emprestimo e 
	on c.numcliente = e.cliente group by c.nome;

-- contando o número de emprestimos de cada cliente em março de 2013
select c.nome, count(e.*) from cliente c left outer join emprestimo e 
	on c.numcliente = e.cliente 
	where e.dataret between '2013-03-01' and '2013-03-31' group by c.nome ;

-- note que, a cláusula where, que é aplicada após a operação de junção externa
-- filtrou as linhas dos clientes que não tinham empréstimo no período referido
-- como fazer para listar os clientes que não tiveram empréstimo?

-- podemos então primeiro fazer uma consulta para obter apenas os empréstimos do
-- período desejado e, depois, fazer a junção externa com a tabela cliente para
-- que todos os clientes sejam contabilizados no resultado.
select c.nome, count(e2.*) from cliente c left outer join
(select e.* from emprestimo e where e.dataret between '2013-03-01' and '2013-03-31') e2
on c.numcliente = e2.cliente group by c.nome;

-- descobrindo o maior valor de empréstimo pago por cada cliente
select e.cliente, max(e.valor_pg) from emprestimo e group by e.cliente;

-- o select acima nos dá o número do cliente e o maior valor pago em emprestimo
-- mas como exibir o nome do cliente em vez do número?
-- podemos fazer junção externa entre o resultado acima e cliente.
select c.nome, em.max from cliente c left outer join 
	(select e.cliente, max(e.valor_pg) from emprestimo e group by e.cliente) em
	on c.numcliente = em.cliente;

/* para algumas pessoas, pode ser mais amigável reescrever a consulta acima movendo
  o select interno para um resultado temporário. Para isso, usamos a cláusua WITH
  forma geral:
  WITH nome_tabela_temporaria( coluna1, coluna2, ..., coluna n ) as 
    ( CONSULTA_QUE_GERA_A_TABELATEMPORÁRIA )
    SUA consulta que usa a tabela temporária.
    
    No nosso caso ficará:
   */
with em as -- geramos a tabela temporária "em" como resultado do select que vem entre parenteses a seguir
	(select e.cliente, max(e.valor_pg) from emprestimo e group by e.cliente) -- aqui termina a geração da tabela temporária
select c.nome, em.max from cliente c left outer join em on c.numcliente = em.cliente; -- aqui usamos a tabela temporária
	
-- a tabela "em" foi gerada como resultado temporário da consulta acima, e só existe no escopo
-- daquela consulta.
select * from em; -- ERRO: não existe a tabela "em" fora do escopo da consulta acima.

-- obtendo os empréstimos cujo valor pago ficou abaixo da média

-- podemos dividir o desafio em passos
-- passo 1: obter a média dos valores pagos
select avg(e.valor_pg) from emprestimo e;   -- obtivemos como média: 3197.25

-- passo 2: obter os empréstimos cujo valor ficou abaixo disso
select e.* from emprestimo e where e.valor_pg < 3197.25; -- LOGICAMENTE ERRADO!

/* Embora a consulta acima apresente o resultado correta para a atual configuração
 * dos dados, dizemos que ela está LOGICAMENTE ERRADA, pois ela só funciona para 
 * a configuração atual. Qualquer alteração nos dados pode fazer com que a consulta
 * acima passe a dar resultados errados, por isso dizemos que ela está LOGICAMENTE
 * errada! 
 * */

/* Como consertar a consulta acima para que fique LOGICAMENTE CORRETA?
 * O problema é o valor da média como constante. Podemos então substituir
 * o valor da constante pelo comando que a origina.*/
select e.* from emprestimo e 
	where e.valor_pg < (select avg(e.valor_pg) from emprestimo e); -- LOGICAMENTE CORRETO!

-- a consulta acima só funcionou porque o select interno retorna uma tabela com APENAS
-- uma linha e uma coluna. Se retornasse mais de uma linha ou coluna, não faria sentido a comparação

-- outra forma de fazer
with mediaEmprestimo as (select avg(e.valor_pg) from emprestimo e)
select e2.* from emprestimo e2, mediaEmprestimo where e2.valor_pg < mediaEmprestimo.avg; -- LOGICAMENTE CORRETO


/* Obtendo os filmes estrelados por atores britânicos */
-- passo 1 - obter os atores britânicos
select a.*  from ator a where a.nacionalidade = 'UK'; -- obtemos os atores de cod: 10, 11, 12, 22, 25, 32, 33

-- passo 2 - obter os filmes estrelados por atores britanicos
select distinct f.* from filme f join estrela e on e.numfilme = f.numfilme 
	where e.codator in (10, 11, 12, 22, 25, 32, 33); -- LOGICAMENTE ERRADO, pois usamos os códigos de atores como constante

-- podemos consertar a consulta acima usando um subselect que retorne o código dos atores
-- britânicos para serem usados com o operador IN.
select distinct f.* from filme f join estrela e on e.numfilme = f.numfilme 
	where e.codator in (select a.cod from ator a where a.nacionalidade = 'UK');	--LOGICAMENTE CORRETA

-- outra forma usando apenas junções
select distinct f.* from filme f join estrela e on e.numfilme = f.numfilme 
	join ator a on a.cod = e.codator where a.nacionalidade = 'UK'; --LOGICAMENTE CORRETA

/* Obtendo agora os empréstimos de filmes estrelados por britânicos */
select e2.* from emprestimo e2
	where e2.numfilme in ( select distinct f.numfilme  from filme f join estrela e on e.numfilme = f.numfilme 
	where e.codator in (select a.cod from ator a where a.nacionalidade = 'UK'));

-- ou 
select e2.* from emprestimo e2
	where e2.numfilme in (select distinct f.numfilme from filme f join estrela e on e.numfilme = f.numfilme 
	join ator a on a.cod = e.codator where a.nacionalidade = 'UK');

-- exercício: conseguir o resultado acima usando apenas junções (sem subselect)
	