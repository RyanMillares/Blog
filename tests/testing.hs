data NN = O | S NN
    deriving (Eq,Show)

zeroNN :: NN -> NN
zeroNN O = O
zeroNN (S n) = O


isEven :: NN -> Bool
isEven O = True
isEven (S (S n)) = isEven n
