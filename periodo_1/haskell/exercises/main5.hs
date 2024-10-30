{-Faça um programa que apresente um menu, o qual permita ao usuário escolher a opção
desejada, dentre:
1. Salvar uma frase em um arquivo texto
2. Imprimir o conteúdo do arquivo texto
3. Sair
A seguir, o usuário deve digitar uma opção desejada, a qual executará a ação solicitada.
Teste a opção inválida. O menu deve ser repetido infinitamente.-}

--module Main(main) where

menu :: IO()
menu = do 
    putStrLn "1 - Salvar uma frase"
    putStrLn "2 - Imprimir o arquivo"
    putStrLn "3 - Sair"
    putStrLn "Escolha uma opcao de 1 a 3:"
    opcao <- readLn
    case opcao of
       1 -> do putStrLn "Digite uma frase" 
               frase1 <- getLine
               escreve frase1
       2 -> imprime
       3 -> putStrLn "sair"
       _ -> putStrLn "Opcao invalida"
    if opcao /= 3 then menu else putStrLn "Sair"
    
escreve frase = appendFile "arquivo.txt" frase

imprime = do conteudo <- readFile "arquivo.txt"
             putStrLn conteudo