isPalindrome :: IO()
isPalindrome =  do putStrLn "Digite uma frase: "
                   frase <- getLine
                   if reverse frase == frase
                    then putStrLn "Eh palindromo"
                       else putStrLn "Nao eh palindromo"