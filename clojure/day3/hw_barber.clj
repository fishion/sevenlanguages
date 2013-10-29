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

; So this is a Person type and multimethods for saying things for output
(defrecord Person [name])
(def customer (Person. :Customer))
(def barber (Person. :Barber))
(defmulti say 
    (fn [who, thing] ( :name who )))
(defmethod say :Customer [who, thing]
    (println (str "CUSTOMER SAYS : " thing)))
(defmethod say :Barber [who, thing]
    (println (str "BARBER SAYS : " thing)))

; set up a reference and a barber agent for async working
(def chairs (ref {:waiting 0, :beingcut 0}))
(def barb (agent 0))


(defn cut-hair [customers_done, chairs]
    (say barber "checking waiting room")
    (if (and (= (chairs :beingcut) 0)
            (> (chairs :waiting) 0) )
        (do
            (say barber "Next please")
            (dosync(
                (alter chairs assoc :beingcut 1)
                (alter chairs assoc :waiting (- (chairs :waiting) 1))
            ))
            (say barber (str "Cutting Hair of customer " (+ customers_done 1)))
            (Thread/sleep 1000)
            (say barber (str "Done cutting Hair of customer " (+ customers_done 1)))
            (say barber (str "And check out my chairs " (@chairs :waiting)) )
            (dosync(
                alter chairs assoc :beingcut (- (chairs :beingcut) 1)
            ))
            (+ 1 customers_done))
        (do 
            (say barber "nobody there")
            customers_done))
)

(defn open-shop [barb, chairs]
    ; maybe use a sequence of random numbers to iterate over until shop closes
    (say customer "Do I need a haircut?")
    (Thread/sleep 1000)
    (say customer "OK, I'm going in")
    (dosync (
        if (< (chairs :waiting) 2)
            (alter chairs assoc :waiting (+ (chairs :waiting) 1) )
            (say customer "Meh. Too full.")
    ))
    (send barb cut-hair chairs)
    (send barb cut-hair chairs)
)

; open shop
(open-shop barb chairs)
