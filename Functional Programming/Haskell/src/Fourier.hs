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
            | otherwise = getSign i a ++ formatCoefficient a ++ formatX i a ++ formatIndex i

        getSign :: Integer -> Double -> String
        getSign i x = case i of
                0 -> if signum x == -1 then "-"  else ""
                _ -> if signum x == -1 then " - " else if signum x == 1 then " + " else ""

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


