-- 2. Redefina a seguinte versão da função eLogico usando guardas em vez de padrões

-- eLogico (padrões)

eLogico :: Bool -> Bool -> Bool
eLogico True True = True
eLogico _ _ = False

-- eLogico (guardas)

eLogico1 :: Bool -> Bool -> Bool
eLogico1 a b
    |a == True && b == True = True
    |otherwise = False