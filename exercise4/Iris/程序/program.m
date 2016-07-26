% KNN算法进行分类，这个是主程序
%KNN算法的关键：1.归一化 2.K的选择 3.交叉验证
%输入：
%输出：通过交叉验证，返回值good为最佳预测时的k的值
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
%% 计算距离,这里依次输入多个待测数据，把每一个都使用K距离算法
%这里把三个预测的写在一起了，要求这三个的维数要一样
k=1;
good=0;
while k<=50 %用于特征选择
for i=1:size(norm_setosa_target,1)
    to_test1=norm_setosa_target(i,:);
    to_test2=norm_virginica_target(i,:);
    to_test3=norm_versicolor_target(i,:);
    MyAns(1,i) = k_dist(to_test1,source,k);%这里使用MyAns来存储结果。
    MyAns(2,i) = k_dist(to_test2,source,k);
    MyAns(3,i) = k_dist(to_test3,source,k);
end

%% 本部分用来统计预测的结果
 [hangshu,~]=size(norm_setosa_target);

for j=1:3
     setosa_num=0;
virginica=0;
versicolor=0;
for i=1:length(MyAns(j,:))
    switch MyAns(j,i)
        case 0 
            setosa_num=setosa_num+1;
        case 1
            virginica=virginica+1;
        case 2
            versicolor=versicolor+1;
    end
end
switch j
    case 1
        type='setosa';
        disp('-------------------------')
        x=sprintf('预测setosa时，成功率为%f',setosa_num/hangshu);
        success1=setosa_num/hangshu;
        disp(x)
    case 2
        type='virginica';
        x=sprintf('预测virginica时，成功率为%f',virginica/hangshu);
        success2=virginica/hangshu;
        disp(x)
    case 3
        type='versicolor';
        x=sprintf('预测versicolor时，成功率为%f',versicolor/hangshu);
        success3=versicolor/hangshu;
        disp(x)
                disp('-------------------------')
end

% x=sprintf('预测%s时，答案为：setosa有%d种，virginica有%d种，versicolor有%d种',type,setosa_num,virginica,versicolor);

% disp(x)

end

if success1>0.5&&success2>0.5&&success3>0.5;%为了寻找最大值
    good=k;
end
success1=0;
success2=0;
success3=0;
k=k+1;
end
%[~,index]=max(to_find)
good







