#!/usr/bin/python

from SimpleCV import Camera, Display, Image
import matplotlib.pyplot as plt
import time

cam = Camera()
img = cam.getImage().save("img.jpg")
img = Image("img.jpg")
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
