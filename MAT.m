function [x] = MAT(DATA,labels,n,a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MAT mark arrival time
% created by pyx
% 2023.1.6
% 可对12道三分量检波器的到时进行标记
%  x 为提取的到时的横坐标
%  n 为需要提取的事件类别
%  a 为需要提取的第a个事件
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=find(labels==n);
data1=DATA(:,:,f);

% f=find(labels==2);
% data2=DATA(:,:,f);
% 
% f=find(labels==3);
% data3=DATA(:,:,f);
% 
% f=find(labels==4);
% data4=DATA(:,:,f);

%% 提取事件1的P和S波到时
% a = 7 ;    %检查的事件是第a个
plot_microseismic(data1(:,:,a),12);
for i=1:12%12道的循环

    for ii=1:100%预防输错的循环
        hold on
        y=input('(1-12),输入P or S波到时的y值=');
        x=input('(1-1001),输入P or S波到时的x值=');

%         plot(x,y*2,'mo','MarkerSize',10);
        plot(x,y*2,'mo','MarkerSize',10,'Markerfacecolor','m');

        t=input('确定是这个点吗,请输入【错误0/正确1】');
        if t==1
            p(1+(i-1)*3:3+(i-1)*3)=x;
            break;

        else
            x=[];
            y=[];
        end

    end
end
close all;

x=p;

end

