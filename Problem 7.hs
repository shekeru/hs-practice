module Main where

import Data.List.Ordered (minus, union, unionAll)
import Control.Monad.Generator
import Data.Maybe
import Data.List

main :: IO ()
main = print (primes!!10000)

primesTo :: Integer -> [Integer]
primesTo 2 = [2]
primesTo n = [x | x<-[2..n], all ((> 0).rem x) $ prev x]
  where prev = primesTo.truncate.sqrt.fromIntegral

primes :: [Integer]
primes = 2 : 3 : [5,7..] `minus` unionAll [[p*p, p*p+2*p..] | p <- tail primes]

primes' :: [Integer]
primes' = map head $ scanl minus [2..] [[p, p+p..] | p <- primes']

primes'' :: [Integer]
primes'' = 2:3:[x | x <-[5,7..], all ((> 0).rem x) $ prev x]
  where prev = primesTo.truncate.sqrt.fromIntegral
