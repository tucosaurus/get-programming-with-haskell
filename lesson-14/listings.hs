-- Using Type classes
-- Polymorphism in haskell

data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6

instance Show SixSidedDie where
    show S1 = "one"
    show S2 = "two"
    show S3 = "three"
    show S4 = "four"
    show S5 = "five"
    show S6 = "six"

-- Why define show like this ?
-- Why not ?
-- show :: SixSidedDie -> String
--  show S1 = "one"
--  show S2 = "two"
--  show S3 = "three"
--  show S4 = "four"
--  show S5 = "five"
--  show S6 = "six"
-- there are two definitions for show now. The one that we wrote and one by the type class
-- haskell wouldn't know which to use

-- Define Eq
instance Eq SixSidedDie where
    (==) S6 S6 = True
    (==) S5 S5 = True
    (==) S4 S4 = True
    (==) S3 S3 = True
    (==) S2 S2 = True
    (==) S1 S1 = True
    (==) _ _ = False

-- Haskell figures out /= after you have implemented this

-- Implementing Ord
instance Ord SixSidedDie where
    compare S6 S6 = EQ
    compare S6 _ = GT
    compare _ S6 = LT
    compare S5 S5 = EQ
    compare S5 _ = GT
    compare _ S5 = LT

-- this is too long to write

-- What if you just derive ?
    -- haskell then decides the order on the basis of the order of the data constructors defined
    -- data Test = AA | ZZ deriving (Eq, Ord)
    -- AA < ZZ , ZZ is greater than AA since it comes later


data SixSideDieDeriving = C1 | C2 | C3 | C4 | C5 | C6 deriving (Enum)

instance Show SixSideDieDeriving where
    show C1 = "one"
    show C2 = "two"
    show C3 = "three"
    show C4 = "four"
    show C5 = "five"
    show C6 = "six"

