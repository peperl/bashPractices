#!/bin/bash

read x
read y
read z

if [[ ($x -eq $y) && ($x -eq $z) ]]; then
    echo "EQUILATERAL"
elif [[ ($x -eq $y) && ($x -ne $z) || ($y -eq $z) && ($y -ne $x) || ($x -eq $z) && ($x -ne $y) ]]; then
    echo "ISOSCELES"
else echo "SCALENE";
fi