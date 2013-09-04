#!/usr/local/bin/io

Number coreDiv := Number getSlot("/")
Number / := method(denom, if(denom == 0, 0, call target coreDiv(denom)))

# tests
(5 / 1  == 5)   println
(5 / 0  == 0)   println
(5 / -1 == -5)  println
(5 / 2  == 2.5) println
