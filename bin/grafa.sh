#!/bin/bash
gnuplot -e "set terminal png; set datafile separator comma; set ylabel '%'; set style fill solid 0.3; set style data boxes; plot 'temp/logonumbe.csv' using 2:xtic(1) with boxes" > html/grafe/logasle.png
gnuplot bin/grafa_pai.plot > html/grafe/logasar.png

