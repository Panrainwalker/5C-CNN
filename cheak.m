clear;clc;close all;

load('DATA.mat','DATA');
load('labels.mat','labels');
load('noises.mat');

% load('DATA_test.mat');
% load('labels_test.mat');
% DATA=DATA_test;
% labels=labels_test;

%% ��һ��

[D] = normalize(DATA);
DATA=D;


%% ��������¼�
cheakevent(DATA,labels,1,1,0,1);
 

%% �޸ı�ǩ
find(labels==3);
n=input('��Ҫ���ڼ����¼���=');
DATA1=DATA(:,:,n);

plot_microseismic(DATA1,12);

label=labels(n)

p=input('����¼����ǩ�Ե����𡾴���0/��ȷ1��');
if p==0
    
    pp=input('��Ҫ�޸ı�ǩ�𡾲�Ҫ0/Ҫ1��');
    if pp==0
        ppp=input('��Ҫ��������¼��𡾲�Ҫ0/Ҫ1��');
        if ppp==1
            
            DATA(:,:,n)=[];
            labels(n)=[];
        end
    end
    if pp==1
        label=input('��Ҫ�޸ı�ǩΪ');
        labels(n)=label;
    end
end
%%
save('DATA.mat','DATA');
save('labels.mat','labels');


close all;



%%



