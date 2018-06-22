module Main where

import Control.Monad.Generator

import Data.Maybe
import Data.List

main :: IO ()
main = print ""

primesTo :: Integer -> [Integer]
primesTo 2 = [2]
primesTo n = [x | x<-[2..n], all ((> 0).rem x) $ prev x]
  where prev = primesTo.truncate.sqrt.fromIntegral

import Data.List.Ordered (minus, union, unionAll)

primes = 2 : 3 : minus [5,7..] (unionAll [[p*p, p*p+2*p..] | p <- tail primes])  
