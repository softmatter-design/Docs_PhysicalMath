set encoding utf8
#set term pngcairo font "Arial,14" 
set term gif animate optimize delay 2 size 720, 480
#set colorsequence classic 
# 
set output "sin.gif"
#
set noborder
unset tics
set margins 0.1, 0.1, 0.1, 0.1
#
xmin = -15
xmax = 15
ymin = -8
ymax = 8
set xrange[xmin-1:xmax+1]
set yrange[ymin:ymax]

set parametric
set samples 1000
div = 50
set trange[0:div]
r=6

set label 1 center at first 0,7 "Dynamic Sine Curve" font "Meiryo,24"
set arrow from xmin, 0 to xmax, 0 lt 8

do for [i=0:div]{
plot (xmax-xmin)*t/div + xmin, r*sin(10*pi*(i-t)/div) noti
}

set out
set terminal wxt enhanced
