%% ����������ŷʽ����ļ���
%���룺source����,����target��¼,kNN�㷨��k
function neariest = dist(source,target,k)
[row,~]=size(source);
dist=zeros(1,row);
for i=1:row
	for j=1:2
	dist(i)=dist(i)+(target(j)-source(i,j))^2;
	end
end
[sss,index]=sort(dist);
neariest= mode(source(index(1:k),3));
end
