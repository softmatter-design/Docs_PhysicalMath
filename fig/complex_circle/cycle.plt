set encoding utf8
#set term pngcairo font "Arial,14" 
set term gif animate optimize delay 10 size 480, 480
#set colorsequence classic 
# 
set output "cycle.gif"
#
set noborder
unset tics
set margins 0.1, 0.1, 0.1, 0.1
#
xmin = -10
xmax = 10
ymin = -10
ymax = 10
set xrange[xmin-1:xmax+1]
set yrange[ymin-1:ymax+1]

set parametric
set samples 200
div = 10
set trange[0:div]
r=4

set label 1 at first xmax-1,-1 "Re" font "Meiryo,16"
set label 2 at first 0.5,ymax "Im" font "Meiryo,16"
#set label 3 center at first xshift+r,-10 "波動" font "Meiryo,24"

set arrow from xmin,0 to xmax,0 lt 8
set arrow from 0,ymin to 0,ymax lt 8

do for [i=0:div]{
plot r*cos(t*2*pi/div), r*sin(t*2*pi/div) noti, \
2.0*r*t/div, r*sin(i*2*pi/div-t*2*pi/div) noti

unset arrow

#set label 4 point pt 7 ps 2 at r*cos(i*2*pi/div) - r - xshift, r*sin(i*2*pi/div)
#set label 5 point pt 7 ps 2 at 0, r*sin(i*2*pi/div)
#set label 6 point pt 7 ps 2 at xshift, r*sin(i*2*pi/div)

set arrow from xmin,0 to xmax,0 lt 8
set arrow from 0,ymin to 0,ymax lt 8
set arrow from 0,0 to r*cos(i*2*pi/div), r*sin(i*2*pi/div) head lt 9
#set arrow from xmin, 0 to xmax, 0 nohead lt 8
}

set out
set terminal wxt enhanced
