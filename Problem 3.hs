module Main where

import Data.Maybe
import Data.List

main :: IO ()
main = print.last $ pfactors 600851475143

pfactors :: Integer -> [Integer]
pfactors = unfoldr factorPair where
  factorPair n = listToMaybe [(x, n `div` x) |
    x <- [2..n], n `mod` x == 0]
