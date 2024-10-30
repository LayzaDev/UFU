----------------- pair numbers ------------------

pair' :: Int -> Bool
pair' x = if mod x 2 == 0 then True else False

------------------ odd numbers ------------------

odd' :: Int -> Bool
odd' x = if mod x 2 /= 0 then False else True

--------------- smallest number ----------------

smaller :: Int -> Int -> Int
smaller n1 n2 = if n1 < n2 then n1 else n2

----------- ordered pair (if then else) --------------

orderedPair :: Int -> Int -> (Int, Int)
orderedPair x y = if x < y then (x, y) else (y, x)

-----------  ----------------
maior :: Float -> Float -> String
maior a b = let somaQuadrados = ((a * a) + (b * b))
                quadradoDaSoma = ((a + b) * (a + b))
                in if somaQuadrados > quadradoDaSoma 
                    then "O maior eh a Soma dos Quadrados"
                      else "O maior eh o Quadrado da Soma"

----------Valor absoluto ------------------

valorAbsoluto :: Int -> Int 
valorAbsoluto n = if n >= 0 then n else -n

--------Aninhamento ----------------------

sinal :: Int -> Int
sinal n = if n < 0
            then -1
              else if n == 0
                then 0
                  else 1

----------------- classify triangle ----------------

classifyTriangle :: Int -> Int -> Int -> String
classifyTriangle a b c 
    | possible = if (a == b && b == c)
                   then "equilateral"
                      else if (a /= b && b /= c)
                        then "scalene"
                           else "isosceles"
    | otherwise = "it's not triangle"
    where
      possible = a > 0 && b > 0 && c > 0 && a < b+c && b < a + c && c < a + b

-------------- Roots bhaskara (if let) ------------------
    
numRaizes' :: Float -> Float -> Float -> String
numRaizes' a b c = let delta = b*b - 4*a*c
                    in if delta > 0 
                        then "Two roots" 
                           else if delta == 0 
                              then "A root"
                                 else "zero roots"

------------------- define mes -----------------

mes' :: Int -> String
mes' x = 
        case x of
            1 -> "January"
            2 -> "February"
            3 -> "March"
            4 -> "April"
            5 -> "May"
            6 -> "June"
            7 -> "July"
            8 -> "August"
            9 -> "September"
            10 -> "Octuber"
            11 -> "November"
            12 -> "December"
            _ -> "Error!" 