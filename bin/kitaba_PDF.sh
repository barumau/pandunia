cd engli
cat header.md 100_bazi_kanune.md 102_ABC.md 103_logotipe.md 104_namloge.md 105_sifloge.md 106_modologe.md 107_nume.md 108_visloge.md 109_karloge.md 110_jumle.md 111_logobine.md > pan.md
#101_duni_lekse.md darse.md fraze.md
cd ..
pandoc engli/pan.md -s -o engli/pandunia.pdf --pdf-engine=/usr/bin/xelatex -V mainfont="DejaVu Serif" -V monofont="DejaVu Sans Mono" -V CJKmainfont="Noto Sans CJK SC" -V devanagarifont="Noto Sans Devanagari"

#uza di pake:
#sudo apt install pandoc
#sudo apt install pdflatex
#sudo apt-get install texlive-latex-base
#sudo apt-get install texlive-fonts-recommended
#sudo apt-get install texlive-fonts-extra
#sudo apt-get install texlive-latex-extra
#sudo apt-get install texlive-xetex

