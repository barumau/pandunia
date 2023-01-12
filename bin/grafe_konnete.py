#!/usr/bin/python3

import numpy as np
import re # For finding specific strings in the text
# Import packages for data visualization
import networkx as nx
import matplotlib.pyplot as plt

#%% funtion to fete la poze de node a long de grupe ~ partaje
def fete_node_poze(grafe, partition_attr, partaje_ratibe, epsilon=.6):
        
    # fete la poze dict to pan partaje
    asle_partaje_poze_dict = {partition:nx.spiral_layout(grafe.subgraph([node for node, part in grafe.nodes(data=partition_attr)
                                                                                      if part == partition]))
                                for partition in partaje_ratibe}
    
    # update the x coordinate in the position dicts so partitions
    # don't overlap and are in the specified order left-to-right
    final_poze_dict = asle_partaje_poze_dict[partaje_ratibe[0]]
    for i,partition in enumerate(partaje_ratibe[1:]):
        # get the largest x coordinate from the previous partition's nodes
        max_previous = max([x for x,y in final_poze_dict.values()])
        # get smallest x coordinate from this partition's nodes
        current_min = min([x for x,y in asle_partaje_poze_dict[partition].values()])
        # update the x coordinates for this partition to be at least epsilon units
        # to the right of the right-most node in the previous partition
        final_poze_dict.update({node:(pos[0]+max_previous+abs(current_min)+epsilon,pos[1])
                                               for node,pos in asle_partaje_poze_dict[partition].items()})
    return(final_poze_dict)

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
afrasia_baxe = [ 'ara', 'tur', 'swa', 'hau' ]
dongasia_baxe = [ 'zho', 'yue', 'jpn', 'kor', 'vie' ]

baxe_nam = euro_baxe + hindiran_baxe + afrasia_baxe + dongasia_baxe

euro_grupe = kreate_baxe_grupe(euro_baxe, dataje, node_sizes)
hindiran_grupe = kreate_baxe_grupe(hindiran_baxe, dataje, node_sizes)
afrasia_grupe = kreate_baxe_grupe(afrasia_baxe, dataje, node_sizes)
dongasia_grupe = kreate_baxe_grupe(dongasia_baxe, dataje, node_sizes)

# konbine la grafe e spesife la asle grafe
asle_grafe = {'euro_grupe':{'grafe':euro_grupe,'color':'blue'},
               'hindiran_grupe':{'grafe':hindiran_grupe,'color':'gold'},
               'afrasia_grupe':{'grafe':afrasia_grupe,'color':'green'},
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

my_pos = fete_node_poze(G, partition_attr='partition', partaje_ratibe=[ 'dongasia_grupe', 'euro_grupe', 'hindiran_grupe', 'afrasia_grupe'])
nx.draw_networkx_nodes(G, my_pos, node_color=[c for n, c in G.nodes(data='color')], node_size=node_sizes)
'''
pos = nx.circular_layout(G)
nx.draw_networkx_nodes(G, pos,
                       nodelist=nodelist,
                       node_size=node_sizes,
                       node_color='black',
                       alpha=0.7)
'''
nx.draw_networkx_labels(G, my_pos)
'''
nx.draw_networkx_labels(G, pos=pos,
                        labels=dict(zip(nodelist,nodelist)),
                        font_color='white')
'''
'''
#nx.draw_networkx_edges(G, my_pos, edge_color=[c for u, v, c in G.edges(data='color')])

'''
nx.draw_networkx_edges(G,my_pos,
                       edgelist = widths.keys(),
                       width=list(widths.values()),
                       edge_color='lightblue',
                       alpha=0.6)



plt.savefig('html/grafe/konnete.png', dpi=300)


