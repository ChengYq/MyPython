# -*- coding: utf-8 -*-
# 本程序是导入数据并且画图的程序
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
data=np.loadtxt('C:\\documents\\Python\\Prog\\exercise1\\college.txt')
# draw(data):
x0=[]
y0=[]
z0=[]
x1=[]
y1=[]
z1=[]
myRes=data[:,3]
for i in range(len(myRes)):
    if myRes[i]==0:
        x0.append(data[i,0])
        y0.append(data[i,1])
        z0.append(data[i,2])
    else:
        x1.append(data[i, 0])
        y1.append(data[i, 1])
        z1.append(data[i, 2])
fig=plt.figure()
ax3=fig.add_subplot(111,projection='3d')
ax3.scatter(x1,y1,z1,color='yellow')
ax3.scatter(x0,y0,z0,color='blue')
plt.xlabel('x')
plt.ylabel('y')
plt.show()
# draw(data)