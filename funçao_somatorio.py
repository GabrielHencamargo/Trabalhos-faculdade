import numpy as np
import pandas as pd
from math import radians,sin,cos,sqrt,atan2

############## Calculo de distancias####################
def distancia_euclidiana(filial,pedido): # simplificação dos calculos feita por mim
    latitude = (filial[0] - pedido[0])
    longitude = (filial[1] - pedido[1])
    latitude = (latitude * 111.1) #multiplicando a latitude pela diferença de 1 grau de latitude
    longitude = (longitude * 96.2) # multiplicando a longitude pela diferença de 1 grau de longitude
    return np.sqrt(latitude**2 + longitude**2)

def distancia_lat_long_km(filial,pedido): # algoritmo de calculo da distancia feito pela Myllene
    # converte graus em radianos
    lat1, lon1, lat2, lon2 = map(radians, [filial[0], filial[1], pedido[0], pedido[1]])
    
    # raio da Terra em km
    R = 6371
    
    # diferença de latitude e longitude
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    
    # fórmula Haversine
    a = sin(dlat/2)**2 + cos(lat1)*cos(lat2)*sin(dlon/2)**2
    c = 2*atan2(sqrt(a), sqrt(1-a))
    distancia = R*c
    
    return distancia
# diferença entre os algoritmo de cerca de 3% de erro do primeiro para o segundo
# O algoritmo distancia_lat_long_km será o utilizado

########## Função generica de calculo da distancia total do dia #########

def calcular(N,X):
    atribuicao = {}
    for item in range(len(N)):
        atribuicao[item] = []
    somatorio = []
    for pedido in X :
        distancia_min = 100000  # distancia iniciada em um valor alto, para garantir a troca no primeiro loop
        i = -1 #variavel gambiarra pra achar o index do array numpy
        for filial in N:
            dist = distancia_lat_long_km(filial,pedido)
            dist += distancia_lat_long_km(_armazens[0],filial) # acrescenta a distancia da filial ao armazem
            i += 1
            if(dist < distancia_min): # troca somente se a distancia total for menor que a anterior
                distancia_min = dist
                salva_filial = i            
        atribuicao[salva_filial].append(pedido)
        somatorio.append(dist)
    resultado = 0
    for i in somatorio:
        resultado += i
    return atribuicao,resultado        
    
############## Inputs#######################

_filiais = pd.read_excel('C:/Users/gabri/OneDrive/Documentos/Martins/filiais.xlsx') #inputs temporarios para testes
_clientes = pd.read_excel('C:/Users/gabri/OneDrive/Documentos/Martins/clientes1novembro.xlsx')
_armazens = pd.read_excel('C:/Users/gabri/OneDrive/Documentos/Martins/armazens.xlsx')

_filiais = _filiais.values
_clientes = _clientes.values
_armazens = _armazens.values
plot,distancia_total = calcular(_filiais,_clientes)

################ impressao de resultado###############

print(distancia_total)
