#!/usr/local/bin/io

fella1 := Object clone
fella1 talk := method(
    "man1 line1" println
    yield
    "man1 line2" println
    yield
)

fella2 := Object clone
fella2 talk := method(
    yield
    "man2 line1" println
    yield
    "man2 line2" println
)

fella1 @@talk
fella2 @@talk

Coroutine currentCoroutine pause
