1: 8 : 6 : [] -> [1, 8, 6]

'o':'b':'a':[] -> "oba"

True : True : [] -> [False,True,True]

(False : []) : [] : (True : False : True : []) : [] -> [[False],[],[True,False,True]]

[1 .. 10] -> [1,2,3,4,5,6,7,8,9,10]

[1 .. 100] -> [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,
               18,19,20,21,22,23,24,25,26,27,28,29,30,31,
               32,33,34,35,36,37,38,39,40,41,42,43,44,45,
               46,47,48,49,50,51,52,53,54,55,56,57,58,59,
               60,61,62,63,64,65,66,67,68,69,70,71,72,73,
               74,75,76,77,78,79,80,81,82,83,84,85,86,87,
               88,89,90,91,92,93,94,95,96,97,98,99,100]

[10, 8 .. 0] -> [10,8,6,4,2,0]


-------------------------------------------------------------------

null [] -> True

head [1,2,3] -> 1

tail [1,2,3] -> [2,3]

length [1,2,3]
3

sum [1,2,3] -> 6

product [1,2,3] -> 6

reverse[1,2,3] -> [3,2,1]

[1,2,3] !! 1 -> 2

[1] ++ [2,3] -> [1,2,3]

take 2 [1,2,3] -> [1,2]

drop 2 [1,2,3] -> [3]

zip ['a', 'b'] [1,2] -> [('a',1),('b',2)]

concat [[1,2],[3,4]] -> [1,2,3,4]

last [1,2,3] -> 3

----------------- Compreensão de lista -----------------------

-- geradores

[x*x | x <- [1 .. 5]] -> [1,4,9,16,25]

[(x,y) | x <- [1,2,3], y <- [4,5]] -> [(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)]

[(x,y) | x <- [4,5], y <- [1,2,3]] -> [(4,1),(4,2),(4,3),(5,1),(5,2),(5,3)]

-- restrições

[x | x <- [1 .. 10], even x] -> [2,4,6,8,10]

--------------- Exercicios ------------------

1

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

-


