module Main where

-- Write a function that looks up a hash table value that uses the Mayme monad. Write
-- a hash that stores other hashes, severl levels deep. Use the Mayme monad to retrieve
-- an element for a hash key several levels deep

    data HashKeyVal a = Hash String a deriving (Show)

    hlookup :: String -> [HashKeyVal a] -> Maybe a
    hlookup _ [] = Nothing
    hlookup key ((Hash k v):tail)
        | k == key = Just v
        | otherwise = hlookup key tail

    -- this allows you to do:
    --  hlookup "k1" [(Hash "k1" [(Hash "k12" "v12")]), (Hash "k2" [(Hash "k22" "v22")])]
    -- and you get some monad stuff for free apparently
    --  Just [(Hash "k1" [(Hash "k12" "v12")]), (Hash "k2" [(Hash "k22" "v22")])] >>= hlookup "k2" >>= hlookup "k22"
    -- gives:
    --  Just "v22"




    -- can we wrap into our own monad magic
    rtn (Just x) = x
    x >>== f = f x 
    -- and now we can do:
    --  [(Hash "k1" [(Hash "k12" "v12")]), (Hash "k2" [(Hash "k22" "v22")])] >>== hlookup "k2" >>== rtn
    -- which returns
    --  [Hash "k22" "v22"]
    -- But it doesn't work really as you can't chain them because it would expect hlookup to take a "Just" data type

