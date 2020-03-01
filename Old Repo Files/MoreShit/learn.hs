-- learn.hs

module Learn where

x = 10 * 5 + y
myResult = x * 5
y = 10

foo x =
  let y = x * 2
      z = x ^ 2
  in 2 * y * z

printInc n = print plusTwo
  where plusTwo = n + 2

printInc2 n = let
  plusTwo = n + 2 in
    print plusTwo

printInc2' n = (\plusTwo ->
  print plusTwo) (n + 2)

mut1 = let
  x = 5; y = 6
  in x * y
