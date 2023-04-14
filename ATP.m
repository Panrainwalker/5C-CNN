function [Dm] = ATP(DATA,labels,sx1,px1)
%Adjust the P amplitude
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data augment
% created by pyx
% 2023.2.18
% 针对事件1进行数据增广(Adjust the P amplitude)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
label1=find(labels==1);
data=DATA(:,:,label1);
for i=1:length(label1)
    Dm(:,:,i)=data(:,:,i);
    ratio=1.2+0.6*rand(1,1); %range from 1.2to 1.8
    for ii=1:36
    Dm(px1(:,ii,i):sx1(:,ii,i),ii,i)=ratio.*data(px1(:,ii,i):sx1(:,ii,i),ii,i);
    end
end
end

