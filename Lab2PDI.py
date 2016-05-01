#!/usr/bin/env python

from SimpleCV import Camera, Display, Image
import matplotlib.pyplot as plt

cam = Camera()
img = cam.getImage()
img.show()
imgGray = img.grayscale()
hist = imgGray.histogram(255)
plt.plot(hist)
(red, green, blue) = img.splitChannels(False)
red_histogram = red.histogram(255)
green_histogram = green.histogram(255)
blue_histogram = blue.histogram(255)
plt.plot(red_histogram,'r')
plt.plot(red_histogram,'g')
plt.plot(red_histogram,'b')
