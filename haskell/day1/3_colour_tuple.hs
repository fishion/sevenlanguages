module Main where

-- all unique combos of black, white, blue, yellow, red 

combos :: [String] -> [(String, String)]
combos list = [(x,y) | x <- list, y <- list, x < y]

--Call like this:
-- combos ["black", "white", "blue", "yellow", "red"]

