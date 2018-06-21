module Main where

import Data.Maybe
import Data.List

main :: IO ()
main = print ""

primesTo :: Integer -> [Integer]
primesTo 2 = [2]
primesTo n = [x | x<-[2..n], all ((> 0).rem x) $ prev x]
  where prev = primesTo.truncate.sqrt.fromIntegral

nats = 2 : filter (isPrime) (map (+1) nats)

nextPrime q = 
isPrime :: Integer -> Bool
isPrime x = all ((> 0).rem x) [2..(floor.sqrt.fromIntegral) x]
