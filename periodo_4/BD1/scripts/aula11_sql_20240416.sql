
set search_path to locadora;

begin; -- 

	select * from cliente c;
	
	insert into cliente values( 30, 'Isabela', null, '(21) 555-3333' );
	insert into cliente values( 31, 'Natalie', null, '(62) 555-3333' );
	
	select * from cliente c; /* nossas alterações são visíveis apenas
	dentro da transação, até que se dê um commit ou end. Se abrirmos
	outra conexão com o banco em outra aba e dermos um select na
	tabela cliente, nao veremos os novos clientes inseridos. Conforme
	dito anteriormente, estes novos clientes ficarão visíveis apenas 
	dentro do escopo dessa transação até o commit ou end ser executado.
	 */
	
rollback; -- desfaz tudo o que a transação fez e a encerra

-- outro exemplo
begin;
	insert into filme values (16, 'The terminator', 'O exterminador do futuro', 107);

	insert into filme values (17, 'Die hard', 'Duro de Matar', 132);

	select f.* from filme f;

	commit; -- efetiva as alterações provocadas pela transação
end; -- A execução de um end equivale a um commit
	