%% 使用KNN算法解决此分类问题
clear
load('Data.mat');

%% 数据处理部分，功能：Data0中的90%作为Data0_source，10%作为Data0-target。Data1类似
temp1=rand(1,2924); 
[~,index1]=sort(temp1);
temp2=rand(1,2376); 
[~,index2]=sort(temp2);
Data0target=Data_0(index1(1:291),:);
Data0Source=Data_0(index1(292:2924),:);
Data1target=Data_1(index2(1:237),:);
Data1Source=Data_1(index2(238:2376),:);

source=[Data0Source;Data1Source];%拼接成一个source文件

%% 归一化数据
Data0target=MyNorm(Data0target);
Data1target=MyNorm(Data1target);
source=MyNorm(source);


bingo0=zeros(1,60);%用于记录k不同时，每次的成功概率
bingo1=zeros(1,60);

%% 计算距离,并将每一条的分类结果加以存储

for k=1:100%使用交叉验证，K的个数需要遍历，找到一个情况最好的时候  经过实践表明，选择k1,2,3就足以！
    for i=1:size(Data0target,1)
           neariset0(i)=dist(source,Data0target(i,:),k);
    end

    for i=1:size(Data1target,1)
          neariset1(i)=dist(source,Data1target(i,:),k);
    end




%% 计算正确度 

    count0=0;
    count1=0;
	for i=1:length(neariset0)
		if neariset0(i)== -1
			count0=count0+1;		
		end
		bingo0(k)=count0/length(neariset0);% 预测1的成功率
	end
	
	for i= 1:length(neariset1)
		if neariset1(i)==1
			count1=count1+1;
		end
		bingo1(k)=count1/length(neariset1);
	end

end

%找到“预测效果最好”的标准，就是对这两类的预测成功率的和最大下边这段程序就是要找到那个情况最好的k,这个k就是index
for i=1:length(bingo0)
	bingo(i)=bingo0(i)+bingo1(i);
end
[~,index]=max(bingo);
index
bingo0(index)
bingo1(index)