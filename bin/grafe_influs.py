#!/usr/bin/python3

import csv
import matplotlib.pyplot as plt

def grafe_influs_pai() -> None:
    """grafe un pai grafe de baxe influs."""
    baxe_nam = []
    prosente = []

    with open("temp/asarpercent.csv", 'r') as file:
        csvreader = csv.reader(file)
        for row in csvreader:
            print(row[0], row[1])
            baxe_nam.append(row[0])
            prosente.append(row[1])

    plt.pie(prosente, labels=baxe_nam, counterclock=False, startangle=180,
        autopct='%1.0f%%', pctdistance=1.1, labeldistance=1.25,
        wedgeprops = { 'linewidth' : 1, 'edgecolor' : 'white' })
    plt.savefig('html/grafe/logasar.png', dpi=300)

grafe_influs_pai()
