#!/usr/local/bin/io

MDlist := List clone

dim := method(x,y,
    mymatrix := MDlist clone
    for(i,0,y-1,mymatrix push( list() setSize(x) ))
)
dimFromFile := method(filename,
    listfromfile := doFile(filename)
    mymatrix := MDlist clone
    for(i,0,listfromfile size - 1,mymatrix push( listfromfile at(i) ))
)

MDlist dimSet := method(x,y,z,
    call target at(x) atPut(y, z)
    call target
)
MDlist dimGet := method(x,y,
    call target at(x) at(y)
)
MDlist transpose := method(
    mymatrix := call target
    mynewmatrix := dim(mymatrix size, mymatrix at(0) size)
    for(i,0,mymatrix size - 1,
        elem := mymatrix at(i)
        for(j,0,elem size - 1,
            mynewmatrix at(j) atPut(i, mymatrix at(i) at(j))
        )
    )
    return mynewmatrix
)
MDlist toFile := method(filename,
    fh := File clone;
    fh setPath(filename)
    fh open write(call target serialized) close
)


# test it
# create a multi dimentional list like this
#[
#    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
#    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
#    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
#    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
#    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
#]
arr := dim(10,5)

"* was it created OK?" println
(arr size == 5) println
(arr at(0) size == 10) println
(arr dimSet(2,3,"hi") == arr) println
(arr dimGet(2,3) == "hi") println
(arr dimGet(3,2) == nil) println

"* Does transpose work as expected" println
arr2 := arr transpose
(arr2 size == 10) println
(arr2 at(0) size == 5) println
(arr2 dimGet(2,3) == nil) println
(arr2 dimGet(3,2) == "hi") println

"* does toFile method work" println
filename := "data_6creatematrix.tmp"
(arr toFile(filename) type == "File") println

"* create new matrix object from file" println
arr3 := dimFromFile(filename);
"* does it look like the original?" println
(arr3 size == 5) println
(arr3 at(0) size == 10) println
(arr3 dimSet(2,3,"hi") == arr) println
(arr3 dimGet(2,3) == "hi") println
(arr3 dimGet(3,2) == nil) println

"* cleanup" println
File clone setPath(filename) remove
