module Main where

import Control.Monad
import Data.Maybe
import Data.List

main :: IO ()
main = print.last $ innerGuard 600851475143

pfactors :: Integer -> [Integer]
pfactors = unfoldr factorPair where
  factorPair n = listToMaybe [(x, n `div` x) |
    x <- [2..n], n `mod` x == 0]

outerGuard :: Int -> [Int]
outerGuard n
  | null factors = []
  | otherwise =  y : outerGuard (div n y) where
    factors = [x | x <- [2..n], mod n x == 0]
    y = head factors

sansLTM :: Int -> [Int]
sansLTM = unfoldr nextFactor where
  nextFactor n = if null factors then Nothing else
    let y = head factors in Just (y, div n y) where
      factors = [x | x <- [2..n], mod n x == 0]

innerGuard :: Int -> [Int]
innerGuard n = do
  guard (not $ null factors)
  y : innerGuard (div n y) where
    factors = [x | x <- [2..n], mod n x == 0]
    y = head factors
