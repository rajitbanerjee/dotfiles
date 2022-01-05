#!/bin/bash
<<TASK
Read in one character from STDIN.
If the character is 'Y' or 'y' display "YES".
If the character is 'N' or 'n' display "NO".
No other character will be provided as input.

The character will be from the set {yYnN}.
TASK

read char
case $char in
    'y' | 'Y')
        echo "YES"
        ;;
    *)
        echo "NO"
        ;;
esac