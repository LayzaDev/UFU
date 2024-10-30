/* isto é um comentário de bloco 
 * em sql */

-- Isso é um comentário de linha!
set search_path to locadora;

-- A cláusula SELECT exibe resultados
-- O SELECT retorna uma tabela com resultados
select 7*8;

/* Podemos usar a cláusula SELECT para acessar (consultar) os dados
 * de uma tabela. Em outras palavras, o SELECT opera sobre tabelas!
 * 
 * Primeira forma:
 * 
 * SELECT <lista de atributos> FROM <lista de tabelas> ;
 * 
 * */
select nomereal, nomeartistico from ator;

-- podemos especificar de qual tabela vem as colunas desejadas
select ator.nomereal, ator.nomeartistico from ator;

-- podemos especificar um alias ("apelido") para as tabelas
select a.nomereal, a.nomeartistico from ator a;

-- renomeando a primeira coluna para "nome verdadeiro"
select a.nomereal as "nome verdadeiro", a.nomeartistico from ator a;

-- obtendo todas as colunas da tabela ator
select a.* from ator a;

-- podemos construir um select com um filtro de seleção. Para isso, usamos WHERE
select a.* from ator a where a.cod = 1;

-- obtendo os atores americanos
select a.* from ator a where a.nacionalidade = 'USA';

