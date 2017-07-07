-- | A `Real` typeclass.
module Data.Real
  ( class Real
  , toRational
  ) where

import Prelude (class Ord)
import Data.BigInt (BigInt, toNumber)
import Data.Int (fromNumber)
import Data.Maybe (fromMaybe)
import Data.Rational (Rational, fromInt)
import Data.Num
       
-- | The `Real` class represents real numbers, similar to the Haskell version.
class (Num a, Ord a) <= Real a where
    toRational :: a -> Rational

-- | `Real` instance for `Int`.
instance realInt :: Real Int where
    toRational = fromInt
         
-- | `Real` instance for `Number`.
instance realNumber :: Real Number where
    toRational n = fromInt (fromMaybe 0 (fromNumber n))

-- | `Real` instance for `BigInt`.
instance realBigInt :: Real BigInt where
    toRational n = fromInt (fromMaybe 0 (fromNumber (toNumber n)))
