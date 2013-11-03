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

; set up some variables
(def waitingchairs 3)
(def mininterval 10)
(def maxinterval 30)
(def intervaldelta (- maxinterval mininterval))
(def haircuttime 20)
(def openinghours 10000)

; set up a reference and a barber agent for async working
(def chairs (ref {:waiting 0, :beingcut 0}))
(def barb (agent 0))


(defn cut-hair [customers_done, chairs]
    (if (and (= (chairs :beingcut) 0)
            (> (chairs :waiting) 0) )
        (do
            (say barber "Next please")
            (dosync(
                (alter chairs assoc :waiting (- (chairs :waiting) 1))
                (alter chairs assoc :beingcut 1)
            ))
            (say barber (str "Cutting Hair of customer " (+ customers_done 1)))
            (Thread/sleep haircuttime)
            (say barber (str "Done cutting Hair of customer " (+ customers_done 1)))
            (dosync(
                alter chairs assoc :beingcut 0
            ))
            (cut-hair (+ 1 customers_done) chairs))
        (do 
            (say barber "nobody there")
            customers_done))
)

(defn open-shop [barb, chairs, timer]
    ; alternatively use a sequence of random numbers to iterate over until shop closes
    (def n (+ mininterval (rand intervaldelta)))
    (Thread/sleep n)
    (say customer (str "OK, I waited " (/ n 1000) " seconds and now I'm going in"))
    (dosync (
        if (< (chairs :waiting) waitingchairs)
            (alter chairs assoc :waiting (+ (chairs :waiting) 1) )
            (say customer "Meh. Too full.")
    ))
    (if (= (chairs :beingcut) 0)
        (send barb cut-hair chairs)
    )
    (if (< ( + n timer ) openinghours)
        ( open-shop barb chairs (+ n timer) ) )
    str "Shop closed"
)

; open shop
(open-shop barb chairs 0)
