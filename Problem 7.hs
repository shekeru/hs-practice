module Main where

import Data.Maybe
import Data.List

main :: IO ()
main = print.product $ foldr (reduce.pfactors) [] [2..20]

primesTo :: Integer -> [Integer]
primesTo 2 = [2]
primesTo n = [x | x<-[2..n], all ((> 0).rem x) $ prev x]
  where prev = primesTo.truncate.sqrt.fromIntegral

nthPrimes :: Integer -> [Integer]
nthPrimes 1 = [2]
nthPrimes n = n : nthPrimes (n-1)
  where prev = nthPrimes.truncate.sqrt.fromIntegral
