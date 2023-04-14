clear;clc;close all;

load('DATA.mat','DATA');
load('labels.mat','labels');
load('noises.mat');

% load('DATA_test.mat');
% load('labels_test.mat');
% DATA=DATA_test;
% labels=labels_test;

%% 归一化

[D] = normalize(DATA);
DATA=D;


%% 检查总体事件
cheakevent(DATA,labels,1,1,0,1);
 

%% 修改标签
find(labels==3);
n=input('你要检查第几个事件呢=');
DATA1=DATA(:,:,n);

plot_microseismic(DATA1,12);

label=labels(n)

p=input('这个事件与标签对的上吗【错误0/正确1】');
if p==0
    
    pp=input('你要修改标签吗【不要0/要1】');
    if pp==0
        ppp=input('你要丢弃这个事件吗【不要0/要1】');
        if ppp==1
            
            DATA(:,:,n)=[];
            labels(n)=[];
        end
    end
    if pp==1
        label=input('你要修改标签为');
        labels(n)=label;
    end
end
%%
save('DATA.mat','DATA');
save('labels.mat','labels');


close all;



%%



