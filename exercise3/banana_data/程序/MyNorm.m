%���������ڽ�������й�һ��
%���룺����һ���ľ���
%������Ѿ���һ���ľ���
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