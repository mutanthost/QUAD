#!/bin/bash
# Starts 4 new  instances of xterm in each corner of the screen 
# and executes a script in each 
# All Rights Reserved, All Wrongs Reversed
# Matt Huston 2020
echo "starting up 3 new xterms"
# ORANGE
# xterm -geometry 90x30+0+10 -fg ORANGE -bg BLACK -bw 5 -hold -e glances &
xterm -geometry 304x44+52+2 -fg YELLOW -bg BLACK  -e ytop &
# xterm -geometry 125x40+10+0 -fg ORANGE -bg BLACK -bw 5  -e glances &
# GREEN
# xterm -geometry 90x30+0-0 -fg GREEN -bg BLACK -bw 5  -hold -e htop &
xterm -geometry 150x40+52-2 -fg GREEN -bg BLACK  -e htop &
# YELLOW
# xterm -geometry 90x30-0+0 -fg YELLOW -bg BLACK -bw 5 -hold -e ytop &
# xterm -geometry 304x44-0+0 -fg YELLOW -bg BLACK  -e  free -m -l -w &
# RED
# xterm -geometry 90x30-0-0 -fg RED -bg BLACK -bw 5 -hold -e ncdu &
# xterm -geometry 90x30-0-0 -fg RED -bg BLACK -bw 5 -hold -e $HOME/stats.sh &
# xterm -geometry 90x30-0-0 -fg RED -bg BLACK -bw 5 -hold -e istats &
xterm -geometry 150x40-52-2 -fg RED -bg BLACK  -e glances &
