set search_path to locadora;

select c.* from cliente c;

-- obtendo a lista de empréstimos de clientes que foram indicados por outros clientes

-- parte 1: clientes indicados por outros clientes
select c.*  from cliente c where c.numclienteindicador is not null;
-- outra forma, sem o uso do operador is not ull
select c.*  from cliente c where c.numclienteindicador > 0 or c.numclienteindicador <= 0 ;

-- parte 2: listar os numeros de clientes indicados por outros clientes
select c.numcliente  from cliente c where c.numclienteindicador is not null;

-- parte 3: listar os emprestimos
select e.* from emprestimo e where e.cliente in (3, 4, 6, 7, 8); -- LOGICAMENTE ERRADO

-- para consertar a consulta acima, substituímos as constantes pela consulta que as gerou
select e.* from emprestimo e where e.cliente in 
	(select c.numcliente from cliente c where c.numclienteindicador is not null); -- LOGICAMENTE CERTO

-- outro jeito
select e.* from emprestimo e join cliente c on e.cliente = c.numcliente 
where c.numclienteindicador is not null ; 

-- emprestimos de clientes que indicaram outros clientes
select e.* from emprestimo e 
	where e.cliente in (select c.numclienteindicador from cliente c 
						where c.numclienteindicador is not null ); -- Jeito certo

select e.* from emprestimo e join cliente c on e.cliente = c.numclienteindicador ; -- MACETADO

/* Consultas aninhadas correlacionadas
 * 
 * Uma subconsulta interna é dita ser correlacionada à externa se, para cada linha computada
 * na consulta externa, é necessário executar a consulta interna.
 * 
 * Em geral, isso ocorre se, na cláusula where da conulta interna, é usado algum valor
 * dado pelo contexto do select externo.
 *  */

select a.* from ator a;
-- exemplo: listar os atores com a quantidade de filmes que cada um estrelou

-- parte 1; saber quantos filmes um determinado ator específico estrelou, por exemplo, 
-- o Al Pacino (cod = 2)
select count(e.*) from estrela e where e.codator = 2;

-- com a consulta acima, podemos saber a quantidade de filmes (no nosso BD) que um 
-- determinado ator estrelou, desde que se saiba o seu valor de codator.

-- parte 2: listar os atores, e usar um subselect para fazer a contagem
select a.nomeartistico, (select count(e.*) from estrela e where e.codator = a.cod) from ator a;

-- o select acima possui um subselect correlacionado, pois a consulta interna usa um valor
-- que vem da consulta de fora.

-- outro jeito, usando join (ideia da PAULA, bata nela se estiver errado)
select a.nomeartistico, count(e.numfilme) 
	from ator a join estrela e on a.cod = e.codator 
	group by a.nomeartistico ;

-- exemplo: listar o nome de cada cliente, e do cliente que o indicou
-- já fizemos esse exemplo com junção da tabela cliente com ela mesma
-- agora faremos com uma subconsulta aninhada select c.nome, 
	(select c2.nome from cliente c2 where c2.numcliente = c.numclienteindicador) from cliente c;

-- exemplo: listar os clientes cuja soma dos valores pagos nos empréstimos
-- ficou abaixo da média geral (por cliente) da soma dos valores pagos nos empréstimos (considerando todos os
-- clientes)

-- parte 1: média geral da soma dos valores pagos pelos clientes 
-- (soma dos valores pagos divididos pela quantidade de clientes)
select sum(e.valor_pg)/(select count(c.*) from cliente c) from emprestimo e;

-- parte 2: listando os clientes com a soma do que cada um gastou
select c.nome, (select sum(e.valor_pg) from emprestimo e where e.cliente = c.numcliente) 
	from cliente c;

-- parte 3: filtrando agora os clientes cuja soma do que gastou ficou abaixo da media
select c.nome, (select sum(e.valor_pg) from emprestimo e where e.cliente = c.numcliente) 
	from cliente c
	where (select sum(e.valor_pg) from emprestimo e where e.cliente = c.numcliente) < 
			(select sum(e.valor_pg)/(select count(c.*) from cliente c) from emprestimo e);

-- que lindo o select acima, não?! Dá para emoldurar e pendurar na parede como uma obra de arte :D !


