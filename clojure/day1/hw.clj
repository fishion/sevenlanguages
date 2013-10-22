; homework part 1
(defn big 
    "return boolean describing if length of string 'st' is greater than n"
    [st n]
    (> (count st) n))

; homework part 2
(def col-type-lookup
    {clojure.lang.PersistentList        :list,
     clojure.lang.PersistentArrayMap    :map,
     clojure.lang.PersistentVector      :vector })
(defn
    col-type
    "Given a collection, will lookup and return an atom describing the colleciton type"
    [col]
    (col-type-lookup (class col))
)
