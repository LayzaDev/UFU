comb :: Int -> Int -> Int
comb n k
    | k == 1 = n
    | k == n = 1
    | k > 1 && k < n = comb(n - 1) (k - 1) + comb(n - 1) (k)
    | otherwise = -1