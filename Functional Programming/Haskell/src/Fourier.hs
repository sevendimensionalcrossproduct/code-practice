module Fourier where

import Index (stringToIndices)

newtype Polynomial = Polynomial [Double]

instance Show Polynomial where
    show (Polynomial xs) = showPolynomial (zip [1..] xs) where

        showPolynomial :: [(Integer, Double)] -> String
        showPolynomial [] = ""
        showPolynomial ((i, a):rest) = showStream i a ++ showPolynomial rest

        formatX :: Double -> String
        formatX a
            | a == 0 = ""
            | otherwise = "x"

        formatCoefficient :: Double -> String
        formatCoefficient a
            | isIntegral a = show (abs (round a) :: Int)
            | otherwise = show (abs a)

        isIntegral :: Double -> Bool
        isIntegral x = snd (properFraction x :: (Integer, Double)) == 0

        getSign :: Double -> String
        getSign x
            | signum x == -1 = "-"
            | signum x == 1 = "+"
            | otherwise = ""

        formatIndex :: Integer -> String
        formatIndex i = stringToIndices (show (i - 1))

        showStream :: Integer -> Double -> String
        showStream i a
            | a == 0 = ""
            | otherwise = getSign a ++ formatCoefficient a ++ formatX a ++ formatIndex i
