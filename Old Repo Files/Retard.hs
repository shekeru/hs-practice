module Main where

import Data.List.Split
import Control.Monad

main :: IO()
main = replicateM 6 parse >>= print.solve

test = [[1,1,1,0,0,0],[0,1,0,0,0,0],[1,1,1,0,0,0],[0,0,2,4,4,0],[0,0,0,2,0,0],[0,0,1,2,4,0]]


parse :: IO [Integer]
parse = map read.splitOn " " <$> getLine

solve :: [[Integer]] -> Integer
solve t = maximum [sum $ vals y x | y <- sets, x <- sets]
  where vals = i_vals t; sets = [0..3]

i_vals :: Num a => [[a]] -> Int -> Int -> [a]
i_vals t y x = t!!(y+1)!!(x+1) : [t!!y1!!x1 |
    x1 <- [x..x+2], y1 <- [y,y+2]]
