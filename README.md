Existing types
Data.Natural
Data.Number
Data.UInt
Data.Int
Data.Decimal
Type.Quotient (class)
Data.Ratio
Data.Rational

Conversions:

Integer is transfer type
toInteger (Integral)
fromInteger (Num)

Rational is transfer type
toRational (Real)
fromRational (Fractional)

General functions:

Transfer with Integer
fromIntegral (Integral to Num)
integralToNum (no loss)
numToIntegral (loss)

Transfer with Rational (loss)
realToFrac (Real to Fractional) (loss)
fracToReal (Fractional to Real) (no loss)

Discussion:

Constraints can replace inheritance. So >= 0 for unsinged. a - trunc a = a for integral.

This decision is a conceptual one, where you can classify numbers, or make them general and constrain them.
Constratins require proofs, and classes require type checking.
Constraints are more general. It may have faster run time if native types are used afterwards.
Constraints allow arbitrary and flexible...
But, types match existing taxanomy of number types.

It is strange that in Haskell Real only has integral division which does not include
irational numbers when Reals are all rational and irational numbers. So it makes some
sense to break with this.

Rationals are different in that numbers are exact. Do we really care?

Do we want NonFractional? These would just have law extensions on the classes about lossy
and non-lossy conversions, and whether they truncate or round.

Arguements around math library conversions vs classes is similar to constraints vs classes.