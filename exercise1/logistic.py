# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
data=np.loadtxt('C:\\documents\\Python\\Prog\\exercise1\\college.txt')
data=data.transpose()
def sigmod(x):
    return 1.0/(1+np.exp(-x))
MyTheta=np.array(([0],[0],[0],[0]))
for i in range(100):
    Mysum = np.array(([0],[0],[0],[0]))
    for ind in range(data.shape[1]):
        hx=float(sigmod(np.dot(MyTheta.transpose(), np.vstack((np.array(([1])), data[0:3, ind:ind + 1])))))
        # print np.vstack((np.array(([1])), data[0:3, ind:ind + 1]))
        # print "i=%d,ind=%d" %(i,ind)
        # print hx
        # print data[3,ind]-hx
        # print '------------------------------'
        Mysum=Mysum+(data[3,ind]-hx)*np.vstack((np.array(([1])),data[0:3,ind:ind+1]))
    MyTheta=MyTheta+0.1*Mysum
print MyTheta
# h(x)=theta0+theta1*x0+theta2*x1+theta3*x2，如果要画图，就是
data=np.loadtxt('C:\\documents\\Python\\Prog\\exercise1\\college.txt')
# draw(data):
x0=[]   #暂存分类结果为0的x0
y0=[]   #暂存分类结果为0的x1
z0=[]   #暂存分类结果为0的x2
x1=[]   #暂存分类结果为1的x0
y1=[]   #暂存分类结果为1的x1
z1=[]   #暂存分类结果为1的x2
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
ax3=fig.gca(projection='3d')
# ax3.scatter(x1,y1,z1,color='yellow')
# ax3.scatter(x0,y0,z0,color='blue')

xx=np.arange(0,1,0.01)
yy=np.arange(0,1,0.01)
xx,yy=np.meshgrid(xx,yy)
zz=(-1)*(MyTheta[0]+MyTheta[1]*xx+MyTheta[2]*yy)/float(MyTheta[3])
#也就是x2=-(theta0+theta1*x0+theta2*x1)/theta3
ax3.plot_surface(xx,yy,zz)
plt.xlabel('x')
plt.ylabel('y')
plt.show()


