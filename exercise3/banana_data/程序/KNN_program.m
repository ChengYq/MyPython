%% ʹ��KNN�㷨����˷�������
clear
load('Data.mat');

%% ���ݴ����֣����ܣ�Data0�е�90%��ΪData0_source��10%��ΪData0-target��Data1����
temp1=rand(1,2924); 
[~,index1]=sort(temp1);
temp2=rand(1,2376); 
[~,index2]=sort(temp2);
Data0target=Data_0(index1(1:291),:);
Data0Source=Data_0(index1(292:2924),:);
Data1target=Data_1(index2(1:237),:);
Data1Source=Data_1(index2(238:2376),:);

source=[Data0Source;Data1Source];%ƴ�ӳ�һ��source�ļ�

%% ��һ������
Data0target=MyNorm(Data0target);
Data1target=MyNorm(Data1target);
source=MyNorm(source);


bingo0=zeros(1,60);%���ڼ�¼k��ͬʱ��ÿ�εĳɹ�����
bingo1=zeros(1,60);

%% �������,����ÿһ���ķ��������Դ洢

for k=1:100%ʹ�ý�����֤��K�ĸ�����Ҫ�������ҵ�һ�������õ�ʱ��  ����ʵ��������ѡ��k1,2,3�����ԣ�
    for i=1:size(Data0target,1)
           neariset0(i)=dist(source,Data0target(i,:),k);
    end

    for i=1:size(Data1target,1)
          neariset1(i)=dist(source,Data1target(i,:),k);
    end




%% ������ȷ�� 

    count0=0;
    count1=0;
	for i=1:length(neariset0)
		if neariset0(i)== -1
			count0=count0+1;		
		end
		bingo0(k)=count0/length(neariset0);% Ԥ��1�ĳɹ���
	end
	
	for i= 1:length(neariset1)
		if neariset1(i)==1
			count1=count1+1;
		end
		bingo1(k)=count1/length(neariset1);
	end

end

%�ҵ���Ԥ��Ч����á��ı�׼�����Ƕ��������Ԥ��ɹ��ʵĺ�����±���γ������Ҫ�ҵ��Ǹ������õ�k,���k����index
for i=1:length(bingo0)
	bingo(i)=bingo0(i)+bingo1(i);
end
[~,index]=max(bingo);
index
bingo0(index)
bingo1(index)