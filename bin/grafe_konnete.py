#!/usr/bin/python3

import numpy as np
import re # For finding specific strings in the text
# Import packages for data visualization
import networkx as nx
import matplotlib.pyplot as plt

def fete_node_poze(G):
    pos = nx.circular_layout(G)
    pos['jpn'] = (0.2, 0.2)
    pos['kor'] = (0.4, 0.5)
    pos['vie'] = (0.5, 0.8)
    pos['zho'] = (0.8, 0.5)
    pos['yue'] = (0.7, 0.95)

    pos['eng'] = (0.2, -0.2)
    pos['fra'] = (0.5, -0.1)
    pos['rus'] = (0.9, -0.5)
    pos['spa'] = (0.4, -0.6)
    pos['por'] = (0.1, -0.8)
    pos['deu'] = (0.8, 0)

    pos['hin'] = (-0.2, 0.2)
    pos['may'] = (-0.2, -0.2)
    pos['tur'] = (-0.2, -0.8)

    pos['ara'] = (-0.5, -0.4)
    pos['swa'] = (-0.7, -0.2)
    pos['hau'] = (-0.8, -0.5)
    pos['ful'] = (-0.7, -0.8)

    pos['fas'] = (-0.5, 0.2)
    pos['ben'] = (-0, 0.5)
    pos['tam'] = (-0.4, 0.5)
    
    print (pos)
    return pos

def hisabe_nam_konbine(nam1, nam2):
    with open("temp/lexaslia.csv", 'r') as file:
        sume = 0
        for line in file:
            if line.count(nam1 + ':') > 0:
                sume = sume + line.count(nam2 + ':')
        #print(nam1, nam2, sume)
        return sume

def hisabe(G):
    for i in range(len(baxe_nam)):
        j = i + 1
        while j < len(baxe_nam):
            sume = hisabe_nam_konbine(baxe_nam[i], baxe_nam[j])
            if sume > 0:
                G.add_edge(baxe_nam[i], baxe_nam[j], weight = sume / 100)
            j += 1

def kreate_baxe_grupe(liste, dataje, node_sizes):
    grupe = nx.Graph()
    for nam in liste:
        node_size = dataje.count(nam);
        grupe.add_node(nam, size = node_size)
        node_sizes.append(node_size * 3)
        print(nam, node_size)
    return grupe


G = nx.Graph()

file = open("temp/logaslia.txt", "r")
dataje = file.read()
node_sizes = []

euro_baxe = ['eng', 'deu', 'fra', 'spa', 'por', 'rus' ]
hindiran_baxe = [ 'fas', 'hin', 'ben', 'tam', 'may' ]
afrasia_baxe = [ 'ara', 'tur', 'swa', 'hau', 'ful' ]
dongasia_baxe = [ 'zho', 'yue', 'jpn', 'kor', 'vie' ]

baxe_nam = euro_baxe + hindiran_baxe + afrasia_baxe + dongasia_baxe

euro_grupe = kreate_baxe_grupe(euro_baxe, dataje, node_sizes)
hindiran_grupe = kreate_baxe_grupe(hindiran_baxe, dataje, node_sizes)
afrasia_grupe = kreate_baxe_grupe(afrasia_baxe, dataje, node_sizes)
dongasia_grupe = kreate_baxe_grupe(dongasia_baxe, dataje, node_sizes)

# konbine la grafe e spesife la asle grafe
asle_grafe = {'euro_grupe':{'grafe':euro_grupe,'color':'blue'},
               'hindiran_grupe':{'grafe':hindiran_grupe,'color':'gold'},
               'afrasia_grupe':{'grafe':afrasia_grupe,'color':'lime'},
               'dongasia_grupe':{'grafe':dongasia_grupe,'color':'red'}}
G = nx.Graph()
for g_name,g_val_dict in asle_grafe.items():
    # maxife la node de la grafe e spesife la partaje e node rang
    G.add_nodes_from(g_val_dict['grafe'].nodes, partition = g_name, color = g_val_dict['color'])

print(G.nodes)

hisabe(G)

print(G.nodes())

widths = nx.get_edge_attributes(G, 'weight')
nodelist = G.nodes()

plt.figure(figsize=(12,8))

pos = fete_node_poze(G)

nx.draw_networkx_nodes(G, pos, node_color=[c for n, c in G.nodes(data='color')], node_size=node_sizes)
'''
pos = nx.circular_layout(G)
nx.draw_networkx_nodes(G, pos,
                       nodelist=nodelist,
                       node_size=node_sizes,
                       node_color='black',
                       alpha=0.7)
'''
nx.draw_networkx_labels(G, pos)
'''
nx.draw_networkx_labels(G, pos=pos,
                        labels=dict(zip(nodelist,nodelist)),
                        font_color='white')
'''
'''
#nx.draw_networkx_edges(G, pos, edge_color=[c for u, v, c in G.edges(data='color')])

'''
nx.draw_networkx_edges(G,pos,
                       edgelist = widths.keys(),
                       width=list(widths.values()),
                       edge_color='lightblue',
                       alpha=0.6)



plt.savefig('html/grafe/konnete.png', dpi=300)


