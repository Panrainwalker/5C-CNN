clear;clc;close all;
% 
load('DATAd1.mat','DATAd1');
load('DATAd2.mat','DATAd2');
load('DATAd3.mat','DATAd3');
load('DATAd4.mat','DATAd4');
load('DATAd5.mat','DATAd5');
load('labelsd.mat','labelsd');



%%
% DATA=DATAd;
% 将三个数组沿着第三个维度拼接
DATA = cat(3, DATAd1,DATAd2,DATAd3,DATAd4,DATAd5);
labels=labelsd;
[DATA] = normalize(DATA);

% % 
% load('DATAt.mat');
% load('labelst.mat');
% DATA=DATAdt;
% labels=labelsdt;

% (1001,36,n)--->(n,12,1001,3)
n=size(DATA,3);%样本数
t=zeros(1001,12);
tt=zeros(1001,12,3);
for ii=1:n
    for i=1:3
        for j=1:12
            t(:,j)=DATA(:,3*j-3+i,ii);
        end
        tt(:,:,i)=t;
    end
    ttt(:,:,:,ii)=tt;
end

%(1001,12,3,n)--->(n,12,1001,3)
d=zeros(n,12,1001,3);
p=zeros(12,1001,3);
pp=zeros(1001,3);
for i=1:n
    for ii=1:12
        %         for iii=1:3
        %             pp(:,iii)=ppp;%ppp (1001)
        %         end
        pp=ttt(:,ii,:,i);
        pp0=reshape(pp,[1001,3]);
        p(ii,:,:)=pp;% pp(1001,3)
    end
    d(i,:,:,:)=p; %p (12,1001,3)
    
end





%%

label0=find(labels==0);
label1=find(labels==1);
label2=find(labels==2);
label3=find(labels==3);
label4=find(labels==4);
k=0;
dd=zeros(n,12,1001,3);
for i=1:length(label0)
    k=k+1;
    dd(k,:,:,:)=d(label0(i),:,:,:);
    
end
l1=k;
for i=1:length(label1)
    k=k+1;
    dd(k,:,:,:)=d(label1(i),:,:,:);
end
l2=k-l1;
for i=1:length(label2)
    k=k+1;
    dd(k,:,:,:)=d(label2(i),:,:,:);
    
end
l3=k-l2-l1;
for i=1:length(label3)
    k=k+1;
    dd(k,:,:,:)=d(label3(i),:,:,:);
    
end
l4=k-l3-l2-l1;


for i=1:length(label4)
    k=k+1;
    dd(k,:,:,:)=d(label4(i),:,:,:);
    
end
l5=k-l4-l3-l2-l1;

%% 算位置
% location=450;  % 位置
% sort=4;  %类别【0,1,2,3,4】
% 
% if sort==4
%     S=l1+l2+l3+l4;
% elseif sort==3
%     S=l1+l2+l3;
% elseif sort ==2
%     S=l1+l2;
% elseif sort == 1
%     S=l1;
% elseif sort == 0
%     S=1;
% end
% 
% L=label4(location-S+1);


%% 全部一起储存
%
%  DATApy=dd;
% %%%DATApy(1,:,:,:)=[];%无需减1 因为增广的时候就减了
% 
% save('DATApy.mat','DATApy');



%% 分开储存
DATApy=dd;
S=size(DATA,3);
DATApy1=DATApy(1:round(S/5),:,:,:);
DATApy2=DATApy(round(S/5)+1:2*round(S/5),:,:,:);
DATApy3=DATApy(2*round(S/5)+1:3*round(S/5),:,:,:);
DATApy4=DATApy(3*round(S/5)+1:4*round(S/5),:,:,:);
DATApy5=DATApy(4*round(S/5)+1:end,:,:,:);

save('DATApy1.mat','DATApy1');
save('DATApy2.mat','DATApy2');
save('DATApy3.mat','DATApy3');
save('DATApy4.mat','DATApy4');
save('DATApy5.mat','DATApy5');
%  L=[l1 l2 l3 l4 l5]


