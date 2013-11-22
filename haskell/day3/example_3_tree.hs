module Main where

    data Tree a = Branches [Tree a] | Leaf a deriving (Show)

    depth (Leaf _) = 1
    depth (Branches b) = 1 + maximum (map depth b)
