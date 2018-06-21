module Main where

import Control.Monad
import Data.List

main :: IO ()
main = print $ sum [product xs | xs <-
  replicateM 2 [1..100], nub xs == xs]
