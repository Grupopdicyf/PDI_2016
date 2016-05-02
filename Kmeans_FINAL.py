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
imgGray = img.grayscale().save("imgGray.jpg")
imgGray = Image("imgGray.jpg")
imgGray.show()
hist = imgGray.histogram(255)

(red, green, blue) = img.splitChannels(False)
red_histogram = red.histogram(255)
green_histogram = green.histogram(255)
blue_histogram = blue.histogram(255)
plt.figure(1)
plt.subplot(411)
plt.plot(hist)
plt.subplot(412)
plt.plot(red_histogram)
plt.subplot(413)
plt.plot(green_histogram)
plt.subplot(414)
plt.plot(blue_histogram)
plt.show()

print("Ingresar parametro para binarizar: ")
a = input()

imgBin = imgGray.binarize(a).save("imgBin.jpg")
imgBin = Image("imgBin.jpg")
imgBin.show()
time.sleep(10)

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
