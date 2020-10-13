# Week 3
## Starting a Haskell Calculator
* One of the first components needed for a calculator is a library of arithmetic operations to carry out on inputs. To start things off, we want our calculator to focus only on Natural numbers. These include all non-negative integers and zero, as negative numbers would make things confusing as hell.

* To define our Natural Number data type, we must identify first the base value and successor notations. For natural numbers, O represents 0, and successors are done using S. As a result, our datatype definition will be as follows:
```
data NN = O | S NN
  deriving (Eq, Show)
```

* Next we will want to add basic operations, the first two being addition and multiplication. To write these in Haskell, we must write recursively. Thankfully, we can use the basic properties of addition and multiplication to determine how to write these.

## Addition
* First we must define our function for Addition for Natural Numbers. It takes 2 natural number inputs and yields 1 nn output, so our definition will appear as:
```
addN :: NN -> NN -> NN
```

* Now we identify the base case. For addition, this is the identity, where adding zero to a number results in that number. By adding this, we get:
```
addN :: NN -> NN -> NN
addN O n = n
```

* Lastly, we add our induction case with recursion. To do this, we can use the associative and communitative properties of addition to get the expression of:
**((n + 1) + m) = 1 + (n + m)**

Because we can skip addition by 1 by using successor notation, this can further be rewritten into:
**((S n) + m) = S (n + m)**

When converting this expression to Haskell syntax, we add the line to our function and get our finished definition for addition:
```
addN :: NN -> NN -> NN
addN O n = n
addN (S n) m = S (addN n m)
```
## Multiplication
* Same as before, we must first define our function, which looks virtually identical to addition in terms of input and output types:
```
multN :: NN -> NN -> NN
```

* Again, now we must define the base cases. However, multiplication contains both an identity and zero property when involving natural numbers. Multiplying a number by zero yields zero, and multiplying it by 1 yields itself. Since we cannot express 1 as a straightforward natural number, we write it as (S O), or successor of zero:
```
multN :: NN -> NN -> NN
multN O n = O
multN (S O) n = n
```

* Finally, we define the induction case using recursion. To accomplish this, we will start with a similar method as for addition, but instead use the distributive property to expand it. Starting with (n + 1) * m, we can rewrite as m(n + 1), or **= mn + m**. Since we have already defined addition previously, we can use it here. Rewriting the input into Haskell gives us
**multN (S n) m**
and the output **= (multN n m) + m**, or **addN m (multN n m)**, resulting in:
```
multN :: NN -> NN -> NN
multN O n = O
multN (S O) n = n
multN (S n) m = addN m (multN n m)
```

## Creating a language for arithmetic expressions
* In order to use the calculator at all, we need to create a way for our calcultor to interpret input as actual function expressions. First we must define a datatype for Expressions known as Exp. We want the user to use "plus" and "times" instead of mult and add because of ease in understanding.
```
data Exp = Num Int | Plus Exp Exp | Times Exp Exp
```

* Now we must declare all the other language terms and how they use our library of functions to carry out arithmetic:
```
eval :: Exp -> NN
```

* Now we define converting inputted numbers as expressions for the calculator to read as values. This includes the base case of zero and all other natural numbers done by recursion:
```
eval :: Exp -> NN
eval (Num 0) = O
eval (Num n) = S(eval (Num (n-1)))
```

* Finally, we add the operations that will use our library of functions:
```
eval :: Exp -> NN
eval (Num 0) = O
eval (Num n) = S(eval (Num (n-1)))
eval (Plus n m) = add (eval n) (eval m)
eval (Times n m) = mult (eval n) (eval m)
```
