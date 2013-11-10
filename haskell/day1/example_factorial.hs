module Main where

fact 0 = 1
fact x = x * fact (x - 1)

-- alternative implementation
fact2 x
    | x < 1 = 1
    | otherwise = x * fact2 (x - 1)
