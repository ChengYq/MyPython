% ʹ��k�����㷨�������
%���룺��������,���ݼ�
%��������������һ������
function [nearest]=k_dist(unknown,source,k)
    [~,un_col]=size(unknown);
    [sor_row,~]=size(source);
    %% һ�²��õ�������پ���
    
%     for i=1:sor_row
%         sum(i)=0;
%         for j=1:un_col
%             sum(i)=sum(i)+abs(unknown(j)-source(i,j));
%         end
%     end
%% ���²����б�ѩ�����
for i=1:sor_row
    sum(i)=max([abs(unknown(1)-source(i,1)),abs(unknown(2)-source(i,2)),abs(unknown(3)-source(i,3)),abs(unknown(4)-source(i,4))]);
end



   %[~,in]=min(sum);
    %nearest=source(in,5);%�����õ��Ĳ��ԣ������ҵ�����������Ǹ�������ʵ������Ч�����ã���������Ϊk�����㷨�Ը������ݵ������̶ȱȽϴ�
    [~,ind]=sort(sum);
    nearest = mode(source(ind(1:k),5));%�����õ��Ĳ��ԣ����ǿ���������ǰk�����ĸ�������ֵĴ����࣬�ͷ�Ϊ��һ�࣬�������k��ô�ң���ѡŶ��һ����˼��
    
end