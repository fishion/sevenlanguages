; define an agent with a value of 1
(def tribbles (agent 1))
; send it an anonymous function
(send tribbles #(* 2 %))

; do it again with a deliberate slowness to the function
(def wibble (agent 1))
(send wibble
    #(do
        (Thread/sleep 5000)
        (* 2 %)
    )
)
; after 5 seconds @wibble will be 2 in the console.


; futures
(def finer-things (future (Thread/sleep 5000) "take time"))
; if you immediately look at @finer-things after loading this file in the console...
; (load-file "agents_futures.clj")
; @finer-things
; ... you'll see it blocks before the result is output
