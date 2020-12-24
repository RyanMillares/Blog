# Week 9
## Monads
Monads are a sneaky type class that uses the `Maybe` data type to handle cases where something such as an input of "zero" could result in an error.
* The `Maybe` data type is a type of data that can be constructed such:
```
data Maybe a = Nothing | Just a
```
This means that if our data is of type "Maybe a", then its value can either be Nothing, or "Just a". It is called "maybe" because it could return nothing at all, or maybe something. This will allow us to make functions that could, for example, handle zero as a denominator:

```
nozerodiv :: Int -> Int -> Maybe Int
nozerodiv _ 0 = Nothing
nozerodiv n m = Just (n `div` m)
```

```
> nozerodiv 5 0
Nothing
```


* The monad class also gives us the ability to use two new functions, `>>` and `return`. `>>` is a way to modify data in a container, and `return` lets us wrap some data in this container.
