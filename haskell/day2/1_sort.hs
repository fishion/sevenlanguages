module Main where

-- this is the first way I managed to do it
getlargest list = foldr (\x acc -> if x > acc then x else acc ) h list
    where (h:t) = list
stripfromlist x (h:t) = if x == h then t else h:stripfromlist x t
getstripsort [] = []
getstripsort list = largest:getstripsort rest
    where largest = getlargest list
          rest = stripfromlist largest list

-- but this is the way I first tried to do it. It just took me longer to figure out
-- it's a bit longer, but seems more elegent. Or maybe it just seems more "functional"

extract x (0, []) = (x, [])
extract x acc =
    if x > fst acc
    then (x, fst acc:snd acc)
    else (fst acc, x:snd acc)

foldsort [] = []
foldsort list = biggest:foldsort rest
    where extracted = foldr extract (0, []) list
          biggest = fst extracted
          rest = snd extracted
-- there's actually problems with this method. Like how it recognises the first element
-- is flawed

-- here's another way I found when I cheated and looked it up
cheatsort [] = []
cheatsort (h:t) = (cheatsort lt) ++ [h] ++ (cheatsort gt)
    where lt = filter (< h) t
          gt = filter (\x -> not (x < h)) t
