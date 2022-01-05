#!/bin/bash
<<TASK
A mathematical expression containing +,-,*,^, / and parenthesis will be provided. 
Read in the expression, then evaluate it. Display the result rounded to 3 decimal places.
TASK

read num

# `bc` is the command line calculator, `-l` defines std mathlib
# xargs executes a command with piped args from another command i.e. the calculator's answer
echo $num | bc -l | xargs printf "%.3f\n"