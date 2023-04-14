function  plot_microseismic(DATA,n)
% Version 2022.12.31
%PLOTMICROSEIS 
%可以画出微地震事件
%输入的数据类型为 n道的3分量地震数据

[DATA] = normalize(DATA);
DATA_max = 0;
DATA_max = max(DATA_max,max(DATA(:,:)));
for i=1:n   %加i是为了分离12个地震道的数据
    plot(DATA(:,3*i-2)+2*i,'r');%分量1
    hold on;
    plot(DATA(:,3*i-1)+2*i,'b');%分量2
    hold on;
    plot(DATA(:,3*i)+2*i,'g');%分量3
    hold on
end

set(gca,'YDir','reverse');

set(gca,'Ytick',[0:2:24]);
set(gca,'Yticklabels',[0:1:12]);
set(gca,'xtick',[0:1:1001]);

end

