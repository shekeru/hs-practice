module Main where

main :: IO ()
main = print $ head [n | n <- [i^2,i^2-1..], palindrome n]

palindrome :: Integer -> Bool
palindrome n = reverse (show n) == show n && validFactors n

validFactors :: Integer -> Bool
validFactors n = let r = (floor.sqrt.fromIntegral) n in
  isTriple $ head [[x, n `div` x] | x <- [r,r-1..2], n `mod` x == 0]
  where isTriple = all (\y -> y > i `div` 10 && y <= i + 1)

i :: Integer
i = 999
