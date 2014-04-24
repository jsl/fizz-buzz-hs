# Fizz Buzz - a *tested* demonstration in Haskell

This implementation of FizzBuzz is intended to demonstrate basic
Haskell syntax. Additionall, it demonstrates:

* How to write program code and test code in one file (good for
  demonstrations)
* Literate Haskell syntax
* A simple cabal file
* How to write simple tests using Test.Framework, HUnit and
  QuickCheck2

# How to run

To run the test suite, just run `cabal test`.

You can also play with the `fizzBuzz` function using the REPL:

    cabal repl
    Prelude Main> fizzBuzz 3
    "Fizz"

# Author

Justin Leitgeb, <justin@stackbuilders.com>

# License

MIT
