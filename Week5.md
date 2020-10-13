# Week 5
## Analyzing Errors in Haskell
## Improper syntax
* Writing in Haskell requires getting syntax correct as the compiler is very sensitive to separations of terms. For example, take a function int2NN, that converts an int to natural number. Let's say we write the function definition as follows:
```
int2nn:: int -> NN
int2nn 0 = O
int2nn n = if n > -1 then S (int2nn n-1) else error "Cannot convert negative int to NN"
```
When we break down the function definition, we get:
* the function int2nn takes 1 int as input and returns 1 Natural Number as output
* if the input is 0, return O
* if the input is any non-negative int, return the Succesor of the int2nn return of the int value 1 less than the input.

These rules should help procedurely convert an int such as 3 to a natural number like S(S(S(O))).
However, if we compile this function (assuming we already defined NN previously, we will get an error:

* No instance for (Num NN) arising from a use of '-'
* In the first argument of 'S' namely (int2nn n-1)

What does this mean? When we reexamine our code and error, we will find that the error lies in our use of the minus sign in the expression (int2nn n-1)
The reason for this error is because our function is unable to read 'n-1' as a proper int input, and tries to separate the terms. To solve this error, we wrap the expression in paranthesis to let the function know the expression (n-1) is a single value and to carry out the operation after calculating n-1.
```
int2nn:: int -> NN
int2nn 0 = O
int2nn n = if n > -1 then S (int2nn (n-1)) else error "Cannot convert negative int to NN"
```
## Mismatching data types
* Let's say we also rewrite our int2nn function as i2n as follows:
```
data NN = O | S NN
  deriving (Show, Eq)

i2n:: int -> NN
i2n 0 = O
i2n n = S i2n (n-1) 
```
This code should perform the same as the previous version of int2nn, minus error checking negative input, however compiling this will result in an error:
* Couldn't match expected type 'NN' with actual type 'Int -> NN'
* Probable cause: 'i2n' is applied to too few arguments.

There are a two things to notice: first, the function is trying to pass a data type of 'Int -> NN', which would be confusing at first because as far as we know, we're trying to pass in a single datatype, not a conversion type. Second, it tells us we provided too few arguments to i2n even though we have (n-1) identified as the input term. What's going on here?

This is a great example of how crucial it is to properly use paranthesis in Haskell. In our line **S i2n (n-1)**, our code looks at S and recognizes it as successor notation, which as defined in our NN definition, takes in 1 NN input. As a result, our code looks to the immediate next term and sees 'i2n'. Once it finds it, it stops searching and tries to evaluate **(S i2n) (n - 1)**. This will, of course, fail because:
* i2n is defined as type int -> NN. While as an operation it takes input and returns one NN, trying to pass the function itself as input would result in detecting the function definition as its data type, and this fails because it reads the type as 'int -> NN' when it's looking for a NN input, resulting in a type mismatch error.
* Because our i2n is now cut off from its input (n-1), it no longer has any input, and thus results in a 'too few arguments' error.

