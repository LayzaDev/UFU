potencia :: (Int, Int) -> Int
potencia (b, e) = b * potencia (b, e - 1)