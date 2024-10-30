-- seta o esquema corrente como o locadora
set search_path to locadora;

-- a função now retorna data e hora corrente
select now();

select a.* from ator a;

-- calculando a idade de cada ator com a função age
select a.nomereal, age( now(), a.datanasc ) from ator a;

-- mostrando a idades em anos
select a.nomereal, date_part( 'year', age(now(), a.datanasc) ) as "Idade" from ator a;

-- atores com menos de 40 anos
select a.nomereal, date_part( 'year', age(now(), a.datanasc) ) as "idade" from ator a
	where date_part( 'year', age(now(), a.datanasc) ) < 40;

select e.* from emprestimo e;

select e.datadev - e.dataret from emprestimo e;

-- se o select opera sobre tabelas, e se o select retorna tabelas,
-- podemos dar um select na saída de outro select.
select * from (select a.nomereal, date_part( 'year', age(now(), a.datanasc) ) 
				as "idade" from ator a) ai         -- renomeamos a tabela do select interno como "ai"
				where ai.idade < 40;

/* Operações com conjuntos
 * 
 * Podemos fazer operações com conjuntos sobre os resultados de dois ou mais SELECTs. Nesse caso,
 * o resultado de cada SELECT e interpretado como um conjunto de linhas. Lembre-se de que nos 
 * conjuntos matemáticos, não há a ideia de repetição de elementos. O que significa que linhas
 * duplicadas serão retiradas do resultado.
 * 
 * As operações de conjunto são:
 * 
 * UNION: união
 * INTERSECT: interseção
 * EXCEPT: diferença
 * */
			
-- obtendo os endereços dos clientes
select c.endereco from cliente c;

-- obtendo os titulos dos filmes
select f.titulo_pt from filme f;

-- podemos gerar uma tabela com a união dos selects acima, isto é,
-- uma tabela com endereços de clientes e títulos de filme
select c.endereco from cliente c
union 
select f.titulo_pt from filme f;			

-- note que a união dos resultados ocorre na vertical, e só é possível se as tabelas
-- retornadas pelos selects forem compatíveis, isto é, se tiverem o mesmo número de colunas
-- (no nosso caso, cada select retornava uma coluna só) e as colunas devem ter os mesmos tipos

-- obtendo os atores que não são americanos
select a.* from ator a
except
select a.* from ator a where a.nacionalidade = 'USA';

-- outra forma
select a.* from ator a where a.nacionalidade != 'USA';

-- podemos impor uma ordenação para o resultado
select a.* from ator a
except
select a.* from ator a where a.nacionalidade = 'USA'
order by nacionalidade, nomeartistico ;

/* Funções de agregração:
 * 
 * Resumem informação de várias linhas em uma linha só. 
 * As funções de agregação mais comuns são
 * 
 * COUNT: contagem de linhas não nulas (não vazias).
 * SUM: soma de valores numéricos em uma coluna
 * MIN: menor valor de uma coluna
 * MAX: maior valor de uma coluna
 * AVG: a média dos valores de uma coluna
 * */

-- obtendo a data de nascimento mais recente da tabela ator
select max(a.datanasc)  from ator a;

-- outra forma
select a.datanasc from ator a order by a.datanasc desc limit 1;

-- podemos usar mais de uma função de agregação na mesma consulta
select  min(a.datanasc),  max(a.datanasc)  from ator a;

-- contando o numero de linhas (não-nulas) da tabela cliente
select COUNT(c.*) from cliente c;

-- note que se contarmos apenas o numero de linhas da coluna fonecel, o resultado terá uma unidade
-- a menos, pois um dos clientes não tem esse atributo preenchido
select COUNT(c.fonecel)  from cliente c;

-- contando quantas linhas de cliente tem numclienteindiador preenchido
select COUNT( c.numclienteindicador)  from cliente c;

-- contando o numero de atores americanos
select COUNT(a.*) from ator a where a.nacionalidade = 'USA';

-- calculando a média dos emprestimos pagos
select AVG( e.valor_pg  ) from emprestimo e;

-- outro jeito: somando a coluna e dividindo pelo numero de registros
select SUM( e.valor_pg )/COUNT( e.valor_pg ) from emprestimo e;

-- contando o numero de emprestimos pelo tipo
select 'VHS', count(e.*) from emprestimo e where e.tipo = 'VHS'
union
select 'DVD', count(e.*) from emprestimo e where e.tipo = 'DVD'
union 
select 'Blu-ray', count(e.*) from emprestimo e where e.tipo = 'Blu-ray';

