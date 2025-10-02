grep '^\*\*' eng/pan.md > ./temp/pan_lexe.md
sed 's/ /\n/g' -i ./temp/pan_lexe.md
sed 's/\*//g' -i ./temp/pan_lexe.md
sed 's/[[:punct:]]//g' -i ./temp/pan_lexe.md
cat ./temp/pan_lexe.md | tr '[:upper:]' '[:lower:]' | sort | uniq > ./temp/unike_lexe.txt

cat ../panlexia/lexia.csv | cut -d '|' -f  2 > ./temp/pan_lexe.md
sed 's/ /\n/g' -i ./temp/pan_lexe.md
cat ./temp/pan_lexe.md | tr '[:upper:]' '[:lower:]' | sort | uniq > ./temp/unike_lexia_lexe.txt
