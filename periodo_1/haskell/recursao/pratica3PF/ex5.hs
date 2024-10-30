classeEleitoral idade
    | idade < 16 = "não eleitor"
    | idade >= 18 && idade < 65 = "eleitor obrigatório"
    | otherwise = "eleitor facultativo"

ehEleitor = do putStrLn "Classe eleitoral"
               putStrLn "-------------------------------------------"
               putStr "Digite a idade da pessoa: "
               idade <- readLn
               putStrLn (classeEleitoral idade)
