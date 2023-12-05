module Fourier where

import Index (stringToIndices)

newtype Polynomial = Polynomial [Double]

instance Show Polynomial where
    show (Polynomial xs) = showList (zip [1..] xs)
        where
            showList :: [(Int, Double)] ->String
            showList [] = ""
            showList [(i,a)] = show a ++ "x" ++ stringToIndices (show i) 
            showList ((i,a):rest) = show a ++ "x" ++ stringToIndices (show i) ++ " + " ++ showList rest

