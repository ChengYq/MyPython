# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt
data=np.loadtxt('C:\\documents\\Python\Prog\\exercise2\\data1.txt')
data=data.transpose()
fig=plt.figure()
ax1=fig.gca()
ax1.scatter(data[:,0:1],data[:,1:2])
plt.show()