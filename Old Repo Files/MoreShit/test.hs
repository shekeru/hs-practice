
beta n = 8224 * foldl (fmap (+) (65536^)) 0 [0..n-1]

mum n = sum [8224*65536^i | i <- [0..n-1]]

point = (*8224).sum.map(65536^).enumFromTo 0.subtract 1

iter x = (*8224) $sum $take x
  $iterate (*65536) 1
