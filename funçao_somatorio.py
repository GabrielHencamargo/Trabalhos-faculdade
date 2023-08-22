import numpy as np
import pandas as pd



def distancia_euclidiana(filial,pedido):
    latitude = (filial[0] - pedido[0])
    longitude = (filial[1] - pedido[1])
    latitude = (latitude * 111.1) #multiplicando a latitude pela diferença de 1 grau de latitude
    longitude = (longitude * 96.2) # multiplicando a longitude pela diferença de 1 grau de longitude
    return np.sqrt(latitude**2 + longitude**2)

def calcular(N,X):
    atribuicao = {}
    for item in range(len(N)):
        atribuicao[item] = []
    somatorio = []
    for pedido in X :
        distancia_min = 100000  # distancia iniciada em um valor alto, para garantir a troca no primeiro loop
        i = -1 #variavel gambiarra pra achar o index do array numpy
        for filial in N:
            dist = distancia_euclidiana(filial,pedido)
            dist += distancia_euclidiana(_armazens[0],filial) # acrescenta a distancia da filial ao armazem
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

_filiais = pd.read_excel('C:/Users/gabri/OneDrive/Documentos/Martins/filiais.xlsx') #inputs temporarios para testes
_clientes = pd.read_excel('C:/Users/gabri/OneDrive/Documentos/Martins/clientes1novembro.xlsx')
_armazens = pd.read_excel('C:/Users/gabri/OneDrive/Documentos/Martins/armazens.xlsx')

_filiais = _filiais.values
_clientes = _clientes.values
_armazens = _armazens.values
plot,distancia_total = calcular(_filiais,_clientes)

print(distancia_total)