function [ANS]=AN1(DATA,labels,noises,a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add noise
% Data augment
% created by pyx
% 2022.6.20
% aΪ��Ҫ����������¼����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% import data
% clc;clear;
% load('noises.mat');
% load('DATA.mat','DATA');
% 
% DATA(:,:,1)=[];
% % noises
%% data-normalized
% n=size(DATA,3);%������
% c=size(DATA,2);%36
% r=size(DATA,1);%1001
% for ii=1:n
%     dataa=DATA(:,:,ii);
%     
%     for i=1:3%������ֱ������
%         k=1;
%         for iiii=1:12
%             DATAnorm(:,k,i)=dataa(:,i+(iiii-1)*3);
%             k=k+1;
%         end
%     end
%     
%     k=1;
%     for a=1:3%3�����ֱ�����ֵ
%         Max(k)=max(max(DATAnorm(:,:,a)));
%         k=k+1;
%     end
%     
%     for b=1:3%3������һ��
%         DATAmax(:,:,b,ii)=DATAnorm(:,:,b)./Max(b);
%     end
%     
%     
%     
%     
%     
%     k=1;
%     for bb=1:12 %3�������36
%         for aaa=1:3
%             D(:,k,ii)=DATAmax(:,bb,aaa,ii);
%             k=k+1;
%         end
%     end
% end
% 
% DATA=D;%��һ��
% %% noises-normalized
% n=size(noises,3);%������
% c=size(noises,2);%36
% r=size(noises,1);%1001
% 
% for ii=1:n
%     dataa=noises(:,:,ii);
%     
%     for i=1:3%������ֱ������
%         k=1;
%         for iiii=1:12
%             DATAnorm(:,k,i)=dataa(:,i+(iiii-1)*3);
%             k=k+1;
%         end
%     end
%     
%     k=1;
%     for a=1:3%3�����ֱ�����ֵ
%         Max(k)=max(max(DATAnorm(:,:,a)));
%         k=k+1;
%     end
%     
%     for b=1:3%3������һ��
%         DATAmax(:,:,b,ii)=DATAnorm(:,:,b)./Max(b);
%     end
%     
%     
%     
%     
%     
%     k=1;
%     for bb=1:12 %3�������36
%         for aaa=1:3
%             D(:,k,ii)=DATAmax(:,bb,aaa,ii);
%             k=k+1;
%         end
%     end
% end
% 
% noises=D;%��һ��



%% add noise
f=find(labels==a);
DATA=DATA(:,:,f);

n=size(DATA,3);%�ź�������
nn=size(noises,3);%����������
for ii=1:n
    r=randi([1 nn]);%���ѡ��һ������
    SNR= 2 + (4-2)*rand(1,1); %choose the SNR (range from 4 to 2)
    N=noises(:,:,r)./SNR;
    ANS(:,:,ii)=N+DATA(:,:,ii);
end
[ANS] = normalize(ANS);

%  save('ANS.mat','ANS');
end











