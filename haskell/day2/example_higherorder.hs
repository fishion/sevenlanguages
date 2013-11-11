module Main where

-- anonymous square functions like this
-- (\x -> x * x) 2
-- could write the same thing without anonymous functions like this:
squareAll list = map square list
    where square x = x * x
-- so presumably also like this
mySquare list = map (\x -> x * x) list
-- yes. Good.

-- partial function weirdness
plusOne list = map (+ 1) list

-- filter odds
filterOdds list = filter odd list

-- foldl to sum things
sumList list = foldl (\sumsofar x -> sumsofar + x) 0 list
-- or to use the patial function
sumList2 list = foldl (+) 0 list
-- or to take advantage of the starting argument implicit in foldl1
sumList3 list = foldl (+) 0 list

