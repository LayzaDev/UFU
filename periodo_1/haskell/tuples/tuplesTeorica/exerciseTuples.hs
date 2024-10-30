------------- equality of 3 number ---------------

type Tuple3 = (Int, Int, Int)

equals :: Tuple3 -> Int
equals (a, b, c)
  | a == b && b == c = 3
  | a == b || b == c || c == a = 2
  | otherwise = 0

------------ less than 2 numbers ----------------

type Tuple2 = (Int, Int)

smaller' :: Tuple2 -> Int
smaller' (x, y) = if x < y then x else y

------------ less than 3 numbers ------------------

smaller'' :: Tuple3 -> Int
smaller'' (a, b, c)
  | a < b && a < c = a
  | b < a && b < c = b
  | otherwise = c

--------------- larger and Smaller ----------------

largerAndSmaller :: Tuple3 -> Tuple2

largerAndSmaller (a, b, c)
    | a > b && a > c && b < c = (a, b)
    | a > b && a > c && b > c = (a, c)
    | b > a && b > c && a < c = (b, a)
    | b > a && b > c && a > c = (b, c)
    | c > a && c > b && a < b = (c, a)
    | c > a && c > b && a > b = (c, b)
    | otherwise = (0,0)

--------------------- compare date -------------------

compareDate :: Tuple3 -> Tuple3 -> IO()
compareDate (d, m, a)(d2, m2, a2)
  | (d, m, a) < (d2, m2, a2) = putStr"First date occurred before the second\n"
  | (d, m, a) > (d2, m2, a2) = putStr"Second date occurred before the first \n"
  | otherwise = putStr"Both dates are the same \n" 

----------- defining data types -----------------

type Data = (Int, Int, Int)

----------- leap year conditions ----------------

leapYear :: Int -> Bool
leapYear x | (mod x 400 == 0) = True
           | (mod x 4 == 0) && (mod x 100 /= 0) = True
           | otherwise = False

------------ date validation -------------------

validation  :: Data -> Bool
validation (d, m, a)
    | d >= 1 && d <= 31 && (m == 1 || m == 3 || 
      m == 5 || m == 7 || m == 8 || m == 10 || m == 12) = True
    | d >= 1 && d <= 30 && (m == 4 || m == 6 ||
      m == 9 || m == 11) = True
    | d >= 1 && d <= 28 && m == 2 && not(leapYear a)
      = True
    | d >= 1 && d <= 29 && m == 2 && (leapYear a) = True
    | otherwise = False

