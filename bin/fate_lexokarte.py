import csv

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
<p>auter: Risto Kupsala, 2022, 2023<br/>
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

def kitabe_dataje(row):
    #print(row[0])
    with open('lexekarta/%s.html' % row[0], 'w', encoding = 'utf-8') as dataje:
        dataje.write(html_head_1)
        lexe = row[0]
        dataje.write('  <title>lexekarta: %s</title>\n' % lexe)
        row.pop(0)
        dataje.write(html_head_2)
        dataje.write(html_karte)
        #write custom string
        for lexasle in row:
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
        dataje.write('<h1>%s</h1>\n' % lexe)
        dataje.write(html_tail)

with open("temp/lexaslia.csv", 'r') as file:
    #csvreader = csv.reader(file, delimiter='|')
    csvreader = csv.reader(file)
    header = next(csvreader)
    for row in csvreader:
        kitabe_dataje(row)
print(header)

with open("temp/lexaslia.csv", 'r') as file:
    #csvreader = csv.reader(file, delimiter='|')
    csvreader = csv.reader(file)
    kitabe_index(csvreader)

