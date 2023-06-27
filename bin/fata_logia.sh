cat ../panlexia/lexia.csv | awk -F'|' '{print $7,$3,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23}' OFS='|' > temp/lexia.csv
cat ../git/ibnteo.github.io/pandunia/logia_mul.html temp/lexia.csv ../git/ibnteo.github.io/pandunia/logia_fin.html > html/pandunia/logia.html

