#!/usr/bin/python

from SimpleCV import Camera, Display, Image

img = Image("img4.png")
imggray =  img.grayscale().save("img4gray.png")
imggray = Image("img4gray.png")
(red, green, blue) = img.splitChannels(False)

# Edge detection with diferents algorithms on SCV.

# "Edges" Command.
imggray_edge = imggray.edges().save("img4gray_edges.png")
red_edge = red.edges().save("img4red_edges.png")
green_edge = green.edges().save("img4green_edges.png")
blue_edge = blue.edges().save("img4blue_edges.png")

# "morphGradient" Command
imggray_edge = imggray.morphGradient().save("img4gray_edges_morphGradient.png")
red_edge = red.morphGradient().save("img4red_edges_morphGradient.png")
green_edge = green.morphGradient().save("img4green_edges_morphGradient.png")
blue_edge = blue.morphGradient().save("img4blue_edges_morphGradient.png")

# "sobel" Command
imggray_edge = imggray.sobel().save("img4gray_edges_sobel.png")
red_edge = red.sobel().save("img4red_edges_sobel.png")
green_edge = green.sobel().save("img4green_edges_sobel.png")
blue_edge = blue.sobel().save("img4blue_edges_sobel.png")
