echo
echo kitabu la english PDF dokumen
cd english
cat 000_dake.md 100_baze_kanun.md 102_ABC.md 103_logatipe.md 104_viseloga.md 105_namloga.md 106_nomer.md 107_modeloga.md 108_karmaloga.md 109_jumla_bina.md 110_loga_bina.md 201_shula.md > pan.md
#di nici kitabe ya 'unicode' harfe e simbol, de 'pandoc' no abla kitaba.
#101_duni_lekse.md fraze.md
sed 's/http:\/\/www.pandunia.info/\/home\/risto\/pandunia\/html/g' -i pan.md
cd ..
pandoc english/pan.md -s -o english/pan.pdf --pdf-engine=/usr/bin/xelatex -V mainfont="DejaVu Serif" -V monofont="DejaVu Sans Mono" -V CJKmainfont="Noto Sans CJK SC" -V devanagarifont="Noto Sans Devanagari"
sed 's/\/home\/risto\/pandunia\/html/http:\/\/www.pandunia.info/g' -i english/pan.md

#uze le pake:
#sudo apt install pandoc
#sudo apt install pdflatex
#sudo apt-get install texlive-latex-base
#sudo apt-get install texlive-fonts-recommended
#sudo apt-get install texlive-fonts-extra
#sudo apt-get install texlive-latex-extra
#sudo apt-get install texlive-xetex

