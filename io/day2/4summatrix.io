#!/usr/local/bin/io

# Duck type Number to sum like a list
Number sum := method(call target)

# override list sum method to be recursive
List sum = method(
    thislist := call target;
    total    := 0;
    for(i, 0, thislist size - 1,
        total = total + thislist at(i) sum
    )
    total;
)

# test
(list(1, 2, 3, 4, list(1,2,3,4), list(5,6,7,8)) sum == 46) println
