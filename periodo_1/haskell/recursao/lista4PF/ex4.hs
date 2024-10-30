mdc :: Float -> Float -> Float
mdc x y
    | x == y = x
    | x > y = mdc (x - y) y
    | x < y = mdc (y - x) x

mmc :: Float -> Float -> Float
mmc x y = (x * y) / (mdc x y)