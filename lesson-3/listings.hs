sumSquareOrSquareSum x y = if sumSquare > squareSum
                       then sumSquare
                       else squareSum
    where sumSquare = x^2 + y^2
          squareSum = (x + y)^2

doubleDouble x = dubs * 2
    where dubs = x * 2

doubleLambda x = (\x -> x*2) x * 2

doubleNew x = (\x -> x * 2 * 2)x
