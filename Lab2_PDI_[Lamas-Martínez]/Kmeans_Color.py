#!/usr/bin/python

from SimpleCV import Camera, Display, Image
from sklearn.cluster import MiniBatchKMeans
import numpy as np
import cv2
import matplotlib.pyplot as plt
import time

cam = Camera()
image = cam.getImage().save("imagen.jpg")

img = Image("imagen.jpg")
img.show()

print("Ingrese numero de Clusters: ")
clusters = input()

image = cv2.imread("imagen.jpg")

(h, w) = image.shape[:2]

image = cv2.cvtColor(image, cv2.COLOR_BGR2LAB)
image = image.reshape((image.shape[0] * image.shape[1], 3))
clt = MiniBatchKMeans(n_clusters = clusters)
labels = clt.fit_predict(image)
quant = clt.cluster_centers_.astype("uint8")[labels]

quant = quant.reshape((h, w, 3))
image = image.reshape((h, w, 3))

quant = cv2.cvtColor(quant, cv2.COLOR_LAB2BGR)
image = cv2.cvtColor(image, cv2.COLOR_LAB2BGR)


cv2.imshow("image", np.hstack([image, quant]))
cv2.imwrite("imgkmeans.jpg",quant)
cv2.waitKey(0)
