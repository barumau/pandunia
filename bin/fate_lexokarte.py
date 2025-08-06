"""Create page that shows cognates or "etymologies" of Pandunia words.

CC-BY 2025 Risto Kupsala (https://github.com/barumau/pandunia)
"""
import csv
from nltk.corpus import wordnet as wn

index_head = '''
<html>
<head>
    <title>pandunia lexe na dunia karta</title>
</head>
<body>
<h1>pandunia lexe na dunia karta</h1>
<p><img src="http://www.pandunia.info/grafe/pandunia_karte.png"></p>
'''

index_tail = '''
<p>auter: Risto Kupsala, 2022, 2023, 2025<br/>
<a href="https://www.pandunia.info">www.pandunia.info</p>
</body>
</html>
'''

def kitabe_index(csvreader):
    with open('lexekarta/index.html', 'w', encoding = 'utf-8') as dataje:
        dataje.write(index_head)
        abc = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'V', 'X', 'Y', 'Z']
        first = True
        i = 0
        for row in csvreader:
            if first == True:
                dataje.write('<h2>%s</h2>\n' % abc[i])
                dataje.write('<p>')
                first = False
            else:
                if row[0][0].upper() != abc[i]:
                    i = i + 1;
                    print(abc[i])
                    print(row[0])
                    dataje.write('</p>\n')
                    dataje.write('<h2>%s</h2>\n' % abc[i])
                    dataje.write('<p>')
                dataje.write('<a href="%s.html">' % row[0])
                dataje.write('%s</a>\n' % row[0])
        dataje.write('</p>\n')
        dataje.write(index_tail)


html_head_1 = '''
<html>
<head>
  <meta charset="utf-8">
'''

html_head_2 = '''
  <link rel = "stylesheet" type = "text/css" href = "lexekarta.css">
</head>
<body>
'''

html_karte = '''
<div class="container">
  <img src="Simple_world_map.png" alt="dunia">
'''

html_tail = '''
<p><a href="index.html">🡨 liste</a></p>
</body>
</html>
'''

def kitabe_definition(parts, synsets, PoS, dataje, language_code):
    index = int(parts[2]) - 1
    lemmas = synsets[index].lemma_names(language_code)
    definition = synsets[index].definition(lang=language_code)
    if lemmas != None and len(lemmas) > 0 and definition != None:
        if PoS == 's' or PoS == 'a':
            PoS = 'adj'
        elif PoS == 'r':
            PoS = 'adv'
        if language_code == "eng":
            definition = "['" + definition + "']"
        dataje.write("<p>%s: <i>%s</i> (%s.) %s</p>\n" % (language_code.upper(), lemmas[0], PoS, definition))


def kitabe_dataje(row):
    #print(row[0])
    with open('lexekarta/%s.html' % row[0], 'w', encoding = 'utf-8') as dataje:
        dataje.write(html_head_1)

        print(row)

        lexe = row[0]
        dataje.write('  <title>lexekarta: %s</title>\n' % lexe)
        dataje.write(html_head_2)
        dataje.write(html_karte)
        #write custom string
        lexaslia = row[2].split(',')
        for lexasle in lexaslia:
            #eng:fra:spa:por:safari
            fen_fen = lexasle.split(':')
            #  <p class="eng">eng: safari</p>
            #  <p class="fra">fra: safari</p>
            #  ...
            for i in range(len(fen_fen)-1):
                dataje.write('  <p class="%s">' % fen_fen[i])
                dataje.write(fen_fen[i])
                dataje.write(': %s</p>\n' % fen_fen[-1])
        
        dataje.write('</div>\n\n')

        dataje.write("<h1>%s</h1>\n" % lexe)

        # Id structure: PWN:divination.n.03
        id = row[1]
        PoS = ""
        domain = id.split(':')[0]
        if domain == "PWN":
            PWN_id = id.split(':')[1]
            parts = PWN_id.split('.')
            PoS = parts[1]
            synsets = wn.synsets(parts[0], pos=PoS)
            if synsets != None:
                kitabe_definition(parts, synsets, PoS, dataje, 'eng')
                kitabe_definition(parts, synsets, PoS, dataje, 'ita')
                kitabe_definition(parts, synsets, PoS, dataje, 'ind')
                kitabe_definition(parts, synsets, PoS, dataje, 'jpn')

        dataje.write(html_tail)

with open("temp/lexaslia.csv", 'r') as file:
    csvreader = csv.reader(file, delimiter='|')
    #csvreader = csv.reader(file)
    header = next(csvreader)
    for row in csvreader:
        kitabe_dataje(row)
print(header)

with open("temp/lexaslia.csv", 'r') as file:
    csvreader = csv.reader(file, delimiter='|')
    #csvreader = csv.reader(file)
    kitabe_index(csvreader)
