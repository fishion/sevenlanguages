module Main where

-- got the basics of this really quickly but struggled with sorting tuples for a while
-- until I started putting method type declarations in and realised the problem with
-- the default comparison item type

getbest (x,_,_) = x
getremain (_,x,_) = x
getfunc (_,_,x) = x

extract x (0, [], func) = (x, [], func)
extract x acc =
    if fun x best
    then (x, best:rem, fun )
    else (best, x:rem, fun )
    where best = getbest acc
          rem = getremain acc
          fun = getfunc acc

sort _ [] = []
sort func list = chosen:sort func rest
    where extracted = foldr extract (0, [], func) list
          chosen = getbest extracted
          rest = getremain extracted

--   call like
-- sort (\x y -> x < y) [1,2,4,3]
--   The following also work, but only if you change the shape of the default biggest item in the fold+extract
-- sort (\x y -> fst x > fst y) [(1,2), (5,4), (2,8)]
-- sort (\(h:t) (h2:t2) -> h > h2) [[1.0, 2.0], [5, 4], [2, 8]]


-- me extending the other sort method I found when cheating
-- this is actually way better and more duck-typey so you don't have to change
cheatsort _ [] = []
cheatsort fun (h:t) = (cheatsort fun lt) ++ [h] ++ (cheatsort fun gt)
    where lt = filter (\x -> fun x h) t
          gt = filter (\x -> not (fun x h)) t
