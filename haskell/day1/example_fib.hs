module Main where

fibtuple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
fibtuple (x,y,0) = (x,y,0)
fibtuple (x,y,index) = fibtuple(y, x+y, index-1)

fibgrab :: (Integer, Integer, Integer) -> Integer
fibgrab (x,y,index) = x

fib :: Integer -> Integer
fib index = fibgrab ( fibtuple (0,1,index) )

-- holy crap that's fast!
-- fib 10000 responds almost instantly
-- fib 100000 only takes about a second!

-- another way using function compositiojn
fibnext :: (Integer, Integer) -> (Integer, Integer)
fibnext (x,y) = (y,x+y)

fibNth :: Integer -> (Integer, Integer)
fibNth 1 = (1,1)
fibNth n = fibnext ( fibNth (n-1) )

fib2 :: Integer -> Integer
fib2 = fst . fibNth

-- still quick!
