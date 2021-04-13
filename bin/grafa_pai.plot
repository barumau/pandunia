filename = 'temp/asarnumbe.csv'

rowi = 0
rowf = 13

# obtain sum(column(2)) from rows `rowi` to `rowf`
set datafile separator ','
stats filename u 2 every ::rowi::rowf noout prefix "A"

# Set color sequence
# color cycle 1, dt 1 = solid line
set linetype  1 lc rgb "dark-violet" lw 1 dt 1 pt 0
set linetype  2 lc rgb "sea-green"   lw 1 dt 1 pt 7
set linetype  3 lc rgb "cyan"        lw 1 dt 1 pt 6 pi -1
set linetype  4 lc rgb "dark-red"    lw 1 dt 1 pt 5 pi -1
set linetype  5 lc rgb "blue"        lw 1 dt 1 pt 8
set linetype  6 lc rgb "dark-orange" lw 1 dt 1 pt 3
set linetype  7 lc rgb "black"       lw 1 dt 1 pt 11
set linetype  8 lc rgb "goldenrod"   lw 1 dt 1
# color cycle 2, dt 3 = dot line
set linetype  9 lc rgb "dark-violet" lw 1 dt 3 pt 0
set linetype 10 lc rgb "sea-green"   lw 1 dt 3 pt 7
set linetype 11 lc rgb "cyan"        lw 1 dt 3 pt 6 pi -1
set linetype 12 lc rgb "dark-red"    lw 1 dt 3 pt 5 pi -1
set linetype 13 lc rgb "blue"        lw 1 dt 3 pt 8
set linetype 14 lc rgb "dark-orange" lw 1 dt 3 pt 3
set linetype 15 lc rgb "black"       lw 1 dt 3 pt 11
set linetype 16 lc rgb "goldenrod"   lw 1 dt 3
#
set linetype cycle 16

# rowf should not be greater than length of file
rowf = (rowf-rowi > A_records - 1 ? A_records + rowi - 1 : rowf)

angle(x)=x*360/A_sum
percentage(x)=x*100/A_sum

# circumference dimensions for pie-chart
centerX=0
centerY=0
radius=1

# label positions
yposmin = 0.0
yposmax = 0.95*radius
xpos = 1.5*radius
ypos(i) = yposmax - i*(yposmax-yposmin)/(1.0*rowf-rowi)

#-------------------------------------------------------------------
# now we can configure the canvas
set style fill solid 1     # filled pie-chart
set terminal pngcairo dashed
#set term pngcairo dashed size 800,600 font "sans" linewidth 3
unset key                  # no automatic labels
unset tics                 # remove tics
unset border               # remove borders; if some label is missing, comment to see what is happening

set size ratio -1              # equal scale length
set xrange [-radius:2*radius]  # [-1:2] leaves space for labels
set yrange [-radius:radius]    # [-1:1]

#-------------------------------------------------------------------
pos = 0             # init angle
colour = 0          # init colour

# 1st line: plot pie-chart
# 2nd line: draw colored boxes at (xpos):(ypos)
# 3rd line: place labels at (xpos+offset):(ypos)
plot filename u (centerX):(centerY):(radius):(pos):(pos=pos+angle($2)):(colour=colour+1) every ::rowi::rowf w circle lc var,\
     for [i=0:rowf-rowi] '+' u (xpos):(ypos(i)) w p pt 5 ps 4 lc i+1,\
     for [i=0:rowf-rowi] filename u (xpos):(ypos(i)):(sprintf('%.1f%% %s', percentage($2), stringcolumn(1))) every ::i+rowi::i+rowi w labels left offset 3,0

