# QUAD xterm
![Image ](/quad.jpg)
Starts up a set of predefined xterms according to geometry and color preferences.
I started this as just a quick experiment to see a couple simple commands at once on a linux node I often use, 
and then modified to incorporate on my mac with a resolution of HiHDMI/Retina at 1920x1200.
I have included the source for nbwmon (which is a nice small monitoring utility) as well as some linux specific binary calls within stats.sh.

You will want to have Quartz installed for the mac setup, but basically you can tweak and change the last arguments/scripts you want to start which are fairly intuitive if you  browse the commented out sections of quad.bash

With Quartz,  it isn't required to append the -hold option within your xterm one-liner.

As the original node I wrote this for had no external internet connectivity, I included the necessary rpms for some simple terminal binaries I wanted to run on Centos 6, and included the GPG keys and example repos you could drop under /etc/yum.repos.d if you wanted to install epel.

I just aliased 'quad' to quad.bash so when I start up a shell, I can just type 
$quad
Stupid simple, but an elementary exercise and experiment with static placement and startup of multiple shells at once.
For xdpyinfo git clone https://gitlab.freedesktop.org/xorg/app/xdpyinfo
