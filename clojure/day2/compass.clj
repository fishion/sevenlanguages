
(defprotocol Compass
    (direction [c])
    (left [c])
    (right [c])
)

; this variable and function function don't seem very well encapsulated to me...
(def directions [:north :east :south :west])
(defn turn [base amount]
    (rem (+ base amount) (count directions) )
)


;;; Define the class from the above implementation
(defrecord SimpleCompass [bearing]
    Compass

    (direction [_] (directions bearing))
    (left [_] (SimpleCompass. (turn bearing 3)))
    (right [_] (SimpleCompass. (turn bearing 1)))

    ; (str object)
    Object (toString [this] (str "[" (direction this) "]"))
)
