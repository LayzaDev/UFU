set search_path to locadora;

/* SELECT CASE: podemos usar a cláusula SELECT CASE para impor uma espécie
 * de condicional no resultado de uma coluna de um select
 * 
 * sintaxe:
 * 
 * CASE
 * 		WHEN <condição 1> THEN <resultado 1>
 * 		WHEN <condição 2> THEN <resultado 2>
 * 		...
 * 		WHEN <condição n> THEN <resultado n>
 * 		ELSE <resultado n+1>
 * END
 */ 
-- EXEMPLO: listar nome e contato de cada cliente
-- se um cliente tiver telefone celular, exibimos o celular
--  caso contrário, se o cliente tiver telefone residencial, o exibimos
-- se o cliente não tiver nem celular nem telefone residencial,
-- exibimos o endereço
-- vamos primeiro inserir um cliente sem telefones
INSERT into cliente VALUES( 122, 'Jonas', 'Av das Americas', null, null, 2);

select c.nome, 
	case 
		when c.fonecel is not null THEN c.fonecel 
		when c.foneres is not null THEN c.foneres 
		else c.endereco 
	end as "contato"
from cliente c;

/* exemplo: exibindo o título do filme de acordo com a duração.
 * Se or maior que 145 minutos, exibimos o titulo original. Caso contrário,
 * o título em português */
select f.numfilme, f.duracao, 
	case  
		when f.duracao > 145 then f.titulo_original 
		else f.titulo_pt 
	end
from filme f;

-- ou
select f.numfilme, f.duracao, 
	case  
		when f.duracao > 145 then f.titulo_original 
		when f.duracao <= 145 then f.titulo_pt  
	end
from filme f;

-- os dois comandos acima não são exatamente equivalentes. Se a duração for NULL,
-- o primeiro exibe o título em portguês (pois cairá no ELSE), 
-- enquanto o segundo deixará a "célula em branco (não cairá em nenhuma das
-- condições)

-- exemplo: colocando uma multa de 20% para os emprestimos cuja data de devolução
-- está 3 dias ou mais além da data de retirada
select e.*, 
	case 
		when e.datadev - e.dataret >= 3 then e.valor_pg * 0.2
		else 0
	end as "multa"
from emprestimo e;

/* ROW_NUMBER 
 * 
 * No postgresql, podemos usar a função row_number para gerar uma coluna que
 * atribuirá um número intero sequencial para cada linha do resultado de um
 * select.
 * 
 * Para usar row_number, podemos especificar uma ordem para a numeração,
 * que pode ser a do próprio resultado daconsulta, ou uma ordenação específica
 * */
-- numerando as linhas segundo a ordem dada padrão
select c.numcliente, c.nome, c.endereco, row_number() over() 
from cliente c;

-- observe que o número da linha não muda se usarmos a cláusula ORDER BY
select c.numcliente, c.nome, c.endereco, row_number() over() 
from cliente c order by c.nome;

/* como uma função aplicada na "janela de resultados" (window function),
 * row_number é calculada após a aplicação da cláusulas JOIN, WHERE
 * GROUP BY e HAVING e antes da aplicação de ORDER BY */

select c.numcliente, c.nome, c.endereco, row_number() over(order by c.nome) 
from cliente c;

select c.numcliente, c.nome, c.endereco, row_number() over(order by c.nome) 
from cliente c order by c.numcliente desc;

-- listando agora os cientes que mais gastaram na locadora
select c.nome, sum(e.valor_pg) from emprestimo e right outer join cliente c 
	on e.cliente = c.numcliente 
	group by c.numcliente ;

-- os clientes sem empréstimo aparecerão com NULL para a soma do valor pago
-- seria interessante mostrá-los com o valor 0 como fazer?
-- podemos usar a função coalesce que recebe uma lista de arumentos e retorna
-- o primeiro argumento não nulo
select c.nome, COALESCE(sum(e.valor_pg), 0) as total_pago 
	from emprestimo e right outer join cliente c 
	on e.cliente = c.numcliente 
	group by c.numcliente ;

-- podemos então gerar nosso ranking
select c.nome, COALESCE(sum(e.valor_pg), 0) as total_pago ,
	row_number() over( order by COALESCE(sum(e.valor_pg), 0) desc )
	from emprestimo e right outer join cliente c 
	on e.cliente = c.numcliente 
	group by c.numcliente ;
