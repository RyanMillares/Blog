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
* Once "00011" is hit, there is no longer any patterns in our string that fits a rule in our ARS, therefore it can no longer be reduced. Thus, we can say "00011" is the **normal form** of the string "00011"
