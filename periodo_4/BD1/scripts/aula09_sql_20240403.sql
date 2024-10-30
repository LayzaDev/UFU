SET search_path TO locadora;

-- exemplo: Listar os clientes junto com o título do primeiro filme alugado por cada um.
select c.numcliente, c.nome, 
	( select f.titulo_pt from filme f where f.numfilme = 
		( select e.numfilme from emprestimo e where e.cliente = c.numcliente order by e.dataret limit 1 )  ) 
	from cliente c;

-- outro jeito
select c.numcliente, c.nome, 
	( select f.titulo_pt from emprestimo e join filme f on e.numfilme = f.numfilme 
		where e.cliente = c.numcliente order by e.dataret limit 1 )   
	from cliente c;

-- note que quando usamos um subselect antes da cláusula from, o resultado deve preencher
-- uma célula na tabela resultante. Assim, esse select deve retornar um resultado com
-- apenas uma linha e uma coluna.

-- outro jeito
select c.numcliente, c.nome, f.titulo_pt  from cliente c left outer join emprestimo e on e.cliente = c.numcliente 
	join filme f on f.numfilme = e.numfilme
	where e.dataret <=all (select e2.dataret from emprestimo e2 where e2.cliente = c.numcliente);

-- ou
select c.numcliente, c.nome, f.titulo_pt  from cliente c left outer join emprestimo e on e.cliente = c.numcliente 
	join filme f on f.numfilme = e.numfilme
	where e.dataret = (select min(e2.dataret) from emprestimo e2 where e2.cliente = c.numcliente);

/* Visões (VIEW) 
 * 
 * No contexto de Sql, uma visão (VIEW) é uma tabela derivada de outras tabelas.
 * Essas outras tabelas podem ser tabelas físicas da base de dados ou outras visões.
 * 
 * Visões são denominadas também como tabelas virtuais, pois não necessariamente são
 * armazenadas em forma física no banco de dados, ao contrário das tabelas da base.
 * 
 * O SGBD se compromete a manter as visões sempre atualizadas, isto é, se as tabelas
 * que deram origem à uma visão sofrerem alterações, as visões devem imediatamente
 * refletir as alterações.
 * 
 * Em geral, pode-se fazer qualquer consulta com SELECT sobre uma visão (view), como
 * em qualquer outra tabela. No entanto, operações que envolvem alteração de dados
 * como INSERT, UPDATE e DELETE geralmente não são aceitas sobre as visões.
 * 
 * Visões costumam ser utilziadas quando é preciso refrenciar, com certa frequência,
 * tabelas construídas com consultas que exigem algum nível de complexidade.
 */

-- exemplo de visão: consulta para listar empréstimos e clientes
select e.*, c.* from emprestimo e full outer join cliente c on e.cliente = c.numcliente; 

-- podemos então criar uma visão com o resultado do select acima
create or replace view emprCliente as 
	select e.*, c.* from emprestimo e full outer join cliente c on e.cliente = c.numcliente;

-- o código acima cria uma visão com o resultado do select. Essa visão tem o compromisso
-- de se manter sempre atualizada com os dados das tabelas que lhe deram origem.

-- dando um select na visão criada
select v.* from emprcliente v;

/* O SGBD se responsabiliza por manter as visões sempre atualziadas. Assim, se inserimos
 * um novo cliente na tabela Cliente, ele deverá aparecer automaticamente na nossa visão emprcliente*/

-- inserindo um novo cliente na tabela cliente
insert into Cliente values (19, 'Carol Mazillo', null, null, '(21) 555 9876', 8);

-- note que o novo cliente inserido aparece automaticamente na nossa visão
select v.* from emprcliente v;

/* Não confundir visão com SELECT INTO que gera e armazena um backup dos dados gerados*/
select e.*, c.* into tabemprcliente from emprestimo e full outer join cliente c on e.cliente = c.numcliente;
	
select * from tabemprcliente; 

-- diferentemente das visões, a tabela acima não muda se mudarmos cliente e emprestimo
insert into Cliente values (25, 'Lucas Sacci', null, null, '(21) 555 0003');

-- Lucas não aparece na tabela tabemprcliente
select * from tabemprcliente; 

-- mas aparece na nossa view emprliente
select v.* from emprcliente v;

