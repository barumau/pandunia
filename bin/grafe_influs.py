#!/usr/bin/python3

import csv
import matplotlib.pyplot as plt
import numpy as np

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

def grafe_kolum() -> None:
    """grafe un kolum grafe de baxe influs."""
    baxe_nam = []
    prosente = []

    with open("temp/logonumbe.csv", 'r') as file:
        csvreader = csv.reader(file)
        for row in csvreader:
            print(row[0], row[1])
            baxe_nam.append(row[0])
            prosente.append(float(row[1]))

    print(baxe_nam)
    print(prosente)

    # vize la prosente a supe de kolum
    fig, axes = plt.subplots()
    bars = axes.bar(baxe_nam, prosente)
    axes.bar_label(bars, fmt='%1.0f%%')

    my_colors = ["#ea5545", "#f46a9b", "#ef9b20", "#edbf33", "#ede15b", "#bdcf32", "#87bc45", "#27aeef", "#b33dc6"] # pastel rang
    plt.xticks(rotation=45)
    plt.bar(baxe_nam, prosente, tick_label=baxe_nam, color=my_colors)
    plt.savefig('html/grafe/logasle.png', dpi=300)


grafe_influs_pai()
grafe_kolum()
