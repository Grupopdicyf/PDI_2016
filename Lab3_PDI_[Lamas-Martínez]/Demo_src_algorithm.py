#!/usr/bin/python

#   Implementation of
#   Spectral Ratio Contrast Algorithm for Edge Detection.
#   Cristian Martínez - Felipe Lamas.

from SimpleCV import Camera, Display, Image
import matplotlib.pyplot as plt
import numpy as np
import cv2

cam = Camera()
img = cam.getImage().save("imgdemo.jpg")
img = Image("imgdemo.jpg")
(imgred, imggreen, imgblue) = img.splitChannels(False)

# Vector patron que caracteriza ambos materiales mediante divisiones
# de sus promedios de pixeles en cada banda (por simplicidad se obtuvieron
# estos valores mediante MATLAB).
rhor = []

#  Deteccion de Borde.

# Lectura y separacion en 3 bandas (R, G, y B) de imagen
# para deteccion de bordes de lunar.
imgred = double(imgred)
imggreen = double(imggreen)
imgblue = double(imgblue)
imgred = np.imgred
imggreen = np.imgreen
imgblue = np.imblue

# Parametro de tolerancia (Se debe ajustar para lograr eficaz
# deteccion y minimizacion de ruido).
epsilon = 0.36

# Preasignacion de variable para velocidad en iteracion.
Edges = zeros((480,640))

