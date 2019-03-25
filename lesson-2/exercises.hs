{-
Q2.1 
-}

-- Q2.2
inc n = n + 1

double n = n * 2

square n = n * n

addNumberToN n x = n + x

inc1 n = addNumberToN n 1

double1 n = addNumberToN n n

-- Q2.3
foo n = if even n
    then n - 2
    else 3 * n + 1