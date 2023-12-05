module Fourier where

import Index (stringToIndices)

newtype Polynomial = Polynomial [Double]

instance Show Polynomial where
    show (Polynomial xs) = showPolynomial (zip [1..] xs)
        where
            showPolynomial :: [(Int, Double)] -> String
            showPolynomial [] = ""
            showPolynomial [(i, a)] = formatTerm a i
            showPolynomial ((i, a):rest) = formatTerm a i ++ " + " ++ showPolynomial rest

            formatTerm :: Double -> Int -> String
            formatTerm a i
                | isIntegral a = show (round a :: Int) ++ "x" ++ stringToIndices (show i)
                | otherwise = show a ++ "x" ++ stringToIndices (show i)

            isIntegral :: Double -> Bool
            isIntegral x = snd (properFraction x :: (Integer, Double)) == 0
