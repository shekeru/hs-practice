module Network where

type Value = Double
type Weight = (Factor, Value)
type Factor = Value -> Value

relu :: Weight -> [Value] -> Value
relu (f, v) xs = f(max 0 $v *sum xs)
