#From Pandunia to English
cat english/tiddly_2.txt temp/alfahead.txt > temp/temp.txt
sed 's/	/ : /g' temp/temp.txt | LC_ALL=C sort -f | sed 's/.00/##/g' > english/pandunia-english.md
sed 's/_//g' -i english/pandunia-english.md
sed 's/$/  /' -i english/pandunia-english.md
#From English to Pandunia
cat english/tiddly_2.txt temp/alfahead.txt > temp/temp.txt
#awk -F $'\t' ' { t = $1; $1 = $2; $2 = t; print; } ' OFS=$' : ' temp/temp.txt | LC_ALL=C sort | sed 's/ : .00/##/g' > english/english-pandunia.md
awk ' { FS="\t"; OFS=" : "; t = $1; $1 = $2; $2 = t; print; } ' temp/temp.txt | sed 's/^ : //g' | LC_ALL=C sort -f | sed 's/.00/##/g' > english/english-pandunia.md
sed 's/_//g' -i english/english-pandunia.md
sed 's/$/  /' -i english/english-pandunia.md
#Tiddly dictionary
sed 's/_//g' -i english/tiddly_2.txt
cat temp/tiddly_1.html english/tiddly_2.txt temp/tiddly_3.html > english/tiddly.html
