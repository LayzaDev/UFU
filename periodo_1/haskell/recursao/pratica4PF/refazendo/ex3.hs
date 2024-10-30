celsius :: Double -> Double
celsius f = 1.8 * (f - 32)

main :: IO()
main = do putStrLn "Digite uma temperatura em Fahrenheit:"
          temp <- readLn
          putStrLn ("Temperatura em Fahrenheit:" ++ temp)
          putStrLn ("Temperatura em Celsius:" ++ show(celsius(read temp)))