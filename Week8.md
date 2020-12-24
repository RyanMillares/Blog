# Week 8
## Connections between functional, imperative, and ARS
It is quite common for concepts to have their own way of being written across different types of languages. For example, consider Haskell, a functional language, C, an imperative language, and an ARS, a rewrite system. Despite all three working so differently, it's possible to translate an algorithm from one to another.

Consider multiplication. It is possible to write an algorithm for natural number multiplication in all three languages:
* Haskell (functional):
```
data NN = O | S NN
    deriving (Eq,Show)

-- addition
add :: NN -> NN -> NN
add O n = n
add (S n) m = S (add n m)

-- multiplication using recursive addition
mult :: NN -> NN -> NN
mult O n = O
mult (S O) n = n
mult (S n) m = add m (mult n m)
```


* C (imperative):
```
int mult(int n, int m){
  if(n < 0 || m < 0){
    printf("Error: Nonpositive number");
    return -1;
  }
  else{
    if(n == 0){
      return 0;
    }
    else if(n == 1){
      return m;
    }
    else{
      return (m + mult(n-1, m));
    }
  }
}
```

* ARS (rewrite rules):
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
