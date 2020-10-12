# Week 1
# # Basics of Imperative languages
In our first week, we cover the beginnings of Imperative versus Functional Programming.

Imperative programming languages, such as python, involve assigning values by changing the value stored at a particular memory address.
```
a = 3
a = 2
```
In the above example, an object in memory is declared and given the int value of 3. In the next line, this memory address is accessed and modified to now store the value 2.
# # Equational Reasoning and Recursion in Haskell
To demonstrate how operations can be turned into a computational model, we can look at the Fibonacci sequence and its rules:

**fib(0) = 0**
**fib(1) = 1**
**fib(n + 2) = fib(n + 1) + fib(n)**

This algorithm uses recursion because it requires calling itself to compute the answer. For example, fib(5) would resolve to fib(4) + fib(3), and both of those terms will resolve in the same way until we reach the normal form, which should consist of adding a number of 1s and 0s (as specified in the first two base cases. We can rewrite solving fib(5) like following:

**fib(5) = fib(4) + fib(3)**
       **= fib(4) + fib(2) + fib(1)**
       **= fib(4) + fib(2) + 1**
       **= fib(4) + fib(1) + fib(0) + 1**
       **= fib(4) + (1 + 0) + 1**
       **= fib(3) + fib(2) + 2**
       **= fib(3) + fib(1) + fib(0) + 2**
       **= fib(3) + (1 + 0) + 2**
       **= fib(2) + fib(1) + 3**
       **= fib(2) + 1 + 3**
       **= fib(1) + fib(0) + 4**
       **= 1 + 0 + 4**
       **= 5**
*fib = 1, 1, 2, 3, 5, 8, (...)* (term 5 = 5)
