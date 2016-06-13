#!/usr/bin/python

from SimpleCV import Camera, Display, Image
import time

cam = Camera()
time.sleep(3)
img = cam.getImage()
imggray =  img.grayscale().save("imggray.png")
imggray = Image("imggray.png")
(red, green, blue) = img.splitChannels(False)

# Edge detection with diferents algorithms on SCV.

# "Edges" Command.
imggray_edge = imggray.edges().save("imggray_edges.png")
red_edge = red.edges().save("imgred_edges.png")
green_edge = green.edges().save("imggreen_edges.png")
blue_edge = blue.edges().save("imgblue_edges.png")

# "morphGradient" Command
imggray_edge = imggray.morphGradient().save("imggray_edges_morphGradient.png")
red_edge = red.morphGradient().save("imgred_edges_morphGradient.png")
green_edge = green.morphGradient().save("imggreen_edges_morphGradient.png")
blue_edge = blue.morphGradient().save("imgblue_edges_morphGradient.png")

# "sobel" Command
imggray_edge = imggray.sobel().save("imggray_edges_sobel.png")
red_edge = red.sobel().save("imgred_edges_sobel.png")
green_edge = green.sobel().save("imggreen_edges_sobel.png")
blue_edge = blue.sobel().save("imgblue_edges_sobel.png")
