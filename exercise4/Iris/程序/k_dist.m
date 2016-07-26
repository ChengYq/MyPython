% 使用k距离算法计算距离
%输入：待测数据,数据集
%输出：距离最近的一个分类
function [nearest]=k_dist(unknown,source,k)
    [~,un_col]=size(unknown);
    [sor_row,~]=size(source);
    %% 一下采用的是麦哈顿距离
    
%     for i=1:sor_row
%         sum(i)=0;
%         for j=1:un_col
%             sum(i)=sum(i)+abs(unknown(j)-source(i,j));
%         end
%     end
%% 以下采用切比雪夫距离
for i=1:sor_row
    sum(i)=max([abs(unknown(1)-source(i,1)),abs(unknown(2)-source(i,2)),abs(unknown(3)-source(i,3)),abs(unknown(4)-source(i,4))]);
end



   %[~,in]=min(sum);
    %nearest=source(in,5);%这里用到的策略，就是找到距离最近的那个，但是实践发现效果不好，可能是因为k距离算法对个别数据的依赖程度比较大
    [~,ind]=sort(sum);
    nearest = mode(source(ind(1:k),5));%这里用到的策略，就是看最近距离的前k个，哪个分类出现的次数多，就分为那一类，具体这个k怎么找，海选哦进一步的思考
    
end