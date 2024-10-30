-- muda o esquema corrente para o locadora
set search_path to locadora;

-- exibindo o conteúdo da tabela ator
select a.* from ator a;

-- podemos usar a cláusula WHERE para especificar uma condição de seleção
select  a.* from ator a where a.nacionalidade = 'Canadá';

-- exibindo atores americanos ou canadenses
select  a.* from ator a where a.nacionalidade = 'Canadá' or a.nacionalidade = 'USA';

-- OPERADOR IN
-- podemos reescrever a consulta acima usando o operador IN
select a.* from ator a where a.nacionalidade in ('Canadá', 'USA');

-- exibindo agora os atores que não são nem canadenses nem americanos
select a.* from ator a where NOT( a.nacionalidade in ('Canadá', 'USA') );

-- podemos usar também o operdor NOT IN
select a.* from ator a where a.nacionalidade not in ('Canadá', 'USA');

-- obtendo atores americanos cujo nome artístico tenha mais de 10 caracteres
-- o operador LENGTH retorna o comprimento de uma string
select a.* from ator a where a.nacionalidade = 'USA' and length(a.nomeartistico) > 10;

-- exibindo o comprimento do nome artístico no resultado
select a.*, length(a.nomeartistico) as "tamanho do nome" from ator a;

-- podemos fazer casting para converter dados de um tipo para outro tipo
-- a coluna cod é int. Mas podemos exibi-la como varchar de 30 posições
select a.cod::varchar(30) from ator a;

-- podemos ordenar os resultados com cláusula ORDER BY  (ASC|DESC)
-- lista os atores ordenando por data de nascimento
select a.* from ator a order by a.datanasc ;

-- a cláusula asc especifica ordenação ascendente (do menor para o maior)
-- note que, por default, a ordenação ascendente é assumida
select a.* from ator a order by a.datanasc asc;

-- lista os atores ordenando por data de nascimento descendente
select a.* from ator a order by a.datanasc desc;

-- também se pode fazer a ordenação pelo número da coluna no resultado
-- ordena pela quarta coluna do resultado (nomereal)
select a.* from ator a order by 4;

-- agora, a quarta coluna é datanasc
select a.nomereal, a.cod, a.nacionalidade, a.datanasc  from ator a order by 4;

-- podemos especificar mais de uma coluna na ordenação
-- especificamos datanasc ascendente como ordenação. Mas se duas linhas tiverem a mesma
-- datanasc, usamos nomereal (descendente) para desempatar a ordenação
select a.* from ator a,  order by a.datanasc asc, a.nomereal desc;

/* casamento de padrões com a cláusula LIKE
 * A cláusula LIKE permite casar padrões em uma string. São usados dois caracteres reservados
 * %: casa com qualquer sequência de 0 ou mais caracteres
 * _: casa com um único caracterer
*/
-- obtendo atores cujo nome comece com a letra A
select a.* from ator a where a.nomereal like 'A%';

-- obtendo atores cujo nome comece com a letra A e termine com a letra d
select a.* from ator a where a.nomereal like 'A%d';

-- obtendo atores cujo nome comece com a letra A e algum nome contenha a letra l
select a.* from ator a where a.nomereal like 'A%l%';

-- podemos usar a cláusula like em conjunto com operadores lógicos (ideia da PAULA)
-- -- obtendo atores cujo nome comece com a letra A e algum nome contenha a letra l e contenha um 'o'
select a.* from ator a where a.nomereal like 'A%l%' and a.nomereal like '%o%';

-- obtendo atores que nasceram em paises cujo nome começa com U e tem 3 caracteres
select a.* from ator a where a.nacionalidade like 'U__';

-- obtendo atores cujo primeiro nome tenha 4 caracteres
select a.* from ator a where a.nomereal like '____ %';

/* obtendo atores cujo nome comece com a letra A e algum nome contenha a letra m
 * e haja ao menos um caractere entre A e m
*/
select a.* from ator a where a.nomereal like 'A_%m%';

select a.* from ator a where a.datanasc = '1984-11-22';

-- obtendo a lista de atores que nasceu em algum dia 22 de algum mês de algum ano
select a.* from ator a where a.datanasc::varchar(15) like '%22';

-- obtendo a lista de atores cujo código esteja entre 10 e 15
select a.* from ator a where a.cod >= 10 and a.cod <= 15;

-- podemos usar o operador between para fazer uma consulta como acima
-- por exemplo, obtendo os atores de código entre 20 e 30
select a.* from ator a where a.cod between 20 and 30;

select a.* from ator a where a.nomereal between 'C' and 'M';

select a.* from ator a where a.nomereal between 'C' and 'M' order by a.nomeartistico ;

-- podemos usar a clausula LIMIT para estabelecer um limite para o número de linhas no resultado
-- obtendo os 10 atores mais velhos da tabela
select a.* from ator a order by a.datanasc limit 10;

-- limit pode receber um segundo argumento que especifica a posição inicial
-- podemos especificar por meio de um offset
-- exibindo os 10 resultados a partir da posição 5 da ordenação
select a.* from ator a order by a.datanasc limit 10 offset 5;
