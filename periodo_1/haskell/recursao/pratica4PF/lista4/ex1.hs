{- 
Considere o operador nand, que devolve True se ao menos um dos argumentos ́e False.
nand :: Bool  -> Bool  -> Bool
-}

-- (a)  Defina a funcao nand utilizando if then else;
nand :: Bool  -> Bool  -> Bool
nand a b = if a == True && b == True
            then False
               else True

-- (b)  Defina a funcao nand utilizando guardas;
nand1 :: Bool  -> Bool  -> Bool
nand1 a b
    |a == True && b == True = False
    |otherwise = True

-- (c)  Defina a funcao nand utilizando correspondencia de padroes
nand2 :: Bool  -> Bool  -> Bool
nand2 _ False = True
nand2 False _ = True
nand2 True True = False
