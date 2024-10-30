-- 1. Implemente uma função imprimeNVezes::Int->IO() que recebe um inteiro n e imprime a String “Frase” n vezes, usando recursão.

-- IF THEN ELSE

imprimeNVezes::Int->IO()
imprimeNVezes n = if n == 0 
                    then putStr ""
                       else if n > 0
                            then do putStrLn "Frase"
                                    imprimeNVezes (n-1)
                                else putStrLn "invalido"
                                
-- GUARDAS

imprimeNVezes1 :: Int -> IO()
imprimeNVezes1 n
    |n == 0 = putStrLn ""
    |n > 0 = do putStrLn "Frase"
                imprimeNVezes1 (n - 1)
    |otherwise = putStrLn "Invalido"

-- ImprimeNVezes 10
-- "Frase" (imprimeNVezes 9)
-- "Frase" ("frase" imprimeNVezes 8)
-- "Frase" "Frase" "Frase" (imprimeNVezes 7)
-- "Frase" ... imprimeNVezes 0
-- "Frase" "Frase" ... ""