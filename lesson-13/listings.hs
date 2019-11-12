-- Type Classes
-- Group types based on shared behaviour
-- Heart of haskell programming
-- states which functions a type must support like interfaces in java

-- :t to inspect type of a function

addThenDouble :: Num a => a -> a -> a
addThenDouble x y = (x + y) * 2

-- defining your own type class
class Describable a where
    describe :: a -> String


-- Ord and Eq type classes
-- :info Ord
-- :info Eq

-- Int is part of a Bounded type class
-- Integer is unbounded

-- show type class
-- prints to GHCi
-- class Show a where
--     show :: a -> String

-- data Icecream = Chocolate | Vanilla
-- ghci wont be able to print Chocolate since there is no show defined for it

data Icecream = Chocolate | Vanilla deriving (Show, Eq, Ord)