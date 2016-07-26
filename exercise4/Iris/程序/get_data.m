%本函数作用：产生source和target的，
%输入参数：变量名,source的个数，那么剩下的就是target的个数
%返回参数：进行分割之后的source,target
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