-- | A `Integral` typeclass.
module Data.Integral
  ( class Integral
  , toBigInt
  , fromIntegral
  ) where

import Prelude (identity, (<<<), class EuclideanRing)
import Data.BigInt as BI
import Data.Int as I
import Data.Maybe (fromMaybe)
import Data.Num (fromBigInt)
import Data.Real (class Real)
       
-- | The `Integral` class represents integral numbers, similar to the Haskell version.
class (Real a, EuclideanRing a) <= Integral a where
    -- quot
    -- rem
    toBigInt :: a -> BI.BigInt

-- | A helper function for general conversion between `Integral` values.
fromIntegral :: forall a b. Integral a => Integral b => a -> b
fromIntegral = fromBigInt <<< toBigInt

-- | `Integral` instance for `Int`.
instance integralInt :: Integral Int where
    toBigInt i = BI.fromInt i
         
-- | `Integral` instance for `Number`.
instance integralNumber :: Integral Number where
    toBigInt n = BI.fromInt (fromMaybe 0 (I.fromNumber n))

-- | `Integral` instance for `BigInt`.
instance integralBigInt :: Integral BI.BigInt where
    toBigInt = identity
