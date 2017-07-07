-- | A `Num` typeclass.
module Data.Num
  ( class Num
  , negate, abs, signum
--  , fromInt --, toInt
  , fromBigInt --, toBigInt
  ) where

import Prelude (id, ($), (<<<), class Eq, class Semiring, class Ring, class CommutativeRing)
import Data.BigInt as BI
import Data.Int as I
import Data.Maybe (fromMaybe)
import Data.Ord as O
import Data.Ring as R
       
-- | The `Num` class represents general numbers, similar to the Haskell version.
class (Eq a, Semiring a, Ring a, CommutativeRing a) <= Num a where
    negate :: a -> a
    abs :: a -> a
    signum :: a -> a
--    fromInt :: Int -> a
--    toInt :: a -> Int
    fromBigInt :: BI.BigInt -> a
--    toBigInt :: a -> BI.BigInt

-- | `Num` instance for `Int`.
instance numInt :: Num Int where
    negate = R.negate
    abs = O.abs
    signum = O.signum
--    fromInt = id
--    toInt = id
    fromBigInt bi = fromMaybe 0 $ (I.fromNumber <<< BI.toNumber) bi
--    toBigInt i = BI.fromInt i

-- | Probably should not be here because it is decimal. Haskell only puts CDouble here, not Double.
   
-- | `Num` instance for `Number`.
instance numNumber :: Num Number where
    negate = R.negate
    abs = O.abs
    signum = O.signum
--    fromInt i = I.toNumber i
--    toInt n = fromMaybe 0 $ I.fromNumber n
    fromBigInt bi = BI.toNumber bi
--    toBigInt n = BI.fromInt (fromMaybe 0 (I.fromNumber n))

-- | `Num` instance for `BigInt`.
instance numBigInt :: Num BI.BigInt where
    negate = R.negate
    abs = O.abs
    signum = O.signum
    fromBigInt = id
