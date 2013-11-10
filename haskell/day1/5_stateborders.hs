module Main where

-- |            Tennessee            |
-- |---------------------------------|
-- | Mississippi | Alabama | Georgia |
-- --------------|-------------------|
--               |   Florida         |

-- three colours, red, blue green

colourin :: [String] -> [((String, String), (String, String), (String, String), (String, String), (String, String))]
colourin colours = [
                    (("Tennessee", tennessee),
                     ("Mississippi", mississippi),
                     ("Alabama", alabama),
                     ("Georgia", georgia),
                     ("Florisa", florida) )
                    |
                     tennessee   <- colours,
                     mississippi <- colours,
                     alabama     <- colours,
                     georgia     <- colours,
                     florida     <- colours,
                     tennessee   /= mississippi,
                     tennessee   /= alabama,
                     tennessee   /= georgia,
                     alabama     /= mississippi,
                     alabama     /= georgia,
                     florida     /= alabama,
                     florida     /= georgia
                   ]

states :: Integer -> [((String, String), (String, String), (String, String), (String, String), (String, String))]
states n = colourin ["red", "blue", "green"]
