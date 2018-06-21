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

primes = do
  
