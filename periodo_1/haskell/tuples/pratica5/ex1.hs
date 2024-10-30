--------------- Questão 1 ---------------------

{-import Data.Char

converte :: (Char, Char, Int) 
converte carac = (carac, toUpper carac, ord carac)-}

--------------- Questão 2 ---------------------

{-

delta = b**2 - 4.a.c

x = -b +- sqrt(delta) / 2.a

-}

raizes :: (Float,Float,Float) -> (Float,Float)
raizes (a,b,c)
    | delta < 0 = error("não ha raizes reais")
    | otherwise = (xa,xb)
    where delta = b**2 - 4*a*c
          xa = ((-b + sqrt(delta)) / 2 * a)
          xb = ((-b - sqrt(delta)) / 2 * a)









