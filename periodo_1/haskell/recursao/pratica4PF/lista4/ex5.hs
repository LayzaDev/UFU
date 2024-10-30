{-
 Pesquise e implemente um metodo recursivo para  calcular  o  MDC  de tres numeros.
 Utilize a funcao mdc vista em aula. 
 Sabe-se que: mdc(a, b, c) = mdc(mdc(a, b), c)
-}

mdc :: Float ->Float->Float
mdc a b 
    | a < b = mdc b a
    | b == 0 = a
    | otherwise = mdc b (mod a b)

mdc' :: Float -> Float -> Float -> Float
mdc' a b c = (mdc a (mdc b c))
   