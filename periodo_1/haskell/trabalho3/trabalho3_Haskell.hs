-- ALUNA: LAYZA NAUANE DE PAULA SILVA
-- MATRICULA: 12211BSI251

type Codigo = Int 
type Nome = String
type Preco = Float

type Produto = (Codigo, Nome, Preco)

tabelaProdutos :: [Produto]
tabelaProdutos = [(001, "Chocolate", 5.25) 
                 ,(002, "Biscoito", 10.10)
                 ,(003, "Laranja", 4.60)
                 ,(004, "Sabao", 2.10)
                 ,(005, "Batata Chips", 6.90)
                 ,(006, "Doritos", 8.90)
                 ]

-- FUNCAO 1 --

isCodigo :: Int -> Produto -> Bool
isCodigo codigoDeBarras (codigo, nome, preco)
    |codigoDeBarras == codigo = True
    |otherwise = False

-- FUNCAO 2 --

getPreco :: Produto -> Preco
getPreco (_,_, preco) = preco

-- FUNCAO 3 --

getNome :: Produto -> Nome
getNome (_,nome,_) = nome

-- FUNCAO 4 --

buscaPrecoPorCodigo :: Codigo -> Preco
buscaPrecoPorCodigo codigoDeBarras = getPreco (head(filter(isCodigo codigoDeBarras) tabelaProdutos))

-- FUNCAO 5 --

buscaNomePorCodigo :: Codigo -> Nome
buscaNomePorCodigo codigoDeBarras = getNome (head (filter (isCodigo codigoDeBarras) tabelaProdutos))

-- FUNCAO 6 --

calculaPrecos :: [Codigo] -> Preco
calculaPrecos codigoDeBarra = foldr (+) 0 (map buscaPrecoPorCodigo codigoDeBarra)

-- FUNCAO 7 --

formataStrProduto :: Codigo -> String
formataStrProduto codigoDeBarra = (buscaNomePorCodigo codigoDeBarra) ++ (replicate(30 - (length(buscaNomePorCodigo codigoDeBarra)) - (length(show(buscaPrecoPorCodigo codigoDeBarra)))) '.') ++ (show(buscaPrecoPorCodigo codigoDeBarra))

-- FUNCAO 8 --

geraNotaFiscal :: [Codigo] -> IO()
geraNotaFiscal codigoDeBarra = 
-- Não consegui implementar a função 8 :(