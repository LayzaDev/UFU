set search_path to locadora;

-- visualizando as classificações. Temos 3 classificações
select c.* from classificacao c ;

-- visualizando os filmes. Temos 15 filmes.
select f.* from filme f;

-- listando o titulo do filme com o nome da sua classificacao
select f.titulo_pt, c.nome  from filme f, classificacao c;
/* Note que o SELECT acima gera uma tabela com 45 linhas! 
 * Isso ocorre porque quando listamos mais de uma tabela na cláusula FROM,
 * é realizado o produto cartesiano das mesmas. No caso acima, cada uma das
 * linhas da tabela filme (15 linhas) será combinada com cada um das linhas da tabela 
 * classificação (3 linhas), gerando assim 45 linhas no total.
 * 
 * Note então, que cada filme será listado 3 vezes no resultado, sendo duas delas com
 * a classificação errada! Essas linhas com combinações erradas são denominadas
 * TUPLAS FALSAS!
 * 
 * Como devemos eliminar as tuplas falsas do resultado?
 * Impondo o relacionamento: Na tabela filme, temos a chave estrangeira "classificacao"
 * que se refere a chave primária "cod" da tabela classificacao
 */
select f.titulo_pt, c.nome  from filme f, classificacao c
	where f.classificacao = c.cod;
-- sempre (ou 99.9999% das vezes) que se listar duas tabelas na cláusula FROM,
-- temos que impor o relacionamento: chave estrangeira de uma igual à chave primária da outra

/* listando os emprestimos com suas respectivas midias
 * Note que a chave primária de mídia tem 3 campos que viram chave estrangeira composta 
 * em empréstimo. Precisamos relacionar os 3 */
select e.*, m.* from emprestimo e, midia m
	where e.numfilme = m.numfilme and e.numero = m.numero and e.tipo = m.tipo ;

/* listando cada ator com cada filme que o mesmo gravou.
 * Note que esse relacionamento passa pela tabela estrela*/
select a.nomeartistico, f.titulo_pt  from ator a, filme f, estrela e
	where a.cod = e.codator and f.numfilme = e.numfilme ;

/* vamos listar emprestimos junto com os seus respectivos clientes */
select e.*, c.* from emprestimo e , cliente c 
	where e.cliente = c.numcliente ;

-- JUNÇÃO INTERNA!
-- podemos realizar a consulta acima usando o conceito de junção interna
select e.*, c.* from emprestimo e inner join cliente c on e.cliente = c.numcliente;

-- listando emprestimos cujo valor foi superior a 10 junto com os
-- respectivos clientes 
select e.*, c.* from emprestimo e inner join cliente c on e.cliente = c.numcliente
	where e.valor_pg > 10;

/* listando cada ator com cada filme que gravou, mas agora usando junção interna*/
select a.nomeartistico, f.titulo_pt 
	from ator a inner join estrela e on a.cod = e.codator 
		inner join filme f on f.numfilme = e.numfilme ;

-- quando usamos o operador JOIN, por default é feita a junção interna
-- assim, join é a mesma coisa que inner join
select e.*, c.* from emprestimo e join cliente c on e.cliente = c.numcliente;

-- JOIN e INNER JOIN são equivalentes (mesma operação).
-- Existe a operação de JUNÇÃO NATURAL, que é uma junção interna onde o próprio SGDB
-- deduz quais são as colunas no relacionamento usando a seguinte regra: todas as
-- colunas de mesmo nome em ambas as tabelas são usadas para impor o relacionamento.
-- Assim, a consulta
select e.*, m.* from emprestimo e, midia m
	where e.numfilme = m.numfilme and e.numero = m.numero and e.tipo = m.tipo ;

-- pode ser feita com natural join:
select e.*, m.* from emprestimo e natural join midia m;

-- no caso abaixo, da resultado errado, pois as colunas que fazem o papel de chave primária
-- e estrangeira não tem o mesmo nome
select e.*, c.* from emprestimo e natural join cliente c;

/* Usar o natural join não é uma boa prática. Não é recomendado, pois deixa o relacionamento
 * implícito. Se existir duas colunas que não participem do relacionamento nas tabelas sendo
 * juntadas, com ambas tendo o mesmo nome, poderá haver erro no resultado.
 */


select c.* from cliente c;

-- listando novamente clientes com emprestimos que cada um fez
select c.*, e.* from cliente c join emprestimo e on c.numcliente = e.cliente;

/* analisando o resultado acima, percebemos que há um cliente sem nenhum empréstimo
 * (o cliente 8, Jessica)
 * Como listar na junção entre as tabelas cliente e emprestimo, os clientes que não tenham
 * empréstimo junto com os que têm?
 * */
/* Resolvemos o problema cima usando o conceito de junção externa. 
 * Usamos junção extena quando temos que relacionar duas tabelas, e, além de listar as linhas
 * de ambas as tabelas que se relacionam, também precisamos listar as linhas de uma das tabelas
 * que não se relacionam com a outra. (No nosso caso, clientes que não tem emprestimo) */

-- aqui vamos fazer uma junção externa à esquerda, ou seja, quero que as linhas da tabela
-- à esquerda que não tenham relação com a outra também apareçam no resultado.
select c.*, e.* from cliente c left outer join emprestimo e on c.numcliente = e.cliente;

/* note que o cliente sem empréstimo ("jessica") agora é listada no resultado tem NULL como
 * valor para as colunas de emprestimo. Se a junção fosse à direita, seriam as linhas de
 * emprestimo que não tem relação na tabela cliente que seriam listadas (ou seja, emprestimos
 * sem cliente, que não tem no nosso banco de testes). No nosso banco, daria o mesmo resultad
 * de uma junção interna. 
 * Todavia, podemos usar ainda right outer join invertendo as posições das tabelas (dará
 * o mesmo resultado):*/

select c.*, e.* from emprestimo e right outer join cliente c on c.numcliente = e.cliente;


