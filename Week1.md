# Week 1
## Basics of Imperative languages
In our first week, we cover the beginnings of Imperative versus Functional Programming.

Imperative programming languages, such as python, involve assigning values by changing the value stored at a particular memory address.
```
a = 3
a = 2
```
In the above example, an object in memory is declared and given the int value of 3. In the next line, this memory address is accessed and modified to now store the value 2.
## Equational Reasoning and Recursion in Haskell
To demonstrate how operations can be turned into a computational model, we can the rules of a factorial, a simple operation that uses recursion to calculate n!.

**fact(0) = 1**<br/>
**fact(n) = n * fact(n-1)**<br/>

This algorithm uses recursion because it requires calling itself to compute the answer. For example, fact(4) would resolve to 4 * fact(3), and fact(3) would resolve similarly to 3 + fact(2). This algorithm will move down the chain until it hits the base case of fact(0), of which we know is 1. The result will be a product of our starting number and all lower numbers after 0. We can rewrite solving fact(4) like following:

**fact(4) = 4 * fact(3)**<br/>
       **= 4 * 3 * fact(2)**<br/>
       **= 4 * 3 * 2 * fact(1)**<br/>
       **= 4 * 3 * 2 * 1 * fact(0)**<br/>
       **= 4 * 3 * 2 * 1 * 1**<br/>
       **= 24**<br/>
*fact(4) = 4 x 3 x 2 x 1 x 1* ( = 24 )

For the entirety of this blog, we will be implementing functions using the programming language Haskell, which is a functional programming language. A few basic notes before starting:
* Haskell files will appear using the file extension of ".hs", such as numbers.hs. These would be directly compiled by Haskell.
* To compile a Haskell file, first run:
```
> ghci
```
in your terminal, then run:
```
> :l myFile.hs
```
* This will attempt to compile and load the specified Haskell file. If successful, your terminal will appear like:
```
*Main>
```
* This means your file has been compiled and loaded, and is now awaiting input. To exit ghci, you hit ctrl + d on your keyboard.

In order to write this algorithm in Haskell, we must follow a few rules for recursion:

* First, to define the function 'fib', we need to indicate the input and output types. We know it takes an int (number we are calculating factorial for) and returns an int (calculated value), so we write our function definition as so:

```
-- fact
fact :: int -> int --this means takes a single int argument and returns an int
```
When writing function definitions, there can only be one return type, so anything before the last type is counted as an input. A function that takes in 2 inputs and returns 1 output would be defined like:
```
-- add
add :: int -> int -> int --takes 2 ints, returns 1 int
```
* Now we must write our base cases. These will represent the end of a recursive path for the algorithm, and returns a finite value. Since our two cases are that input 0 yields 1, we can add:

```
-- Factorial
fact :: int -> int
fact 0 = 1
```
This case states that if the input matches this case, it will go to that case and return the given value (after the '=')

* Now we add the recursive section.
```
-- Factorial
fact :: int -> int
fact 0 = 1
fact n = n * fact(n - 1)
```

With that, our function is complete, and what we have left to do is load and run it. To load the function, save the file (fact.hs for this example) and run Haskell in a terminal. Then use **:l (filename)** to run the function.
```
ghci
:l fact.hs
main>
```
From here, you can provide an input, and it will parse the input through the algorithm and return the final solution.
```
main> 5
120
```

## Lists in Haskell
[]
Represents an empty list, and a list with an item in it (1) can be written as:
1:[]

Items with multiple items can be written in this fashion as:
3:(2:(1:[]))

To separate the list into its individual elements, you can use head() and tail() on the list, which would return the newest and oldest items in the list respectively.
