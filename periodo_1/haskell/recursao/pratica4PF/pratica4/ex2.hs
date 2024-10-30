{-
Defina duas funções recursivas que calculam o quociente e o resto da divisão inteira de dois números naturais usando subtrações sucessivas. 
-}

quociente :: Int -> Int -> Int
quociente x y
    |x < y = 0
    |otherwise = 1 + quociente(x - y) y

resto :: Int -> Int -> Int
resto x y
    | x < y = x
    | otherwise = resto (x - y) y
