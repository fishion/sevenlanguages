#!/usr/local/bin/io

# Gonna want to check that all list items are numeric
List containsOtherTypes := method(mytype,
    mylist := call target
    for(i, 0, mylist size - 1,
        if(mylist at(i) type != mytype, return(true))
    )
    false
)

# implement average method
List myAverage := method(
    mylist := call target;
    if(mylist containsOtherTypes("Number"),
        Exception raise("Can only average Numbers")
    )
    if(mylist isEmpty,
        nil,
        mylist sum / mylist size
    )
)

# test
(list(1, 2, 3, 4) myAverage == 2.5) println
(list() myAverage == nil) println
(try( list(1,2,3,"banana") myAverage ) error == "Can only average Numbers") println
