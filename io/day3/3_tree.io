#!/usr/local/bin/io

Builder ul(
    li("item1"),
    li({"attribute1": "value1",
        "attribute2": "value2"},
        "item2"),
    li(
        ul(
            li("item3"),
            li("item4")
        )
    )
    li({"attribute3": "value3",
        "attribute4": "value4"},
        ul(
            li({"attribute5": "value5",
                "attribute6": "value6"},
                "item5"),
            li("item6")
        )
    )
)
