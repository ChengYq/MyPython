% KNN�㷨���з��࣬�����������
%KNN�㷨�Ĺؼ���1.��һ�� 2.K��ѡ�� 3.������֤
%���룺
%�����ͨ��������֤������ֵgoodΪ���Ԥ��ʱ��k��ֵ
%% ��ȡ����
clear
load('data.mat');
[Iris_setosa_source,Iris_setosa_target,Iris_virginica_source,Iris_virginica_target,Iris_versicolor_source,Iris_versicolor_target]=get_data(45);
%% ��һ������
norm_setosa_source=MyNorm(Iris_setosa_source);
norm_setosa_target=MyNorm(Iris_setosa_target);
norm_virginica_source=MyNorm(Iris_virginica_source);
norm_virginica_target=MyNorm(Iris_virginica_target);
norm_versicolor_source=MyNorm(Iris_versicolor_source);
norm_versicolor_target=MyNorm(Iris_versicolor_target);

%% ���������´�����sourceƴ��Ϊһ�������ͬʱ�ڵ����м���0��1��2���������ֲ�ͬ�����

source1=[norm_setosa_source,0*ones(size(norm_setosa_source,1),1)];%0��setosa
source2=[norm_virginica_source,ones(size(norm_virginica_source,1),1)];% 1��virginica
source3=[norm_versicolor_source,2*ones(size(norm_versicolor_source,1),1)];%2��versicolor

source=[source1;source2;source3];
%% �������,���������������������ݣ���ÿһ����ʹ��K�����㷨
%���������Ԥ���д��һ���ˣ�Ҫ����������ά��Ҫһ��
k=1;
good=0;
while k<=50 %��������ѡ��
for i=1:size(norm_setosa_target,1)
    to_test1=norm_setosa_target(i,:);
    to_test2=norm_virginica_target(i,:);
    to_test3=norm_versicolor_target(i,:);
    MyAns(1,i) = k_dist(to_test1,source,k);%����ʹ��MyAns���洢�����
    MyAns(2,i) = k_dist(to_test2,source,k);
    MyAns(3,i) = k_dist(to_test3,source,k);
end

%% ����������ͳ��Ԥ��Ľ��
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
        x=sprintf('Ԥ��setosaʱ���ɹ���Ϊ%f',setosa_num/hangshu);
        success1=setosa_num/hangshu;
        disp(x)
    case 2
        type='virginica';
        x=sprintf('Ԥ��virginicaʱ���ɹ���Ϊ%f',virginica/hangshu);
        success2=virginica/hangshu;
        disp(x)
    case 3
        type='versicolor';
        x=sprintf('Ԥ��versicolorʱ���ɹ���Ϊ%f',versicolor/hangshu);
        success3=versicolor/hangshu;
        disp(x)
                disp('-------------------------')
end

% x=sprintf('Ԥ��%sʱ����Ϊ��setosa��%d�֣�virginica��%d�֣�versicolor��%d��',type,setosa_num,virginica,versicolor);

% disp(x)

end

if success1>0.5&&success2>0.5&&success3>0.5;%Ϊ��Ѱ�����ֵ
    good=k;
end
success1=0;
success2=0;
success3=0;
k=k+1;
end
%[~,index]=max(to_find)
good







