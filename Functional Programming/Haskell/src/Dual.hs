module Dual where

import Calc

data DualNumber = DualNumber Double Double

{--Instantiation of Dual Numbers--}
instance Show DualNumber where
    show (DualNumber x y)
        | x == 0 && y == 0.0 = "0" 

        | x /= 0 && y == 1 = show x ++ " + ε"
        | x /= 0 && y == -1 = show x ++ " - ε"
        | x == 0 && y == 1 = "ε"
        | x == 0 && y == -1 = "-ε"
         

        | x /= 0 && y > 0 = show x ++ " + " ++ show y ++ "ε" 
        | x /= 0 && y < 0 = show x ++ " - " ++ show (abs y) ++ "ε"

        | x == 0 && y /= 0 = show y ++ "ε" 
        | x /= 0 && y == 0 = show x 
        
        | otherwise = "0"
        

{--Getter Functions--}
getReal :: DualNumber -> Double
getReal (DualNumber x _) = x 

getEpsilon :: DualNumber -> Double
getEpsilon (DualNumber _ y) = y


{--Basic Operations--}
add :: DualNumber ->DualNumber -> DualNumber
add (DualNumber x1 y1) (DualNumber x2 y2) =  DualNumber (x1 + x2) (y1 + y2)

substr :: DualNumber -> DualNumber -> DualNumber
substr (DualNumber x1 y1) (DualNumber x2 y2) = DualNumber (x1 - x2) (y1 -y2)

mult :: DualNumber -> DualNumber -> DualNumber
mult (DualNumber x1 y1) (DualNumber x2 y2) = DualNumber (x1 * x2) ((x1 * y2) + (y1 * x2))

div :: DualNumber -> DualNumber -> DualNumber
div (DualNumber x1 y1) (DualNumber x2 y2) = DualNumber (x1 / x2) (((y1 * x2) - (x1 * y2)) / (x2 * x2))


{--Elementary Operations--}

dnSin :: DualNumber -> DualNumber 
dnSin z = DualNumber (sin(getReal z)) (cos (getReal z) * getEpsilon z)

dnCos :: DualNumber -> DualNumber
dnCos z = DualNumber (cos(getReal z)) (-sin(getReal z) * getEpsilon z)

dnTan :: DualNumber -> DualNumber
dnTan z = DualNumber (tan(getReal z)) (getEpsilon z * (sec(getReal z) ** 2))

dnCot :: DualNumber -> DualNumber
dnCot z = DualNumber (cot (getReal z)) (-getEpsilon z)

