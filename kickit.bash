#!/bin/bash
# start up 4 xterms 
# ORANGE='xterm -fg ORANGE -bg BLACK &'
# export ORANGE
# GREEN='xterm -fg GREEN -bg BLACK &'
# export GREEN
# YELLOW='xterm -fg YELLOW -bg BLACK &'
# export YELLOW
# RED='xterm -fg RED -bg BLACK &'
# export RED

echo "starting up 4 new xterms"

# ORANGE
xterm -geometry 90x30+0+0 -fg ORANGE -bg BLACK -bw 5 -hold -e glances &
# sleep 2
# GREEN
xterm -geometry 90x30+0-0 -fg GREEN -bg BLACK -bw 5  -hold -e htop &
# sleep 2
# YELLOW
xterm -geometry 90x30-0+0 -fg YELLOW -bg BLACK -bw 5 -hold -e xrestop  &
# sleep 2
# RED
xterm -geometry 90x30-0-0 -fg RED -bg BLACK -bw 5 -hold -e ncdu  &

# end


