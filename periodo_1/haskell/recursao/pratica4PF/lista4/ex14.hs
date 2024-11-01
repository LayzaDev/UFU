ackerman :: Int -> Int -> Int
ackerman m n
    | m == 0 = n + 1
    | m > 0 && n == 0 = ackerman(m-1) (1)
    | m > 0 && n > 0 = ackerman(m-1) (ackerman(m) (n-1))
    | otherwise = -1