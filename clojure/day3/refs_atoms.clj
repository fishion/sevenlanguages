; references
(def movie (ref "Star Wars"))
; can be accessed as
; @movie
; then altered in transaction like this
(dosync (alter movie str " : The Empire Strikes Back"))
; or reset entirely like this
(dosync (ref-set movie "Star Wars : Revenge of the Sith"))

; atoms
(def danger (atom "split at your own risk"))
; change the atom entirely
(reset! danger "split with impunity")

; another atom example where you mutate the atom instead
(def top-sellers (atom []))
(swap! top-sellers conj {:title "seven languages" :author "Tate"})
(swap! top-sellers conj {:title "Another book" :author "Some guy"})

; an atom cache
( defn accreate [] (atom {}) )
( defn acget [cache key] (@cache key) )
( defn acset
    ([cache valmap] (swap! cache merge valmap))
    ([cache key val] (swap! cache assoc key val))
)
; use it
(def ac (accreate))
(acset ac :quote "Use the force, Luke")
(println (str "cached item: " (acget ac :quote)))
