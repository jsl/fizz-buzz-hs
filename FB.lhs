This program implements the FizzBuzz algorithm. Further, it is intended to
demonstrate:

* How to put tests and code in a single Haskell file
* Literate Haskell (comments are the rule, rather than the exception)
* Testing with HUnit and QuickCheck

The basic rules of FizzBuzz (for Haskell) are:

* Multiples of 3 return "Fizz"
* Multiples of 5 return "Buzz"
* Multiples of 3 and 5 return "FizzBuzz"
* For all other Integers, return a String representation of the Integer.


We need to put this into a Main module for the Haskell executable.

> module Main where

We then need to import several modules so that the tests will function.

> import Test.Framework (defaultMain, defaultMainWithOpts, testGroup)
> import Test.Framework.Options (TestOptions, TestOptions'(..))
> import Test.Framework.Runners.Options (RunnerOptions, RunnerOptions'(..))
> import Test.Framework.Providers.HUnit
> import Test.Framework.Providers.QuickCheck2 (testProperty)

> import Test.QuickCheck
> import Test.HUnit

Definitions of all tests that will be run for this program:

> tests =
>     [
>      testGroup "Program examples" [
>                       testCase "number 3"  test_number_3
>                     , testCase "number 5"  test_number_5
>                     , testCase "number 15" test_number_15
>                     , testCase "number 8"  test_number_8
>                    ],
>      testGroup "Program properties" [
>                       testProperty "Fizz"     prop_fizz
>                     , testProperty "Buzz"     prop_buzz
>                     , testProperty "FizzBuzz" prop_fizz_buzz
>                     , testProperty "Other"    prop_other
>                    ]
>     ]

Unit tests:

> test_number_3  = assertEqual "for (toFizzBuzz 3),"  "Fizz"     (fizzBuzz 3)
> test_number_5  = assertEqual "for (toFizzBuzz 5),"  "Buzz"     (fizzBuzz 5)
> test_number_15 = assertEqual "for (toFizzBuzz 15)," "FizzBuzz" (fizzBuzz 15)
> test_number_8  = assertEqual "for (toFizzBuzz 8),"  "8"        (fizzBuzz 8)


Property tests:

Integers that are able to be multiplied by 3 and not 5 return "Fizz."
There should be no other Integers that return "Fizz."

> prop_fizz n = if n `mod` 3 == 0 && n `mod` 5 /= 0 then
>                   result == "Fizz"
>               else
>                   result /= "Fizz"
>     where types  = (n :: Integer)
>           result = fizzBuzz n

Integers that are able to be multiplied by 5 and not 3 return "Buzz."
There should be no other Integers that return "Buzz."

> prop_buzz n = if n `mod` 5 == 0 && n `mod` 3 /= 0 then
>                   result == "Buzz"
>               else
>                   result /= "Buzz"
>     where types  = (n :: Integer)
>           result = fizzBuzz n

Multiples of 3 and 5 return "FizzBuzz." There should be no other Integers
that return FizzBuzz.

> prop_fizz_buzz n = if n `mod` 3 == 0 && n `mod` 5 == 0 then
>                   result == "FizzBuzz"
>               else
>                   result /= "FizzBuzz"
>     where types  = (n :: Integer)
>           result = fizzBuzz n

Any other Integer input should return the String representation of the Integer.

> prop_other n = if n `mod` 3 /= 0 && n `mod` 5 /= 0 then
>                   result == show n
>               else
>                   result /= show n
>     where types  = (n :: Integer)
>           result = fizzBuzz n


Implements FizzBuzz logic per the properties asserted above. We use pattern-
matching to figure out the correct result.

> fizzBuzz :: Integer -> String
> fizzBuzz n
>     | n `mod` 3 == 0 && n `mod` 5 == 0 = "FizzBuzz"
>     | n `mod` 3 == 0 = "Fizz"
>     | n `mod` 5 == 0 = "Buzz"
>     | otherwise      = show n


Default behavior of this program is to run the tests:

> main = defaultMain tests
