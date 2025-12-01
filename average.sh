#!/bin/bash

sum=0
read N

for ((i=1; i<=N; i++)); do
    read x
    ((sum = sum + x))
done
avg=$(echo "$sum / $N" | bc -l)
printf "%.3f\n" "$avg"