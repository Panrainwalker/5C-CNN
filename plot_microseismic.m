function  plot_microseismic(DATA,n)
% Version 2022.12.31
%PLOTMICROSEIS 
%���Ի���΢�����¼�
%�������������Ϊ n����3������������

[DATA] = normalize(DATA);
DATA_max = 0;
DATA_max = max(DATA_max,max(DATA(:,:)));
for i=1:n   %��i��Ϊ�˷���12�������������
    plot(DATA(:,3*i-2)+2*i,'r');%����1
    hold on;
    plot(DATA(:,3*i-1)+2*i,'b');%����2
    hold on;
    plot(DATA(:,3*i)+2*i,'g');%����3
    hold on
end

set(gca,'YDir','reverse');

set(gca,'Ytick',[0:2:24]);
set(gca,'Yticklabels',[0:1:12]);
set(gca,'xtick',[0:1:1001]);

end

