# Week 4

* Now that we have our basic library of operations, we can now allow our calculator to parse symbols and read them as mathematic operations, such as "+" and "*" for adding and multiplying. Compared to the usual .hs file, this will be saved as numbers.cf, and compiling with bnfc will generate a number of important files that we may or may not cover later.

## Compiling with bnfc
* To compile with bnfc, you MUST be in a linux environment and have the haskell platform installed. Instructions can be found here at: https://github.com/alexhkurz/programming-languages-2020/blob/master/BNFC-installation.md (will try to word this in my own words later)

## Parse generator in bnfc
* Now with the compiler installed, we need to create our configuration file. Our last code showed three expressions being used: Num, Plus, and Times:
```
eval :: Exp -> NN
eval (Num 0) = O
eval (Num n) = S(eval (Num (n-1)))
eval (Plus n m) = add (eval n) (eval m)
eval (Times n m) = mult (eval n) (eval m)
```

* When we write our cf, we need to keep in mind the order of which we write the lines, to ensure it follows order of operations. Since the first step would be to evaluate numbers, the *last* line will be:
```
Num.  Exp2 ::= NN ;
```
The next step in order of operations is to multiply, so on top of our Num. using a lower number Exp, we add on:
```
Times. Exp1 ::= Exp1 "*" Exp2 ;
Num.  Exp2 ::= NN ;
```
It is important to note that the asterisk is surrounded by quotation marks. This is because right now our calculator does not know what an asterisk means. To resolve this, we wrap it in "" to identify it as a string so it can associate the appearance of the asterisk with multiplication. Same goes with addition and the plus sign, which is placed above multiplication as it follows it in the order of operations:
```
Plus. Exp ::= Exp "+" Exp1 ;
Times. Exp1 ::= Exp1 "*" Exp2 ;
Num. Exp2 = NN ;
```

Finally we slap coercions on it, idk why yet
```
Plus. Exp ::= Exp "+" Exp1 ;
Times. Exp1 ::= Exp1 "*" Exp2 ;
Num. Exp2 = NN ;

coercions Exp2 ;
```
