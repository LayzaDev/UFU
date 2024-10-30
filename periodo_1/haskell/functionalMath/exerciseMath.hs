----------------- sum --------------------

sum2 :: Int -> Int -> Int
sum2 x y = x + y

sum4 :: Int -> Int -> Int -> Int -> Int
sum4 x y z w = (sum2 x y) + z + w

----------------- subtract ---------------------

subtract :: Float -> Float -> Float
subtract a b = a - b

--------------- Square ------------------

square :: Int -> Int
square x = x * x

---------------- double -------------------

double :: Int -> Int 
double x = 2 * x

-------------- quadruple -----------------

quad :: Int -> Int 
quad x = (double x) * (double x)

--------------- incrementation ------------------

inc :: Float-> Float
inc x = x + 1

--------------- Average ------------------

average :: Float -> Float -> Float
average a b = ( a + b ) / 2.0

--------------- Rectangle Area ------------------

rectangleArea :: Int -> Int -> Int
rectangleArea base height = base * height

--------------- Square Area ------------------

squareArea :: Int -> Int 
squareArea side = side * side

--------------- hypotenuse -------------------

hip :: Float -> Float -> Float
hip cat1 cat2 = sqrt(cat1 * cat1 + cat2 * cat2)

--------------- Triangle Area ------------------

triangleArea :: Float -> Float -> Float
triangleArea base height = ((base * height) / 2)

--------------- Trapeze Area ------------------

trapezeArea :: Float -> Float -> Float -> Float
trapezeArea largerBase smallBase height = (((largerBase + smallBase) * height) / 2)

--------------- Circle Area ------------------

area :: Float -> Float
area diameter = circleArea
    where
        circleArea = (pi * (diameter/2 * diameter/2))

--------------- Circular crown Area ------------------

circularCrownArea :: Float -> Float -> Float
circularCrownArea diameterLarger minorDiameter = ((pi * (diameterLarger/2 * diameterLarger/2)) - (pi * (minorDiameter/2 * minorDiameter/2)))


circularCrownArea' :: Float -> Float -> Float
circularCrownArea' largerDiameter minorDiameter = ccArea
    where
        ccArea = ((pi * (largerDiameter/2 * largerDiameter/2)) - (pi * (minorDiameter/2 * minorDiameter/2)))

--------------- cube volume ------------------

cubeVolume :: Int -> Int
cubeVolume volume = volume * volume * volume

--------------- parallelepiped volume ------------------

parallelepipedVolume :: Int -> Int -> Int -> Int 
parallelepipedVolume length_ height width = length_ * height * width

--------------- regular pyramid volume ------------------

regularPyramidVolume :: Float -> Float -> Float
regularPyramidVolume baseArea height = (baseArea * height) / 3

--------------- sphere volume ------------------

sphereVolume :: Float -> Float
sphereVolume diameter = (4 * pi * (diameter/2 * diameter/2 * diameter/2))/2

--------------- Pythagorean theorem ------------------

pythagoreanTheorem :: Float -> Float -> Float
pythagoreanTheorem peccary1 peccary2 = hypotenuse
    where 
        hypotenuse = sqrt((peccary1 * peccary1) + (peccary2 * peccary2))

--------------- Cartesian plane ------------------

distanceBetweenTwoPoints :: Float -> Float -> Float -> Float -> Float
distanceBetweenTwoPoints xa ya xb yb = sqrt(((xa - ya) * (xa - ya)) + ((xb - yb) * (xb - yb)))

--------------- square of a number ------------------

squareOfANumber :: Int -> Int 
squareOfANumber x = x * x

--------------- cube of a number ------------------

cubeOfANumber :: Int -> Int
cubeOfANumber y = y * y * y

--------------- fourth power ------------------

fourthPower :: Int -> Int
fourthPower z = z*z*z*z

--------- convert from seconds to hours ----------

secondsToHours :: Float -> Float
secondsToHours seconds = seconds / 3600

-------- convert from seconds to minute -----------

secondsToMinute :: Float -> Float
secondsToMinute seconds = seconds / 60

-------- convert from Fahrenheit to Celsius ---------

fahrenheitToCelsius :: Float -> Float
fahrenheitToCelsius f = c
                where
                    c = ((f - 32) / 1.8)

celsiusparafahren :: Float -> Float
celsiusparafahren x = (1.8)*x + 32

--------- convert from Kelvin to Celsius -----------

kelvinToCelsius :: Float -> Float
kelvinToCelsius k = c
                where
                    c = k - 273

---------- convert from Fahrenheit to Kelvin ---------

fahrenheitToKelvin :: Float -> Float
fahrenheitToKelvin f = k
                where
                    k = (f - 32) / 1.8 + 273.15

----------- kilometers to meters conversion ----------

kilometersToMeters :: Float -> Float
kilometersToMeters velocity = velocity / 3.6