module Main where
import Data.Char


numify x = read (filter (\x -> (isDigit x) || x == '.') x) :: Double

