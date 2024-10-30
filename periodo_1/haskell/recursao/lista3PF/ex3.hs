-- 3. Redefina a seguinte versão da função eLogico usando guardas em vez de padrões:

-- eLogico (padroes)

eLogico :: Bool -> Bool -> Bool
eLogico True b = b
eLogico False _ = False

-- eLogico (guardas)

eLogico1 :: Bool -> Bool -> Bool
eLogico1 a b
    |a == True = b
    |otherwise = False