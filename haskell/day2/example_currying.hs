module Main where

-- define a two argument function.
prod x y = x * y
-- it's really processed as (prod x) y
-- so (prod 2) 4 would first return an anonymous function (\y -> 2 * y) 4
-- which would be evaluate to 8.

-- you can use this to curry your own functions by just passing one arg to multi-arg functions
-- NOTE - no areguments defined for double or triple, as already defined in prod!
double = prod 2 
triple = prod 3
