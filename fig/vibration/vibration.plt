set encoding utf8
#set term pngcairo font "Arial,14" 
set term gif animate optimize delay 2 size 720, 480
#set colorsequence classic 
# 
set output "vibration.gif"
#
set noborder
unset tics
set margins 0.1, 0.1, 0.1, 0.1
#
xmin = -15
xmax = 15
ymin = -11
ymax = 9
set xrange[xmin:xmax]
set yrange[ymin:ymax]

set parametric
set samples 1000
div = 50
set trange[0:div]

xshift = 2.5
r=6

set label 1 center at first -1*(xshift+r),-10 "円運動" font "Meiryo,24"
set label 2 center at first 0,-10 "単振動" font "Meiryo,24"
set label 3 center at first xshift+r,-10 "波動" font "Meiryo,24"
set arrow from xmin, 0 to xmax, 0 nohead lt 8

do for [i=0:div]{
plot r*cos(t*2*pi/div) - r -xshift, r*sin(t*2*pi/div) noti, \
0, r*sin(t*2*pi/div) noti, \
xshift + 2.0*r*t/div, r*sin(i*2*pi/div-t*2*pi/div) noti

unset arrow

set label 4 point pt 7 ps 2 at r*cos(i*2*pi/div) - r - xshift, r*sin(i*2*pi/div)
set label 5 point pt 7 ps 2 at 0, r*sin(i*2*pi/div)
set label 6 point pt 7 ps 2 at xshift, r*sin(i*2*pi/div)

set arrow from r*cos(i*2*pi/div) - r - xshift, r*sin(i*2*pi/div) to xshift, r*sin(i*2*pi/div) nohead lt 9
set arrow from xmin, 0 to xmax, 0 nohead lt 8
}

set out
set terminal wxt enhanced
