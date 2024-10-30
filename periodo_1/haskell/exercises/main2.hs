

main :: IO()
main = do
    putStrLn "Digite uma temperatura em Fahrenheit:"
    tempF <- getLine
    putStrLn ("Temperatura em Fahrenheit eh:"  ++ tempF)
    putStrLn ("A temperatura em Celsius eh: " ++ show(celsius (read tempF)))

celsius :: Double -> Double
celsius fahrenheit = 5/9 * (f - 32)