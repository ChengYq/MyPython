# -*- coding: utf-8 -*-
#由于是4个不同的属性，可以画6副子图，因为C_4^2，然后画出scatter图，一目了然
import numpy as np
import matplotlib.pyplot as plt
data=open("C:\\documents\\Python\\Prog\\exercise4\\bezdekIris.data.txt")
myData=[]
temp=[]
for row in data.readlines():
    temp=row.split(',')
    if temp[4]=='Iris-setosa\n': #Iris-setosa是0，Iris-versicolor是1，Iris-virginica是2
        temp[4]=0
    elif temp[4]=='Iris-versicolor\n':
        temp[4]=1
    else:
        temp[4]=2
    myData.append(temp)
myData=np.array(myData)
setosa=myData[0:50,0:5]
versicolor=myData[50:100,0:5]
virginica=myData[100:150,0:5]
fig=plt.figure()
ax1=fig.add_subplot(231)
ax1.scatter(setosa[:,0],setosa[:,1],c='red')
ax1.scatter(versicolor[:,0],versicolor[:,1],c='green')
ax1.scatter(virginica[:,0],virginica[:,1],c='blue')
ax1.set_title('0 and 1')
ax2=fig.add_subplot(232)
ax2.scatter(setosa[:,0],setosa[:,2],c='red')
ax2.scatter(versicolor[:,0],versicolor[:,2],c='green')
ax2.scatter(virginica[:,0],virginica[:,2],c='blue')
ax2.set_title('0 and 2')
ax3=fig.add_subplot(233)
ax3.scatter(setosa[:,0],setosa[:,3],c='red')
ax3.scatter(versicolor[:,0],versicolor[:,3],c='green')
ax3.scatter(virginica[:,0],virginica[:,3],c='blue')
ax3.set_title('0 and 3')
ax4=fig.add_subplot(234)
ax4.scatter(setosa[:,1],setosa[:,2],c='red')
ax4.scatter(versicolor[:,1],versicolor[:,2],c='green')
ax4.scatter(virginica[:,1],virginica[:,2],c='blue')
ax4.set_title('1 and 2')
ax5=fig.add_subplot(235)
ax5.scatter(setosa[:,1],setosa[:,3],c='red')
ax5.scatter(versicolor[:,1],versicolor[:,3],c='green')
ax5.scatter(virginica[:,1],virginica[:,3],c='blue')
ax5.set_title('1 and 3')
ax6=fig.add_subplot(236)
ax6.scatter(setosa[:,2],setosa[:,3],c='red')
ax6.scatter(versicolor[:,2],versicolor[:,3],c='green')
ax6.scatter(virginica[:,2],virginica[:,3],c='blue')
ax6.set_title('2 and 3')
plt.show()

