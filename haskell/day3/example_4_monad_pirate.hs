module Main where
    data Position t = Position t deriving (Show)

    crawl (Position p) = Position (p + 1)
    stagger (Position p) = Position (p + 2)

    rtn x = x
    x >>== f = f x

-- eg
-- let (Position p) = (Position 4) >>== stagger >>== crawl >>== stagger

-- or use in function:
    treasureMap pos = pos >>==
                    stagger >>==
                    stagger >>==
                    crawl >>==
                     rtn
