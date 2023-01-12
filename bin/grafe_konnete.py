#!/usr/bin/python3

import numpy as np
import re # For finding specific strings in the text
# Import packages for data visualization
import networkx as nx
import matplotlib.pyplot as plt

def hisabe_nam_konbine(nam1, nam2):
    with open("temp/lexaslia.csv", 'r') as file:
        sume = 0
        for line in file:
            if line.count(nam1 + ':') > 0:
                sume = sume + line.count(nam2 + ':')
        print(nam1, nam2, sume)
        return sume

def hisabe(G):
    for i in range(len(baxe_nam)):
        j = i + 1
        while j < len(baxe_nam):
            sume = hisabe_nam_konbine(baxe_nam[i], baxe_nam[j])
            if sume > 0:
                G.add_edge(baxe_nam[i], baxe_nam[j], weight = sume / 100)
            j += 1

def kreate_baxe_grupe(liste, dataje, node_sizes, G):
    for nam in liste:
        node_size = dataje.count(nam);
        G.add_node(nam, size = node_size)
        node_sizes.append(node_size * 3)
        print(nam, node_size)
    


G = nx.Graph()

file = open("temp/logaslia.txt", "r")
dataje = file.read()
node_sizes = []

baxe_nam = ['eng', 'deu', 'fra', 'spa', 'por', 'rus', 'fas', 'hin', 'ben', 'tam',
            'may', 'ara', 'tur', 'swa', 'hau', 'zho', 'yue', 'jpn', 'kor', 'vie' ]

G = kreate_baxe_grupe(baxe_nam, dataje, liste, G)

print(G.nodes)

hisabe(G)

print(G.nodes())

widths = nx.get_edge_attributes(G, 'weight')
nodelist = G.nodes()

plt.figure(figsize=(12,8))

pos = nx.circular_layout(G)
nx.draw_networkx_nodes(G,pos,
                       nodelist=nodelist,
                       node_size=node_sizes,
                       node_color='black',
                       alpha=0.7)
nx.draw_networkx_edges(G,pos,
                       edgelist = widths.keys(),
                       width=list(widths.values()),
                       edge_color='lightblue',
                       alpha=0.6)
nx.draw_networkx_labels(G, pos=pos,
                        labels=dict(zip(nodelist,nodelist)),
                        font_color='white')

plt.savefig('html/grafe/konnete.png', dpi=300)


