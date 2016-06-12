#!/usr/bin/python

from SimpleCV import Camera, Display, Image
import matplotlib.pyplot as plt

cam = Camera()
img = cam.getImage()
imggray =  img.grayscale().save("imggray.jpg")
imggray = Image("imggray.jpg")
(red, green, blue) = img.splitChannels(False)

# Edge detection with diferents algorithms on SCV.

# "Edges" Command.
imggray_edge = imggray.edges().save("imggray_edges.jpg")
red_edge = red.edges().save("imgred_edges.jpg")
green_edge = green.edges().save("imggreen_edges.jpg")
blue_edge = blue.edges().save("imgblue_edges.jpg")

# "morphGradient" Command
imggray_edge = imggray.morphGradient().save("imggray_edges_morphGradient.jpg")
red_edge = red.morphGradient().save("imgred_edges_morphGradient.jpg")
green_edge = green.morphGradient().save("imggreen_edges_morphGradient.jpg")
blue_edge = blue.morphGradient().save("imgblue_edges_morphGradient.jpg")

# "sobel" Command
imggray_edge = imggray.sobel().save("imggray_edges_sobel.jpg")
red_edge = red.sobel().save("imgred_edges_sobel.jpg")
green_edge = green.sobel().save("imggreen_edges_sobel.jpg")
blue_edge = blue.sobel().save("imgblue_edges_sobel.jpg")
