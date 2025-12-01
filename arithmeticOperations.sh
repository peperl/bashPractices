#!/bin/bash

# ============================================================================
# bc - command
# ============================================================================
#
# DESCRIPTION:
#   bc allows to do arithmetic operations with floating numbers
#   Supports: +, -, *, /, ^(exponentiation), and parentheses
#   Result is rounded to 4 decimal places and then cut it to 3 to solve all cases.

read expression
printf "%.3f\n" $(echo "scale=4;$expression" | bc -l)