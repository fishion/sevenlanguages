#!/usr/local/bin/io

tries       := 10
number      := (Random value(99) + 1) floor
userinput   := File standardInput
lastGuess   := false

for(i,1,tries,
    guess := userinput readLine("Attempt number " .. i .. " : ") asNumber

    if( guess == number,
        "Got it!" println
        break
    )
    if( lastGuess and (number - lastGuess) abs > (number - guess) abs,
        "Warmer!" println
    )
    if( lastGuess and (number - lastGuess) abs < (number - guess) abs,
        "Colder!" println
    )
    lastGuess = guess 
)

("number was " .. number) println
