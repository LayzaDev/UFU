palindromo :: IO()
palindromo = do putStrLn "Digite uma frase: "
                frase <- getLine
                if frase == reverse frase 
                   then putStrLn "Eh upalindromo"
                   else putStrLn "Nao eh um palindromo" 



                   