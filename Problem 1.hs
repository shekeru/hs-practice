module Main where

main :: IO ()
main = print . sum $ union [0,3..999] [0,5..999]
