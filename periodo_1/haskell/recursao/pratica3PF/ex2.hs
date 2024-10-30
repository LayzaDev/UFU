produto :: Int -> Int -> Int -> Int
produto a b c = a * b * c

calcProd :: IO()
calcProd = do putStrLn "Digite um numero: "
              n1 <- readLn
              putStrLn "Digite outro numero: "
              n2 <- readLn
              putStrLn "Digite outro numero: "
              n3 <- readLn
              putStrLn ("Resultado: " ++ show(produto( read n1, read n2, read n3)))

