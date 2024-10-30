celsius :: Double -> Double
celsius fahrenheit = (5/9 * (fahrenheit - 32))

main :: IO()
main = do putStrLn "Digite uma temperatura em Fahrenheit: "
          temp <- getLine
          putStrLn ("Temperatura em Fahrenheit: " ++ temp)
          putStrLn ("Temperatura em Celsius: " ++ show(celsius(read temp)))
