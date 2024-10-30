-- Layza Nauane de Paula Silva - 12211BSI251

set search_path to locadora;

-- 1 - Obter a lista de clientes cujo telefone seja do Rio de Janeiro (isto é, com o código de área 21)
select c.* from cliente c where c.foneres like '(%21%)%';

-- 2 - Obter os empréstimos feitos no primeiro semestre de 2013, exibidos do mais recente para o mais antigo.
select e.* from emprestimo e where e.dataret between '2013-01-01' and '2013-06-30' order by e.dataret desc;

-- 3 - Listar clientes cujo nome (incluindo espaços) tenha mais de 15 caracteres.
select c.* from cliente c where length(c.nome) > 15;

-- 4 - Listar todos os nomes de pessoas no banco de dados incluindo atores, diretores de filmes e clientes.
select a.nomereal as "Nomes" from ator a
union
select c.nome from cliente c
union 
select f.direcao from filme f;

-- 5 - Listar empréstimos cuja data de devolução está, pelo menos, 7 dias posterior em relação à data de retirada.
select e.* from emprestimo e where e.datadev - e.dataret >= 7;
 
-- 6 - Obter uma listagem com filmes de aventura ou drama com duração superior a duas horas 
-- (note que filmes podem ter mais de uma classificação).
select f.* from filme f where f.duracao > 120 and f.categoria like '%Drama%' or f.categoria like '%Aventura%';

-- 7 - Listar os 5 filmes mais antigos do acervo.
select f.* from filme f order by f.data_lancamento asc limit 5;

-- 8 - Obter o menor valor pago por um empréstimo
select e.valor_pg from emprestimo e order by e.valor_pg desc limit 1;

-- 9 - Obter o número de empréstimos realizados no ano de 2013.
select count(e.*) from emprestimo e where e.dataret >= '2013-01-01' and e.dataret <= '2013-12-31';

-- 10 - Obter a média da diferença entre data de retorno e data de devolução dos empréstimos.
select avg(e.dataret - e.datadev) as media from emprestimo e;









