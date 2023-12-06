module Fourier where

import Index (stringToIndices)

newtype Polynomial = Polynomial [Double]

instance Show Polynomial where
    show (Polynomial xs) = showPolynomial (zip [1..] xs)
        where
            showPolynomial :: [(Int, Double)] -> String
            showPolynomial [] = ""
            showPolynomial [(i, a)] = getSign a ++ formatTerm a i
            showPolynomial ((i, a):rest) = getSign a ++ formatTerm a i ++ showPolynomial rest

            formatTerm :: Double -> Int -> String
            formatTerm a i
                | isIntegral a = show (abs (round a) :: Int) ++ "x" ++ stringToIndices (show (i-1))
                | otherwise = show (abs a) ++ "x" ++ stringToIndices (show (i-1))

            isIntegral :: Double -> Bool
            isIntegral x = snd (properFraction x :: (Integer, Double)) == 0

            getSign :: Double ->String
            getSign x 
                | signum x == -1 = "-"
                | signum x == 1 = "+"
                | otherwise = ""
