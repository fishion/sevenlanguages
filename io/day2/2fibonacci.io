#!/usr/local/bin/io

# write 2 versions, one with recursion and one with loops

recurse_fib := method( index, iteration, x, y,
    concat := ""
    if(iteration, iteration, iteration := 1)
    if(x,
        next := x+y; concat = ", ",
        x := 0; y := 0; next := 1
    )
    x=y;
    y=next;
    (concat .. y) print
    if(index != iteration,
        recurse_fib(index, iteration + 1, x, y),
        " END" println
    )
)
loop_fib := method( index, x,
    concat := ""
    for(i,1,index,
        if(x,
            next := x+y,
            x := 0; y := 0; next := 1
        )
        x=y
        y=next
        (concat .. y) print
        concat = ", "
    )
    " END" println
)

recurse_fib(10)
loop_fib(10)
