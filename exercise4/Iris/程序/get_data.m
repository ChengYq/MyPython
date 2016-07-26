%���������ã�����source��target�ģ�
%���������������,source�ĸ�������ôʣ�µľ���target�ĸ���
%���ز��������зָ�֮���source,target
function [Iris_setosa_source,Iris_setosa_target,Iris_virginica_source,Iris_virginica_target,Iris_versicolor_source,Iris_versicolor_target] = get_data(source_num)
     load('data.mat');
     rand_ans=rand(1,50);
     [~,sort_index]=sort(rand_ans);
     Iris_setosa_source = Iris_setosa(sort_index(1:source_num),:);
     Iris_setosa_target = Iris_setosa(sort_index(source_num+1:50),:);
     
     Iris_virginica_source = Iris_virginica(sort_index(1:source_num),:);
     Iris_virginica_target = Iris_virginica(sort_index(source_num+1:50),:);
     
     Iris_versicolor_source = Iris_versicolor(sort_index(1:source_num),:);
     Iris_versicolor_target = Iris_versicolor(sort_index(source_num+1:50),:);
     
end