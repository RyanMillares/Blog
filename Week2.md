# Week 2
## Syntax in Haskell
Evaluating arithmetic operations in Haskell is all about trees of expressions. Syntax in Haskell works similarly to a sort of tree design. Let's say you have two functions, add and mult, and three numbers: x, y, and z. We want to write out (x + y * z) in Haskell syntax.

* First, we need to break down how to write a function. For example, add function is likely defined with:
```
add :: int -> int -> int
```
(...) meaning the function takes 2 int inputs and returns 1 int output. The way we write this in code would be (x + y) = **add x y**. Note that the function name comes first followed by the inputs.

* Next, we need to know what order to perform the operations. By order of operations, we know we have to multiply y and z before adding x, so we can rewrite our expression as:

(x + (y * z))

* Finally, we substitute our function names. First we put in mult. Since we know (y * z) is the result of **mult y z**, this brings our expression to:

(x + (mult y z))

* Assuming mult is defined as
```
mult :: int -> int -> int
```
(...), we know that mult returns an int output, while add takes in 2 int inputs. Since our first input is x, we know the second output will be the yield of the mult function, allowing us to rewrite the expression as:

(add x (mult y z))

We can see this done by creating a tree diagram to visualize this process:

```
              add     
               |
          ---------
          |       |
          x      mult
                  |
                ------
                |     |
                y     z
```
