module Main where

revcollect :: ([Integer], [Integer]) -> ([Integer], [Integer])
revcollect (sorted, []) = (sorted, [])
revcollect (collector, (h:t)) = revcollect (h:collector, t)

revgrab :: ([Integer], [Integer]) -> [Integer]
revgrab (x,y) = x

rev :: [Integer] -> [Integer]
rev list = revgrab ( revcollect ([], list) )
