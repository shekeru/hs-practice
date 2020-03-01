module Main where

import Data.Char
import Data.List

main :: IO()
main = solve >>= print

solve :: IO Int
solve = greatest.parse <$> readFile "Problem 8.txt" where
  greatest = maximum.map (product.take 13).tails
  parse = map digitToInt . filter isDigit
