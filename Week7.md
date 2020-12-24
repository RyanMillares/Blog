# Week 7
## Abstract Reduction Systems

* An Abstract Reduction System (ARS) is defined as a pair (A, ->), where A is a set and -> is a reflexive and transitive relation on that set -> C A x A. This ARS can be used to represent a series of computations on a set.
* For example, let's define an ARS on a set containing a string of "1"s and "0"s. Our ARS will have to make sure all "0"s are on the left, and all "1"s are on the right. A simple ARS to accomplish this would be:
```
10 -> 01
```
Simply put, our ARS consists of one rule: where there is any instance of "10" in the inputted string, you can change it to "01". Following this ARS will allow us to sort the string "10001" in the following steps:
```
10001 -> 01001
      -> 00101
      -> 00011
```
* Once "00011" is hit, there is no longer any patterns in our string that fits a rule in our ARS, therefore it can no longer be reduced. Thus, we can say "00011" is the **normal form** of the string "00011".

An ARS can have more than one rule. If our string consisted of "1"s, "0"s, and "2"s, and we wanted to order our string from least to greatest values, our ARS would look something like:
```
10 -> 01
21 -> 12
20 -> 02
```
As their are multiple rules, we do not have to follow them from top-to-bottom. As a result, our ARS can lead to different "branches" from a starting string, depending on which rule we follow:
```
              10122
            /       \
       10212           -->  01122
     /       \      /
10221         01212
    \       /
      01221
```
As shown in our diagram, no matter what order the rules are followed, the resulting branches will always join back together, meaning our ARS in **confluent**. In addition, we can see that our ARS will always result in the same normal form for this input string. There also is no possible way for the ARS to get caught in a loop and will always eventually reach a normal form, meaning our ARS is **terminating**.

## Some fun uses
In the previous example, we showed that an ARS can be used to sort a string of numbers. Our rules are very straightforward: for any instance that a number is greater than the number to its right, swap their order. However, it is possible to carry out basic arithmetic using an ARS. Consider the following rules for nonzero multiplication:
* A number times one is itself.
* A number times the successor of another number is equal to the sum of the first number and the product of the both numbers.
Or in numbers:
```
x * 1 = x
x * (y + 1) = x + (x * y)
```
It is possible to convert these two rules into a simple ARS that would allow us to multiply the length of a string of "a"s and the length of a string of "b"s and have a normal form consisting of a string of "c"s whose length is equal to their product. Let us declare our ARS (A, ->) as working on a string whose format is $A$B$, where A and B are strings of a and b of arbitrary length, and $ is simply a character meant to separate the two strings. We can perform multiplication using the following steps:
```
* Step 1: If there are more than 1 b, go to step 2. If there is only 1, step 5.
* Step 2: Remove 1 b.
* Step 3: Add a "c" for every "a" in the string.
* Step 4: Go to step 1
* Step 5: Remove the last b and convert all remaining "a" to "c".
```
While it is easier to type out these instructions, it is slightly harder to implement them using a rewrite system. Therefore, the following tips will be used:
* "A$BB" can be used to check for more than 1 b, and "$B$" will be used to check for only 1 b, since the dollar signs separate the strings and are at either end of the string.
* Since we want to only add a "c" once for each a, the rules "ae -> eca" and "ce -> ec" allows the letter "e" to move through the line of "a"s and add a "c" for each one it comes across before moving along.
* To convert "a" to "c" at the end without the ARS performing this step early, we will introduce the letter "d" that will scan through the string following: "ad -> dc" and "cd -> dc".
* In order to remove the "e" and "d" scanners once they are finished, we can use the rules "$c -> $" and "$d -> $" to have the ARS remove the e and d as soon as it hits the leftmost character of the string.

Using these rules, we can create the following rewrite system to match our steps:
```
a$bb -> ae$b  -- if more than 1 b, remove 1 b
ae -> eca     -- for each a, add a c
ce -> ec      -- let scanner skip over "c"s
$e -> $       -- remove scanning "e"

$b$ -> d      -- if only 1 b, remove b
ad -> dc      -- convert a to c
cd -> dc      -- let scanner skip over "c"s
$d ->         -- final scanner yeets itself and the last $, leaving the final normal form.
```
Following this ARS, we can compute "1 x 2" using the string $a$bb$:
```
$a$bb$  -- 1 * 2
$ac$b$
$eca$b$
$ca$b$
$cad
$cdc
$dcc
cc    --  = 2
```
