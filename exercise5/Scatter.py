# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt
data=np.loadtxt("C:\\documents\\Python\\Prog\\exercise5\\testSet.txt")
res1=[]*3
res2=[]*3
fig=plt.figure()
ax1=fig.gca()
for temp in data:
    if temp[2]==0:
        res1.append(temp.tolist())
    else:
        res2.append(temp.tolist())
res1=np.array(res1)
res2=np.array(res2)
ax1.scatter(res1[:,0],res1[:,1],c='red')
ax1.scatter(res2[:,0],res2[:,1],c='blue')
plt.show()
