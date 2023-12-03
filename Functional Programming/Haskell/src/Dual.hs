module Dual where

data DualNumber = DualNumber Double Double

getReal :: DualNumber -> Double
getReal (DualNumber x _) = x 

getEpsilon :: DualNumber -> Double
getEpsilon (DualNumber _ y) = y

add :: DualNumber ->DualNumber -> DualNumber
add (DualNumber x1 y1) (DualNumber x2 y2) =  DualNumber (x1 + x2) (y1 + y2)

substr :: DualNumber -> DualNumber -> DualNumber
substr (DualNumber x1 y1) (DualNumber x2 y2) = DualNumber (x1 - x2) (y1 -y2)

mult :: DualNumber -> DualNumber -> DualNumber
mult (DualNumber x1 y1) (DualNumber x2 y2) = DualNumber (x1 * x2) ((x1 * y2) + (y1 * x2))

div :: DualNumber -> DualNumber -> DualNumber
div (DualNumber x1 y1) (DualNumber x2 y2) = DualNumber (x1 / x2) (((y1 * x2) - (x1 * y2)) / (x2 * x2))
