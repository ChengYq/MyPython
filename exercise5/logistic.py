# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt
data=np.loadtxt("C:\\documents\\Python\\Prog\\exercise5\\testSet.txt")
def sigmoid(x):
    return 1.0/(1+np.exp(-x))
MyTheta=np.zeros((3,1))
for ite_time in xrange(800):
    Mysum=0
    for sample_ind in xrange(data.shape[0]):
        feature=np.column_stack((np.array([1]),data[sample_ind:sample_ind+1,0:2]))
        Mysum=Mysum+(data[sample_ind,2]-sigmoid(np.dot(feature,MyTheta)))*feature.transpose()
    MyTheta=MyTheta+Mysum*0.01
print MyTheta

##以下为画图部分
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
x1=np.arange(-5,5,0.001)
x2=-(MyTheta[0]+MyTheta[1]*x1)/MyTheta[2]
ax1.scatter(res1[:,0],res1[:,1],c='red')
ax1.scatter(res2[:,0],res2[:,1],c='blue')
ax1.plot(x1,x2)
plt.show()

        # print feature
        # Mysum=Mysum+(data[sample_ind,2]-sigmoid())
