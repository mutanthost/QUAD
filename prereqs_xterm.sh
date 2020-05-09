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


