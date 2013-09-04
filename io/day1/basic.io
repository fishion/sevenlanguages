#!/usr/local/bin/io

Zoidburg := Object clone
Zoidburg shout := method("SHOUTING!" println)
Zoidburg dowhatIsay := method(action,
    "OK, I will : " print
    perform(action)
)

Zoidburg shout
Zoidburg dowhatIsay("shout")
