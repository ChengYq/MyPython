%本函数用于将矩阵进行归一化
%输入：待归一化的矩阵
%输出：已经归一化的矩阵
function [mat]=MyNorm(mat)
    [row,col] = size(mat);
    for j=1:col-1
        max_value=max(mat(:,j));
        min_value=min(mat(:,j));
        for i=1:row
            mat(i,j)=(mat(i,j)-min_value)/(max_value-min_value);
        end
    end
end