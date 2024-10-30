{-3. Defina uma função recursiva para calcular a potência de um número, considerando que
o expoente é um número natural. Utilize o método das multiplicações sucessivas.-}

potencia :: Int -> Int -> Int
potencia x n
    | n == 0 = 1
    | otherwise = n * potencia x (n - 1)