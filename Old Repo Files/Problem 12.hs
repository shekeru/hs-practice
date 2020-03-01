module Main where

import Control.Monad
import Data.List

main :: IO ()
main = print solve

solve :: Integer
solve =  head [t | t <- tnums, 500 < (length.divisors) t]
  where tnums = scanl1 (+) [1..]

divisors :: Integer -> [Integer]
divisors n = do
  x <- [1..mp n]
  guard (0 == rem n x)
  [x, div n x] where
    mp = truncate.sqrt.fromIntegral