# Proceso de deteccion de borde de lunar mediante division
# de pixeles con mascara de 3x3.
for i in range 2:479
    for j in range 2:639
        kappahoriz1 = np.array(imgred[i-1,j]./imgred[i+1,j].,imgred[i-1,j]./imggreen[i+1,j].,imgred[i-1,j]./imgblue[i+1,j].,imggreen[i-1,j]./imgred[i+1,j].,imggreen[i-1,j]./imggreen[i+1,j].,imggreen[i-1,j]./imgblue[i+1,j].,imgblue[i-1,j]./imgred[i+1,j].,imgblue[i-1,j]./imggreen[i+1,j].,imgblue[i-1,j]./imgblue[i+1,j].)
        kappahoriz2 = np.array(imgred[i+1,j]./imgred[i-1,j].,imgred[i+1,j]./imggreen[i-1,j].,imgred[i+1,j]./imgblue[i-1,j].,imggreen[i+1,j]./imgred[i-1,j].,imggreen[i+1,j]./imggreen[i-1,j].,imggreen[i+1,j]./imgblue[i+1,j].,imgblue[i-1,j]./imgred[i+1,j].,imgblue[i+1,j]./imggreen[i-1,j].,imgblue[i+1,j]./imgblue[i-1,j].)
        x[1] = max(abs(kappahoriz1 - rhor)) < epsilon # Si el mayor valor de la diferencia absoluta cumple
        # la condicion, entonces las demas tambien lo hacen.
        x[2] = max(abs(kappahoriz2 - rhor)) < epsilon # Si el mayor valor de la diferencia absoluta cumple
        # la condicion, entonces las demas tambien lo hacen.
        
        kappavert1 = np.array(imgred[i,j-1]./imgred[i,j+1].,imgred[i,j-1]./imggreen[i,j+1].,imgred[i,j-1]./imgblue[i,j+1].,imggreen[i,j-1]./imgred[i,j+1].,imggreen[i,j-1]./imggreen[i,j+1].,imggreen[i,j-1]./imgblue[i,j+1].,imgblue[i,j-1]./imgred[i,j+1].,imgblue[i,j-1]./imggreen[i,j+1].,imgblue[i,j-1]./imgblue[i,j+1].)
        kappavert2 = np.array(imgred[i,j+1]./imgred[i,j-1].,imgred[i,j+1]./imggreen[i,j-1].,imgred[i,j+1]./imgblue[i,j-1].,imggreen[i,j+1]./imgred[i,j-1].,imggreen[i,j+1]./imggreen[i,j-1].,imggreen[i,j+1]./imgblue[i,j-1].,imgblue[i,j+1]./imgred[i,j-1].,imgblue[i,j+1]./imggreen[i,j-1].,imgblue[i,j+1]./imgblue[i,j-1].)
        x[3] = max(abs(kappavert1 - rhor)) < epsilon # Si el mayor valor de la diferencia absoluta cumple
        # la condicion, entonces las demas tambien lo hacen.
        x[4] = max(abs(kappavert2 - rhor)) < epsilon # Si el mayor valor de la diferencia absoluta cumple
        # la condicion, entonces las demas tambien lo hacen.
        
        kappadiag11 = np.array([imgred[i-1,j-1]./imgred[i+1,j+1].,imgred[i-1,j-1]./imggreen[i+1,j+1].,imgred[i-1,j-1]./imgblue[i+1,j+1].,imggreen[i-1,j-1]./imgred[i+1,j+1].,imggreen[i-1,j-1]./imggreen[i+1,j+1].,imggreen[i-1,j-1]./imgblue[i+1,j+1].,imgblue[i-1,j-1]./imgred[i+1,j+1].,imgblue[i-1,j-1]./imggreen[i+1,j+1].,imgblue[i-1,j-1]./imgblue[i+1,j+1].)
        kappadiag12 = np.array(imgred[i+1,j+1]./imgred[i-1,j-1].,imgred[i+1,j+1]./imggreen[i-1,j-1].,imgred[i+1,j+1]./imgblue[i-1,j-1].,imggreen[i+1,j+1]./imgred[i-1,j-1].,imggreen[i+1,j+1]./imggreen[i-1,j-1].,imggreen[i+1,j+1]./imgblue[i-1,j-1].,imgblue[i+1,j+1]./imgred[i-1,j-1].,imgblue[i+1,j+1]./imggreen[i-1,j-1].,imgblue[i+1,j+1]./imgblue[i-1,j-1].)
        x[5] = max(abs(kappadiag11 - rhor)) < epsilon # Si el mayor valor de la diferencia absoluta cumple
        # la condicion, entonces las demas tambien lo hacen.
        x[6] = max(abs(kappadiag12 - rhor)) < epsilon # Si el mayor valor de la diferencia absoluta cumple
        # la condicion, entonces las demas tambien lo hacen.
        
        kappadiag21 = np.array(imgred[i-1,j+1]./imgred[i+1,j-1].,imgred[i-1,j+1]./imggreen[i+1,j-1].,imgred[i-1,j+1]./imgblue[i+1,j-1].,imggreen[i-1,j+1]./imgred[i+1,j-1].,imggreen[i-1,j+1]./imggreen[i+1,j-1].,imggreen[i-1,j+1]./imgblue[i+1,j-1].,imgblue[i-1,j+1]./imgred[i+1,j-1].,imgblue[i-1,j+1]./imggreen[i+1,j-1].,imgblue[i-1,j+1]./imgblue[i+1,j-1].)
        kappadiag22 = np.array(imgred[i+1,j-1]./imgred[i-1,j+1].,imgred[i+1,j-1]./imggreen[i-1,j+1].,imgred[i+1,j-1]./imgblue[i-1,j+1].,imggreen[i+1,j-1]./imgred[i-1,j+1].,imggreen[i+1,j-1]./imggreen[i-1,j+1].,imggreen[i+1,j-1]./imgblue[i-1,j+1].,imgblue[i+1,j-1]./imgred[i-1,j+1].,imgblue[i+1,j-1]./imggreen[i-1,j+1].,imgblue[i+1,j-1]./imgblue[i-1,j+1].)
        x[7] = max(abs(kappadiag21 - rhor)) < epsilon # Si el mayor valor de la diferencia absoluta cumple
        # la condicion, entonces las demas tambien lo hacen.
        x[8] = max(abs(kappadiag22 - rhor)) < epsilon # Si el mayor valor de la diferencia absoluta cumple
        # la condicion, entonces las demas tambien lo hacen.
        
        # Llenado de matriz de borde.
        Edges[i,j] = any(x) # Si alguno de los elementos del vector logico
        # x es distinto de cero (borde) se asignará éste a la matriz de
        # borde Edges.
    end
end

# Ciclo for para visualizar bordes de lunar en imagen original.
for i in range 1:480
    for j in range 1:640
        if(Edges[i,j] ~= 0)
            imgred[i,j] = 255 # Con esto podremos visualizar
            # el borde con color rojo.
            imggren[i,j] = 0
            imgblue[i,j] = 0
        end
    end
end

plt.figure(1)
img.show()
