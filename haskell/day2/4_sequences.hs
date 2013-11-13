module Main where

r3 x = [x, 3+x ..]
r5 x = [x, 5+x ..]

combined x y = zipWith (+) (r3 x) (r5 y)
