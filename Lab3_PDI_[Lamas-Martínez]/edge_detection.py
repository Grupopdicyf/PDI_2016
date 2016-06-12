#!/usr/bin/python

from SimpleCV import Camera, Display, Image
import matplotlib.pyplot as plt

img8 = Image("img8.jpg")
img8gray =  img8.grayscale().save("img8gray.jpg")
img8gray = Image("img8gray.jpg")
(red, green, blue) = img8.splitChannels(False)

# Edge detection with diferents algorithms on SCV.

# "Edges" Command.
img8gray_edge = img8gray.edges().save("img8gray_edges.jpg")
red_edge = red.edges().save("img8red_edges.jpg")
green_edge = green.edges().save("img8green_edges.jpg")
blue_edge = blue.edges().save("img8blue_edges.jpg")

# "morphGradient" Command
img8gray_edge = img8gray.morphGradient().save("img8gray_edges_morphGradient.jpg")
red_edge = red.morphGradient().save("img8red_edges_morphGradient.jpg")
green_edge = green.morphGradient().save("img8green_edges_morphGradient.jpg")
blue_edge = blue.morphGradient().save("img8blue_edges_morphGradient.jpg")

# "sobel" Command
img8gray_edge = img8gray.sobel().save("img8gray_edges_sobel.jpg")
red_edge = red.sobel().save("img8red_edges_sobel.jpg")
green_edge = green.sobel().save("img8green_edges_sobel.jpg")
blue_edge = blue.sobel().save("img8blue_edges_sobel.jpg")
