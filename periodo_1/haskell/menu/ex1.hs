{-Considere o menu de opcoes abaixo:
1 - Soma de 2 numeros.
2 - Diferenca entre 2 numeros (maior pelo menor).
3 - Produto entre 2 numeros
4 - Divisao entre 2 n umeros (maior dividido pelo menor.  
Se o denominador for nulo, retornar como resultado o valor -1.
Leia dois numeros inteiros, seguidos pela opcao escolhida.  
Retornar como resultado o valor -1, caso o usuario digite uma operacao que nao pertence ao menu-}

soma :: Float -> Float -> Float
soma x y = x+y

diferenca :: Float -> Float -> Float
diferenca x y = if x < y then y - x else x - y

prod:: Float -> Float -> Float
prod x y = x * y

divisao :: Float -> Float -> Float
divisao x y = if (x >= y && y /= 0) then (x / y) else if y >= x && x /= 0 then y / x else -1

menu :: IO()
menu = do putStrLn "1 - Soma"
          putStrLn "2 - Diferenca"
          putStrLn "3 - Produto"
          putStrLn "4 - Divisao"
          putStrLn " Digite dois numeros: "
          num1 <- getLine
          num2 <- getLine
          putStrLn "Digite uma opcao de 1 a 4: "
          opcao <- readLn
          case opcao of
            1 -> putStrLn 
                    (show(soma (read num1) (read num2)))
            2 -> putStrLn 
                    (show (divisao (read num1) (read num2)))
            3 -> putStrLn 
                    (show (prod (read num1) (read num2)))
            4 -> putStrLn 
                    (show (divisao (read num1) (read num2)))
            _ -> putStrLn "-1"



        