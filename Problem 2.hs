module Main where

main :: IO ()
main = print $ evenFibs 0 1 2 i where
  evenFibs s x y n = if y < n then evenFibs
    (if even y then y+s else s) y (x+y) n else s
  i = truncate 4e6
