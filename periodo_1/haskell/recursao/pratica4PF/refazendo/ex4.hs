notasAluno :: IO()
notasAluno = do putStrLn "Nota 1:"
                n1 <- readLn
                putStrLn "Nota 2:"
                n2 <- readLn
                putStrLn "Nota 3:"
                n3 <- readLn

                let media = (n1 + n2 + n3) / 3

                putStrLn ("Media: " ++ show(media))

                putStr "Situação: "
                
                if (media < 3)
                  then putStrLn "Reprovado"
                     else if(media >= 3 && media <= 7)
                           then putStrLn "Exame especial"
                              else putStrLn "Aprovado"
