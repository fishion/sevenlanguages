module Main where

-- myRange function with 2 parames =
    -- start param as head, with tail being the range you get starting from the next element
myRange1 start step = start:(myRange1 (start + step) step)

-- so lets build the fibonacci sequence lazily
lazyFib x y = x:(lazyFib y (x+y) )
-- that allows you to get the sequence, lets assign the full
-- lazy list to a var
fib = lazyFib 1 1
-- and the provide an accessor to it
fibNth x = head (drop (x-1) (take x fib))
-- It's slower than the previous implementation for 100000th element, but stil not too bad.
-- I should really benchmark against non-functional languages.

