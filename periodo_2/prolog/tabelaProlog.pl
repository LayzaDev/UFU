%12211BSI251	Layza Nauane de Paula Silva
%12211BSI249	Jaqueline Gonçalves de Souza
%12211BSI216	Elivelton da Silva Santana
%12211BSI234	Leticia Paula da Silva
%12211BSI266	Matheus Felipe Ferreira dos Santos
%12211BSI201	Vinicius Mendes Dayrell


%func(cod, nome, salario, dep)
func(001, elivelton, 2500, ana).
func(002, jaqueline, 1800, carlos).
func(003, layza, 3200, maria).
func(004, leticia, 1500, tiago).
func(005, matheus, 4200, sofia).
func(006, vinicius, 7500, eduardo).

%tabela de funcionarios(cod, nome, salario)
tabela_func(001, elivelton, 2500).
tabela_func(002, jaqueline, 1800).
tabela_func(003, layza, 3200).
tabela_func(004, leticia, 1500).
tabela_func(005, matheus, 4200).
tabela_func(006, vinicius, 7500).

%tabela de dependentes (cod, dep)
%tabela_dep(001, ana).
%tabela_dep(001, pedro).
tabela_dep(001, [ana, pedro]).
tabela_dep(002, carlos).
tabela_dep(003, maria).
tabela_dep(004, tiago).
tabela_dep(005, sofia).
tabela_dep(006, eduardo).
