#!/bin/bash
<<TASK
Given N integers, compute their average, rounded to three decimal places. 
TASK

read N
sum=0
for ((i=0; i<N; i++)); do
    read x
    let sum=$((sum + x))
done

# Use `bc` to do floating point division, and `printf` to round to 3 d.p.
printf "%0.3f\n" $(echo $sum/$N | bc -l)
