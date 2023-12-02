module MyLib where

import Index (stringToIndices)


square :: Int -> Int
square x = x * x 

exponentiate :: Double ->Int -> Double
exponentiate _ 0 = 1.0
exponentiate base indx = base * exponentiate base (indx - 1)

main :: IO ()
main =
  putStr "Base: " >>
  getLine >>= \ base -> 
  let baseNum = read base :: Double in
 
  putStr "Exponent: " >>
  getLine >>= \ expn ->
  let expnNum = read expn :: Double in

  putStr (base <>  stringToIndices expn <> " = ") >> 
  print (exponentiate baseNum (round expnNum))

