{- 
O fatorial duplo de um número natural n é o produto de todos os números de 1 (ou 2)
até n, contados de 2 em 2. Por exemplo, o fatorial duplo de 8 é 8 × 6 × 4 × 2 = 384, e
o fatorial duplo de 7 é 7 × 5 × 3 × 1 = 105. Defina uma função para calcular o fatorial
duplo usando recursividade.
-}

fatorialDuplo :: Int -> Int
fatorialDuplo n
    |n == 0 = 1
    |n == 1 = 1
    |n > 1 = n * fatorialDuplo (n - 2)
    |otherwise = -1