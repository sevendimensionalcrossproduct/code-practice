module MyLib (someFunc) where

import Index (stringToIndices)

someFunc :: IO ()
someFunc = 
  putStrLn "someFunc" >>
  someFunc


square :: Int -> Int
square = \ x -> x * x 

calculate :: IO ()
calculate =
  putStr "Number: " >>
  getLine >>= \ input ->

  let number = read input :: Int in
  
  putStr (input <> stringToIndices "2" <> " = ") >>
  print (square number)
