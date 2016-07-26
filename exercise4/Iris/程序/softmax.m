%softmax回归算法
%k距离算法的效果不忍直视
%% 获取数据
clear
load('data.mat');
[Iris_setosa_source,Iris_setosa_target,Iris_virginica_source,Iris_virginica_target,Iris_versicolor_source,Iris_versicolor_target]=get_data(45);
%% 归一化数据
norm_setosa_source=MyNorm(Iris_setosa_source);
norm_setosa_target=MyNorm(Iris_setosa_target);
norm_virginica_source=MyNorm(Iris_virginica_source);
norm_virginica_target=MyNorm(Iris_virginica_target);
norm_versicolor_source=MyNorm(Iris_versicolor_source);
norm_versicolor_target=MyNorm(Iris_versicolor_target);
%% 将数据重新处理，将source拼接为一个大矩阵，同时在第五列加上0，1，2，用以区分不同的类别

source1=[norm_setosa_source,0*ones(size(norm_setosa_source,1),1)];%0是setosa
source2=[norm_virginica_source,ones(size(norm_virginica_source,1),1)];% 1是virginica
source3=[norm_versicolor_source,2*ones(size(norm_versicolor_source,1),1)];%2是versicolor

source=[source1;source2;source3];
[source_row,~]=size(source);
%% 计算theta的值，因为这个题目要分为三类，所以说要计算三个theta,分别是theta1,theta2,theta3
%下边是theta1的计算,theta1代表的是编号为0这个类别，也就是setosa
old_theta1=0.5*ones(4,1)%初始值;
old_theta2=0.5*ones(4,1);
old_theta3=0.5*ones(4,1);
grad1=zeros(4,1);
grad2=zeros(4,1);
grad3=zeros(4,1);
new_theta1=zeros(4,1);
new_theta2=zeros(4,1);
new_theta3=zeros(4,1);
alpha=0.01;
for row=1:source_row
    grad1=grad1+((source(row,5)==0)-((exp(old_theta1'*source(row,[1:4])'))/(exp(old_theta1'*source(row,[1:4])')+exp(old_theta2'*source(row,[1:4])')+exp(old_theta3'*source(row,[1:4])'))))*source(row,[1:4])';
    grad2=grad2+((source(row,5)==1)-((exp(old_theta2'*source(row,[1:4])'))/(exp(old_theta1'*source(row,[1:4])')+exp(old_theta2'*source(row,[1:4])')+exp(old_theta3'*source(row,[1:4])'))))*source(row,[1:4])';
    grad3=grad3+((source(row,5)==2)-((exp(old_theta3'*source(row,[1:4])'))/(exp(old_theta1'*source(row,[1:4])')+exp(old_theta2'*source(row,[1:4])')+exp(old_theta3'*source(row,[1:4])'))))*source(row,[1:4])';
  end
while abs(new_theta1-old_theta1)>=0.1*ones(4,1)
    new_theta1 = old_theta1 + alpha*grad1;%grad是一个向量
end
while abs(new_theta2-old_theta2)>=0.1*ones(4,1)
    new_theta2 = old_theta2 + alpha*grad2;%grad是一个向量
end
 while abs(new_theta3-old_theta3)>=0.1*ones(4,1)
     new_theta3 = old_theta3 + alpha*grad3;%grad是一个向量
 end
    exp(new_theta1'*Iris_setosa_target(2,:)')
    exp(new_theta2'*Iris_setosa_target(2,:)')
    exp(new_theta3'*Iris_setosa_target(2,:)')
