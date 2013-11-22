module Main where

    data Suit = Hearts | Clubs | Diamonds | Spades deriving (Show)
    data Rank = Ten | Jack | Queen | King | Ace deriving (Show)
    type Card = (Rank, Suit)
    type Hand = [Card]

    value :: Rank -> Integer
    value Ten = 1
    value Jack = 3
    value Queen = 3
    value King = 4
    value Ace = 5

    cardValue :: Card -> Integer
    cardValue (r, s) = value r
