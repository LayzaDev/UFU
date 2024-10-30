{-
Faca o mesmo para a seguinte versao:
e_logico  :: Bool  -> Bool  -> Bool
e_logico  True   b = b
e_logico  False _ = False
-}

-- IF THEN ELSE

e_logico :: Bool  -> Bool  -> Bool
e_logico a b = if a == True
                then b
                   else False