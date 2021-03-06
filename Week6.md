# Week 6
## Building an interpreter

So we have a data type NN defined as:
```
data NN = O | S NN
  deriving (Show, Eq)
```

... and a few basic functions such as:
```
isEven :: NN -> Bool
isEven O = True
isEven (S O) = False
isEven (S (S O)) = isEven n

```
* We now want to build an interpreter that can read arithmetic operators such as "+", "-", and "*" for add, subtract, and multiply respectively. Previously in week 4, we talked about how to create a basic configuration file. Let's say we write ours as follows:
```
Plus. Exp ::= Exp "+" Exp1 ;
Times. Exp1 ::= Exp1 "*" Exp2 ;
Minus. Exp1 ::= Exp1 "-" Exp2 ;
Num. Exp2 ::= Integer ;

coercions Exp 2 ;
```
* This will provide for our three operations of adding, subtracting, and multiplying, as well as recognition of the Integer. If we run this using bnfc, a number of files will be generated built from these operations. One notable one is called AbsNumbers.hs, which we will need to build our Interpreter. If done correctly, our configuration file will generate an AbsNumbers.hs file that looks like:
```
module AbsNumbers where

-- Haskell module generated by the BNF converter


data Exp
    = Plus Exp Exp
    | Times Exp Exp
    | Minus Exp Exp
  deriving (Eq, Ord, Show, Read)
```
Now we can build the interpreter. The first 2 lines specify the name of the file (interpreter) and where to pull the declarations of our operations:
```
module Interpreter where

import AbsNumbers
```
Next we want to declare the type eval, which will take an expression and yield and interger value:
```
eval :: Exp -> Integer
```
And finally we define our operations (including the num):
```
eval (Num n) = n
eval (Plus n m) = (eval n) + (eval m)
eval (Times n m) = (eval n) * (eval m)
eval (Minus e1 e2) = (eval e1) - (eval e2)
```
This will allow our calculate to read an input such as "Plus 1 2" and parse it as "1 + 2", yielding 3.
* It should be noted that these specific definitions work only with type number values (not newly defined types) because Haskell's "+", "*", and "-" operators work with type number values.

And thus, we have our basic interpreter.
