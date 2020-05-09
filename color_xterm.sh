#!/usr/bin/env bash

# ===============================================
#   C O L O R  X T E R M                        =
# ===============================================
#
# Launch randomed colorized xterminals
#
# ===============================================

# Exit when command fail
set -o errexit

# My fun colors
readonly XTERM_COLORS=(
    'lightgreen'
    'lime'
    'skyblue'
    'gold'
    'coral'
)

# FG is BLACK !
readonly DEFAULT_FG_COLOR="black"
readonly XTERM_COLORS_SIZE=${#XTERM_COLORS[@]}

function main() {
    local terms_number=1
    if (( $# >= 1 )); then
        # Check if param is an integer
        if [[ $1 =~ ^[0-9]+$ ]]; then
            terms_number=$1
        else
            echo "Usage: color_xterm [number]"
            exit 1
        fi
    fi

    local counter=0
    while (( counter < terms_number )); do
        local selected_color=${XTERM_COLORS[$((RANDOM%XTERM_COLORS_SIZE))]}
        xterm -bg "$selected_color" -fg "$DEFAULT_FG_COLOR" &
        local counter=$(( counter + 1 ))
    done
}

main "$@"

# ===============================================
#  END: C O L O R  X T E R M                    =
# ===============================================
