module Main where

mtable :: Integer -> [(Integer, Integer, Integer)]
mtable n = [(x, n, n*x) | x <- [1..12]]
