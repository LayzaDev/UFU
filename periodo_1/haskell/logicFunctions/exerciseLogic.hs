----------------- Logic Function ---------------

logicFunction1 :: Bool -> Bool -> Bool
logicFunction1 p q = ((p || q) && (p && q))

logicFunction2 :: Bool -> Bool -> Bool -> Bool
logicFunction2 p q r = ((p || q) && r)

logicFunction3 :: Bool -> Bool -> Bool -> Bool
logicFunction3 p q r = (p && q) || not(p && r)

logicFunction4 :: Bool -> Bool -> Bool -> Bool -> Bool
logicFunction4 p q r s = p || (q && r) || not(s)

logicFunction5:: Bool -> Bool -> Bool -> Bool -> Bool
logicFunction5 p q r s = (not(p || q) && (r || s) && not(r))


----- logic functions (i.e., not, && e ||) ------

not1Log :: Bool -> Bool
not1Log p = not(p)

and1Log :: Bool -> Bool -> Bool
and1Log p q = p && q

or1Log :: Bool -> Bool -> Bool
or1Log p q = p || q

nandLog :: Bool -> Bool -> Bool
nandLog p q = not(p && q)

norLog :: Bool -> Bool -> Bool
norLog p q = not(p || q)

xorLog :: Bool -> Bool -> Bool
xorLog p q = (p || q) && not(p && q)

xnorLog :: Bool -> Bool -> Bool
xnorLog p q = not(p || q) && (p && q)

xor :: Bool -> Bool -> Bool
xor a b = (a || b) && not(a && b)

xor' :: Bool -> Bool -> Bool
xor' a b = a /= b

------- logic functions (if then else) --------

not1If ::Bool -> Bool
not1If p = if p == True then False else True

and1If ::Bool -> Bool -> Bool
and1If p q = if (p && q == True) then True else False

or1If ::Bool -> Bool -> Bool
or1If p q = if (p || q == True) then True else False

nandIf ::Bool -> Bool -> Bool
nandIf p q = if (p && q == True) then False else True

norIf ::Bool -> Bool -> Bool
norIf p q = if(p || q == True) then False else True

xorIf ::Bool -> Bool -> Bool
xorIf p q = if(p /= q) then True else False

xnorIf ::Bool -> Bool -> Bool
xnorIf p q = if (p /= q) then False else True

xor'' :: Bool -> Bool -> Bool
xor'' a b = if a == b then True else False

------------ logic functions (guards) -----------

not1Guar ::Bool -> Bool
not1Guar p
        | p == True = False
        | otherwise = True

and1Guar ::Bool -> Bool -> Bool
and1Guar p q
        | (p && q == True) = True
        | otherwise = False

or1Guar ::Bool -> Bool -> Bool
or1Guar p q
        | (p || q == True) = True
        | otherwise = False

nandGuar ::Bool -> Bool -> Bool
nandGuar p q
        | (p && q == True) = False
        | otherwise = True

norGuar ::Bool -> Bool -> Bool
norGuar p q | (p || q == True) = False
            | otherwise = True 

xorGuar ::Bool -> Bool -> Bool
xorGuar p q | (p /= q) = True
            | otherwise = False

xnorGuar ::Bool -> Bool -> Bool
xnorGuar p q | (p /= q) = False
             | otherwise = True
                      
xor''' :: Bool -> Bool -> Bool 
xor''' a b
        |(a || b) = True
        |otherwise = False