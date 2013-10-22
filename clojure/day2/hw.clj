; implementing "unless" function with "else" block as macro 

(defmacro unless [test block & [elseblock]]
    (list 'if (list 'not test) block elseblock)
)

; define a record which implements a protocol
(defprotocol Ball
    (inflate [c])
    (kick [c])
    (timepasses [c])
    (jumpon [c])
)

(defrecord Beachball [inflation]
    Ball

    (inflate [_] (
        if (> (+ inflation 1) 2)
            (str "BANG")
            (Beachball. (+ inflation 1))
    ))
    (kick [_] (
        str "boing!"
    ))
    (timepasses [_] (
        if (> inflation 0)
            (Beachball. (- inflation 1))
    ))
    (jumpon [this] (
        if (> inflation 0)
            (str "BANG")
            this
    ))
)
