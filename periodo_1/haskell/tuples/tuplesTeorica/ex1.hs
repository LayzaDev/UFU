somaESub :: (Int, Int) -> (Int, Int)
somaESub (a,b) = (a+b, a-b); 

somaESub' :: (Int, Int) -> (Int, Int)
somaESub' (num1,num2) = (num1+num2, num1+num2);


------------------TYPE---------------------------------
type Nome = String
type Idade = Int
type Peso = Float
type Esporte = String

--type pessoa = (String, Int, Float, String)
type Pessoa = (Nome, Idade, Peso, Esporte)

----------------------------------------------------

f_joao :: Pessoa

f_joao :: (Nome, Idade, Peso, Esporte)

f_joao :: (String, Int, Float, String)

-------------CASAMENTO DE PADROES-------------------

f_joao, f_maria:: Pessoa

f_joao :: ("Joao", 20, 41.5, "Volei")
f_maria :: ("Maria", 19, 30.3, "Natacao")

---------------------------------------------------------

pessoa :: Int -> Pessoa
pessoa 12345 = f_joao
pessoa 54321 = ("Maria", 19, 30.2, "Natacao")

--------------------------------------------------------

select_nome :: Pessoa -> Nome
select_nome (n,i,p,e) = n

select_nome (_,_,_,_) = n




