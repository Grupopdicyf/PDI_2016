#!/usr/bin/python

from SimpleCV import Camera, Display, Image
import numpy as np
import scipy.misc

img = Image("img4.png")
img = img.transpose()
(imgred, imggreen, imgblue) = img.splitChannels(False)

rhor = np.array([0.6650,0.7699,0.8573,0.4735,0.5482,0.6104,0.4339,0.5023,0.5593])

epsilon = 0.42

Edges = np.zeros((480,640))
x = [0,0,0,0,0,0,0,0]

for i in range (1,479):
	for j in range (1,639):
		[r1,g1,b1] = imgred.getPixel(i-1,j)
		[r2,g2,b2] = imgred.getPixel(i+1,j)
		[r3,g3,b3] = imggreen.getPixel(i-1,j)
		[r4,g4,b4] = imggreen.getPixel(i+1,j)
		[r5,g5,b5] = imgblue.getPixel(i-1,j)
		[r6,g6,b6] = imgblue.getPixel(i+1,j)
		kappahoriz1 = np.array([r1/r2,r1/g4,r1/b6,g3/r2,g3/g4,g3/b6,b5/r2,b5/g4,b5/b6])
		kappahoriz2 = np.array([r2/r1,r2/g3,r2/b5,g4/r1,g4/g3,g4/b5,b6/r1,b6/g3,b6/b5])
		difhor1 = kappahoriz1 - rhor
		difhor2 = kappahoriz2 - rhor
		for k in range (0,7):
			if difhor1[k] < 0:
				difhor1[k] = abs(difhor1[k])
			if difhor2[k] < 0:
				difhor2[k] = abs(difhor2[k])
		if max(difhor1) < epsilon:
			x[0] = 1
		else:
			x[0] = 0
		if max(difhor2) < epsilon:
			x[1] = 1
		else:
			x[1] = 0

		[r1,g1,b1] = imgred.getPixel(i,j-1)
		[r2,g2,b2] = imgred.getPixel(i,j+1)
		[r3,g3,b3] = imggreen.getPixel(i,j-1)
		[r4,g4,b4] = imggreen.getPixel(i,j+1)
		[r5,g5,b5] = imgblue.getPixel(i,j-1)
		[r6,g6,b6] = imgblue.getPixel(i,j+1)
		kappavert1 = np.array([r1/r2,r1/g4,r1/b6,g3/r2,g3/g4,g3/b6,b5/r2,b5/g4,b5/b6])
		kappavert2 = np.array([r2/r1,r2/g3,r2/b5,g4/r1,g4/g3,g4/b5,b6/r1,b6/g3,b6/b5])
		difver1 = kappavert1 - rhor
		difver2 = kappavert2 - rhor
		for k in range (0,7):
			if difver1[k] < 0:
				difver1[k] = abs(difver1[k])
			if difver2[k] < 0:
				difver2[k] = abs(difver2[k])
		if max(difver1) < epsilon:
			x[2] = 1
		else:
			x[2] = 0
		if max(difver2) < epsilon:
			x[3] = 1
		else:
			x[3] = 0

		[r1,g1,b1] = imgred.getPixel(i-1,j-1)
		[r2,g2,b2] = imgred.getPixel(i+1,j+1)
		[r3,g3,b3] = imggreen.getPixel(i-1,j-1)
		[r4,g4,b4] = imggreen.getPixel(i+1,j+1)
		[r5,g5,b5] = imgblue.getPixel(i-1,j-1)
		[r6,g6,b6] = imgblue.getPixel(i+1,j+1)
		kappadiag11 = np.array([r1/r2,r1/g4,r1/b6,g3/r2,g3/g4,g3/b6,b5/r2,b5/g4,b5/b6])
		kappadiag12 = np.array([r2/r1,r2/g3,r2/b5,g4/r1,g4/g3,g4/b5,b6/r1,b6/g3,b6/b5])
		difdiag11 = kappadiag11 - rhor
		difdiag12 = kappadiag12 - rhor
		for k in range (0,7):
			if difdiag11[k] < 0:
				difdiag11[k] = abs(difdiag11[k])
			if difdiag12[k] < 0:
				difdiag12[k] = abs(difdiag12[k])
		if max(difdiag11) < epsilon:
			x[4] = 1
		else:
			x[4] = 0
		if max(difdiag12) < epsilon:
			x[5] = 1
		else:
			x[5] = 0

		[r1,g1,b1] = imgred.getPixel(i-1,j+1)
		[r2,g2,b2] = imgred.getPixel(i+1,j-1)
		[r3,g3,b3] = imggreen.getPixel(i-1,j+1)
		[r4,g4,b4] = imggreen.getPixel(i+1,j-1)
		[r5,g5,b5] = imgblue.getPixel(i-1,j+1)
		[r6,g6,b6] = imgblue.getPixel(i+1,j-1)
		kappadiag21 = np.array([r1/r2,r1/g4,r1/b6,g3/r2,g3/g4,g3/b6,b5/r2,b5/g4,b5/b6])
		kappadiag22 = np.array([r2/r1,r2/g3,r2/b5,g4/r1,g4/g3,g4/b5,b6/r1,b6/g3,b6/b5])
		difdiag21 = kappadiag21 - rhor
		difdiag22 = kappadiag22 - rhor
		
		for k in range (0,7):
			if difdiag21[k] < 0:
				difdiag21[k] = abs(difdiag21[k])
			if difdiag22[k] < 0:
				difdiag22[k] = abs(difdiag22[k])
		if max(difdiag21) < epsilon:
			x[6] = 1
		else:
			x[6] = 0
		if max(difdiag22) < epsilon:
			x[7] = 1
		else:
			x[7] = 0
		
		Edges[i,j] = any(x)

for i in range (0,479):
	for j in range (0,639):
		if Edges[i,j] != 0:
			[r, g, b] = img[i,j]
			r = 255
			img[i,j] = [r, 0., 0.]

img = img.transpose()

scipy.misc.imsave('edges_mask_img4_with_src-algorithm.png', Edges)
img.save("edges_img4_with_src-algorithm.png")
