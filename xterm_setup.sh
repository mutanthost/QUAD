#!/bin/bash

# ===================== < XTerm Checks > ===================== #
# TODO: Run the checks below only if we're not using tmux.
if [ ! "${DISPLAY:-}" ]; then # Assure display is available.
   echo -e "\\033[31mAborted, X (graphical) session unavailable.\\033[0m"; exit 2
fi

if ! hash xdpyinfo 2>/dev/null; then # Assure display probe.
   echo -e "\\033[31mAborted, xdpyinfo is unavailable.\\033[0m"; exit 3
fi

if ! xdpyinfo &>/dev/null; then # Assure display info available.
   echo -e "\\033[31mAborted, xterm test session failed.\\033[0m"; exit 4
fi




WINDOWRATIO=4
# ============================================================ #
# =============== < Resolution & Positioning > =============== #
# ============================================================ #
set_resolution() { # Windows + Resolution

# Get dimensions
# Verify this works on Kali before commiting.
# shopt -s checkwinsize; (:;:)
# SCREEN_SIZE_X="$LINES"
# SCREEN_SIZE_Y="$COLUMNS"

 SCREEN_SIZE=$(xdpyinfo | grep dimension | awk '{print $4}' | tr -d "(")
 SCREEN_SIZE_X=$(printf '%.*f\n' 0 $(echo $SCREEN_SIZE | sed -e s'/x/ /'g | awk '{print $1}'))
 SCREEN_SIZE_Y=$(printf '%.*f\n' 0 $(echo $SCREEN_SIZE | sed -e s'/x/ /'g | awk '{print $2}'))

#  Calculate proportional windows
 if hash bc ;then
    PROPOTION=$(echo $(awk "BEGIN {print $SCREEN_SIZE_X/$SCREEN_SIZE_Y}")/1 | bc)
    NEW_SCREEN_SIZE_X=$(echo $(awk "BEGIN {print $SCREEN_SIZE_X/$WINDOWRATIO}")/1 | bc)
    NEW_SCREEN_SIZE_Y=$(echo $(awk "BEGIN {print $SCREEN_SIZE_Y/$WINDOWRATIO}")/1 | bc)

    NEW_SCREEN_SIZE_BIG_X=$(echo $(awk "BEGIN {print 1.5*$SCREEN_SIZE_X/$WINDOWRATIO}")/1 | bc)
    NEW_SCREEN_SIZE_BIG_Y=$(echo $(awk "BEGIN {print 1.5*$SCREEN_SIZE_Y/$WINDOWRATIO}")/1 | bc)

    SCREEN_SIZE_MID_X=$(echo $(($SCREEN_SIZE_X + ($SCREEN_SIZE_X - 2 * $NEW_SCREEN_SIZE_X) / 2)))
    SCREEN_SIZE_MID_Y=$(echo $(($SCREEN_SIZE_Y + ($SCREEN_SIZE_Y - 2 * $NEW_SCREEN_SIZE_Y) / 2)))

# Upper windows
    TOPLEFT="-geometry $NEW_SCREEN_SIZE_Xx$NEW_SCREEN_SIZE_Y+0+0"
    TOPRIGHT="-geometry $NEW_SCREEN_SIZE_Xx$NEW_SCREEN_SIZE_Y-0+0"
    TOP="-geometry $NEW_SCREEN_SIZE_Xx$NEW_SCREEN_SIZE_Y+$SCREEN_SIZE_MID_X+0"

# Lower windows
    BOTTOMLEFT="-geometry $NEW_SCREEN_SIZE_Xx$NEW_SCREEN_SIZE_Y+0-0"
    BOTTOMRIGHT="-geometry $NEW_SCREEN_SIZE_Xx$NEW_SCREEN_SIZE_Y-0-0"
    BOTTOM="-geometry $NEW_SCREEN_SIZE_Xx$NEW_SCREEN_SIZE_Y+$SCREEN_SIZE_MID_X-0"

# Y mid
    LEFT="-geometry $NEW_SCREEN_SIZE_Xx$NEW_SCREEN_SIZE_Y+0-$SCREEN_SIZE_MID_Y"
    RIGHT="-geometry $NEW_SCREEN_SIZE_Xx$NEW_SCREEN_SIZE_Y-0+$SCREEN_SIZE_MID_Y"

# Big
    TOPLEFTBIG="-geometry $NEW_SCREEN_SIZE_BIG_Xx$NEW_SCREEN_SIZE_BIG_Y+0+0"
    TOPRIGHTBIG="-geometry $NEW_SCREEN_SIZE_BIG_Xx$NEW_SCREEN_SIZE_BIG_Y-0+0"
  fi
 }
