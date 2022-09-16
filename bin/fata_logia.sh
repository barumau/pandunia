cat lexi.csv | awk -F'|' '{print $2,$1,$3,$4,$5,$6,$7$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23}' OFS='|' > temp/lexi.csv
cat ../git/ibnteo.github.io/pandunia/logia_mul.html temp/lexi.csv ../git/ibnteo.github.io/pandunia/logia_fin.html > html/pandunia/logia.html

