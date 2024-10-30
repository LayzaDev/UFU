{-1

a) [‘a’, ‘b’, ‘c’] -> error: lexical error at character 'a'

b) (‘a’, ‘b’, ‘c’) -> error: lexical error at character 'a'

c) [(False, ‘0’), (True, ‘1’)] -> lexical error at character '0'

d) ([False, True], [‘0’, ‘1’]) -> lexical error at character '0'

e) [tail, init, reverse] -> error: • No instance for (Show ([a0] -> [a0]))arising from a use of ‘print’
                                     (maybe you haven't applied a function to enough arguments?)
                                   • In a stmt of an interactive GHCi command: print i

2) 

a) second xs = head (tail xs) 

- Resultado Null pois há uma lista vazia

b) pair x y = (x,y)

-

c) palindrome xs = reverse xs == xs

-}

