module Main where

import Data.Maybe
import Data.List

main :: IO ()
main = print.product $ foldr (reduce.pfactors) [] [2..20]

reduce :: Eq a => [a] -> [a] -> [a]
reduce xs ys = (xs ++ ys) \\ shared xs ys where
  shared (x:xs) ys = if x `elem` ys then x :
    shared xs (delete x ys) else shared xs ys
  shared [] _ = []

pfactors :: Integer -> [Integer]
pfactors = unfoldr factorPair where
  factorPair n = listToMaybe [(x, n `div` x) |
    x <- [2..n], n `mod` x == 0]
