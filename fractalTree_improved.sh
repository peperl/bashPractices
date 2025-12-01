#!/bin/bash

# Variable declarations only — no logic or I/O in this file as requested.
# These variables are intended for the fractal tree drawing routine.

tree_depth=0    # requested recursion/iteration depth
printed=0       # how many levels have been printed
offset=0        # vertical offset used for coordinate calculations
y=0             # current row being drawn
x=0             # current column being drawn
length=0        # current half-length of a Y branch for the level
b=0             # relative y coordinate from the center of a Y
max_rows=63     # canvas height (rows)
max_cols=100    # canvas width (columns)

# sensible defaults / initial values
new_xpos=()
xpos=(50) # Roots where we start the Ys

read tree_depth

for ((y=1; y<=63; y++)); do
    for ((x=1; x<=100; x++)); do
        char=_
        if (( tree_depth > printed )); then # if we need more depth
            length=$((2**(4-printed))) b=y-offset-length
            # b is the y coordinate from the point of view of the center of the Y we are drawing
            if (( b <= length )); then
                (( b < 0 )) && b=0 # Force vertical (to draw a Y instead of an X)
                for p in "${xpos[@]}"; do
                    if (( p-b == x || p+b == x )); then
                        char=1
                        # If b == length, we are finishing drawing this rank's Ys
                        # So we save the x position for future Y roots
                        if (( b == length )); then
                            new_xpos+=("$x")
                        fi
                    fi
                done
            fi
        fi
        printf %s "$char"
    done
    if (( b == length )); then
        # We finished drawing the Ys for this level
        # We set the new roots and the offset
        xpos=("${new_xpos[@]}")
        new_xpos=()
        printed=$((printed+1))
        offset=$y
    fi
    echo
done | tac