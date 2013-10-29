;;; Sleeping Barber
; Barber shop takes customers
; Customers arrive at random intervals of 10-30 ms
; Barber shop has 3 chairs in waiting room
; Barber shop has 1 barber and 1 barber chair
; if barber chair is empty, cutomer sits there, wakes barber, gets haircut
; if all chairs occupied, new customers turn away
; haircut takes 20 ms
; when haircut finishes, customer leaves
;; Write a multi threaded program to determine how many haircuts a barber can give in 10 seconds.

;(defrecord Person [name])
;(def customer (Person. :customer))
;(def barber (Person. :barber))
;(defmulti say 
;    (fn [who, thing] ( :name who )))
;(defmethod say :customer [who, thing]
;    (println (str "CUSTOMER SAYS : " thing)))
;(defmethod say :barber [who, thing]
;    (println (str "BARBER SAYS : " thing)))

(def chairs (ref {:waiting 0, :beingcut 0}))
(def barb (agent 0))

(defn say [who, thing]
    (println (str who " says : " thing)))

(defn check-chairs [chairs]
    (say "Barber" "checking waiting room")
    (if (and (= (chairs :beingcut) 0)
            (> (chairs :waiting) 0) )
        (do
            (say "Barber" "Next please")
            (dosync(
                (alter chairs assoc :beingcut 1)
                (alter chairs assoc :waiting (- (chairs :waiting) 1))
            )))
        (say "Barber" "nobody there"))
)

(defn cut-hair [customers_done, chairs] 
    (say "Barber" (str "Cutting Hair of customer " (+ customers_done 1)))
    (Thread/sleep 1000)
    (say "Barber" (str "Done cutting Hair of customer " (+ customers_done 1)))
    (say "Barber" (str "And check out my chairs " (@chairs :waiting)) )
    (dosync(
        alter chairs assoc :beingcut 0
    ))
    (+ 1 customers_done)
)

(defn open-shop [barb, chairs]
    ; maybe use a sequence of random numbers to iterate over until shop closes
    (say "Customer" "Do I need a haircut?")
    (Thread/sleep 1000)
    (say "Customer" "OK, I'm going in")
    (dosync (
        if (< (chairs :waiting) 2)
            (alter chairs assoc :waiting (+ (chairs :waiting) 1) )
            (say "Customer" "Meh. Too full.")
    ))
    (check-chairs chairs)
    (send barb cut-hair chairs)
)

(open-shop barb chairs)
