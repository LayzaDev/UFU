{- 
4. Implemente uma função recursiva que calcule o número de grupos distintos com k pessoas que podem ser formados a partir de um conjunto de n pessoas (ou seja, a
combinação de n pessoas em grupos de k).
Onde:
k == 1 = n
k == n = 1
1 < k < n = comb (n - 1, k - 1) + comb(n - 1, k)
-}

-- GUARDAS

comb :: Int -> Int -> Int
comb n k
    |k == 1 = n
    |k == n = 1
    |k > 1 && k < n = (comb (n - 1) (k - 1) + comb(n - 1)(k))
    |otherwise = -1

-- IF THEN ELSE

comb1 :: Int -> Int -> Int
comb1 n k = if k == 1
              then n
                else if k == n
                    then 1
                       else if k > 1 && k < n
                            then (comb1 (n - 1) (k - 1) + comb1(n - 1)(k))
                               else -1