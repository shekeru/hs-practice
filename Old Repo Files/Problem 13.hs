module Main where

import Control.Monad
import Data.List
import Data.Char

main = do
  nxs <- numbers; let
    (l,s) = foldr leftward (0, "") nxs
  putStrLn.take 10 $ show l ++ s

numbers = map(sum.map digitToInt).transpose.lines <$> readFile "Problem 13.txt"

leftward :: Int -> (Int, String) -> (Int, String)
leftward n (r,s) = let i = n+r in (div i 10,
  (intToDigit.rem i) 10 : s)
