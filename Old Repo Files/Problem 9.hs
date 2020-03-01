module Main where

import Control.Monad

main :: IO()
main = (print.product.triplets) 1000

triplets n = do
  u <- [4..slp n]; v <-[slp u..u-1]; let
    c = u^2 + v^2; a = u^2 - v^2; b = 2*u*v
  guard (c^2 == a^2 + b^2 && a+b+c == n)
  [a,b,c] where slp = truncate.sqrt.fromIntegral
