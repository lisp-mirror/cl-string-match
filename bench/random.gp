## plot the results of the random strings search

# gnuplot < random.gp

set terminal png enhanced size 640,480
set output "random_" . system("cat system.txt") . ".png"

set title "Benchmarking search on random strings\n{/=9 " . system("cat system.txt") . " " . system("date +%F") . "}"

set grid
set key autotitles
set style data linespoints
set xlabel "Needle length"
set ylabel "Duration index\n(System search equals 1)"

set yrange [0:1]

# there is no sense to plot system search since it is always 1
# 'random.log' using 1:($2/$2) title "System search",\

plot 'random.log' using 1:($3/$2) title "Brute-force",\
     'random.log' using 1:($4/$2) title "Boyer-Moore",\
     'random.log' using 1:($5/$2) title "Boyer-Moore-Horspool",\
     'random.log' using 1:($6/$2) title "Boyer-Moore-Horspool-8",\
     'random.log' using 1:($7/$2) title "Rabin-Karp",\
     'random.log' using 1:($8/$2) title "Knuth-Morris-Pratt",\
     'random.log' using 1:($9/$2) title "Shift-OR"
