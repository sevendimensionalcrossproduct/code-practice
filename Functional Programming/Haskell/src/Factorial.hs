module Factorial where

multiply :: Int -> Int -> Int
multiply x y = x * y

factorial :: Int ->Int
factorial 0 = 1
factorial x = x * factorial (x - 1)

getFactorial :: IO ()
getFactorial =
  putStr "Input integer: " >>
  getLine >>= \input ->
  let n = read input :: Int in
  let result = factorial n in
  print result
