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
To demonstrate how operations can be turned into a computational model, we can look at the Fibonacci sequence and its rules:

**fib(0) = 0**
**fib(1) = 1**
**fib(n + 2) = fib(n + 1) + fib(n)**

This algorithm uses recursion because it requires calling itself to compute the answer. For example, fib(5) would resolve to fib(4) + fib(3), and both of those terms will resolve in the same way until we reach the normal form, which should consist of adding a number of 1s and 0s (as specified in the first two base cases. We can rewrite solving fib(5) like following:

**fib(5) = fib(4) + fib(3)**<br/>
       **= fib(4) + fib(2) + fib(1)**<br/>
       **= fib(4) + fib(2) + 1**<br/>
       **= fib(4) + fib(1) + fib(0) + 1**<br/>
       **= fib(4) + (1 + 0) + 1**<br/>
       **= fib(3) + fib(2) + 2**<br/>
       **= fib(3) + fib(1) + fib(0) + 2**<br/>
       **= fib(3) + (1 + 0) + 2**<br/>
       **= fib(2) + fib(1) + 3**<br/>
       **= fib(2) + 1 + 3**<br/>
       **= fib(1) + fib(0) + 4**<br/>
       **= 1 + 0 + 4**<br/>
       **= 5**<br/>
*fib = 1, 1, 2, 3, 5, 8, (...)* (term 5 = 5)

In order to write this algorithm in Haskell, we must follow a few rules for recursion:

* First, to define the function 'fib', we need to indicate the input and output types. We know it takes an int (position in sequence) and returns an int (value at that position), so we write our function definition as so:

```
-- fib
fib :: int -> int --this means takes a single int argument and returns an int
```
When writing function definitions, there can only be one return type, so anything before the last type is counted as an input. A function that takes in 2 inputs and returns 1 output would be defined like:
```
-- add
add :: int -> int -> int --takes 2 ints, returns 1 int
```
* Now we must write our base cases. These will represent the end of a recursive path for the algorithm, and returns a finite value. Since our two cases are that input 0 yields 0, and input 1 yields 1, we can add:

```
-- Fibonacci
fib :: int -> int
fib 0 = 0
fib 1 = 1
```
These 2 cases state that if the input matches one of those cases, it will go to that case and return the given value (after the '=')

* Now we add the recursive section.
```
-- Fibonacci
fib :: int -> int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)
```

With that, our function is complete, and what we have left to do is load and run it. To load the function, save the file (fib.hs for this example) and run Haskell in a terminal. Then use **:l (filename)** to run the function.
```
ghci
:l fib.hs
main>
```
From here, you can provide an input, and it will parse the input through the algorithm and return the final solution.
```
main> 5
5
```
