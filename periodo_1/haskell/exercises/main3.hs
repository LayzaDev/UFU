calculo :: IO()
calculo = do
    putStrLn "Digite o valor das 3 notas:"
    nota1 <- getLine
    nota2 <- getLine
    nota3 <- getLine

    if(media < 3) 
      then "Reprovado"
        else if (media >= 3 && media <= 7)
           then "Exame especial"
              else "Aprovado"



media :: Float -> Float -> Float -> Float
media nota1 nota2 nota3 = ((nota1 + nota2 + nota3) / 3)

---------------------------------------------------------
{-nota = do putStrLn "Digite 3 notas do aluno"
          nota1 <- getLine
          nota2 <- getLine
          nota3 <- getLine
          putStrLn "A media do aluno eh"
          putStr (read nota1 + read nota2 + read nota3) / 3
-}

nota = do 
    putStrLn "Digite 3 notas do aluno"
    nota1 <- getLine
    nota2 <- getLine
    nota3 <- getLine
    let media = (read nota1 + read nota2 + read nota3) / 3
    putStrLn ("A media do aluno eh: " ++ show media)
    putStrLn ("A situacao do aluno eh: " ++ situacao media)

situacao :: Float -> String
situacao media
    | media < 3 = "Reprovado"
    | media < 7 = "Exame especial"
    | otherwise = "Aprovado"












