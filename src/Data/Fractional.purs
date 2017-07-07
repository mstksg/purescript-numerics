-- | A `Fractional` typeclass.
module Data.Fractional
  ( class Fractional
  , fromRational
  , fromFractional
  ) where

import Prelude ((<<<), class DivisionRing)
--import Data.BigInt as BI
--import Data.Int (fromNumber)
--import Data.Maybe (fromMaybe)
import Data.Rational (Rational, toNumber)
import Data.Real

-- | The `Fractional` class represents fractional numbers, similar to the Haskell version.
class (Real a, DivisionRing a) <= Fractional a where
    fromRational :: Rational -> a

-- | A helper function for general conversion between `Fractional` values.
fromFractional :: forall a b. Fractional a => Fractional b => a -> b
fromFractional = fromRational <<< toRational

-- | `Fractional` instance for `Int`.
--instance fractionalInt :: Fractional Int where
--    fromRational n = fromMaybe 0 (fromNumber (toNumber n))
         
-- | `Fractional` instance for `Number`.
instance fractionalNumber :: Fractional Number where
    fromRational = toNumber

-- | `Fractional` instance for `BigInt`.
--instance fractionalBigInt :: Fractional BI.BigInt where
--    fromRational n = BI.fromInt (fromMaybe 0 (fromNumber (toNumber n)))
