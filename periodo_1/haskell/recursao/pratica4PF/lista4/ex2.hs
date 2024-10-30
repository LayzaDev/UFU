{-
Redefina a seguinte versao da funcao e_logico usando condicionais (if then else) em vez de padroes:

e_logico  :: Bool  -> Bool  -> Bool
e_logico  True  True = True
e_logico _     _     = False
-}

-- IF THEN ELSE

e_logico :: Bool  -> Bool  -> Bool
e_logico a b = if a == True && b == True
                then True
                   else False
               