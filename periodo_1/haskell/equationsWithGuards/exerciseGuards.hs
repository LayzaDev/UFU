------------ guardas -----------------

vabs :: (Num a, Ord a) => a -> a 
vabs n | n >= 0 = n
       | n < 0 = -n

----------------- pair numbers ------------------

pair :: Int -> Bool
pair x 
    | mod x 2 == 0 = True
    | otherwise = False

------------------ odd numbers ------------------

odd :: Int -> Bool
odd x
    | mod x 2 /= 0 = True
    | otherwise = False 

------------------ second degree equation -----------

roots :: Int -> Int -> Int -> String
roots a b c
        | b * b > 4 * a * c = "Two real roots"
        | b * b == 4 * a * c = "A real roots"
        | b * b < 4 * a * c = "No real root"
        | otherwise = "Error"

----------------------- roots bhaskara -----------------------

roots' :: Int -> Int -> Int -> String
roots' a b c
    |delta > 0 = "The equation has two real and distinct roots"
    |delta == 0 = "The equation has a real root"
    |delta < 0 = "The equation has no real roots"
    |otherwise = "Error!"
    where
        delta = (b * b - 4 * a * c)

---------------------- check speed --------------------

checkSpeed :: Float -> Float -> IO()
checkSpeed vel velMax
            | vel <= velMax = putStr("No fine \n")
            | vel > velMax  && vel <= 1.2 * velMax = putStr(" Fine of 180 reais \n")
            | vel > 1.2 * velMax = putStr("Fine of 600 reais \n")
            |otherwise = putStr("ERROR \n")

----------------- contribution to inss ---------------

inss :: Float -> Float
inss wage 
        | wage <= 1317.07 =  0.08 * wage 
        | wage >= 1318.08 && wage <= 2195.12 
          = 0.09 * wage
        | wage > 2195.13 && wage <= 4390.24 
          = 0.11 * wage
        | wage > 4390.24 = 482.93
        | otherwise = -1

------------ coordinates of a point -----------------

coordinates :: Float -> Float -> Float -> Float -> Float -> IO()
coordinates cx cy px py r 
        | sqrt((cx - px)*(cx - px) + (cy - py) * (cy - py)) == r = putStr "The point belongs to the circumference \n"
        | sqrt((cx - px)*(cx - px) + (cy - py) * (cy - py)) < r = putStr "The point is inside the circumference \n"
        | otherwise = putStr "The point is outside the circumference \n"
    
----------------- higher number -----------------

larger :: Int -> Int -> Int
larger n1 n2
    |n1 > n2 = n1
    |otherwise = n2

----------- ordered pair (guards) --------------

orderedPair' :: Int -> Int -> (Int, Int)
orderedPair' x y
    | x < y = (x, y)
    | otherwise = (y, x)

------------------- define mes -----------------

mes :: Int -> String
mes y
    | y == 1 = "January"
    | y == 2 = "February"
    | y == 3 = "March"
    | y == 4 = "April"
    | y == 5 = "May"
    | y == 6 = "June"
    | y == 7 = "July"
    | y == 8 = "August"
    | y == 9 = "September"
    | y == 10 = "October"
    | y == 11 = "November"
    | y == 12 = "December"
    | otherwise = "Error!"

-------------------- retirement ----------------------

retirement :: Int -> Int -> String
retirement age serviceTime 
    | age >= 65 || serviceTime >= 30 || age >= 60 && serviceTime >= 25 = "can retire"
    | otherwise = "can't retire"