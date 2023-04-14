clear;clc;close all;
load('noises.mat');
load('DATA.mat','DATA');
load('labels.mat','labels');
load('px1.mat');
load('px2.mat');
load('sx1.mat');
load('sx3.mat');
%% 归一化
[D] = normalize(DATA);
DATA=D;
[D] = normalize(noises);
noises=D;

%% 数据增广 先对C2

%% 反转检波器
DATArro=RRO(DATA); %反转检波器
DATA=cat(3,DATArro,DATA);
labels=cat(2,labels,labels);
px1=cat(3,px1,px1);
sx1=cat(3,sx1,sx1);
%% 添加噪声对2
for i=1:2
DATAn=AN(DATA,labels,noises,2);% Add noise for class 2
labelsps=zeros(1,size(DATAn,3))+2;
labels=cat(2,labels,labelsps);
DATA=cat(3,DATA,DATAn);
px1=cat(3,px1,px1);
sx1=cat(3,sx1,sx1);
end

%% 移动PS波
for i=1:2
[datan1,px1n,sx1n] = MPSP1(DATA,labels,sx1,px1);
DATA(:,:,size(DATA,3)+1:size(DATA,3)+size(datan1,3) )=datan1;
labelsps=zeros(1,size(datan1,3))+1;
labels=cat(2,labels,labelsps);
px1=cat(3,px1,px1n);
sx1=cat(3,sx1,sx1n);
end
%% 增大P波振幅(针对事件2）
[data]=ATP(DATA,labels,sx1,px1);
DATA(:,:,size(DATA,3)+1:size(DATA,3)+size(data,3) )=data;
labelsps=zeros(1,size(data,3))+1;
labels=cat(2,labels,labelsps);
px1=cat(3,px1,px1);
sx1=cat(3,sx1,sx1);



%% 截取C2事件(针对c3）
[datan2] = TC2_3E(DATA,labels,sx1,px1,300);
DATA(:,:,size(DATA,3)+1:size(DATA,3)+size(datan2,3) )=datan2;
labelsps=zeros(1,size(datan2,3))+2;
labels=cat(2,labels,labelsps);



for i=1:1
DATAn=AN(DATA,labels,noises,2);% Add noise for c3
labelsps=zeros(1,size(DATAn,3))+2;
labels=cat(2,labels,labelsps);
DATA=cat(3,DATA,DATAn);
end
%% 截取C2事件(针对c4）
[datan3] = TC2_4E(DATA,labels,sx1,px1,300);
DATA(:,:,size(DATA,3)+1:size(DATA,3)+size(datan3,3) )=datan3;
labelsps=zeros(1,size(datan3,3))+3;
labels=cat(2,labels,labelsps);

for i=1:1
DATAn=AN(DATA,labels,noises,3);% Add noise for c4
labelsps=zeros(1,size(DATAn,3))+3;
labels=cat(2,labels,labelsps);
DATA=cat(3,DATA,DATAn);
end

%% 造事件4
N=180*1.5;
[data] = CE4(DATA,labels,px1,sx1,px2,sx3,N);
DATA(:,:,size(DATA,3)+1:size(DATA,3)+size(data,3) )=data;
labelsps=zeros(1,size(data,3))+4;
labels=cat(2,labels,labelsps);

for i=1:1
DATAn=AN(DATA,labels,noises,4);% Add noise for class 4
labelsps=zeros(1,size(DATAn,3))+4;
labels=cat(2,labels,labelsps);
DATA=cat(3,DATA,DATAn);
end
%% 旋转分量
% labelsrc=labels;
% for ii=1:1 % Rotate the components
%     %     phi= 1 + (360-0)*rand(1,1); %range from 1 to 360
%     %     theta=1 + (360-0)*rand(1,1); %range from 1 to 360
%     %     var=1 + (360-0)*rand(1,1); %range from 1 to 360
%     rc=RC(DATA); %
%     if ii==1
%         DATArc=DATA;
%     end
%     DATArc(:,:,size(DATArc,3)+1:size(DATArc,3)+size(DATA,3) )=rc;
%     labels=cat(2,labels,labelsrc);
%     px1=cat(3,px1,px1);
%     sx1=cat(3,sx1,sx1);
%     px2=cat(3,px2,px2);
%     sx3=cat(3,sx3,sx3);
% end
% DATA=DATArc;


%% 添加噪声
for i=1:5
DATAn=AN(DATA,labels,noises,0);% Add noise for class 0
labelsps=zeros(1,size(DATAn,3));
labels=cat(2,labels,labelsps);
DATA=cat(3,DATA,DATAn);
end


%% 反转检波器
% DATArro=RRO(DATA); %反转检波器
% DATA=cat(3,DATArro,DATA);
% labels=cat(2,labels,labels);
%%  全部一起储存
% DATAd=DATA;
% labelsd=labels;
% save('DATAd.mat','DATAd');
% save('labelsd.mat','labelsd');
%%  分开储存
labelsd=labels;
S=size(DATA,3);

DATAd1=DATA(:,:,1:round(S/5));
DATAd2=DATA(:,:,round(S/5)+1:2*round(S/5));
DATAd3=DATA(:,:,2*round(S/5)+1:3*round(S/5));
DATAd4=DATA(:,:,3*round(S/5)+1:4*round(S/5));
DATAd5=DATA(:,:,4*round(S/5)+1:end);


save('DATAd1.mat','DATAd1');
save('DATAd2.mat','DATAd2');
save('DATAd3.mat','DATAd3');
save('DATAd4.mat','DATAd4');
save('DATAd5.mat','DATAd5');

save('labelsd.mat','labelsd');










