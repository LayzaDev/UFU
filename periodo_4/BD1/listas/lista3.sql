-- Layza Nauane de Paula Silva - 12211BSI251

select f.* from filme f;
select c.* from classificacao c;
select e.* from emprestimo e;
select a.* from ator a;
select c.* from cliente c;

-- 1 – Obter a lista de filmes com suas respectivas classificações.
select f.numfilme, f.titulo_pt, c.nome as classificacao 
from filme f
join classificacao c on f.classificacao = c.cod;

-- 2 – Obter o número de filmes em cada classificação.
select c.nome as classificacao, count(f.*) as numerodefilmes
from filme f
left outer join classificacao c on c.cod = f.classificacao
group by c.nome;

-- 3 – Obter a lista de empréstimos junto com o nome de cada filme alugado em cada empréstimo.
select e.*, f.numfilme, f.titulo_pt as filme
from emprestimo e
join filme f on e.numfilme = f.numfilme;

-- 4 – Obter a lista de atores com o nome de cada diretor com o qual cada ator trabalhou.
select a.cod, a.nomereal as ator, a.nomeartistico, f.direcao as diretor
from ator a
join estrela e on a.cod = e.codator
join filme f on e.numfilme = f.numfilme;

-- 5 – Para cada cliente, obter a média dos valores pagos em seus empréstimos
select c.numcliente, c.nome as Cliente, avg(e.valor_pg) as MediaValoresPagos
from cliente c
left outer join emprestimo e on c.numcliente = e.cliente
group by c.numcliente, c.nome;

-- 6 – Obter uma listagem com nomes de TODOS os clientes e os títulos em português dos filmes alugados por cada um
select c.nome, f.titulo_pt
from cliente c
left outer join emprestimo e on c.numcliente = e.cliente
left outer join midia m on e.numfilme = m.numfilme and e.numero = m.numero and e.tipo = m.tipo
left outer join filme f on m.numfilme = f.numfilme;

/* 7 –  Obter uma lista com nomes de clientes e os nomes artísticos dos atores norte-americanos (USA, Canadá ou Mexico)
vistos por cada cliente em algum dos filmes que o mesmo alugou*/

select distinct c.nome, a.nomeartistico
from cliente c
join emprestimo e on c.numcliente = e.cliente 
join midia m on e.numfilme = m.numfilme and e.numero = m.numero and e.tipo = m.tipo
join filme f on m.numfilme = f.numfilme
join estrela es on f.numfilme = es.numfilme
join ator a on  es.codator = a.cod
where a.nacionalidade IN ('USA', 'Canadá', 'Mexico');

/* 8 – Obter a quantidade de clientes que cada cliente indicou. A listagem deve incluir todos os clientes,
   inclusive aqueles que não indicaram ninguém (com contagem 0 nesse caso). */
SELECT c.numCliente, c.nome,
       (SELECT COUNT(*) FROM Cliente c2 WHERE c.numCliente = c2.numClienteIndicador) AS qtdClientesIndicados
FROM Cliente c;

-- 9 – Obter a lista com todas as duplas de atores que já trabalharam juntos em algum filme.
select distinct a1.nomeartistico as ator1, a2.nomeartistico as ator2
from estrela e1
join estrela e2 on e1.numfilme = e2.numfilme and e1.codator < e2.codator
join ator a1 on a1.cod = e1.codator
join ator a2 on a2.cod = e2.codator;

-- 10 – Obter a lista com todas as duplas de atores que já trabalharam juntos em algum filme junto com os nomes dos filmes em que trabalharam juntos.
select distinct a1.nomeartistico as ator1, a2.nomeartistico as ator2, f.titulo_pt as filme
from estrela e1
join estrela e2 on e1.numfilme = e2.numfilme and e1.codator < e2.codator
join filme f on e1.numfilme = f.numfilme
join ator a1 on a1.cod = e1.codator
join ator a2 on a2.cod = e2.codator;




