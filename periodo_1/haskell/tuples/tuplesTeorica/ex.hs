type X = Float
type Y = Float

--type Ponto = (Float, Float)
type Ponto = (X, Y)

dist :: Ponto -> Ponto -> Float
dist (xa, ya) (xb, yb) = sqrt((xb-xa)**2 + (yb - ya)**2)