module Main where

main :: IO ()
main = print . sum $ union [0,3..i] [0,5..i]
  where i = 999
