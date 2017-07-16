# ze englic do pandunia
cat english/pandunia-english.md | sed '/^#/ d' > temp/temp2.txt
cat temp/temp2.txt temp/alfahead.txt > temp/temp.txt
awk ' { FS=" : "; OFS=" : "; t = $1; $1 = $2; $2 = t; print; } ' temp/temp.txt | sed 's/^ : //g' | LC_ALL=C sort -f | sed 's/.00/##/g' > english/english-pandunia.md
sed 's/_//g' -i english/english-pandunia.md

#Tiddly dictionary
cp english/wordlist.txt temp/temp.txt
sed 's/_//g' -i temp/temp.txt
cat temp/tiddly_1.html temp/temp.txt temp/tiddly_3.html > english/tiddly.html

# ze pandunia do suomi
cat suomi/sanasto.txt temp/alfahead.txt > temp/temp.txt
sed 's/	/ : /g' temp/temp.txt | LC_ALL=C sort -f | sed 's/.00/##/g' > suomi/pandunia-suomi.md
sed 's/_//g' -i suomi/pandunia-suomi.md
sed 's/$/  /' -i suomi/pandunia-suomi.md
# ze suomi do pandunia
cat suomi/sanasto.txt temp/alfahead.txt > temp/temp.txt
awk ' { FS="\t"; OFS=" : "; t = $1; $1 = $2; $2 = t; print; } ' temp/temp.txt | sed 's/^ : //g' | LC_ALL=C sort -f | sed 's/.00/##/g' > suomi/suomi-pandunia.md
sed 's/_//g' -i suomi/suomi-pandunia.md
sed 's/$/  /' -i suomi/suomi-pandunia.md

# ze pandunia do ruski
cat russki/slovar.txt temp/alfahead.txt > temp/temp.txt
sed 's/	/ : /g' temp/temp.txt | LC_ALL=C sort -f | sed 's/.00/##/g' > russki/pandunia-ruski.md
sed 's/_//g' -i russki/pandunia-ruski.md
sed 's/$/  /' -i russki/pandunia-ruski.md
# ze ruski do pandunia
#cat russki/slovar.txt temp/kirilitsa.txt > temp/temp.txt
#awk ' { FS="\t"; OFS=" : "; t = $1; $1 = $2; $2 = t; print; } ' temp/temp.txt | sed 's/^ : //g' | LC_COLLATE=ru_RU.UTF-8 sort --ignore-case | sed 's/.00/##/g' > russki/ruski-pandunia.md
cp russki/slovar.txt temp/temp.txt
awk ' { FS="\t"; OFS=" : "; t = $1; $1 = $2; $2 = t; print; } ' temp/temp.txt | sed 's/^ : //g' > russki/ruski-pandunia.md
sed 's/_//g' -i russki/ruski-pandunia.md
sed 's/$/  /' -i russki/ruski-pandunia.md

# ze pandunia do esperanto
cat esperanto/vortaro.txt temp/alfahead.txt > temp/temp.txt
sed 's/	/ : /g' temp/temp.txt | LC_ALL=C sort -f | sed 's/.00/##/g' > esperanto/pandunia-esperanto.md
sed 's/_//g' -i esperanto/pandunia-esperanto.md
sed 's/$/  /' -i esperanto/pandunia-esperanto.md
# ze esperanto do pandunia
cat esperanto/vortaro.txt temp/alfahead.txt > temp/temp.txt
awk ' { FS="\t"; OFS=" : "; t = $1; $1 = $2; $2 = t; print; } ' temp/temp.txt | sed 's/^ : //g' | LC_ALL=C sort -f | sed 's/.00/##/g' > esperanto/esperanto-pandunia.md
sed 's/_//g' -i esperanto/esperanto-pandunia.md
sed 's/$/  /' -i esperanto/esperanto-pandunia.md
