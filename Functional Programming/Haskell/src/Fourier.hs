module Fourier where

import Index (stringToIndices)

newtype Polynomial = Polynomial [Double]

instance Show Polynomial where
    show (Polynomial xs) = showPolynomial (zip [0..] xs) where

        showPolynomial :: [(Integer, Double)] -> String
        showPolynomial [] = ""
        showPolynomial ((i, a):rest) = showStream i a ++ showPolynomial rest

        showStream :: Integer -> Double -> String
        showStream i a
            | a == 0 = ""
            | otherwise = getSign a ++ formatCoefficient a ++ formatX i a ++ formatIndex i

        getSign :: Double -> String
        getSign x
            | signum x == -1 = " - "
            | signum x == 1 = " + "
            | otherwise = ""

        formatCoefficient :: Double -> String
        formatCoefficient a
            | isIntegral a = show (abs (round a) :: Int)
            | otherwise = show (abs a)

        formatX :: Integer ->Double -> String
        formatX i a
            | a == 0 || i == 0 = ""
            | otherwise = "x"

        isIntegral :: Double -> Bool
        isIntegral x = snd (properFraction x :: (Integer, Double)) == 0

        formatIndex :: Integer -> String
        formatIndex i
            | i == 0 || i == 1 = ""
            | otherwise = stringToIndices (show i)


