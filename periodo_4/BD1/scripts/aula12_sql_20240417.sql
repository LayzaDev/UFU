set search_path to locadora;

begin;

select * from filme f;

delete from filme f where f.numfilme = 16;

select count(*) from filme f;

savepoint pontosalv1; -- criando um ponto de salvamento

delete from filme f where f.numfilme = 17;

select * from filme f;

savepoint pontosalv2; -- criando outro ponto de salvamento

rollback to pontosalv1;

select * from filme f;

commit;



begin;
	LOCK TABLE Filme IN ACCESS EXCLUSIVE MODE NOWAIT; -- cria um bloqueio na tabela filme

	select * from filme;
end; -- a finalização da transação acaba com o lock

begin;
	-- 
	select c.* from cliente c where c.numcliente <= 4 for update ;
end;

/* vamos fazer um gatilho para que, quando um cliente for removido da tabela Cliente, 
 * o mesmo seja inserido em outra tabela denominada ClienteInativo: */
-- o primeiro passo é criar a tabeela ClienteInativo
create table ClienteInativo( 
	numcliente serial not null,
	nome varchar(50) not null,
	endereco varchar(255) null,
	foneres varchar(15),
	fonecel varchar(15),
	numclienteindicador int,
	dataInativacao DATE,
	constraint pk_cliente2 primary key (numcliente)
);

select * from ClienteInativo;

-- vamos criar uma função para, quando um ciente for removido, ser
-- inserido na tabela clienteInativo
create function bef_removeCliente()
	returns trigger as
$$
begin
	-- a variável OLD se refere à linha sendo removida
	insert into ClienteInativo Values(  old.numcliente,
										old.nome,
										old.endereco,
										old.foneres,
										old.fonecel,
										old.numclienteindicador,
										now() );
	return old;
end
$$
language 'plpgsql';

-- criamos agora um gatilho para monitorar o evento de deletar
-- alguma linha da tabela cliente, e, caso ocorra, chamar a nossa
-- função bef_removeCliente
create trigger meuGatilho
	before delete on Cliente
	for each row 
	execute procedure bef_removeCliente();


select * from cliente c;

-- vamos inserir um cliente para poder remover depois e testar o gatilho
insert into cliente values (5000, 'Rodrigo Santana', 'Rua Abc', '555-1111', '555-2222');

-- deletando o cliente novo
delete from cliente where numcliente = 5000;

-- note que o novo cliente agora apareceu na tabela clienteInativo
select * from clienteInativo;