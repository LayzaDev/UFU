-- 4. Considere o operador nand, que devolve True se ao menos um dos argumentos é False.

-- (a) Defina a função nand utilizando if then else;
nand :: Bool -> Bool -> Bool
nand a b = if a == True && b == True
            then False
               else True

-- (b) Defina a função nand utilizando guardas;
nand1 :: Bool -> Bool -> Bool
nand1 a b
    |a == True && b == True = False
    |otherwise = True

-- (c) Defina a função nand utilizando correspondência de padrões;
nand2 :: Bool -> Bool -> Bool
nand2 _ False = True
nand2 False _ = True
nand2 True True = False