{-
Implemente uma funcao recursiva soma n ::  Int -> Int que computa a soma dos numeros de 1 a n
-}

soma :: Int -> Int
soma n
    | n == 0 = 0
    | n == 1 = 1
    | n > 1 = n + soma (n - 1)
    |otherwise = -1