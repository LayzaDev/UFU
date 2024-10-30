-- Correção

{- produto :: IO()
produto = do putStrLn "Digite 3 numeros: "
             num1 <- getLine
             num2 <- getLine
             num3 <- getLine
             putStrLn ("O produto eh: " ++
                (show(read num1 * read num2 * read num3)))

-}

produto :: IO()
produto = do 
   putStrLn "Digite 3 numeros: "
   num1 <- readLn
   num2 <- readLn
   num3 <- readLn
   putStrLn ("O produto eh: " ++
      (show(multiplica num1 num2 num3)))

multiplica :: Float -> Float -> Float -> Float
multiplica a b c = a*b*c
