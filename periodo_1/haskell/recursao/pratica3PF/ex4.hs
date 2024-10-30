notaAluno :: IO()
notaAluno = do putStrLn "Nota 1"
               nota1 <- readLn
               putStrLn "Nota 2"
               nota2 <- readLn 
               putStrLn "Nota 3"
               nota3 <- readLn

               let media = (nota1 + nota2 + nota3) / 3

               putStrLn ("Media: " ++ show(media))
               
               putStrLn "Situacao: "

               if(media < 3)
                then putStrLn "Reprovado"
                    else if (media <= 7)
                        then putStrLn "Exame especial"
                            else putStrLn "Aprovado"
