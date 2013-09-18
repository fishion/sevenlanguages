#!/usr/local/bin/io

Builder := Object clone
Builder _depth := 0
Builder _indent := "  "
Builder padding := method(
    pad := ""
    for(i, 0, _depth - 1,
        pad = pad .. _indent;
    )
    return pad
)

Builder forward = method(
    writeln(padding .. "<", call message name, ">")
    _depth = _depth + 1
    call message arguments foreach(
        arg,
        content := self doMessage(arg)
        if(content type == "Sequence", writeln(padding .. content) )
    )
    _depth = _depth - 1
    writeln(padding .. "</", call message name, ">")
)

Builder ul(
    li("item1"),
    li("item2"),
    li(
        ul(
            li("item3"),
            li("item4")
        )
    )
)
