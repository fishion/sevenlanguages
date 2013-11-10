module Main where

alleven :: [Integer] -> [Integer]
alleven [] = []
-- list deconstruction on the left and construction on the right
alleven (h:t) = if even h then h:alleven t else alleven t

--other ways...

alleven2 :: [Integer] -> [Integer]
alleven2 (list) = [x | x <- list, even x]

-- using guards

alleven3 :: [Integer] -> [Integer]
alleven3 list
    | list == [] = []
    | otherwise = if even h then h:alleven3 t else alleven3 t where (h:t) = list
