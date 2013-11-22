module Main where

-- use partial applied functions to define a function that will return half of a number
-- and another that will append \n to the end of any string

-- I'm sure that technically, this fulfills the goal. Though maybe '/' doesn't count as a function?
-- half x = x / 2

divideby y x = x / y
half = divideby 2 


appendsomething y x = x ++ y
addnewline = appendsomething "\n"
