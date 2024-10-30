{-
 Implemente o calculo do mınimo multiplo comum (MMC) de dois numeros:
 Main > mmc (2, 3) 6
 Utilize, para isso, a funcao mdc vista em aula. 
 Sabe-se que: mmc(a, b) = a · b mdc(a, b)
-}

mdc :: Float -> Float -> Float
mdc x y
    | x == y = x
    | x > y = mdc(x - y) y
    | x < y = mdc(y - x) x
    |otherwise = -1

mmc :: Float -> Float -> Float
mmc x y = (x * y) / (mdc x y)