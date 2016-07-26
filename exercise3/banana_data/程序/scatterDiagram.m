%% 本程序用于绘制散点图
scatter(getcolumn(Data_0(:,1:2),1),getcolumn(Data_0(:,1:2),2))
hold on
scatter(getcolumn(Data_1(:,1:2),1),getcolumn(Data_1(:,1:2),2))
legend('Data -1','Data +1')